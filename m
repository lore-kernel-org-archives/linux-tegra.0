Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012070.outbound.protection.outlook.com [40.93.195.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BF3B14BF;
	Mon,  8 Jun 2026 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956444; cv=fail; b=AgN+6fO/AOiuzCw5LDNZiS1R/bL0XOVV8nf4/ghLPPHPnlkJElDK+Jx69DlgxGHSkGDkyAUyoLxUgGZxiY4W5jxQS4HXOzRDQBV2UYK/hb5UtcGNWXK011JaRC4T6XvmMxfZuDV3nLZ+J3H4zW4BjDtoFeBHXMEOAuXqlLPk9ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956444; c=relaxed/simple;
	bh=JrgDW3XHpUrBgfnn1i6v+gul/CgN6mGaNTdF9KEgrg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dztCaErX6XPTKTqRRDhwa7YkTb0P+I8YeiWQgKfZi3cfwsUtrwXvqpR34VacEhuihBG7H5bIr3mXxBSdzab6IMaJxzEgtPH0vHxjtCjMUMKdChJ+WyO4l3Lf03fwi+HDTDSBZu8MEGOAgA5tA1MM2eIVc4UfFFYpCEqXOL3b0lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AEnB6kmD; arc=fail smtp.client-ip=40.93.195.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AEnB6kmD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G42v7wtE+uEVe9RYIUVQ/yjK19yFkpnsTG5SsPyO8D3hHiyr2A26qD3RM/wwI+980Quq3C3y6llax5bABMw6asYQpTtd1wBhOkEbvlgJQUV8Mb2RMugOqIvAVErXTt3gDt2PpfIxE3exTMHnMgdb7acW4L0QkLMLsQxJzq1eicctDrrFS7SH5OnyhrUxnNJOlpT61lrtjihConw/3FaAn29zXeidN+moVQ4E7KuXPtn+Q5sOd1BOCZiTAivUUq7xagZIcHVFfygPJL4CqAkPLyxOLteQFCoc2+toFDc0GBkBPkQkH7CYH7ikZ1tJGMJsLzBSWdGdtL56X2TW0AJsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7DEz1eFWfxRuZlXm/4Y7V5TH2GLiMF7zubes5D8eIg=;
 b=FY9VdAOIVyEoBdKba6tqeNAtKMLeZFBgIP/lDpskuwEdGfodSpaNG2eq345v5y4CjbAMFCnHbAw/bfU/UltpWnGYZ4c0LVbwjDhQUmmGF0qQMey6Ey/o2gcguihbSzzP3237Ki6qXSSlQW6GJHnG5m0+5HRVViP5BpX+UkNn3qOVL/YH7/TnIqeA4ZG8HZQNtDUmdQL1FZAJINXD0Cpx3etyHQIjAfOjTLIU38qt7gWswVZuHsJUmyUbpnDE9Fdyap5Eb1ORBBCXfSpXv3JfQ7aivHbANcZyhYWR+qPQ29xXleCMbQKC0NP3jMXFWqY3c7p0AX32qUudnK8mzNK9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7DEz1eFWfxRuZlXm/4Y7V5TH2GLiMF7zubes5D8eIg=;
 b=AEnB6kmDvSm+amiJM3wE7mnmgsMz/1EVn4GyjyFHcyLLkRwd+dh8tOts/dBOT7681U3OR8NZk+i/ySV83Q4FntO34S+eootL8JtbzDDQXdo1h0vJyuYtePRcj8cOaRozCQzQQy7cGIvgLnzvSnSrJFHg3in2lS9g9O/leMOO0I1NTPgmZ79Rk7VtQuGAIZRWAjI00sakE29Abjnz8j9aYxDBZ8S8ifYQw1vE99TKf0L3tfPvEg9C3J4kJwkdwokw8Ab3E7TMtMPUe0G+Th3BnJUQNnF/wVOkuoUpTt+DWXR2yYdxotBu4XDbpW5j2AeRenWVvlzQSNnXuI7IsIPOUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Mon, 8 Jun 2026
 22:07:18 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:07:18 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v2 1/2] arm64: smccc: add cache clean/invalidate IDs and return codes
