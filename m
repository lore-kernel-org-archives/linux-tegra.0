Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043A839847;
	Fri, 12 Jul 2024 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720774910; cv=fail; b=MD/803OVxTDNQ1l09FmzveT6zq8XRKP84hCiYOH8usdkQvb5QlxH+Ec/wPQRPMcy0fKvVgpy/OZiga7GEsZeTToiKWGRSFuWMtHTmuaOAzYIIq5mFbZVjPGiTqrgAX7/s6IQDsSgMq63A/ZPbZvvoS+PtRIn1XsnyCwwfIqluRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720774910; c=relaxed/simple;
	bh=T+/43wfZsCdYjg2Er515vXS5DZT0ale2PcLgNOQA8II=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WL1kHBefkMaQWPSb5aCuvNz3xdhkeyWfSFYeIjqkWX6hrxrExEHBUvb+kQlMGn9uoErGO5In9XQlLa0GE0TRIItnsPiGICM8LmdIpXZ+j/s77jqHprLn0UcXtwDC+FBliZ7lFg4szlT/e7e+44CQwyKWZlo6a2TM2EqNKJESMOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UZKVIQBS; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UZKVIQBS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L2rD9k/q1dFZTRSE9IAmEAW3mhmCj9IVKcUzrmLlCYh1EnW8YhB9C5m0elqrp9MSBlXeKmJcN5clB3eBSlYsV93N3M/Sc8Wc7Lrs+7dAQ7S/zfxCplbzXSw3vOwdoDN3pr4DmTeMkpk1V5iWwBCFOX+IInFbv3oeP4VP5VlxCAkz9sVKqe7DI8HR6g+BfIJGOPtcFL0Jyb09adz8pjcLi6HD1cVfgSmhLYhO7iudw1809zf4i6tlvTC/M0mhYy7br3gKmxTx+fGHlAducOyvFQRIaZG2zeK61zS5Xlscae22F4ErNnm2djzgYTHOdDkSEM1jApto60HsFn4e6X1lBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csNyvJ7PImmPJeXMA5lF5ZX09E/NuE1UmAGCCQyZK2A=;
 b=bz4FmLCFhSmthHYENsdaBnVbETPcIss9cLe7uemfUTQ07ltfGPl1OzgcCrvQH01y5WDs08K9ASGJTUUiXSD8O67Mal5b0Fc8MeP0rff+w616moPAR41GsCW807I03XA1l53nT2KlRzZsjvJBAGm8cWaGdjxvMPIU3g+MnrBhJKtfL5bSWL1nWgefutAen4D06gS3CxnH4xWJYZWXwdTAllw6zRxOX1rrssnOY4kRevW9NjVdMhUD9fC3XmQ4mR1iMFGQxYyfKXluvQJQfcPIwrVV928eIkpvPSFyoJWyVSTXW2PE2mkm4D2HwfHYtZR+ZI1aaT14/2RmmjyLjuIZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csNyvJ7PImmPJeXMA5lF5ZX09E/NuE1UmAGCCQyZK2A=;
 b=UZKVIQBSm3UD+k11bOvTm0h+w2dmqqD3JUVq1TaaWTc9vz/VVqvsR+eC9f+toSr6eI4wQJMbgRvmAOzjV4zPfdxaIUZaSVzgikIQP+Ahbd7acSvBCsURRXEW4xMBP8jg4sq22+wuQCcApqkznnQAc3sXYcAhxzPpPmmJbYqFI3Ss8j3U1328TBxky+I18J/Z17v8p6N4pfUknlDaurKfRk3jlowxPOZKJ0axrGV70n8hW77pJbC2ic6UY+rigdg1334c8EwnPWifufX1vHpQ/jxuRwYQHoQaEzc+9sPzgqZ/HpPPwtaB62tjQW4UTmgxPdWBDbIQdgVXM3KDCEZZ0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 09:01:46 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 09:01:46 +0000
