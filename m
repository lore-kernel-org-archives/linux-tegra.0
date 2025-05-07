Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E51C6FF5;
	Wed,  7 May 2025 11:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615833; cv=fail; b=jhU3B+8gOx449NudLBtvVgFIvWcfy3uTz4/ixhwbvR54rjkgBZEWOSIHJtGaG8W+lRSmidCGi9dwMYxDl7Wwrb9ZIBlR94VZOZsOD/G5tgOsT3Ox2ktlx54hlFHal70WahwziD//2H/AJQiAUP1jJTayGyC6hktuoRFmgtzhaP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615833; c=relaxed/simple;
	bh=qREHezgNMQFEAUi9uU698dX++gNTAt608pTZ4Net/Qo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AEm6TXNkrGpEcDYUo+A0dneMEZ58ZC8ox37umxt/ijxeSHSytvKd7/JA63u7TcQOAQb+Qrc425eT/HaKqS55enAhjB/dGxnRR7QtIz6BNgtKUE2bVyR/DM0TUDnAfs7ZTK/vEl/JnHg3XafBuKcKDSVtya3PlomfZjbLm4HjvfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c0HBedNU; arc=fail smtp.client-ip=40.107.223.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c0HBedNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgvSyHASJ6teRReOKBE1oK8jeRjTaZjx7TqhMKIeFTqdXvietg7dX5sSwvZldOO43U4JNXekBAHZXYC3SVlNZmrLQ2caKBZCXkWUAoEww7DuIBLUrd/QT0fQ/Y0ysuHUndfjr8/RYXNzVprRdEjaODyLNCkIJ7CYHQQDCRAEbCO03nZuFeyFPimdqHIZwgb7jncERu3c3nL029ZW7RIZCHs3KvqhvI0WKK/+/2WBUOHaTNbwfbPCIssmDZRVSswxYqOH0P8DbM7elCM4Sc07jOmNF2iKrWNVNAOpMo5C6NPJt/GpvOhO06fIgQ5aN8gaWZQfidCdGgMmcGyNzRo0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsDSjQfDFiuxIZnZkdHzPR08S4WZ/KYpCo+HK7w1lho=;
 b=ZYZTqkluA/nFlucC2aiRbjNxQqkZgOMLYAHSXcij4PqHPWERyNKWo3H2OO/Dw7cSFxoxFu7g7EkORJtp4M/dZHmqokR94V/Ds9qU0beoAEC30VZm42KFTlkY2RuF1Iy2ozPWQcj/DI5LzYDZw6ssKVaJXChMSlJmafueY+grM7tv7hJ08/iIOmSILEqv/c+8++qiGgP0Q5yEir2chGvzhtc630fLrQq3OMnX0sTJ4EUqSgyv4jwhq446Ih8RwDOSli9zCfcunhXj6gm9C+nX8npPQ+JWy5dBc+gy8+OGDgvQfZU4JBAPSZdJb1R9XURT89yUESV+gHPkDRUBi2dbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsDSjQfDFiuxIZnZkdHzPR08S4WZ/KYpCo+HK7w1lho=;
 b=c0HBedNU6v8v7c/fvOv9qWRQBM6JHff6aRmMr9mk6hBeRgOPsaQZtcKjr7+II8rFS+JIhtJvNgnjqOo3N8+ZFzjgBzyNRIARz31HGIavkQD2MXB/EVHE0b6HH7513KjZ7mQpwBUwWpfPfOEdNMSdbj0pgeBOirTJBNvBB0YUCpMauEkgZQhx1ZHIQiQz39gyKT6zPgC/9LMDj7pu0ULc6RSH65+/wxWn3dF2+Ei8c7lWQ6uytIIRSXBkuDlbSBpwdMcsH3Bva25MlC5z8QVKdtMrKkwWrkhTS885jkuIaTQq/CvOaXHu4xCpNSAzhBcdGpIAqZi2jIXdqWkD07uxWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 11:03:44 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 11:03:44 +0000
