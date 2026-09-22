#let bib-data = bytes("
  vredenburgh_right_2022:
    type: article
    title: The Right to Explanation*
    author: Vredenburgh, Kate
    date: 2022-06
    page-range: 209-229
    url:
      value: https://onlinelibrary.wiley.com/doi/10.1111/jopp.12262
      date: 2026-06-01
    serial-number:
      doi: 10.1111/jopp.12262
      issn: 0963-8016, 1467-9760
    language: en-US
    parent:
      type: periodical
      title: Journal of Political Philosophy
      issue: 2
      volume: 30
  worsdorfer_digital_2021:
    type: article
    title:
      value: 'Digital Platforms and Competition Policy: A Business-Ethical Assessment'
      short: Digital Platforms and Competition Policy
    author: Wörsdörfer, Manuel
    date: 2021
    url:
      value: https://www.ssrn.com/abstract=3982604
      date: 2026-06-09
    serial-number:
      doi: 10.2139/ssrn.3982604
      issn: 1556-5068
    language: en-US
    parent:
      type: periodical
      title: '{SSRN} Electronic Journal'
  klonoff_fda_2025:
    type: article
    title:
      value: '{FDA} Interoperability Designation-Creating Options for People With Diabetes and Pump Companies: Regulatory, Technological, and Commercial Perspectives'
      short: '{FDA} Interoperability Designation-Creating Options for People With Diabetes and Pump Companies'
    author:
    - Klonoff, David C.
    - Ho, Cindy N.
    - Ayers, Alessandra
    - Abdel-Malek, Aiman
    date: 2025-07
    page-range: 869-874
    serial-number:
      doi: 10.1177/19322968241271304
      issn: 1932-2968
    parent:
      type: periodical
      title: Journal of Diabetes Science and Technology
      issue: 4
      volume: 19
  food_and_drug_administration_fda_2025:
    type: web
    title: FDA approves first continuous glucose monitoring system with a fully implantable glucose sensor and compatible mobile app for adults with diabetes
    author: Food and Drug Administration
    date: 2025-12
    url:
      value: https://www.fda.gov/news-events/press-announcements/fda-approves-first-continuous-glucose-monitoring-system-fully-implantable-glucose-sensor-and
      date: 2026-06-09
    language: en-US
    note: 'Publication Title: {FDA}'
    abstract: glucose monitoring system, implantable glucose sensor, adults, diabetes
    genre: Press Release
  orbach2023mandated:
    type: anthos
    title: Mandated Neutrality, Platforms, and Ecosystems
    author: Orbach, Barak
    date: 2023
    editor:
    - Akman, Pinar
    - Brook, Or
    - Stylianou, Konstantinos
    chapter: 18
    url: https://ssrn.com/abstract=3984398
    serial-number:
      isbn: '9781839108723'
    note: Arizona Legal Studies Discussion Paper No. 21-28
    parent:
      type: anthology
      title: Research Handbook on Abuse of Dominance and Monopolization
      publisher: Edward Elgar Publishing
  cms2014clia:
    type: misc
    title: '{CLIA} Program and {HIPAA} Privacy Rule; Patients'' Access to Test Reports'
    author:
    - Centers for Medicare & Medicaid Services
    - Centers for Disease Control and Prevention
    - Office for Civil Rights
    date: 2014-02-06
    issue: CMS-2319-F
    url: https://www.govinfo.gov/content/pkg/FR-2014-02-06/pdf/2014-02280.pdf
    note: RIN 0938-AQ38. Codified at 42 {C.F.R.} pt.\\  493 and 45 {C.F.R.} pt.\\  164. Effective April 7, 2014
")

