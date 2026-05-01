Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0727442;
	Fri,  1 May 2026 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777618871; cv=fail; b=egFqAxPuBO3GbWz8bjGYaEw3IWgjRNtxbqAl29aHP7AGsJRox9H02XjU1I0uDqLoV+IFSizVKbkNsnZh1VZRvE9FWiC9O0X/8wjtyT64ePBDpb/tL160bRtTfnlumwGu3Jbo7FXqE5WlZ2WUNFeIKrs6Ef7lUzeYUnVLJbN8wGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777618871; c=relaxed/simple;
	bh=AG/iranMErqb2tzogpcmrLzxL2Rp0Ud9Lr3qqfie4aY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=jkXacmFlPxlvHDf6lpbDpLIbhmZr+3FDIA3BVl40lfJk9SvzbWqV1CVRdgYjwmM97yOkzuox0Vj3k+68jxXkBSDiM+rL0uySSpVyVeOH0CxYHtxrtVuRGN27Q70lgsoQxdgDyvyMH5Rg9GVS8AiZUbDDPVpda3EY+w9NtcQnUr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MAuvcjlX; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MAuvcjlX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5/IbWNAeIsDO9qpB38WKu0wgVFRt0rI1weJ2f04XoZy0jWtLIiKeazIzDC+iGTkqEum906Fycuvjry6OLHZcFYPHgnApHmunB0LGDacQWi1MxtB3sbGd79EylSqr7Q+R0Vt94huabjmYf8eoGwnC9MFU3va45vWE3FTPxasWEhvPOE6fjF9qKi2L6mGwW6bikS1t635E3WeYpJEq5ePZrGG/GF6bUMJqolBcgZCfsmjEupHcpICZ0khPaD3nP73LxRqNCeAgj7k01+BHF5iJJ2DdWBTtggGSaNtP9CFQYjNs7i7cXFHT4+Ct+gsT067fXv8QjeowCFEnhx4tOWZcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ChJMT3YmwaeekzXSUVfq4eDCB40y0wsuiXEE3+p5h4=;
 b=MA3KnAzJhkYvWdjX/s1fz3SeTsDAVHKtKWF3Zqlc/ketWvOcm0tYEsdx5Xh55OcyDNQyqJmni9ZIsCo8qCncQGA4hsjs5O3JNMsz10IMkuNGkt0/6wOzJa6JdjbwHrB6hRReefYKY6B7EAgcla6c7uZhSHn53M34moc8RGvWH+Lr9tuC+tvZdMFq5UfeuhR0BMBCst7MAdyLWsCp8RapKSdRlKJEfKe3SjAUYtZT7FbFa+6slohAEIX/ZRt2weWoF4fTzSkcao8yzVj2pLwNS1RwoF9fXh25JwGRadvaoOVOR/c4hNAkdYTRVSHmb2NQuJprgtfqeA57T24hfTP+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ChJMT3YmwaeekzXSUVfq4eDCB40y0wsuiXEE3+p5h4=;
 b=MAuvcjlXk/m4/T+BMXZNv9p/RLIjvRR34vm8GVJ/alF3d/dvdUWZVl2DiD/eqDxMg+shEQI5TlmNOIx59oZquJiwCtSKFGTOKs9Skq4XI12/D/3bZD/YMINB3Uw/N5qUZ47Vy/yhFAJSQeFDVSxvtxaLV4bMP3finoRY9STNmu+4yuWkxKsScTWcIR7UXXDyLZImUz+VeyJd7SWai615gZlWUEsktMRmlhmkuAoLtpGfXThY3GjaGU0toklIf14XRFW5kKT0wQRbftMsfEYgGyRtCdK2n9qXS8eLiCgPwkPRcM6b8L/HxzHersP4uqIAg48b/83aKDLt7ELilK0Pxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Fri, 1 May
 2026 07:01:02 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9870.020; Fri, 1 May 2026
 07:01:02 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Fri, 01 May 2026 16:00:52 +0900
