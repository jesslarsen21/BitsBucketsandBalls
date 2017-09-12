#ifndef ROUND_H
#define ROUND_H
#include <string>

class Round
{
public:
    Round(int level, int round);
    int getLevel();
    int getRound();
    void setLevel(int level);
    void setRound(int round);
    int getNum();
    int calculateScore(int time);

private:
    int currLevel;
    int currRound;
    int num;
};

#endif // ROUND_H
