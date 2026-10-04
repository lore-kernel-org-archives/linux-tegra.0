Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA0B47F777;
	Sun,  4 Oct 2026 19:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791142170; cv=fail; b=jOvrKvyjFGZmOoJgZrJiSguvF5SbDBd31aDS4b2MisxeVj95I1H15FCOh01YB/l1zv9s6WgixUbSIVZhisr/OUriBPiaRBfAUgVrsjpHVppeKLnffJzjObmeWYbpcjJv4b6yxlWJi2yEZ9fMpg2Z5c5UP8vGA1NmESAHS3BckwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791142170; c=relaxed/simple;
	bh=GyW6R9eGrUBXZe7zp9t0U0LCSpl3jM2Pu97nKKQGPmY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GxyKNQGhsnoWMK4DT4jmHz/x12asQxSczNfB4fwjccMyB+YALwWf2N4bZb78YJ/fyB0J6vFhQq4kFnV6F4J340jGdochHbNUhfAIy0plUX8uSn+9FM2j2ZGN5T103bVfC+2hDLMW6HTr+wYgdKnVobUQIA2y6Po6jyyJKSWpNd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Th6D4Jat; arc=fail smtp.client-ip=52.101.57.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Th6D4Jat"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+tv3Wsj5ENIWlNAh8dV9P4h/zWFDuKZ2FLK4Fe4gOHaDdowkGDLtZZCOe1eoFxPWUjZzpz4ymkIsZjp4ZUzcSUedk85VuRL4aipM31jVdbsHZsvvdfkxGrM6GPAJxwVclHAR2xnTQRWCfJFZCdhK+4uzEAohe/ivallqftVE6QJF6Eti6I/y6RwMOPUd/nRZge9W1JT5PThqqUQ1ZPrOdvCscED/KGEWK4ucsmh0fdQfiKao/Y/IX4/v6r4Xam/QPhgYHA5SXUABEXVXRmtAWcPJoXgeITl2X3v4wGi6mRgg+Sdyn2KT0mIkMjUMVnhdqToAZ+eGosTKHMBJGQhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D/CxtoG+pzNI3HYCHh1/14Mgmr/jh1c1yt1WmYxN84=;
 b=sdtsL8/IEgGf+6ITEpLwLyiFNR9VGgPBoqYkUSGxQFTOUD8bq2/ATz12MHCTko2V2yzidvPkqS4ktl5AOYfNoqK/yUV8Xz6cAx6tCrzobC9/N2aCyOR0HK1Pd+wxFqEfV+VwE0HQYLrzQbCE7LIz69N0/vRMooB/3rEM8D5fH6FBNju1P+f0047+dLYK6Q4gQ20v/j2tS778UkyyodFj3BtbgxMSFUp2+T7DbW2EECqewjipH5VKVCrkcNoRjFGapE+NUC/6jHtxuJNI39bBn94ALLsb5UdatT8lHWYqCz/8gloaGWaNoHO8BPCgn0ejbkjkGPna9DI7TSsMTTiXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D/CxtoG+pzNI3HYCHh1/14Mgmr/jh1c1yt1WmYxN84=;
 b=Th6D4JatakXvKeKLRtMitmJmtg0Rvd/VxXToP+9FOyACuVtPbCEe5+BORF6DB8997zIEiBiAcLQfx7jsQ4w+3X4XkIiYd/ThbTKCuy7zDCrAU9BXSUO6b5o3F5VLe4ev2dHBlxbDApdLjW552e0wnpknhZSYrq01b5Ty6MB4Bz6qLoVSsHNfFAOVFfB4qDALpUkfxBSFDTWW4KNHa47A1yrRkjfmrMjEFZoJyVI47n2iwMPPcchTCCUfAEt8dC2AmxmzbHw3pB6bUNRYBKAOy8mFOk9J3L5tnpL/BuEOYZ2z4zL/DIV/L1fRBxxbSf03S2SSF0BawcpG5bSs/EeaSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SN7PR12MB7299.namprd12.prod.outlook.com (2603:10b6:806:2af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Sun, 4 Oct
 2026 19:29:23 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%4]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 19:29:23 +0000
From: Prateek Agarwal <praagarwal@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: Prathamesh Shete <pshete@nvidia.com>,
	Prateek Agarwal <praagarwal@nvidia.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] soc/tegra: Add Tegra268 Kconfig symbol