Message-ID: <ae0ca269-468f-4538-b7f6-bd07317efa09@nvidia.com>
Date: Fri, 12 Jul 2024 10:01:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: tegra: enable same UARTs for Orin NX/Nano
To: Vedant Deshpande <vedantd@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240711171101.2798971-1-vedantd@nvidia.com>
 <20240711171101.2798971-3-vedantd@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240711171101.2798971-3-vedantd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0036.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b21183-25a2-43bc-82dd-08dca25141ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVBPazZIN2VEdWF1cFNDMHBnUFhydXkwa29MblhsTHVDelI5czBVdUo0Tkpn?=
 =?utf-8?B?TGlCUWhUTVRPWEZOTU5NRDc2bUZjU093WXJINE5yV05vZGptZk1oUStiRDJL?=
 =?utf-8?B?U1M4YVplM1V0NkNPQ2YyTHFrV2tGZ2tJdk5TQVhZeWIxQnh6QmZrME9TZkFk?=
 =?utf-8?B?cXFGbnFwVDFRZ2FQaFpLZW9hRDNER3dSbk9JZnV0VjhMVHdXUVh4Y0NibURK?=
 =?utf-8?B?eXJUTE1LQ2duOEp6dG1CQ0lQRjFOSGNheHFjbkRLbHR4dkpFWUJUT1VlazA3?=
 =?utf-8?B?RjBPMXBRbGdOSnBDQ3hNc09qbDk5K1dpeVN6RjNuOGtjQ0ZnQjN5elZIbTVS?=
 =?utf-8?B?ek04RktER1FObHJhMjE3dnVUOGZuUEFDQStFSlI1c3NKMzFkaWNOZkhicmx2?=
 =?utf-8?B?c1ZjM0NzTlgvUGFxM2pzU2tSTUZvcFkxeU1lcDNsUXNlTk9IeWlFKzRzaHM2?=
 =?utf-8?B?S2U2LzV5dFkwUThZL0dCay9KSHpvNkdSNUFiWE80KzNaVTFCWWZVZnRKOUlm?=
 =?utf-8?B?QmFMclNwQVE5TDY0dCtHU0JhUnE0c1Z2SFJ0Vm5RT3pXd2VTV0FRdVV3SVV1?=
 =?utf-8?B?TXlvUGR4ZkxWMGdYN1JDK3hDWmJzUkt0NVlRZkN6WDdmY2s3aC9hNFMvR2h1?=
 =?utf-8?B?RTBYWWNycVlMcE92ZzIyczloMEVjT2RmanBEN1NPL3hNek9DYjl6QnQ3eTJH?=
 =?utf-8?B?T0EwMjZSa2ZwTkwvMUw5b010VVEzMERaTzlhZXYrcmREa2IzZ3hQejMvY0hW?=
 =?utf-8?B?L3hDTjlaaHN3TG9XWk15dWFxZWYvUWN1S2Nua3N5THJsZUd4eWM1alVTMkgx?=
 =?utf-8?B?UzBTTTVjSklhVjU1QUpUUU9kV3QxTHJlZ1FTOWYxMWRPQ28rTVlIYXQzRExv?=
 =?utf-8?B?TytXSUxIRlNyc0JUemtrQTVhV2hMQ2V2eXhsT3pVcXBLU2xraU1PdzNVUzI2?=
 =?utf-8?B?YUxxRThQY25YakRwUW1EMWwxK1U3cmZhZGNHdytSL3dJakZmSEV3ZjdQeE9K?=
 =?utf-8?B?NnlGSVJWcU1jUWdCTk1sMXZtS0VOR01aNW9IRnNNbGp0c1VkbVFRU3dabWdQ?=
 =?utf-8?B?bTRkbWlkWXp3cWVRNnNUKzEyM1U3VmhoeVRzZFlQdlZZWXdMU1hYd1hXdGNZ?=
 =?utf-8?B?ODNBWFJMY1IwOVlvQ20wM0tGcmdXckc2SXlrZWhpQXI1UHVWWXZ3bktueFpW?=
 =?utf-8?B?SGdvWTNKdXo3WUpvbDFMeThCcWFPTWMwb2JzSnkvekpKYis4VXpWd1BuSU9G?=
 =?utf-8?B?Z1VDZHMzVldsZmQzNU0yN1lSS2NlQ3c2bVlCOElKYndmZnljcnlITjR0akYr?=
 =?utf-8?B?aytIb01Od0RaQUswTkpmb2dnWEU1OFIvclZVTXlnWDVuMFdNcWhFK1JrZTZO?=
 =?utf-8?B?M2lEd3c2Wlp4NnpCeVJwOW9Xa2laN2dzcHY1RHRoYVR4d2NwVHMxdVNLWjE4?=
 =?utf-8?B?WFJZUlI5U0x6Umd2S0ZOK0FKay9GRC9uN0trdWx2MlNHVkxhT3NoNklUUjUr?=
 =?utf-8?B?UWF3cTZrSHpZNlRqWW9XU3pUVEtBbFMwaFdjbTdxTzNkc0hPNElkZjJhdWd5?=
 =?utf-8?B?SkJRTG4rMklHcmJ6dUduOExsdU5JbFQ4amQwcGVNREdUK1k3KzZmVXh1dHhN?=
 =?utf-8?B?TFJXLy84TElzUEt3NjVLOE1DSDFXWDRtOU1pbVlpekVua2l3VlQzdHhCdjdU?=
 =?utf-8?B?NXl3ejhnV2xXK3NsaEQrMTVzeFZqOHZNSnU4eVRnamw3UDZuWkFXWXhZVk9W?=
 =?utf-8?B?dWtkdmpGajcyemtReWJ2d3VZcjlpdEdZZy9vZVExaG1jcGVUNC9WMzlVRHMx?=
 =?utf-8?B?ZjUyWXRsN1pYT2ppMG9Ydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXFyczRmdmJ4czZoV293enNUMFEzbWt3bXRtVS84Sm02TXZvbnNyS0VWaC9z?=
 =?utf-8?B?WE9VdzNTNWx3b0VwMWJCRHN1QmxxRGx3MWdwSnEyMmluWEZIcGtSUVRBSHhk?=
 =?utf-8?B?d1RmT0xOMnhKNkJnV3FFZU5kc2ZsQ3FKRUNxZnc4eUExekhYcjBLMUF2NFFY?=
 =?utf-8?B?WUlRakl5V09XNUdOcjNoYTBhNnFXMGsxbGtzUWprWmFpNkhCd0dxN1Z2ZCtt?=
 =?utf-8?B?SEJBMlN5c2tOYzZFNEJkRXFYSU0yckdHY2NUVDVLSEZ1L3dmQllPWjlhUzZY?=
 =?utf-8?B?cHpNOWJ4UUFSREEwUCtjZVpDTks3S0VuY3dsSmZYL0h6YW11cGplcmh5MGt3?=
 =?utf-8?B?UkFqU3ZRL3UycEg2ZW5KMDc4VStUaUtsQkVyODNMSXlOZHY5YVlJdnpTV3pv?=
 =?utf-8?B?RHZFaDRDMVJFZVI0aThmNXpSajhicldibU9xcWljTnFsYmxyL2p5S3NOeWgx?=
 =?utf-8?B?cEdCTXhzZHVnQll1QUhBcy9USWpDNTFpMFA0VncwNmQ0bi9JeUpabTgrMG5k?=
 =?utf-8?B?bVpXcDBJVEg1QmVzZHptVW9COGlmV3pFbm83SzZzNlhtNGFmRkZTQUhOTlI5?=
 =?utf-8?B?emZHSmFUNlZxODJZa3hMTytDOFBERlpWdE85TGFEUjlEM0lyN3dKYWF1WURS?=
 =?utf-8?B?ckM5WmNDa2xNbDdtR3gzeXJSNjNtSkZtRWdFaDBTQXdTcWQ1OXRDakkxUzhV?=
 =?utf-8?B?S3dha29CVXRaeW1KQTdXK1IxdHZIejVvQ05Hcm9TdWkxNUFUeHRXRVpZUmxs?=
 =?utf-8?B?dkl5KzVrZGNHNHhSZ3BESFNrZU52Ui9KbGZkc0YvZVVmRmhoVkRObmJmUjYx?=
 =?utf-8?B?RlV4VTcrVEZRTnVZQ3NrdGREQkxXWWhPMnBPSUtpYjAxek5CU3JvL0tyU2Fn?=
 =?utf-8?B?MUs3SGtrbUU3UHdsUWMzRzhrSWZSbGUzZEFwbnlLdWcwWEVZbExSZ1B1Yi9U?=
 =?utf-8?B?bVBiSTh4eVQyTThwYmhOL2RSdGxUUGZGYVI2MFh0aTYzTzJXL2d4Z09lMnB2?=
 =?utf-8?B?eHg2SE9qTmNnankvMWlwWXFDTmRjcHBiR1JmbHRncEMyaUY1empEN3BKWjNy?=
 =?utf-8?B?OUNKdWFSRnEzVlNnQ1RzbFF6VTkrb1huVjZVc0hXQ1JNbUNyOFdmYkk0dzFE?=
 =?utf-8?B?aVhnSFFCaTlxNGtBMjRqdlhzWWs2WTBCRVpzcWw3Y1QxQlpBM1ZLazFHRXQ0?=
 =?utf-8?B?TmJRNzJZdy9kbHRJK1A2U041SjUyRSt6WlNCbVE0dlkwUU4xb21GdnMxcnZG?=
 =?utf-8?B?Z2R6dkFFTjRYSGZnaXJpbEUwNTlnVzFTWU0vKzh4NGZ0ZDczeXd3TUt6b0o1?=
 =?utf-8?B?MUpjbE11MnU4U1UrUnBYdWhtWXFyNkEzcmc2WmhuU2txYnJTaVBRMUtFRGhQ?=
 =?utf-8?B?MGgzbHdFRVRWWno2eVp4SGZpSjUyT3U3d0p4SmhaNTBpL0E5cmdmUURVYkty?=
 =?utf-8?B?V3d5S2VzTEkxdG1HYno1NFpvWTJUNGRMdE5QbHJOR2RhU0Jic3Z6WWI3cWZC?=
 =?utf-8?B?SU0vbThNOURmRXJTY1lmL1pQVHJIQWZlN0lBOW00R09jLzlKazFXak8yNVQ4?=
 =?utf-8?B?Q2E2MytPaVdXWkVTaFJ2dklMWUdiSFpBVmVtdzVqNEk5amx1enRhM0k0Tjhp?=
 =?utf-8?B?OEFpUjJzSkUwS2VXSVBvWmpmRmtEd0pKQ3gzM1M3WTRIOHBEMkRLS2d5by9B?=
 =?utf-8?B?eGh2UVpSM2hwV1AwaExhVFhneUdRVGZqeTZtY2x2NzRLRnUyTEhFemZCNWlq?=
 =?utf-8?B?b3NCaHZiNHBtc2QzNjRNdU05MGNoWTh1QmxFMzB3eWF1eVgwclllNW5qUVhU?=
 =?utf-8?B?UlJMRnBCbHYzTHRjL0V2S2NJTFdyZFFydGs0ZG12N1VySlBWdENTdzIrZnZG?=
 =?utf-8?B?bER2ckhTVUJsaEtFSzNxT1g5ekdQTFZocXVWUlJiNkN2MWdaUTBjaGk4ZGo4?=
 =?utf-8?B?ekVrUDhSaHlpV0RUV2JpeThOcGNwMENSdStpaytiWHlVT3ovQnJBVU1RcWpr?=
 =?utf-8?B?bVdvOHZGQmdXUDc2MUtFaC9xZXVsQlJrY3ZJb0dmUEFtWDhjUXc2TlByZkg2?=
 =?utf-8?B?bVMrVXp5WmswTkN4V2VHb2tub0d6Y3hYMmVjNlcrZFRhdEV1dkoxZTRpaE52?=
 =?utf-8?B?U2xJYmNmRW5IcVVDQjA3MnpYaTdJWTN2RzYvUEgyQ0tJcWMyWE9jZnBjNjha?=
 =?utf-8?Q?yd7t8gE0eN48y9DQ/slS98UiQfimSXwp+/vKOZU8g4eC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b21183-25a2-43bc-82dd-08dca25141ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:01:46.0370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdGuh6UKjzD8nMQlwshTdsYbYC6hNGO7eiu8bwVN8BCMHcP8Ffm+Nx5KjPU0bkqb8Y1boooVYWNvZEz9A7WKrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995