Date: Mon,  8 Jun 2026 22:07:08 +0000
Message-ID: <20260608220709.1300245-2-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608220709.1300245-1-smadhavan@nvidia.com>
References: <20260608220709.1300245-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da446d8-f5ac-45c8-ec50-08dec5aa4e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FWZ4BYQ+oEcfti7DzZMTKFD2j6R1VhMBBp6glhTIQ3fIHdTaOBcFXcCICjI552Uw+v+3PIPuETOpSj9VZTI/qz8bSgJWUv+XAN+c1NMznWmcX+LwnBdldBy+bmjBuH5IGg4wpAtZ2qTxyVTH2bzoQEY3SIX3o2nr4yTcIJR1PmYrBYl2Sjn7l/Qy/XSbvoSOV1bhVTecfI9LsSEAeQuJNQEJPjXHULX+nJCALEz+XKA2RaFN9qBzRO6KKVmFVRJWvLIAu/bTK15Jz46uJhjj/3LWseKOscxqFiUrXBuzgDNguKvEwo6wvnp6OUZWvlqK0msEZinLaNMO+W2BeHzd5V6XhiAUaiXfvN9mGDuFwjDN3yZJPYNOmSoh39xOO4qlotUJk2ZBY4CUIdwkl1W2RPuNJCoG6rJj8fbGC1UsRNKr1DmIaQ1MP+8sGwlw2ngpnezl0rBxzBTHNfi4OxZh3YQcRQp5L2bFQAiPcn2x9UAp2+J9en/tlNcmGhM+9l0Zr1a0PzZVcYl31G1DyyXNvPuBM4CLn+qtz4C5xfignTgmwV3snHwvCVjxnqxSYIPYY7jDTCtyC5BqxmWprEqonrQsNJkOQDqwu500nSYL82JsPavp52MzKSSNn5KtLQJhg5R3/qCRJyl20yNnxGQZq96Uqc+JxZDJMIt59feKRvAgw0HH2izF4juhiTdwWFMW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C83ljIFdjP6+La8n8nOcl/kLhqKzwA0tE0eVdxIqDuD/bfuuMc/S1DxWmxOp?=
 =?us-ascii?Q?k7HK8KrDYn6PFjYT/MxxcZUG0zMHYildaK49raWppqFjwoAHtLcy5EddOmpt?=
 =?us-ascii?Q?WHza38PH1m9bIsBqMnoMPgGxlWLHt0fX2m5pRXdV19rCqfNv3q2t7DWsMB19?=
 =?us-ascii?Q?yPaDLqLIDEoq3NJ6Qq0bFOfY8iRH7tAc6O6+jlMqtAz9fK3RrcF53hBaYbVo?=
 =?us-ascii?Q?D7jxvY4aeF0L3PY7cU9ozTNBIKZp+fJsxa/Sip88U4LtMJYY1UVD5PKPMz6i?=
 =?us-ascii?Q?dN4Rp4EryyX63KEg//xaAa80d1wvLZgTXiFhK6o7jFQqZtb+GJPHtGlJxGyY?=
 =?us-ascii?Q?olhKeVgcyBZVothLp1nnjn+sEt4+k8wUxBZMEopEYkR/bZ/mPGeWd5Kz/P/f?=
 =?us-ascii?Q?w1C+VMOsr1H44qt7cD56pW3s3eN7me/BQR547Plr6k9Idyrr6E8/rkgg6wRj?=
 =?us-ascii?Q?oo1ySoK7+WoEVK3fovy1s9IhlAkLaeI1rlcvPu0CHzeaW+amDW0w4/xcdfJN?=
 =?us-ascii?Q?ReJCsDhELDD/HXzc6rxMNzkOg6emove1y0aQMPYnSwd7x7CegHQqDj3QJvMA?=
 =?us-ascii?Q?arRyFEZSrimO2aJZzrKGgI/5g8NEio/43HwKVFDny1wrhnaOSgMJCSasS3kF?=
 =?us-ascii?Q?z03CjIsErvqQ2xQBnIp1ynU65yrpzbpEiRW5sNZGv5a5y1+IqdSFFVjolYMk?=
 =?us-ascii?Q?vY3eaffX63PwOGP0okAFk6sDqfvxhrYWxhWEOcErKWDq6Qjlm/qSTxDNirYg?=
 =?us-ascii?Q?Lt+TYXEVy5QxBFBI+cgoYPDrUVVtopsqTkWlsF6woBTASh4rvbQ2Yee9UI8G?=
 =?us-ascii?Q?uTm5xjRELpcvn3T/LtXJNCB2ewF0ARpbTwoJCSGavp95+Ub7iFHiLNrWTjLQ?=
 =?us-ascii?Q?7VX6hon8ZA0zhIzyUA1VXWeZvODtwU4y1HWCIIBXEYYeUxR7f/yO/0lNVHE6?=
 =?us-ascii?Q?qE1uhA3rWsI7AzosaxavcrU7aVfgWXNQVyrALuquGvuPFHYoNFZM3dOgCYUG?=
 =?us-ascii?Q?x9g9lJPlu040fwf/jugtXviwjWrMiGNixjEfQTN8x6dvwE/sK4h6QNvoV9Fh?=
 =?us-ascii?Q?JbezXZSj8iaQTmBiZ1taqLOPGShnRq9KA2qD+IoLcbVzBpKvj705rd8nghva?=
 =?us-ascii?Q?c8nn31WE2XZ9/2ZJ6B23pIKG9ib4rF8FrLxzBiDTe6gcnBVIqG2zP/hKce8U?=
 =?us-ascii?Q?i3CvDsbjYe+p9NJuYcrwnyMyNODgln7YB7+XR1OvZ7iNYXmVjZ3Zf4RaNO6z?=
 =?us-ascii?Q?EDKokR7V5gu/FH+gHG8dwfiNiFU2Va+bzZDLq1rH8547pw9Mb3m/xL3n5wPj?=
 =?us-ascii?Q?RZFFHvS3EFjpAETdS/J0Jb1cVbkYvGB/A+EN6GTbhqZ5YbpYVWubJvafgOcf?=
 =?us-ascii?Q?pS3ZnnUED780lYhS8std8ypvallbifde5WkEX6eK0cz8t70pNs7Q+9gzymMu?=
 =?us-ascii?Q?2qTnUtkGxHyPNvDl9ht83MMs+Ezb1I1YuCKVYqPHsWddWCqt4oe4nxvNdcwV?=
 =?us-ascii?Q?Gq8VX3JBtqSchHuTUivhd9wnigpuIdO8zeKhXKtfNWOh9xNFYhcCXI8dISnG?=
 =?us-ascii?Q?xvRgMFlfVZSXezt7tS20dI5g1z9hY5VkRCg/8fUuqjFvjvZ6FXZ/tQlN7ZGu?=
 =?us-ascii?Q?3cCBRL3jb/mBeYDgRtBn8nzTUtWevlcRJzmF2qm8xzy3caNK/oTSwRT3GVN1?=
 =?us-ascii?Q?XbDaWetQD6bcz23L+1FwL8SlxYecGxJE8x1O9NwTtW8IptVP47zP396bwFnj?=
 =?us-ascii?Q?1LAJcbrgTQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da446d8-f5ac-45c8-ec50-08dec5aa4e5c
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:07:18.4486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBEB3wWkJQbbhUJ5fs9OUvtAJX2Nq0Rio8oF+8eA5/JYPMnvXBW7dkmnKs7ojIqkZoDdWZk5NRi4RZ8F7exUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674

Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
need transient error handling.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
---
 include/linux/arm-smccc.h       | 21 +++++++++++++++++++--
 tools/include/linux/arm-smccc.h | 21 +++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 50b47eba7d01..8cba040e0816 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -105,6 +105,22 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 0x3fff)
 
