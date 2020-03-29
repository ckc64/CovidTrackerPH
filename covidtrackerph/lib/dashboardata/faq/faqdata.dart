class QuestionsEntry{
  String title;
  String details;
  final List<QuestionsEntry> children;
  QuestionsEntry(this.title,[this.children = const <QuestionsEntry>[]]);
}

List<QuestionsEntry> questionsList = <QuestionsEntry>[
  new QuestionsEntry(
    "What is coronavirus?",
    <QuestionsEntry>[
      new QuestionsEntry(
          "Coronaviruses are a large family of viruses which may cause illness in animals or humans.  In humans, several coronaviruses are known to cause respiratory infections ranging from the common cold to more severe diseases such as Middle East Respiratory Syndrome (MERS) and Severe Acute Respiratory Syndrome (SARS). The most recently discovered coronavirus causes coronavirus disease COVID-19."
      )
    ]
    
  ),

    new QuestionsEntry(
    "What is COVID-19?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "COVID-19 is the infectious disease caused by the most recently discovered coronavirus. This new virus and disease were unknown before the outbreak began in Wuhan, China, in December 2019."
      )
    ]
  ),
    new QuestionsEntry(
    "What are the symptoms of COVID-19",
    <QuestionsEntry>[
      new QuestionsEntry(
         "The most common symptoms of COVID-19 are fever, tiredness, and dry cough. Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhea. These symptoms are usually mild and begin gradually. Some people become infected but don’t develop any symptoms and don't feel unwell. Most people (about 80%) recover from the disease without needing special treatment. Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing. Older people, and those with underlying medical problems like high blood pressure, heart problems or diabetes, are more likely to develop serious illness. People with fever, cough and difficulty breathing should seek medical attention."
      )
    ]
  ),

    new QuestionsEntry(
    "How does the virus COVID-19 spread?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "People can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick. "
      )
    ]
  ),

    new QuestionsEntry(
    "Can CoVID-19 be caught from a person who has no symptoms?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "The main way the disease spreads is through respiratory droplets expelled by someone who is coughing. The risk of catching COVID-19 from someone with no symptoms at all is very low. However, many people with COVID-19 experience only mild symptoms. This is particularly true at the early stages of the disease. It is therefore possible to catch COVID-19 from someone who has, for example, just a mild cough and does not feel ill.  WHO is assessing ongoing research on the period of transmission of COVID-19 and will continue to share updated findings."
      )
    ]
  ),

     new QuestionsEntry(
    "Can I catch COVID-19 from the feces of someone with the disease?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "The risk of catching COVID-19 from the feces of an infected person appears to be low. While initial investigations suggest the virus may be present in feces in some cases, spread through this route is not a main feature of the outbreak. WHO is assessing ongoing research on the ways COVID-19 is spread and will continue to share new findings. Because this is a risk, however, it is another reason to clean hands regularly, after using the bathroom and before eating."
      )
    ]
  ),
      new QuestionsEntry(
    "What can I do to protect myself and prevent the spread of disesase?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "Stay aware of the latest information on the COVID-19 outbreak, available on the WHO website and through your national and local public health authority. Many countries around the world have seen cases of COVID-19 and several have seen outbreaks. Authorities in China and some other countries have succeeded in slowing or stopping their outbreaks. However, the situation is unpredictable so check regularly for the latest news.\n\nYou can reduce your chances of being infected or spreading COVID-19 by taking some simple precautions:\n\nRegularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water.\nWhy? Washing your hands with soap and water or using alcohol-based hand rub kills viruses that may be on your hands.\n\nMaintain at least 1 metre (3 feet) distance between yourself and anyone who is coughing or sneezing.\nWhy? When someone coughs or sneezes they spray small liquid droplets from their nose or mouth which may contain virus. If you are too close, you can breathe in the droplets, including the COVID-19 virus if the person coughing has the disease.\n\nAvoid touching eyes, nose and mouth.\nWhy? Hands touch many surfaces and can pick up viruses. Once contaminated, hands can transfer the virus to your eyes, nose or mouth. From there, the virus can enter your body and can make you sick.\n\nMake sure you, and the people around you, follow good respiratory hygiene. This means covering your mouth and nose with your bent elbow or tissue when you cough or sneeze. Then dispose of the used tissue immediately.\nWhy? Droplets spread virus. By following good respiratory hygiene you protect the people around you from viruses such as cold, flu and COVID-19.\n\nStay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention and call in advance. Follow the directions of your local health authority.\nWhy? National and local authorities will have the most up to date information on the situation in your area. Calling in advance will allow your health care provider to quickly direct you to the right health facility. This will also protect you and help prevent spread of viruses and other infections.\n\nKeep up to date on the latest COVID-19 hotspots (cities or local areas where COVID-19 is spreading widely). If possible, avoid traveling to places  – especially if you are an older person or have diabetes, heart or lung disease.\nWhy? You have a higher chance of catching COVID-19 in one of these areas."
      )
    ]
  ),
      new QuestionsEntry(
    "How I likely am I to catch COVID-19?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "The risk depends on where you  are - and more specifically, whether there is a COVID-19 outbreak unfolding there.\n\nFor most people in most locations the risk of catching COVID-19 is still low. However, there are now places around the world (cities or areas) where the disease is spreading. For people living in, or visiting, these areas the risk of catching COVID-19 is higher. Governments and health authorities are taking vigorous action every time a new case of COVID-19 is identified. Be sure to comply with any local restrictions on travel, movement or large gatherings. Cooperating with disease control efforts will reduce your risk of catching or spreading COVID-19.\n\nCOVID-19 outbreaks can be contained and transmission stopped, as has been shown in China and some other countries. Unfortunately, new outbreaks can emerge rapidly. It’s important to be aware of the situation where you are or intend to go."
      )
    ]
  ),

     new QuestionsEntry(
    "Should I worry about COVID-19?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "Illness due to COVID-19 infection is generally mild, especially for children and young adults. However, it can cause serious illness: about 1 in every 5 people who catch it need hospital care. It is therefore quite normal for people to worry about how the COVID-19 outbreak will affect them and their loved ones.\n\nWe can channel our concerns into actions to protect ourselves, our loved ones and our communities. First and foremost among these actions is regular and thorough hand-washing and good respiratory hygiene. Secondly, keep informed and follow the advice of the local health authorities including any restrictions put in place on travel, movement and gatherings."
      )
    ]
  ),

     new QuestionsEntry(
    "Who is at risk of developing severe illness",
    <QuestionsEntry>[
      new QuestionsEntry(
         "While we are still learning about how COVID-2019 affects people, older persons and persons with pre-existing medical conditions (such as high blood pressure, heart disease, lung disease, cancer or diabetes)  appear to develop serious illness more often than others."
      )
    ]
  ),
     new QuestionsEntry(
    "Are antibiotics affective in preventing or treating the COVID-19",
    <QuestionsEntry>[
      new QuestionsEntry(
         "No. Antibiotics do not work against viruses, they only work on bacterial infections. COVID-19 is caused by a virus, so antibiotics do not work. Antibiotics should not be used as a means of prevention or treatment of COVID-19. They should only be used as directed by a physician to treat a bacterial infection."
      )
    ]
  ),
    new QuestionsEntry(
    "Are there any medicines or therapies that can prevent or cure COVID-19",
    <QuestionsEntry>[
      new QuestionsEntry(
         "While some western, traditional or home remedies may provide comfort and alleviate symptoms of COVID-19, there is no evidence that current medicine can prevent or cure the disease. WHO does not recommend self-medication with any medicines, including antibiotics, as a prevention or cure for COVID-19. However, there are several ongoing clinical trials that include both western and traditional medicines. WHO will continue to provide updated information as soon as clinical findings are available."
      )
    ]
  ),
      new QuestionsEntry(
    "Is there a vaccine, drug or treatment for COVID-19?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "Not yet. To date, there is no vaccine and no specific antiviral medicine to prevent or treat COVID-2019. However, those affected should receive care to relieve symptoms. People with serious illness should be hospitalized. Most patients recover thanks to supportive care.\n\nPossible vaccines and some specific drug treatments are under investigation. They are being tested through clinical trials. WHO is coordinating efforts to develop vaccines and medicines to prevent and treat COVID-19.\n\nThe most effective ways to protect yourself and others against COVID-19 are to frequently clean your hands, cover your cough with the bend of elbow or tissue, and maintain a distance of at least 1 meter (3 feet) from people who are coughing or sneezing. "
      )
    ]
  ),

     new QuestionsEntry(
    "How to put on, use, take off and dispose of a mask",
    <QuestionsEntry>[
      new QuestionsEntry(
         "1. Remember, a mask should only be used by health workers, care takers, and individuals with respiratory symptoms, such as fever and cough.\n2. Before touching the mask, clean hands with an alcohol-based hand rub or soap and water\n3. Take the mask and inspect it for tears or holes.\n4. Orient which side is the top side (where the metal strip is).\n5. Ensure the proper side of the mask faces outwards (the coloured side).\n6. Place the mask to your face. Pinch the metal strip or stiff edge of the mask so it moulds to the shape of your nose.\n7. Pull down the mask’s bottom so it covers your mouth and your chin. \n8. After use, take off the mask; remove the elastic loops from behind the ears while keeping the mask away from your face and clothes, to avoid touching potentially contaminated surfaces of the mask. \n9. Discard the mask in a closed bin immediately after use. \n10. Perform hand hygiene after touching or discarding the mask – Use alcohol-based hand rub or, if visibly soiled, wash your hands with soap and water."
      )
    ]
  ),
  new QuestionsEntry(
    "How long is the incubation period for COVID-19",
    <QuestionsEntry>[
      new QuestionsEntry(
         "The “incubation period” means the time between catching the virus and beginning to have symptoms of the disease. Most estimates of the incubation period for COVID-19 range from 1-14 days, most commonly around five days. These estimates will be updated as more data become available."
      )
    ]
  ),

   new QuestionsEntry(
    "Can humans become infected with the COVID-19 from an animal source?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "Coronaviruses are a large family of viruses that are common in animals. Occasionally, people get infected with these viruses which may then spread to other people. For example, SARS-CoV was associated with civet cats and MERS-CoV is transmitted by dromedary camels. Possible animal sources of COVID-19 have not yet been confirmed. \n\no protect yourself, such as when visiting live animal markets, avoid direct contact with animals and surfaces in contact with animals. Ensure good food safety practices at all times. Handle raw meat, milk or animal organs with care to avoid contamination of uncooked foods and avoid consuming raw or undercooked animal products."
      )
    ]
  ),

     new QuestionsEntry(
    "Can I catch COVID-19 from my pet?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "While there has been one instance of a dog being infected in Hong Kong, to date, there is no evidence that a dog, cat or any pet can transmit COVID-19. COVID-19 is mainly spread through droplets produced when an infected person coughs, sneezes, or speaks. To protect yourself, clean your hands frequently and thoroughly."
      )
    ]
  ),

     new QuestionsEntry(
    "How long does the virus survive on surfaces?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "It is not certain how long the virus that causes COVID-19 survives on surfaces, but it seems to behave like other coronaviruses. Studies suggest that coronaviruses (including preliminary information on the COVID-19 virus) may persist on surfaces for a few hours or up to several days. This may vary under different conditions (e.g. type of surface, temperature or humidity of the environment).\n\nIf you think a surface may be infected, clean it with simple disinfectant to kill the virus and protect yourself and others. Clean your hands with an alcohol-based hand rub or wash them with soap and water. Avoid touching your eyes, mouth, or nose."
      )
    ]
  ),
  
     new QuestionsEntry(
    "Is it safe to receive a package from any area where COVID-19 has been reported?",
    <QuestionsEntry>[
      new QuestionsEntry(
         "Yes. The likelihood of an infected person contaminating commercial goods is low and the risk of catching the virus that causes COVID-19 from a package that has been moved, travelled, and exposed to different conditions and temperature is also low."
      )
    ]
  ),
   new QuestionsEntry(
    "Is there anything I should not do",
    <QuestionsEntry>[
      new QuestionsEntry(
         "The following measures ARE NOT effective against COVID-2019 and can be harmful: \n\nSmoking\nWearing multiple masks\nTaking antibiotics\n\nIn any case, if you have fever, cough and difficulty breathing seek medical care early to reduce the risk of developing a more severe infection and be sure to share your recent travel history with your health care provider."
      )
    ]
  ),

];


