Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012010.outbound.protection.outlook.com [40.93.195.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C8354AD2;
	Wed, 11 Feb 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806189; cv=fail; b=SKswXuU1R4Ym1kYoHK5J4D12woH3erYt+IiZOR6Alf8JWYjd9eyB1YMqQAM1pkbxGTg3wCDXrK7rGBNDud/t7mw8DXY/xC6HVfWRJJVQYWkxV1mZ9cDDGUk1DXq0L0nVGW1PdTsfwFwM9+LUL8QzryyRJ/tkKFIrHydmOzOf0xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806189; c=relaxed/simple;
	bh=uq40r4NHxY4aCAPYPcD6ICB48PvarPCaTonsj8Q/JQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WA9pnSrkAPo9cbshJVwjAUAU/h7yKsENjfYCEf+5RH/EBpYTRDez7IipHIqL6d9V1AA57WK0X1TIqLHeOhRM20239DXtjIJMXwE4j9sr+EMo3yilYMQZctb4EyKdNo8IQQAAZzzpTdDNWP0isudFl0rWgTLA0u+3lfnPv1dflPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pl9AGevu; arc=fail smtp.client-ip=40.93.195.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pl9AGevu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWzOPXXBAn0DwMsyBc8agFoG/0EFBTXEH0pX3QtRx9HzKoeO2Fkbf1FG1Q7zkPV1VlUQoIocbizTw21MM8VeSYb/Xlllb4rA6kfSr/QE5ov4aruObqzjM4xJvoRMOTdfkSyg20UxtjkQ/KD1SpKIrK3nhi3U6LJgKSMWZvtUnGrltHsQJgogkwl6oW/vB2cRPotzwQkNUjXtOCtNI2gZ2pk/Rmtczbm/Ho0MK1gohvZf2bgcdKVWRZgSkvfIM1Ab72Uv4g0pQdlYoyR7n/BZjfST0/LJq+RqG+ZvZNX2Qes3GWhNE7Zm1FdLgd/C22Z5fS/LaRxMnh0M/HKzw7ZPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLdNOgN1zkQT958Apuvo0f9UylkKVOw2FQDoYg1tlHY=;
 b=WvBCrHd10DMQpDAi7FKyDOU0wOkZqP5fNuqGCWbLdmnsthtxjScuDHGNML+WocCUJIDqFWFY2IZLSIL4SY0KphDACSkaYbKlt/YpHBTvG1OIhsP5UYcCaw0hUxOLP7KMFtXapH8N9jQtgwQA85I+2bG0sq+SpQjaTrGgEICgDrIxyushfmRwGyTXNoPCL+9b6zRfXhrfnciG5ucz+uxE2ZX5SI6JrhOVxSMwyclXHL5yWDTmJI4RWSFC+MBY0iyWOEqzl/ANNQaMOl6J2EAxTrIZcfSHuStoSHINUQ4tN6PvbGiFgt2RcEmxZwejmoUwgU6j1cJIDnm1YvJDdMrumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLdNOgN1zkQT958Apuvo0f9UylkKVOw2FQDoYg1tlHY=;
 b=Pl9AGevui7fDzAL94ajQEVXimAeueAmlUIqermSU1wbPKlWtDRt+zVMXh0jdJK19OsFiQHhrklewKlnlcwM5QIfKBfl1VV5Yd9Ih2U4my2cdrIwBcA46YkLQMqYdzufSazABNHeCbNIZ/XIA2pqIoTZiQp34c9LzD2RAm9+WzAgPgU4JZgbSB9MLFsvFb4QvdM4Ku2qxiFSEPT+jEj0P9ax8BBEKJHMgZsdp8lpzrY+MJQWnF1iLVnK0XZz3jscu8NiR6yY+PxmuPP7bFn7G9SqXcAzlXTTwd1Ea0zIk5TRhKh4UYgx9EEw6rIFZQUDTO6ytyzLA3Btw2NsXvbaxaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:36:24 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 10:36:24 +0000
Message-ID: <085ad06e-61fa-4f18-a7d4-d88554344553@nvidia.com>
Date: Wed, 11 Feb 2026 10:36:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Besar Wicaksono <bwicaksono@nvidia.com>, "will@kernel.org"
 <will@kernel.org>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 Rich Wiley <rwiley@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Sean Kelley <skelley@nvidia.com>, Yifei Wan <YWan@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Nirmoy Das <nirmoyd@nvidia.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
 <20260126181155.2776097-9-bwicaksono@nvidia.com>
 <a3249d0f-17f2-496d-ad53-95ad5da26f5a@kernel.org>
 <SJ0PR12MB56762714BF94D1E67511C43DA062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <bd69c94c-51d0-4166-a059-e46b30cb83e0@kernel.org>
 <SJ0PR12MB56763B5860CE8E93BEB4FF49A062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <a04e5648-86c0-4930-ac2f-a824acb35941@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <a04e5648-86c0-4930-ac2f-a824acb35941@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 8257c7dd-1c6b-4ccb-85e7-08de6959673b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk9VWUYzcmluTXVFbW54YThtWnk0LzZJM1QrUnV4Wmh3WVZyMSs5SnpNaDk1?=
 =?utf-8?B?OENhRDdBRDZocHNPRWdSNnl4bEE5ekRpU0lZblhZZXZSR1YvZ0hIVUhWV2c2?=
 =?utf-8?B?ZTcybTNBT3hQSUREWXZSQU0rNUswTVJrWkZiNWk2UWJENU1KMGdHT1I4bmQw?=
 =?utf-8?B?T295dDNxK1V5N3lOUlpjVzUrZXNhOHcyVDlRbUJXNjc5U0N1YncrQmVncTF0?=
 =?utf-8?B?bDZGN1dsenBDeitKTXFVY2pyTjdRQU85MFF0dDlJYk5HRXdoTnA3TFdLWVBJ?=
 =?utf-8?B?SVdoSzd0Sm10QytQYjAreWJ5dUlRcndoZVVRTlljVVVIQms3YnhOTU82dFRR?=
 =?utf-8?B?SkpsZWlncHNMM1hVNmg4dy9sT3Nqbk9iaGhxWmY1Y3F4SDRsSWZNVGVYZXMv?=
 =?utf-8?B?UkprWTkvaER3cXZRY1ZSaHUzWDJ1M0MvZ0p5dXBUc09XYU55WE9saFdqVUlw?=
 =?utf-8?B?RjJ2OGlpam0xaXBLbGJSeVBsbXVoQzFhSDdwcFFPQnU2RnBtRE1SM3RpdlJF?=
 =?utf-8?B?aE9LeUdSRGlpVmlmazNybW5HaUNsendSSm5FVzRPTWI5R2twWkZ1akVLK1Bx?=
 =?utf-8?B?ZTBmUlJweGZXTXhQVUtWNkRscGNaWVdmV1Vyc3Y1VmM2eUJzYkFOS216MG9F?=
 =?utf-8?B?UXFSLzNHa25pQkVkcGkreWhUSkZTSW1Sb2tWTzliajRxeHdMSmhUOU13dWZl?=
 =?utf-8?B?M3VGQ1d6UWR0TFczVE4zQkNTNks4QTU5N3JlWTE2N2R5dGJ4cXg5TTNUY3o4?=
 =?utf-8?B?Z1ovWE1aUWJROU05N3RsNUxhMnFqV3hqb2xLRDhkZy9KV3NGMHlaTzRVamU0?=
 =?utf-8?B?Y3NlSnY5VG1CbHJPWExZdnRxUmpPREZNNllxOGJWdWlrYVQ5WlRsdUs1b2xV?=
 =?utf-8?B?UjcrSFRJL1FSQTVtSGZKUlNqaVN2M0tmdGVHZXdrL293RkRiT0g0NzVmcVp4?=
 =?utf-8?B?M1NMcmZrWmZVbG9GNkdneTQwZDdNYXZjTjdySDBVclFud0tYOGRaRGRBbzNU?=
 =?utf-8?B?UHhiMis4ckovb2lqWVlIVVB6QmNJS0dHeUhmanY2aWM2SVowdVBOMDVTaDBo?=
 =?utf-8?B?d1JtQVVsakkxL3pCKzVNZVVyeFVPQy9DRVZzK1ZTS3UxSWwzbWZrUVZhV0NT?=
 =?utf-8?B?M2pibEpZalR3M1A3Tm1iLy9rNGxBWG1pWjdndjZ1VWhOSGdyVEN5eGh3YXhF?=
 =?utf-8?B?ZWJ1VWZpSXA2aWFFOWNyUFBhM3FCV2NUWmE3dm5obTk4Q1BkTnBLQ3hwWGoz?=
 =?utf-8?B?UUIwYVYrdG1ZRGErMzRXRm5maFBtQkNpajZHV3laZjZUR0JVei8vbGlzL0xq?=
 =?utf-8?B?ZllQT05FYUhEdlpkMDJRM3JjbUoyaHdBN3Zack1ncFR5elBTM3RGZFdDY2ZT?=
 =?utf-8?B?NXFvRkFnTzMyOGNSNVZONFJ5aWtubG4vOG5HYmZRbVIvenk5RXhjbGxCMElK?=
 =?utf-8?B?RHhBY1hDSEFxNTJiRjZNOHUyeVZOYWZGN2pCNkhvUjhkVFhrYUEzQzh2T0JZ?=
 =?utf-8?B?OTZwcURYVGd0ZjVrQlgyWmdqTk45Yy9kdXd1ZGtxaXR3RTBEdXhreHoxeVVT?=
 =?utf-8?B?K2kveFQ0cVdMTFN2aU5GMExGcXBHaU9BTVlqRlNMTjVLL0paSzFDdWF2WmdB?=
 =?utf-8?B?U2h3Z0d2cmJpNzBKc2ZXd1BtUVR6aVl6WEtKbDlhNzZqRTFRcmw3bUo1Q2Vv?=
 =?utf-8?B?UFF2YUxLZkM5dmwxQ0h0OHo2bGtVbGFZT2tkQ3Z5Yk5NTTgyZGNzWHZSRWtN?=
 =?utf-8?B?em4vc3lTekNOdjR1aVp6WjhzV2RwMmQvYkd3TGxtMHZCNE9Pc0dBTkF5T3pw?=
 =?utf-8?B?YUdGRTRIYVppL0VBdXo5OHdQR1ZDdEE2YmZXL0o5MW5udkU3SGtXeG9wdVp5?=
 =?utf-8?B?V3E1Q2FUZm40N2lvVk9SNnh5SytqYml1RjR6ajFWSVIwUlA1UENWM2hOVmJJ?=
 =?utf-8?B?ak9SQkxmbE5UaHpxK1UvNGVPUDVJMXhxQzk1dGJPTndsWm1acU5ZL0ZlOXJD?=
 =?utf-8?B?QklLck80TTRQbktPb1k1N3dvbzlsUVBNVUptdU02WnFvYjJvVUhlbFlTb3FS?=
 =?utf-8?B?UjUyYm1Xa0NzUnp4Sy9LWTgzS0RnUkc2bSs3SlBFZ2ZXV1Y0K3dSenM4S3lW?=
 =?utf-8?Q?EYX4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2Y4dFFnNlVLa21tV2lqQ0h2QklmU2p6VDRIdjIxR2FOU0FZRXVhNk04cVpF?=
 =?utf-8?B?THdYR0FKM2p4Qm15aEc2eWxXcXZZblZwa29UcDJTdEs0QXVYdEN1RFV5L2dl?=
 =?utf-8?B?WVlVUU93WFkyS2IxbUhpNXhMVkZTNFA2S0dPS3IzNHNIVUoyRU1vRmNwcGph?=
 =?utf-8?B?MCtaTGcxKzgrUWRNRmJBZVdBRENObnpGSFhzcUlyQWhiZldJTEtobVhoYWdK?=
 =?utf-8?B?MTI0VGlEYnJQYStaNys4d0xnMlIvYmduQU9xamRNZEVEaFFXQ2EvVUxEM2k5?=
 =?utf-8?B?MWpYV0NhcUxjaTBWaVhrL2pmVjF0OWN2V1B1VW90czJzSDI1M2NreSsrQWlL?=
 =?utf-8?B?WmRCTDMrMWJvd3NlcU9KZlBkdFZXMUVicUcyM3lHeTNTOWNWRDBEQ0NxbGFQ?=
 =?utf-8?B?MDFDYzlwZGYxajgyYTdxSy95UU51ems2MkpCSVVVWHhHbUJCL3VWVTl5Q25H?=
 =?utf-8?B?em5jZDF4VFlyMG9kdE5HeTRlaFUwNlpLZ0lOSGpaT3BZQTlwbUxHbGtHV3N4?=
 =?utf-8?B?RnVQNXh4cTVJU2NWRkdnRFFFbTFSbDk1aDFOT2ZJMnlhWklmRDlMaEJycG1N?=
 =?utf-8?B?MUswMXBIWXIxR1lJTGhlRGprK3lSUEc5TnFuNmpSY2pMdG1vUyt4L1ZqVjh2?=
 =?utf-8?B?K3luRVpOUVd2eHRHV2h6TGJqN3RwZWdBZitaeGxyc0s0QWhzVjJULzlITi9L?=
 =?utf-8?B?Q0tIME13MWlqb0JJbGdtZjMvd2Q1KzlYZWUrZzlJeTExVnVCN0ZjaVhObUw4?=
 =?utf-8?B?TmpVTkxUbGtKMCtmaThVc0VudGRqS0w2TTE0cDhjMVBwczM4YUg2c2VkWW5F?=
 =?utf-8?B?SG1xdGhWM2N2RGdzWmNrWHJCMUJGMmYycmdrNndMU3JnbmhIdVBQSUpHMmNh?=
 =?utf-8?B?bGFVK00rcVd3aE5ITVhzT0xSeXhYY0ZKS3NnQm5CdmZHWXJkWVpDTVFaaHJn?=
 =?utf-8?B?OU1jVzB5c2F4KzZKSzgyL0U2TWpYbjdPSUlseXJEeG00RFZpbzJPVzVadWR1?=
 =?utf-8?B?bmUwVzhLZWdUb0FmeEVVUlFwcWZxRzNtUVlpQjdiRHZENGM0R0MrYUl3YUJm?=
 =?utf-8?B?WW9tZFUxcTV6T3d3cEM5NlNOL1VPYXp1cGszZ1cyQjBYWUdNcHd4UVhqa00r?=
 =?utf-8?B?THA0dVY4djBaM01vMkN2N1RjTlJBcTNqRXdVQzRwMTBmNHpROEc1bWNLWEti?=
 =?utf-8?B?S0RjWFZzNUh6ZHdLRzJCdWlONy96WjRYQnVnbWdRcXdSb2pac2VaWTJlZnB5?=
 =?utf-8?B?TDVQL1RxN0NscDZZenA0WWpBWFlnckNZOVBoZllVS0R3YWt3VHNwVUFzSVA3?=
 =?utf-8?B?WUs3ZnNPTnVrSXZLQk1yRGxITzZLN2tmdXZsalRvVmRoc1E0Nm5IbVcvWjVu?=
 =?utf-8?B?aGszQituTHExRUpIWHFNcWVIZ2JtTFhTU2R3MURNRW50SDJ3Mkt4SmN0ejBt?=
 =?utf-8?B?Q2o3VFZnbjhzeUZ1QnZ6aGkyQUQ3Z2FHVmQ2Q3htUjljZ3VrRlhadlNwSVMz?=
 =?utf-8?B?WUJna21kaDRhNDMyRDZBRVhvdGVERlkzcFlyNExGWHpUNzVTTVdkUkthQng5?=
 =?utf-8?B?NW1nVHFzWVVVbm5iMXpNSnJqdHVGOGZJNDlpWXhsRWk0YWErR3RpbTdjNHQr?=
 =?utf-8?B?dnIrNytpZHRqUmt0bnNEY1pWbVRuY2FZbXF4QWcwZlE4L3lXeFVBczlwUVly?=
 =?utf-8?B?bFZiei9WMzhkY3VDdzZ1V2FvVXJQMjFwVlRHdXZaVXM0K1FFeVJDWmhIb1Aw?=
 =?utf-8?B?Nkp0MmtsTytnTzlEMG1sbm9wQ0N6QVVWVVgxQTdQL1lNRjVDWnJkR3hSZk1E?=
 =?utf-8?B?VmZRZHlYMU9BakhBRFVaRWdHVWR5YmlaazA0VWk3VlFHZzB6bXpNN095bjJo?=
 =?utf-8?B?YmRLbUZPNGlHL1VJM2h3OHlyWlFWRFl2YVlicjd6cE5YbDYwNFM1NVUxNzJm?=
 =?utf-8?B?UStpYzJhM1lDMjZLL1M1c2tqQW11Y25GZmdyNUFrTWVhYktoSUhMQTF6RWFG?=
 =?utf-8?B?WEVqQk8rSXJNcDdzUUlCcjYyOGVXV3VpRG90OFFNb2Fmc1BpVTRlTU8xcURK?=
 =?utf-8?B?QUNnRG1XT0w4cGpXYXBFbEhBdisrM1Z2RlZTc1Rhc0N5d0dwZnJRMTdtZ1Q4?=
 =?utf-8?B?Z0x0R3A0QWoxVmRlTzUzYUZ5RWFLMEhFRWpVeCtnV0t1bU5KSXRvdUFkUDFX?=
 =?utf-8?B?aldHR1owQlFPNnRMdUo5T292M29ld1hqWm1MMlJuaHN0U0cxZDRMQlFRMFFO?=
 =?utf-8?B?aWFZVXduREVpYm5oYnloQW8vRTBnQUhCc2Mzc1ZLOUcyMDA3NGpkYjY0dTlv?=
 =?utf-8?B?NkxzUkRneStpQ2lJU0ZJNGI1RzNqam1ZVU4xSk9sdFBHNDJwR09BWU9TOWpW?=
 =?utf-8?Q?rtub1Pt0y1jxSN+Arnvog7dUDkW0JCq52atx8p0fDBkKz?=
X-MS-Exchange-AntiSpam-MessageData-1: RenVOd3/Lyk60g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8257c7dd-1c6b-4ccb-85e7-08de6959673b
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:36:23.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tUls3RNvHxgD+F0UVkfFjT4PkIywwy+mxiWLquq4QSlEhpypTM9KE/a7sE55iksLI+Ec24bo1dabtwglIEW2sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600


On 11/02/2026 06:19, Krzysztof Kozlowski wrote:

...

>>>>>> Enable driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU device.
>>>>>
>>>>> Why? Why do we want it? Which *upstream board* uses it?
>>>>>
>>>>
>>>> These are for NVIDIA Vera platform (Tegra410 SoC).
>>>
>>> There is no such board (git grep), but anyway, don't explain it to me.
>>> Your commit should explain such stuff.
>>>
>>
>> This is a server platform. There is no upstream board using this device currently.
> 
> I don't understand why server or not server matters.

We should probably say this is an ACPI based platform.

> If there is no upstream user of this, it is wrong to add it to
> defconfig. This is upstream defconfig, not your distro.

This device does not support device-tree (so far) and hence, you will 
not see any device-tree for this. However, enabling this is still valid 
from an ACPI perspective.

Jon

-- 
nvpublic

