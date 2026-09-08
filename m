Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483B58E2C0;
	Tue,  8 Sep 2026 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886909; cv=fail; b=ZzJCnvd3zs55umF9zaoGHsth/Q1g+j/UFqlsSqrBoPx0fMsE0+wEILPkUOvwk31Irx7kCVuQaTZVrkLJXT8Y8Ei6D6/RP+1BXuXRn347L07GboJJoo1kRqssbKtAqJ/wW0Wn/VBH0PLSlHmzYdeVct4iAboesxavasCEyfCt65U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886909; c=relaxed/simple;
	bh=/ZJVAtkZQPkExOoWpyfTDWzItpcmjz9P2OAzzdjXcaY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tRrZPie9PP+1I35moRrLTRGzsBtnUf+ttoqNViCYTE7owSDzQtYxPGt18jjDj/178Shlmn7wSxq9zN5okRW3E1nZiFQFUQgu5nF4I6icWJMcziRzPBUUj7xl2J1CZBQsADNvzqfCjAD6Kzmncw2n529k/Rql1NUmBjYfFmBHF8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GtsbbwC7; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GtsbbwC7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAWIOTPuC/rdyoWllrrZxDScDiaOrJzWFHwneuqYJXCBee+xuvixHQYtEoOtHnTiMdxUerrS1G8Htx4ZcBBH/8V7sv8V3terd6K8iW/dMMSwbAFpvetJ9i/nek2TkOW3cIIu1fEDtqMFcQvfiTHjJnOdBvHaF6OUIyxgsKE3DGCUbtzlIOJZoW3dSajyqcNhaaPlzHtX4Tahg9DvJtN0uL5pZTsyfFFTotMJuiUMAYan3WJboc8hRvCYAJxZFcvdVh14Nl6KPRh2sriQ5/gacazSEQRHt7DUJXviBR2DZUMy8RB6aYcM6Cy6ZbP2xqk1CCIQNiO1l0o7i1IQ3KoQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N5SJITiFrbPB8weiz9fFzLiYJicRzJy5TmySuKbi2o=;
 b=Q6VKnj12XBbQ5BL/HWov01ctKO4sRMwYJ23liNX0d+pDvcwDq5cMQ9FnsLhShh3GYmLMhb/XA/HPMTFuTKZp6teOCBJnkz8HLbLEBD8L1Mbq6Qx14eHaajDV/vIeyUNb4bZpRxBCazPXnsDWEsJ81n6nNKD6lqjUzG4CngxvqCni8Wy/mLlIdGdclD5WmKOgoDY1o5DZ63+m3LARHGuM93e11KRtUdhOlOXieibzWD+Go6JlQWgtZg1mindR6fuXeX7xWIMeCYm2Bzuk2BqMvkWjN5qnxnfSw1ew2H+/Wj1S2jbkH1ttYV8vBLmlV0s3560GgDy9kXa7+YOmBPM9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N5SJITiFrbPB8weiz9fFzLiYJicRzJy5TmySuKbi2o=;
 b=GtsbbwC7RkIaqyadbzg7laaxsSWtJIE8IwnNKwILyXa959gcsS5B5hQDkqfmlM3K4ESIBpIsFHQhcKpLct3EQX6jXd6p5tThryXQ7m3YR8BxpbGm4m8WBt0YN+h0PUhfjYEui5XBxzZIFZQExeLolOzlcXIlSYVQQplxlUIH1rlgTCjxRtBPM5XbDurCnkKeT76bjZYx9vAYog6cPiUczHAyXk0831pMgHDh6uKbkLzvFT/28MyCdKpwVWHHHLyeKxbi4aB44m3DuoxcmLFt4Vb6+ttAimlkKBtGXkx5EuFDWUAeIRmDCAr3vwERZ2HL4/XPuPiAahG5nFeXgrDVhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 17:01:41 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:01:39 +0000
