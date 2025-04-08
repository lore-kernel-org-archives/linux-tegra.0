Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABC22332A;
	Tue,  8 Apr 2025 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103093; cv=fail; b=nmX7R4uwxQ/BGN6eFVfhnBXdXrwXi33QC5wDzO/RJW09QffoMIcSNGZ1d8ZE2sSD2VL1vR6PEYJKMmmZQCGpP68IDKifJNjSsWUK1diBEhRigu6L7mzSGWIyajsb2zGQeamabWKTHLGL+uCZDlODiCOCAA7udtm6qZSjGaU7/Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103093; c=relaxed/simple;
	bh=4q+1/WxX8+135DiowNUZGeTD0R7z0xdO3mTSIJGIoSA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DfqTGoZjLC+EM7AQUljw+mlHznSd3fWH1LipneQ72wO6CMJNZ+LP5jLqRXUWVZkK4mv2jYefPZnSTcgWFQdvJq8WR9FMT7mX08f7jqndKiMEmP9cYVRURui7TLiBCC60t9RiN/IUuwYeZDXMtCpFNd4+ANHiZlCS4FoyvjASlto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gf1uXAuc; arc=fail smtp.client-ip=40.107.243.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gf1uXAuc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqyqAxUErD4fl3+RxoMk1td5PE7qO0H7HUD8wl6uNrjJ6J/PCCASMu4zSci4lpCA1y58bbAQWeYclqBzNicoMf3dR9RCwqKJE8eHKkKxu/9IYVDJNjyttXFCRkRo1U1sIWxRAdGmCxFB1TyJHZ+MA5oNCDyewVX7Ws2BmigQL7pF9C7930dwUd+aPfFaTfeyWwfxXIzCfD6EEoI9rjx5rIgEYFCMnu/DCRLDFc+aTg5SJ2ncqV9An/LPQrfChqK4WkhBACv0oP06XnFVK/HfwVMQFEMbW2OPT7AK9luMb8t0ntrUX0cEgKj/Omes8jF6xxGfZKqIc7YgDapAlb3QZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2cKgJnm+diEhSRYoRpRwRpfxGilwN/jMzWIYdmMEnI=;
 b=ltxbLHxiT2o8zgpJMTNguPpUklFeTFryFBTxV1Jnd1boCFZQtpnKO0kZ06vvZJiCymq1Tia+atFUXgUM3tesZEzXs5vCbj9mhQdWWkaenHLlzTb7FInZS7OhFH8Ea4ZJo+iYbJ7iYRmYzFkTWRxrFPwOuFdfASzxOnD1DvZuL4g54DypJrDjsxllWitzhI8bH0gNyQQftEm9rRzTPqAWMPDIcaOM+Gt2MuRE+12Woj7LvMFrGLZbSvEgXMNdOL6KqCrHtOLDEpVI+CsQ/SzpTSMCHPDrSa2A0R3fkXdylVke9LMbH1F3PKHWmPnr9DRZQuiD2zoDWydGMsIAFwHigQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2cKgJnm+diEhSRYoRpRwRpfxGilwN/jMzWIYdmMEnI=;
 b=Gf1uXAucMcl5NWrX02ljGEZcx6NBNQjUu63QrwdVBd6EpkxYgDUqRvAjP3FG4qqi27WcIJu0ovipjkQi2Huo+kHV7Dav/cTLSo+xQEZASzrhAxAfLEJGtks8lghhK/0fYBnIMiCdHZhOYRntJz/Yna3W39VDyssK3KLhfucziMO9BRBXUwfaz0nL+VnLI1Ct3SYWjeWs0yuBJpKIb+Cl1ilo0KDoZ3wR4M4v2zF0HvWBRUwpHxKH1DD8D/kv3KwnbQ0vRfIdQlaQ+N5dNeJBtGzQnMKKk22IGohz+b3THYOQr521bQRz4D2cRIJ571/AUWH7Ujs/jvfYgaL/q7Vk6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 by SA1PR12MB5640.namprd12.prod.outlook.com (2603:10b6:806:23e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 09:04:48 +0000
Received: from BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923]) by BL3PR12MB6473.namprd12.prod.outlook.com
 ([fe80::25e1:5ee7:117:8923%2]) with mapi id 15.20.8583.043; Tue, 8 Apr 2025
 09:04:48 +0000
Message-ID: <281111d0-2aa5-4ffd-b023-aa4f854a500d@nvidia.com>
Date: Tue, 8 Apr 2025 14:34:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com,
 spujar@nvidia.com
