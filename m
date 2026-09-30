Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010023.outbound.protection.outlook.com [52.101.85.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2810A27703;
	Wed, 30 Sep 2026 05:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745524; cv=fail; b=A+mxO3Lm7VsGqNZckFp7sgzGXWIqK+lf59/Q37MzN+yGlJLvWmBnILGWXrNRu28yQqDmebDCt79Ib6EW4OR7PV36SqUllG0XeOYTflmVBSYezMzxZzV6a8sJyzT4mjuk7S9HXAhx1w0PWWR5HdKich2Bhw3oAtMXqVD1JeqMcXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745524; c=relaxed/simple;
	bh=j5hlWcsu6SYkOOS7m1sxWS3UwKMrvf002iCgOkohbkU=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=D4iZ78eek8/YnuxNkcngejQgoFba5uIlzDdeO94IL07D/rBvFMFMbD0aq2UPybFbEUbnGDI1OShp9PqaJTIUhMxIVulWms4Vl09ketNoH5yR7x3gWfcd0J2Tf3gGy8G7BC9h8NnNOK0obEsDtgdR7lh7UdLgrzIZYxiK7SbbwWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cww3/1bS; arc=fail smtp.client-ip=52.101.85.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cww3/1bS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTOqcMZ09L/KEZOkdM4hvQBvYNpd73zjjL3M/AD+IlMPR5r7fwUjpOVrFPoHFMCCckXiKvhfa3wHw1hdFVIvdm9vPYqn5HlFNFZT95K4x4pfHL3s5TozfCTFw0gICZBBA30GQgjVAh4cQQAga5jEjzWbHrI09fVzs1xPWvyGU33k5tiQxQTtXNz+aVD0T5da4o6yEGLQ03kcAL7i/hhCrebtGC0/xFEIJgvlNe9vp3uZg3VdE9jRf7+ICxyu7Ro4tnpjMZkSuI7ZAvFpT0GONrT1f+5KEtGJ7Vxoyov4U/I2EgJ1+Qjg96yacLVg0k+qZrzYLiTkq1UzCma1wQpReA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zqVUx7oT3dc5Pezn6inou0L1FsopMOqhidT6knlnXI=;
 b=i/Ttcvg1BELjEztDSUlOzo6uY5Cgvqm211aadKjW+hrcSZHACJwDO1wkJwibm7Mt/M/IFsiLF3Y+neliqaDLbMJa59NxJ8IPkSn9TODjKxx9/wEgXWXcWikoy2Dzboh3bMhHEaCawEPsDl49VLAeREFn/9KkbsXBQ5NZhkpsQ7i2st7aRQKKVodXCvV3bOCcFIIqADbQpMJPiIUQ9Q30W2a2qhyc6cXKoLTh8DzaDhPRdVZHrCv5G8bE6SB0LhAjNmY4Rz27CI5/tmMTony2C4F0fVyp6ZnigL5sby3DZbwQrJ2XByi0qz+RNrZVcmvwLkr8LziLw9ZcM4ToT4ning==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zqVUx7oT3dc5Pezn6inou0L1FsopMOqhidT6knlnXI=;
 b=cww3/1bSxI/QUJ14GMdvfIqPncUeg8IXEnOEmkftPrPA/q+b/k+sExzHCN4kFt1quTDG3jlsfAqprhF9YZ1tMleqWdPWlSwCk3R5kUr0EfJ/U38pKUbuNeDP0lS9STtlEjZ4ZCechUpzwNGGPlKThC7sQdLiJ3SppVgbNvM9Y/r+kaSIZssYwJAyTg9cihoEweK+lzNSvkNoxoESCZ3bnXE0GklGlTTe2cwVZeeB9CY+v2Fv/QnOkQ2Fz0PnVGEbF3aQXrOW15Moi+9KB4kwbd8cI8HceyiN57YfudphMZWjyMP1eIekKbBh/sgKDXLw6FhwippUQPtPwZ5f3Q9dGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Wed, 30 Sep
 2026 05:18:39 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 05:18:39 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Wed, 30 Sep 2026 14:18:34 +0900
Subject: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQ6CQBBA0auQWltJCdoOVyEueii0tBnSJcSEc
 HcbWL7k58+gnIQV7sUMiSdR6buM46EA/7Ldk1FCNpRUGrpVhO6Ewca2T4yN/FixlUG8jejjB9l
 VlzPRNQRjIC+GxFuUD/Vjt47uzf67PmFZ/qAr682AAAAA
X-Change-ID: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|LV2PR12MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5fa947-cc8d-4c64-ea8e-08df1eb2494c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|366016|1800799024|56012099006|18002099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	W3WCu2s0cDIaEfiHqWs9M+MTG+whtBQqUQ5kXobjOOmtvmFGrg8vFrOcbaPOLIMUxTYaQomFmoPzzuVF7xaPku+FaIb98aVXKGvXjR9iQnGbuDiIpCh4SOaMj1SvSaU5/4QoxC4X43PTLLSVekDcDVT//3u+pgV5V2/XxI110C29fZmM3SFFyVcB/Ok/2H20n++B01D2jeWLkvr9/FXHVsF5GIDlJdEvh9yWkNUfFphOvE0rp438at2ZM/+nl4pr2H2QgwGDEnfnbElHeErbp/AMJTM2Ni0B3QcY5dNqVcbZS+0te2HpBetnTVBnxpFXLMEVlY70Af7AZm1rL1PS6nXRNEdX+vaRVptilE5zLQFEHrVWIGR85iEY9T89hb035mcrPG6O8hKgpoQeOHr7H931q2vZkcT2UKv8H+RhBkZLoD0u+XgUngVegoHfVzYijkunLiQuDWLnP879PXO1VwdtdKeMO0odrpWWWs0CzFSDbbFcoH76lTvEo2mU/8VtbBI5Pr4iT30TUvgYXkwhM/keiuAf9Y/65uGO/r8vuHP/LbvuBw58Bnf5K5k7X/uIejQhoftw1L27cTHt5nlsUFDQm/lAJVwGCD3/x0SGkVg6RqyyvXHzfinBGK/IOub8126oD7LqR6920Nwq7zn58xT3ZV3Sv7waFnhXW3YnnAw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(366016)(1800799024)(56012099006)(18002099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0VFK3FRZlZ1RHJ2WCtLZE5DWk8rdUViRDRwZ2RndGJXNDJoNUNEd3NTTWJ2?=
 =?utf-8?B?SmdGWktvblAvN05MS2FxNkRXZklEeGIzK0NsV0JIbzZpN3MwbW9ZL3RlOENT?=
 =?utf-8?B?Vml3Wi9wa091TW5QZUhQaFRpTHIxUkZEUlVNVHROTVRzdTdWdHB1RE1ROS90?=
 =?utf-8?B?a3NnMXZhTnlGVWgyTDNqZmdkZEtLYWtTR3VWYmpoR1BsNjBrZW1ybC9WOWVp?=
 =?utf-8?B?TUY1YTNVUzNHMlIxVGcwUnBYY0hVOHdXelplMy9zaUJvSkhXNTFzSGZScUJF?=
 =?utf-8?B?Y0RJM203VlA4WTJ2NnNDaXRzZ052ZFdwSE5QbWhNaitWWll6MFRhVzZnNFdl?=
 =?utf-8?B?V3ZtWmtOVkVRSnViQ1EzQVhRT20wamRrSm1ESDRpQjNXbHFpNFlOejM5NzRG?=
 =?utf-8?B?WkdCQy9BcFBaUXZqbC9kS3Jwb0h6ZWQyNTA2eVA3RjB6S0tVdXNKVXc3STBC?=
 =?utf-8?B?aERsdXlNMmRWcUFhb0E5ZFVKYjk4Znd1OHJxOCtHWk5BN1VJQ0lDUWpITXdR?=
 =?utf-8?B?cGc5UFFVY25lcThuUkFobFc0K3ZSRHRGSHd4TVoxSXdXcWlaaXlWOE05OU91?=
 =?utf-8?B?MFRveHR1TWFMK3pWS0hQTXg2Vk1QTXIwOGpzM2MySld5dHY2NmV3d2Q0YXM1?=
 =?utf-8?B?L1UvbVNsZGFoTUduQXZBRWEzQVZlUmU3NmZpOW5xVi96OVhCSVJpeUVSZDlt?=
 =?utf-8?B?cnFOQ1dhYi8zcWxGWDQ0OHYwNE5saFBuNWdOa3JxTXNOcHJ4RzhzVzVvWUlT?=
 =?utf-8?B?d2tQaWQ4NUx3eVF2UlFHYlJ5cTBRRWNjb0J2Z0VIcE5aS3dIdkFMdTRYNjlF?=
 =?utf-8?B?ZnVpNS80aXlLQ0lSRExmQjhvR2VLM01uamd1SDc2VmpCOStlYTE1WVo4Y3Fw?=
 =?utf-8?B?Q1NGQ3U5N2dOQkE1akY2QkM1bnQza0Z3K2JwengzOFZoRjJGVkZCWm1rMGxX?=
 =?utf-8?B?bERUNnZBYXZRa3ozWHFDK2pOcmVDNWF1VDFBYTRIUWdoK29PWVVwWFZtbXB5?=
 =?utf-8?B?My9vdnJFTFExUGpjc0FOd0N4Z3AwM2RnbWgzQWRDOFlOczFDTG1PUnN0NE43?=
 =?utf-8?B?MGNZT1FFMFhrWnJrUjZaUVhOVE1kZXkxU1ovSkplTGlSR0FGeGhGVVVnWXFR?=
 =?utf-8?B?QjZkSVpGVUprZStPalJyZ3JBdkUzVGM5bGRhUUZWZGZncEYwRzlGSTBsOUVD?=
 =?utf-8?B?eWNsRlIvKzRLTElnMkdOdFJHcHRMTnh4aGhNb3VSM3NxdERxTktOR2VHcXlL?=
 =?utf-8?B?cHJ5QnFQaURNeUNHcmEreHNsbnc5amhBTnNWY09WeE1Od0d4SWNZZWxndm1I?=
 =?utf-8?B?MzFDT29xTVJ6VE9FQlpYYWJlR3BTQnM1eXlIdmZWdDVwM0VxOTFoVXBVbVBO?=
 =?utf-8?B?Q2M4SS9UZ1plMlo2eTU1dEdNaUxsVkQ3c202ZTMyR00vZHp5dTdDSnBPQS95?=
 =?utf-8?B?ay9KYm9FeDBrbDF5WnpnZkthbWJBOUNWYUpTVFdxbmUxaWJvWXM2d1lKTlJC?=
 =?utf-8?B?NzlRek03clVtTHJRZVEzZUxhcXZzcWdCK2lXOHVadk9HQTk5TUdRdGNJODNK?=
 =?utf-8?B?K0RyeHhJKzA0eTFHQjhvZEZZb01ZUGp1cW9DR1BTTUV3MzJrbHpISWRBMmI4?=
 =?utf-8?B?RnZ5SFZFalkwdzlNZGlKSHFzVVRsSG9QSTY5b0RZZERrRFRFL25DZ0REV1kv?=
 =?utf-8?B?bE0xTmpVUGUxL1Q2bmFaRnpid2I2M1oxQ0FzTFkxYWRrb09QNllyU3lLUDRE?=
 =?utf-8?B?RG9kcVFRaEhScGlXZFZGRkJ1b3BvYUg0Ny9URUZFSWdPUStOdHhaN2NXclJO?=
 =?utf-8?B?a0M3UFBuSnZXSTFlM0tYQTI0bW9WbzFsN3N6djZCNDRadjdISjZMSzY1NHpV?=
 =?utf-8?B?Y0NsOWhXOHVOQVhzOHF0Y3ljN0JzaEdTNkhmNkxJTURpcUxocE1Rd284VnVY?=
 =?utf-8?B?NWMzazBjeDhOYXRJanZ5NWp4SURJdkZ4VVVYbDFPRzlDK0dRbzVvaWN0WjlK?=
 =?utf-8?B?UkpDZld2RE9DTnRoQzh2aGVialpKd2pBa3BIZVB6UWtFSnVSTWFvNitqTStL?=
 =?utf-8?B?dEYyQ1BoZDVtbmJ3aW54K0s2NW1IdWt4YjBycDFsWWpNL0NUQUhXR1k4VlM0?=
 =?utf-8?B?MVVVQzBNNEhIWlVRZTNFcmgxM00vay9nVmVJN05TazdjeVFVV3ovOUNOS3o3?=
 =?utf-8?B?SS9vaGNtQ21FOXFvOHBzREhlZ0R5VlpqSlQ0dkZqYWZua3NHSlpaVmFqcmpK?=
 =?utf-8?B?cEVwc1hQRFBQUWNFdmNZK3d1VzRmVjR0eTdEU2dNOFlmRExUd2FNOTdZSmlV?=
 =?utf-8?B?NHBCSVFEbTd3akZ6UUR3OFp0VXQ4ZHJMVVpkZTZjS2RoZmk4SHhzSXpjbUQ4?=
 =?utf-8?Q?dU56sl3GSXW8DgNazoLrNFVB30Ep7cMX5i2w7qdG5KFLI?=
X-MS-Exchange-AntiSpam-MessageData-1: Qr+Tzzq0OEU1fw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5fa947-cc8d-4c64-ea8e-08df1eb2494c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 05:18:39.4037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zi3ZZw4fPwvoA141pHZdKArlkCnY7jL9IA/LL5tQtQ29jUlw14+XYp/P6rFPe7kpaRx65zdbSMWuFz7OhzLPBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894

CLK_MIPI_CAL on Tegra114 is a plain clock gate with no source mux; the
fixed parent is PLL_P_OUT3, which is specified to run at 72 MHz. The
clock driver currently registers the gate with clk_m as its parent, so
the clock framework never enables PLL_P_OUT3 when MIPI_CAL is enabled,
and reports the wrong rate for it.

Register the gate with pll_p_out3 as its parent. Also drop
CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
72 MHz so we shouldn't change the rate.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index f1bca81b7776..97f5500b13b5 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1050,8 +1050,8 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 				    &emc_lock);
 	clks[TEGRA114_CLK_MC] = clk;
 
-	clk = tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_base,
-					     CLK_SET_RATE_PARENT, 56,
+	clk = tegra_clk_register_periph_gate("mipi-cal", "pll_p_out3", 0,
+					     clk_base, 0, 56,
 					     periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_MIPI_CAL] = clk;
 

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66