Message-ID: <f74e21be-c66a-4a26-8b32-389c2d118c02@nvidia.com>
Date: Tue, 8 Sep 2026 18:01:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/4] phy: tegra: xusb: Add Tegra264 support
To: Wayne Chang <waynec@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903071937.533646-1-waynec@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260903071937.533646-1-waynec@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b719ff6-308e-4f76-374f-08df0dcad958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fT/HBMTE48Wcjiwaeg0AW2zfx+dgekFKFL9UcVrh7THF0k9uVi9nZ1hxhL+XWk9f87DUpkBVnaGYvOgok1FKtquwtiqceAz15pVt0M/wqJofEYaluyUKRahls3TsXlc7eF15qvTcvNO/JSOapO3oIBVp18HZMgZ65I/ZqGsZrg5w6isNp/zZM/R4RYQ7dwipR+7oYgN3DNi3vRgkWZjbdA8Oz3rEL+tBeG/HmmSXaU3K9k7TgLLxqhOIeFQiA+7H8lQp2cYgKyCgRQsQYqC7DT146ejvs5vEnJFLDDDebxQLopa6wqIq8vqUHc1s+NnLsIh5yZx/mKEoIvqfF+aaNPsBBA9CQrhJXKr352MeoK2yaiod8awJjgpM/k0h5vc5rS3btCuMFonnnNM0X09kAp2ZvbVc2co/xA+ehLkWT5c19REAs1+YTgaNsQb5efClJjF1EG+Qnu/Q8TkFv5SNAKrBlIvWWCDLdPHaJjm8TltAvq3aFewYMgzdSmwTuDmSjC8Y0asR6GXIchiBMZYpfOmdwlZHkiVTMkJ8oMz/sIsirdNhacybZUQQBh3ZvQL22EsVHR9g9vb3uyzjIvrFv7Bod5EwgWpn2m+eGqZp6jZl3WaS1fGyyylsDjML18g8D0RZUTc05V2gN2sZp0mLYllNVV5o3NnEGie3G3fvXhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzVFaXExakJVUnJPM1g5VGJxZGJ5eGtPdTZ1OHFBWkhFMWdGVnFJbmlEN0ho?=
 =?utf-8?B?U2lGNThMWHNZRnRSRVpPTXl6SlhKREluVHdSSm9ESExBZ3lFSWtFNmVEU3VC?=
 =?utf-8?B?b2p2TXlqTFZkRzhibkVKbHZrOE45dkZMakJMSDhNVUYvNDVEVFhHdGM1czRo?=
 =?utf-8?B?TktiRTQ5YitFMnMvUTRzellCUVVYTDllMnJsMXJpMUxkVHR0ZWFXdUtyMUlL?=
 =?utf-8?B?WVgzZUlJRHErdWoxYW1hcjkrZEpMOWVyUThDcGgyYUN0THNlU1NxVStydVFo?=
 =?utf-8?B?alJpa2tmSW1wWlUzWXNLR1lybkRiZWxldEVaQmZjOWltLzVCbGxEczhSZU1Z?=
 =?utf-8?B?TGFaelZjdXpycVhLWXE1Zk05RmU1VTlJSEpBdHdJYlBBemdKa1BGVERJSVhj?=
 =?utf-8?B?TUZTNmZnQnoxcjJCTDdmaXN3SURPQ0hwajh2aUtvbm1CWGtYMW9aUmhmVTNJ?=
 =?utf-8?B?OUx5UEpzTTRLYWFhUEsyTWRERXJlT2svbUxQd0VYYmFFeThhVStKUjlUQ21t?=
 =?utf-8?B?SktrRGI3OXNNL0Z6bjZmM3hrUkp4aUNYRlJjYVMrdmttbk5zV3ZrOEZleEsy?=
 =?utf-8?B?L2daQzBYeW1jSFNsNGppV1NuWTVBWC9PUm1PMGJuQ1plVStkaWt0OFdCMHRI?=
 =?utf-8?B?R2hySVRURmtnZnRLUFNNRDkzQTZyT3B1djV4aW5yTkJ4NWtZZXBTM084S0FQ?=
 =?utf-8?B?dXNKRCtwYzVzOU5QK1FRQzloMjh2QzVjWCtRdWFyc1orL0w4NmVmL1dJaWk3?=
 =?utf-8?B?c3EvTm1ucVJORnBNQ3hrVUpkMnZsWHdEdUJGYmhxQ2xMNDFINlpnYlVZdHBO?=
 =?utf-8?B?Tld0dmRWYVRoNHpwQnJNaDlNUGRWbGZheUJHZGpIZDFxY2FrdFVMV3dsdHlq?=
 =?utf-8?B?YUtzR0c1dzV2T2pHVVJLN215K2RuZzRWcWhhckJkYTNWNTVUTUJIeXBraVZw?=
 =?utf-8?B?aHJoMHJhbUJadGtOYmxqQmUwTjZZWEUwVmZuV3hQQ3k2VlV4ZUs3cWlZWW5X?=
 =?utf-8?B?Z2U3dm52dHUwUGpHM1lEd3Z3ME1oTDZ6azUyNmdRM1J6UmliUyt6QnFFUXQz?=
 =?utf-8?B?ZjZ0RUd6dEM2dHJyOFM5KzBNeEl3a3o2cUUxcUhWU0EycXhpMVV4cG1wNzdz?=
 =?utf-8?B?T0R4K2lOK1haQzQ4VWhTWkxOaEphUHVFdzhFOVpia1VXN29UejVsSlhJNkJG?=
 =?utf-8?B?ZzRFWlhxMEhwT2NvbjE4MXQ3MGxEdjNWOWZFNnB4K1lhcnN0K244Q2syeU9D?=
 =?utf-8?B?bHJiVTB5MUxpc1NPdjczYnpja1B2VG5pK1FtQkNzTHlWUnlrUmNtcXFXc09T?=
 =?utf-8?B?bHcxZGJhL0szb0g5c2xiUiszMTk0aWtXUHRxV3JhRE5ZVXlmbGl6cFAyZ0I5?=
 =?utf-8?B?dWpXcVJ5Ryt2U3lJQnFVZ2hrenQyQnBIUzlhakF6NDFwQlFKSE5QS2d1L25w?=
 =?utf-8?B?SjhYVnBkK05IdzZFRWdiS2lVbTVYeXhjZkdmOUNYOEoxbWZqdXhCdVVLU0xt?=
 =?utf-8?B?MVpiZ1ZZQWVPcnovNnJ5T240U09lc0lDdVpzM3U0UldybjEyRVQ0L3pWbEM3?=
 =?utf-8?B?bjNJSzQ4ZjhnMGVObDdPcEplRmxodEsrZWlkN0xhRytRMWdWTXpEUUxqL2JL?=
 =?utf-8?B?VnNLZUlNYVZ0Vm1RdUVHTlA3SEloQmhqcTl2Z01PcUhUTTB2VytsYXdSOWxQ?=
 =?utf-8?B?MkVncEZEY3NnalpiVVpmZlkzVFJvTnBrRU1NT1RnU2xHVWxBVVl3UUdya3FM?=
 =?utf-8?B?TUtTVmRiakRzSUloazgwNms5N0N5ZkJzdUFFN3NPSTB3a1RneWtYSldwbHNK?=
 =?utf-8?B?cFRYRk1vRzNOT1cwblVqQm9pNGZpRHBYd1VpVTcreE1tWW9ZWk5FaDV5V2Mv?=
 =?utf-8?B?dDRVRDBETSs0TG5RUGE5TjhrMmRyQTRSQXZ1QTkzNkhMWTB2bGw3NlBjY081?=
 =?utf-8?B?WXVMRzQrZ0Z0bCtOSVBLbXN3T1RzeWRYWkhtN1lsUmRncjJJQy9tMlllNHVy?=
 =?utf-8?B?Ymt4MmYxc1JBVVdLZDh2dVg0RGF5dk1zRlhXc1pENC9USmNGYXQ0TnRJWDYw?=
 =?utf-8?B?c0ZHYzFPMlg5bitVeUZlcHRDclNpOFZWeFFSZHNnSDRyR3ZqZ0xGTjVUcXdU?=
 =?utf-8?B?Rm9DRWlhODhJSk5EeEd1WjV0R2FsVjNRTGFvS0hLNFFZTWFYbHR0Ui91UlpJ?=
 =?utf-8?B?YkJ1cGdkTjN5UFlXOUFmeVNSL0JjQ285WWYzQXVGVWdEckN0T3JtQ3drQ1hS?=
 =?utf-8?B?VTdHd0J5ZVdsNkFFTWNBUFlJb2k1b29Ba3ExVEhtaVhYNis2ZlMraFV3MzlH?=
 =?utf-8?B?dGRqZlgxRElnOEY5V1dDL1Z3REY3anlXNmV1cDJIQ2pMRWk4MWZrQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b719ff6-308e-4f76-374f-08df0dcad958
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:01:39.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kp2AI4g1yJnx0etfESGw2kAe8jbqYsXIPg8WLWJwediTQ4C/Huv/oFpvh2MkKuL1Yn2zL5wZgz5f3V6dieTMHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246


