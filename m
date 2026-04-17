Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B36F3B3C11;
	Fri, 17 Apr 2026 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417576; cv=fail; b=IjUszCGcuGeq6KowH+lJaZTKhm/EM0n/UET1YPL4xufAZedBP/4qMa+jGWU6tdAxpwDAX3u7mvFhqytbilE1dhHYiBWwf6KJUtSIA+QTXBrD1SS7Zf9FxzmfyLoDPadqiBQ/tOxTb6RkoC+QAE12sYS025HfRbpb2UWOwclKdKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417576; c=relaxed/simple;
	bh=ntLQD8v2cz0ayrFre9q16zfHex78QpY+zIdo9Rtkv1g=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=XdtOHkJJDsAhXKshLGwBo9TiduB7HfWuu3yGYe81ifipi70z4BUEhFqQPrJ2imAyKyByHlxpPI5v9y75Xf2dEju/tk6QPxb7mxEi+PWLwfPu0esPa55bMYsQnACFV2Us2rYqky0r8PyI3iaY+BQ4ie7ZUg85+DUjlU7A5dZlOVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hQ9Q7reO; arc=fail smtp.client-ip=52.101.52.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hQ9Q7reO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzCILw7fPnpvC7Y4buzH03ryR7pvbs+2m4meUrkLqmJ6LABSm8zZbJf2OWBHVwqMFMLQpYGG8diEIfXSxUBpGoN08DtH5WWm80JYSfqnIeVlLx+GtFbUYJGzbXMFV++Av1XCQ59X11FI48HfJc5waOVScOuFlERV8aiWQt/+Z31YS+QaWFrlQOTYz5h/fKoACRU8uMbLcuWRD/QhUOjls84LIb6gUUCrx2JYBPsuVuGeSg67MjFQCJwxoBOAIJ1TDNVNyqz47k7Awp9RIUbMJxzasJQKsnNrPbZP2TQoTFl3cHLKVO6RMram6EJ+NqCpNR9WlkaPRfF2XlCLulHbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlHxl90aPfsuCvd7tA3LvzhsXqRGe6EBMeBQmtgWYpg=;
 b=kDz9ANOce4hgyTFT1ZmhpTroWsdONyWNFoioWCss83F7UloGy5N0tqC7WSqO95+ShYu0Zy0Rubc4Pu1jC+4D6Miy1gfojz2uHsWLT8OU4lSQ365mAUv399gS3rFRYa2AdidU4txXx+Fhb+Q16AVzXV42Mb3DvrXr2zDocjjBUN1uAsCtXr/LGskRAF3vQ7Gebtkfw9Wpxd6UUWQe9kKUn1296EHz0iIXsSKH7Oa96RYCp+QQLABXhM2fqL/UD4Ow+2P30k7vp+rh4HkSYrN5nftqHgqy8T19TOpYmAcC92c3GaD8kJE+RsZL5Q7m+JLaJcEwIPs7+Q8rIN0OBCP29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlHxl90aPfsuCvd7tA3LvzhsXqRGe6EBMeBQmtgWYpg=;
 b=hQ9Q7reOtq7eWHVd/8R6IJtRPRJkeOR0YCY7/CHkRxLWPPwGMfNYxz3ZbSdJJn35R1vUBbWk3dfBb12VJq6697shocqTZZs54CYZZdW+qZ7uxdhy99GWUnlODuK17HcJHj8pw6gnRZQUTLU/Ipi9rI/s6rWB9OSxTkb9Wxh5QmLH9bFJ4zSXHKSGaOuqVRslTEQMIGiD3pxae4Hb5GsOMyDyQXds+RrPBOIUlvpcMjMqedyj+aSQX6S9heIsrNlsdKCMjtCL0MGN7/S8++Nqi8KbkBCdjfNLfyqdA8S4FPeY2hayB5wzsNn5NNSAGpRdlo9+fHAKjHSlU/ReWtek/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH7PR12MB6492.namprd12.prod.outlook.com (2603:10b6:510:1f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:19:25 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 09:19:25 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Fri, 17 Apr 2026 18:19:10 +0900
Subject: [PATCH v2] memory: tegra: Deduplicate rate request management code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-memory-refactor-v2-1-1669de38798f@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Myw5AMBBFf0VmrUlTj+BXxKKpwSwoU4SIfzfB8
 tybcy4IyIQBqugCxp0C+UnAxBG4wU49KmqFwWiTa6MTNeLo+VSMnXWrZ5WlNtdFaYvWdSDWLA8
 db7FuPmZcNgmv/3jfDw5YMxl2AAAA
X-Change-ID: 20260203-memory-refactor-54a6089a8dcf
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: OS3P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21d::7) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH7PR12MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: 7732b787-e98b-4b10-afca-08de9c626b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	88pXX4/d9//AV06xfojcWOKiisS7/eBw8SFm5kPWbItv/6GMJcg8b6AxjlBz72k2md1v4MJBpbD39akoVUXxQM7cW2cGtYaA2lp6cTeoLd/2vD8PqIw3oV5D8QaB8P4SwMre3zR8al4d6rWPu5CTFguZdvUmQlH//ylgSZvTw6omundQEzHz1pJSzOdaktHIBieXWFGgjDtTmhUSvTYuuKuJhhLCk0o0kHEV89r3VXkAh9c5/8+9eofd3NS/k2jEdFUO+yShqiMBSHos/MgA+UB8afV3ycqXdj6IMl+wSGueJkyeSLWYiNmC6wVZpSBuQj4eoF8mHEgg44ogq82IHufVFXBPLoQFAP1CNzEw3pUmSQZDODclvT7K0l1EQP/aiCeXEznnfwMqic+CzqLSFNdW+xNo39qCMGLImYs5ByOhEs254j+rDeAdmCNmCz9Zp47vZY8yqBmIijj5ngdalA0tTDlafpIsVesZXRtHmNM5StaClMSejW8vp6HNsQr4yptg8yGHee3mBB4YQrT/gJnrxTvPqL/o7bNZr6xxHikhFI16d9qpaa24jF6zM4p9D9QB663rb+tuboPxZQu4YaOFm+R/PeH97lEYru/Ve9f2CrUuPwB061JVDNqxK8HdPOGZow8vg0hIcesWdmo2MoAd9AFhgNT6VTxtn0bakHwOg1MMaJbL5tgAdaOfNiF1dqEtfBoa7lKKFxT2tNoBoQiojIeX5C9w3ahWn5jHle4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWI1K2Rwb0VwRW1WOFhaYUpJYlZPRnM4c3poN3pONkJxb0V2czE4Y0cvQzNa?=
 =?utf-8?B?b2k4WHAvNGsxeUpMK1hxOUcySVJaeUFNbm1Wbk50c3NCcnZ2bjNaYUFLOGtL?=
 =?utf-8?B?NWRVN0VYYkRmZVluaGVMSklVMlVnbUUwTzd1RnFWbmZjT1ZLZU01eVY3MFNV?=
 =?utf-8?B?WjI2aEdiaE9LRG0vSGJqQmtFaE1kdUt4cTlyVlRwdmRCUEFjckZidk9KMGVz?=
 =?utf-8?B?NEVySGpCc3gvSG53cGJmdjFiQ2YvZUp2NU9DMHVvUU8wanhidzY3TjVzRkNI?=
 =?utf-8?B?VzQyRXpyUDZEMDVDY29EdlNZWUYvbndyRks2dUJEN3RmOWlKamdaeFVWOVZY?=
 =?utf-8?B?UU4zakpQMUY5Z2xwNlZ0WlFncWR1Z2REN25HRWwxZTlkWFpqbWorV25LaWd6?=
 =?utf-8?B?SmVMUFZUSm1vVmlnQzJkeFJoZUpNeThlTW9maHpyK1FmNzJ1cUM4UEZENU1x?=
 =?utf-8?B?dkUveDVpR0J2L3dITzNvdnNLWXFBWW9aYlV3WkZSajJFMkZVL2ozMUt5b0lF?=
 =?utf-8?B?TGJKR090ZUk1UTVDRytYSC82UlBrTlBORDJiSmhVMTZFdjNUaUZEWFdTNVF6?=
 =?utf-8?B?dUFkR0tUR3E4Y29UeWI5UmpWK0kzQmNUK2gwWkgrRzdETG1FQjU3RTMxd252?=
 =?utf-8?B?V0llanJoTlNzMWFQWTdwQlJZRFNuS3J3bmRSTWVUZjJRR0dpZnRLaTgxQUcz?=
 =?utf-8?B?YVJzZHFZZlpYVEFTbm1vT1g3L3NiMXBtRXZTR0d4cjFmUlpKYy8vZW40QjB1?=
 =?utf-8?B?ZUorSFgvQ1VXb2ZReWpTL0VwMjE4WSt4YisrUDFmaWdFd0RqZ1gyUEFtYTRz?=
 =?utf-8?B?clBrbHRUY1V2SW9hcUUyU1ArYlpjNWhRY3JIYlZocU1qV2dNT1dQSk9vS2Vh?=
 =?utf-8?B?NUYrUzdFUTZ6d2VHd3BHdzBNRjVoalZmd2tYQUlFNmdXSllWdzhUQjZ2QTQx?=
 =?utf-8?B?YXVyRGN0MmNxQlU5T3ZqVVZEL3VRSTI0YXB5QVVhOWZzdFdUOVljTlVrMG5D?=
 =?utf-8?B?aWMzdXdqTm5DNHdTWlFXSUdqc1pucEtPcTNHdWp1ZmtvbUFWZnJEeHIwc1Ns?=
 =?utf-8?B?Q05vVmZBRVlmSERwaHdJTnYySUxoNkRSSzAzZGNJZDNydWpUYjlLZk9jM29O?=
 =?utf-8?B?OTlQbXdnMXVSU2JsMWt6eEk5dEY3cGZCRS94aEFWVURXSFM5R2tLYXJNN21Z?=
 =?utf-8?B?cjF2VTNIMUYzU0o4c21vL3dPY1pLbDNpZkpqeGg5NHFORTk1K2ZmNnVzNXlL?=
 =?utf-8?B?WGRGVk9tNVl0aHBNcllia0psU2JKQ3hJVTA5blVaVC90RHRCRFVFRXZmNGZr?=
 =?utf-8?B?V1pmcVZaaTVhWE9kL3N2WXMrUVVvNkN6ZXV5N3djSG53UFRVMGMzeHNNRnUz?=
 =?utf-8?B?VW5FZ1hWTW5ZNCtKTjRZc2dhUldnMEZKQjh1clptMmxhTXp1TVh0SXhtN3dN?=
 =?utf-8?B?aWtpQVROOC90NnZiZGlaZURFREtvYjNVNWkxbjdCR1ZiNGNXUCtCaW1lRElo?=
 =?utf-8?B?bmFwRDRXcVJPMys2WHBrNjJGbDZ5cDVwK3lIMnA5MnVIUjNsVFhKR0FZQW9G?=
 =?utf-8?B?VlVGRzJCYTNIejBuT0FXYVBaVVQ0Q205VWxpbGJKVmlPbDV0L0xZaVJzakE4?=
 =?utf-8?B?RXkxZTVGV3hkenRRK3FMcklsR00yM1J2K0ZoMFB1ZVpKckMxSzdvUVc5ZnpU?=
 =?utf-8?B?djN5cGR5L044OVQwNUV2dFVOR2RqRW5WbWY0OHhPeDhzWVNLL1htTXZUSE9R?=
 =?utf-8?B?RHNCYktLWng1dExXU2l6aTJsR3ExcG55OGhOVDlpU1hBVUhSNElKblJsQ016?=
 =?utf-8?B?cWkvU2dqWkszVUZMY3l3cG5ZYm9TYW5lTlArRVozT1JQUXlTUXB2Sk9UenhV?=
 =?utf-8?B?akxsbzRGNUJ5VmF0NTg0Si9xbEtITlp1dVYxdmJUOUV3dCtPdEZLcHRSbzVw?=
 =?utf-8?B?cnRxWlpneEtlTUQ0a0RpdkNFK0NUTVNBajlXZi85b09wS1ZqeUk1elhFWGNm?=
 =?utf-8?B?RG90NEZuOFgraWtaTDFIUG13TmxGc3UyY0NrL1Z1bFlkSW13L2FVd3lzZkFo?=
 =?utf-8?B?ajB5QllENC95T2d6bzhGdityczQxNDVCTmRXYnoxYVo3VmFsdXdWcUxpYlk4?=
 =?utf-8?B?R0RGbVBvSjVSeExFU3pDYlhDUWdmV1E4VldGNUFvbmdBKzlkbTJXNEptbnBQ?=
 =?utf-8?B?c2NiK1BVQkdkeUp5T1NiWGpmTDNNeHBwekVFMTEyZE0vRnF5K2hJZG1GZllM?=
 =?utf-8?B?TVRWcExsZWJVQkNEZE1TVndwMmlINnFUbnF4UXpuMjI4TEZIVDNoWEpxN0kx?=
 =?utf-8?B?RFgzUWM2K2czSUJLNkhjb2Y2eXVKaGhuN1RUSDdCSzJkN3dQSkpmV0dPL0h5?=
 =?utf-8?Q?iPpDbVzL1F9ywd2iZDPNpyKYx+r73egOxiFSGHuiu9wNq?=
