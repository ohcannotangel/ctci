//
//  main.cpp
//  ctci
//
//  Created by matsuura hiroko on 2014/01/29.
//  Copyright (c) 2014年 matsuura hiroko. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <queue>

using namespace std;

void showLastKline(int k, string fileName)
{
    ifstream in(fileName);
    if(in.fail()){
        cout << "fileopen failed" << endl;
    }

    // 常に最後のk行を格納するqueue
    queue<string> queue;
    
    string buf;
    while(in && getline(in, buf)) {
        // queueサイズがkより大きければpopする
        if(queue.size() >= k){
            queue.pop();
        }
        queue.push(buf);
    }

    // 出力
    int i = 1;
    while(!queue.empty()){
        cout << i << ":" << queue.front() << endl;
        queue.pop();
        i++;
    }
    
    return;
}


int main(int argc, const char * argv[])
{
    int k = 10;
    cout << "k:" << k << endl;
    string fileName = "data.txt";
    showLastKline(k, fileName);

    cout << endl;
    
    k = 3;
    cout << "k:" << k << endl;
    showLastKline(k, fileName);

    cout << endl;
    
    k = 20;
    cout << "k:" << k << endl;
    showLastKline(k, fileName);
    
    return 0;
}

