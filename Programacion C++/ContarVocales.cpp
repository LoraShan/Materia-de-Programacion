#include <iostream>
#include <string>
using namespace std;

int main() {
    string texto;
    int contador = 0;
    cout << "Ingrese un texto: ";
    getline(cin, texto);
    for (char c : texto) {
        c = tolower(c);
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
            contador++;
    }
    cout << "Cantidad de vocales: " << contador << endl;
    return 0;
}