X-MS-Exchange-AntiSpam-MessageData-1: jH3LZ4d1fC9f2Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7732b787-e98b-4b10-afca-08de9c626b3a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:19:25.6300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZPdtBefG4RunyHDTSs2A1cjzUvH671e6cDyqWCbc2ZfID7EA5JjHM6dYvKHIecGpVes9ZGQX/rUReWe9+9D2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6492

As is, the EMC drivers for each 32-bit platform contain almost
identical duplicated code for aggregating rate requests. Move this
code out to a shared tegra-emc-common file to reduce duplication,
and add kerneldoc comments.

Based on code from the tegra20-emc driver.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2:
- Add kerneldoc comments.
- Add note about source of the code to commit message.
- Drop the Tegra114 EMC series as dependency. Rebase on v7.0.
---
 drivers/memory/tegra/Kconfig            |   6 ++
 drivers/memory/tegra/Makefile           |   1 +
 drivers/memory/tegra/tegra-emc-common.c | 139 ++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra-emc-common.h |  45 +++++++++++
 drivers/memory/tegra/tegra124-emc.c     | 107 ++----------------------
 drivers/memory/tegra/tegra20-emc.c      | 110 ++-----------------------
 drivers/memory/tegra/tegra30-emc.c      | 107 ++----------------------
 7 files changed, 210 insertions(+), 305 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index fc5a27791826..92671f9df672 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -17,6 +17,7 @@ config TEGRA20_EMC
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_DEVFREQ
 	select DDR
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra20 chips. The EMC controls the external DRAM on the board.
@@ -29,6 +30,7 @@ config TEGRA30_EMC
 	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
 	select PM_OPP
 	select DDR
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra30 chips. The EMC controls the external DRAM on the board.
@@ -41,6 +43,7 @@ config TEGRA124_EMC
 	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
 	select TEGRA124_CLK_EMC if ARCH_TEGRA
 	select PM_OPP
