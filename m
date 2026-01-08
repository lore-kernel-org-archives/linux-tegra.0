Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE18D21B9D2;
	Thu,  8 Jan 2026 05:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767848487; cv=fail; b=s7xztaemZg/EFA+l4tlT+nbXjuku99LKt4ShXIa7FvABzsLSJ/wMYXbjltCFCkVgY+9CiWNcx6LLnxv0t4iIMMv8DTD0AW8PW9DV3WAZlklAZb1/LU8z0wOcN9MxIFG66kxV2QxIOT0LzPMiAUnq/4Lh0cq6tYbKCKkuaZj68SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767848487; c=relaxed/simple;
	bh=4DsRuwkVO64946S+H3OvMYANSAwNVsY4yzN9ePPWxPY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UnXGNXGNRBnrZK7DSpZkDAaIYbDQetiEPTKnOL+E8PSDvxONa8bdmxRwruV6X/sXzLKM5oUxgN1B0nnt00X14FqciaG8YWP4DKEDP/IUK7j8PWesdpdtXTJ1L5oyd3gSOqJjomp90fhZhO+06PHT9WQokKJwb50n6M0cAM0stEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M2q10Ux1; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M2q10Ux1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfbZzrdfpkUykBlDJAWy+CQTWUK7NjaWUMTbtSrAvrt3E4s2neFPYPL9IMQpw5YBjnSBJjySAqlkkRdIHlwDvwpNjDmKbForfY6hM0OsT/R389ToXkJxOd2bNyJZJqffNdp/af5X5PauQUhRfmLi9X3H3FVFZJ612b5hqoWi+rnB/Bp0AKZP/OY/DSARNgXsAmJTxMdHVEjcwOHTehX8DqgAPyLuAnKQONzrUscVRhWx1oENTvckj3CAgKBzqSHtqIXUdR6i2Afq/ksZ6Bi0bSab+X47ykKufTKi00aTmixwXZzZoqKPiDt6Plkq8/nUa1l5Iyga1bYAiU3hWJXwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AokcWjDQbB7G+58eXZb/Hh4l7d3Ai8CJt6ZxRuZrlfs=;
 b=MM23eBg+s0hygtQYSlg4JL8UVjyhNWAZ9+W9hkmMZdze++JlTj1Ou2zL6RUNrLiHwledfCTa6zoPZfIgpfBIkbz7XxcNaJMmd9rPDsYf54zpAiV9I8kvEZ0eVCaHrS2Vz09Bi7OrC6xaEzjZDuHhLIbhh2mUqVWPX78KP+bfHCgka2kyn60Qq/TAnum0pemQ9vGQxdQZIl5HDPlTUbAHTazpLge6sEgpiMnXwaZXdEr/xEYWUdnwpEhR3Z+mXPEkIZomoJloHNrCL0uBV6u/3+7SFou8sKBjyU1zX7o6yzGo0AjKAuvQmkK7u7c0x/DMM8+rkN/g36y5ksrxGTWZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AokcWjDQbB7G+58eXZb/Hh4l7d3Ai8CJt6ZxRuZrlfs=;
 b=M2q10Ux1zNoUq71e4Bkta+FN2gYBI2vONICBs0ApFUSOIhyMfER2thtE5cKadXmjC/QqZ9cy7dQZoLAbb3nLo72tfRWWqbpmqGeoXN1OmiDuzzl9n5rt+eFPdcE17ghPq8XMV0eMvKCSy9n2U2AzNGMvSBCHm44XPJMVpGUBJGh5hJ9hDUWnhsODwncRjRX8gfnlENmspKKrdWOWOU1yRO472nBS/kEYcGocTlfqlaVub0AtdSv4MWAx1866j2ABeStwH9OvlGpcj+J50dwVPeYf/fPDRwvMonwd3iZP6e4c9bTRKA8AFbZmx7KF22cdCqtssk3VbPbT0U+gwivUeA==
