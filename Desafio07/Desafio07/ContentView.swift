//
//  ContentView.swift
//  Desafio07
//
//  Created by Turma01-7 on 27/04/26.
//

import SwiftUI
import MapKit

struct Location: Hashable{
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {
    @State private var maravilhasDoMundo = "Cristo Redentor"
    let maravilhas = ["Cristo Redentor","Machu Picchu","Coliseu de Roma","Grande Muralha da China","Petra","Taj Mahal","Chichén Itzá"]
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -22.9100, longitude: -43.2096),
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
    )
    
    let locais: [Location] = [
        Location(nome:"Cristo Redentor", foto:"https://pt.wikipedia.org/wiki/Ficheiro:Christ_the_Redeemer_-_Cristo_Redentor.jpg", descricao: "Cristo Redentor é uma estátua que retrata Jesus Cristo, localizada no topo do morro do Corcovado, a 709 metros acima do nível do mar, dentro do Parque Nacional da Tijuca. Tem vista para parte considerável da cidade brasileira do Rio de Janeiro, sendo a frente da estátua voltada para a Baía de Guanabara e as costas para a Floresta da Tijuca. Feito de concreto armado e pedra-sabão, tem trinta metros de altura (uma das maiores estátuas do mundo), sem contar os oito metros do pedestal, sendo a mais alta estátua do mundo no estilo Art Déco Seus braços se esticam por 28 metros de largura e a estrutura pesa 1 145 toneladas.", latitude: -22.9519, longitude: -43.2175),
                         
        Location(nome:"Machu Picchu", foto:"https://pt.wikipedia.org/wiki/Ficheiro:Sunset_across_Machu_Picchu.jpg", descricao: "Huayna Picchu, Picchu ou Machu Picchu (em quíchua Machu Picchu, 'velha montanha'), também chamada 'cidade perdida dos Incas', é uma cidadela Inca, da Era pré-colombiana, bem conservada, localizada no topo de uma montanha, a 2.400 metros de altitude, no vale do rio Urubamba, atual Peru. Foi construída no início do século XV, por volta de 1420, sob as ordens de Pachacuti. O local é, provavelmente, o símbolo mais típico do Império Inca, quer devido à sua original localização e características geológicas, quer devido à sua descoberta tardia em 1911.", latitude: 13.1631, longitude: 72.5450),
                
        Location(nome:"Coliseu de Roma", foto:"https://pt.wikipedia.org/wiki/Ficheiro:Colosseo_2020.jpg", descricao: "Coliseu (em italiano: Colosseo), também conhecido como Anfiteatro Flaviano (em latim: Amphitheatrum Flavium; em italiano: Anfiteatro Flavio), é um anfiteatro oval localizado no centro da cidade de Roma, capital da Itália. Construído com tijolos revestidos de argamassa e areia, e originalmente cobertos com travertino é o maior anfiteatro já construído e está situado a leste do Fórum Romano.", latitude: 41.8902, longitude: 12.4922),
                
        Location(nome:"Grande Muralha da China", foto:"https://pt.wikipedia.org/wiki/Ficheiro:The_Great_Wall_of_China_at_Jinshanling.jpg", descricao: "A Grande Muralha da China (chinês tradicional: 萬里長城, chinês simplificado: 万里长城, pinyin: Wànlǐ Chángchéng, literalmente 'muro de dez mil li de comprimento') é uma série de fortificações na China. Elas foram construídas ao longo das fronteiras históricas do norte dos antigos estados chineses e da China Imperial como proteção contra vários grupos nômades da Estepe Euroasiática. As primeiras muralhas datam do século VII a.C.; estas foram unidas na dinastia Qin. Dinastias sucessivas expandiram o sistema de muralhas; as seções mais conhecidas foram construídas pela dinastia Ming (1368–1644)", latitude: 40.4319, longitude: 116.5704),
                
        Location(nome:"Petra", foto:"https://pt.wikipedia.org/wiki/Ficheiro:Al_Khazneh_Petra_edit_2.jpg", descricao: "Petra (do grego πέτρα, petra; árabe: البتراء, Al-Bitrā/Al-Batrā), originalmente conhecida pelos nabateus como Raqmu, é uma cidade histórica e arqueológica localizada no sul da Jordânia. A cidade é famosa por sua arquitetura esculpida em rocha e por seu sistema de canalização de água. Outro nome para Petra é Cidade Rosa, devido à cor das pedras do local.", latitude: 30.3284, longitude: 35.4443),
                
        Location(nome:"Taj Mahal", foto:"https://pt.wikipedia.org/wiki/Ficheiro:Taj_Mahal_N-UP-A28-a.jpg", descricao: "O Taj Mahal (em hindi: ताज महल) é um mausoléu situado em Agra, na Índia, sendo o mais conhecido dos monumentos do país.[1] Encontra-se classificado pela UNESCO como Patrimônio da Humanidade. Foi anunciado em 2007 como uma das sete maravilhas do mundo moderno. A obra foi feita entre 1632 e 1653[2] com a força de cerca de 20 mil homens,[3] trazidos de várias cidades do Oriente, para trabalhar no suntuoso monumento de mármore branco que o imperador Shah Jahan mandou construir em memória de sua esposa favorita, Aryumand Banu Begam, a quem chamava de Mumtaz Mahal", latitude: 27.1751, longitude: 78.0421),
                
        Location(nome:"Chichén Itzá", foto:"https://pt.wikipedia.org/wiki/Ficheiro:Chichen_Itza-18_(cropped).jpg", descricao: "Chichén Itzá era um polo urbano importante dos maias na planície norte no início (600-900) e no final (cerca 800-900) do período clássico e também no início do período pós-clássico (cerca de 900-1200). O local exibe vários estilos arquitetônicos, reminiscentes dos estilos vistos no México central. Acreditava-se que a presença de estilos desta região era sinal da migração direta ou mesmo da conquista do México central, mas a maioria de interpretações contemporâneas veem a presença destes estilos não maias mais como o resultado da difusão cultural.", latitude: 20.6667, longitude: -88.5667),

    ]
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(locais, id: \.self) { local in
                    Annotation(local.nome, coordinate: CLLocationCoordinate2D(
                        latitude: local.latitude,
                        longitude: local.longitude
                    )) {
                        Image(systemName: "mappin.and.ellipse.circle")
                            .foregroundColor(.black)
                            .font(.title)
                        Text(local.nome)
                            .font(.caption)
                            .padding(4)
                            .background(.white)
                            .cornerRadius(6)
                    }
                }
            }
            
            VStack {

                Picker("Escolha uma maravilha", selection: $maravilhasDoMundo){
                    ForEach(maravilhas, id: \.self) { maravilha in
                        Text(maravilha)
                    }
                }
                .pickerStyle(.menu)
                .padding(.horizontal, 20)
                .padding(.vertical, 08)
                .background(.amarelo)
                .cornerRadius(12)
                .tint(.black)
                
                .onChange(of: maravilhasDoMundo) { old, nova in
                    if let local = locais.first(where: { $0.nome == nova }) {
                        position = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: local.latitude,
                                    longitude: local.longitude
                                ),
                                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
                            )
                        )
                    }
                }
                Spacer()
                
                
                Text("Maravilhas do Mundo Moderno")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(.amarelo)
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    ContentView()
}