+	select TEGRA_EMC_COMMON
 	help
 	  This driver is for the External Memory Controller (EMC) found on
 	  Tegra124 chips. The EMC controls the external DRAM on the board.
@@ -61,4 +64,7 @@ config TEGRA210_EMC
 	  This driver is required to change memory timings / clock rate for
 	  external memory.
 
+config TEGRA_EMC_COMMON
+	tristate
+
 endif
diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 6334601e6120..75ebb4cb4f29 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -14,6 +14,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
 
+obj-$(CONFIG_TEGRA_EMC_COMMON) += tegra-emc-common.o
 obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
 obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
 obj-$(CONFIG_TEGRA124_EMC) += tegra124-emc.o
diff --git a/drivers/memory/tegra/tegra-emc-common.c b/drivers/memory/tegra/tegra-emc-common.c
new file mode 100644
index 000000000000..2bd766842fa5
--- /dev/null
+++ b/drivers/memory/tegra/tegra-emc-common.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/pm_opp.h>
+
+#include "tegra-emc-common.h"
+
+/**
+ * tegra_emc_rate_requests_init() - Initialize EMC rate request tracking
+ * @reqs: struct tegra_emc_rate_requests to initialize.
+ * @dev: EMC device.
+ *
+ * Initializes the rate request tracking state with default state
+ * (no active requests). Must be called before using @reqs with
+ * other functions.
+ */
+void tegra_emc_rate_requests_init(struct tegra_emc_rate_requests *reqs,
+				  struct device *dev)
+{
+	unsigned int i;
+
+	mutex_init(&reqs->rate_lock);
+	reqs->dev = dev;
+
+	for (i = 0; i < TEGRA_EMC_RATE_TYPE_MAX; i++) {
+		reqs->requested_rate[i].min_rate = 0;
+		reqs->requested_rate[i].max_rate = ULONG_MAX;
+	}
+}
+EXPORT_SYMBOL_GPL(tegra_emc_rate_requests_init);
+
+static int tegra_emc_request_rate(struct tegra_emc_rate_requests *reqs,
+				  unsigned long new_min_rate,
+				  unsigned long new_max_rate,
+				  enum tegra_emc_rate_request_type type)
+{
+	struct tegra_emc_rate_request *req = reqs->requested_rate;
+	unsigned long min_rate = 0, max_rate = ULONG_MAX;
+	unsigned int i;
+	int err;
+
+	/* select minimum and maximum rates among the requested rates */
+	for (i = 0; i < TEGRA_EMC_RATE_TYPE_MAX; i++, req++) {
+		if (i == type) {
+			min_rate = max(new_min_rate, min_rate);
+			max_rate = min(new_max_rate, max_rate);
+		} else {
+			min_rate = max(req->min_rate, min_rate);
+			max_rate = min(req->max_rate, max_rate);
+		}
+	}
+
+	if (min_rate > max_rate) {
+		dev_err_ratelimited(reqs->dev, "%s: type %u: out of range: %lu %lu\n",
+				    __func__, type, min_rate, max_rate);
+		return -ERANGE;
+	}
+
+	/*
+	 * EMC rate-changes should go via OPP API because it manages voltage
+	 * changes.
+	 */
+	err = dev_pm_opp_set_rate(reqs->dev, min_rate);
+	if (err)
+		return err;
+
+	reqs->requested_rate[type].min_rate = new_min_rate;
+	reqs->requested_rate[type].max_rate = new_max_rate;
+
+	return 0;
+}
+
+/**
+ * tegra_emc_set_min_rate() - Update minimum rate request for a request type
+ * @reqs: rate request tracking state
+ * @rate: new minimum rate in Hz requested by @type
+ * @type: type of request
+ *
+ * Records @rate as the new minimum rate request for @type, recalculates target
+ * rate based on all requests and applies new rate through the OPP API.
+ *
+ * Context: Sleeps. Requests to same @reqs are synchronized via mutex.
+ *
+ * Return:
+ * * %0 - success
+ * * %-ERANGE - request would cause minimum rate request to be higher than
+ *              maximum rate request
+ * * other - setting new rate failed
+ */
+int tegra_emc_set_min_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type)
+{
+	struct tegra_emc_rate_request *req = &reqs->requested_rate[type];
+	int ret;
+
+	mutex_lock(&reqs->rate_lock);
+	ret = tegra_emc_request_rate(reqs, rate, req->max_rate, type);
+	mutex_unlock(&reqs->rate_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tegra_emc_set_min_rate);
+
+/**
+ * tegra_emc_set_max_rate() - Update maximum rate request for a request type
+ * @reqs: rate request tracking state
+ * @rate: new maximum rate in Hz requested by @type
+ * @type: type of request
+ *
+ * Records @rate as the new maximum rate request for @type, recalculates target
+ * rate based on all requests and applies new rate through the OPP API.
+ *
+ * Context: Sleeps. Requests to same @reqs are synchronized via mutex.
+ *
+ * Return:
+ * * %0 - success
+ * * %-ERANGE - request would cause minimum rate request to be higher than
+ *              maximum rate request
+ * * other - setting new rate failed
+ */
+int tegra_emc_set_max_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type)
+{
+	struct tegra_emc_rate_request *req = &reqs->requested_rate[type];
+	int ret;
+
+	mutex_lock(&reqs->rate_lock);
+	ret = tegra_emc_request_rate(reqs, req->min_rate, rate, type);
+	mutex_unlock(&reqs->rate_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tegra_emc_set_max_rate);
+
+MODULE_DESCRIPTION("NVIDIA Tegra EMC common code");
+MODULE_LICENSE("GPL");
diff --git a/drivers/memory/tegra/tegra-emc-common.h b/drivers/memory/tegra/tegra-emc-common.h
new file mode 100644
index 000000000000..80e26fb13830
--- /dev/null
+++ b/drivers/memory/tegra/tegra-emc-common.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef TEGRA_EMC_COMMON_H
+#define TEGRA_EMC_COMMON_H
+
+#include <linux/device.h>
+#include <linux/mutex.h>
+
+/**
+ * enum tegra_emc_rate_request_type - source of rate request
+ * @TEGRA_EMC_RATE_DEVFREQ: rate requested by devfreq governor
+ * @TEGRA_EMC_RATE_DEBUG: rate requested through debugfs knobs
+ * @TEGRA_EMC_RATE_ICC: rate requested by ICC framework
+ * @TEGRA_EMC_RATE_TYPE_MAX: number of valid request types
+ */
+enum tegra_emc_rate_request_type {
+	TEGRA_EMC_RATE_DEVFREQ,
+	TEGRA_EMC_RATE_DEBUG,
+	TEGRA_EMC_RATE_ICC,
+	TEGRA_EMC_RATE_TYPE_MAX,
+};
+
+struct tegra_emc_rate_request {
+	unsigned long min_rate;
+	unsigned long max_rate;
+};
+
+struct tegra_emc_rate_requests {
+	struct tegra_emc_rate_request requested_rate[TEGRA_EMC_RATE_TYPE_MAX];
+	struct mutex rate_lock;
+	struct device *dev;
+};
+
+void tegra_emc_rate_requests_init(struct tegra_emc_rate_requests *reqs,
+				  struct device *dev);
+
+int tegra_emc_set_min_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type);
+
+int tegra_emc_set_max_rate(struct tegra_emc_rate_requests *reqs,
+			   unsigned long rate,
+			   enum tegra_emc_rate_request_type type);
+
+#endif /* TEGRA_EMC_COMMON_H */
diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index ff26815e51f1..e33eed6f999e 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -27,6 +27,7 @@
 #include <soc/tegra/mc.h>
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_FBIO_CFG5				0x104
 #define	EMC_FBIO_CFG5_DRAM_TYPE_MASK		0x3