+/*
+ * DEN0028 v1.7 defines these cache maintenance functions as SMC64
+ * because they carry 64-bit memory range arguments.
+ */
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x5)
+
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x6)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
@@ -294,13 +310,14 @@
 			   0x53)
 
 /*
- * Return codes defined in ARM DEN 0070A
- * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
+ * Return codes defined by Arm SMCCC (DEN0028 v1.7).
  */
 #define SMCCC_RET_SUCCESS			0
 #define SMCCC_RET_NOT_SUPPORTED			-1
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
+#define SMCCC_RET_RATE_LIMITED			-4
+#define SMCCC_RET_BUSY				-5
 
 #ifndef __ASSEMBLY__
 
diff --git a/tools/include/linux/arm-smccc.h b/tools/include/linux/arm-smccc.h
index 63ce9bebccd3..ae5637b3240f 100644
--- a/tools/include/linux/arm-smccc.h
+++ b/tools/include/linux/arm-smccc.h
@@ -96,6 +96,22 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 0x3fff)
 
+/*
+ * DEN0028 v1.7 defines these cache maintenance functions as SMC64
+ * because they carry 64-bit memory range arguments.
+ */
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x5)
+
+#define ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_64,				\
+			   ARM_SMCCC_OWNER_ARCH,			\
+			   0x6)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\
@@ -182,12 +198,13 @@
 			   0x53)
 
 /*
- * Return codes defined in ARM DEN 0070A
- * ARM DEN 0070A is now merged/consolidated into ARM DEN 0028 C
+ * Return codes defined by Arm SMCCC (DEN0028 v1.7).
  */
 #define SMCCC_RET_SUCCESS			0
 #define SMCCC_RET_NOT_SUPPORTED			-1
 #define SMCCC_RET_NOT_REQUIRED			-2
 #define SMCCC_RET_INVALID_PARAMETER		-3
+#define SMCCC_RET_RATE_LIMITED			-4
+#define SMCCC_RET_BUSY				-5
 
 #endif /*__LINUX_ARM_SMCCC_H*/
-- 
2.43.0