References: <20250408083022.3671283-1-sheetal@nvidia.com>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <20250408083022.3671283-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To BL3PR12MB6473.namprd12.prod.outlook.com
 (2603:10b6:208:3b9::16)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6473:EE_|SA1PR12MB5640:EE_
X-MS-Office365-Filtering-Correlation-Id: bb430ea7-79cb-4a0e-45f7-08dd767c69ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QllFV04vckxoVFgwYXFmNjFSZzVSdUE0M2lpUGVCM1JEUk42UUJScTRLRitZ?=
 =?utf-8?B?aTFKSUI5OGRvOS9sUjhlcFpZQU1JOFpJcUN1WFBrSGprcTlMdFdUR09pSGx6?=
 =?utf-8?B?OHdmcW1MbEZKK0pJT3BGK1lCamxMTFJrL2U1YW8vOFpjR2YvdmJzQ2FxMG5u?=
 =?utf-8?B?ejJNY3BDU1hIbDNYczhkKzFJUlcwd1hGeWhOY3VLL0hxaWcxd28rNnRWNUUr?=
 =?utf-8?B?OEkyalJBTFdKb21NVzJUc2kvNXhEdnE3YTVLTmFJd1YrVlBGRUo5T2ZvUitL?=
 =?utf-8?B?MlFDWFZmRXFEMERQaTczVXd4SlN2V2VFb0c3dXh0dUluQmtGZXZRZlpNSlFG?=
 =?utf-8?B?UllLbGYrUHUrSmkvaVY5K1pSWUE0d00zcjUyU0NrNmxBcU1LZnZ3a3VBMC9M?=
 =?utf-8?B?VStZa1lUTk1IYXdTV2VMVWZOOS9CL0lORXhzV3l5R3dwTkFqSHBoenRqV0Fi?=
 =?utf-8?B?ZWdkZ1Jsb0laZE8vVjYrenBMd0ZtK3dhZHFhTWdvRWFlcllKOG0yTDl1OGhl?=
 =?utf-8?B?Y3c2Q0kwVTc2amhCNjZ3clEyUHNNVkx6N3QyaEY2SUp1bXNHL0E5ci9CTlRQ?=
 =?utf-8?B?c2piUkx1RzZKMytXREpSeG9mNVFLTEozdDVoaitFTUIzUE84Mm1BYmNnYUcw?=
 =?utf-8?B?dUZtSWZXQW9PWlhSbjFWeWZKU3Y3MTM0cmVoTEhJaUk3dlYrZVpacFdCajdJ?=
 =?utf-8?B?MEkwbWhWUWcyQ0JYUjA1QzRRNVFsRi9rZVVreWJ2KzlHNUc4UVdXVG9tRnJu?=
 =?utf-8?B?ejg5cUdNVUdRM3BiWFVCaTc1RlplR3A5MkRFSnE3bVY2RFJIV2JFekhTUzls?=
 =?utf-8?B?ZVJwc3V1cmxrTUZxRDNDZE0zL3J4cEVKalYzWHVPeS9BMEdDMnFqZGk0ZjNU?=
 =?utf-8?B?c1dJdE5teEJBNE1UQ0p6cXYvOFFNTGNtTHluUWZRWWFla3VYQnlJUE1KMllw?=
 =?utf-8?B?RHI1VFFnM25TMlFnUFE5elpqQkN1M3puZE5wRTRvRFRpdS9ZOGJuVEVVVS9Z?=
 =?utf-8?B?dU00RVFFWkFVNk5jemlOaFlibHFYT2kzakE4ZWFsVDd0RDJ2TW8vMmFwdURX?=
 =?utf-8?B?T2JXcHpyaG83MmR6cnU5OUlRZkk3c2NEUC9jTTR1bWE5ZVJkOW5ETDRuai9O?=
 =?utf-8?B?MDZRMHFNajFpbmlHUCtNb05Sa0syVGhCNzFlVjZZTXNCdWZNNG8wcXVaSUVN?=
 =?utf-8?B?bGo4T2tqQUtlZ0tRODZVdGpoZEQzQUY5V3NreWhNZmxHNURLTmVGSmVpTDNI?=
 =?utf-8?B?UWh4c0tNOE45Wlowd2RFS3hyNVdtU2ZkN0VzS0FseE9wR2R2TklEdG1HRk8x?=
 =?utf-8?B?WlJ1K0Rna0ZIczRUdDhIbGhFcjAzSVVkUThPb25vSVc3Qm5JZ09xSFQremtX?=
 =?utf-8?B?VmpBMU9OZFpOZGtJMldIRnBQbGhHM2IwTVcrSVdPc1FCR0wxVExEekVwZkRX?=
 =?utf-8?B?aVcvcE5wdnZPRXdIVHRYaVAxbEVwQlB5TkljTTdUaEtkaWp0S0QyR2lJWC8r?=
 =?utf-8?B?RjBHdDZRanplWW9XeVhodHlQUEZFdzFPOHoyZzR0eGEzQytBS3Z4bWc2MnJh?=
 =?utf-8?B?M2xUQUsrZmllVlpLbjN1VGFpS0RFa0RqM1dhaTBUSTBZS3JGbkIzSXhheTNy?=
 =?utf-8?B?YnBMMHJTV1JFUjhEM2ZEQ1VTUUl1cnU0TkdXSE9md0ZoeHlUS0oycTc1UFQ4?=
 =?utf-8?B?SDB5Ky9OVWRDVGg5NVpIaVRxaGVzUmJvM0QxVGlaZTFBK2UyZW5EL2k1K3RZ?=
 =?utf-8?B?bnhjZThudmlJVGhORSt1U1RKS1V5bEpCWnBvcjlVNVY1K0hEWm5sTUk5U2RK?=
 =?utf-8?B?SDRsNnViV0xlQnRKWkxMdTZwV2p0V2ZoRytLZVVjU29TVERwY08xR0FBTlZW?=
 =?utf-8?B?Tnd1T1dsd3BFcE9nQjhHSHEwS2ppZEZYVXI1blM2NjJubm9NaDh0QzROckJM?=
 =?utf-8?Q?NtX3r13a6Qw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUtxZXVWY1MydzJjRkh0TGM2dmJsdmNLQXRaRG11SU1sNy8rRWVmTXFGSjRR?=
 =?utf-8?B?ODk5RE91bm85bzFudjh1MGxYbmtwRUtTTmxLdFZxaXhQREY3bnZpQWcvR3Bk?=
 =?utf-8?B?ZDBZMzhVcU9yMzhuWDRtUXZUU0Y3NUs3dUN6NDlIOHFvL2w5Y2xKVmhtSFpx?=
 =?utf-8?B?ODdlSzN0a0JBc0VBVjhSdkRRTlhWMGVNakFYVjRSVCtHM21zcVRFZXE0ZSt6?=
 =?utf-8?B?Y1RVWEFnMDh5TjhVSkk5K2Z6cmQ5MmZEcHhra2JhYVNhOHdQUGVjYWtKYTlZ?=
 =?utf-8?B?d0tlc3dOMHdBWW9oZnNYTnRxNGNJa0ordERGUHhEUTFuMkhwTmdvdWFsR0lv?=
 =?utf-8?B?UTJTenFTdlo2d2huWml4UmZDckRoTXpMSkFZQnRqVDMrbTRZWEdaa0RvVmJE?=
 =?utf-8?B?Q0dHK3VYYzN5eFgrcGgweDR5MytwQmZOZlpIZStralQxOVF6alN4ZG13M1ll?=
 =?utf-8?B?ZVJ5c1VCNWhnUHV5Y1NZZDZUY1RBUkxGSWtsaVhzYnYvc1VVZDRZY0h5NUVH?=
 =?utf-8?B?emY1V3N0MlNWZ2Mvekp5VlIvaFE5WTBidzc3ZWhEb3hIQWdzTVRvYS9ydUlJ?=
 =?utf-8?B?SHk2SDhrVGVFL2F1b290QUlUem1MNWpMYk8zcHZhMzVnaEdLK1hNNU16Tito?=
 =?utf-8?B?am5aR2FPZUZEUXphajdKd0I3QjVyNGlkZmM4dDlldXN2RDNTMUppZHk3UkUv?=
 =?utf-8?B?SjFockp4ZUtyUFM2TCtvQkVnSUlydnpRQ3RCZ2h1R0w1dXZEUTg5Zk9UWVZn?=
 =?utf-8?B?bTlVMCtqMGZ5ZEJsSWNpUDhEdEZmUDI4U0tJRGkxL2k0WlpzSFlMQVJZN3lJ?=
 =?utf-8?B?T3YzREU4QmM3V1RCL1FHYi9DODF5NXRFMUljQTFaSjBEQ0ZwdnBpZkJRckVz?=
 =?utf-8?B?WVJLcjVmRmlVWGhXcFQvMjQ1bTdoS2xzUWFRN040ek5XODZPSEFVbmtLUUth?=
 =?utf-8?B?U3hMZlhPTitObVh1L0hnWlZoNDZocGVMVmJ4Sld4UERCeVBrUGhrQVlHSktE?=
 =?utf-8?B?dDArQ1lzSXZLWVgrT0h3U3JlMmZ0RGVVSUdHS00vMVlFNUNkcTlHanVadTRr?=
 =?utf-8?B?TjFFc2pRR0xYZ0g1SHhNRjlLaG9JejVhV3h5S3NRNWtCVE41dUNXajFuQ3k5?=
 =?utf-8?B?NFFWZmtqWXV2a3licGxpR0Q0UStuTmtFdHBmc0xobEtOMmZ6UW5VMXkzZUk2?=
 =?utf-8?B?c0V2ditkNWdyM3ljYWxpalNsQ08wT3hqOS8vZjJUbTg2VWZpUnRYalZpeS8r?=
 =?utf-8?B?cjJ5ajF3NGZFV0RxY2VCTDlvOHFEdHIvKytSTFdGeUVHS2hqY2l2aXl3K3Iw?=
 =?utf-8?B?OHFjMUdVUGZMK1JRSUlVeFZpRDRYQmRBNHFGVVdibHBxbDY4R1RRanR2WEhq?=
 =?utf-8?B?YXc4NWY1YXc5Qm1kdU45SDVyOHRoWXpldGtSZGJmcndoSDBlM0s5OXJFR3pB?=
 =?utf-8?B?d1RabnJZZk11NE1EbGZUT2UrWC9MUDRUYlNadWZycEd5d0NTbkM5NUYyOEx0?=
 =?utf-8?B?cGNIazRuMGd0S1lGUFloTUxsbjF5K1JBNjVTbGFqWFdMN1FlcUxOYXZPNUZB?=
 =?utf-8?B?NElRSi9RcUZnUjR1ZEo4Y2dHTTV0NW8zR1lrbGlLZ3l0NEZPbGZjbHhybjdr?=
 =?utf-8?B?Q3JYcTRGdnJiTmQxVm5TakJudFBFcTErVjZaYVBKMW0wTzgzMExRV1I4cTBL?=
 =?utf-8?B?Tkw5Mmx3RWVseStDODhNR2FxZGVBcDZBV0hXdWlTeHd4K3R1My9MZUcwV2JX?=
 =?utf-8?B?TVA2RDFIeG9ZZWRTR2IrK09jQ2RudjdVYVpDSUIyUnJySGUyTEI2ZUExZlRi?=
 =?utf-8?B?SlRhYm1QdXM3OWR4cU9qMnAxbFQvenltZjY5dSsxMXkyVXhrRXJRNXpzVFVV?=
 =?utf-8?B?K0hrMGZSU0E2YkZHSmxUS0JhYWt1NmZreEtoY3U1bG9maWpsaUxEWnVLeEJT?=
 =?utf-8?B?ZVRkZGMrTG1qVFN6Tk9WcUFVRExyOGIyb0NwZ04yRFMwOG85aUlKU2NTcEg5?=
 =?utf-8?B?QndyeTBFaW1FcWlIc0lnU0FXeVZsMCtYU08rRUNJTXZLSGFGSzdFYmpaWEc5?=
 =?utf-8?B?K0g3Vmo2aWJGelJZbXZZYXNUc3J5dUVUR1lsQ2ttd2VVRkFCMjV0Zy82Z0s0?=
 =?utf-8?Q?FaJgdoVK3dKqpAL8l5QxMhQB1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb430ea7-79cb-4a0e-45f7-08dd767c69ef
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:04:48.6281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MuRhNOtve5EadV3eYbWGDIf6XWcswBkPjDXuamD0bWExqWH4yX4uqJwONA4hwj/BHqnE4T5/5MUrnlxpl+RVdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5640

Hi,

This patch should be a V1 and the "changes in v2" were based upon an 
initial internal review.

Please let me know if the change should be re-sent as V1.


On 08-04-2025 14:00, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
>
> The hw_params() function for BE DAI was being called multiple times due
> to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.
>
> Remove the redundant state check to ensure hw_params() is called only once
> per BE DAI configuration.
>
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
> Changes in v2:
> - Update commit message as its not a fix.
> - Marked as RFC patch as it requires feedback from other users
>    perspective as well.
> - The patch is being sent separately as other patch is not RFC.
>
>   sound/soc/soc-pcm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index d7f6d3a6d312..c73be27c4ecb 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
>   			continue;
>   
>   		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
> -		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
>   		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
>   			continue;
>   
