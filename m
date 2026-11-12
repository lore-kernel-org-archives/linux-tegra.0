Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794485448;
	b=1VBE7mr019i3f5rhZat+t8SLIeyT57xW9TC6phzYe52Z13P5up3l9QMhXHMUn3RKxVCZ
	 n6jTdUKsHYWBtlj4mzcZkBaC20We+SsHcbUxUjv7z8VUrauU4ZfxG4uEjQT3cCY+T4H4x
	 L/enJTUS6tQqi1251uNCLfc1lKPSbEtfp4fiRkX4SlD+tkBMDJ91MKls8+YzUrIvDZHml
	 ixYTC1xL24K4BgvJ0RlKd20viYqIqQo/FgHCUOj3oYH8sb0rtAuClzc8CNCx1wYxgYuZ0
	 a4qvm9G6Q8riD/WgnzPD8upvZW7isADCgPgCh6ujub2LgVxXN6fH3WmAOs5OT8isLiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485448;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=VRc1O/KptW7u1eWS0ywoxWj4ok5WchOm9R7k/cXglP0=;
	b=hbhyHsAkMcP/3q4eM8IKhHwPrCsxdM90VcPVFt0RmuTRN2tyE8SgaAWKvc/Dw+gzL+fJ
	 b+KJA6UXP5juohORVBOVaYOkqAigXH6RzAaaz2HGPBfH9590348rP8HG5iYdDY/Crc9yN
	 bltYJ6Mp71aOlFaj8fgoBNttHKoCP0Xs3tzYFeHjcxPg8kcA5CwIC3gJA5EUDD8dSZrFK
	 rvEw3+CARI2HUrO5XqvtqwU7HrayNKhfKkhUzId28s4X10GQkPeNnv7RS2WIMuUAjGrsn
	 FbpG938VDPY3rEhUDtQc5Z+xDppw5zFHA6NIms2Ndo+2Nk/kH0o7VIdrf32goQ+4BKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lVDdGnRZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.1
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B61606A321;
	Thu, 12 Nov 2026 12:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lVDdGnRZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyHBtpTE1oGnihcWr/cz4qPAAMBrf3IWIdvgHV4N8PPefl1PHHFgbhQOPc+E1f7OgoGrdDQH1euURMcSpFLRyqHV82+wHi7T4bxmECB5DMJtmkqWBk6XgKUsweCJYvRIz/Q9x7VSHdNT2jKbMkVmNpPitv3ng7TlgZgj54/Gc51n6mBkK4R8y/nR0PB17OqPvl/DHarjbOPAyKknGijexIkWlGKe/zo0w2we6rsfVAmqPU/jYo6PyB8y4r1i/5RjFMCpTt6H8WBxf6dg993FDEoPP8YM2/2wwPLqoaJXdwJoFM8KG5xepCg/XKvIxcR2f8dj3n/VVVh8tfAd594tWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRc1O/KptW7u1eWS0ywoxWj4ok5WchOm9R7k/cXglP0=;
 b=jH1lLZmhYFsVJ5Ytqa7eJ2400PJfskaTUoTO37DdlX36Tzjb2OTwDGdR/K/pC4OckkuBlJgflopz3LuUJcqAZEbO6iDv5PZ1tAAHg8s+2e8Z+dyC7Ny4FGmoAmQESiIJTcW4FRnBV04Pp7ELN0fj3xKYemOvToec1jDX27cMYbnCAmQPP3hBXYQMpjY8gCMxB8Usbc9t1c2rEinyuSHt1P+SptLoyAycZ7dX0xeFRd4PIUZt79eeRFYx/jD5cVrZHJIBeAaTv5jVlq0ixb09Vd9+1ylcJJ1TW4gUwZp/5WlrR4gGw5Cr8jYaZ0cwajp78VPpfYLrkCRXXdJ90kHFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRc1O/KptW7u1eWS0ywoxWj4ok5WchOm9R7k/cXglP0=;
 b=lVDdGnRZswlmXIr+vXbg3Hobh5CLIoqxKb0dZBEXawi0faJMz+Ays+PKMnIU2GZ7fOsVMBSvHc3XQaIcEQlNyzyLbi00Vyse4/NVYta7a6pS8Vqgam4ULebmVSH5yTDoqfB8KPexWWY159ehzTwDWufx17IM2q9J0HKkOsOSD6CZHQawJ5TWDqsaZC3YxYS/kSgFMg25ZoTinoPlt6+oJHJp20WvjOPhsnBwLRBVCDwvRrMnmLTzZotHyGMUCcpNOnfkm8uqc3FnDTNsA6y08ZeIFutNs1GPEdFp56i5H2UBXtlWH2RSQfMJSGsZIN1JgB68VHB0DLisaGIpb7xBnA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.13; Thu, 12 Nov 2026 12:10:43 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 12:10:43 +0000