class MythsEntry{
  String title;
  String details;
  final List< MythsEntry> children;
   MythsEntry(this.title,[this.children = const <MythsEntry>[]]);
}


List<MythsEntry> mythsList = <MythsEntry>[
     new MythsEntry(
    "COVID-19 virus can be transmitted in areas with hot and humid climates",
    <MythsEntry>[
      new MythsEntry(
         "From the evidence so far, the COVID-19 virus can be transmitted in ALL AREAS, including areas with hot and humid weather. Regardless of climate, adopt protective measures if you live in, or travel to an area reporting COVID-19. The best way to protect yourself against COVID-19 is by frequently cleaning your hands. By doing this you eliminate viruses that may be on your hands and avoid infection that could occur by then touching your eyes, mouth, and nose."
      )
    ]
  ),
    new MythsEntry(
    "Cold weather and snow CANNOT kill the new coronavirus.",
    <MythsEntry>[
      new MythsEntry(
         "There is no reason to believe that cold weather can kill the new coronavirus or other diseases. The normal human body temperature remains around 36.5°C to 37°C, regardless of the external temperature or weather. The most effective way to protect yourself against the new coronavirus is by frequently cleaning your hands with alcohol-based hand rub or washing them with soap and water."
      )
    ]
  ),
     new MythsEntry(
    "Taking a hot bath does not prevent the new coronavirus disease",
    <MythsEntry>[
      new MythsEntry(
         "Taking a hot bath will not prevent you from catching COVID-19. Your normal body temperature remains around 36.5°C to 37°C, regardless of the temperature of your bath or shower. Actually, taking a hot bath with extremely hot water can be harmful, as it can burn you. The best way to protect yourself against COVID-19 is by frequently cleaning your hands. By doing this you eliminate viruses that may be on your hands and avoid infection that could occur by then touching your eyes, mouth, and nose."
      )
    ]
  ),
    new MythsEntry(
    "The new coronavirus CANNOT be transmitted through mosquito bites.",
    <MythsEntry>[
      new MythsEntry(
         "To date there has been no information nor evidence to suggest that the new coronavirus could be transmitted by mosquitoes. The new coronavirus is a respiratory virus which spreads primarily through droplets generated when an infected person coughs or sneezes, or through droplets of saliva or discharge from the nose. To protect yourself, clean your hands frequently with an alcohol-based hand rub or wash them with soap and water. Also, avoid close contact with anyone who is coughing and sneezing."
      )
    ]
  ),
    new MythsEntry(
    "Are hand dryers effective in killing the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "No. Hand dryers are not effective in killing the 2019-nCoV. To protect yourself against the new coronavirus, you should frequently clean your hands with an alcohol-based hand rub or wash them with soap and water. Once your hands are cleaned, you should dry them thoroughly by using paper towels or a warm air dryer."
      )
    ]
  ),
     new MythsEntry(
    "Can an ultraviolet disinfection lamp kill the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "UV lamps should not be used to sterilize hands or other areas of skin as UV radiation can cause skin irritation."
      )
    ]
  ),
    new MythsEntry(
    "How effective are thermal scanners in detecting people infected with the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "Thermal scanners are effective in detecting people who have developed a fever (i.e. have a higher than normal body temperature) because of infection with the new coronavirus.\n\nHowever, they cannot detect people who are infected but are not yet sick with fever. This is because it takes between 2 and 10 days before people who are infected become sick and develop a fever."
      )
    ]
  ),
      new MythsEntry(
    "Can spraying alcohol or chlorine all over your body kill the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "No. Spraying alcohol or chlorine all over your body will not kill viruses that have already entered your body. Spraying such substances can be harmful to clothes or mucous membranes (i.e. eyes, mouth). Be aware that both alcohol and chlorine can be useful to disinfect surfaces, but they need to be used under appropriate recommendations."
      )
    ]
  ),
       new MythsEntry(
    "Do vaccines against pneumonia protect you against the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "No. Vaccines against pneumonia, such as pneumococcal vaccine and Haemophilus influenza type B (Hib) vaccine, do not provide protection against the new coronavirus.\n\nThe virus is so new and different that it needs its own vaccine. Researchers are trying to develop a vaccine against 2019-nCoV, and WHO is supporting their efforts.\n\nAlthough these vaccines are not effective against 2019-nCoV, vaccination against respiratory illnesses is highly recommended to protect your health."
      )
    ]
  ),
        new MythsEntry(
    "Can regularly rinsing your nose with saline help prevent infection with the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "No. There is no evidence that regularly rinsing the nose with saline has protected people from infection with the new coronavirus. \n\nThere is some limited evidence that regularly rinsing nose with saline can help people recover more quickly from the common cold. However, regularly rinsing the nose has not been shown to prevent respiratory infections."
      )
    ]
  ),
      new MythsEntry(
    "Can eating garlic help prevent infection with the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "Garlic is a healthy food that may have some antimicrobial properties. However, there is no evidence from the current outbreak that eating garlic has protected people from the new coronavirus."
      )
    ]
  ),

     new MythsEntry(
    "Does the new coronavirus affect older people, or are younger people also susceptible?",
    <MythsEntry>[
      new MythsEntry(
         "People of all ages can be infected by the new coronavirus (2019-nCoV). Older people, and people with pre-existing medical conditions (such as asthma, diabetes, heart disease) appear to be more vulnerable to becoming severely ill with the virus. \n\nWHO advises people of all ages to take steps to protect themselves from the virus, for example by following good hand hygiene and good respiratory hygiene."
      )
    ]
  ),
     new MythsEntry(
    "Are antibiotics effective in preventing and treating the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "No, antibiotics do not work against viruses, only bacteria.\n\nThe new coronavirus (2019-nCoV) is a virus and, therefore, antibiotics should not be used as a means of prevention or treatment.\n\nHowever, if you are hospitalized for the 2019-nCoV, you may receive antibiotics because bacterial co-infection is possible."
      )
    ]
  ),
      new MythsEntry(
    "Are there any specific medicines to prevent or treat the new coronavirus?",
    <MythsEntry>[
      new MythsEntry(
         "To date, there is no specific medicine recommended to prevent or treat the new coronavirus (2019-nCoV).\n\nHowever, those infected with the virus should receive appropriate care to relieve and treat symptoms, and those with severe illness should receive optimized supportive care. Some specific treatments are under investigation, and will be tested through clinical trials. WHO is helping to accelerate research and development efforts with a range or partners."
      )
    ]
  ),
];