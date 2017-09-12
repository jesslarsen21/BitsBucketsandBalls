#-------------------------------------------------
#
# Project created by QtCreator 2016-11-20T13:24:05
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = BitsBucketsAndBalls
TEMPLATE = app


SOURCES += main.cpp\
        startdialog.cpp \
    gameclient.cpp \
    clientcontroller.cpp \
    qclickablelabel.cpp \
    round.cpp \
    levelselector.cpp \
    continuedialog.cpp \
    timer.cpp \
    levelview.cpp \
    gameoverdialog.cpp \
    report.cpp \
    jgraphicsview.cpp \
    teacherdialog.cpp \
    worldsim.cpp

HEADERS  += startdialog.h \
    gameclient.h \
    clientcontroller.h \
    qclickablelabel.h \
    round.h \
    levelselector.h \
    continuedialog.h \
    timer.h \
    levelview.h \
    gameoverdialog.h \
    report.h \
    jgraphicsview.h \
    teacherdialog.h \
    worldsim.h \
    bodydata.h

FORMS    += startdialog.ui \
    levelselector.ui \
    continuedialog.ui \
    levelView.ui \
    gameover.ui \
    teacherdialog.ui


win32{
    message(Building for Windows)
    LIBS += -L$$PWD/../../SFML-2.4.1-windows-vc14-64-bit/SFML-2.4.1/lib/ -lsfml-audio -lsfml-graphics -lsfml-system -lsfml-network -lsfml-window
    INCLUDEPATH += $$PWD/../../SFML-2.4.1-windows-vc14-64-bit/SFML-2.4.1/include
    DEPENDPATH += $$PWD/../../SFML-2.4.1-windows-vc14-64-bit/SFML-2.4.1/include
    CONFIG(debug, debug|release): LIBS += -L$$PWD/../../Box2D-master/Box2D-master/Box2D/Build/vs2015/bin/x32/debug/ -lBox2D
} else: unix {
    message(Building for Unix)
    LIBS += -L/usr/local/lib/ -lsfml-graphics -lsfml-system -lsfml-network -lsfml-window
    INCLUDEPATH += "/usr/local/include"
    DEPENDPATH  += "/usr/local/include"

    CONFIG += c++11

    message("Unknown configuration")
}


win32:

INCLUDEPATH += $$PWD/../../Box2D-master/Box2D-master/Box2D/Box2D
DEPENDPATH += $$PWD/../../Box2D-master/Box2D-master/Box2D/Box2D

unix:!macx: LIBS += -L$$PWD/../libraries/linux/ -lBox2D

INCLUDEPATH += $$PWD/../libraries/linux
DEPENDPATH += $$PWD/../libraries/linux

unix:!macx: PRE_TARGETDEPS += $$PWD/../libraries/linux/libBox2D.a


macx: LIBS += -L$$PWD/../libraries/mac/ -lBox2D

INCLUDEPATH += $$PWD/../include
DEPENDPATH += $$PWD/../include

macx: PRE_TARGETDEPS += $$PWD/../libraries/mac/libBox2D.a

#Add any resources here
APP_QML_FILES.files += ../resources/Ball.png
APP_QML_FILES.files += ../resources/BigBucket.png
APP_QML_FILES.files += ../resources/Brick.png
APP_QML_FILES.files += ../resources/Bucket.png
APP_QML_FILES.files += ../resources/BucketFlag.png
APP_QML_FILES.files += ../resources/Firewall.png
APP_QML_FILES.files += ../resources/lasergun.png
APP_QML_FILES.files += ../resources/LaserGun0.png
APP_QML_FILES.files += ../resources/LaserGun25.png
APP_QML_FILES.files += ../resources/LaserGun50.png
APP_QML_FILES.files += ../resources/LaserGun75.png
APP_QML_FILES.files += ../resources/MetalBrick.png
APP_QML_FILES.files += ../resources/MetalBrick2.png
APP_QML_FILES.files += ../resources/MetalBrick3.png
APP_QML_FILES.files += ../resources/Star2.png

#APP_QML_FILES.files += ../resources/1.png

APP_QML_FILES.files += ../resources/B1.png
APP_QML_FILES.files += ../resources/B2.png
APP_QML_FILES.files += ../resources/B3.png
APP_QML_FILES.files += ../resources/B4.png
APP_QML_FILES.files += ../resources/B5.png
APP_QML_FILES.files += ../resources/B6.png
APP_QML_FILES.files += ../resources/B7.png
APP_QML_FILES.files += ../resources/B8.png
APP_QML_FILES.files += ../resources/B9.png
APP_QML_FILES.files += ../resources/B10.png
APP_QML_FILES.files += ../resources/B11.png
APP_QML_FILES.files += ../resources/B12.png
APP_QML_FILES.files += ../resources/B13.png
APP_QML_FILES.files += ../resources/B14.png
APP_QML_FILES.files += ../resources/B15.png
APP_QML_FILES.files += ../resources/hex0.png
APP_QML_FILES.files += ../resources/hex1.png
APP_QML_FILES.files += ../resources/hex2.png
APP_QML_FILES.files += ../resources/hex3.png
APP_QML_FILES.files += ../resources/hex4.png
APP_QML_FILES.files += ../resources/hex5.png
APP_QML_FILES.files += ../resources/hex6.png
APP_QML_FILES.files += ../resources/hex7.png
APP_QML_FILES.files += ../resources/hex8.png
APP_QML_FILES.files += ../resources/hex9.png
APP_QML_FILES.files += ../resources/hexA.png
APP_QML_FILES.files += ../resources/hexB.png
APP_QML_FILES.files += ../resources/hexC.png
APP_QML_FILES.files += ../resources/hexD.png
APP_QML_FILES.files += ../resources/hexE.png
APP_QML_FILES.files += ../resources/hexF.png
APP_QML_FILES.path = Contents/Resources
QMAKE_BUNDLE_DATA += APP_QML_FILES


