#ifndef LEVELONE_H
#define LEVELONE_H

#include <QMainWindow>
#include <QLabel>
#include <QPushButton>
#include <qclickablelabel.h>
#include <timer.h>
#include <jgraphicsview.h>

namespace Ui {
class LevelView;
}

//enum Type {easy, medium, hard};

class LevelView : public QMainWindow
{
    Q_OBJECT

public:
    explicit LevelView(QWidget *parent = 0);
    ~LevelView();
    void setAnswer(int);
    void updateScore(int);
    void updateLevel(int, Type, bool);
    void startTimer();
    void clear();

public slots:
    void updateTime(int);
    void updateBits(int, bool);
    void updateBits(int, int, bool);
    void stopRound();
    void changeBits(int, int, bool);
    void stopGame();

signals:
    void clickedBits(int, bool);
    void clickedBits (int, int, bool);
    void finishedRound(int);
    void timedOut();
    void quitGame();


private:
    Ui::LevelView *ui;
    Type type;
    int level;
    QLabel* bitLabels[9];
    int bits[9];
    int values[9];
    int answer;
    bool ball1, ball2, ball4, ball8, ball16, ball32, ball64, ball128, hex1, hex2;
    Timer* timerPtr;

    std::vector<int> convertToBinary(int c);
    void updateValues();
    void updateBitLabel(int, bool);
};

#endif // LEVELONE_H
