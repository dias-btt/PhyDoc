import SwiftUI

struct SuccessView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                // Header/H1
                Text("Вы записаны на прием!")
                  .font(
                    Font.custom("Onest", size: 32)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
                  .padding(.top, 200)
                // Text/Regular 16pt
                Text("Мы отправим вам уведмление чтобы вы не забыли о приеме. \nЕсли захотите изменить или отменить запись, вы можете сделать на странице с записями.")
                  .font(Font.custom("Onest", size: 16))
                  .foregroundColor(Color(red: 0.93, green: 0.92, blue: 1))
                  .frame(maxWidth: .infinity, alignment: .topLeading)
                Spacer()
                NavigationLink {
                    ContentView()
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .center, spacing: 8) {
                        // Text/Bold 16pt
                        Text("Хорошо")
                          .font(
                            Font.custom("Onest", size: 16)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                    }
                            .padding(16)
                            .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                            .background(.white)
                            .cornerRadius(28)
                    }
                    .padding(.bottom)
                    .frame(width: 320, alignment: .topLeading)
                }
            }
            .padding(0)
            .frame(width: 320, alignment: .topLeading)
            .ignoresSafeArea()

        }
        .frame(width: 400, height: 800)
        .background(Color(red: 0.27, green: 0.21, blue: 1))
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