On 11/07/2024 18:11, Vedant Deshpande wrote:
> This patch ensures that Orin NX and Orin Nano enable an identical
> set of serial ports. UARTA/UARTE will be enabled by adding
> respective nodes to the board dtsi file.
> 
> Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
> ---
>   .../nvidia/tegra234-p3768-0000+p3767-0000.dts   | 17 -----------------
>   .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi   | 14 ++++++++++++++
>   2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
> index 82a59e33c46c..5dc974bb360c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
> @@ -7,24 +7,7 @@ / {
>   	compatible = "nvidia,p3768-0000+p3767-0000", "nvidia,p3767-0000", "nvidia,tegra234";
>   	model = "NVIDIA Jetson Orin NX Engineering Reference Developer Kit";
>   
> -	aliases {
> -		serial1 = &uarta;
> -		serial2 = &uarte;
> -	};
> -
>   	bus@0 {
> -		serial@3100000 {
> -			compatible = "nvidia,tegra194-hsuart";
> -			reset-names = "serial";
> -			status = "okay";
> -		};
> -
> -		serial@3140000 {
> -			compatible = "nvidia,tegra194-hsuart";
> -			reset-names = "serial";
> -			status = "okay";
> -		};
> -
>   		hda@3510000 {
>   			nvidia,model = "NVIDIA Jetson Orin NX HDA";
>   		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
> index 6d64a24fa251..81d4f4f12ab1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi
> @@ -9,6 +9,8 @@ / {
>   
>   	aliases {
>   		serial0 = &tcu;
> +		serial1 = &uarta;
> +		serial2 = &uarte;
>   	};
>   
>   	chosen {
> @@ -16,6 +18,18 @@ chosen {
>   	};
>   
>   	bus@0 {
> +		serial@3100000 {
> +			compatible = "nvidia,tegra194-hsuart";
> +			reset-names = "serial";
> +			status = "okay";
> +		};
> +
> +		serial@3140000 {
> +			compatible = "nvidia,tegra194-hsuart";
> +			reset-names = "serial";
> +			status = "okay";
> +		};
> +
>   		i2c@3160000 {
>   			status = "okay";
>   

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
