Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B63B14B6;
	Mon,  8 Jun 2026 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956447; cv=fail; b=hk9bqkrQqv/Zt1m7GIiTWrusZ27YPA7AM9BVuVcPvn1vnWKb7esi1fSjEVwFGMkLkT943evP7fPQGxcwEIHGyMiC0bkx4KeTIRzldYy+L7cYM/UapCPZCxxiqQVBu2tCzTiFF7ePxfiVubUldRPFgsrCZfrYNNg0Is/GMNZoHoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956447; c=relaxed/simple;
	bh=sYW5WAwfQcVBpf8LhBCRaXvdjMFdZfJqlbKLaVfb9xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bTSy4239ci1W8a+BwJHsahlW5P6Lm/1ScBCmgaG7YRmufhjRWIc51EUJc9le0OiP5ZT1IUFv0Sx0Hx2d3ksO5P/HD52edwW1aJidpW/RrCi0tl2YnpIA71MUlX5yScee/G3JyvyVb4BDdKzEqMoP+1i3Fpdj6zO1DKxNRuzzc94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TN3DV1no; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TN3DV1no"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpKj4vS0VWXCVvEm1nlQcQ3/6vGRSc/5LrWn810nYlrxEBDh+KtO3FJ3mMdKglFiO+Rz0cdarC3vId2kPofP+w3+SRhXMJN3YIVcMewRYaY8udYvum73+nvMA7VL7Rv60SajaaUSlHWXBZ4aTKXYg5JrQDDJCN3SafwHK2UZaiRuIMBpsbmg1hDN6QLW9O88PtLIiEb/NN1ybTSZF57zNrNNClS5anCLKwSAYkI6jaB/40OmQ8NyNlejWTsg9QO4ZNP3M+RRCzRcBiSuUtZ/3SxNus7ScE+zmmzSDeQiYgYtwYYXbX7HaRSLG8vAItHo7rk/8d/Q2G7dmsr7ioKt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCX14xru65oGaf0I1g/a+zGZkK+L0W9BJ7klsqN5e6Q=;
 b=QthOkEdBEPLrsghe4Jds6meiXHOL+wNxvbuon5HYHzX/99cDzm71bNnQiIP8sLl2qpSajeSe00pftZ2FvdDNvN9oJcSd5S6FnGv8d7wRW3SJOliUYX3VwZxCMuy29hVRli+JpEf3QM6iMwaq6mJczIIz4rnrZlorPN69oNIPbv8lbrknXy5FRTyPcVgV5DMSIUYSqzQkMCby6J24Tr8ZihMtWOCsbCJweiGXAPsebqGrpiT4Gojq/SgMiLY49EorA2YxygiPYPrfQUmvMEDpZJ2EzshXrRsv/SA7wIoVwBe4Kftaf63reazBzFGzxWo1wD7ktFfKD52iWA8G7meEog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCX14xru65oGaf0I1g/a+zGZkK+L0W9BJ7klsqN5e6Q=;
 b=TN3DV1noJnVS32H6QfEVXeDIeDRbdKIilFnGSdZU00EAYJQxni8ITJW4mzX18zsdqek7LFBdmYeSvGAvvcNdo/O0T1kfkjqUdNfndrrNT4eNsnyS0nDaqjXeGxuDPT3l4kiC8p0m8h5TeI0qYgSvqdoQAjEv6hZaQmyH9Ox3jW6RaNeaSS4INqoTKRghjr/I7loLzrIRdFqE3rtYMatOMC2dgJXwgK3iURsBHUtdrnplf+rE4izXyyqbsXEfgCPB8owT+hdgktJ9N2Lfl7V/KZOrYMiaWXlD6ncHo6ALOjWQFbFO8aA4aGjQ3pYJkn+qOmX05YbFsyvrfrWsixOjkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Mon, 8 Jun 2026
 22:07:21 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::4d08:451e:a51e:33a1%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 22:07:21 +0000
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
Subject: [PATCH v2 2/2] cache: add SMCCC-backed cache invalidate provider
Date: Mon,  8 Jun 2026 22:07:09 +0000
Message-ID: <20260608220709.1300245-3-smadhavan@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608220709.1300245-1-smadhavan@nvidia.com>
References: <20260608220709.1300245-1-smadhavan@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:332::29) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: cb2b6e49-2f9c-4ea0-b4f4-08dec5aa5040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|11063799006|5023799004|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/rOg4mNGgDwxQmcgQU/tQAzysLMTTsqHCqwWbCpfe0ITQcH5VyNdK96R4RUHCtJgY9YkbSb0gvlobnIYIZ2RFVbEqonyPonJQHvPm9WBDAfD+5tAD96JvHm/6EJuVNzn4fuugZD8HKGdjoTH6T0TJhg6sgFRW5dUhP4PdRXbGvRczy7GqupWq12D1gZxhmknkHUqAU7Uc3w4ppKW2UKgTpYpqM2iHs+FxDYDs4/r/7XiFQRUtBtGfGxcYvtjoQxFL37uFiw8uESkmVNv0OZ9BeTff2vFrGAflxb+wBBl1UnT6h61AvSqYHg8jDtEFJQTJoj6QitpjwVwswPzsAaIl/HYRGTjWlAyRiDbC+NyySFfXchNpeuTVSW4wtsMTBIu4tTK4wrPEOD9adhsEbLbQTghxAnjggtaPkYLboWPqDevyoxsauTch0b1URjnK2Fm0argQHrAP2bEWPRxx/YtFrlJ68ds2ortCXM1PfZLT73gnLsFL8Lr708PCaSqQv0c7gjNk02NTidYD1RzRP9IC1oGD7xFVuV6NeTh0XUsAL9BHL696OHcSh4J8u7b+pJf2qPIO9uYY0GW/8JBzFgLkB3c2D2R1MYY7caR9PaQblROYYYX23O4AScPy7xrETr3jCUsHTEJ49Rbzyt4HLeqNZtN9ROqKDvIdpU2hq6N/HsdjsGwW62klEzj0sV+bolS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(11063799006)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F2DleS3F59nWHrFNZSIvl4tMx+bl1q9ucbq7X+JExGzMg9v82Ln+m3Nnc/cl?=
 =?us-ascii?Q?h/8hyXls729NJlEekt2UvKPFSqJxRSqWBNFE6fGMAjzq6ekRB4Xe4/bw8oBR?=
 =?us-ascii?Q?wsfheELxSMzHQF1ySsCwdbKLOmAfV4zky6ZDQnAGogwvEttAAyjV5LuQBHk8?=
 =?us-ascii?Q?jt0miHKLfGN1bjd5jjFhwsjjBY/AnoJ2Wj3QtIrrYt/19Ot0tlryDpIykyvV?=
 =?us-ascii?Q?NAEPIHO6jlVqGG3DPAbkX37YToKaUpr3eIN9Pg/ZMCWG0EOz6yKHa90GS1dx?=
 =?us-ascii?Q?Lx32SSIsPbLKu1eVHUUCOoqrQI1JeNAXBCQfFh0st7SttR0qNfos9Pd1q6eZ?=
 =?us-ascii?Q?xw/lJ4oPC70FDY//1+XxnzLaFh8oyL7KWryT25Yy30wzv0qtEGj7PCK80x4E?=
 =?us-ascii?Q?Llluoud8k6mjDMGq5apOoy2sqZzIwAepJIa/NDyidYtIh34matOvi67t3RdD?=
 =?us-ascii?Q?5EmNTvd0s+O6YGjRWLDM3g2Ltgf9niuyk52PP9YHSlo6S26b7MhIqS6aJeSL?=
 =?us-ascii?Q?yculUirTm+DgFGBxFHPHRdsucBAfrvMw/iIBfW2y7xVRpbigo7YP95L8LOco?=
 =?us-ascii?Q?i7uQW+WQTSmyawjm74KDGpZJ3U5Qy73u7aGoApUxemk4Hop1/be8hcOnHVX7?=
 =?us-ascii?Q?/ELZ58TPtizU5a5iHpypS+tKeemwZ9Or3udHDfSOoh3U2XvQT10d/RG0pCnb?=
 =?us-ascii?Q?8GhiGabL+qTlgtVaj7hlaW+pQIPUNRm8dnL/htwmhV5DSNzckFdD25CUY5ht?=
 =?us-ascii?Q?X29YoDy71JSk/sHNUg2rI8pY47l4e4/lFnfcZscWnqUCb7Ac3rY/MHgiD7hb?=
 =?us-ascii?Q?APkZdkHUlufZbYWbXqQ8PkVrTm/oLupgO1m6zvsa147DeP2yeNPxCwZosmXn?=
 =?us-ascii?Q?CKKDmmcoHSeSOtl7awPqAxia2zSMoudtyb/XQlpc7TMNyJRHrRmgYCynHWnc?=
 =?us-ascii?Q?lIWImdcSf+im1rKgFUhNSl7u3VRTjxlJoG/taLu1pieSUs7wQBofFwjjUoUT?=
 =?us-ascii?Q?3MjydMIib7JW7gZEt64roBk/atXv55MKtuv9e+sumRGOpAF2ObMd/zgu1ejo?=
 =?us-ascii?Q?Mo6rniFUCLTjJKbPgdZ8A4z/7yxA35jKc25uQQZPe9mEfEUMpc2gizPNHvd0?=
 =?us-ascii?Q?IQg3Y+uYBLk/+LKOWtYQyuBikjaqzQxXSaH4sorVuwAhaR4qurlwsTBfcg4L?=
 =?us-ascii?Q?e5r9nXR3JUbOUzCh0fAG8fmguT3UfCktMSRpCm67ebtMQ/liPBkPmChr1iUO?=
 =?us-ascii?Q?31bYAOlrby+pTLzpu4tjhoFv+enuQemK90KaNaeyxsE2Mqxb0irCQyu68+Ui?=
 =?us-ascii?Q?1mwSSDgXK4U8oXDt6jfATNn1Jl8JmDXsVujxDsRNLTtO3OsExWqJKqRhOtZL?=
 =?us-ascii?Q?18H0p3ktKDWErjzJ0rDScH8nnCRqpNl2VpLmiuVKvBOjLQZ14VLkq7MWQXFN?=
 =?us-ascii?Q?4rxIbo0V2l4ikS9okzONRxBItYs/gUZtgvqRTBJ/sKg+YRQ/Znr7/KDaHqn7?=
 =?us-ascii?Q?pl5dRuuMvDViiIdNwCaZ1Kl2cKA8Jd2x5JE8EJhw4TEYAvc4eH6/Q2kr1YE9?=
 =?us-ascii?Q?EJRfy5f09O85xBamqNZNGDmK/pwavzzFZNxqJBeqIcpfIpNvmRIJSGrpVk8d?=
 =?us-ascii?Q?Jl43//bHMGXwiGjgczKZ8aEQ0pRVcjODbbXZ2J5XakeeYiCuaAuLdn+Qlntt?=
 =?us-ascii?Q?vOSeE0rYt0CIKgnebh1IzMBQIESD1T4RBrfLyhZh+CNT/d20WmiU3eAurwWo?=
 =?us-ascii?Q?GCor8T5huA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2b6e49-2f9c-4ea0-b4f4-08dec5aa5040
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 22:07:21.5782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRClD2Yngk5XRtSDCoHU9agk9rOQoRHjmZZ5CPDajCX+XCldEVXQdFknLXNP0iL3ccaQYtzfAAb+q3JCQwoy5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674

Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
interface.