Date: Sun,  4 Oct 2026 19:29:19 +0000
Message-Id: <20261004192921.2460405-2-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261004192921.2460405-1-praagarwal@nvidia.com>
References: <20261004192921.2460405-1-praagarwal@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0112.namprd05.prod.outlook.com
 (2603:10b6:a03:334::27) To CH8PR12MB9815.namprd12.prod.outlook.com
 (2603:10b6:610:277::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9815:EE_|SN7PR12MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 324d26c2-beb5-4ef1-cbcf-08df224dcbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	RbvPAzZ1MGOjXouzVOJcN+7S90uB2QWWBMo0Xgqd0gejmHLW+IXhOzR8LULRu/vy7HDFBvEZNUUTGydHZU/XXhgm2Unypuc/TLV6R384BsErQOGjK/i5JxDnLFFEc8agpsIF5R+JzxpxcTWTrilEpmhgpwzupAP0sZ/A5bA7c/eM2d4Ft8XBA39I018oNiXJ1ooMmyBFkuTsG/kkZasWI0qvw/DzKixxOQU7q0DmErM2pLHevmZJS9E2VLzdC3Hw/cdVBoXFvVxc21YzbV4MocNLbhCafC9z/JIzgQO3Uq3vX7ukBFxcj4R2gSKCiRVwoFo7nCqXvFeOn6oW/7Ld1dUkltaAOpXgHyO32ysWN2L6LovSShgjMxwu1tP+alDL/sUfkE5GJop46AP9vnDE6OPPHOx9e5nT2cwEHmoOQ3B1AEM+aU9Bt8Xn3nMouSrySeuivKpXHpt9dWpvuXGrHdhWh1wlIUMdSLo1qDYT/pX0xKhf24RSOVBgGwUABEdyZnj3i6tlX1FS41usuXqCxQsz8PnsCJdkEo1vnXUJRmB0cAA7aKhYf/UlJ5AMTkGsgA3ye80G/sKa0t4JR2EXb+s35WPAioeyw0By2zcpamNv7rCY81St8mlrIjBqUELdQUZai5Ns6O2/Jj8j+txH9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ixF+3jmmDTjZnXsxy3WigCk5Tdj0L447e4rFSwawtaYymRXih7wTYxfRzXkN?=
 =?us-ascii?Q?bsKkWguGeXzUmvqbb99+CR9ZKQ+sxJXEZe8QVKpw8z9x9RtTKUO7INBdSrLP?=
 =?us-ascii?Q?SukdVp6ntb0MtJhPoH6pBGwWC9bN9Adnepk53stoqZ4knSsBjjD+Z4iVgOaz?=
 =?us-ascii?Q?dCZq4LqFuXKNEoIsB4y/Aoh2D0rHxsG/IbPQxfIs8lEsJ7uWoMq0Bk7phYAi?=
 =?us-ascii?Q?DZPos+hSW6U79BqG0JjR4gfuUnDqYmrfsYkOyKAwjWaO0HG5I+J6i6/60XJg?=
 =?us-ascii?Q?FDGbVZTNSUZP63GNzBrc/KNX6k6vIKR4NBiIZKClMNqH6mJyaWz8ROB6G4TZ?=
 =?us-ascii?Q?RITO2ULbaJxeKdLSuz+etE0k4cY0e8jeZeLUvtBipAegNIgPKTeHEaxJFK3x?=
 =?us-ascii?Q?lAYhDt5i1vEMUGv1sRlzG4EWfjcwfXfjcfL6eQbCNffFZdnloBQoY04EUkt3?=
 =?us-ascii?Q?8ifZWYKWoRCREmPawn13bYZ8sIdMgiXKCAE7K/xnDLyrV/HSAOw0kXsM+GxE?=
 =?us-ascii?Q?MyTvNG4cDurR+SA4r1FPwZSUv6TNecfm9+slJAgFC94r0Mehs20DeWwhGhyh?=
 =?us-ascii?Q?qnSDSr4F1X3ksMgqhw4QWWojatb2NUsJA3iaJLx5ci/UjOA/rYo4HSkEwW3i?=
 =?us-ascii?Q?orsIyYM2EZjfgSapfjyPiDeYqK3pkT3+OXzE7IYNcaEZGc0AL7NO8Vy/h+gT?=
 =?us-ascii?Q?ECezOBEcxchOw6Xx4SOpKLHZ8f2IdEEOVtVzlGPLTHgFmiOBEOD7GxPa+8AU?=
 =?us-ascii?Q?YUwjvkaL/qNbE+3ySgaiAnYy2HAS/3OMv+CPCr+4rG5lnAK9EoH6trcyRkIa?=
 =?us-ascii?Q?YKrVdpM5rCgviNVwownk1lOZsFdI+pV01Qc8zuyagxIysD0FC6qAaLakAuIX?=
 =?us-ascii?Q?5/dsr/DaNjBUuolHkvDH1rWx1jufYGeNL72BaajKkuB2gts/BQsZWua6gPuL?=
 =?us-ascii?Q?bVZEStFqD29fpoaDI9H8JNahJA6BVnFy4oXLu7e+//XpYZkdeGsGa2FkWrBs?=
 =?us-ascii?Q?a6PJ860PMywlTHPmDzGPfe5a4GNfLnG6453w1bTCvLm3VVAJJCfOWioOnx9B?=
 =?us-ascii?Q?y81uRxCNtMwYV1f8P/WIVz77uBAwByf23LXONLOeZ8vIYMowjzSDfdFCJ2TD?=
 =?us-ascii?Q?WyjAzZ9BrE0glJCpFHRKaML+TSDg0wcdUY7MJJis0hi0XmqhwfZb0dKBWk+u?=
 =?us-ascii?Q?7+dQkTNKPfzkt7TGtpXp4z/J79cdpWRTAtoYEZG7+qCCSYbtNNrpV0R/uuTC?=
 =?us-ascii?Q?J00+7Vr5urjskXjHpqMaMY3ZCJJeW3AOTrBqsr6lPUYdaYcJ3oGbQgVE5Buh?=
 =?us-ascii?Q?eLfKcvLpzRlbazzS7WCKW/BgFWsnGM/1uA0tLwqidDRX5WuSXRN6z7GHjgMC?=
 =?us-ascii?Q?58Rl643aKZjJwaCBu33d/ZJlN3peVL0Y7iZ/g6d0fEGuB+KgztASDvV/Jml3?=
 =?us-ascii?Q?BTJ5ufD3wat+dmwauCEmStDFVQsN6e8gvmbypURbLZklf6TU6WvI/M5DD58x?=
 =?us-ascii?Q?BOyURyEuFYeWd14o1Kh+0+gF5vyJjWhbz9zECdm7Bq5jpqke7fn8AF4pkduR?=
 =?us-ascii?Q?9JPhfmE4S6Kg9imEapLL/GYm7zr+tNLTN/7wWLlqeWMtPZx4q62QlpQUsWO+?=
 =?us-ascii?Q?aBi4Tc9Xqyxp8M6Wh06RIw93bo+D8aBfAOU/Vs4w3IP+h8k8/4sy+H5I8EZt?=
 =?us-ascii?Q?A1U/ZkFmhfBNX6pXuvVZDGJ+FS0gppjdXztFgd8RkgYuBVsLoVJN9K7Pcmy1?=
 =?us-ascii?Q?NBo+ITRAvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324d26c2-beb5-4ef1-cbcf-08df224dcbae
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 19:29:23.6024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBfCO8ZeYlQGk7uM7ujLt/Dr+6l4rsyTh9x0wqyvjQVOX+G+2U/IewwVr7ui9dRXzYdzeeuJgNBjUbOS5MvRpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7299

From: Prathamesh Shete <pshete@nvidia.com>

The NVIDIA Tegra268 SoC is an upcoming new chip. Add a Kconfig symbol to
allow fine-grained selection of support code for this chip.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Prateek Agarwal <praagarwal@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 8b6fdb9ad1ea..d856f9efea71 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -158,6 +158,15 @@ config ARCH_TEGRA_264_SOC
 	help
 	  Enable support for the NVIDIA Tegra264 SoC.
 
+config ARCH_TEGRA_268_SOC
+	bool "NVIDIA Tegra268 SoC"
+	default ARCH_TEGRA
+	depends on !CPU_BIG_ENDIAN
+	select MAILBOX
+	select SOC_TEGRA_PMC
+	help
+	  Enable support for the NVIDIA Tegra268 SoC.
+
 endif
 endif
 
-- 
2.17.1

