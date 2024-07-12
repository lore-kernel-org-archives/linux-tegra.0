Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6BF39847;
	Fri, 12 Jul 2024 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720774886; cv=fail; b=VZfS9joPLSJPPSB8CtMDw3SdLSoEJMXqKoPb7w1R3lgDjxdFdyLmBocAD0RmsQNuXNJw2P983kNb920prpcM2ZJOTX3Shk3d0dbn1Dapu8HhaHNfufraQdIS0h4gt/QnS6eq2Svhz6s7aGr1x9DL61J6ZOoeEeriXV2SnNecKxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720774886; c=relaxed/simple;
	bh=OAjOImKqLdoZDfONg+m9UM/XG6sjqE+VcJCYX1569Qk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rzaxuEPYbH8GPJEK+3zlArOby/+gGZzWCLW8vS1J20yGG+EUI3An4JUucHavkWHNf5CFqxE5kCwYg2UIDp8tYPI5GfRs85tuyK9mAQXZ7yURvv34P0wKCww/1+EcKOuO/Z641J12ZH7oNAO7HfV9dUWu9FHosoYqdv3PcntK+Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wb7lWo6S; arc=fail smtp.client-ip=40.107.236.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wb7lWo6S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdPYgMM2f79c4kao8eraDfhEjQL9hZ8lgEkpYBism8fXcK070BdBiKxVaACFnm4y8FXTjKuQe6tONVUvuOdSmKjGalCNe1qQvmduYxEh4VaJ5w6A0JfZNIKiITR+8MDtSS24IPqW8RMtgd6H2RkrY+hMUnqnKMflmU2XulYBhvvXkLHZMawkN3NeYboHBP2kPwZmbHRLxzFi4vzJ6xuxOVCihW2UqPitapvSvnj4rMJptV4owjRgfSF4YSuynFb3sLLC8hSFsFsqB9InpY8A+PBr26dfm8XVSj2tDQxmM81TdTicubk3l9pMqQZitSglhH9XANHpV489tYGfet5MSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0amZaFVb2xuA3Y4krOZ0QR1QUi7JpGOJrLnCVRC31as=;
 b=sf5peRc2qfSNeiv5dS2HuDApikSQc6eRG666RuxjqkQLsP25Q+fGwClOvQV6rdc28y1IKzM/4Qw6ODIoFBqs6TDbMby/hMfIimys9dnhaLyeC1L4jXWM/O3DNCJmZXQxzW8Nc4rZu05LlhAYUHjHw7Gbwfp0VADQ29akWt15bIvObYBSD3wRtG3126xE1SFscuFEuiW731df2TK1hxHKimuW437kigorz4AP/Yxjy7ra5QkO+59tXBKigieHQ4GN8xxKlYmsBaoEtz/DIhaXki+gc+3mnhFxh0l1K/KoOKalyDE1M4HLlzM8sNZMURKPwWz1yowPsjRgTWltCQVjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0amZaFVb2xuA3Y4krOZ0QR1QUi7JpGOJrLnCVRC31as=;
 b=Wb7lWo6SlLtN1tTjV+MVNaPkZm/OcyaKH+URie/rB2C3UDPIVHFbNph5Wauf70BzeT9pnGJjojkq0mWSn5G2XaVIS/MeMryxQypBGmPa3fF166fliMwH33kAdujsXN/fT6jqFEZj21OHOuUgLtp0UdvztzOD2vxwnv6EJ2W4dDEqragGcgTUFjpSIEshk6Fc9Wgh/LZb/h+H6tSp8c5mhCCRCNcv3wT94zZmCYktrguIBZJUOwLNPbzybH5N7AQfu6EfUGNJiPfZm3Vj9PYvePS1FkXLlMve06kfkz+WxG72Mi8Tk0gQlY4s+K1tamYAHp9uTz1uelIfoGibHv06xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Fri, 12 Jul
 2024 09:01:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%6]) with mapi id 15.20.7762.016; Fri, 12 Jul 2024
 09:01:20 +0000
Message-ID: <a8215357-d6b6-4537-ad35-0356adca3b17@nvidia.com>
Date: Fri, 12 Jul 2024 10:01:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: tegra: Add DMA properties for Tegra234
 UARTA
