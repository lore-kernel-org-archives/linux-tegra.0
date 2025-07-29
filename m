Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC7C22538F;
	Tue, 29 Jul 2025 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753780710; cv=fail; b=EKyGl3qpjpVmLkIeTuVReFOQvbMQNAXoCFktxq53y+TdlqCogao+V/6PXr+vOjbtmW2ICeV+twPRGWIL8IrMz7L2cDeIUU133F0lItOMwOUmb/ceIpTg2lM02BKUcwt4l3REBLPYX28KOmRCVq4QUvWz8P69dl2raAdbRqCmnv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753780710; c=relaxed/simple;
	bh=Ghoa1x38OKPlyC34ind2w6OClAOnxpUYCTAPh873tHg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wd4eUwszIyICv/0w1N1BAgfK4uIZjMYMm8g8V5VY8znsuZ7EdWAp2KrBvmX4Mj4u/peIXtydr7EQULF2rddIT3isvP3wJNuYu8osA79TMTR4C05eM+UmAmJLZHHcRipF5+SpXeVbW67pUtQc3Ym34vJEmUMpGo7JyXIKP6Agrp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T2K5z9TJ; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T2K5z9TJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8JEDkFkBu4xlOQg1wsfc75EcBPnVmw33r9R2Lxhq49Hgf0TijdNv9DJOOHmyker9CVF+/Id1zhiIsqjAIEN4ZyvRi2JIhvgGoFMje+IvSInJtHASvVnD0sJIGZ0p5RVLjYgrVRhB5KRo/Qmp/T1pDQ+fQcLVqVo4yjFlBnvvC3AQovm1Xts/Lk/mVkGSNjaQ6SO6Cs3bFLfI0Ikdvtw/p6vXx65hb7mf6481ngLmyMh6wxiKDpl+1KdZohHBnaJrgCRUjb42sl3k48X3lxsfoMuit4VKVVSlOBAL/6pie89Gi/ZAwfnw6GoSHF0EW3XSBXsrLxfsRg7PwmM4Fz64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhPguTvEjXgLGRqJHuEIdc7o4vfUzqat5iNi+zQ/9x0=;
 b=xVmATumkqgzNDK+b37PiYbcIAy3Luk+8ksLgS2bIS2A4oNY/Wyl0eJFs7uMOPOO8S0oeuQJx4MlCfF8IwKmHa0vVDr8dbi/6wUoOpfI7yHpb1IlUusQ+LqVVXaw53KmjPbk50Ea6V8KDiEN0fFJF5aEbwKAjdOlp+ZAobBhnHSnkYCgVXUI6W60Ln/KiWmzrTXcMVgtWczO4Gk/hb+QyUgov+KIp4e+gO3EJ3uB6eGeEwTk8WAvlb0rVGRJhAcVcFdnCDiPnI+dDOeqA1Kx6OnlrYx1R/WNcxNpACD2avj45eA3RjFgf4Zr371/xOTS/m6UMYDpgVxKP6wTpgLBjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhPguTvEjXgLGRqJHuEIdc7o4vfUzqat5iNi+zQ/9x0=;
 b=T2K5z9TJuT7k0G0yeUOL9PlsfUpP1vFP+KtwAnEFkHDqEdI2E/XwifXSa+bCOP7D6ictBsQCxjTNrnIYWDRWatZxfscSOSjGbBcSz6FckJVTYDaAxWR5VTjKlr7Tfz5wu3oaxx9DK9Xg11oOIqRyEDHikF7sLLDNbZbELLtcsm/eVXB1en3mfXxD+6dptY0KyKEuH1vgdIRJ7J7jSvO8lnz5oX+22YFYBMlR2lzPsHlprOuHyrPIbgnWy5OOJUMbxnVq0cDpEmksFlP97VrkJybMMLbftITAOYV7B5zdde5DkLRbwio17APuVtjSngtZ3qRn8yoh79JQfYGsfLTFfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB7509.namprd12.prod.outlook.com (2603:10b6:8:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 09:18:26 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 09:18:26 +0000
Message-ID: <354b1edf-479d-469a-931f-e0ef0833ad2c@nvidia.com>
Date: Tue, 29 Jul 2025 10:18:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator: core: repeat voltage setting request for
 stepped regulators
To: Romain Gantois <romain.gantois@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20250718-regulator-stepping-v2-1-e28c9ac5d54a@bootlin.com>
 <e9100dbf-524e-4edd-aba3-71e28fbc07d0@nvidia.com>
 <3560762.QJadu78ljV@fw-rgant>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <3560762.QJadu78ljV@fw-rgant>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0194.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::19) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7934ff-170f-4d42-af08-08ddce80dfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkR1blkvSXpSd085V0twaktCeUpGdE42SFpseEtNR2RzNWx3SWF5bDh5cU5p?=
 =?utf-8?B?U2JGaDZMK3Bzd2sxdnFkV3ZJT09Sbm53NFNhUHlVSnRZZWZueHhaekVwbEpV?=
 =?utf-8?B?ZTl6c1E2cVRGckVlSmVwYU10ZWd3TUZaTUNsNThMbUE0YWJWUWc1Y1crb1dz?=
 =?utf-8?B?TkdhOVZwaC8yZFVZRExzbGxQLzdET1k4TzIrUmM1dVE0TkcxbVJFa002S3ls?=
 =?utf-8?B?KzVoVTYrbUljeXdabTZaS1VRZlEwU3c0RVFrZWUzditRMXpZU3hLMU9kOGFo?=
 =?utf-8?B?R0RoMEdCcm9zY2FWZ0pxUS9NNVJ1UHFNRWkvMnhFbFRRVkVDOGZlZGFqZTl6?=
 =?utf-8?B?S2dSOXlQUGNSOFVUN3pOVXgvU3RSK3NWdWRHb093MGhaTDBRVkRRRjNrTVVs?=
 =?utf-8?B?eng5eXpFSUJVeUtBenNkN254YTUrK2FLeWJ6ZTIrdS9ZQWZCc1lqYUs3QkNu?=
 =?utf-8?B?cFdOdEczYTN4eFVuUnJkZFh1bUMrbjNVdDh6cHFHSlZtOFdUaDQvVnI0V3JI?=
 =?utf-8?B?djduV2R0R1dNUFAwbGJTRHh4dDJnaXBsL2ZiZXREVFJUYUJIY1JFamI2dDJy?=
 =?utf-8?B?dTYvcGlzOHUrSEQ5WTJEbWFIUGZEQXNsZVphWnpIYkV4amhMRktHSWg1QkJ3?=
 =?utf-8?B?ZVFROWtzTWh2TmcraTQ4MkNvUVF3QldMSWw0aCtHUE5HOENKRG05ei8vYUNy?=
 =?utf-8?B?UDRmOVU0dFNicE5DWjM2Y3hLYm1DWlo5T1pWMkFja0hORlpJeTc3K21vVS9Z?=
 =?utf-8?B?dnJGWFJyMys0VXNKUHVzUmVsbU5iZmhSVkpEQi85dHE0WDlRWTh5WHF6R1VR?=
 =?utf-8?B?Qi9UWGFyKzFVcTN4OS9zZ1pqVDVlYXY4Z2tERDc2Z3c2TWtRdFcyaDB5b2pZ?=
 =?utf-8?B?Mk1LaGttSlFBaWFwYU1KVE10aTRiUStOZFdSUGl2WUhxZE5VYlF3ZWhEV3JP?=
 =?utf-8?B?YXN2cVI4ek1LckxLOHNQU0hkREo2M2ZVOWRNakw0TWNacEVrVnBqM0NHZDVk?=
 =?utf-8?B?N1llWllRUXdWOTduR1duMzRmYXBiS0JWY21zZ0l4RGJxaXpLTVR6bFBhdUUx?=
 =?utf-8?B?WFdYcHpqVVRhZnF0eHZIaVFrbmU3dnFENkhCK2s0V3BQVXdVUjZpSXJlK3lQ?=
 =?utf-8?B?Y2JNK290c0E0TC91Vi95RmEwMzRtMVJKY0tlYnNHdTI1SHdRRDV1ZEpwRDd5?=
 =?utf-8?B?SGdObTd0VmpmSHp1WWhqNE1SQks0NlNTT05nbGgyRUVuR2pmOGN3ZkFndjkr?=
 =?utf-8?B?Sytqdjh3MnlqTVVsbGdNaFJMSUJnQnVMYnJyd29wbk85M1AyV0hqNi9DbVAx?=
 =?utf-8?B?b0U4SUd0Y0FPbE00RlBKRGN5NFd1TGNtZVk0eXZ6Q0MvTnEwd1pIYUNQQU9L?=
 =?utf-8?B?Rmp2TFg4d2JVUU1TYzduYTlyUUNWTjdSVEJEZ1FiYjJoMDEyMTErTlV3aHVN?=
 =?utf-8?B?Z1NUckk4d3E3bzhFS2ZTVFVGbXlsQkliN3pwbWJDTlRUeDBNUnB0V1cvZHFm?=
 =?utf-8?B?UDl6ME43azBreTFhcGxWQWU4QURrUFc5NElvVzFYT25JRTRzWC9rTmZ6OWJL?=
 =?utf-8?B?d2JhQmFCMEJ5WGVwK29ERk1jUFJtNkJqcjA3bnJsbDRDbStydmFoTnQ2cHhh?=
 =?utf-8?B?b0pvYzBTMzhuSGI3R3l6Y1lGcFNtSGR1V0ZhQ2RDRGxsKzBlSXJtdlhjQTlI?=
 =?utf-8?B?Z1hhQ0JPYzQ3a3NPWkx6bkFsNFZ4OGFJTStQQ2haa1hlVVFlWW1XQmR3NXVm?=
 =?utf-8?B?Q01MbjlFaFJGNUtyKzNOSjBPWHYzckU3ckhFQ2JkK3JMQmNRZnVVL1UwbkNQ?=
 =?utf-8?B?MittdzVkbU1iV0VCY0lvWXFUUXdlSnZXRC9WWkhHY3B5QlpJZGVPeGovWWNG?=
 =?utf-8?B?YXc2aks0Q1J3SWRzWXl0OEFBVnFleCtDeW82MWFRK0dNbEZ3Q0ZFa2VGcEZT?=
 =?utf-8?Q?XEPWEI4DSJI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVhaaWxUbnc5bVh4YUlreWRId1VKWUx0SFBXcmpwMkkycmViTHFSTEdzMHJU?=
 =?utf-8?B?WGw2M00zSXlDY2FWOHd4T0ZtSDJNTkF3NUZNN2RiemdkOEMvK051NGZobVo4?=
 =?utf-8?B?Ynczc3pON1RObS9vdlU1dTlXcjdDTEJSNjRQaEtQOTJENEtyTkxSbjY4dWY4?=
 =?utf-8?B?M3FGS3RHNGdzMlJ2aWZwZmF4ZkJna1VVYk5mTnRZUVM5eGNjZ0JzdlN5UUp6?=
 =?utf-8?B?em5BVjBMUkdxUTcrbFpDbDRKNTMwZHpWcjk2RWZtcUtPUHlTN2k5RDg2ZWYx?=
 =?utf-8?B?dGRVQWFUQkp1MXBxaTllNWZnRDd1Rlk5Vm9wRU5VMkRaYURabzF4ZTZOekdu?=
 =?utf-8?B?cmgzWUZQUGhxai9nMDA4VE9GUExvOGtaU25ZcGlRdk1Fb1h4K3VJbzlSOFh0?=
 =?utf-8?B?dHhRaHh0UldzSjBDVnpibnVKbU9BYUV5VzRuNHZZNWVha0diZ2haNEJtV1Uv?=
 =?utf-8?B?Sy9ML1cybnRPVmMzQmM0b1FHNFJhVXpRcHZXd01wU3RlVWNjdUNxOGczQlBU?=
 =?utf-8?B?YW1iOGlvSGx6TzdkRWR5ZENsV2xFMm5teWZINDF0NUtLNTJhUXpJV3c3RkdH?=
 =?utf-8?B?SVNTRnYyWmtXYVJmejJlVHZzbGpneUZPbDNlV0RadWE2NmxoQkFHVFBkcXlS?=
 =?utf-8?B?QnRtQnJkenBNaTMyNHRnY21HOExpZENLQS95M1ZHR2VycnlOKzFzd1lTSDR1?=
 =?utf-8?B?QnRXMG5mczA1M0JLTWNVNnRja2VXdWxkVmxoQ09FOTI2OHZOT3k5R0RNeEYr?=
 =?utf-8?B?SFU0TDhNUzMxMm9JMTl4ZWF0ODVEb1NtV0tVejJ6OWtYY1JmR09oWDhodGlJ?=
 =?utf-8?B?VSt6M2FjOTYveEw4WFBqZVZBOFljS2U3ZnNCNk1FaXI4Z2diNmVRc2FjOW5D?=
 =?utf-8?B?QjF1UVdkbkVlanhXT0ZvN245T3RGbGVweEp3WkhDMk9xOGp5WGxZS1grb1hx?=
 =?utf-8?B?S0lDcC9TTUJmWmxIOThCYTFWSE5yR1NQd2l6REcwaVU2b1pnUDJOcHpOVmsz?=
 =?utf-8?B?eUZMb3ozK2h2NHdsdDVia1NMbkFPZ1FLR01FUlpIQU0vd3RQb0I1ZVdrb2x2?=
 =?utf-8?B?dU0zNnRSeG1tWXFsMU11eFlmNUgxTno0bDBua3MvdzNxaUtqMEhqem5WcEFx?=
 =?utf-8?B?bWpHd1NlbzhKczlXcXdHczYvbTZ2QTdqMFpITzcxUTUvemZYYlF3SEhFSC9i?=
 =?utf-8?B?UFJ0NExaL25Mbko1eHhaS0N2WGEzVXVPamNzOE9INjB1ekI5b0NRR3pDNGQw?=
 =?utf-8?B?OGxQamZEeDJrNjRHUUtQQ3lYcFNBK3FITG9hMWo2Q0s1OXpDblNCQU9JUHli?=
 =?utf-8?B?MlBhUXM4NEpyaDYvaG9USWF6R0dLUTJVVmF3ZUtPYzM2eHFCK3orK0ZYVjlX?=
 =?utf-8?B?N3VYTWlra1BKcE5hbEdmSk9oWkVCSTFVNjZ3V0hXaFlOSzB0UklPUUY0Tk5X?=
 =?utf-8?B?UUNFVUQzQnpiRzFOanRDWjhqMHduQWdDY3hNcWVoZ1dNV0ttK0c4M1VHMkVr?=
 =?utf-8?B?K0VsNzhxOFhMemxaOURFK3VURmpxem1EMXkzYUNDT05ycGtTb01IVFYxVWQ0?=
 =?utf-8?B?dDR3WVNzd0g5bjJjWHN0WmRGb1NWcy9ESGYyQ3dPUWE4Z054cEQyRSttSjBS?=
 =?utf-8?B?eE9yaDE3dW15SXoyOWsxRFJKdHVXSzBsU2FqSkFxWkd2SkpFSjhsaHVvN0hD?=
 =?utf-8?B?aVRNVnpaYkJTWUprYWJzeXBDQmJ5eDFvY3B6VW1CRzZhM3p6M3NvTHozS1hK?=
 =?utf-8?B?YzZtTGoxNDA3ZkE1NTNkMG1BU3F4RCtUenNYNmVJbTJ5eEVPWHRuQUdablhU?=
 =?utf-8?B?NmMxMzdQU3luT0RyL1plblJjbVNVcSs3ZkpwejZqbWc1cEZBM0pGR2RCNzJY?=
 =?utf-8?B?OGlXY3pHOFgxa2xzQ1U4MnNUbGVIU295RHBLZ2hZVkRvSUVCN1dNNllkQW9I?=
 =?utf-8?B?RzE5WGE0SnQ1c3A1SGpWWlUyYmJveDJBZHI0ekFVSmp1THAzWlhOd0RVMWth?=
 =?utf-8?B?UlNxVnY0MWU1bG50WlA2aWpueDd5MzlKRk16QmVtWTlldU81RWd5SGlka252?=
 =?utf-8?B?YlMzRE1HQzNGUXFQdEpEN0g2Y09oZXdSMzBLeWRSaStWNFdlakdBd1kxVjNE?=
 =?utf-8?Q?ua/A3qxANTVMWOYV/2IwNRsm4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7934ff-170f-4d42-af08-08ddce80dfc7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 09:18:26.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVivk+COm/Is/B5RCcROOs4VUqogVQZmQOenW1YtJ/NpfYpr6Cp1DC4ubehfyiiQ4HYt8AWv9vK6QxTwL3QtOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7509