Message-ID: <964d8b07-aeb1-437b-ac8e-c129c49b2a78@nvidia.com>
Date: Wed, 7 May 2025 12:03:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] soc/tegra: pmc: Add Tegra264 support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-8-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250506133118.1011777-8-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0244.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::16) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 67794bd1-ce20-439d-0a8c-08dd8d56d504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzUxdVFYc0djcmNuUExadWRWRmJPVWhiVEtaNnRhcjRQYTBMRHJ4MFFnNEdq?=
 =?utf-8?B?V3JtUktacmpEQlljUmlDTkZ4Njh4S3BRZGl0MkwyUGxzVTNITlFhWDY4OXQv?=
 =?utf-8?B?UTQxUDc3OUIyeWlRcGtsZDdMRWlGZ1Ftc0hwVzlDbXdVS0FINkxtRGxTUXls?=
 =?utf-8?B?cVJBVmxMMG8yNEVzb2tEQ2EzQmUvdU43ZUIzMm9ySkZMYlVZTmM2OTZFQW92?=
 =?utf-8?B?aFltR3Uyck5RZ2FRRlNKUUhyUnZ2Vk9zOUNZUlBqN21sVkFXZ1FsUHhNbkc2?=
 =?utf-8?B?MElQVnFGQnI4RVA2bU1IbWdRWVFyRDZZNStrZGlwVGk4Z0FNSjlkYWxwbE52?=
 =?utf-8?B?ZUNPY1FaMXp6RGhqd1cwcWxmMHA1SVJJUlJMVGx0RldxK2FHNDhzV2VHNmE2?=
 =?utf-8?B?OHd5WWRBRU0zaUtocjNLcGlHZ3V4L0dYSmRuL2l6WHJwdHJDekhxd3F2bHpZ?=
 =?utf-8?B?SDJlR3ppRUhSTzhMZWJrbnEwa1FBMlB4UjJzTFF2QTkrazdjbmZ2TlNSeklv?=
 =?utf-8?B?N1lrVGs2djYrdFhIeWZEdnVqRS9lQXlIWEY2L0o5K1VkSlRnRTRtYVoxQytk?=
 =?utf-8?B?UWh5OGdoeGNmTWkxNkxGRUZ2ZXpiYlZzMnlCblhPLzdxQk5PdG91YWx3aGNR?=
 =?utf-8?B?dnZEa05KdlFoVVo4OXI4SndLWkd1amkvdXk0NllpRXdXVWdBUEE4WlJOWWNP?=
 =?utf-8?B?S3RRZFNhdjYzK2wyYWJna0NidWJ2MWIya2lwNk1DdTRLSlRqVjJRaEZHTWM1?=
 =?utf-8?B?Skp1U3ppT1hZVDVLSmRodVlHUlRCSHRuc0c2V2tJeW1lVTNiSkpLRHhlK3c5?=
 =?utf-8?B?dWFjQWw2QTl0amV1Ui90NjUrTGpRMSthS0JtOElkUmNNNVc5U3JTNHRHeUw0?=
 =?utf-8?B?bjJTNW42WW9hK1dNTWpYT3N0aVc5a3B2ay9vSWNwcDlRd3hwaVJqWVdacEo0?=
 =?utf-8?B?RXNJd0pGQ1Vad3MzcHMwWFRqb3VIM0ZkdDE4S1V4ZGJtUlpaWDRuTXBYZUl4?=
 =?utf-8?B?aFBNWThDMVlPZ2FFY2Qxd1BDd2wwWVV0R0xydkxZVHBpK0xQMkhISzRIU1Js?=
 =?utf-8?B?WExUVENabHpLQTB0Y3lGZTNuYWFiclBqa1VWN2FtYkNwT0tYL3NPQzZwY09W?=
 =?utf-8?B?TU9wVHBYZnBmTk54Y0tQUkltT3FqSnhHN2ZjQmh2bVhxdlZrTUtVcVRhR1dM?=
 =?utf-8?B?bGlKR3NobEcreWY5K014dTBLd0JCZ2JrOUs5aE4zUWNLbS85NW9sYlFlMUln?=
 =?utf-8?B?UGJxQ1BUazloZFpqU2U5YTc2dDhEV0xOaWFhK1EvZ2N3YjQ5alRUVUdNNjNz?=
 =?utf-8?B?dmlLMVV3cHA3RjlpZTcvVlczcUR4c0tVYVFKSGt5Qjl1d0VVNTN6TDJMcDVo?=
 =?utf-8?B?Zk1nR0ViWUhubW1KTlFaVmtBZ0NtUlAzSlhPMGQ3djA2K1F3dFp3bkZqZFlm?=
 =?utf-8?B?d2Nrc1VJTW5FdWducDFRb0RvVTdLMERDbVhBME1tUkRFT1JEUW1teDRuQm9z?=
 =?utf-8?B?cVQrMGN4ZExqWWNxdVVtTUFtK1hEdXlYam81WWtpdEMxMlNHZTE4Z2kwTHp6?=
 =?utf-8?B?SUhEU25YYVRmM0hOazhjbEVCZXZJNVBic2VVYStIVEZXUHYxQXNWNjEvZTdZ?=
 =?utf-8?B?T1RYNmhDZGhYeGt2dG92Q3lSMGhyTGJLR1d6alAwclhZK1c0Vmt0TC9sdVY1?=
 =?utf-8?B?MEtTQkFrK3FjVVJ6T1NMdHp2bWpIUEp0dEd6QmFDL0JTMnRpem14Rjh6alBD?=
 =?utf-8?B?MGFQQnZ0dG53Zkp3aXFSZU5FUnkwUFdvU2M2RnJrN3lMSDRld1MrWFgzNGtt?=
 =?utf-8?B?aEQ2eXFCcDZ1U2JmcDlOazdGRExQQ1c3U3FqY1dqcGZJVDFja0EveWEyVk5H?=
 =?utf-8?B?ZHpqazBpS2Y2RUJMUnJ3aGdwQko5Um1EcUU3MjJEY2o1T1UxOTFTUjNEUC82?=
 =?utf-8?Q?hTxfhQ3agpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0NuTG02bkZWOEZoZ1VMa2FqSngrRy9JSDB4RmJQb2ZlMXRPVzlIMDdjUFcx?=
 =?utf-8?B?TzRvY2RpQmxrNGE3czFVSnFuWnlDU21mbi9Scm1xSWV0ZGhLemdFajY0RGtU?=
 =?utf-8?B?SVBMNkdIWTNBTHhjODdIdEpUa1NNdEhtWlJadnhodEVMblBOMDNUN2lhT1FQ?=
 =?utf-8?B?ODBNWHNER0g1SmhLMGp0Y1dGejZObElVeUpzRXJYMkU3Z3o3VC9FVG96ekw2?=
 =?utf-8?B?TVhVWXFSTUVpRHU3V2pmNEFiY2lmZ0dzN2V4Kzl5a3V0a2NnaktvWkF2NjlX?=
 =?utf-8?B?TlVzRmMxbEU4WkNGaXRHdU84SmdnVll1RXg4Zm1iSVZIajJKczZCZXJhdFh3?=
 =?utf-8?B?WTNXd2dpaEJ6S2dmSHNvZmFYY1N0M0h6b01iZ1NmT1ZYeHV5M1h1cS9mN1J4?=
 =?utf-8?B?NjY3RXdHdmZVa2xBY2dNRWxyYTJJb25NZDZjak5JWlVzMkxFZ3lIQ0tHemxq?=
 =?utf-8?B?QjhZbFNoZFhwc3BJcHdUM0lVSVNRclZpZDZqb2hjZ20rNXE5VkNld3VOMXU5?=
 =?utf-8?B?WWNUVmdHS0U4S09QYjNJSEhpM1JjQmRVZVpDYzBhZzgySkN6WFZkY2hvRm5C?=
 =?utf-8?B?dFV2V3ZvQTZXUlpXOTF4eEJPL1MyVTBJRGgvc09iREtMaWlQcGd3UXhRY0JD?=
 =?utf-8?B?UWg4Ym5wSWpFemh4bCt5ckpUczRMNHZ5WGpva1FIVThmcUFNSzRrdVIzMGF3?=
 =?utf-8?B?K28wYlp3T1VFMzNoL2hEQVVXV2VqY3JOQXhDYVJQSkw2MFM4YnlMSUM3dys5?=
 =?utf-8?B?L3FKcG9OM1N0YXMvZlRTUW12NWVXbktkUmdNaXE0S0dPRFlWMEJxc0N3cjJn?=
 =?utf-8?B?OHowVnFOMWk4RHJzeThDZU5halJvZEV2VUNBU1FjRDR4NUF3azRTalFReWQ5?=
 =?utf-8?B?RWdWRXhDYWZnbm1veHR2YkFFakdrMkRoZVgxOGxCUDVrSzcxRDgrV0pKVXVI?=
 =?utf-8?B?U3BLRytTZDgvdk84NkRxYjVGMnA2U2QvbzhmUnY3NFRNbWlQWXZMNThvRy9q?=
 =?utf-8?B?Um1CMDRpSFZYSkYvNkNIYzl2VlJUdDNMSE5KNXdVMW0raEhMZDVxOWZ4dS93?=
 =?utf-8?B?QlIwa3YrUmFBSkxHbVlBK3dRZTBzckZuRFFvZWkrblpwNDdJcUtacGs2WFNB?=
 =?utf-8?B?QjJSYU5EK1dSY1YvTVQ1SzBQb2thT0MrdXptbmhKeVJqdktIU3Z0R0NRSmJD?=
 =?utf-8?B?c1Y0MjU1L2syTUZhY2NBczFwbzRza3pISlFzVnE0YUlFNWFlUVdkVE9kVXVB?=
 =?utf-8?B?eEg4MVJzdWQrbDhFMDVyNXhmeWZ3UncxNkw0bDVBczN1ZzBWMFIwb1NaMWRh?=
 =?utf-8?B?bFc2V2R5WmxMUEJLcG51SWNGZFVQNjhTUzRXUG5pL1JjRUkyR3IxNFFsN3Fj?=
 =?utf-8?B?cUY4N3p4N01BcEVZdjROUEl3ZmcrbnRNZDBTdlE4Sk1lcEtrd2xvSWNtQzRu?=
 =?utf-8?B?Tkhhdk5vR1Y2Vmc3RWZRZm5XT1JkN2FsQ2l4d2NJSlJhUEZid0dmMnlrV2Fj?=
 =?utf-8?B?TUh1RFozQ0dDeVF5b2lkUjZ4dFJnbnk0WTFJL0ZVTFpZWDh4NFJCQ3pWSFE2?=
 =?utf-8?B?elVWN1pHMXFxdjlHdXpjdmRKRXZad2JYU2NXTDFhY1R2RTlpSVYwdVI2Y0Qy?=
 =?utf-8?B?NjZpMmF1Yk1hejBuVGNESDQzZmxSdzVpK211OXlxbUtrT05RMmNTYk9zMUxQ?=
 =?utf-8?B?ei9oV3BHMUtYUWlXTmlYb2lIdEhIY2gzMkhRR2k5aUlHWWxueG5FYThYSEQz?=
 =?utf-8?B?dHFPKzE1YW85V1ljT2FMelpBTFFjbno1OGJZTjBsVjE1TThYWEZ3ZExZa3lX?=
 =?utf-8?B?SHNWUnFva3FCZFRIMG1VL1ZzYmVack4rWDZFczl2RDNSeGF3TVpPR2pTdTJP?=
 =?utf-8?B?V3JuSEsxTUhQZUFHOVpON0ppZ1pUcnBYQTBKdzJtUnA4Wi83OGllcTg5dmVr?=
 =?utf-8?B?ODZzSFRJVlBvL2FBNlJ3WW94RkR0K24vOTcvYlhPVU43ZCtpSVpqLzBhOEdC?=
 =?utf-8?B?eEQxaVMrdktBVXhhQWdqbzJCL0lXVTBac0ZKcWsrTkg0YUVXc3RuMnN2VXR2?=
 =?utf-8?B?OGxjQnNVbWFIbzRWYk9zL1dGbFNKQlUreUE4OEJPbDh4Vk9FL3orWTdYRC9C?=
 =?utf-8?B?OHNWdVc4NHZqZkxFUndkU2VGQnlKUDZ2MndndXVCaGdwNUZoc2drN1Q1QUpq?=
 =?utf-8?Q?o24Qjj9jzGLCN0WdN0SdNH2062YElD0c44/WvhSxJitF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67794bd1-ce20-439d-0a8c-08dd8d56d504
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 11:03:43.9681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMdLu75mTUTFRD11/VU8josDRjucZX+ovRVjpPfXPVQykiU7p6EmUf2f2iAaGASU4zZ5gtO6kbD/VXwP72ksSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598


On 06/05/2025 14:31, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PMC block on Tegra264 has undergone a few small changes since it's
> Tegra234 predecessor. Match on the new compatible string to select the
> updated SoC-specific data.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/soc/tegra/pmc.c | 132 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 129 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 51b9d852bb6a..6f1ea5b6b9db 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2892,9 +2892,14 @@ static int tegra_pmc_probe(struct platform_device *pdev)
>   		if (IS_ERR(pmc->wake))
>   			return PTR_ERR(pmc->wake);
>   
> -		pmc->aotag = devm_platform_ioremap_resource_byname(pdev, "aotag");
> -		if (IS_ERR(pmc->aotag))
> -			return PTR_ERR(pmc->aotag);
> +		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aotag");
> +		if (res) {
> +			pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
> +			if (IS_ERR(pmc->aotag))
> +				return PTR_ERR(pmc->aotag);
> +		} else {
> +			pmc->aotag = NULL;
> +		}

This part make aotag optional, if I understand this correctly. This is 
not mentioned above and probably should be. Also, I believe that 
currently dt-binding has this as required and so we should update the 
dt-binding doc to make this optional too.

Jon

-- 
nvpublic

