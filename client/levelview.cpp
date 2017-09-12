#include "levelview.h"
#include "ui_levelView.h"
#include <math.h>

LevelView::LevelView(QWidget *parent):
    QMainWindow(parent),
    ui(new Ui::LevelView)
{
    ui->setupUi(this);

    //default settings
    level = 1;
    type = easy;
    timerPtr = new Timer();

    //initialize values
    for (int i = 0; i < 9; i++)
    {
        values[i] = 0;
        bits[i] = 0;
    }

    //Add labels to array
    bitLabels[1] = ui->place1;
    bitLabels[2] = ui->place2;
    bitLabels[3] = ui->place4;
    bitLabels[4] = ui->place8;
    bitLabels[5] = ui->place16;
    bitLabels[6] = ui->place32;
    bitLabels[7] = ui->place64;
    bitLabels[8] = ui->place128;

    //setup slots and signals
    connect(ui->graphicsView, SIGNAL(updateContactToLevelView(int, int, bool)) , this, SLOT(changeBits(int, int, bool)));
    connect (this, SIGNAL(clickedBits(int,bool)), this, SLOT(updateBits(int,bool)));
    connect (this, SIGNAL(clickedBits(int, int, bool)), this, SLOT(updateBits(int,int,bool)));
    connect(timerPtr, SIGNAL(updateTime(int)),this, SLOT(updateTime(int)));
    connect(timerPtr, SIGNAL(stopRound()), this, SLOT(stopRound()));
    connect (ui->endGameButton, SIGNAL(clicked()), this, SLOT(stopGame()));
}

LevelView::~LevelView()
{
    delete ui;
    delete timerPtr;
    timerPtr = nullptr;
}

/*Clears the bit values and sets all bits and values back to 0*/
void::LevelView::clear()
{
    //default settings
    level = 1;
    type = easy;

    updateScore(0);

    //initialize values
    for (int i = 1; i < 9; i++)
    {
        values[i] = 0;
        bits[i] = 0;
    }

    for (int i = 1; i < 9; i++)
    {
        updateBitLabel(i, false);
    }

    QString value = QString::number(0);
    ui->one->setText(value);
    ui->two->setText(value);
    ui->four->setText(value);
    ui->eight->setText(value);
    ui->sixteen->setText(value);
    ui->thirtytwo->setText(value);
    ui->sixtyfour->setText(value);
    ui->onetwentyeight->setText(value);
    ui->answer->setText(value);
}

/* Sets the answer (the number the user is working on) to the number given*/
void LevelView::setAnswer(int num)
{
    answer = num;
    QString text = QString::number(num);
    ui->decimalNumber->setText(text);
}

/* Updates the GUI appropriately for the level and type.
 * Easy level has four bits, medium level has 6 bits and hard level has 8.
 * Level 1 is binary, Level 2 is two's complement, Level 3 is hexadecimal*/
void LevelView::updateLevel(int gameLevel, Type gameType, bool existingGame)
{
    level = gameLevel;
    type = gameType;

    if (type == easy || type == medium)
    {
        ui->place64->hide();
        ui->place128->hide();
        ui->sixtyfour->hide();
        ui->onetwentyeight->hide();
        ui->plus6->hide();
        ui->plus7->hide();
    }

    if (type == easy)
    {
        ui->place16->hide();
        ui->place32->hide();
        ui->sixteen->hide();
        ui->thirtytwo->hide();
        ui->plus4->hide();
        ui->plus5->hide();
    }

    if (type == medium || type == hard)
    {
        ui->place16->show();
        ui->place32->show();
        ui->sixteen->show();
        ui->thirtytwo->show();
        ui->plus4->show();
        ui->plus5->show();
    }

    if (type == hard)
    {
        ui->place64->show();
        ui->place128->show();
        ui->sixtyfour->show();
        ui->onetwentyeight->show();
        ui->plus6->show();
        ui->plus7->show();
    }

    if (level == 1)
        ui->levelLabel->setText("Binary");
    if  (level == 2)
        ui->levelLabel->setText("Two's complement");
    if (level == 3)
        ui->levelLabel->setText("Hexadecimal");
    ui->graphicsView->setupLevel(level, type, existingGame);
}

/* Starts the timer in the game*/
void LevelView::startTimer()
{
    timerPtr->startTime();
}

/* Updates the time shown on the clock*/
void LevelView::updateTime(int time)
{
    int minutes = time / 60000;
    QString min = QString("%1").arg(minutes, 2, 10, QChar('0'));
    int seconds = (time / 1000) % 60;
    QString sec = QString("%1").arg(seconds, 2, 10, QChar('0'));
    ui->seconds->display(sec);
    ui->minutes->display(min);
}