To: Vedant Deshpande <vedantd@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240711171101.2798971-1-vedantd@nvidia.com>
 <20240711171101.2798971-2-vedantd@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240711171101.2798971-2-vedantd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0035.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::11) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 052d8160-7e4a-46ed-ed9d-08dca2513246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0ZuSk1SSnFjZlFjc2xBZ3BQY1N6ZE93NVBhN2JZei8ycHp4TFlHMlh6ODMy?=
 =?utf-8?B?bWpTRGtudEdJdWJRcmlmcnVGRnlTNUxZdVFENXd0dEZJSTRtOWt5SnRYcmtv?=
 =?utf-8?B?SUN1M0VuMWFhSW9GaWVCaTd2akxFSDhlYU4xR2tWSHNoT2cvNHBQUlRENWQ2?=
 =?utf-8?B?b1FUM1lzT2krc2hYczh0RGZYWW84WE9BTERqUGpVTlI4YytoZS9CN2M0TDZG?=
 =?utf-8?B?TVV2aW52S2ZEeDdEbzh4TTI5aWVCYWdxMUZBZExRek9wZENMVDBzK0hZZWF3?=
 =?utf-8?B?V1VlQnJldVBhZFp1RFNtVGVYK050OFZOeWNwbTVCQThPWUVEd1lzZEtRSjh6?=
 =?utf-8?B?UkJxL3JlTXR3VmE1Rm9IRTdSOWVQdSt0bkl3RTZ2bnR6OUc0OTl0S3o3Yys0?=
 =?utf-8?B?ZHJ6Z0NCTkUwWTBDWWdPSCtEbWk3SHZCWVovMDRjZkZxT0Z0V2JnV29OUGg3?=
 =?utf-8?B?WkU3YTRxOGJEQWFMdVhWSmpFbkFHa3o3T1hZbXFOMEVvZUxubm80Tkg0bmxJ?=
 =?utf-8?B?Vm5qYUJBZGxGOUplQ3hGZkY1UGFDb0VFRitWZzdNN3dUVlhiaHFOelRDam1j?=
 =?utf-8?B?UkZLcG9GWUpERENKUWw4R3hWNXhYVnJleFZicFp3WlBGUWN2d1VmSEhRVWg2?=
 =?utf-8?B?eWtXbUlWYWNIOEtxNmRPbkpZNFRYd1ZEaU43eWErWWJqZE40UTdORlZVRjlt?=
 =?utf-8?B?M1JRRGZZUGYzTmduRWNCQ0NmUGlmc1FJQnlkS0hBVjZQaGRxREJVUDIvZUh6?=
 =?utf-8?B?RURobExpSjcxWWx4VGx6WFJPd2xSWWJHV2NIY1BDRGxHR2ovUXV3eU1RdWs1?=
 =?utf-8?B?VXFXQ3FSaFk1RnkzWUdWLzJxM2VaV3lEcjRiZG5zOW5FNmtBQ0hWZTJVbDZC?=
 =?utf-8?B?WDBaOU5JRElDV0x0Q3RZNXlVeGhuSjVjSmhGbllaWWJWZGx2VDZLZ3NjUEIv?=
 =?utf-8?B?Z2tLQi91MnRUbzRtMXV0b1BXV3pWVUxzWnQ4RE1jTnNiMWpaUWpib2IyQUls?=
 =?utf-8?B?LzUzY1loaXF2L0svaDB6V1lVOHpDWGFLcFkxdDhkL01rYUZ5a0VPY1R3eGhx?=
 =?utf-8?B?TktTRjBISjJlN2ptVmVqelNINkRyNEJmdGNFSFhqWENOTG1iSnBOVElHbTAz?=
 =?utf-8?B?TU1KWjNiaE1oNmFhTHBpamYwRnI1M3QrVHpJKzQzL2VtbllzQ2tnTlprS0Z1?=
 =?utf-8?B?eS96SFovenFEc2paNFF4RVNiTUNYK2FqSXMzd3c4NnpPNGoxR2tMdDltZitx?=
 =?utf-8?B?VVRhMlVTWmN2eWt3TzhHK1lEUG1MblJIU1dob3JxNE9Wenl2dGJONXFTSnht?=
 =?utf-8?B?WVlSaDQ3ektkVm5tRHR0WmxaV0dVd0RPS0dQcSthbm1MYnVXYjM2dzVjM3ky?=
 =?utf-8?B?RFA1RkpZSDdhWUh5Qm1zenlUNmVCbi9pWjY5ZTRCUlBtZTFKbUU2cUhhTE1a?=
 =?utf-8?B?RHJ5WFpLazBCdkxMYzFGdk9IcjNEYnVJZzJZdjRHUWFiN1E2bEZRcWhDeWRJ?=
 =?utf-8?B?bWExYXNWOFB1NHhxZjNWU3VKTDcrcGthbklaZDVxajlkdG9IeXNod1dQM29s?=
 =?utf-8?B?TVdKZXdPU1dPbkpPanJXanYzN3lVUTgrNUNuQWIrYkZqNTdWc1NjTHRyNWVq?=
 =?utf-8?B?enJWQzQ0L1hkbTIyd3V0THNDaTJUanNMbnNqL3MxNE9tU2kwVVY5YnZleVM3?=
 =?utf-8?B?OXFxUEw4SXpoOElSd08xT21XU1YwTlhORnhpdkZlQy94Yit2Z21uNEFuMXpU?=
 =?utf-8?B?MmJzd3RQZnk0OHlrTkZWc2hUWWxDZ3F1aDljMDY2SDdVNHJ5SVg1UE5ZbHpV?=
 =?utf-8?B?V2Y2RXpWbFFyUzZOTFFIUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGlkR0RYTWdlTXpQYW9hbGRoRjZDYkx1RWIycHdDQzFYNHlBUDlUV3NNVU5j?=
 =?utf-8?B?N3JDeExOa01idkhOQ3VpcCtidllKeThLT1lvSTZCZU8zMW5Zd3IxeGFOckFO?=
 =?utf-8?B?S2E0UXRqT2dDSlZrOFhvdVpJUU1DN2Rhd29rVExWbUI4VWx0VGpQUXR5cGR5?=
 =?utf-8?B?R2FqQ3VTaG1JWndPQlI2N3hDZEY3WEVrNVlPcUJJSzlUaXlVNlplOWd0dUNT?=
 =?utf-8?B?Ri9JOC9KRWRYVGRDSk96WmJxS0d2Ty90bi9SN3VYVUp4VTk5UTlBZjRuMlBp?=
 =?utf-8?B?Y2c5cERwdFF2N0xlcTRxQWd1U3lXMXNDZ0JUejNZdkpoZ0J6SFdMaFJEOFJN?=
 =?utf-8?B?N04wemxVQkx5M1poeHM1Wnp0Zmdrc1o5Y1A3c2pGOUpkWEJsMWlpUlFZNFVL?=
 =?utf-8?B?VlZhUmY2L1FYUVdOT0Z2Y3NMRjhacjJZazh2eExVbDJwQUl3TW1yblV0aW4v?=
 =?utf-8?B?RVlKRk5BU1dyRENwenN1bms0c055ZW41NlZkTVBSbmxlWmd0elEvRHl0bk9I?=
 =?utf-8?B?eVBkSHJxSi9jeGIwdy96TmNwdWtUc0srV3czUmI3TEpNejIrb09SQ1ZGSUFt?=
 =?utf-8?B?T1c0bmxZOWJyZENzdktVckJEOGVqY1Z3QVFDc2ZMWlk5NlpsbndSdFpORFJt?=
 =?utf-8?B?eWJUT3MrazNsSEVBVXlXaC9pRVNoZDZZQ2pBNzM4U3NQUXF2VnZ1b2ppUEZ0?=
 =?utf-8?B?aHlRYURkQlUvZ0VqMHJYNmYwZzZGeFpKOXlPZlc5cCtLUVBVeHV5QkJpV0JS?=
 =?utf-8?B?djFKaWo2alhiQnliRCtGNFZ5anhsTEtDN0MxQ1dFZE8xbm9lYlNwdDJmZDhm?=
 =?utf-8?B?dkpveG9Hb2RqWjIvOUJZVm1OSmpkRkVVWElEZ09zOU5kOHZwYXZlakRzWWlm?=
 =?utf-8?B?NFI2dHppMlRaZyt3R3BBeERnT1UzeEx5ZU5aU1U0ZmI5Z2NyQ2RHSnlJanJD?=
 =?utf-8?B?Q1dNVnNKUTUxbFhqa2oxOVVGZENpTXVNWmpkMjZSV1poVEZwNkdYQVpxQlBS?=
 =?utf-8?B?RmI3Q2tlRzdsSk9pSEdxN1ByRElkRTU3eDh5WkQzRFppSk5SQ1M3MU9TVTkr?=
 =?utf-8?B?dEo2WXlEa0JFN3c3d3ROSGJEMVdrWFF5TjFqZHF3anJ1RWthWjd3WlpxNnhu?=
 =?utf-8?B?dnZva3pyQjFkd2RCVEdxQjVkRmM5cCs5Nit6bFpsM1lCa25nbGtmV3l6Zmhj?=
 =?utf-8?B?WkV3cVdwaXhnNnFhVHoyd3d3U251SDd2RGhGWi9veWZCdlViSmNMbk1haUJ1?=
 =?utf-8?B?VDkwTDZ1MHdybmVrOHhkK3RwSWtDRmJGU3A2SHcxajdpa3Z6T1pJOFVJeHQx?=
 =?utf-8?B?dzdLOXlLUU9ZMFpTSm53T2VSWmsxaS80cUllb3Z0UWJkejNEVzZuM1NnZ1lB?=
 =?utf-8?B?TW9kZ0R4TiszYUxSTmVESTE0eFQwcmVjdTBXa212QzVzV2lkZjAyU3g4NlZz?=
 =?utf-8?B?NFNzTWJoSGd4ZTNITlhDZzdES0NyN2xRcitHUDJVME1aQlNqa2VQSkt1ZEZh?=
 =?utf-8?B?S2ljYXk3ZklIdlBNOTcwZGY2bzZEWWJRUmdRaHhkYmZxZmxCNkJNLzBDVDF2?=
 =?utf-8?B?dEtadkVaOU11ZUp1RWVGTzlpNHlKWmQ2aXJsbitrVWV2NnkxazF2aURiOTY0?=
 =?utf-8?B?SHorNGdOLy9ycDRqOUdMUHNiMWtIZVRxTEYwMkFReUZxRDBYN1o5dDZPcGJC?=
 =?utf-8?B?dlF2NU1oZmZITkVUbkJWNVh6dXNackJpUWVnYmtqVkZIb1g3TkxmUVhjTmZM?=
 =?utf-8?B?bjg1QnByaHRpbjFRUG15eUNHbVprMUpKYkllUUtUSnlwTlpxODdpamtYdENn?=
 =?utf-8?B?SjlUTFVvUjZtTVU2a0ZzRWVaTFVLK1lMeU5neDNKWnRyenAzVExQR2hOeUg1?=
 =?utf-8?B?SzZMS2xONDdvUG52NnIycTVlWHBDNW5WdHBpT1I3L25JdjVPMXF1dDhMQWNp?=
 =?utf-8?B?N0J4MnMyeUp4VDFOTGFmZnArRU4rbXIzWXNWMExHMWUwRnkxMGEzVSswWEdL?=
 =?utf-8?B?MmQ0ZXJOaUtJbzJJT3AwQzZJYnlLUDRRZkVEWlAvNTJSRS9PL2xKYXRuRGVO?=
 =?utf-8?B?L2tXdldCaVN6VUhud3BzenRIM2g3M0M4NHpRakRyNnEzZ2YxakRkWjNTYWNm?=
 =?utf-8?B?blJkQmZDK2VYOWFuT2xUVGlGRkhWeGhlVVVnZUFoMlNhZ2hzWW5ub2llbW5p?=
 =?utf-8?Q?3vttZr6Jj8RhJqLmioUkz2sul/54isxzmKcY3xCLHokK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 052d8160-7e4a-46ed-ed9d-08dca2513246
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 09:01:20.2178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dG03+IF55Antdr5SX+FcGXv22QnMuOqomUoPHs+C+RMX3rsr+ibsBaxAcRKNhl6r0aP8Um5C4CgH0FULUcpV4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995


On 11/07/2024 18:11, Vedant Deshpande wrote:
> Adding the missing dmas and dma-names properties which are required
> for UARTA when using with the Tegra HSUART driver.
> 
> Signed-off-by: Vedant Deshpande <vedantd@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index f2e2d8d6845b..ce7d4e172300 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -2763,6 +2763,8 @@ uarta: serial@3100000 {
>   			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>   			clocks = <&bpmp TEGRA234_CLK_UARTA>;
>   			resets = <&bpmp TEGRA234_RESET_UARTA>;
> +			dmas = <&gpcdma 8>, <&gpcdma 8>;
> +			dma-names = "rx", "tx";
>   			status = "disabled";
>   		};
>   

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic
