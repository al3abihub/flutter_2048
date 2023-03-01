List<Map<String, dynamic>> searchCountries(name) {
  List<Map<String, dynamic>> countries = [];
  countriesFlags.forEach((country) {
    var isContain = country["country"]
        .toLowerCase()
        .trim()
        .contains(new RegExp(name.toLowerCase().trim(), caseSensitive: false));

    if (isContain) {
      countries.add(country);
    }
  });
  return countries;
}

List<Map<String, dynamic>> countriesFlags = <Map<String, dynamic>>[
  {
    'country': 'Afghanistan',
    'countryCode': 'AF',
  },
  {
    'country': 'Albania',
    'countryCode': 'AL',
  },
  {
    'country': 'الجزائر',
    'countryCode': 'DZ',
  },
  {
    'country': 'American Samoa',
    'countryCode': 'AS',
  },
  {
    'country': 'Andorra',
    'countryCode': 'AD',
  },
  {
    'country': 'Angola',
    'countryCode': 'AO',
  },
  {
    'country': 'Anguilla',
    'countryCode': 'AI',
  },
  {
    'country': 'Antigua and Barbuda',
    'countryCode': 'AG',
  },
  {
    'country': 'Argentina',
    'countryCode': 'AR',
  },
  {
    'country': 'Armenia',
    'countryCode': 'AM',
  },
  {
    'country': 'Aruba',
    'countryCode': 'AW',
  },
  {
    'country': 'Australia',
    'countryCode': 'AU',
  },
  {
    'country': 'Austria',
    'countryCode': 'AT',
  },
  {
    'country': 'Azerbaijan',
    'countryCode': 'AZ',
  },
  {
    'country': 'Bahamas',
    'countryCode': 'BS',
  },
  {
    'country': 'البحرين',
    'countryCode': 'BH',
  },
  {
    'country': 'Bangladesh',
    'countryCode': 'BD',
  },
  {
    'country': 'Barbados',
    'countryCode': 'BB',
  },
  {
    'country': 'Belarus',
    'countryCode': 'BY',
  },
  {
    'country': 'Belgium',
    'countryCode': 'BE',
  },
  {
    'country': 'Belize',
    'countryCode': 'BZ',
  },
  {
    'country': 'Benin',
    'countryCode': 'BJ',
  },
  {
    'country': 'Bermuda',
    'countryCode': 'BM',
  },
  {
    'country': 'Bhutan',
    'countryCode': 'BT',
  },
  {
    'country': 'Bosnia and Herzegovina',
    'countryCode': 'BA',
  },
  {
    'country': 'Botswana',
    'countryCode': 'BW',
  },
  {
    'country': 'Brazil',
    'countryCode': 'BR',
  },
  {
    'country': 'British Indian Ocean Territory',
    'countryCode': 'IO',
  },
  {
    'country': 'Bulgaria',
    'countryCode': 'BG',
  },
  {
    'country': 'Burkina Faso',
    'countryCode': 'BF',
  },
  {
    'country': 'Burundi',
    'countryCode': 'BI',
  },
  {
    'country': 'Cambodia',
    'countryCode': 'KH',
  },
  {
    'country': 'Cameroon',
    'countryCode': 'CM',
  },
  {
    'country': 'United States',
    'countryCode': 'US',
  },
  {
    'country': 'Canada',
    'countryCode': 'CA',
  },
  {
    'country': 'Cape Verde',
    'countryCode': 'CV',
  },
  {
    'country': 'Cayman Islands',
    'countryCode': 'KY',
  },
  {
    'country': 'Central African Republic',
    'countryCode': 'CF',
  },
  {
    'country': 'Chad',
    'countryCode': 'TD',
  },
  {
    'country': 'Chile',
    'countryCode': 'CL',
  },
  {
    'country': 'China',
    'countryCode': 'CN',
  },
  {
    'country': 'Christmas Island',
    'countryCode': 'CX',
  },
  {
    'country': 'Colombia',
    'countryCode': 'CO',
  },
  {
    'country': 'Comoros',
    'countryCode': 'KM',
  },
  {
    'country': 'Congo',
    'countryCode': 'CG',
  },
  {
    'country': 'Cook Islands',
    'countryCode': 'CK',
  },
  {
    'country': 'Costa Rica',
    'countryCode': 'CR',
  },
  {
    'country': 'Croatia',
    'countryCode': 'HR',
  },
  {
    'country': 'Cuba',
    'countryCode': 'CU',
  },
  {
    'country': 'Cyprus',
    'countryCode': 'CY',
  },
  {
    'country': 'Czech Republic',
    'countryCode': 'CZ',
  },
  {
    'country': 'Denmark',
    'countryCode': 'DK',
  },
  {
    'country': 'جيبوتي',
    'countryCode': 'DJ',
  },
  {
    'country': 'Dominica',
    'countryCode': 'DM',
  },
  {
    'country': 'Dominican Republic',
    'countryCode': 'DO',
  },
  {
    'country': 'Ecuador',
    'countryCode': 'EC',
  },
  {
    'country': 'مصر',
    'countryCode': 'EG',
  },
  {
    'country': 'El Salvador',
    'countryCode': 'SV',
  },
  {
    'country': 'Equatorial Guinea',
    'countryCode': 'GQ',
  },
  {
    'country': 'Eritrea',
    'countryCode': 'ER',
  },
  {
    'country': 'Estonia',
    'countryCode': 'EE',
  },
  {
    'country': 'Ethiopia',
    'countryCode': 'ET',
  },
  {
    'country': 'Faroe Islands',
    'countryCode': 'FO',
  },
  {
    'country': 'Fiji',
    'countryCode': 'FJ',
  },
  {
    'country': 'Finland',
    'countryCode': 'FI',
  },
  {
    'country': 'France',
    'countryCode': 'FR',
  },
  {
    'country': 'French Guiana',
    'countryCode': 'GF',
  },
  {
    'country': 'French Polynesia',
    'countryCode': 'PF',
  },
  {
    'country': 'Gabon',
    'countryCode': 'GA',
  },
  {
    'country': 'Gambia',
    'countryCode': 'GM',
  },
  {
    'country': 'Georgia',
    'countryCode': 'GE',
  },
  {
    'country': 'Germany',
    'countryCode': 'DE',
  },
  {
    'country': 'Ghana',
    'countryCode': 'GH',
  },
  {
    'country': 'Gibraltar',
    'countryCode': 'GI',
  },
  {
    'country': 'Greece',
    'countryCode': 'GR',
  },
  {
    'country': 'Greenland',
    'countryCode': 'GL',
  },
  {
    'country': 'Grenada',
    'countryCode': 'GD',
  },
  {
    'country': 'Guadeloupe',
    'countryCode': 'GP',
  },
  {
    'country': 'Guam',
    'countryCode': 'GU',
  },
  {
    'country': 'Guatemala',
    'countryCode': 'GT',
  },
  {
    'country': 'Guinea',
    'countryCode': 'GN',
  },
  {
    'country': 'Guinea-Bissau',
    'countryCode': 'GW',
  },
  {
    'country': 'Guyana',
    'countryCode': 'GY',
  },
  {
    'country': 'Haiti',
    'countryCode': 'HT',
  },
  {
    'country': 'Honduras',
    'countryCode': 'HN',
  },
  {
    'country': 'Hungary',
    'countryCode': 'HU',
  },
  {
    'country': 'Iceland',
    'countryCode': 'IS',
  },
  {
    'country': 'India',
    'countryCode': 'IN',
  },
  {
    'country': 'Indonesia',
    'countryCode': 'ID',
  },
  {
    'country': 'العراق',
    'countryCode': 'IQ',
  },
  {
    'country': 'Ireland',
    'countryCode': 'IE',
  },
  {
    'country': 'Italy',
    'countryCode': 'IT',
  },
  {
    'country': 'Jamaica',
    'countryCode': 'JM',
  },
  {
    'country': 'Japan',
    'countryCode': 'JP',
  },
  {
    'country': 'الاردن',
    'countryCode': 'JO',
  },
  {
    'country': 'Kazakhstan',
    'countryRU': 'Казахстан',
    'countryCode': 'KZ',
  },
  {
    'country': 'Kenya',
    'countryCode': 'KE',
  },
  {
    'country': 'Kiribati',
    'countryCode': 'KI',
  },
  {
    'country': 'الكويت',
    'countryCode': 'KW',
  },
  {
    'country': 'Kyrgyzstan',
    'countryCode': 'KG',
  },
  {
    'country': 'Latvia',
    'countryCode': 'LV',
  },
  {
    'country': 'لبنان',
    'countryCode': 'LB',
  },
  {
    'country': 'Lesotho',
    'countryCode': 'LS',
  },
  {
    'country': 'Liberia',
    'countryCode': 'LR',
  },
  {
    'country': 'Liechtenstein',
    'countryCode': 'LI',
  },
  {
    'country': 'Lithuania',
    'countryCode': 'LT',
  },
  {
    'country': 'Luxembourg',
    'countryCode': 'LU',
  },
  {
    'country': 'Madagascar',
    'countryCode': 'MG',
  },
  {
    'country': 'Malawi',
    'countryCode': 'MW',
  },
  {
    'country': 'Malaysia',
    'countryCode': 'MY',
  },
  {
    'country': 'Maldives',
    'countryCode': 'MV',
  },
  {
    'country': 'Mali',
    'countryCode': 'ML',
  },
  {
    'country': 'Malta',
    'countryCode': 'MT',
  },
  {
    'country': 'Marshall Islands',
    'countryCode': 'MH',
  },
  {
    'country': 'Martinique',
    'countryCode': 'MQ',
  },
  {
    'country': 'موريتانيا',
    'countryCode': 'MR',
  },
  {
    'country': 'Mauritius',
    'countryCode': 'MU',
  },
  {
    'country': 'Mayotte',
    'countryCode': 'YT',
  },
  {
    'country': 'Mexico',
    'countryCode': 'MX',
  },
  {
    'country': 'Monaco',
    'countryCode': 'MC',
  },
  {
    'country': 'Mongolia',
    'countryCode': 'MN',
  },
  {
    'country': 'Montenegro',
    'countryCode': 'ME',
  },
  {
    'country': 'Montserrat',
    'countryCode': 'MS',
  },
  {
    'country': 'المغرب',
    'countryCode': 'MA',
  },
  {
    'country': 'Myanmar',
    'countryCode': 'MM',
  },
  {
    'country': 'Namibia',
    'countryCode': 'NA',
  },
  {
    'country': 'Nauru',
    'countryCode': 'NR',
  },
  {
    'country': 'Nepal',
    'countryCode': 'NP',
  },
  {
    'country': 'Netherlands',
    'countryCode': 'NL',
  },
  {
    'country': 'Netherlands Antilles',
    'countryCode': 'AN',
  },
  {
    'country': 'New Caledonia',
    'countryCode': 'NC',
  },
  {
    'country': 'New Zealand',
    'countryCode': 'NZ',
  },
  {
    'country': 'Nicaragua',
    'countryCode': 'NI',
  },
  {
    'country': 'Niger',
    'countryCode': 'NE',
  },
  {
    'country': 'Nigeria',
    'countryCode': 'NG',
  },
  {
    'country': 'Niue',
    'countryCode': 'NU',
  },
  {
    'country': 'Norfolk Island',
    'countryCode': 'NF',
  },
  {
    'country': 'Northern Mariana Islands',
    'countryCode': 'MP',
  },
  {
    'country': 'Norway',
    'countryCode': 'NO',
  },
  {
    'country': 'عمان',
    'countryCode': 'OM',
  },
  {
    'country': 'Pakistan',
    'countryCode': 'PK',
  },
  {
    'country': 'Palau',
    'countryCode': 'PW',
  },
  {
    'country': 'Panama',
    'countryCode': 'PA',
  },
  {
    'country': 'Papua New Guinea',
    'countryCode': 'PG',
  },
  {
    'country': 'Paraguay',
    'countryCode': 'PY',
  },
  {
    'country': 'فلسطين',
    'countryCode': 'PA',
  },
  {
    'country': 'Peru',
    'countryCode': 'PE',
  },
  {
    'country': 'Philippines',
    'countryCode': 'PH',
  },
  {
    'country': 'Poland',
    'countryCode': 'PL',
  },
  {
    'country': 'Portugal',
    'countryCode': 'PT',
  },
  {
    'country': 'Puerto Rico',
    'countryCode': 'PR',
  },
  {
    'country': 'قطر',
    'countryCode': 'QA',
  },
  {
    'country': 'Romania',
    'countryCode': 'RO',
  },
  {
    'country': 'Rwanda',
    'countryCode': 'RW',
  },
  {
    'country': 'Samoa',
    'countryCode': 'WS',
  },
  {
    'country': 'San Marino',
    'countryCode': 'SM',
  },
  {
    'country': 'السعودية',
    'countryCode': 'SA',
  },
  {
    'country': 'Senegal',
    'countryCode': 'SN',
  },
  {
    'country': 'Serbia',
    'countryCode': 'RS',
  },
  {
    'country': 'Seychelles',
    'countryCode': 'SC',
  },
  {
    'country': 'Sierra Leone',
    'countryCode': 'SL',
  },
  {
    'country': 'Singapore',
    'countryCode': 'SG',
  },
  {
    'country': 'Slovakia',
    'countryCode': 'SK',
  },
  {
    'country': 'Slovenia',
    'countryCode': 'SI',
  },
  {
    'country': 'Solomon Islands',
    'countryCode': 'SB',
  },
  {
    'country': 'South Africa',
    'countryCode': 'ZA',
  },
  {
    'country': 'South Georgia and the South Sandwich Islands',
    'countryCode': 'GS',
  },
  {
    'country': 'Spain',
    'countryCode': 'ES',
  },
  {
    'country': 'Sri Lanka',
    'countryCode': 'LK',
  },
  {
    'country': 'السودان',
    'countryCode': 'SD',
  },
  {
    'country': 'Suriname',
    'countryCode': 'SR',
  },
  {
    'country': 'Swaziland',
    'countryCode': 'SZ',
  },
  {
    'country': 'Sweden',
    'countryCode': 'SE',
  },
  {
    'country': 'Switzerland',
    'countryCode': 'CH',
  },
  {
    'country': 'Tajikistan',
    'countryCode': 'TJ',
  },
  {
    'country': 'Thailand',
    'countryCode': 'TH',
  },
  {
    'country': 'Togo',
    'countryCode': 'TG',
  },
  {
    'country': 'Tokelau',
    'countryCode': 'TK',
  },
  {
    'country': 'Tonga',
    'countryCode': 'TO',
  },
  {
    'country': 'Trinidad and Tobago',
    'countryCode': 'TT',
  },
  {
    'country': 'تونس',
    'countryCode': 'TN',
  },
  {
    'country': 'Turkey',
    'countryCode': 'TR',
  },
  {
    'country': 'Turkmenistan',
    'countryCode': 'TM',
  },
  {
    'country': 'Turks and Caicos Islands',
    'countryCode': 'TC',
  },
  {
    'country': 'Tuvalu',
    'countryCode': 'TV',
  },
  {
    'country': 'Uganda',
    'countryCode': 'UG',
  },
  {
    'country': 'Ukraine',
    'countryCode': 'UA',
  },
  {
    'country': 'الامارات',
    'countryCode': 'AE',
  },
  {
    'country': 'United Kingdom',
    'countryCode': 'GB',
  },
  {
    'country': 'Uruguay',
    'countryCode': 'UY',
  },
  {
    'country': 'Uzbekistan',
    'countryCode': 'UZ',
  },
  {
    'country': 'Vanuatu',
    'countryCode': 'VU',
  },
  {
    'country': 'Wallis and Futuna',
    'countryCode': 'WF',
  },
  {
    'country': 'اليمن',
    'countryCode': 'YE',
  },
  {
    'country': 'Zambia',
    'countryCode': 'ZM',
  },
  {
    'country': 'Zimbabwe',
    'countryCode': 'ZW',
  },
  {
    'country': 'Land Islands',
    'countryCode': 'AX',
  },
  {
    'country': 'Bolivia, Plurinational State of',
    'countryCode': 'BO',
  },
  {
    'country': 'Brunei Darussalam',
    'countryCode': 'BN',
  },
  {
    'country': 'Cocos (Keeling) Islands',
    'countryCode': 'CC',
  },
  {
    'country': 'Congo, The Democratic Republic of the',
    'countryCode': 'CD',
  },
  {
    'country': 'Cote d\'Ivoire',
    'countryCode': 'CI',
  },
  {
    'country': 'Falkland Islands (Malvinas)',
    'countryCode': 'FK',
  },
  {
    'country': 'Guernsey',
    'countryCode': 'GG',
  },
  {
    'country': 'Hong Kong',
    'countryCode': 'HK',
  },
  {
    'country': 'Iran, Islamic Republic of',
    'countryCode': 'IR',
  },
  {
    'country': 'Korea, Democratic People\'s Republic of',
    'countryCode': 'KP',
  },
  {
    'country': 'Korea, Republic of',
    'countryCode': 'KR',
  },
  {
    'country': '(Laos) Lao People\'s Democratic Republic',
    'countryCode': 'LA',
  },
  {
    'country': 'ليبيا',
    'countryCode': 'LY',
  },
  {
    'country': 'Macao',
    'countryCode': 'MO',
  },
  {
    'country': 'Macedonia',
    'countryCode': 'MK',
  },
  {
    'country': 'Micronesia, Federated States of',
    'countryCode': 'FM',
  },
  {
    'country': 'Moldova, Republic of',
    'countryCode': 'MD',
  },
  {
    'country': 'Mozambique',
    'countryCode': 'MZ',
  },
  {
    'country': 'Palestina',
    'countryCode': 'PS',
  },
  {
    'country': 'Pitcairn',
    'countryCode': 'PN',
  },
  {
    'country': 'Réunion',
    'countryCode': 'RE',
  },
  {
    'country': 'Russia',
    'countryCode': 'RU',
  },
  {
    'country': 'Saint Barthélemy',
    'countryCode': 'BL',
  },
  {
    'country': 'Saint Helena, Ascension and Tristan Da Cunha',
    'countryCode': 'SH',
  },
  {
    'country': 'Saint Kitts and Nevis',
    'countryCode': 'KN',
  },
  {
    'country': 'Saint Lucia',
    'countryCode': 'LC',
  },
  {
    'country': 'Saint Martin',
    'countryCode': 'MF',
  },
  {
    'country': 'Saint Pierre and Miquelon',
    'countryCode': 'PM',
  },
  {
    'country': 'Saint Vincent and the Grenadines',
    'countryCode': 'VC',
  },
  {
    'country': 'Sao Tome and Principe',
    'countryCode': 'ST',
  },
  {
    'country': 'الصومال',
    'countryCode': 'SO',
  },
  {
    'country': 'Svalbard and Jan Mayen',
    'countryCode': 'SJ',
  },
  {
    'country': 'سوريا',
    'countryCode': 'SY',
  },
  {
    'country': 'Taiwan',
    'countryCode': 'TW',
  },
  {
    'country': 'Tanzania',
    'countryCode': 'TZ',
  },
  {
    'country': 'Timor-Leste',
    'countryCode': 'TL',
  },
  {
    'country': 'Venezuela, Bolivarian Republic of',
    'countryCode': 'VE',
  },
  {
    'country': 'Viet Nam',
    'countryCode': 'VN',
  },
  {
    'country': 'Virgin Islands, British',
    'countryCode': 'VG',
  },
  {
    'country': 'Virgin Islands, U.S.',
    'countryCode': 'VI',
  }
];