On 29/07/2025 10:07, Romain Gantois wrote:
> Hi Jon,
> 
> On Tuesday, 29 July 2025 10:28:17 CEST Jon Hunter wrote:
>> Hi Romain,
>>
> ...
>> Looking at better closer at the issue, I noticed that it is the
>> 'tps62361-vout' regulator that change is causing problem for. On boot
>> I see regulator_set_voltage_unlocked() called for this regulator and
>> min/max voltage requested is ...
>>
>>    regulator regulator.5: min_uV 1000000 max_uV 1350000
>>
>> The min delta is 300000, but in this case the delta never reaches 0
>> and in fact never converges at all and so remains at 300000.
>>
>> Looking at the above, if the delta never changes, then we get stuck
>> in the above loop forever because 'new_delta - delta' is always 0
>> and this is never greater than 'rdev->constraints->max_uV_step'.
>>
>> There are two things that is not clear to me in the above change ...
>>
>> 1. Why do we 'new_delta - delta' instead of 'delta - new_delta'?
>>      Assuming that we should converge, then I would expect that
>>      'new_delta' should be getting smaller as we converge.
> 
> Indeed it should. "new_delta - delta" is equal to the increase of voltage
> "error". So if this value is positive, it's bad because it means we're
> getting further away from the target voltage. Also, if it's negative but
> too large, then it means that we're slowly crawling to the target voltage,
> which is bad. Currently we do:
> 
> ```
> if (new_delta - delta > max_uV_step)
> 	give up and return -EWOULDBLOCK
> ```
> 
> but we should be doing:
> 
> ```
> if (new_delta - delta > -max_uV_step)
> 	give up and return -EWOULDBLOCK
> ```
> 
> which is equivalent to:
> 
> ```
> if (delta - new_delta < max_uV_step)
> 	give up and return -EWOULDBLOCK
> ```
> 
>> 2. If difference in the delta is greater than then 'max_uV_step'
>>      doesn't this imply that we are converging quickly?
>>
> 
> Yes, the current logic is indeed flawed.
> 
>> I am wondering if we need something like ...
>>
>> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
>> index 8ed9b96518cf..554d83c4af0c 100644
>> --- a/drivers/regulator/core.c
>> +++ b/drivers/regulator/core.c
>> @@ -3884,7 +3884,7 @@ static int regulator_set_voltage_unlocked(struct
>> regulator *regulator, new_delta = ret;
>>
>>                           /* check that voltage is converging quickly enough */
>>   -                       if (new_delta - delta > rdev->constraints->max_uV_step) {
>> +                       if (delta - new_delta < rdev->constraints->max_uV_step) {
> 
> Yes, that would be correct. Do you want to send the fix yourself, or should I
> do it and include your "Suggested-by"?

Given that you more familiar with the logic, please go ahead and send a 
fix. I will happily give it a test on my side.

> Thanks for reporting the issue and sorry for the trouble.

No problem. Thanks for the quick response.

Jon

-- 
nvpublic

