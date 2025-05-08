#include <iostream>
#include <string>
using namespace std;

int main() {
    string texto;
    cout << "Ingrese una cadena: ";
    getline(cin, texto);
    for (int i = texto.length() - 1; i >= 0; i--) {
        cout << texto[i];
    }
    cout << endl;
    return 0;
}