Subject: [PATCH v3] memory: tegra: Deduplicate rate request management code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-memory-refactor-v3-1-69fb1ae1a7ca@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBREr0L+2prSYimuvIdh0bQf+QuotNhIC
 He3wsKFyzeTmbdCxEAY4VqsEDBRJD9mkKcCbG/GBzJymUFwobjgkg04+LCwgJ2xsw/sUhnFdWO
 0sx3k1TM39N4f7+3BAadXPp5/YU8xb5fdmsQ3PQRVWf8JkmAlK5VqHEpdN7q7jYkcmbP1A7Tbt
 n0AjCxrFcQAAAA=
X-Change-ID: 20260203-memory-refactor-54a6089a8dcf
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: OSAPR01CA0324.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::24) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8d2d9b-e6f0-4229-b262-08dea74f6836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ubfTvONMIORGEpy82yyGOgy2DVx+ZRqVs625o7OelP05RGz2fmfKB4DKIaikB6tAIPlbQkkkxjX8sjBjs907TJ0bUBY5O7+NTFA40DQ9stWRG6SbsOgCWLjj4ZfNoHojHCJcY/5jPMB8ivHkDlBQ940/hsra7VXJ6K0EKf9BmYyDOX7hhWIhbg31zd1Z1vN7oE2Satg9+HA0KLrd5J6D+lO6EgEG331KThbcCCm9SuWyc7VHdlNN3uP3IzvHf8ah16pVLe11btgwBeqZA5DOfDyYx51FRJ7tyeLnjYT62Y/7Dwc7Y5xAJj8YbK0FKWcBCtBeh9EbxyunFC4Z78XVK6U74qMiXvm/Id1HnJw11PfpcnZdBvDwjKaXyEVXp2aP9kI4oQdpvZlkw2brhGmf8UeskqJJQS5iFlCS+hpOrK7gZ648XCAc3aurckAY+WQBectlQc5DAEu3P1tPyW45ZpTHc0/3TRi3rZxpLrgBPZmi8xkLZp3S5OPKKD1kXayae39uJ4VEWLGR9L57M2y8s/uHq+NrtPV4WYR7NwFW4peCSl7jziJFYuxVbMWQT8LmWf9nEG/8GYc3jSwUxZp2eurlWbqxRXgyr2NOJxeInw4iqlFY5wZuSbGWU6gPL0GS3n4oCyCyCGtiPNO4oFBO+ZlkWnd2AYGBinkxqRjsPz+HDSL7D5mr2k9EvnSnmHvL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnBSNEZVd1NxMG5oT3VFTzlzMzNSNW83bXBYaFhQUmVhbHlkY2dHSDFEN0Jr?=
 =?utf-8?B?NEJ1Tmc1QWtMNk1zY0dKK1V5RWZmTmNreFRjWm5jdFZhalVrWVF3dkdwRlFw?=
 =?utf-8?B?ZXRRK2Z3S3NVcWp3K2YvZjZjTjFaL2JpYWJ2Y3doMktwVkNPMzljc2x2V05N?=
 =?utf-8?B?a3Jqd0NWdHVMWCtiUGlxVkkrS0M2UzVESDNkaW9rVjE3UjJveUFadkhyYUZu?=
 =?utf-8?B?N01aTFdLTVVBL1NjTzJrU2dYMnRHci9ibXNjd0xYOHRWZldrdUJLZlZsYm8r?=
 =?utf-8?B?Z1gxdjFvbEF0TWJpZGJTQWZhRVU3UFZUNFdud3MyVWc3b1RqMDZjNjd2V1VN?=
 =?utf-8?B?R0YzVUxObGhhYlpqM085QWtFL0xrc2haeXNnajFSZHR0Yno3M2VucUN4Y3E1?=
 =?utf-8?B?V0pxMkNHMGFvZ0RKSFNOaDQxd0JPSGlRWExtb21qV3lwWlFOUjZlaW5RcjR4?=
 =?utf-8?B?dll5bVVhTENXbWJuNG5EbHlNUHI4MFlrMGQvYjZMS0dBTnEzZXNubnFUc0Zi?=
 =?utf-8?B?QVpUaWRwL2xTOVk4VUxxWVNKQ0VRQU9tZnFyVzFzeE5GTTFEKzNUaU1HYllP?=
 =?utf-8?B?TGh6Z2RPNlZRZ2ZFR3lPNGN1aHlHSVVpckFjczZjcGY5TDZESXFJUlQvak5T?=
 =?utf-8?B?dEsxZ0JnYWFLcnZXb2FjQTJsNkowM2V5cFVtenRHeEp4SEVzeU5aOU1JaWhq?=
 =?utf-8?B?V1Y5RnFTbUdtWW9jSDNubEJKbUZxUHhaQnZzZHhQekF4TFU1NHR2SXBML0ZN?=
 =?utf-8?B?cG5OMXhuc2F0dTQ5SjJrRFFrUUFzV085N1F4czcwSFQ1SW53cnl0L0VqVnF3?=
 =?utf-8?B?WUZ5dG12Nk9NaDNpZnFSeE1IOHJJSXdPS1d6dmhZZFdzOG5tNFRuZjdFV2xm?=
 =?utf-8?B?TncxQXArbEkzRjZTUExFQkkwOU45clpVaDZ3d3NJdEc5QWpxRlArR2E4QTFU?=
 =?utf-8?B?cG1mVUxhMW12bEVNTC9IRkM3b25NWXkrVm96ZktKbHM4Wkk1WVlFVlNJU2tO?=
 =?utf-8?B?QVU1MXptSnNiOEpQRlc4YW5aalJITW91RUVRRmhkVVVEUlhQMGNYdTN6U3dB?=
 =?utf-8?B?aHhZQ2tRZ2lxRWVhMzdFVFliWnZ1K0pZNFU4SVl4VmVsTjhJd2R3TGhKNS9k?=
 =?utf-8?B?dUJsZ0lLbG5wVEhQLzlQZ1pkTEdNTmR5UERCZnlJY09xVUxBSlhua25DQ3FC?=
 =?utf-8?B?aHh3U3Nwa3lKNWhUWE5XYmV5RUorWUhXZldMMWs1RzA5NU1rNWpxR01BMEhK?=
 =?utf-8?B?cHVXa1oyKzZONXp5cEhDWWw5ZGpNZkpsemoyM2FXWjZTOEd1aGRJNDUwWFJk?=
 =?utf-8?B?bmJzeWJNdVo4WlExU0tpN29LMk1HdS9jVWlGcHRFNThBQlpqWXlsak5PY3dP?=
 =?utf-8?B?amFaZU91V2tzUVdyWlYxaFdyTmNjRllRWlNMU3pibDJ0TXlsZjUwWmRBQ3N6?=
 =?utf-8?B?dFppMlpXcGRGL2hLbFVwU1d0VkdLaE5oSFZqRzBaWEQ0cWxNb2N4ZHFYRGtU?=
 =?utf-8?B?VU11dDVLMlFodkJHUVFMZEttZklEc2VNUmR4VFF4Vm9menpLUDNRNzNqRnk4?=
 =?utf-8?B?MWNaZ2RaRXBMT2Fya2NYVzFvMmozaU1BS1VJUUMxNlFSRC9DRHMzNmFWRW9L?=
 =?utf-8?B?c2U3dTdYY3Q5SUx6MkNXN0pNZGh4WHFyVEFKbFdqVDNZdzdKdkNMRitKWjNq?=
 =?utf-8?B?UG5kbWJvaHluaWc0RWk1aVlTc3p4aGVRR2dFTTZzcGZJcFB2cEhPdklLcmdF?=
 =?utf-8?B?bGVuVmJzL2prYVBPNi9VYmc4bERRbFZhTkdaYmtIek5lenVCejlPd0E0aFNm?=
 =?utf-8?B?eWYzNlNYaUMwMzRFRGRPQlVQNXRFalQ5aDVsdksrQ2pBcEVWbEwvc1NaWGRm?=
 =?utf-8?B?TGRTb0JteUVIQ0tUdUVwQjBTSkhWSDVEV0VBbHU0RGhqT2kyV05IYklYQ01y?=
 =?utf-8?B?QjU0ZjVUcW5Vano4b1V1cnlXTXNEeExFYlNFVmJuL3JzcUVFRzJHTFBnSWVk?=
 =?utf-8?B?cWpnY05lMXZyaGVXaFdFYVhKek9wVWhtZHF6dnEvWXFHMmdURlo2bGRBQlFX?=
 =?utf-8?B?cTNBL3ZrSlhML2VPb2grcDhXVFc5TWV3ajBCVXUyenh6Qm1QODY2a0E5aExY?=
 =?utf-8?B?Y0U5czVnaFMvb1VCY2xHdjFQak1laWtJaTh5elJJWTl4OFU4TnQvRXFpWGpt?=
 =?utf-8?B?aExFN3c1ajkzc2JTdWNoeldKV3F6cys4WWFQMVk4WlBBejI0OE5TWk01eVBD?=
 =?utf-8?B?dGVGbHpFTlN4RE9Oblhzd0ljUTJUMmRJOUFqaWxaUk8xd0lVSmJkZ0xDMys3?=
 =?utf-8?B?b2xFZ0JwTDI0K1VWMi9Eb3Zqc0l5TE9oclgxKzlObm5tNk9iVUlBNUR6YlFZ?=
 =?utf-8?Q?WaWIlewUfnkSd78pimJFY8kYu+38ER3tA42Q5vJY1/mTV?=
