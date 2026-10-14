Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1F14DD3A0;
	Wed, 14 Oct 2026 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974539; cv=fail; b=kDbHGWwuQRf9EfU6HEvHPhWePN7ZPTSDlmq/YNZgpvwGvp06U3/SHHXFKz072nD0BqOJAC8uIWB+9F4iW73qoYLZCyiIY+26GYsxguliLTztWbaMMR5axKIx9+Ums601rr0C9VRg5j2u/mq6EBBseDrycvQbt1XUdIYAzgynuSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974539; c=relaxed/simple;
	bh=GyW6R9eGrUBXZe7zp9t0U0LCSpl3jM2Pu97nKKQGPmY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iaYWIWvQ7zTJN1Dz30dBfDmtP0JuUaI2Ar/lJHKIPnKUF2kEVwnCeU3XZZW61J0UhfqG+ABEJL2xKozD2SRjy/M6OD3n3UeWHQ8+bQXl/sTOi4y+9SHy8A8Tb/MEuioTL5V6VUIQXmKmmZyrdYNLxi86xBFinYrg8T7r4+GvQ64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=klZIZEby; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="klZIZEby"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2oqmJOHRbGPvZHJK64HHwJRYpYiJSju1a6vni5X66K11BtX+BAVW+bCahvQ53xJOcQ5mbSpEraW4VAXlNyqs80hhJ6P+EZTzaxw/gKFhllfffI9biCGJvxCKyY0uZyfPVbcIg/q4t1iNaiDPnS5JX54yxWrEpLrrNuFD63OBQzEHVep+zphdQClLL7/Dyabu5D/9bWE72htsDg25VaR3kD/ksq8UJ82Bgyw0bYRrEGgiIH3180c8oMDFMsXkfXuwQy0Hzj+oQczvuwWf7Cf+hTwtUEzCBlEQrjIJhm9SEAbzPTgDwHQRnfPMmDYiFcy9dVlUAZfruXNDZ5+ycYwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D/CxtoG+pzNI3HYCHh1/14Mgmr/jh1c1yt1WmYxN84=;
 b=Rf+r5eqrA/eszVMT457nipe84iC1kkv61de4MdO6GqLQ+A2OGbhMno97k2ZVjyrzfp9JA58unStbYv0pl+kykSIDfKa+Aazcis1zRq74DdAlAT5JWPtRA5KmE6+TCuUOKGPXLdkytgd2mSZm1rebdFexYsuSjNv/LbtM2Yug4MQvUigTrAshWnKi3OsvaG5aRvcjufV5VMxEBPqhuE/6yBVtYV75e/wPyBV2O59clTUbFc9LIp7A2S3R2uL7wBLzyVeA50cUC2C2yxxpCAfGGNgS1f+42XwsNG4R87EXPMUB9AqgARIHurIYYCUCB3dLBGEentydHQ50oR8alJcY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D/CxtoG+pzNI3HYCHh1/14Mgmr/jh1c1yt1WmYxN84=;
 b=klZIZEbyOWdFYOuqTMOjs7YnEIlYkWt9ZrasaV/CfKuwS9GHiBSJSY4S1pfiiO2SJ79+e4Z2hlVnt3hsb1MuZ8g43QaCT9XYVsB6cClQIe6b2ji/elPkSeiQjqRZFOj0snmaqGdA4QKCQpZIVKKUNv3rLcXVbFg5zP67T4DvIyJUvjQB22miRJYYcTCZ0t/bblx+hStxh2s7dsobFn0ckS/dTir2AEH24sUe2gr8csER8Lu7ahKjrNJRr6+8PGskWwt9vOJnIZrWAMb/cGsdLT78Emajf5ghMwbUpy5H9LjbaVhihacSm76Lx2nMDl9mEyXPRipIlPd0KgYsOu2f4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Wed, 14 Oct
 2026 10:42:13 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%4]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 10:42:13 +0000
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
Subject: [PATCH v2 1/3] soc/tegra: Add Tegra268 Kconfig symbol
Date: Wed, 14 Oct 2026 10:42:08 +0000
Message-Id: <20261014104210.3978188-2-praagarwal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261014104210.3978188-1-praagarwal@nvidia.com>
References: <20261014104210.3978188-1-praagarwal@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:a03:505::20) To CH8PR12MB9815.namprd12.prod.outlook.com
 (2603:10b6:610:277::13)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9815:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a369c6c-2bf4-4112-42a3-08df29dfcef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009221227099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fXQZntUYAdEQSHfH3SXM6Z6gYsNqWudBWwBqr1sguSXGKdi4BpU7AI4QsOlKBv65Raks+i/lmd9824rrQ4qKLsQIFTqDvwFWJrjDo08ozG55/H1uWPPRYd9HdYPPNXNNjhYckvxHuhjjGNl0MfpaicdjB2ucDEPUc415FiBEvol9C1w66kVLeiGZ74AMjKfPKjnyd0/mkT3gx1bSxgcxZ0eA1PLxan0FKQQblsqWdguwP3OZM7E5Ht9ccTWVZ6+AKn2RRd25T8rjy71xHLapUCX6A40Xc4MXx0/hXhho8A73AmJypaVCzp62iKXSc+RMNBEuOM7YVAO66CYhUvHevAp+qbzgdYO4rEj4TgLEprEv2GYZogp+9T4+/ufuP5dF9wvGh2snxCFkuKge8gdoswvmB2BU/rkfP8tzS1Vnbv/6u1ImqT3PRGD0P519qX/GuEpVk40LFOXH8ucVlyddB/miMjAvauJv5cpOYgqMnDRtfz4cmm0rHHN8Bl4yj7hZUoys7gMI6zFYEF5ktWEW0wtGo404ryLvVBaeQ4/8DGV/NfrbD1Qeo5xQi1oNozd4QHJPRz/HPcuGCvxsplPo24yoDN4CogPLi7q1pxCMhwUMZtiO87N+oyGItrIRqM3nHvt+0JIdL6ESmyH2T+8pGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NCwmcp6+yqlwbS1sJdKWiDIpeNZ5PZr1dJHMxm545LMdeIvvPrLMU4RdQ0jp?=
 =?us-ascii?Q?6uykKErZ4RWxpKLvlsZ8PvFbkjOKxXxTBvarCypvKRO7Z6gHWAIf5uGq0+mB?=
 =?us-ascii?Q?/vQWDy3kHoRDXXie9luTLxGQEnyA+dTSqEvLUf2gNH9ImpFLDUbyTrEgMGY9?=
 =?us-ascii?Q?G34AuT1WzA0erTO0OpFWwRsOoql3ONHM/ZiUOnu4QdClAkh5I+BfU41wjmbN?=
 =?us-ascii?Q?7Qrgu4AWhODvEaCM4he+qyLlW0LrXpqYWMPJDIyJbgFKIofgmo3HYuBnYPNS?=
 =?us-ascii?Q?ZWSSeqfXSF2L3aYEHfYwsu2bSb02GOZ/Q/zvbwXRThMZOeK1XUimbboBGwvu?=
 =?us-ascii?Q?F/GSxHP56czGugJEueGtFzf7TyEcErSXKVYZnCNO7TjdISjBaXxTR9c2nI+V?=
 =?us-ascii?Q?uNj4wbN+3zau6n0ysmq8p1e8ZmtCxRqDFAbAkZ1U2mkyjhOy2YSq8SbatYBf?=
 =?us-ascii?Q?YBDclqF1Kx+jfBICiIT1U8exsYg/MrtzvUjck+Y2lo/EIGzWn9+8/UULj6Rs?=
 =?us-ascii?Q?XfpuxyJrUNbKNABGnnVeSplVOy8lQocX+rS7c0/JF48jALmyTAkJNYniH3ql?=
 =?us-ascii?Q?dNug0hexv89ZPhLZ5SAdq2sO/wv2hwEXdVMHmPfzPQNVc0WRL9xkohr684oO?=
 =?us-ascii?Q?zS5anvWoqLC0xslanGj77MG64ej5QXAYtM7v3JAJOdmq1ZwqL4XARQBZK5BH?=
 =?us-ascii?Q?lva+PhBPZxEZ446Or6PgKyTi1i9YY08hcgJJ6Zq8CrC8V1/nkD28rYBvLzWo?=
 =?us-ascii?Q?TCuLVfeSdRU0Ztye5EkXOMG8R4h4R7TRIyLvi+flD4huqGX2clKidmGuYk0u?=
 =?us-ascii?Q?XF5kZExrTt6QEmMulU9mkYSx7D/7L1Ethg5PRvfAOEa064m6EoViOz+8KG6F?=
 =?us-ascii?Q?zjoH/V/dWqGUxzjQUyXZEP9l8JjgF+kRPwboi7eMyriplbhA2ZShIU4ZMqg/?=
 =?us-ascii?Q?5UYFsjvfs/B+lbIc6ck//0pfeGvSLCFc+rxzWOGHVkSNR4p6sLs02wEzN+b7?=
 =?us-ascii?Q?2BJGo9jWAcbt4n3sOgHdz4u70isnYjOdcgxrUlO/aK3anPFrIooJzzmODHfd?=
 =?us-ascii?Q?9lceix0aqcWg1Dot62RXRclYWCJIcvBIYbHpXm5heJgMWTzpJO7tHmWMXU8p?=
 =?us-ascii?Q?YYiJtxIir8ggOCa959AdhdgDJ7SLoRtRWgkkHuDr97GQhYvKsZhD4H14Bd87?=
 =?us-ascii?Q?rscxWG60ti/A7G/GEdM0C3NusUnDFN3Bc9658Y46gRnE9RPV8OothcyHtYF5?=
 =?us-ascii?Q?KjgoHvvU10Y1ZPPytexHK3WxZ7smU2okggM70vGpe/Oyh0uMa8vdSNkBSP7N?=
 =?us-ascii?Q?qFRcVDsoBU45aZEgf3ikTRKT5Gd3ogfqlyWK5m98mZq9hSoymyzsLllv8L4v?=
 =?us-ascii?Q?Q0zCCm47yajwmtCS/1nMYg0hLMU0Us82RGt/sMWCzUBvR6hsTSoy+aa3cf2Y?=
 =?us-ascii?Q?JrKdR+8hxN56zV1JwbTocU08D9n7nwy2bhqr8spmToKOENrff2n1EJoDj1eh?=
 =?us-ascii?Q?lrdVEpi9cF70Y2c5lycGMDEQbWzPPKIfRrwisFuLMmLHOU9T9xyn+FA/Nju8?=
 =?us-ascii?Q?FyxzWlQDJxzYuscFHsZkVEl3ioFUNgqNB8yBsH+taqwzobDzdi/u47UV4Npv?=
 =?us-ascii?Q?wmEEvAVxYmPpuXye8NhEdX/QMwpUdIchZjmiONRBnwcQHTd23JZSy/1G9Xl8?=
 =?us-ascii?Q?D6YAe3kj9FNhZliuQdDMOcs6Yq/vRtGxgcQaNEoMlY7iIvkQmz+8SafLyBN8?=
 =?us-ascii?Q?1sMqFVNsew=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a369c6c-2bf4-4112-42a3-08df29dfcef6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:42:13.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvV9fIzaejTCpvJX+wAJWGZ8WtUT4uhfUUDyUohZSlgBJWV/l0IiX8RcW5/OWF4mnEuMB0dt2o12s3PtEgkD/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040

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