Received: from SN7PR04CA0119.namprd04.prod.outlook.com (2603:10b6:806:122::34)
 by CH8PR12MB9790.namprd12.prod.outlook.com (2603:10b6:610:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:01:21 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::ab) by SN7PR04CA0119.outlook.office365.com
 (2603:10b6:806:122::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Thu, 8
 Jan 2026 05:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 05:01:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 21:01:04 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 21:01:04 -0800
From: Prathamesh Shete <pshete@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ulf.hansson@linaro.org>, <chleroy@kernel.org>, <jirislaby@kernel.org>,
	<haotienh@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <pshete@nvidia.com>, <petlozup@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Fix unsafe generic_handle_irq() call
Date: Thu, 8 Jan 2026 05:01:03 +0000
Message-ID: <20260108050103.126008-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CH8PR12MB9790:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bda98ae-02ff-45a1-ca3e-08de4e72f729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R+VFk5IWFR6qez27/7L+qi7zOLALGgxCeUUeWmb31G3ZReWvW84G7YG4ImWl?=
 =?us-ascii?Q?XKHv9K+UWB1VnmIpSW6ykLPfniDYyibARQLkK5oQ057rYCKCytmePdvDzIO2?=
 =?us-ascii?Q?u2McmheBOrU+IvC2riQUuRIpQYfEloucGY8eQuTgGmvNrcyt07vic8kT1grA?=
 =?us-ascii?Q?3nizIB6JshJEuJqp+kHAXxTZVphlcd1BAbCvZM8zHT14/kwhCeNrcPKAevcy?=
 =?us-ascii?Q?VOu0Jn/FUuscvBnbWcTjoEgMOlicNeOLh8d5ay8Ta6une5rRzNo289QrAGYS?=
 =?us-ascii?Q?kyCJ6r4cb49BF404CSRaRJebtyxQuqzl5wZDOLpqHh6Puo9G6ErSeQN1nEmh?=
 =?us-ascii?Q?g3DuuzI+/2hOP2942txIGt8Bl8zPGDG3pKa9o5QmWUkpm8sAc1rUMO9f/ejy?=
 =?us-ascii?Q?i3CHXGN7sHtR+by2gl0p8DYqxxcQB9SFmpSjao4tEDib5Z+scWu1dNo8sqfp?=
 =?us-ascii?Q?ScV1TuYhdGa5lIbC6UZDpZjvn+YDxd9OuktgTqPJiBXngaY5fL+yHkzitf5M?=
 =?us-ascii?Q?7AtchROg5IW1EhWJWb1O5UavtjDBUwNSpI3Uq/dMKZ/BC5Ktt85NEieTzwj/?=
 =?us-ascii?Q?CWO5H58EpWQvjxYFAbrEOr/g9kefKCErCi/sxs6Kq1V7fcf7Ct2x+84xOY5T?=
 =?us-ascii?Q?+TqP6+i2iCEQDqP8RmRWC9lnfRrl4CgRTYHLmUJpJk762YKlZCZLQ/F5I0dz?=
 =?us-ascii?Q?I6e3hZm1gyqG5oD29GEUGRU3sev6SXTnyRHR//Aqz6B5GCarvCZJff6Mo74Z?=
 =?us-ascii?Q?hbc/L4y7pz9bOimIozLSlguBgPuXQ9XsC8Vc1oiGB37X9useU6rpfn6wiYSp?=
 =?us-ascii?Q?wm76vb42xT30wQeKDE2FCkTA8TG4fwswSSeYPSY3WSEVc6tQwr1gTvlO/av1?=
 =?us-ascii?Q?dI471HHylgvzTp3BuyAQmn4mJGw44JH8nTwDMlnFgEcdcb8h+x9IAdpM9oYl?=
 =?us-ascii?Q?C4giXlUTeyiPOEOOirXQ8/Br+0f2DaoJ6Dm6ivQY3Mi9GabUqScKvarVFX5G?=
 =?us-ascii?Q?O+9G/2Hjiwo+8SANorAky8R73ZYz8w/GQbDi6WhUpDe7GQZETpmpd+J0Thng?=
 =?us-ascii?Q?t4WKg41h/bvWwDFjEOYqpembcxVJy+D2Z5PUdW5k0Yq8zkc/E0a3J9D96BI5?=
 =?us-ascii?Q?J38ZDFd/zQjCXYtGpvJSKowD/mBFbXzMaAzO4ndjQhq7lPr42xttJSRdE6z2?=
 =?us-ascii?Q?vokJ+wwyhUSQba/h1BClsPDis3B555oGWshEhvUNSIMyTfeQliCjaq40dnrK?=
 =?us-ascii?Q?JvICo5r2dcPeVSYAUPdfgEhYr/zzCw1GyZ3UwPUCU0tdY18abZ7kZtRBd1ao?=
 =?us-ascii?Q?Ccln4ei03cEocOwLLNdixkia2luvcM+QCbvMlHbJgCuhnxPyhdP6U9nQFBz0?=
 =?us-ascii?Q?RUzxwwxyKC2fG60iLdM5IvG3qvzaYxeFweyaaAX+4uTO3f1Mm0aCZ1b6h9mj?=
 =?us-ascii?Q?JJXGfmXq2kf0fmvCdSk82erK2uJUOvJS1KO5N/XVRAEEh7fyI/SHZsFNWFOm?=
 =?us-ascii?Q?VqgRk/Fzi7rjr2XU1KUvzG12ltF5Uc3+qcnbW9ropfx9TMpWBvv7kX4v422m?=
 =?us-ascii?Q?/5FAXkjF3zzw/iFF9N8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:01:21.1908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bda98ae-02ff-45a1-ca3e-08de4e72f729
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9790

Currently, when resuming from system suspend on Tegra platforms,
the following warning is observed:

WARNING: CPU: 0 PID: 14459 at kernel/irq/irqdesc.c:666
Call trace:
 handle_irq_desc+0x20/0x58 (P)
 tegra186_pmc_wake_syscore_resume+0xe4/0x15c
 syscore_resume+0x3c/0xb8
 suspend_devices_and_enter+0x510/0x540
 pm_suspend+0x16c/0x1d8

The warning occurs because generic_handle_irq() is being called from
a non-interrupt context which is considered as unsafe.

Fix this warning by deferring generic_handle_irq() call to an IRQ work
which gets executed in hard IRQ context where generic_handle_irq()
can be called safely.

When PREEMPT_RT kernels are used, regular IRQ work (initialized with
init_irq_work) is deferred to run in per-CPU kthreads in preemptible
context rather than hard IRQ context. Hence, use the IRQ_WORK_INIT_HARD
variant so that with PREEMPT_RT kernels, the IRQ work is processed in
hardirq context instead of being deferred to a thread which is required
for calling generic_handle_irq().

On non-PREEMPT_RT kernels, both init_irq_work() and IRQ_WORK_INIT_HARD()
execute in IRQ context, so this change has no functional impact for
standard kernel configurations.

Signed-off-by: Petlozu Pravareshwar <petlozup@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 106 ++++++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 30 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f3760a3b3026..a0cc276e235a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -28,6 +28,7 @@
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
 #include <linux/irq.h>
+#include <linux/irq_work.h>
 #include <linux/kernel.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
@@ -336,6 +337,8 @@ struct tegra_wake_event {
 		},					\
 	}
 
