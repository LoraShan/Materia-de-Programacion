#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main() {
    string texto;
    cout << "Ingrese un texto: ";
    getline(cin, texto);
    transform(texto.begin(), texto.end(), texto.begin(), ::toupper);
    cout << "Texto en mayusculas: " << texto << endl;
    return 0;
}
