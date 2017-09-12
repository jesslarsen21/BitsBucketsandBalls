QT += core
QT -= gui

CONFIG += c++11

TARGET = GameServer
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

HEADERS += \
    server.h \
    sqlinterface.h \
    teacher.h

SOURCES += main.cpp \
    server.cpp \
    sqlinterface.cpp \
    teacher.cpp



win32{
    message(Building for Windows)

    LIBS += -L$$PWD/../../../SFML_2/SFML-2.4.1/lib/ -lsfml-system -lsfml-network
    LIBS += -L$$PWD/../../../MySQL/MySQL_Server_5.7/lib/ -lmysqlclient
    INCLUDEPATH += $$PWD/../../../SFML_2/SFML-2.4.1/include
    INCLUDEPATH += $$PWD/../../../MySQL/MySQL_Server_5.7/include
    DEPENDPATH += $$PWD/../../../SFML_2/SFML-2.4.1/include
    DEPENDPATH += $$PWD/../../../MySQL/MySQL_Server_5.7/include
    message(Done Building for Windows)


} else: unix {
    message(Building for Unix)
    LIBS += -L/usr/local/lib/ -lsfml-system -lsfml-network -lmysqlclient -lm -lz
    INCLUDEPATH += "/usr/local/include"
    INCLUDEPATH += "/usr/local/include/mysql"
    DEPENDPATH  += "/usr/local/include"
    DEPENDPATH  += "/usr/local/include/mysql"

} else {
    message("Unknown configuration")
} 














win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../MySQL/MySQL_Server_5.7/lib/ -lmysqlclient
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../MySQL/MySQL_Server_5.7/lib/ -lmysqlclientd

INCLUDEPATH += $$PWD/../../../MySQL/MySQL_Server_5.7/include
DEPENDPATH += $$PWD/../../../MySQL/MySQL_Server_5.7/include