#let post = (
  slug: "data-portability",
  bib: bib-data,
  title: "The Right to Data Portability in Health Trackers",
  date: datetime(year: 2026, month: 6, day: 12),
  tags: ("tech", "privacy"),
  summary: "Pretty obvious if you think about it.",
  body: [
//Arjun Singh, University of California, San Diego
#quote(block:true)[I turned this in (mostly similarly) for PHIL 174: Data Ethics in Spring 2026.]

= Introduction
Digital devices are becoming more ubiquitous in modern life, and one of their applications is in tracking the health of their users. Such health trackers range from commercial 'smart' watches to medically certified continuous blood glucose monitoring devices. There lies cause for concern with many of these devices if there is no non-intrusive, simple, and easy method of exporting the metrics collected in a shareable, standardised format for users to be able to freely use this information in accordance with their will. In response to this concern, this article argues for a right to data portability, at least in the context of health trackers. First, I will elaborate on what I mean by data portability in this context. Then, I will qualify what kinds of data should be covered under this right, why manufacturers of health tracking devices might object to it, and how there is a morally weighty interest that would be protected by data portability. Finally, I will evaluate whether other measures could achieve similar ethical outcomes.

= Data Portability
Data portability is the ability for an agent to access data that is held by another party and use it for their own desired purposes. In this paper, I am specifically concerned about information that pertains to oneself, and argue that all personal medical data would fall into this category i.e. I should be able to access -- and use without restrictions -- information that exists about my body. I am not concerned here with the privacy of that data or other constraints, although those are also important. The focus here is on maintaining one’s access and freedom to freely use medical information about oneself, such as taking information to multiple medical professionals, analytics services, or perhaps even publishing it.

= Useful Data
In the context of health tracking devices, the first variant of data I am concerned with is the raw data collected by the device’s various digital sensors. However, this alone is not sufficient, since there are often additional steps needed to make the data useful. Take, for example, a continuous glucose monitor (CGM) device. The one described in this @food_and_drug_administration_fda_2025 press release uses the luminosity of a fluorescent dye that glows when in contact with glucose as a measure of how much glucose is present in the bloodstream. Without the calibration of luminosities to glucose concentrations, the raw luminosity data alone is not very useful as it does not provide precise and accurate information about the levels of glucose in a user's bloodstream by itself.

The purpose of using such a device for collecting that data with a CGM is expressly to learn how the concentration of glucose in the user's body fluctuates with time. Thus, for the user to be able to then take this information to any provider of medical data analysis they would not specifically need to be able to access the luminosity data, but rather the calibrated measurements of glucose concentrations that the device calculated based on that luminosity data. Still, access to the raw sensor data holds other pragmatic benefits that may merit access.

Perhaps analogously, a camera is a device that takes photographs. You have the option to store the raw image files, but also the option to store the perhaps more useful JPEG is offered. It is more useful because it is more shareable, easily interpretable, and gets rid of extraneous data that does not have a major impact on perception. This processed file is also created locally, and at the time of data collection. It would be outside of traditional expectations for the portability of such files being restricted despite being produced by a device that one owns.

= Manufacturers' Interests
There exist some financial incentives for medical device manufacturers to restrict the ability of users to freely export the data from their health tracking devices. Foremost, it is more profitable for firms to gain recurring revenue by charging a subscription fee for the service of a health tracking device, as compared to the one-time sale of a product which includes access to all the same data. Furthermore, there may be a vested interest in maintaining a competitive advantage by restricting data access to protect information like the calibration data, or proprietary models and algorithms developed by the company. Likewise, some firms may go so far as to claim that the development and  manufacturing of their devices is only economically viable if they are able to restrict access to the data behind a subscription model.

However, there is already precedent for some providers of medical data and analysis being required to allow patients access to the data they produce namely, doctors. At least in the United States, laws like CLIA and HIPAA @cms2014clia stipulate a right for people to access the health data pertaining to them in the form of health records. The laboratories and doctors that produce the medical data and analyses making up a patient’s test reports and notes spent significant time and money developing the professional expertise necessary to provide their opinions and inferences. Yet, it is deemed necessary for patients to not only access the final data, such as a diagnosis, but also all artefacts such as the data used to make the inference, and the rationale that led to the conclusion of a particular diagnosis.

As for concerns of economic viability, the ability for such claims to override individuals’ access is questionable. The development and manufacture of health tracking devices might be expensive, but their sale should not come at the cost of inhibiting data portability, for the morally weighty interests discussed in a subsequent section ought to outweigh them. Furthermore, the premise that producing such devices without restricting data portability is economically not viable might not take into account that if such a right is enforced for all market participants, then there is no disadvantage to any one manufacturer having their devices data be portable since all others’ are too. By the nature of competitive economic markets, there would exist some equilibrium with a price point such that manufacturers can indeed produce these devices for the individuals that would be willing and able to purchase them. In this regard, this paper @worsdorfer_digital_2021 expands on the business-ethical and economic arguments underpinning the viability of making digital platforms like those of Google and Amazon more open.

= Local Collection and Processing
A reasonable compromise on the subset of data that ought to be directly accessible to users might be _local collection and processing_. This is for the following reason: we have established that raw data collected by health tracking devices might not be that useful on its own, so some degree of additional information such as calibration data is required. However, additional data such as inferences that a manufacturer's own service provides by taking their device's measurements and combining it with other data collected through other means to provide additional inferences. This would match the expectations established with the camera analogy, as well as the precedent of doctors and laboratories being required to provide patients access to their health records.

For example, a vendor's software combining CGM data with user-provided dietary logs to provide inferences about user's glycemic responses to certain foodstuffs might not be owed, though the user ought to be more than welcome to take their dietary logs, and CGM data to another provider of inference services, or perform their own data analyses to derive similar inferences.

= Morally Weighty Interests

I am following the Scanlonian contractualist account of rights here in line with this paper @vredenburgh_right_2022 we read in class, as it advocates for a tangential right to explanations. Accordingly, one must ask what morally weighty interests would be protected by a right to data portability.

It is in an individual’s interests that data about their body and health, if it exists in the world, is something they are able to gain access to. If it is collected by a health tracking device they have purchased outright, it seems all the more expected that they should be able to access the data produced by such a device. By accessing such data, one is able to further exercise bodily autonomy by increasing their ability to understand what is happening with their body, whether by directly interpreting the data themselves or taking it to a medical data analysis provider of their choosing.

Such data being portable is then important as it allows for choice in who provides them interpretations of such data. This is akin to the option for patients of one doctor to get a second opinion from another doctor, which involves the second doctor using information produced by the first as an additional source for reference. On this front, access to a sensor’s raw data is beneficial as it may additionally allow for checking the correctness of a device’s calibration. Thus, seeking the services of other analytics vendors allows for greater accuracy by comparing the vendor’s processing with alternatives. This is better for patient outcomes as more accurate inferences would normally lead to better interventions.

These devices are primarily instruments to collect data, and like other instruments that can be used by people on themselves, it would fall into traditional expectations that they are able to keep those readings. The distinction is that with the vastly increased number of measurements and their precision, it has grown beyond the scope of humans to practically analyse without the use of computers and algorithms. However, people should still be able to retain access to this data without an intermediary as they would with traditional instruments like a mercury thermometer. Data portability is what bridges that gap.

Furthermore, being denied data portability may negatively impact epistemic comfort. There is an inherent discomfort associated with the sense of not knowing what is happening in one’s body. When information that could build this knowledge exists, especially in the form of data already collected by a device used and owned by an individual, it seems immoral to deny an individual access to such data or restrict how they may use it.

Data portability is also pragmatically beneficial in the long term, since it eliminates dependency on the manufacturer of a device for access to the data produced by it. If the company making a health tracking device goes out of business, and is no longer able to broker access to the data its devices produce, without data portability there would not be a way to access such information despite it being produced.

Thus, there are many morally weighty interests that are protected by a right to data portability in the context of health trackers.

= Alternatives
The alternatives to a right to data privacy inherently involve letting companies retain control over the data of patients. As outlined earlier, this would be in the interests of manufacturers, but might not serve patients very well.

A limited form of data portability might entail keeping data out of users' hands but letting 'authorised' 3rd parties access it. This could further some of the interests such as double checking the accuracy of inferences made. However, it still falls short of the greater fulfillment of autonomy users have with actual data portability.

The prospect of interoperability, as described in this study @klonoff_fda_2025, seems more promising for furthering patient outcomes. However, the study restricts interoperability to being between different vendors' products, such as CGMs and glucose pumps, where a smartphone application might serve as a hub that interfaces between such devices. This is a step forwards as it further freedom of choice between different vendors of healthcare devices as a whole, but it does not necessarily include the ability for users to export data collected and take it to other inference providers.

= Costs

There might not be many direct costs to users with a right to data portability. The main detriment may be to inefficient firms that are reliant on a monopoly over the data they offer to remain in business. One concern is that of privacy. If people have more control over their sensitive healthcare data, they will be in more of a position to compromise their privacy by unwittingly letting others access it. However, this concern is rather paternalistic. Patients might be at risk of compromising their medical privacy because they have access to their traditional health records, but this does not invalidate their right to access them. Presuming people are not capable of correctly handling their sensitive information is not a strong basis for denying them access to it.

= Conclusion

Currently, it is unclear to what extent restrictions on data portability are in place in industry. Nonetheless, the possibility for adverse moral outcomes without data portability in the healthcare context seems to warrant pre-emptive provisions for such a right.
]
)