The provider discovers SMCCC support and attributes at init time,
serializes firmware calls, handles transient BUSY and RATE_LIMITED
responses with bounded retries, and registers with the generic cache
coherency framework used by memregion callers.

Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
---
 drivers/cache/Kconfig           |  11 +++
 drivers/cache/Makefile          |   2 +
 drivers/cache/arm_smccc_cache.c | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
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
index 000000000000..82b9efdb190b
--- /dev/null
+++ b/drivers/cache/arm_smccc_cache.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 NVIDIA Corporation
+ *
+ * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/cache_coherency.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/nmi.h>
+
+#define SMCCC_CACHE_MAX_RETRIES		5
+#define SMCCC_CACHE_DEFAULT_DELAY_US	1000UL
+#define SMCCC_CACHE_MAX_DELAY_US	20000UL
+
+struct smccc_cache {
+	/* Must be first member */
+	struct cache_coherency_ops_inst cci;
+	struct mutex lock; /* Serializes SMCCC cache maintenance calls. */
+	u32 latency_us;
+	u32 rate_limit;
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
+	struct arm_smccc_res res = {};
+	unsigned long delay_us = smccc_cache_delay_us(cache);
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
+	return -EBUSY;
+}
+
+static const struct cache_coherency_ops smccc_cache_ops = {
+	.wbinv = smccc_cache_wbinv,
+};
+
+static int __init smccc_cache_init(void)
+{
+	struct smccc_cache *cache;
+	struct arm_smccc_res res = {};
+	int ret;
+
+	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_1)
+		return -ENODEV;
+
+	if (arm_smccc_1_1_get_conduit() == SMCCC_CONDUIT_NONE)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION, &res);
+	if ((s32)res.a0 < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_FEATURES_FUNC_ID,
+			     ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+			     &res);
+	if ((s32)res.a0 < 0)
+		return -ENODEV;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION_ATTRIBUTES,
+			     &res);
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
+	cache->rate_limit = lower_32_bits(res.a3);
+
+	ret = cache_coherency_ops_instance_register(&cache->cci);
+	if (ret) {
+		mutex_destroy(&cache->lock);
+		cache_coherency_ops_instance_put(&cache->cci);
+		return ret;
+	}
+
+	pr_info("SMCCC cache clean+invalidate provider registered\n");
+
+	return 0;
+}
+arch_initcall(smccc_cache_init);
-- 
2.43.0
