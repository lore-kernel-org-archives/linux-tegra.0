Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012010.outbound.protection.outlook.com [40.107.200.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AE320CCF;
	Wed, 29 Apr 2026 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443117; cv=fail; b=rs8Sxm83l9027lU/r0q+i1jZFBXh8GbflZ5MAksIaVOSTUZEGbZjZ0bXDmfb/ksQ/xHyXyYSIPca4M42ZC1NowvtfHdSPcu81rrNuBZtvgTj49nWPRI0GCBpZjfqtO+AqNnxLGPCA1+UspWRUVbSY7txW4OVYK50DTRpjRqh3PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443117; c=relaxed/simple;
	bh=2QL7o27rN8lvcMKbGaC6A1xO46kjKR7/ltWm81538qU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MSlHEV18Ty6EE7pP3n22dUgplY3HPPlEffXH0dxj0V5J5kDHC17iWTJaIlEI+YMG4npEsK1+Z4WKuD7kPonGrCK+YHDjHNWCjmVzekbvIaEGPG90YTIGKMsuuPdr5vXHzqvm98UV+ljHyXDN09ldnsDqMsF3O3ZCc2RkEIJ05dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nyxVOYRw; arc=fail smtp.client-ip=40.107.200.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nyxVOYRw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOCEjT4KSznTF3WW6fcfDht+r+osnASCd9XtDuwa4hDoKA15VBKAsag0yoeRFfyNNNETVltDNZShW7Tn3e8p3uVJuk8aQqrRq1DfuRGJ7j8qXKB8OWOmON9ukZKJxJLlcrQqXvhQSIqOKNonvGW+GK9OK7m3x9wjx9Wsm7hptJiqcKwqrYSxTsV1ADrmm8cAgheIVR6ZktCA6Z7vZdlcQgaVrDgHUZjKB6T57HxDLweqNC6e3if6yTEDkoSGPVPFyDMQqV3n74QJlxyBvkddiwkicvyfCQRo10rWzFM6PYvK9g3yp6wbFffiBIAUrHvTRQoy79DUXej9YYbF0DIGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rJ7+el17Bl3pz6UOPTpNB+zZOXHzxrw2A29bzS7qlA=;
 b=w0NR//HM3d3kEzStN2DB9g8i5w95JlZSkk4N9fxUdUMbXzb2M0tlHFCcD7MKebREa/5zT7Y9r8Ll3F9E5Y0PE+yWCI4cQD6J6kUR6MbRbr5Dpt9tj9BaSPTACjPFmGEnkFcKLa89FwKK8+U6xfor3eSrrqWV5tD7cHJYuTwjviLEjmbCOhtZVhAX+FIkuWdZgYkf+CnmloO0koP+vVZ8tN9kPPh39rVqzW/fkOuMektCIZVU46EMstktHVVSHKsmXsVvlTIh2P6/29Qk6q1hqFOeZh7flqLFY4HUqDX28tp2+32oCrqYLTPWQ70IuWIhF4Y3J6MAMcppaxRQnA8W7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rJ7+el17Bl3pz6UOPTpNB+zZOXHzxrw2A29bzS7qlA=;
 b=nyxVOYRwwv98tuVCDT7otO7cDyXN0SLSTp/yxMiNac6JG19BT0DXP1ebEw956ObhRS4xx1+bUEyd6p4LrLGMpb5/cOJU1bl+5Arywg2o2W5QenWkynscuUmPEMw0zSlDrBEk8Wn5Fz0q8BmbxI3/iRgMDSElXvzHC7DFmsvo19rhL8ET9nqZbsGxcsvK7rKGRqCixmbwwJRI9KkLV3+vkqc0BOx3pDjIxaloFbMZaYkxHyM/4emwFMW/WHpFn13pIvDoI9lLOj8c6gNOM3I0SlEaGBK3B0mb5gxHxFk6bgzL3U+C65DrmABvOkXtRDPcYilsmvNt7IO4esM6vtmldw==
Received: from BY5PR16CA0023.namprd16.prod.outlook.com (2603:10b6:a03:1a0::36)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:11:51 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::ed) by BY5PR16CA0023.outlook.office365.com
 (2603:10b6:a03:1a0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 06:11:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 06:11:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:11:30 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 23:11:30 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Apr 2026 23:11:30 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH] memory: tegra: Wire up system sleep PM ops