X-MS-Exchange-AntiSpam-MessageData-1: berRDmPiQDcf+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8d2d9b-e6f0-4229-b262-08dea74f6836
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 07:01:02.8291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dnVCYYTaZdwVFNoYW1lyD5YwxhKwD9Ce6Uk7eMifztTxohcqOg7D2yC4X6wGqE3Vb91vRhQ89sJH12jGEpSCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265

As is, the EMC drivers for each 32-bit platform contain almost
identical duplicated code for aggregating rate requests. Move this
code out to a shared tegra-emc-common file to reduce duplication,
and add kerneldoc comments.

Based on code from the tegra20-emc driver.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
Changes in v3:
- Added comments and lockdep assertion on the rate_lock mutex,
  addressing checkpatch 'CHECK'.
- Added module.h include.
- Link to v2: https://patch.msgid.link/20260417-memory-refactor-v2-1-1669de38798f@nvidia.com
---
 drivers/memory/tegra/Kconfig            |   6 ++
 drivers/memory/tegra/Makefile           |   1 +
 drivers/memory/tegra/tegra-emc-common.c | 143 ++++++++++++++++++++++++++++++++
 drivers/memory/tegra/tegra-emc-common.h |  46 ++++++++++
 drivers/memory/tegra/tegra124-emc.c     | 107 ++----------------------
 drivers/memory/tegra/tegra20-emc.c      | 110 ++----------------------
 drivers/memory/tegra/tegra30-emc.c      | 107 ++----------------------
 7 files changed, 215 insertions(+), 305 deletions(-)

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
index 000000000000..bbe86cb4942c
--- /dev/null
+++ b/drivers/memory/tegra/tegra-emc-common.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/module.h>
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
+/* Caller must hold reqs->rate_lock. */
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
+	lockdep_assert_held(&reqs->rate_lock);
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
index 000000000000..157e27024342
--- /dev/null
+++ b/drivers/memory/tegra/tegra-emc-common.h
@@ -0,0 +1,46 @@
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
+	/* Protects @requested_rate. */
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