Message-ID: <2dcd68e4-20a7-4c75-80fc-edcdf877b917@nvidia.com>
Date: Thu, 12 Nov 2026 12:10:37 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: tegra: Add Tegra268 AHUB support
To: Sheetal <sheetal@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@kernel.org>, Mohan Kumar
 <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104112055.1101243-1-sheetal@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20261104112055.1101243-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0155.eurprd05.prod.outlook.com
 (2603:10a6:20b:496::8) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|DM4PR12MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c3930-468c-448b-ba07-08df40b5f992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|10070799003|7416014|366016|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006|261028144727099003|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	quKdZkYwMGgXM6fmb2wmbd+E8O96xGAWDeo4EoxPCftj7K9bavQ0v5jruB8V7cpQTGrAKXoqVC4URZcd7kVk+qbdwSsa8BCN7IA0gBa/DAXdt/BmfL1AAKNyb9rwbDGZAtKwSmOi0pd72+m4pGfrz4K4btsLAiCAYtdnmnStyh8xZScfcgvPS4ioI6l9ttBnInX8WP5vCvdQNOZ7Vp57g38S7vEnMc7gaykQUgMj0/1uQVQvAim8QYHKX8H8cVhvO6bxK0TpIofZD+WOHKHTpB3lAL7BARVK/I9w2u6sQctJhRskHFcw7my87zfZC6J0Sey89M54pmvVSwb7NN9YZOKMR4IHNoFZgAomeHQjT4XThHDjwXtEG03Q1rM0NENoNH4wtG1E6TjimsisTe+1a0AxHKrALYiVcKjolDBEQegKW2Cwdq9Rb7cD4ruldcbAOfFYaHpv+iffb14C+uDrmJ0oPOdf4BU3HrR5GkGbSwEpqB838CvaoWf4JmImQl33yBAdUxGsKnQBk/3EUY0VVs/4mNI66gYk8nhoR5ntm1x30m2rl4LhNZVc04kRMTtAezXDIx9muJ6ae3bHrjPIB3rSoPpxQA8fIi8xG8T9xgz4ISnmrhrPbcvemQN1F+UHnjDcJVARqHiTniYcUs1ASvJJY+6Ai3ksc7Y+TbpuE2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(7416014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzUwWXoyMnA3eFFzc2o4eDBXaXVLVld4T3lhZzZnMGFoYkd3cE96K0NjUjNZ?=
 =?utf-8?B?dnhwOERUTGZMejFIUDBnSm1xc2F2TVR1bVhxajYxek5leHNxMUIxeHN2S01h?=
 =?utf-8?B?ZUZPS0dmNlYzQWtidldJUFVFNWFZeTVMUzN5R2dlb3Bab3VaNzJwdzAzOW5K?=
 =?utf-8?B?QTQ4dVJxczFuT3U2dGNkY0hHNWwvOTB1b082SFZPS1V4SWI0eHdZeVhOWXFN?=
 =?utf-8?B?RE5Tb2lCTUdyWkpjT0ZDUUZ1NFkrQ085VWxxMmtoLzdZQndmbGYvUE1WakpT?=
 =?utf-8?B?OG1NZ3BSRjBqK213bGNQUm1OQzh5bTNCUG5Fb2VRNWwyOHgvUGFXUjlqM3Nl?=
 =?utf-8?B?QWZZdi9XaEdIbS9aVEVnNnc4dVN6dCs3OXFUN1ZpRGJSM25qV3Q5OWg2ckUr?=
 =?utf-8?B?eGtReU91TzhoZnhNTDc1QjZmaE9nalMxQklCSjVSSzROb2s0K2xXTVVCWWJR?=
 =?utf-8?B?QXEwaWZIS3l2eDFFRkF5emZhT2dGS0YrdWtyRnpzUDFKb1RMNCs1WmhlY2VP?=
 =?utf-8?B?b2tIamdSSXg3NE1FWUVwZmhna1lsQURVc0tLbmVUU3Q3QVJFdVdSaDJMWlhW?=
 =?utf-8?B?QWQ4WHp5RkhoL1BDbEQzN0k5TXNsWWZNVm1udXlLRDNQRWpFdUNEVld5bDJT?=
 =?utf-8?B?Q2dtTDk4Y1hHZW5XQWhLOFkzZG5NbkI1QUVDSE9pSlRqNDd1aGhIc29YejQ4?=
 =?utf-8?B?UmFmRWVuUWtYYVJ1YXJUZDQ0UllVSEsxU2lxR0p0b0ZGOGQ0cGJwL3RHb290?=
 =?utf-8?B?b05DZ0o2Snd2UU9VTUkwL0MreUNXZ00wWDIxdmxLL1FaTHcyRE9jYXFKbVRI?=
 =?utf-8?B?VXJmakJaK2hPWUxteXU3RGlMaVpjNEFjWW5NRVFxWEc2ZFdyUWZpT0xKZVlD?=
 =?utf-8?B?ZGFqUXVpbG9saFB5dHh4U1ZyZEszeTU4S2VnZnZzYkdzSjJINHRWcnN4eTBF?=
 =?utf-8?B?UVowQjFrMmpxUEFBQ0d0UG1kV3FYeDkxM3cyNjQ0Y1Vzc2E2bnVOczBZZi84?=
 =?utf-8?B?YkZtT216TjhEdFZqTk1xK1E2cUdNbXV6SWVYcW1vQW42d0lrMzluYXJqQ1FB?=
 =?utf-8?B?VnhqczhMczFtcDhPK09vdm9UVFB2VWVGdmlMMEVPVXd4TmxqeHJwaHdsZVd4?=
 =?utf-8?B?VlR2SDQrUTZVWmV6SlNuYU5hYmY0Tjd2TEMvaU1uS2FzRGRxODBsU2xMc25q?=
 =?utf-8?B?dlJod2k0ekl1RDlhKzgvdndTazFiTmM0SVdMdzY3TElSTGJHdEJ2bHdxeDBp?=
 =?utf-8?B?Vnh2bHNpSWIvVlo2Y3BSelhHbFZFTmlWTEVGZWYvNXFTZkwrOGJ1MU9zOGJS?=
 =?utf-8?B?TUZ1ZGhEQUhvcTEyYnMwNW04Z3JOS2krMW5lVVhsMTRjSXpEZGNURlZrTGM5?=
 =?utf-8?B?djVmek9JWjZMRG9pbSt6bmhlSFcyRmgzenVjQ2lXaE9QT05za2szUVBaNXUz?=
 =?utf-8?B?dGIxQ25ldFFoMXlYaGFuU0tYT2FFNjljYkI0aGNBNWU5VmpicTJuaXpaY1g1?=
 =?utf-8?B?T2tSaVh2T1E4TlF0VXVCL25Cc2ZqWXhuRk1vaVhFWDl5MlVlakpsU09lQ2tZ?=
 =?utf-8?B?aUZLOTB6Y3pCOHpjd0srUjJvL0ErL3dWcDN6aHg1SkJudWMrUHRyY0l2eSsz?=
 =?utf-8?B?V3BSeGJBcXU5bXdhY09nT3BtMWpkMDNPZlJTRHJZekpDM3VDUkxtVWZNSGV5?=
 =?utf-8?B?TGdUWTVDZjUzM0U4SjNpNVdER0hocWU2clhDZklFS2ljVTJ4UW1ZV1hZWWNL?=
 =?utf-8?B?bUUyYVpLeE42NUp0NmQ0a3Y2QVJpeTZsQ2pmK2FqMFZBSGg5Mi92MlZFM09z?=
 =?utf-8?B?MHg3V1dTL1M1THVkVVpyVndVZzZPM2F2cXhvcFNBazB4ZnN3WU5jeDJ1Q0x5?=
 =?utf-8?B?NVFmMmplWVVuZGJ5Y3BtQldxbjhmNXVCRmkvVjNwY0laeWY2Sk90Uzc3OE05?=
 =?utf-8?B?c3hJNTFEMTBhTUFta3l2NmJNUDQxQ3lZcHA0ZjZPd2k4THZnV1lLQnZlZFpP?=
 =?utf-8?B?bi9yeTBYTHFEaVFGS3VQbzNIMEF4Vm00VUkzZTFLaU01cG5kSHpidFBiV1Vs?=
 =?utf-8?B?ekQvcHJqRDk4bXhJZHQrYkJIYjA4OEg0RUI0bUdaZHpJWWx5Z0FkME1sbWh6?=
 =?utf-8?B?bUJSK0Q0enVNc1VhenpaNnJZbVNOeTFuSkhnbmV2RGpHT21lVnBwbEdnTGVt?=
 =?utf-8?B?ZGpXZ0FmZzJvVDl3ZzFHakV2QjYxenBqUU1YQ0JTYU8vay9NY2Y3bTRxZGhY?=
 =?utf-8?B?K1FENDNGb1pHVHNhWHlPNkdSd3NUVkVJVWFIL09iMGxRbDlKWHRpVnhBY1RD?=
 =?utf-8?B?dDNVWGlxeFQ4KzFjQ1hacWJ4NHQ5bjhHYmRKamx1UVI5dmw4eUJ4bmVRU3Fl?=
 =?utf-8?Q?vC7ATIRFE+zZF79Lhru2QquUbuQW/XoPtwUnY09d0H4HG?=
X-MS-Exchange-AntiSpam-MessageData-1: kr1GJV7/c6dlXA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c3930-468c-448b-ba07-08df40b5f992
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 12:10:43.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMCvq9y7Xyk7zfeECEciSJFfNfvQQDhEZCFJNRdvxFScdOhkZkemUQsfEEbZiExnjoq65K39A7hy6KwRolvCYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542



On 04/11/2026 11:20, Sheetal wrote:
> Tegra268 has fewer AHUB interfaces than Tegra264: five RX and five TX
> ADMAIF interfaces, five I2S instances, two MVC instances, and one each
> of AMX, ADX, MIXER and ASRC.
> 
> Add the binding and SoC data with DAI, widget, route and mux tables
> matching this topology, so the driver exposes the supported audio paths
> and uses the Tegra268 register ranges and source masks.
> 
> Anupama Kunkulagunta (2):
>   dt-bindings: sound: Add Tegra268 AHUB support
>   ASoC: tegra: AHUB: Add Tegra268 support
> 
>  .../bindings/sound/nvidia,tegra210-ahub.yaml  |   1 +
>  sound/soc/tegra/tegra210_ahub.c               | 347 ++++++++++++++++++
>  sound/soc/tegra/tegra210_ahub.h               |  27 ++
>  3 files changed, 375 insertions(+)
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

