Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65525387563;
	Tue,  2 Jun 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388521; cv=fail; b=SC+Upe+mbYosRBBvPFOhl+0MfittF3SA3AUDFZrx/Z2C6k9nDqThUXIC3I3UYoMcaog1QFhpWjeryCacWv0n/d1sNJvG1u/8qQJPgSIYY5q2g8lcqS/Jkz6JnVz4i03ljwPT2uIPDxmkl1EWbquFmyI7EcWmGh9ZeIvkJ9fbK7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388521; c=relaxed/simple;
	bh=J/yxoD7lYL2j9e1W44RwhoXT/fTCMeLjNUt7yI2sqtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ia5Iux+u/e4rXo25+hDZO64mBTEGAjrh1Vci/XU58PRchUhIW5a33N86tLmkgCez0v1FSt1NJYq6+UNeBh1nf9dr6dRVxNrHMTriiX8XMIugUF3EEx9vXBMmfx3yBtxgxEJpX4boa7+bJeXCWM8qDrr996Dj2l58nbISmEO5oV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I4NJ9em9; arc=fail smtp.client-ip=52.101.85.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I4NJ9em9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTdFAIAfRoUhTBBZ6cA/KwcqsJisPDrB9YHi68rrP2bVyoTvOJuucJ5O4MxiwKNmNOgwiy+YUTbCxKxSTXR0t4RGQjbwHdkGBJQJGpbSBCF2hluiLgxwQE49WyUusF2XuehTde6J3IbndVvAZncE9rvgnJnlT8YwHUqJ4vTd+AEPMF2FQkLz2rcrqP8W1Ind+dgf7tPLjg0sTu+badh8EWLwaBwpP/7zV62IuUwSIqleb1PZKIy2yySSuG+AmnXnM01CTyqYx9BBCtR+HIjmJrCWTejqcJs9b5WWrUilT2uRYLBhEheB8KtSKXL1u58y7fWml85sIyqfoT3FLAt+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQzcQiwpvPWgV9t9gqOjO8m9rNcaLJiZLNkSeUFTxCU=;
 b=LBB6v8Tt9o0SGuRTtZmIXxJJO4TyYBEVweHqElAe6WphrkYxO/+emIOO9/iEf/0g9GhJnApQuVTgbsPteJoiKybem/ibCL1UD7h3kX6FWtAGK4qluhlTDm0nMYTUn8cwfi4OxVf81laGeLo17PBrEcSj2lVVlsYxU9jQKe/PYPrauCYAGDuWzpKm/7D+XgSYjzOnL4ZH6szu4wsvtY8Hj1ULTpUDyaNdkL26VxUXCeZPGfjuQis+lgHiSizsfLqRDQT7J9VawoctLQ4L1q8O5SWGpcF4lxosqzB/iIueayAxr8EcsQmVjpiJYyt9l31yxPZb3DcyJXRDZfgn1W1YIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQzcQiwpvPWgV9t9gqOjO8m9rNcaLJiZLNkSeUFTxCU=;
 b=I4NJ9em9aLoT8PbhrDGMy2DJXC9bB99DFwtG1Zuu6FhmBXXuFMhfx8L8f7yC7ZHO6gq6MoSZqt2F1Qk8lMgrmSTSZzh8gArrN8Qcc+YO7+Zysdwk9IagtPBbTWEx0v+EU8WJRe+8rTXpywkqX2Q2VvOSaUZq+slIJ0N7DBFFe96YuzzK70zqb5JszKqRDx8qfcrToNTe1kgVWn0ujq9kDq1gzYbVPotoVI28N/4VGg/qktI4Ad1HJ4Z5cEaF0zMheTUeaMsxwiW5OLVK3bMLkmvFcJ1bSdMhkB4zta2udTmTtU0Kw0VD2El4UoiARt6T803HAV00NEmjzNNKKuYQUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 08:21:56 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%6]) with mapi id 15.21.0071.014; Tue, 2 Jun 2026
 08:21:56 +0000
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v1 1/2] arm64: smccc: add cache clean/invalidate IDs and return codes
Date: Tue,  2 Jun 2026 08:21:44 +0000
Message-ID: <20260602082145.404939-2-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602082145.404939-1-smadhavan@nvidia.com>
References: <20260602082145.404939-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: e997556f-27e0-425b-5576-08dec0800239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ewg0T1baSG17nAo9v92S+meckJk4Wzot2oGd5s56uw/Fi9hUgIftOmHTv+RuqsEhJYbX3/dtCjXFzwOu3rRAecND7w6ZB0SX/wNvULN70KNS/LUXrUjx3qfYuK+/EA9JK1Pwi9/2JfHuEo/0ipzH0z9GUKOD0o9z3CFRjBP0PsSs0YXSP8J/zXBKgltPGpDYAnhwAKoX9xepgvMLls+jJS3ojXBA92yODKDq8Ero4uh3a2BOK27Lq6pltvZ/grYr1VsyW84eaz7Xv/nH8phklORtrjngoJj9IdW3qMe1O0YZaWMc88SxGyS62aImgzfQ8s31LaKRDMgWGr9a9Y29sSW8n4wEgg4utSkCRwzJX5hHOF/H+MYI1l1OhY0OQc3/SCTlvv0d+0Pk+//ofrc37TmE66q0ODPQrWzGNbBD4oNVpa4CuFX1LKq0he9I6AHiOZJWm8cRa+FDD/EzcGhi2YPv5NCuI7oLhA0rdPqRup+fJc9RPECd0HUOFjYaVwIkmdZ2IkkPn96yr2t12MjVo8yHkbh8oaM+G52VZxG5kLiBPaPnXzjTZrRJbTdcI/i5J59RAOK0zYs471qgv1VSu28qXU23DxRizcZqoHtTxrhXd/iWl5w5metuKhpPoxBQdUKutng0HQZuIAWvD0e8oDkIaiTX7D2X+kRy6RlK9HX8KTNx6pujgIYkwPMu3tFQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ohpr6uRydvFvLdqZM/JFh6B5aJtbk7xhfVpHbQ/6ewcYxG8r/LcRIZgpVeTn?=
 =?us-ascii?Q?nJv2RfbiWkucEZOlUoEI0gqy917chGERi7rFLeSQ9On9QoK1ur/++0smYLRe?=
 =?us-ascii?Q?qxfBCBLzNywiGHYgMvm5S1ivRJ0c/ESkGjnn5Ib5Cr+qinVst0nGag0cQxfG?=
 =?us-ascii?Q?6ghlyIoXrPz3S+6BlcdvtaPRh4ZFEWn47ETVtaV65uAsgl12xAlW6On3/UXL?=
 =?us-ascii?Q?fub6RmNmfKEiKsdKWp4ETrwj/2JRxpvQRY9+3mNt+hLfIKVMLWjN/Xcu2Ele?=
 =?us-ascii?Q?WWCYlocrr7SEYyjcitqa+5IOuiW9eu0wnY/w/8RrUZHk+4vX7jPvAtTcG1mp?=
 =?us-ascii?Q?kD6nI4itWPgDeh3Q0Tl8uSOl3IdsoMPC1mB+rCxTm/Huus7fMkPUHINY+d5J?=
 =?us-ascii?Q?+1McbSlD+EgREsqLkyHuFbuoPWaLsa5yc7r75lJFvltp4HnpJoKuYuqIaVq2?=
 =?us-ascii?Q?kNwjqJhDLmhIfwvyxQxX/dsENVPnxtcKQ/4C19dQNGR3r3mSHrVRZ8MjXut6?=
 =?us-ascii?Q?Q0EDx9pMRKjEyPqHyUvRgBiKqvPSKxWS0mBb3AW+p76xq53cnvzfRuQQwG6M?=
 =?us-ascii?Q?66eXrvx/9GwalUhCetTHlf5w9sFeCDgb7tUOSvBLvY3Vpja/5UVCXEmgAtmz?=
 =?us-ascii?Q?LhpFkdzaEUxnL+oUypA9MOJyTIeiVu47zS7scFFWxAyNH/k0T8toAhU+R0es?=
 =?us-ascii?Q?mddeEKjmJclMcEEb7t6XRr51mo/KkFqhF7Oud5mN9PBsBcIKDUkcTf29ohuA?=
 =?us-ascii?Q?isxcsRfnH/e/KQPbOvFX/xF56akduetzvNXhYXPCfQeL0rDGH+yyA9Avj/Sg?=
 =?us-ascii?Q?8f5lo/daDTBlob2LQTYd8OrvXiBbLlVlcGhnQB3lW0eTqeILXiMu0C4gHmO4?=
 =?us-ascii?Q?E3j2Ty2MlryigrHvdxQ30Xvrbgb5zxhHBHUNB58IjMenEwRa7N4HFmytLFf5?=
 =?us-ascii?Q?49DuAAMdvHd3CwkAF8IteUum2BeJ/s7NDT83UjWdj+5jdo9yXMMNJztsnTpm?=
 =?us-ascii?Q?8RcvC4jRfV8UhXMOsS5GIBrPd0ZZ1vtz3XfiKBzyg37Tn1QEEtVwiGb/48KZ?=
 =?us-ascii?Q?WLq8KeQfgBzf+9J55lCtORYFTy5DHwCmDQBRgpAKk1NAX+LSUex00tqe/b3H?=
 =?us-ascii?Q?QXUmHdtJi7sLiwidlCmOlMYdd1p2y5IP9Bipu48llU3mVHAxUo5VYL/W4WtR?=
 =?us-ascii?Q?xYTLP5jjMSXe9jagoRukgGPiZ2ujlkKW58OdV6Xls63W5iUxSXi6CjNAE9ZW?=
 =?us-ascii?Q?IPbBX7fylEtYf8EHmwffh+Jzm39h7Q85JqF2IR+riSqJcisLSGJtAGmqPtwn?=
 =?us-ascii?Q?luTGBdbP8FDlTU4nNU6Glo5nfRB+U92ueQ51DUmGivqnD6MwFusbdenfzDwk?=
 =?us-ascii?Q?v9HeDITMCerFgqHwIxuwMnseCpaEHYOSssqN9EHzLn5+PS7bLGOUxWDdE2Dm?=
 =?us-ascii?Q?nIvojYqf7lzwqtRNgRXOEbgLOXF1M4N3cwAZlouInbYLCUOnO/D/WDhIm1C4?=
 =?us-ascii?Q?lgnc1meAeXNdsq6Hwe4zPpbScngI7HDTPezPXygY0GHn0KE7u6w2jyuKSD2U?=
 =?us-ascii?Q?KvaLRtq9xJYEGa/hEDfash8cwj+VjpVIPEQ7dWFERTCuWcn/pkaPDucL19ZF?=
 =?us-ascii?Q?D7DODtWK+XgxcbeyRxauBam9r299tv7MIKgS5kW4gL4ZsqXIGy2Yq5EVIn+2?=
 =?us-ascii?Q?7qgZo8EDMHdV/Rwxzc8kh9bkP9za+2X4wWxAAnZMtId01CrIlyrNdk7WHZn/?=
 =?us-ascii?Q?bBQ1JiT6aw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e997556f-27e0-425b-5576-08dec0800239
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:21:55.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYFcjO2lDsR4jydk5dlpv4qylgOPrqBYJJ4Hg0ILQBG9Xl81vatcBoI+ZbG0BEg3VEvD2uY/8iuDM0UvmoU4Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170

Define SMCCC Arch function IDs for CLEAN_INV_MEMREGION and its ATTRIBUTES
call, and add RATE_LIMITED/BUSY return codes from DEN0028 for callers that
need transient error handling.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
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