Date: Wed, 29 Apr 2026 06:11:22 +0000
Message-ID: <20260429061122.807346-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd09dc6-a60c-4df8-4761-08dea5b6314d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BaGNyuQ2K5jv84CLw0vv+dL5ShjqLseOlMj2+MJU0twVFkDnWx5LdBFlpP5N7R+g3n3hGG9cnc0NgpN2v4vnZrWCAXviIw/X93JGdYk1iNLj4YsUhAm60MTXwYITPY21VNZ+DkpqcQBTA+abuiXHvOIDlL01nSqxkwjWFhtJNZsMLtq5SSVF1IJEjMGCFSEKj0feDhXSxK60h6bxee1UUZJlkrUDJzmFnGIxCv+7CSCjClC7krO2mJWi4yeai13slY9a1/xVzLj+tI9NGI3E+/lXQeGSM132LeJncKiUfbnIDrGHV6pzfdQJIIkPYoJMClOiEj4hePT/fEO08nnbICLLiLNSIsMcxIdvrKGcpKwGxJO4zzIn7jm4REboyh4L9GiHvzs+AnT4ZYx5mjCGl0ZZGB9+O8jFqglWGA2v/fjBr1sw0OwDjLw8nGHcoCr/UAohFQpP/VM453wID6gakkoXi5ySo4qBilsCxi6YvVgKHdW4ghM1PN20Fzbb5H5TZvt4KiKwCNmZmksjWPHicjIdrDNspicrWDB3FfwrdsXJ/+d2QINZWLhwHFUxqVyPaFkTrWwf6yX1DmkUVa2k8tQnl4NTm3xpPzg/YmidrF4GPBb0P/kZe6MMaEWGzCgJ5s2PAp7u5y+RRDQxRxm8fCvAL80Ef2JWZ52WXBzOp3CP3vjDIoQ84m7UtbMc2yCztm1hsSdCj802493ZVMzuCZASyKQoVZyZhVUJ72wdJefEYGdnJHXewmE3CTMhy/x4bH8PZ2LIFDobpXe5R3eyUg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qOCKMl8O+3ufmTspmopFpwvglJ18YM1NwyZH692HX2WLIlRhTJyD8ZNfQXQ0x7KKW0QJLem+GLL8fj59i1z9cC4Gvm+2yPeKIf4bZnxzlT2Z5/z/X1ezF5yOZRfvXI0OQJcmOmEztJpNX70RBjRya+0+V0PIWgv4LTmizEMlTa+M26gSstKo2j5yZQ5Rw+fhxlXy7K3IwQFGvuSub2+icROEqJ1wnsHTB5djBJApCG+aXoULZs2gMkTINBHTAZ6qO4sgoivkPQB0b2mc/vnkGjBJnbQ1EiJdjImNWQlb4uQSyXXCq5703FRfOTMECO+O/grDBtkg0aMXIOSsiJRAh15Twx12XczAVYEHgXwJ75fqx9eUVjQftk83cmRYslIOYmnbFRivvcDipMohynpeb6e2DZrsoWYwqiI/sa9F9OWramUpO4deasS9iHnhBu9J
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:11:46.2586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd09dc6-a60c-4df8-4761-08dea5b6314d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

The tegra-mc platform driver does not register any dev_pm_ops, so the
the SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume)
on system wake. On Tegra186 and later this means MC client Stream-ID
override registers are not reprogrammed.

Register a dev_pm_ops on the tegra-mc driver and route the system
resume callback into mc->soc->ops->resume() so the existing SID
restore path runs again on wake.

The MC interrupt mask registers also lose state across SC7, so
re-apply them on resume. Factor the existing intmask programming
out of tegra_mc_probe() into tegra_mc_setup_intmask() and reuse it
from both probe and resume to avoid duplicating the loop.

No suspend callback is needed as the resume path reprograms all MC
state from the static SoC tables, so there is nothing to save.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/mc.c | 46 +++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index d620660da331..cddcefdd16c5 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/tegra-icc.h>
@@ -910,6 +911,19 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	}
 }
 
+static void tegra_mc_setup_intmask(struct tegra_mc *mc)
+{
+	unsigned int i;
+
+	for (i = 0; i < mc->soc->num_intmasks; i++) {
+		if (mc->soc->num_channels)
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
+				     mc->soc->intmasks[i].reg);
+		else
+			mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
+	}
+}
+
 static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct tegra_mc *mc;
@@ -970,13 +984,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			}
 		}
 
-		for (i = 0; i < mc->soc->num_intmasks; i++) {
-			if (mc->soc->num_channels)
-				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
-					     mc->soc->intmasks[i].reg);
-			else
-				mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
-		}
+		tegra_mc_setup_intmask(mc);
 	}
 
 	if (mc->soc->reset_ops) {
@@ -1010,10 +1018,34 @@ static void tegra_mc_sync_state(struct device *dev)
 		icc_sync_state(dev);
 }
 
+static int tegra_mc_resume(struct device *dev)
+{
+	struct tegra_mc *mc = dev_get_drvdata(dev);
+	int err;
+
+	if (mc->soc->ops && mc->soc->ops->resume) {
+		err = mc->soc->ops->resume(mc);
+		if (err)
+			return err;
+	}
+
+	tegra_mc_setup_intmask(mc);
+
+	return 0;
+}
+
+/*
+ * No suspend callback is needed because the resume path reinitializes all
+ * necessary MC register state (SID overrides, interrupt masks) from static
+ * SoC data tables rather than from saved runtime state.
+ */
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra_mc_pm_ops, NULL, tegra_mc_resume);
+
 static struct platform_driver tegra_mc_driver = {
 	.driver = {
 		.name = "tegra-mc",
 		.of_match_table = tegra_mc_of_match,
+		.pm = pm_sleep_ptr(&tegra_mc_pm_ops),
 		.suppress_bind_attrs = true,
 		.sync_state = tegra_mc_sync_state,
 	},
-- 
2.50.1