/* Toggles the values shown in the bit labels between 0 and 1*/
void LevelView::updateBits(int place, bool on)
{
    if (level != 3)
    {
        if (on)
            bits[place] = 1;
        else
        {
            bits[place] = 0;
        }
    }
    updateValues();
}

/* Updates the bit values stored based on the given hex value*/
void LevelView::updateBits(int place, int hexVal, bool on)
{
    if (place == 1)
    {
        std::vector<int> results = convertToBinary(hexVal);
        for (int i = 0, k = 4; i < 4, k > 0; i++, k--)
        {
            if(on)
                bits[k] = results[i];

            else
                bits[k] = 0;

            if(bits[k] == 0)
                updateBitLabel(k, false);
            else
                updateBitLabel(k, true);
        }
    }

    else if (place == 2)
    {
        std::vector<int> results = convertToBinary(hexVal);
        for (int i = 0, k = 8; i < 4, k > 4; i++, k--)
        {
            if(on)
                bits[k] = results[i];
            else
               bits[k] = 0;

            if(bits[k] == 0)
                updateBitLabel(k, false);
            else
                updateBitLabel(k, true);
        }
    }
    updateValues();
}

/* Updates the decimal value shown below the bit labels when the bit label is toggled*/
void LevelView::updateValues()
{
    int length;
    if (type == easy)
        length = 4;
    else if (type == medium)
        length = 6;
    else
        length = 8;

    for (int i = 1; i <=length; i++)
    {
        values[i] = bits[i] * pow(2, i-1);
    }

    if (level == 2)
    {
        values[length] = bits[length] * -1 * pow(2,length-1);
    }

    QString value;
    value = QString::number(values[1]);
    ui->one->setText(value);
    value = QString::number(values[2]);
    ui->two->setText(value);
    value = QString::number(values[3]);
    ui->four->setText(value);
    value = QString::number(values[4]);
    ui->eight->setText(value);

    if (type != easy)
    {
        value = QString::number(values[5]);
        ui->sixteen->setText(value);
        value = QString::number(values[6]);
        ui->thirtytwo->setText(value);
    }

    if (type == hard)
    {
        value = QString::number(values[7]);
        ui->sixtyfour->setText(value);
        value = QString::number(values[8]);
        ui->onetwentyeight->setText(value);
    }

    //calculate total value and update label
    int total = 0;
    for (int i = 1; i <=8; i++)
    {
        total += values[i];
    }
    QString qtotal = QString::number(total);
    ui->answer->setText(qtotal);

    //check if answer matches the problem number
    if (total == answer && total != 0)
    {
        emit finishedRound(timerPtr->returnCurrentTime());
        timerPtr->stopTime();
    }
}

/* Returns the binary value of the hex value given*/
std::vector<int> LevelView::convertToBinary(int c)
{
    switch(c)
    {
       case 0: return {0,0,0,0};
       case 1: return {0,0,0,1};
       case 2: return {0,0,1,0};
       case 3: return {0,0,1,1};
       case 4: return {0,1,0,0};
       case 5: return {0,1,0,1};
       case 6: return {0,1,1,0};
       case 7: return {0,1,1,1};
       case 8: return {1,0,0,0};
       case 9: return {1,0,0,1};
       case 10: return {1,0,1,0};
       case 11: return {1,0,1,1};
       case 12: return {1,1,0,0};
       case 13: return {1,1,0,1};
       case 14: return {1,1,1,0};
       case 15: return {1,1,1,1};
    default:
        return {0,0,0,0};
    }
}

/* Changes the appropriate bit value.
 * The place number and the hex number are given as parameters*/
void::LevelView::changeBits(int cupBitNum, int ballBitHexNum, bool isActive)
{
    if (level == 3)
    {
        // Call overloaded method
        updateBits(cupBitNum, ballBitHexNum, isActive);
    }
    else
    {
        updateBits(cupBitNum, isActive);
        updateBitLabel(cupBitNum, isActive);
    }
}

/* Toggles the appropriate bit label between 0 and 1 based on the parameters given*/
void::LevelView::updateBitLabel(int index, bool on)
{
    if(on)
        bitLabels[index]->setText("1");
    else
        bitLabels[index]->setText("0");
}

/* Displays the updated score*/
void::LevelView::updateScore(int score)
{
    ui->score->display(score);
}

/* Game timed out.*/
void::LevelView::stopRound()
{
    this->close();
    emit timedOut();
}

/* User pushed button to stop game*/
void::LevelView::stopGame()
{
    emit quitGame();
}
