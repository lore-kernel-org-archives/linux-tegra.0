Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011054.outbound.protection.outlook.com [40.93.194.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B157279DAE;
	Tue, 30 Sep 2025 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759213234; cv=fail; b=U95KSOTSumsiDvXd8zzu+eKkLbY1wPIXG3QMcRwq5/LpXM/1ugcoZL2BOhW5CUtAqxX8Gn7wBuPv/7eywKayS5zKII13W1NubN21uDRnBEzCZXB0lERLKGhWkbeudDi1FGvdv8NnA3Srqhy2Dp+YzCo9dlbFTSzYd98g7AaSBa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759213234; c=relaxed/simple;
	bh=Xypjt7tWVSnciVe5yVwJkq3XDK1JdvLuE0Izx36Frrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LpMX00K5QLqXQeQyT9r6UjEHwMafFgA/RXeYKzJ7v3SlWINYRSTW4Lpa2r7DalMliEsxSlM8uxIYoEIy70XXhBs9c0Fu/na2m3mdH0Y3/5/rK74kssmIO5iWoLAs4LD+Gh/LiOsqs6D/mWAXne1hCsMOKg1OzQdWxYamPo7hz6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W/f571MF; arc=fail smtp.client-ip=40.93.194.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W/f571MF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kumXPgwJbTgJTnhWMtqKil6cPvknsyo+rDkV2MGP0hhzC6n1BytBGs0q8a2RRd2GxaXvp5gmUSDBaHwrXq3IE60iQf1qIPH1jyrPciUMykEIIVu6rEd5h14OikEeMwhD3m30miyT1q9gC3qgncNnOrZN4A/Ap6ebPCraG0ElW7QzHmFh1bayqlwWJ9Fj5osO7yYsXKxyxW8MLCgdcOKVuY4xHNdQZyZdY4sErlMbXw5gQpUAW1pBJgThp8/dhAW2nOfLMPevmOKI6XtxNU9eI6yQBjVkwsxXqbjhl7W/3XV2abA+7SFEbTXLSlE0kSHAejFLBZjO4EN3OOo5NewtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vEQvmZFhP5/3sLMyacFJo8iid3D9tsdW/UQ82QRjLQ=;
 b=EkKpXl6z0Z02MsJ8dL1bHLSqae9j+ATX9JkGdYOfRfRmOrhbo7AQ2qyL/pAb91QTrSJwPzbTbDxRpH5lUR256JqZOpTJnshqPd/aV4Bf3fG7JLt33wsQ3Y49/0Ovhrc8drQv/NnV/3oDx8PPCOVeFO8Ec4VObAGqLtFisMg0e8Agb2vV+lCWQhJ2WwmiNv9tl/Qa9XvpqDQrSa3dEjkRg7YTjWx9WOOWVbb3dklQcOpQE6dHK44v4cDvN8NuQd2iZRbhhWV2hEesat5o5FMHBru4QryIuhmZPWGSxB4bmF8d5VetaPTadU1Qny8eeVV93eEwGgmapPBrocNsRVuHPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vEQvmZFhP5/3sLMyacFJo8iid3D9tsdW/UQ82QRjLQ=;
 b=W/f571MF3jOSyqwkMceXS7T3r/ddP3bqEYJxXsKBoOvpshy3IKeQOwHfrRSivOXAmz/w3Owk6IOcrQqX8wahu4ZaOjobRHnwEpOH5RCdCqScfOEHDqXsFkv6rv0Mgc1iikbgrPE6XhhmhNJNYQYS2JT+579H8ErwMCgxWcaXk523D5xPOLRZtWxbf1x5ayV6dtSQ+CTwBNp2W8g7d22alupdtt8rQ4R2T+BVutdpC7ps9kbuMNTT/Yyex+qnuL3rjeNoRpquiYunhKVGk55EVW4HazpJ7Erfutyw6UXe2nLF9ZSdN4AfsiTMIJYGBm4P57m1RFWLVNvXGcyIUxzAgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DS7PR12MB8290.namprd12.prod.outlook.com (2603:10b6:8:d8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 06:20:30 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Tue, 30 Sep 2025
 06:20:30 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>,
 Stephen Boyd <sboyd@kernel.org>, webgeek1234@gmail.com
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
Subject: Re: [PATCH v4] soc: tegra: fuse: speedo-tegra210: Update speedo ids
Date: Tue, 30 Sep 2025 15:20:21 +0900
Message-ID: <2506705.jZfb76A358@senjougahara>
In-Reply-To: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>
References: <20250923-tegra210-speedo-v4-1-c12b5400ca91@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0302.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DS7PR12MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f93f0bc-6e2c-464f-991f-08ddffe97432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHNNOHlhUUcySjZoNFBhZ3FFWTAxQWUxaWJUa2diK21pMDVtVFNrWlJIcDdJ?=
 =?utf-8?B?TXBCSWRtSEh2emlVUWtSU1RvMVZEUU14VEtlQ1NoOXJhZ2RTNlhwVm9rYXJz?=
 =?utf-8?B?anlQUEkxYVQrTFVZM3VGbHJIZ1A0eVNNV2o3RFZaUitlNkpTVEZLa2Mwb3pa?=
 =?utf-8?B?eDZ3dW9Lb1UzekllcWgvbGcwaEl6akJpOUloZm9vSTVUTmZJK1dBMlE4TW9s?=
 =?utf-8?B?dm9CVER2M1BFNlU5dHJNbFM3c3M2WVl3bFZ3VUpmeWx2L1A2UVZoTHhmQzFI?=
 =?utf-8?B?ci9CR1Z2U1crQjRpS1o3cmRJMTRMenFhRnRudnp0U0ZPZUVmZEFGOEdVdWRS?=
 =?utf-8?B?d1l3RFV4L0R1eWdsSG9udHh3ZnBQdFJzNUpXNEdyWU9oVEVMaExxUkpqZ3BI?=
 =?utf-8?B?TVd6SERrb3dmTzNlUGdGY0NJQ1F1TGVFMnZQMDBMbTFSb0FMSWZJUGJ2V28y?=
 =?utf-8?B?QVNoUjlCbVlZd1VTZUJmZzU5ekRQVURVeGR5MThHK3l1c0NRanl1Qk5TZlBh?=
 =?utf-8?B?Smo1UzNyTlpYZ3JKeVc5L3p1U2ZaVFRiRUljbTJNbTVRQW0zakk5cXQzRlp0?=
 =?utf-8?B?NDhhRk96eTJVUTJ4Z3FqMHRoZlhYOEkxVFp2cWg5MWV4ZE81OHFIbi8rRm1x?=
 =?utf-8?B?bTJDOTB5UVM3MUc3VEZCR25NU2t2aDFVNHZ4VFZoV3IyVVZZR1lueTFPOVhO?=
 =?utf-8?B?M0c3eEsvQ1ZPWW01RzYrK1l6eVFXb2hCU2Q3MVFXS0tkZmRSS3BwVWJOTjN1?=
 =?utf-8?B?WUdVMHpEbzI1dFR0WnRTRUQ4TVNxSmV4UzZFdWpQSjJNNlZQUFpjMmlmRXFw?=
 =?utf-8?B?bFJwWk9yMUt3U1dabGhraUxyMUF2bGhReWdGeUxBWTZMdVArWE5qQ2M0ZWZm?=
 =?utf-8?B?cDlJUkpFci9EYkp5RUdRQU44aU5PUUtuWnpuNEk3eVdrV3Zzei9hdThGUHho?=
 =?utf-8?B?cXhtOVpOeXRrYlNyOXY5d3N5MzRwUFNpa1BXa092R01GbWpKTUovcTM1cTlp?=
 =?utf-8?B?aVF6STZ6SW5ib284UHlqYmg2bnorSVR5UmpxMzhyN21RYUR4NklKT050L1Uw?=
 =?utf-8?B?bkhvSUFKVHIyRzRuMUlpTk92SnJONFRPTFBiMUpqQURHZWJseEZUQXhmWnl1?=
 =?utf-8?B?QWsvTVcyWTZIYjJDYzFQS09udm9rVjNvaXlwa3FleWhKUjJobzhUYUEvbjd2?=
 =?utf-8?B?Q0lYTUwzcXBtTDFrUTdWa2d6bFVFQlEwTkJyWlAwVENNcnB1RWQwNTNwZzd3?=
 =?utf-8?B?VHNUZXQ0RXBTZytnWG1hcXZqVzluV0prOEk2bjVGT1ZlbGtqcFBGV1QwRXY4?=
 =?utf-8?B?alhPU0hMeHQ0SGtJSEhCNC9Ta21RMEtMSlUvU08zMW5PQ29vNHFoS3VxekhN?=
 =?utf-8?B?WmtLZ1BtUjRBTVhQYnhGVVdGV0pFVUJJcGZhMzhJQ2wzRkpWYjZhTDdMenhW?=
 =?utf-8?B?MGVjWm9UZFpkcHg1ZUJZUmFNUlEydGdFVTJXT01RMUdFWXFIYXhhNnJWcDFY?=
 =?utf-8?B?eWMwRWRxSnVVMzNPQTA1QWR5VXkvcklpMTBIZnpKTERWSVU3YzlWdlRNYVhU?=
 =?utf-8?B?cWUySGtyeDhVd2xpN0FEb3JweHVYTi9Ud3FPODdaSk4vUzBrUmVYc25nTTc0?=
 =?utf-8?B?ZVhVcFpZT1I0OC84SFQyeXB0N0V2WjJjOS8zSk1OY0JUZ3hTdjIxZjJqZ2d3?=
 =?utf-8?B?SnhvdENka0lWZWxWZHNKN3laMEV1U0pCMkZicHhKdmMxdGNjcmxkU1pVMmxH?=
 =?utf-8?B?ZzdWWjRqaTNtRTZGbVpwL2tTU2hCTHI1Zm0yU1FHWXlDL3RYQ0M2SlhPZUNK?=
 =?utf-8?B?QU5IQTBnU2hQa21Db0NvbGpuK1JDb3QvcjhNZklnNGNXMHZCRWlTRmExVUlq?=
 =?utf-8?B?YUp1YXFYZFYxNmkwaURTejRGMEM5VWxjS0pwMERCVGFZQ3FOVXZDamRCVU5L?=
 =?utf-8?B?RE1ZMTFaN2g4L3pwVkppSXRtMm1ZbEFSbzFSYzVZblNHOE1pTlJNK1ZYdDVD?=
 =?utf-8?B?Yjhpa2ZLRmRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0NWMFBVdEhqRUw3VHZSQjYwZ0Z5T0pOOGg2SkdIMERqcTBHZ2hNRy84TnFO?=
 =?utf-8?B?SkdtaFlWd2tzZFBhVDNKc2VtaHJzYWJhTm5sZllKZ2NvbSs1ZHByL0xIQ3dr?=
 =?utf-8?B?Zy9KejZLQXI1K2QwdGFwQndXZWVyNy91UTlJSkhGUXh0N1FHLzNiTWt2SFdo?=
 =?utf-8?B?YmpoZ0MzVUM1Q0NDU2swNWphMjJRMUJoU21zT3V6MjJKWFdGVmdTd3hxeGZE?=
 =?utf-8?B?ZDBJUklORDZESWlkeG5FcTZaM0xQd2Y3ZHBvWVBxYWJoS2hQL0Y2WjZSZG93?=
 =?utf-8?B?cUdWZ2pEZzV5c0RPUWh0S2lMMG42OUlCK0tQOFpnekNTODB4YWxTVnZrajl5?=
 =?utf-8?B?UVlDV0ZJQlpTOW9tMnQ1RkJ6b3JvWmk3Y0d5TFdGSTFldW1XOGxCS1BiYnM0?=
 =?utf-8?B?eGpEWEYzN2x1V0hDcHIzRFdOZmlRcVoxbTBhWG5ZQytiUFA4c3NoZm05SGNW?=
 =?utf-8?B?LzFWOElxUEtQaVpGQWV2TS9PbFJOWnFUMzhIMGhJSkJSYjY2TjVyYklHYThJ?=
 =?utf-8?B?YlEvdzJTRzlSVlVJM3NjblVaZVhBamJLSytXT1hqT3plTC9KbXNPMSt4RW1a?=
 =?utf-8?B?dmpNZWZwNE5pRGV2MGFHZTY5RGFSS052bTczWjZLWjF0OTAvN1gxT3gyQ1NH?=
 =?utf-8?B?a1d5RXpUTm92Wk1Xd2lPVVNSZU41RDZNREF2VUQxaS82ZS9GdmxWWE1WUHhM?=
 =?utf-8?B?dWwrT1NkS3JJcFAvYmNFRW5EM1J2Tjl6cXhlV0RSaXFkSWdSNXRrU3FqUGpX?=
 =?utf-8?B?cTNqK1F3MFp5YnF3S0RPTVdUTWxLa0RyM1BVQm8vSVliVENWVzJRVEFDUnZj?=
 =?utf-8?B?SHVvYkwrckNXZTZ0bEZtVlZyTGdFeWQrNVhXTGxDekdGcjhDOXpLTG84aWtx?=
 =?utf-8?B?eS91YWV3dTZaU1pBRFhxc3VkdHp3OVc4WWRlZmNlRU9YRitnTENIck5wK2l5?=
 =?utf-8?B?S3JLS0haSjUxbytpRkNCRVVKYWh2eUt1S1grSXRqY2p1VHBXcjljdFp0Z2pM?=
 =?utf-8?B?QzBUdTN4c0wyV2R5aWRrdlQ3U0NmdXhzTWJTMWppWkF4MVRiN2hFWXVnTUta?=
 =?utf-8?B?SGF3QjFYNmVjYVlxUU0rWG1UQlJTK1JsN2MwOGgwVkpUTGVOZmIvZ3phZnVo?=
 =?utf-8?B?TXM3Y1Zaa21ZeWcrYnFqMlpqWW5KYWEySGw3bGVFNHA2eHVRb0k2dHUweDBX?=
 =?utf-8?B?OEoxdVhHZ2IxUlV3UFpscTVqQ0xkbXh4aEN2YjBqUzE4Z1BkNkxUMXBYbzVD?=
 =?utf-8?B?anU5L1hsc05oK25qVjVBN1dSQk5mU2lEQWU2U1FiV096Y1N4WTdndFc4ZjVT?=
 =?utf-8?B?WXU2VEFrMFEwRmZZaFRNWFNmN1oxVG9YdVVFakVEd2NTR1ZXY2Z3c3ZrK3lW?=
 =?utf-8?B?Y2FSM3Ewd3UwTUYvaEpmWmxDQXI1a1FZT1c2b0FDSVh3MkUvSU5EdWs5K3lz?=
 =?utf-8?B?TjFqNmtLemY0dmQweVFoeE8yVVJ0R0s3UFFyNVFBZjRvUjMzd3NRT2NZSklC?=
 =?utf-8?B?MzdOaXB2WGxYTXhyOHBkMndVOHZ2WmhLR3NSb2x6dkozZU9PMmNvcWxTTWRp?=
 =?utf-8?B?VnhnQi9CaEVKQi80M0toSHlJZHcxajVKVEk0Z1VrNWs0eW5JaHZWU051Qzl5?=
 =?utf-8?B?ckYrYmZaakdSSGF0YUV2NUpneUxySytTcDZEVTI5NjBJM1NVT044ZjlKL1ds?=
 =?utf-8?B?UmhGVnVsd0g2RmZxY2JmSFFZejJJbW80L1ZYRU5IRk4xdTJNbGxiVzFhZ3Ro?=
 =?utf-8?B?UktxYndjRktkVkdHWUswMEZEbmtpdlpZa2w5dlRVRld6aCsxMVczT2tPcGp2?=
 =?utf-8?B?QmNTNk1WRjdEQnNReTZ5SGdWNEJmTGlLMEtzUnRyaGZBMEtIdXRiTUlrSUlY?=
 =?utf-8?B?MTJvMTlLWWxLNlVFam84K3A5by96Q1J4R2ROVllmOVhGaTdFdXc2QmV5bXdS?=
 =?utf-8?B?bjBFeEx2RjRzN21RSlRJNnZTWUJKNGNXbm1pRjdIUkZVY0YvbHJ1Skx3cElL?=
 =?utf-8?B?bzA5blMzdkJXY3lLYzh3RUVVV1ZFbERjdS8rd0VWSmhGaXNLQWE4dk9vU2FC?=
 =?utf-8?B?cldidzdzTmFOckVyUzZNelowM0JUNWNKbjQ3ZWNHck1DRzhFNWtlb2hyYlRu?=
 =?utf-8?B?MmQvYTVUY0VvZHQ1MGtSakQvZFovaTNTU3IzczFzTlM3c2ZSVVpDbUZiWFhF?=
 =?utf-8?B?NFduSzY4Y3o4L1lVS2k1MHRTaE1rV1IwSFUyTUZwWkxyNGJjL1ZsaUQ2Y2xl?=
 =?utf-8?B?aDMyOHUyaU1ZVWFWbGZqa1VPUW1RPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f93f0bc-6e2c-464f-991f-08ddffe97432
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:20:30.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63fHDr3ZES3cmt/KithIJ0HM6SV3ipN2VO0RT/G6Zsama3141+nIZBkSxbL/aU/2ndNqBaCSbi8WMh4NYVlJ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8290

On Wednesday, September 24, 2025 1:58=E2=80=AFAM Aaron Kling via B4 Relay w=
rote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Existing code only sets cpu and gpu speedo ids 0 and 1. The cpu dvfs
> code supports 11 ids and nouveau supports 5. This aligns with what the
> downstream vendor kernel supports. Align skus with the downstream list.
>=20
> The Tegra210 CVB tables were added in the first referenced fixes commit.
> Since then, all Tegra210 socs have tried to scale to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
>=20
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Fixes: 579db6e5d9b8 ("arm64: tegra: Enable DFLL support on Jetson Nano")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> The Tegra210 CVB tables were added in commit 2b2dbc2f94e5. Since then,
> all Tegra210 socs have tried to scale the cpu to 1.9 GHz, when the
> supported devkits are only supposed to scale to 1.5 or 1.7 GHZ.
> Overclocking should not be the default state.
> ---
> Changes in v4:
> - Check soc chip revision instead of speedo revision in speedo id
>   conversion
> - Link to v3: https://lore.kernel.org/r/20250903-tegra210-speedo-v3-1-73e=
09e0fbb36@gmail.com
>=20
> Changes in v3:
> - Drop all patches related to limiting cpu frequency from a dt property
> - Link to v2: https://lore.kernel.org/r/20250903-tegra210-speedo-v2-0-89e=
6f86b8942@gmail.com
>=20
> Changes in v2:
> - Define units in patch 1
> - Update patch 1 commit message to better explain the need
> - Pull all downstream sku's into patch 2, which eliminates patch 3
> - Update patch 4 commit message to indicate the limit is due to thermal
>   constraints.
> - Link to v1: https://lore.kernel.org/r/20250816-tegra210-speedo-v1-0-a98=
1360adc27@gmail.com
> ---
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 62 ++++++++++++++++++++++----=
------
>  1 file changed, 43 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra210.c b/drivers/soc/tegra=
/fuse/speedo-tegra210.c
> index 695d0b7f9a8abe53c497155603147420cda40b63..a8cc3632977230fbfda0f8c3b=
fa7b7b25c2378fe 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra210.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra210.c
> @@ -65,27 +65,51 @@ static void __init rev_sku_to_speedo_ids(struct tegra=
_sku_info *sku_info,
>  	sku_info->gpu_speedo_id =3D 0;
>  	*threshold =3D THRESHOLD_INDEX_0;
> =20
> -	switch (sku) {
> -	case 0x00: /* Engineering SKU */
> -	case 0x01: /* Engineering SKU */
> -	case 0x07:
> -	case 0x17:
> -	case 0x27:
> -		if (speedo_rev >=3D 2)
> +	if (sku_info->revision >=3D TEGRA_REVISION_A02) {
> +		switch (sku) {
> +		case 0x00: /* Engineering SKU */
> +		case 0x01: /* Engineering SKU */
> +		case 0x13:
> +			sku_info->cpu_speedo_id =3D 5;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		case 0x07:
> +		case 0x17:
> +		case 0x1F:
> +			sku_info->cpu_speedo_id =3D 7;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		case 0x27:
> +			sku_info->cpu_speedo_id =3D 1;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		case 0x83:
> +			sku_info->cpu_speedo_id =3D 3;
> +			sku_info->gpu_speedo_id =3D 3;
> +			break;
> +
> +		case 0x87:
> +			sku_info->cpu_speedo_id =3D 2;
>  			sku_info->gpu_speedo_id =3D 1;
> -		break;
> -
> -	case 0x13:
> -		if (speedo_rev >=3D 2)
> -			sku_info->gpu_speedo_id =3D 1;
> -
> -		sku_info->cpu_speedo_id =3D 1;
> -		break;
> -
> -	default:
> +			break;
> +
> +		case 0x8F:
> +			sku_info->cpu_speedo_id =3D 9;
> +			sku_info->gpu_speedo_id =3D 2;
> +			break;
> +
> +		default:
> +			pr_err("Tegra210: unknown revision 2 or newer SKU %#04x\n", sku);
> +			/* Using the default for the error case */
> +			break;
> +		}
> +	} else if (sku =3D=3D 0x00 || sku =3D=3D 0x01 || sku =3D=3D 0x07 || sku=
 =3D=3D 0x13 || sku =3D=3D 0x17) {
> +		sku_info->gpu_speedo_id =3D 1;
> +	} else {
>  		pr_err("Tegra210: unknown SKU %#04x\n", sku);
> -		/* Using the default for the error case */
> -		break;
>  	}
>  }
> =20
>=20
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250812-tegra210-speedo-470691e8b8cc
>=20
> Best regards,
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



