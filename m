Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95423CE4B5;
	Tue, 13 Oct 2026 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791874941; cv=fail; b=LQDA3q686fOHlTx/ojVY7MUImgLfA/uj1t8camAuSFHkc81WJgmEo/yJSzLc0WAQa0ubX4eJs9fyMolIM6AqWGCJz5LtbLmE5jX288Tuik514kqWC3ccIxFvzqsqGDE9VOO0ScQH86/IlbzETw8cLlf1XTUHXhW6omt6027rQX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791874941; c=relaxed/simple;
	bh=u43uUkRBpVJaV8rPw9ylnvn53CGDpdnNVVrhGLeloII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B1VkeO5n/ac3ZzIAJ8Ql0pYWGb+TK98VJ+v5wt1iVUe7MfgOBQkCKdFG+qs+chPoctpKN42CHieNJ8ee5htEA8wOC5/PfbMMiq9zrGlShUD46hJB1wTljOnxA4D+sS2zdlGS5w7NVvTM0NfpkHxCy5tPDv+72BYuBt0a+kXS6OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qjjQuRQ4; arc=fail smtp.client-ip=52.101.57.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qjjQuRQ4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmMRZ6JGmjSrQZSBgMiVTNsLkpXCD3tU3oUemZcBHZEkM//rDmuCukjeXKwWncviPcgnGUJJyFfDdwQvXqyD0O9MOUT/HDIJdgHG1JJKgOTPGa/LM9Mj55p+8Cls9GBIwUcfew+k5HzvGlrFpixRibm2fJuqXxoHxlcyrlgaObqsNAhEBOlI8vdki6ETuygef9Zvd4eEGoCOWCsHAkSFw/UFow6F1MDtvfflVT+ENXucAbmVkbInkf06Sb/paq7RQ5p0bciHJXbIBU3pgWcynfMBYsB9BgLbCTnNhUVMIhWqJnrcHn1OFY78MYHnFpop32WjwmWONE3vz0+oHkFPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4x/LCd1m2tNlWAeFPT4iODDD2i/CW+dr6tFm/LxOUpw=;
 b=aKXkqY1G2aXD0gKCgn5jd0rn0qOzeCsv9XecaUYnXJoeAA/ZOr+6cZkJJayTf7tEOZuafImVFEvaLJKBJNADqoHcDs+LRLnIxQVYR6mbdR4JGiV5NlFyg8RYFCXvLriVGm5gY9gPnCbhi57nx05FXHWrmAV4WnD9ER1HWCh8ar6XO5WmrozqV0qUQpOHkQ+J8PBUZQhMrURJ2xJqSRGmdhnFY6oh5W2KY4EeZmVWbDJcrLmG5o3393POjXCs72an3j0uSbq+cOxZvgAU3IkWNYj6MYAU3+vuxSQteI+5vQX9n+C58yKRmyrcPCY3PWVQWTPkrvj4ywuGFzZRqm2ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4x/LCd1m2tNlWAeFPT4iODDD2i/CW+dr6tFm/LxOUpw=;
 b=qjjQuRQ44/j4JTGZZoVWFOJQ0muP8NK2o5WzuSHfRW2VCYRpd3NZeu0fchjma78boSoEyAF4+ubPKdGbIr6bROkKqkZapfWM+R6PKyWlLM1/pIB3ZsNe7s8SX49Z5tbQW3fRDdIs0u8B3aCd0hngTAJcdub4mzYLVlWrYyRMdXPDF3rrwayHd/AYmWBqM3h5ZCuRd5zoT/yvXkrbMVoQyAujsUsqQMe3N392/qcjK0uQm4uTCGY3iMyyoJmPcaKdmbNFeXJWS0R9FkOUZhfHC+z8h9lt+ZWpT8CuVPDza4Q+CpuTgGu887fTBvBRrOjoMi44b3+Qh0xbFAI660mt2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5) by CY8PR12MB7416.namprd12.prod.outlook.com
 (2603:10b6:930:5c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 07:02:16 +0000
Received: from LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522]) by LY0PR12MB727857.namprd12.prod.outlook.com
 ([fe80::843e:82cd:41ca:f522%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:02:16 +0000
From: Srirangan Madhavan <smadhavan@nvidia.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	conor@kernel.org,
	jic23@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	andre.przywara@arm.com,
	aneesh.kumar@kernel.org,
	Souvik.Chakravarty@arm.com,
	treding@nvidia.com,
	jonathanh@nvidia.com,
	bence.csokas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Srirangan Madhavan <smadhavan@nvidia.com>
Subject: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
Date: Tue, 13 Oct 2026 07:02:05 +0000
Message-ID: <20261013070205.3566865-3-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013070205.3566865-1-smadhavan@nvidia.com>
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To LY0PR12MB727857.namprd12.prod.outlook.com
 (2603:10b6:408:3ba::5)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB727857:EE_|CY8PR12MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 6130395a-0550-4fd8-e169-08df28f7ea14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|261009223027099003|5023799004|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AoE+7O+c8/W9t0ALfDHDdIXO4/tsRZma97zxMCmlF1wYVaqHGp/lwOTb1+7oA5DIKYQMvLb1I4UJ38S7ACyk1K+CKhuo3gBROUwBQH0bzwof1FtmQd7WU/3xYZRi9ss4u5IaGP7PFCuv7y2+dI1CU6BXOaTlZd9j1AgFAARqVVqPKmHEzsnn+A53Zn6vey2HAq8QQ7QXeHrMS5fHYZlG/Fvqa80yA3o47k5QrEx9AQgw5Zegzu6u3RRqDzpjzgh3tHbaJJxSID2CDv9YKQn1yAN0uks2cJKvylqDet2JJXZlIP8lAL/CIniaj8ASNE+n7hYBYZhnK4Jr8tUVORazmAuWcHQcXmUHxPqIBeQ/r1xaKkQyCmgi4nYWxE8FiLydCX+Fb1s4r/5oL2t0BzM/LnTHmtf1ttwCc4kFr0XevWVvoyDku+nuIpj1STyTcHMPQDoXUlBIyjbNn6qidEV8U4M0C0JFBdPpFSofnjS29rvwh8YC1wvyxt2fGvQUCgi6dGXXWzapgOmxgFuLefGPbOf7MSxHcTjL6OyCZrnJU16uzHx2nV1monU9daZZ7YgXS0aDtpe6xtRzZ9y9Mbrj7N3wJA+wYNBA7vUHvD0AeT8uMulbc9+FoL+1wEDvUV2gEDNHpk8cb4ZdxBldqwqZJgLQ/cB0W2QP8TFM9xpsEG4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB727857.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(261009223027099003)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wCM4JreRcfVyNEwaS7D2oMXBwOH5zwyUaFXcwrEgWNEc2ZSEOdg1jK1refkw?=
 =?us-ascii?Q?CbI7edmm2jem9jEa/XNJ/fecoRwKmBEGNwQxiQ89/6BfNqUa/kLSNnYdKeei?=
 =?us-ascii?Q?KNnIqjwe0SMWMzKweFBKsOMpvWKo3yTeWo3K1XfK6ceMrfQtjru4LVUsuoDY?=
 =?us-ascii?Q?xCy3SOBV+uhMQqBm2tKBgIElmlv57cucQXf1bcs9QFMliMMIhQO0d42BdWfj?=
 =?us-ascii?Q?ef0g/SKx/gsJgL4di8RTS2ZwTMvfAHrMP8WXSRXmcbHRu7CbEhKxz+xevFEa?=
 =?us-ascii?Q?qYWzoBKmn9RX+W2h9BRgVzc4qcs4zMh3l2YJzIbEJbSW7TISEzX2kpY0iEOu?=
 =?us-ascii?Q?s0GWtL2LLJpCCbHY4ydnkdikFPVRPwtf1PT2U0rkmEwaYjBA1kNWZA3WqrZ8?=
 =?us-ascii?Q?SwawfcVvUtxgymsS78hzaSgZ/65hcJhLD/8K6B+k9RNDrLrh8wo8yQ3XzN9w?=
 =?us-ascii?Q?NjM0O2IZcX/ED3zX0f77XLHSlddt6rtavAsDOeYO96R/KEkw3rr8R5r0cmFv?=
 =?us-ascii?Q?VVrG8m9blBdRjhVMH6DDeOPVF379HCEZH90tChmSH0I1zC/K03d1gyHXOOjw?=
 =?us-ascii?Q?3YM5Rt1tKqyEvwMTHc9a5BnryaitmIIx/1Eyz6RD56qBQO/2XH89Dy1PO6uY?=
 =?us-ascii?Q?Ym7N0OK9oF/WVMz1DbRMaJEL9G171Zn9Fzay+1UYPy4X32CZ8tCC6XkXOp4a?=
 =?us-ascii?Q?55V9W9Q7IqwupVZABxSB1lwkALVFQM13ZeugSY1t3UxLKV9bHLH4kynkcApa?=
 =?us-ascii?Q?b81Aie6XvCYGpUOAqmPyd60pIGQKtsflbcY0Tnc0iI0EJhEPi7NNtKykq4qk?=
 =?us-ascii?Q?nFIIJvSJZydk/LaAqLaoTZVmjSU5Nr1KDcfaOZJ7v7+JgGFq+mBwdwTgyFBt?=
 =?us-ascii?Q?6A+/tC6+UKwrDNfUmjr1ZmQhqTQPJso1RNvjj6eMUbrpfzqRcv8V0qc0SenG?=
 =?us-ascii?Q?mszds9pMk8JBOi3LptP1LhXZtKpOymIlji91eIKCi5QOztM+1LKD7kVyX2lp?=
 =?us-ascii?Q?zpHa55JoIJCXDd0HVPo77r1NbA0tAoyH8XcofHOmkpUm9KqUvUk8g0xFesN2?=
 =?us-ascii?Q?EyH3ytsLwL3MSdlAP48xmS5GTG1XnsqXg+08EU9ulV7TU1TCTmfaTIcia6KZ?=
 =?us-ascii?Q?DVBtv1nXvuCmBwhmIluDc9F9IH/o3d/xZFSvZnTrC9hOghImAzhXl+MUMjCE?=
 =?us-ascii?Q?ocohBs6ZXC+wK8bqyk1xXDLOyC6JUE2UIXEIcxaTwBKf494hQHBvt8Z7MhqU?=
 =?us-ascii?Q?FEtlgxyIbBADHiEANKNKe9hUqjJl5h8oCbJBVSZd62cKHVJHEcU46m5J2k8V?=
 =?us-ascii?Q?MnBVi5LyoO8UaBlw4cityIVM8aLOIBlaCmQHjyA2xFevjmJTxkUSI7GDvUyO?=
 =?us-ascii?Q?G7PngX1wH5HeuSRfFH6Kg7MU9CwefirQnh/wcBH31nvpTZVlciH6J6QRe5/K?=
 =?us-ascii?Q?IU0pWuR2uH1LZHiX94dZhfqIkds+PbAALDnLGus5y1F8hH2Qqr2h/MDPYduc?=
 =?us-ascii?Q?CkAS7AVdg/H4uIKEMbYPp2kocJ7DhUEDVqyuXrB+q0yNz2IRog87RX/aKEba?=
 =?us-ascii?Q?l1JGKZ2bx4+uIl+0AL9e/TXavfNkr5QI5fWFPC8QFjfJ1p59Bks4I04kOMUo?=
 =?us-ascii?Q?//QG5AWw/Zy5C1t2QxfRL4qnjzI1E+cjlH/BTFxCBh1aof7L0uI7tV9AyYmh?=
 =?us-ascii?Q?ujnQKJe6TZY3yDWAvo+PgNsWGdL2xMAaI28pJW+jJ23wyaaGqpSMOhebTPP4?=
 =?us-ascii?Q?G3tRBOykFQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6130395a-0550-4fd8-e169-08df28f7ea14
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB727857.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:02:15.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ag6TExc3LwBC5FQ1lDSZVitVwmK7NdR1n8Urkuzm4qAi6j4r+t7SpWAnp6dbzcMWfL5w0CfrCSe7XHnb0Cd4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7416

Add a cache maintenance provider for the cache clean+invalidate interface
defined by Arm DEN0028 v1.7.

Register the interface attributes function as an SMCCC device and bind the
provider through the SMCCC bus. The provider reads the firmware attributes
during probe and serializes cache maintenance calls. It handles transient
BUSY and RATE_LIMITED responses with bounded retries. It also registers
with the generic cache coherency framework used by memregion callers.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
---
 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 161 ++++++++++++++++++++++++++++++++
 drivers/firmware/smccc/smccc.c  |   5 +
 4 files changed, 179 insertions(+)
 create mode 100644 drivers/cache/arm_smccc_cache.c

diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index 1518449d47b5..57fd1823dec5 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -42,6 +42,17 @@ menuconfig CACHEMAINT_FOR_HOTPLUG
 
 if CACHEMAINT_FOR_HOTPLUG
 
+config ARM_SMCCC_CACHE
+	bool "Arm SMCCC cache maintenance provider"
+	depends on ARM64 && HAVE_ARM_SMCCC_DISCOVERY
+	help
+	  Enable support for the Arm SMCCC cache clean+invalidate
+	  interface as a provider for memory hotplug-like cache
+	  maintenance operations.
+	  The provider registers only when firmware advertises the
+	  SMCCC calls and attributes, so systems without firmware support
+	  continue without this registered provider.
+
 config HISI_SOC_HHA
 	tristate "HiSilicon Hydra Home Agent (HHA) device driver"
 	depends on (ARM64 && ACPI) || COMPILE_TEST
diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
index b3362b15d6c1..55736a032d6f 100644
--- a/drivers/cache/Makefile
+++ b/drivers/cache/Makefile
@@ -4,4 +4,6 @@ obj-$(CONFIG_AX45MP_L2_CACHE)		+= ax45mp_cache.o
 obj-$(CONFIG_SIFIVE_CCACHE)		+= sifive_ccache.o
 obj-$(CONFIG_STARFIVE_STARLINK_CACHE)	+= starfive_starlink_cache.o
 
+# Providers below depend on CACHEMAINT_FOR_HOTPLUG.
+obj-$(CONFIG_ARM_SMCCC_CACHE)		+= arm_smccc_cache.o
 obj-$(CONFIG_HISI_SOC_HHA)		+= hisi_soc_hha.o
diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
new file mode 100644
index 000000000000..aca71113eb1c
--- /dev/null
+++ b/drivers/cache/arm_smccc_cache.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 NVIDIA Corporation
+ *
+ * Arm SMCCC cache maintenance provider using the cache clean+invalidate
+ * interface defined by Arm DEN0028 v1.7.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/arm-smccc-bus.h>
+#include <linux/cache_coherency.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/math.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nmi.h>
+#include <linux/time64.h>
+#include <linux/types.h>
+#include <linux/wordpart.h>
+
+#define SMCCC_CACHE_MAX_RETRIES		5
+#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
+#define SMCCC_CACHE_MAX_DELAY_US	20000UL
+
+struct smccc_cache {
+	/* Must be first member */
+	struct cache_coherency_ops_inst cci;
+	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
+	u64 rate_limit;
+	u32 latency_us;
+};
+
+static int smccc_cache_status_to_errno(s32 status)
+{
+	switch (status) {
+	case SMCCC_RET_SUCCESS:
+		return 0;
+	case SMCCC_RET_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case SMCCC_RET_INVALID_PARAMETER:
+		return -EINVAL;
+	case SMCCC_RET_RATE_LIMITED:
+		return -EAGAIN;
+	case SMCCC_RET_BUSY:
+		return -EBUSY;
+	default:
+		return -EIO;
+	}
+}
+
+static unsigned long smccc_cache_delay_us(const struct smccc_cache *cache)
+{
+	unsigned long delay_us = 0;
+
+	if (cache->rate_limit)
+		delay_us = DIV_ROUND_UP_ULL(USEC_PER_SEC, cache->rate_limit);
+
+	if (cache->latency_us)
+		delay_us = max(delay_us, (unsigned long)cache->latency_us);
+
+	/*
+	 * Firmware may advertise neither a rate limit nor a latency hint; use
+	 * a small bounded backoff instead of retrying in a tight loop.
+	 */
+	if (!delay_us)
+		delay_us = SMCCC_CACHE_DEFAULT_DELAY_US;
+
+	return min(delay_us, SMCCC_CACHE_MAX_DELAY_US);
+}
+
+static int smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
+			     struct cc_inval_params *invp)
+{
+	struct smccc_cache *cache = container_of(cci, struct smccc_cache, cci);
+	unsigned long delay_us = smccc_cache_delay_us(cache);
+	struct arm_smccc_res res = {};
+	int ret;
+
+	if (!invp->size)
+		return -EINVAL;
+
+	/*
+	 * Serialize the full retry sequence. With the default bounds, a caller
+	 * may hold the mutex across up to five 20ms backoff sleeps.
+	 */
+	guard(mutex)(&cache->lock);
+
+	for (unsigned int i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
+		/* Long firmware operations can trigger watchdog checks. */
+		touch_nmi_watchdog();
+
+		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
+				     invp->addr, invp->size, 0UL, &res);
+
+		ret = smccc_cache_status_to_errno((s32)res.a0);
+		if (!ret)
+			return 0;
+
+		if (ret != -EBUSY && ret != -EAGAIN)
+			return ret;
+
+		fsleep(delay_us);
+	}
+
+	return ret;
+}
+
+static const struct cache_coherency_ops smccc_cache_ops = {
+	.wbinv = smccc_cache_wbinv,
+};
+
+static int smccc_cache_probe(struct arm_smccc_device *sdev)
+{
+	struct arm_smccc_res res = {};
+	struct smccc_cache *cache;
+	int ret;
+
+	arm_smccc_1_1_invoke(sdev->func_id, &res);
+	if ((s32)res.a0)
+		return -ENODEV;
+
+	cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
+						   struct smccc_cache, cci);
+	if (!cache)
+		return -ENOMEM;
+
+	mutex_init(&cache->lock);
+	cache->latency_us = lower_32_bits(res.a2);
+	cache->rate_limit = res.a3;
+
+	ret = cache_coherency_ops_instance_register(&cache->cci);
+	if (ret) {
+		mutex_destroy(&cache->lock);
+		cache_coherency_ops_instance_put(&cache->cci);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct arm_smccc_device_id smccc_cache_id_table[] = {
+	{ .func_id = ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES },
+	{}
+};
+MODULE_DEVICE_TABLE(arm_smccc, smccc_cache_id_table);
+
+static struct arm_smccc_driver smccc_cache_driver = {
+	.name = KBUILD_MODNAME,
+	.probe = smccc_cache_probe,
+	.id_table = smccc_cache_id_table,
+};
+module_arm_smccc_driver(smccc_cache_driver);
+
+MODULE_IMPORT_NS("CACHE_COHERENCY");
+MODULE_AUTHOR("Srirangan Madhavan");
+MODULE_DESCRIPTION("Arm SMCCC cache maintenance provider");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5dc768ac4143..5a5d50d17410 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -100,6 +100,11 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
 		.requires_smc   = true,
 		.device_name    = "arm-rsi",
 	},
+	{
+		.func_id        = ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+		.requires_smc   = false,
+		.device_name    = "arm-smccc-cache",
+	},
 };
 
 static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
-- 
2.43.0