+#define TEGRA_PMC_MAX_WAKE_VECTORS	4
+
 struct tegra_pmc_soc {
 	unsigned int num_powergates;
 	const char *const *powergates;
@@ -468,6 +471,10 @@ struct tegra_pmc {
 	unsigned long *wake_sw_status_map;
 	unsigned long *wake_cntrl_level_map;
 	struct syscore syscore;
+
+	/* Pending wake IRQ processing */
+	u32 pending_wake_status[TEGRA_PMC_MAX_WAKE_VECTORS];
+	struct irq_work pending_wake_irq_work;
 };
 
 static struct tegra_pmc *pmc = &(struct tegra_pmc) {
@@ -1905,8 +1912,59 @@ static int tegra_pmc_parse_dt(struct tegra_pmc *pmc, struct device_node *np)
 	return 0;
 }
 
+/* translate sc7 wake sources back into IRQs to catch edge triggered wakeups */
+static void tegra186_pmc_wake_irq_work_handler(struct irq_work *work)
+{
+	struct tegra_pmc *pmc = container_of(work, struct tegra_pmc,
+					      pending_wake_irq_work);
+	unsigned int i, wake;
+	unsigned long pending_wake_status;
+
+	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
+		pending_wake_status = pmc->pending_wake_status[i];
+
+		for_each_set_bit(wake, &pending_wake_status, 32) {
+			irq_hw_number_t hwirq = wake + (i * 32);
+			struct irq_desc *desc;
+			unsigned int irq;
+
+			irq = irq_find_mapping(pmc->domain, hwirq);
+			if (!irq) {
+				dev_warn(pmc->dev, "No IRQ found for WAKE%lu!\n",
+					 hwirq);
+				continue;
+			}
+
+			dev_dbg(pmc->dev,
+				"Resume caused by WAKE%lu mapped to IRQ %d\n",
+				hwirq, irq);
+
+			desc = irq_to_desc(irq);
+			if (!desc) {
+				dev_warn(pmc->dev,
+					 "No descriptor found for IRQ %d\n",
+					irq);
+				continue;
+			}
+
+			if (!desc->action || !desc->action->name)
+				continue;
+
+			generic_handle_irq(irq);
+		}
+
+		pmc->pending_wake_status[i] = 0;
+	}
+}
+
 static int tegra_pmc_init(struct tegra_pmc *pmc)
 {
+	if (pmc->soc->max_wake_vectors > TEGRA_PMC_MAX_WAKE_VECTORS) {
+		dev_err(pmc->dev, "max_wake_vectors (%u) exceeds maximum (%u)\n",
+			pmc->soc->max_wake_vectors, TEGRA_PMC_MAX_WAKE_VECTORS);
+		return -EINVAL;
+	}
+
 	if (pmc->soc->max_wake_events > 0) {
 		pmc->wake_type_level_map = bitmap_zalloc(pmc->soc->max_wake_events, GFP_KERNEL);
 		if (!pmc->wake_type_level_map)
@@ -1923,6 +1981,12 @@ static int tegra_pmc_init(struct tegra_pmc *pmc)
 		pmc->wake_cntrl_level_map = bitmap_zalloc(pmc->soc->max_wake_events, GFP_KERNEL);
 		if (!pmc->wake_cntrl_level_map)
 			return -ENOMEM;
+
+		/* Initialize IRQ work for processing wake IRQs
+		 * Must use HARD_IRQ variant to run in hard IRQ context on PREEMPT_RT
+		 * because we call generic_handle_irq() which requires hard IRQ context.
+		 */
+		pmc->pending_wake_irq_work = IRQ_WORK_INIT_HARD(tegra186_pmc_wake_irq_work_handler);
 	}
 
 	if (pmc->soc->init)
@@ -3129,47 +3193,29 @@ static void wke_clear_wake_status(struct tegra_pmc *pmc)
 	}
 }
 