@@ -467,17 +468,6 @@ struct emc_timing {
 	u32 emc_zcal_interval;
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 
@@ -503,14 +493,7 @@ struct tegra_emc {
 
 	struct icc_provider provider;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 };
 
 /* Timing change sequence functions */
@@ -1041,83 +1024,6 @@ tegra124_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 	return NULL;
 }
 
-static void tegra124_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -1190,7 +1096,7 @@ static int tegra124_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra124_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1220,7 +1126,7 @@ static int tegra124_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra124_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1327,7 +1233,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, ddr * dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1441,7 +1347,6 @@ static int tegra124_emc_probe(struct platform_device *pdev)
 	if (!emc)
 		return -ENOMEM;
 
-	mutex_init(&emc->rate_lock);
 	emc->dev = &pdev->dev;
 
 	emc->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1487,7 +1392,7 @@ static int tegra124_emc_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	tegra124_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 
 	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		emc_debugfs_init(&pdev->dev, emc);
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index a1fadefee7fd..1d564b80e2bb 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -32,6 +32,7 @@
 #include "../of_memory.h"
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
@@ -182,18 +183,6 @@ struct emc_timing {
 	u32 data[ARRAY_SIZE(emc_timing_registers)];
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEVFREQ,
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
@@ -212,14 +201,7 @@ struct tegra_emc {
 		unsigned long max_rate;
 	} debugfs;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 
 	struct devfreq_simple_ondemand_data ondemand_data;
 
@@ -710,83 +692,6 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra20_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -857,7 +762,7 @@ static int tegra20_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -887,7 +792,7 @@ static int tegra20_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra20_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -993,7 +898,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1111,7 +1016,7 @@ static int tegra20_emc_devfreq_target(struct device *dev, unsigned long *freq,
 	rate = dev_pm_opp_get_freq(opp);
 	dev_pm_opp_put(opp);
 
-	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
+	return tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEVFREQ);
 }
 
 static int tegra20_emc_devfreq_get_dev_status(struct device *dev,
@@ -1190,7 +1095,6 @@ static int tegra20_emc_probe(struct platform_device *pdev)
 	if (!emc)
 		return -ENOMEM;
 
-	mutex_init(&emc->rate_lock);
 	emc->clk_nb.notifier_call = tegra20_emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
@@ -1228,7 +1132,7 @@ static int tegra20_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra20_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 	tegra20_emc_debugfs_init(emc);
 	tegra20_emc_interconnect_init(emc);
 	tegra20_emc_devfreq_init(emc);
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 606106dd2b32..afd272da0d27 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -36,6 +36,7 @@
 #include "../of_memory.h"
 
 #include "mc.h"
+#include "tegra-emc-common.h"
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
@@ -341,17 +342,6 @@ struct emc_timing {
 	bool emc_cfg_dyn_self_ref;
 };
 
-enum emc_rate_request_type {
-	EMC_RATE_DEBUG,
-	EMC_RATE_ICC,
-	EMC_RATE_TYPE_MAX,
-};
-
-struct emc_rate_request {
-	unsigned long min_rate;
-	unsigned long max_rate;
-};
-
 struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
@@ -383,14 +373,7 @@ struct tegra_emc {
 		unsigned long max_rate;
 	} debugfs;
 
-	/*
-	 * There are multiple sources in the EMC driver which could request
-	 * a min/max clock rate, these rates are contained in this array.
-	 */
-	struct emc_rate_request requested_rate[EMC_RATE_TYPE_MAX];
-
-	/* protect shared rate-change code path */
-	struct mutex rate_lock;
+	struct tegra_emc_rate_requests reqs;
 
 	bool mrr_error;
 };
