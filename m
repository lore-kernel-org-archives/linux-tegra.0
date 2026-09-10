Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35E3D88F5;
	Thu, 10 Sep 2026 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028525; cv=fail; b=oKG1pB5hlfXZPTKJYqsAFD2VtG2Lid7ZhKQq5nor6vXWHIW1oDMc9p5OjhZqWv5bBDh/AA4q6apHBOIYDHlUPRrmu4h7b33RGQsTO3vSK+hW+4WFhpo+eyXwAoMhPsvUYL0hZKvxhbXo1fWfA6oiYoqZqRwYsSh0RamSZFBFGc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028525; c=relaxed/simple;
	bh=H+1iT3/VXFiJcA+zr1QiwfqBfcct/KkRwlIlDA4jGyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XRUaXrknPU2pkOVFcjhB9zKBkmmqRCalNN49STiQozyVI4Cu8ls1qDZG1Gv7l7WVc9P634ZLiGWP0V/76E054fSkkl1I4JF0nGWMGllB78Jxobo/VJbqUsiOnEltTmOfpYa9DoiNSnE5PtKIJUAUQNkmQgd0IzDvA8ZXVdEoTYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aSBEHaUA; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aSBEHaUA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEsZl5oIhFMT9qmaQrHLbesjJMkuyVqmlCQnpViK2cOzIErzJuNdqXkICH9PlYSa9MlWJE8eyq6vzHpOytXisJDZtiBFEbw4iXt3kQKUVvjzviEvoYNwpHk8isNeHdbLxMUQkl6Io0jOPJnY6hrfLZVI2m5eNcRIya9TeNzzxJynMOm5o4tsBfqvgFotED9hJRRvVrZ5p3qKnmoHbvQY53Y0+dlJJfc6LKo/X+PGck5lq4t5FJKOo34TXLbvT/8i+fHidFJr2F3dpEiWy9QGySuVe72yeZXOCqHQLdxE0QdI1th71OoinE/VqzFuFrtUPayZJYEHbXnDaC/ODyvXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zI+G+faFHqq0OB+3ds8MDyvsQfuHAEI3NVUnkJyFP3E=;
 b=YUVl3n8sHbRSaIVW6DmSbROEp6UkB3dVAM+GLG1V8rUtxYh4yMSuXpuHG7a8EpL3+Yjryk16HAbAJ56zx7qhPzBSVqs/zuD8R7C7HvOJkDWDn2jeR4KUNWMWP+2zfPE3pKTvKbK0ZobcjNS1CYIzXS/8AA+bs754nNJKMY+omI3OaG2T8YOadwmQTJnfEmOjPlvUbtwYSQJtK8jeP06bi2iUjQiTq+pMnHOHhZlDTncpy43Q+BnL5exKdxSVAayUbX6VvYEQvVI+PB9+K9jF7xea8hVHY2fQfU1qyBdtPjDtrso4jAT3kM3WucIxGgIjecm/B6rS0qCoG2qooTF9Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zI+G+faFHqq0OB+3ds8MDyvsQfuHAEI3NVUnkJyFP3E=;
 b=aSBEHaUALqZANyVRVALdwENrHm0zmd3z4IqPY7T8l50HY77DUtJPjPDFuoubkYWtcCsdPnOcXkLgM3CS7unidSjSZVlE9f0JLwSNxKn2G4IqpYKKCNMcBIp+ukdUQdo+elvdtOUWQxOBE5pPOooczA0J/XURQdhgNkqDE8sDvfI3Ajj9vh07l2Cd8sXTKkl5/6lyTF/rSKqPBTXg3heiVMRewUYyV0OE0xfq48GrW4O+eIR990DjOYuLBDwNXMHnLmASeqsA7vLXSmnSWBhqKAY11xrcA1BdOCG4yiZIW5qMw+jEBwKQ70vTtXE482gAH9Y4q6N6RTLLThzSoG2PXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9474.namprd12.prod.outlook.com (2603:10b6:8:252::17)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:21:49 +0000