-/* translate sc7 wake sources back into IRQs to catch edge triggered wakeups */
-static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int index,
-					     unsigned long status)
-{
-	unsigned int wake;
-
-	dev_dbg(pmc->dev, "Wake[%d:%d]  status=%#lx\n", (index * 32) + 31, index * 32, status);
-
-	for_each_set_bit(wake, &status, 32) {
-		irq_hw_number_t hwirq = wake + 32 * index;
-		struct irq_desc *desc;
-		unsigned int irq;
-
-		irq = irq_find_mapping(pmc->domain, hwirq);
-
-		desc = irq_to_desc(irq);
-		if (!desc || !desc->action || !desc->action->name) {
-			dev_dbg(pmc->dev, "Resume caused by WAKE%ld, IRQ %d\n", hwirq, irq);
-			continue;
-		}
-
-		dev_dbg(pmc->dev, "Resume caused by WAKE%ld, %s\n", hwirq, desc->action->name);
-		generic_handle_irq(irq);
-	}
-}
-
 static void tegra186_pmc_wake_syscore_resume(void *data)
 {
-	u32 status, mask;
+	u32 mask;
 	unsigned int i;
 
 	for (i = 0; i < pmc->soc->max_wake_vectors; i++) {
 		mask = readl(pmc->wake + WAKE_AOWAKE_TIER2_ROUTING(i));
-		status = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
-
-		tegra186_pmc_process_wake_events(pmc, i, status);
+		pmc->pending_wake_status[i] = readl(pmc->wake + WAKE_AOWAKE_STATUS_R(i)) & mask;
 	}
+	/* Schedule IRQ work to process wake IRQs (if any) */
+	irq_work_queue(&pmc->pending_wake_irq_work);
 }
 
 static int tegra186_pmc_wake_syscore_suspend(void *data)
 {
+	unsigned int i;
+
+	/* Check if there are unhandled wake IRQs */
+	for (i = 0; i < pmc->soc->max_wake_vectors; i++)
+		if (pmc->pending_wake_status[i])
+			dev_warn(pmc->dev,
+				 "Unhandled wake IRQs pending vector[%u]: 0x%x\n",
+				 i, pmc->pending_wake_status[i]);
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
-- 
2.25.1