On 03/09/2026 08:19, Wayne Chang wrote:
> Add Tegra264 support to the Tegra XUSB PHY driver and its binding, as
> part of enabling USB host functions on the Tegra264 Jetson AGX Thor
> platform.
> 
> This series was previously posted as part of a single 8-patch series
> covering phy, USB host and arm64 DTS changes together [1]. Per review
> feedback, it has been split by subsystem so each maintainer can pick
> up only what belongs to their tree:
> 
> - phy: tegra: xusb: this series (dt-bindings/phy + drivers/phy/tegra)
> - usb: host: xhci-tegra + its dt-bindings/usb: separate series, to
>    follow shortly (will reference this series once posted)
> - arm64: tegra DTS enablement: separate series, to be sent once both
>    of the above have landed, since it depends on both
> 
> Patch 1/4 (dt-bindings: phy) now spells out in the commit message why
> Tegra264 needs its own compatible string instead of falling back to
> nvidia,tegra234-xusb-padctl, per Conor's and Krzysztof's repeated
> question on v1/v2.
> 
> [1] https://lore.kernel.org/linux-tegra/20260831185835.3732707-1-waynec@nvidia.com/
> 
> Sing-Han Chen (1):
>    phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking
>      clock
> 
> Wayne Chang (3):
>    dt-bindings: phy: tegra-xusb: Add support for Tegra264
>    phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
>    phy: tegra: xusb: Add Tegra264 support
> 
>   .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml |  1 +
>   drivers/phy/tegra/Makefile                        |  1 +
>   drivers/phy/tegra/xusb-tegra186.c                 | 31 +++++++++++++++++++---
>   drivers/phy/tegra/xusb.c                          |  6 +++++
>   drivers/phy/tegra/xusb.h                          |  3 +++
>   5 files changed, 39 insertions(+), 3 deletions(-)

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

