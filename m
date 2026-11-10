Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794330370;
	b=Dg3P2yjWuplSJ5NC+hcIVEyf6er5Yql1ZT7UTDOm1CH7WuU0A47ew/iKoj/pyvYG9g87
	 ERMO5VMKKQ0TudTQ0wdz5CWJM6oiBK9yFLlbcmzGq+ZKDoGs3caL7Y3XH2iA/o81RfUCy
	 /YZWPavajMA/Yl5K9byRbHR2cRjtTnX2a0q/UAgrVR5Y8IeXm3KEiuNJBWQ4//3JYuKPZ
	 JVhuV9GockRJ/Jsr3UUFvoLzLXmyyVlwfAYM0WKDtWW/zXnnHNXWkcIKaxaWQwwiI1l/9
	 VmOqH8hKCDxjXhDDerZdrrTxPQCnFwrSMpWkIQ1Fm+CZi2G2BZ/K51yrkuTGwsXpDnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330370;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=65Ah5YI/pAP20PrwkJDJGUt+56BamBvAJbUHTvCEQA0=;
	b=EIEIpe/TZWexuPjWo5DmHav50Q2CCy2tQ8eisj96es3x1F0AaNrX4kU46J7lTc/ySp+a
	 9D+jUlmwWZIoiEbMz4qhn8fPNdXw6KnJdeKRfc9owy2plIyUNI9KMXRdO+i14MdMONFBf
	 kFoRcsqMUXSw9d/fUg1WZ0WAvbKVFWpqA2WFn2Qs+ufjGJVJVV9Dn9A9j+k6IV/u6Q5mp
	 D1XU5xBp64OV4fSdKaUNVGVNdAqH7RgqsfxhMvJ0nznr99YnW3PQ8s+CquJl5guvEwbLb
	 /ZCyx2MBdh52Y1qo2aYtlQCQsxdDCCSupvMcMOZgEscFqKq9fHK7h/8+Eh9c8PKTsIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AptMlRAe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C8C606A320;
	Tue, 10 Nov 2026 17:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C8C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AptMlRAe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRgnvBp4M3PwXqZyF5C8M/K2EQ9BPYWNhy8QZwu+gLAdXw/rGUtYAQL9GZCwt9Nfoo6Je9hk6uu/7s4vdn2WZVwEBaP4KD6n2BU0GpePXy1NdU0B/AzIjZhjUbfB59MimjdA1fMQrTIa1/UJwHYqMq/iyq1B0og6k3ZoqIEm1jmxe0YUQ4pzeoV/hf4c72DkhnF0wtqLqpTTWpH1d5s4CQFjPR/fWZAn11cw9/LbrHHJHTFajRK2d83DLkxCvlAeiQrsSXsuOnzeJdbMgmCnnMPyM6xTCkrC0GlFiBotzyhCnYTJhOyYqlNzX9HciYw/JNS5eiVuKpGnuMvOm5BCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65Ah5YI/pAP20PrwkJDJGUt+56BamBvAJbUHTvCEQA0=;
 b=SnV9kBE4y1hLG3v9FQFRZI5csvRUDwtbnjjecCpJwiqtGF3AVFXn+vmNBB2B4qJufRUpPqWFccBw7ATol1aj5wFdNUdgQiDibE9FIPRugVlpx1H/8RVHYQw56k/UaDBech5KxGs1c7799DVIvH0Brpv+zHKG84GkKb9aVtdS3KaOstu7guTUV+URg363673nSIc59SdNPMiBVgQ0sXLYIrvGhNoj/uKviLVmj2Du6CIUiEoTAVyukJ1i/RfToBc0XX6HqZsP5mkvXmr21TRjpULbKtPZ+k+yNRGqw4eQP2wV4gZ04wfYwSAfu7fNnj+afACl8r+Xcz9eNNE6NtrSkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65Ah5YI/pAP20PrwkJDJGUt+56BamBvAJbUHTvCEQA0=;
 b=AptMlRAe6hbS0yOcFUfSWTDlVLFd11odl6+S7VKvaKBtGmqCNX7aAaiS56nQ3LQXioOgWNi9/90EpN1gxLWE6xalFNbvjLwLVn4MHwE6dkzif4+QeS+7GlroksOYpYJ7niKLcMdwCvtZjZITuDWwIeWGpbrO70o3Vc1FpyTnetRwgtSgsBMcdAgAonMgXy54cJIkdNn1LDSj1qRJk+bBZhZX2uqfCuShjTd5rKVEljUO2SHNffwpRo0rHPqfQpFYQYclqItalmXUrl6tXEmK56S+uMzq1Tg5My17BDHILvFfJuFRqazc9vDKXfVzyFFIgDDjIVRLjJQTxwjB1eWsNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by CH3PR12MB578402.namprd12.prod.outlook.com (2603:10b6:610:34a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 17:06:07 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 17:06:06 +0000
Message-ID: <a3616176-ba50-45d2-a0d4-46fd5f6379c2@nvidia.com>
Date: Tue, 10 Nov 2026 17:06:01 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: tegra: Use non-HS timings for clock divisor
To: Akhil R <akhilrajeev@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kartik Rajput <kkartik@nvidia.com>, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261110162300.3834584-1-akhilrajeev@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20261110162300.3834584-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0063.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::27) To PH8PR12MB7110.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|CH3PR12MB578402:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e33120-7cc2-4278-98f9-08df3f4ce8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|10067099003|261009221227099003|261009220027099003|261009221727099003|921020|11063799006|56012099006|261009223027099003|261009223327099003|261102123227099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	8UGwKokdGWTHx0xFCBOAhIPkPIj6Mjaq49kGnvlmWa4qnSIf9i761MM6hnv5jpwKvh6H857Q6w1O9r0WRvdTkhxW0JfdCQ1kmerMSwpEhbqWC9PuZvSVDIdGZspmYYoev4p4YXqGwAP/DHYCF1jHgZU17ysEKHtxFfwu5/tAC8DqmnlxQrlCWGBl0Al460fLHUJDYoSr+fNoKMCEkL4BThQuvgorRgZKuMqqW8zrTcw62xpnzXLkOzNBPjW1ndtJbS0EDKNVR6cbLd4qSyiToCdXtOTYmbiPIlB/nezNF8WWAk4S4yN+Mwt+YixOHK5MovIIPBQBlIFpUUBWQA1zJ18ULG3xw/AxrQuZtNeKRbIgsbz4mTdExQ0bBKjU52nRVh5UQ18Ir7r3DWcNw8O4nPLRHQJcAXsMV08YuuBmlkKEFmI4EmfDMZ4yd2ZM7nzQOBfvX0YBN4AHkbzBT0yhKWnZ/9/ShzkojvU2n5nP8eTZPQ+OnPs+FImDQtYin2Dqx0ScaMvvbUIc6QUA8R3/97sTlgimVe7Un5N9E5cZ5hYCI6pNaGdNtxAW5rYXatRSRVSj0NM+4pDZdczkDuPaZkS5KH+NVBI7l78pf+c6FCXu46Af4/EOpha9PtkOBZDLvk8R3HLpBif16qwn07GgkGCdYQ65JthbB2XHM/u9OkUdD5ZD8NuVXrZS3f7kUXVo5EVfxVP12Xtb9rA8+NP5mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(10067099003)(261009221227099003)(261009220027099003)(261009221727099003)(921020)(11063799006)(56012099006)(261009223027099003)(261009223327099003)(261102123227099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCtrb1lwYjEveUwyTE1OY1BiUFl0d0VpSlgvVEdObk9IeEc3M2tYUjM3ekQz?=
 =?utf-8?B?Z213TE16UjJ5NmZkdWM0SU8yaGdhQ0Y4Y2tkK01LQXB3VVovZ0c4TlBpeDRa?=
 =?utf-8?B?VHNTWGVyNnQ2N0pvNU54UmJ3STZFRnp0STdpMkVOeHhCclR6TklSZzFZNkts?=
 =?utf-8?B?WGZtTU91dkFIUS82Y0VaRU9lVWlKaXNpMjFWWWg0NUltMXJoUEtNZDVGbzZu?=
 =?utf-8?B?OGNoWDlDSzE5Rk1QZm9sb0RqdHFVa2l5blhhWXdmREdwUEJMbk9qd3NsTURk?=
 =?utf-8?B?cUdxd2hiMlFtVXlxb2ZzTWFIV1NEd0p5QmtEU2ZaWEJ6UWFjWVk3aE9reDJx?=
 =?utf-8?B?dTlhRjlseU1ydUxTSTFPTk1Qb2EzdnQ0RVBzd1B5Qzc2S0k5WXpDVDJPQVYw?=
 =?utf-8?B?L042L3NvUDEvbTY0Z2owenFTVUpOY2VBWUpCb3NLY3JRLzFuVXV2R2QxS0RK?=
 =?utf-8?B?c1BXRDNJODUxUGJXRkg3M2FoS3FhVUFtWjU5Z2VLUHJMbE0vZU5ZUEdLdjJr?=
 =?utf-8?B?c3Zzb01pRFhzSEp0ekNsVmlZbmpGSVVqM0JSSjFUaDdvcm1uZ3NNZzJ6M3Rx?=
 =?utf-8?B?U2Q5WmlYOHNNakNSMmswVS9tTUhRSDE3Zk9NY1A2aG5XNGhJUTljM3ZFUjNx?=
 =?utf-8?B?OXQ1QWpXcXhnK2JjeGF5Mm0xTmF3LzFrd1o1YzQzTzVET2k4R0RlMmtRZ0Fk?=
 =?utf-8?B?bmxlZzNwWnFrS1o3Qk13UU4wbUVvbWtjdU5YMnN1M1dsQUNYMjNMMmxtUngy?=
 =?utf-8?B?SnZuTUhOVExqSFFDRkJXaHpyTGovNVZYS3NTZU5kTFovVVpHZGN5d1FiOFQ3?=
 =?utf-8?B?b2pRV09SdkVDS09BdHJCVldCWU0zUU01NWVmaVd4dVJmNW9qaUZ1bXJTaDlB?=
 =?utf-8?B?VlZ6aGEzWEFaKzl5dVBpbmNZMnljM3RQb0JhWTlrWmFCMGFWZSs1MXlrRW1Y?=
 =?utf-8?B?Y291ejBrYjZadnZTN2FzMFAzZTlXWEpvWmgrM0Q0WE9Od2RWMUcvUHRoMzV4?=
 =?utf-8?B?K0RsWWxTU1JOdkd6OWxXdk02RitjQXVHZzg1cjltQ0xvQnpuTFNsaVNqdm4v?=
 =?utf-8?B?UFg0WlZ0UWRid2hpOGVGNkJiclNoMDIrOU5kSnR2VXNVbDlhV1lJWEc0Smhn?=
 =?utf-8?B?YmtTL0VVTVErZEFrWWg1YkZOa2pZNEpaMDdFN2NHZkR2OTBNZnp6L2JVci8v?=
 =?utf-8?B?dnloQnVud3VkU3haa0dZa3NyVUpoYmxQT3Vpako4cVdGcEFGcUZVNGRVbmEr?=
 =?utf-8?B?R01OejJtQjlLZlJWTzNkQlVaaVJFRDhwVnptdGY4WnFJQ1lyOXQ0M21MZnk5?=
 =?utf-8?B?Q0pyZ2FHODlKdWxkNjlwb015alFBa29kaHMwOEpTVnJMMnhMSFQ4Q3BhQ3lk?=
 =?utf-8?B?cldqTkJ4UitKY3NXODVXUisrT0ZISkhOdlByQVZtWTBPQ0doeGpPWnVsdHRO?=
 =?utf-8?B?c2grMGU1V3FWR3BpR2ZQWmhRa1FyaVdFKzRvUVpsQjJTaW1uYnIxNzJrSERG?=
 =?utf-8?B?cUMySlJoQ2pLQWdkZXMrR2xhQ0U1Y3NJcndSUDgrdU1DUjRQb2h5TzZlUjVL?=
 =?utf-8?B?eEVod1l4TmdFeS9HSW5CNlRkYWpxdjYyTVIyYUQvVHg1am91VUZNaWZHV1gy?=
 =?utf-8?B?LzJ1K3lhVG9UWFV6VkIrQzB0b1YyMjVFN0NkN3hKQzQ3dVhYYlZKbG1UcDdX?=
 =?utf-8?B?R05UclE2azU5NWk5eG5zT1JScUZxMHhjbUs5MEVUemI5OW9tTGpuQi9yRVcy?=
 =?utf-8?B?Umx1ZmpXNWp3UHRBd3FOVU0yTEVTMG53K0RGQm43YVhTZXl2b2pCMk8yU0VB?=
 =?utf-8?B?N2hWcFkvTThlOTg2TklDZXVDamFPTkpVbVVJbU9xRGlRbzlTMnU1OCtOTUFZ?=
 =?utf-8?B?ZFU1YkVEMlczc1M4bCtMbkt0SS9OM09hako1eWt5YlpudjYzUEM1c3htbitN?=
 =?utf-8?B?MXBZZ3pwQ2dJRUZuWkRBNnk5dUtRNGNBZXdqSXBsNmNHOUNzYk5sNnBUMWh2?=
 =?utf-8?B?dmdzOWVXTkx3cUhhbENOaHJVdUovSWg2TDh6UEo1Q1dFemVYMFpnNW92OTEy?=
 =?utf-8?B?N2ZONG9BdFRlQUhvUXp6RnN6Z1JOZ0RGbVJZaDgxSFk2U3JJT1NRTVNBTVJS?=
 =?utf-8?B?Q2FjS29FZmlDZTVibnpEazF5bXNHbXdhVzlhbkp0aGtjLzM1ZUp6Uzh3dzdm?=
 =?utf-8?B?djdPMlMweUpuUmY1dFVUc1RCYlBiU2hUU0oxeTlEU2FvYzN6UjFxRUJQTHNL?=
 =?utf-8?B?L2ZSanJ3OHI4bkhPMUlNcnhlSmxma0FPa1A5QkpKMjIydWtQOEhDTi9Rb1g4?=
 =?utf-8?B?S0JkMHYyZWZtUXZ0UlRoWFl3VktNbDY1dUkrUU5pY0tmY2VsclE1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e33120-7cc2-4278-98f9-08df3f4ce8b5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 17:06:06.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAP95xJzevQHiD3bQuq5fyHNWogIFKtZXLgppTqY2/nb2sYnDuUMgO0SMJeSITgF8J/0nce4BeRQMhjYZgxTaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB578402


On 10/11/2026 16:23, Akhil R wrote:
> Programming the HS timing registers overwrites the local tlow and thigh
> values before they are used to calculate the controller clock rate. On
> controllers with HS support, this mixes HS timings with the clock divisor
> calculation and sets an incorrect clock rate.
> 
> Calculate the clock multiplier before the HS register setup overwrites
> the selected non-HS timings.
> 
> Fixes: 978b3ccbbac3 ("i2c: tegra: Add HS mode support")
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 76d21bc51c618..6a98432734d37 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -976,6 +976,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
>  		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->interface_timing_1);
>  
> +	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
> +
>  	/* Write HS mode registers. These will get used only for HS mode*/
>  	if (i2c_dev->hw->enable_hs_mode_support) {
>  		tlow = i2c_dev->hw->tlow_hs_mode;
> @@ -988,8 +990,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>  		i2c_writel(i2c_dev, tsu_thd, i2c_dev->hw->regs->hs_interface_timing_1);
>  	}
>  
> -	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
> -
>  	err = clk_set_rate(i2c_dev->div_clk,
>  			   t->bus_freq_hz * clk_multiplier);
>  	if (err) {
> 
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