Received: from DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7]) by DS7PR12MB9474.namprd12.prod.outlook.com
 ([fe80::31ad:931:ef07:8ad7%4]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:21:49 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v3 1/2] arm64: smccc: add cache clean/invalidate IDs and return codes
Date: Thu, 10 Sep 2026 08:21:41 +0000
Message-ID: <20260910082142.1522865-2-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910082142.1522865-1-smadhavan@nvidia.com>
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::8) To DS7PR12MB9474.namprd12.prod.outlook.com
 (2603:10b6:8:252::17)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9474:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 676f4c73-9e91-491d-1aa2-08df0f148fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/yxIvHJ15Ai4XBkJbc+LXLtAAhaympAeFw85VOSvc288GrQQxqQROM/I8xm+ZsAh/XkyGAgwjKbynWiQPabybirchV0MJMarZFA6ErdS2vUym9auAkB+IAZBxrCQ4PZMcHb4nrXQlUCvk1ZdE3zo4OXuScuQzF0dN9kjJcEl/dfqPpPBY4/TcaS7NwHeV5JMNS+M12AmGxrEjizco91AaoKh+lAQi6SR6IvyF+znHVfBq2qDDTlUzIqdl9B8WBOzg/PFLNy6/JLh+TShJyMvrLvJVmmdgjuns07Ep2JtYCVRegECCIFPSboLJP2nwlvZymVlNjBoeFOTUOjL945oC9F4j46yLIlfDQxGZPsEom20L9hZGZt4DuQ+8fuaMFeTD9I8Yg8y7XiZ6aXCIot0yL78b7XjWS2Y5+9sLBxdPQ/JATqij2ujmw2SzKRRzHAroldqCxDYc75vV7i8taR7HoQUmn9Eics3xup+elqhNcEwofRsoT//e5/ivRFCx75NNn7EDQrQJPx1A0Yq0ZXVgA5jprdQuWZqiQirclSPnJnxmTt/4lsaBpRKphCd85tihmnFEcHM90IO90qLCyf5kt5VxiVlCDzOQaE+61eHjS62KRVC01GD7OgY5XSG5/4MjyzPy5IdVsTzuJ6JT+jU4aucF796hN+38z8Nor6R0Ws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9474.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gCoiK0XPwfZLypPh89sQ5EG38CQwvXlCvWAdS2rtUC6lm2QXwWI4hYqmKInP?=
 =?us-ascii?Q?hsuFr7gD5e0QKQcUxSJJIJPGsyVvdhOV+6Jh2AO9bdIoMHD7y6MRM1qmn8jQ?=
 =?us-ascii?Q?1wPztUtIgLYO/9E178d2CJVrP9QQcMG0sMK9jsCU/8OYty/UmdPGSXRbvnU+?=
 =?us-ascii?Q?y4drqbWSJGwzI+2OL34QqMffrxreqFALbrEy4bSMyVbExdPpR0piP0YdQpyD?=
 =?us-ascii?Q?gb7cDjiaBIi0PcQl6gz5gm5FiHgOQrABkkq8Xrsm7Far/X/HOvqC5UlauKbY?=
 =?us-ascii?Q?HjYGZ/XO87ykspjH+bZ5Lu3xwTnf6TgMX0iWFh3ttRHOWgak23CsacK7NzAk?=
 =?us-ascii?Q?7G6/byqMlLEwas+V2evNUWhq1LDcZxy5jRAVQbUxjtKgfFA+1A6yqOM4dM1/?=
 =?us-ascii?Q?pCxl84J1f7R0ojMOcXggtphz0Ahw/os/q5CMrfhrEdaZ50eUUENzt3uvUzbY?=
 =?us-ascii?Q?zjz2QmH4hbXLpyPi1D+WPNWnMYdd0zVk9qqH5xGdQwe9KDnqyZL621vJ8qG+?=
 =?us-ascii?Q?pS9Jhdlja8j5BxJuXaiJ20rVrAWg56WE5FtUjRxQQaUc5qsgP3WeBR2f6P5l?=
 =?us-ascii?Q?MmT+M+Smtxw0rnak3CC1XNV5jnA6gsCMFXBYqXB6ZuCdZVvFuOXFqR5jCf0m?=
 =?us-ascii?Q?p7eUZcQdpCVF51f6RYcNza43LNXMCE4pILEoz/EeM2zIBe4I1DgwMTWLvvGP?=
 =?us-ascii?Q?vEFmeN3rOTKpVqzCdlYimVeFpUZo7YfGmlHWuVffvGblX7izNqMNdwlrthr9?=
 =?us-ascii?Q?V/CXQv0/lliaeh0G9muYiXhYWZNFf18Y8EVr7QlubJpWEPX1LLsP/wEI1kSi?=
 =?us-ascii?Q?rqtIiadefnm4zmsBj/hsuAT18FFTTn8tG37Uet3NMDYAc5Plw2NxaGbxdufT?=
 =?us-ascii?Q?O3HE4rQnh90Ih2PNW9bqxUzijDaw88giu9F6OaG3ieumRhbve2esedGemOKC?=
 =?us-ascii?Q?FIY6s7+8JjPJ7gyenTFD3M4C90GjkRBp49o0cEkrDub5FxpzeHxDs2vHLwiw?=
 =?us-ascii?Q?rVtZUnkz+z64gZjnCKYDGofWbf9AxHZQAWWzIulkY/wCx/jPV6GhCvCK9Z+F?=
 =?us-ascii?Q?FrUTicz1v8qVvYCOtS4JK3EZ5RvAZhLhqHYrza4aMbGBVP+K27MsbOVKao2V?=
 =?us-ascii?Q?Bw6tkpjMz1S5JehJFWe6KY59iByCpixgTlLF7BXhG58EjeZbdW+q4Jwi7m5v?=
 =?us-ascii?Q?PHHkeTzGDzJ8yDlLgGitbZ1On0/VS7gkFQsIiG+OEVNvySAQ6refOSzF3qYQ?=
 =?us-ascii?Q?erxTvFsMScOak3pydCb3Tstz+7Ipf164ceUk8QzrhGWXo2W4pKbpLd9PpVn3?=
 =?us-ascii?Q?7HEMUXXMkUyowRzx1t6RTiX8JYDBA7/PzR1reBvwx32OYWeENp3LHToH73C+?=
 =?us-ascii?Q?N1fSr140eCSj9xchFawpI/DNoKEc5khtdoVIsR7CEu+5zaE1HCi9dzyaZFdp?=
 =?us-ascii?Q?Wz0tOHY0bKtshG6xWQtGpkBDuj4c3sigwycrh7BrkPOORMDPQQbe+etnKHAM?=
 =?us-ascii?Q?hpCG5lXmoBeZxuURfCPHS+Hhz/w9hGQy08+redQx2p8Kccf0nPsNmpPnNIxx?=
 =?us-ascii?Q?81bM/NnbQ+WwQLY/41ea9vDw6HctnmWFW6QNpfll++pU+1ExDYN0H2aWaOy2?=
 =?us-ascii?Q?SZlKP3lVmxN46/On4qVW5j2G69ratxhvGD+xZVT2HwV4sA8+oOhFepSFpu/B?=
 =?us-ascii?Q?mw4KdoDt9Vpz7we5DZWZfSKQTjqSE8X+nHvfdM+KIYgvyolpzzKSDElaIhgU?=
 =?us-ascii?Q?YHDVZIPHMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 676f4c73-9e91-491d-1aa2-08df0f148fc1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9474.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:21:49.6437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRC7Z+eCBwV78fWRScCFKaaV+v1rjdb/VyVDCsH8yqxhRmRMHvLyamMP4wx4UZhQtWhhwy6W51C7RnorXjTnvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484

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
index 4de81848fe2e..2e205320d88a 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -116,6 +116,22 @@
 			   ARM_SMCCC_SMC_32,				\
 			   ARM_SMCCC_OWNER_CPU, 0x10)
 
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
@@ -305,13 +321,14 @@
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