@@ -1228,83 +1211,6 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
-static void tegra30_emc_rate_requests_init(struct tegra_emc *emc)
-{
-	unsigned int i;
-
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++) {
-		emc->requested_rate[i].min_rate = 0;
-		emc->requested_rate[i].max_rate = ULONG_MAX;
-	}
-}
-
-static int emc_request_rate(struct tegra_emc *emc,
-			    unsigned long new_min_rate,
-			    unsigned long new_max_rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = emc->requested_rate;
-	unsigned long min_rate = 0, max_rate = ULONG_MAX;
-	unsigned int i;
-	int err;
-
-	/* select minimum and maximum rates among the requested rates */
-	for (i = 0; i < EMC_RATE_TYPE_MAX; i++, req++) {
-		if (i == type) {
-			min_rate = max(new_min_rate, min_rate);
-			max_rate = min(new_max_rate, max_rate);
-		} else {
-			min_rate = max(req->min_rate, min_rate);
-			max_rate = min(req->max_rate, max_rate);
-		}
-	}
-
-	if (min_rate > max_rate) {
-		dev_err_ratelimited(emc->dev, "%s: type %u: out of range: %lu %lu\n",
-				    __func__, type, min_rate, max_rate);
-		return -ERANGE;
-	}
-
-	/*
-	 * EMC rate-changes should go via OPP API because it manages voltage
-	 * changes.
-	 */
-	err = dev_pm_opp_set_rate(emc->dev, min_rate);
-	if (err)
-		return err;
-
-	emc->requested_rate[type].min_rate = new_min_rate;
-	emc->requested_rate[type].max_rate = new_max_rate;
-
-	return 0;
-}
-
-static int emc_set_min_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, rate, req->max_rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
-static int emc_set_max_rate(struct tegra_emc *emc, unsigned long rate,
-			    enum emc_rate_request_type type)
-{
-	struct emc_rate_request *req = &emc->requested_rate[type];
-	int ret;
-
-	mutex_lock(&emc->rate_lock);
-	ret = emc_request_rate(emc, req->min_rate, rate, type);
-	mutex_unlock(&emc->rate_lock);
-
-	return ret;
-}
-
 /*
  * debugfs interface
  *
@@ -1375,7 +1281,7 @@ static int tegra30_emc_debug_min_rate_set(void *data, u64 rate)
 	if (!tegra30_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1405,7 +1311,7 @@ static int tegra30_emc_debug_max_rate_set(void *data, u64 rate)
 	if (!tegra30_emc_validate_rate(emc, rate))
 		return -EINVAL;
 
-	err = emc_set_max_rate(emc, rate, EMC_RATE_DEBUG);
+	err = tegra_emc_set_max_rate(&emc->reqs, rate, TEGRA_EMC_RATE_DEBUG);
 	if (err < 0)
 		return err;
 
@@ -1511,7 +1417,7 @@ static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
 	do_div(rate, ddr * dram_data_bus_width_bytes);
 	rate = min_t(u64, rate, U32_MAX);
 
-	err = emc_set_min_rate(emc, rate, EMC_RATE_ICC);
+	err = tegra_emc_set_min_rate(&emc->reqs, rate, TEGRA_EMC_RATE_ICC);
 	if (err)
 		return err;
 
@@ -1622,7 +1528,6 @@ static int tegra30_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->mc))
 		return PTR_ERR(emc->mc);
 
-	mutex_init(&emc->rate_lock);
 	emc->clk_nb.notifier_call = emc_clk_change_notify;
 	emc->dev = &pdev->dev;
 
@@ -1664,7 +1569,7 @@ static int tegra30_emc_probe(struct platform_device *pdev)
 		return err;
 
 	platform_set_drvdata(pdev, emc);
-	tegra30_emc_rate_requests_init(emc);
+	tegra_emc_rate_requests_init(&emc->reqs, &pdev->dev);
 	tegra30_emc_debugfs_init(emc);
 	tegra30_emc_interconnect_init(emc);
 

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260203-memory-refactor-54a6089a8dcf

