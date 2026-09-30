Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010006.outbound.protection.outlook.com [52.101.193.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2138E8A2;
	Wed, 30 Sep 2026 04:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790741519; cv=fail; b=NjD8XXzkQeWOzBT07whTUW4u9U+B62qG3lOVhJUPvevR2UwzLvpHj1Wiqnv/03uU7TdBqliuY1ZD8KAb7ROwkDTEqLkiFvr0dKVXtyrjH1QW7seeowDQqJKh67+enAvOmjBuYJuYNzZfmx/jum1CrckB8uPOGQrWAADjnX8Ru6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790741519; c=relaxed/simple;
	bh=7Pqh7FjV8ibxfS91iSCNaN4rphq7CqnKXYRPcsdXb4E=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=E34FLDJkND0ppFG+kYhJ0d7OEmho8z/1bTV9BY216VIG4Wrag/xIKfzj4obscM8tuKFde+OtMmVB6bWXL9fjfodv41lXfA/31d9bbvykvyMUX8ZGaZ5htGJgaDCiAi+W6jhtQGIqnSC3SxlzIFvL1lHOfVZwDWJKjK91bke9n9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cb9UVsZ1; arc=fail smtp.client-ip=52.101.193.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cb9UVsZ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBsrPxUASzEE1B5wbJSezm3hrQqnvAy1D5PtcZRlvReYTMMNxloSAUBl5XNIHu17rnNOolHw7bo/mLNlk3oYaBdooPyaQ+30I80YbWrin6Ojb1DkvI570zCj9TyzD0SLZPHl16H16dQZQnGo5ok1AKIEhh+dUgqB1VyH+OO/4xdMQkgwI/tzIabo0Xm0iWwsYYG0XNWxdrVadHE5ibkUHLTc48ZWDt7YZIqi4EBlq1IIdSTdoxT/+dFQ8A5T7fNv4lGpOMpBW+xI2hbntVidvKKphSmOiDOr2TNBBeMBGh89rJWCU+xu+y9IWd9RAcIlBGu5jSsld6Bu9bNkSVNZmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXOig+l2nuZVaaNbuVrtGgybC+CVzlN6Q1LKCxvuZYg=;
 b=E93aOJkr7gxS+KNSr2qKjn6/vkp3xHLOMXmfNxvzOcJocppL8qDRFOouymLhXGTL5R0dDEA9ItAfGizMcH/tpihfNd1+XKuKxsna1pXjHH3g0muHDxDosr0RPB+YVISkhB9z7l4eYV7P+X83JQV8ameKwltjwlAw/rGofrAEWagNgEB0zVQiW4PMAfA501Swxjffq1lK2hEaMfZAnL4qkXvc3BsctLRBVeVcDQw1rNr6h34ZtNXhWKbv7NU/HN/PCs85s3Nbklax8H6pVZbaDkW3BN1y1jB4FrbybG4rZGJeT0AzOxjNtr5KhnUM9/NuTCBQXuSW4H1ozVUultbsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXOig+l2nuZVaaNbuVrtGgybC+CVzlN6Q1LKCxvuZYg=;
 b=Cb9UVsZ1jki+M4FhQUEW0YdCIoFE11clC/9mG/9VVqlLvy42nYuivv6mXzfhVi9yRpVNOUSPweWaGd0bhjc+cfTc+Jk9mWTsBx1whdQRUwgTndIOxRO6BFZhDqMVYSFx18lWoFD2Bz9CzntqPM0R17Ar4O2z40w2NA3t43aHKco1pva8K4MG4riSF8G41TK2MXEfI2JZcBnYIs31inb1hSJ5uZtBtyRpn08YXFUzU6emJWAcbPJCn4QD4rduUCElos5ladIaNxRVkNPFLU8sqHvgf3jFLJTcE+jA/J+EzmxzFbUmi2zQ+oLyeB7YL/RnWoYDD8fhwm2Fw6ZpES82Zw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 04:11:52 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 04:11:52 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
Date: Wed, 30 Sep 2026 13:11:40 +0900
Subject: [PATCH] ARM: tegra: Add core supply for Tegra114 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0Q6CMBAEf4Xcs5eUYlD8FeMDtIueQWh6QjCEf
 6fg206yMwspokDpli0UMYnK0CfITxm5V90/weITkzW2NFVh2NfdZ4jgVmYou33qGEL3Y5T22lb
 +bHJ7oeSHiOOU9Pvjzzo2b7jvHqR13QAOO7ahfQAAAA==
X-Change-ID: 20260930-dalmore-fixes-core-supply-e628f9d40127
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.16-dev
X-ClientProxiedBy: TY6PR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 8414b3b0-b116-43a6-9c66-08df1ea8f49f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	CTbR/hDUiN5ox4RbaGCXslr81g86rv7ADmyNSqp1axQitic9oTs1ZEZmV3V5wmtccOJiW0U+P0Z1IjQ0W8K5XkmhfjdRsCpsB3J3bpIiRqxO2sbDhA3hKdwIZSCYDJ7VBcSogLoK4iVfL6Mzfo5emCBs7un2MALGsNWWAzuvm5+8zYLrEHPAzEYW1CnJsgwLG9XQW13uFbaPXQfItvltNroVkR9vV3oJcucBgMyhgu0JYsEI4IGwF3g5Dd9virrOElClxPEiAm8Sg8ZP8gIIAd4L7Cq7wOwACurml8of/bABtVuLkzUHl9yPF8W6kHs+MxETjcL9YwGGFcEjs8h7p9F6oMcBXpKfcHbSjZnR28svZi6H9CaCBeMhy2ODj6ZgtW7c2AI3AownKogSIr50WNUy3kNNyV0cCLFuohvc+DslF17ey7aCVpmkzeQO1N6uBNrgywOpEMZwuJhpv4kREKuxDDccSUixasBoVxoHGJKKxMlnyCj4aTh1DMxwx8pNvcQv9oHCWW4Ox2PrFDoeCjukBlwwJlxNVKssKPSriNB3AUPjC62rKrSzQ7rq1VL9x9pxJOENw7tTa8FX2oo1/BMIdlqnQhFEumFoekj2rauSlBzi42z0xME2z8q+tcrexyjXtvfyAFC82COFA0DlBx62ujtXikdM47xchvfQV2w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y00yY2RMaUE2VHVtZzMwbzJQeEZoUjIwNFZsTzB6NWNzWFlNemZ6cHAzT1pI?=
 =?utf-8?B?cmgzeUNWRk5QTmFrbmYrNUhIT054WEVCTFRkY1puSzY4TjQ0TGNDZUhHamdD?=
 =?utf-8?B?eHZJVzZ0YTJDYjRGRnhUalJrNUkrSXljVkRCRGZoc3NCOEFZcGlsZmxKU2Y5?=
 =?utf-8?B?M3JsaW1ROVQvc0NJTjBmb2lLdW1ONDU4SC82a3R0a1ZSd0c3MzJaN3hldG81?=
 =?utf-8?B?SnVPcVNCaXJVRE8wdnZPQlFha0Z2c1l2TGdGVUZFc0JzdkQvdnJMME80Ynd6?=
 =?utf-8?B?RElQZWtmbWp1U3Z5Y0xZbnpCQUZNcnp0YXRNM0xpbHU4ZEZBRk5mQ0VWS1VF?=
 =?utf-8?B?MlVVSFp1c3J5dFRPNnBjS3oyeEpKbEVXSHVyT1JMWkliSTBjV2lncnRLblRS?=
 =?utf-8?B?YXA3TkZMdG9WY1F5bTVsU3hDcmxMeVh5b085MFllN0lkeXE2cndaeUcxVFhx?=
 =?utf-8?B?My9YdjV1ZWpXQnZSQVpRNW9ERTNFRWlzbGp4R2xudlRXdEkxanJuS0FiR2Vi?=
 =?utf-8?B?UjNZQW1jQ1FiaW4vNmkxZUwrZXNyOTJCSUZKQ01zTGhPOUh2UHhuWlRHdG5u?=
 =?utf-8?B?OXlQZEN4aEhNSHIwTytiYnM2T1Qzakg2UmxvWG92amRWUlo0MXJTMjJEZ2dQ?=
 =?utf-8?B?RDNwUzJ2US9VYVZ1cEFmZ2tKOVRMV2hNZWhHczEzaE81VlppOVcvRmRiUkhO?=
 =?utf-8?B?QnpNS3o3WHUrSm9SV21neEIzSHNBaGZZbGJNbW81VHlIUDJYODhqWHQvVmRp?=
 =?utf-8?B?R1FudVBIaVJBWWVJUU1xdjVaZ3NJaVYwWVFqQlRSTFRGRlNMamZCUHc5aTdE?=
 =?utf-8?B?TXAxN3dSMEk3YjhBMVNlVEZQcFRVMUFGY2h6QnJlRnRUQ2lEc2d1UndKVkJQ?=
 =?utf-8?B?ZHpEU3Q0Zy9HMkpHaEhlcXYxeUpHc3lWV1FVWXgrallsUWI4bFR6dW1mcHoy?=
 =?utf-8?B?QldOL1hET2RiQlo0NVF1SzI2YlFHWDlZVVNaeTZuMFNVUW1DZEV1Q1NuTzNR?=
 =?utf-8?B?UUFpbGFlek00K1pxR2xaT0ZMd3c5S3lGMW9McEQvL3ZmdDFIdkU5QnhqMlNx?=
 =?utf-8?B?Vm5YVnNESDh1QkY0VGhad0V4YU5scXZiN3BCc2pvTy9lTTNZZHg2aElDbVhi?=
 =?utf-8?B?TWV1a2tJYkoyNnplL0h4Y2t6d2VwOW1DNTFTNm0yTjFpa2tuUDJHaE9ZSjUr?=
 =?utf-8?B?VE1yeTVjT0NaVGRnMC9wTGJKeHB0Tm84eWZwZlRvYmJlYSswZnFwOExMRUJ4?=
 =?utf-8?B?MXZ3L3dTeG1CU0hVY0U5ZSt6MmxzbHpCWXNMcEd6dkJYbHEzN01SVWFyNlJS?=
 =?utf-8?B?cFVhMWRacFllOXA5cDJUTlVKaGNwMHZaTWJnZVI0bVpjaFZ3SFRVMHh6K2Rh?=
 =?utf-8?B?VllMemxJaDBzWlBOZ012MTBwWCszcHZObGU4M3FISFp0WXNiT3kxOEZJTDY0?=
 =?utf-8?B?ak5UU3FDZnZhbDdHQVVrZklSMlAvWDhGNStFcm1xOVhaQWFlYzM4TWo2enM5?=
 =?utf-8?B?eHdRQk9FczNkbWg2Z21uc0d2T2hLVnUzZE9TUE4xbnEvLzcwYmptYjdPcGc4?=
 =?utf-8?B?ZWxsaEFBZFF6Y0pVSG1nTUNZL1kxWHVkck9kTi9pdVRtbzAwbjl5TGxHY3BP?=
 =?utf-8?B?S29mNFVpV1J4WU90NXJlSUtJaFhLRDJ6cElxVW1ETFdSd2FtYTF0Y0laUFBL?=
 =?utf-8?B?RXRlaTNUNkRVM09vbjdNVUUrK29VclFjaXNsWGlWMlVNMmtsWmp5ckFEc0gv?=
 =?utf-8?B?eGI4Rkw0REdkYmR1bHhJWWJIQk9OMnlpSHF6ZnB2NXA4Y0l4S2hQZHMwdmo5?=
 =?utf-8?B?Y2tlQllVRXQxcENMYVFVUmZQUkVpeE0vM3ZvZXRicG9HSTF5TGY5U3U5SWt3?=
 =?utf-8?B?SXJPZWVoWks4MHJ5MHMwd0M4QkNzbjVGajRhZC80eE5wQzEwNXZTUnVHd0Jj?=
 =?utf-8?B?VWhaYnd4N0luSTNwcTdLcVZFbEMyQisrL2NTNVh4T2taUDBWTVo2Q084eFZj?=
 =?utf-8?B?ME12QkNiWkJHa0hKRXFsWUVKbzlGODZ4dHRaeC82MEEvWXpkYlpsSWhjQWJK?=
 =?utf-8?B?R09rVTAyS2JGckh0SkJMRlo5K0hwOFZ2R0xOdjlQRVB2VUJjcDQycStnNGxO?=
 =?utf-8?B?RFBFMW9PVE9XeDZuczJDNkd5Z3owSmJaOUVnOFpYY1ZjZXdLb0VwcThjSjhI?=
 =?utf-8?B?WEI2VGt5QUM4aDhMcDJPa0VmcTFzdXlPU3RybXZxYnV4YXA5WklsS1FybElu?=
 =?utf-8?B?R3NhbkdpOWtlWlFzYlhESHY1OThTc094eWg3MlowSnRHY3M4eStNV1NwR3VZ?=
 =?utf-8?B?Sk1TZ1VLOVF3UUEvRE1Dc1lDQjJsb0RMSlBWTGZPdTJTaldVb3JLWDJIL1di?=
 =?utf-8?Q?1YvBSRLRtRGLeJgGV6iEdiz5aqWrGA8JjUik3xarSnr1u?=
X-MS-Exchange-AntiSpam-MessageData-1: Jpf9EHsm7IH8rA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8414b3b0-b116-43a6-9c66-08df1ea8f49f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 04:11:52.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BHFRw2IyqJhNYBSmxfi65ZKV1BsuNkPZwzebw75sy/EmdXo2WCTV0WA/zQw35pXthGZJwKJeJtXyhLB5LGZAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599

After commit 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power
domains"), a core-supply property is required in the PMC node.
Label the core regulator on Dalmore, NVIDIA SHIELD and Tegra Note 7
and add the property.

Fixes: 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power domains")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
This skips TF701T since there is already a patch on the mailing list for 
it. Tested on Dalmore, but not on TN7 or SHIELD Portable.
---
 arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 4 +++-
 arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 4 +++-
 arch/arm/boot/dts/nvidia/tegra114-tn7.dts     | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts b/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
index c06b52fe330a..8d97a47c969c 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-dalmore.dts
@@ -969,7 +969,7 @@ smps45 {
 						regulator-boot-on;
 					};
 
-					smps457 {
+					vdd_core: smps457 {
 						regulator-name = "vdd-core";
 						regulator-min-microvolt = <900000>;
 						regulator-max-microvolt = <1400000>;
@@ -1095,6 +1095,8 @@ flash@0 {
 	};
 
 	pmc@7000e400 {
+		core-supply = <&vdd_core>;
+
 		nvidia,invert-interrupt;
 		nvidia,suspend-mode = <1>;
 		nvidia,cpu-pwr-good-time = <500>;
diff --git a/arch/arm/boot/dts/nvidia/tegra114-roth.dts b/arch/arm/boot/dts/nvidia/tegra114-roth.dts
index a89b16573b42..f48d5c37e848 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-roth.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-roth.dts
@@ -837,7 +837,7 @@ vdd_1v8: smps3 {
 						regulator-boot-on;
 					};
 
-					smps457 {
+					vdd_core: smps457 {
 						regulator-name = "vdd-soc";
 						regulator-min-microvolt = <900000>;
 						regulator-max-microvolt = <1400000>;
@@ -960,6 +960,8 @@ rtc {
 	};
 
 	pmc@7000e400 {
+		core-supply = <&vdd_core>;
+
 		nvidia,invert-interrupt;
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
index 75fbafb4a872..4b1e47364fdb 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
@@ -95,7 +95,7 @@ smps123 {
 						regulator-boot-on;
 					};
 
-					smps45 {
+					vdd_core: smps45 {
 						regulator-name = "vd-soc";
 						regulator-min-microvolt = <1100000>;
 						regulator-max-microvolt = <1100000>;
@@ -241,6 +241,8 @@ rtc {
 	};
 
 	pmc@7000e400 {
+		core-supply = <&vdd_core>;
+
 		nvidia,invert-interrupt;
 	};
 

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260930-dalmore-fixes-core-supply-e628f9d40127

