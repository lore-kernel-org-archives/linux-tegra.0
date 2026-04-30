Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587343FB074;
	Thu, 30 Apr 2026 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542766; cv=fail; b=aTTTfZdAle7mzHejIFiP9mGYvpp8vD6FQM+OsOMCTAOhVTuJ5e55beWSHY7M5GOayWiQ2d5S/0UMTvmRfJBGMIaGqFPy39EpAzljs/EO9+t9HJP8aqiIC5CC6uQQv3pA8bQfWoX3kLETehn0KdS+8c5WuZ7HJiA3EBkH7X98R3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542766; c=relaxed/simple;
	bh=OK29qeKDXhp41USjvcROyQJq4rbYg7w27Phu2mGTByU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3QLMgkHfGdRFd21g5tAyuV7FzU8+OpRs7D8fpTRQBuqUrdFiqEAmtB7Taga5PPGc5DrZjtUPhxXPoILGSyUjqT9T8NJoZQJl5KJSG9g65zm1w1d6G2v1Gv0wDF9WRxhkLNnj1xxblmHizhpsD+B48h+vQD2zJGAY2IzGeCiW0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZWAlNLm5; arc=fail smtp.client-ip=40.107.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZWAlNLm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqcfG+91bqL+H216iHUr49j40EYUUPURxvQjUEWrO+nJdbUbVVcH0TWrwCtP3IbYyZ571b27aiDr7G1lVR0qx5FkbbRFS17FyKtBd/jizdI49N5rCYggIkUcYi85mnoL0bBUiBbgcq94Jdy5EzPnRqosFjgOFmcOq+tFsHDRPnht4TsFHl1UhwZLCyWIlG9eTGbhxbl46zOGhU3duJysghZUfDejK4TxKbfe0X4W63AtmgA+92DsonSDUKgq4SoIR+9E8PKz5HpKuzqd72Be28O74h9WXz9xK81DrPsMxlkg0mhR1zVqBZC+iv80RXrZJdhC6Q47d9J053NmL4Qe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ne75q34Vggmxaw/AS0oNNKW5lDqIDl1NbdAkcDyePoY=;
 b=ooL4oLvdH/zwzXpT4psvgH3z/g8UDGfnHH7fyIaaNXAXNGN8wlXIAjX+qFhg58bTp3UywRvPh6EkSvf2Tt1Bt9I50fCn1vK5tCwFaPJb6Jc9bYjiVc3540A584VybT3hPwVnejhvlI76Unsi/oQ9QLz13+OGGp3Dfwq1szzxU1WF6S/SiwwOxcCOagLpzeaIq0wDOeo3ZFMQGvfmJElniXgYU0lIxrFRRVLmg0QWSmSF0M+ihXpAvU7Q5yjlrVnQfQVyVMFWCOl2LWz6rzgeqv10aaPTQjzp6qJK2PFyIC55o660WShqTAUvdbx10X80uUen+dLCql8OgJGWZY87TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ne75q34Vggmxaw/AS0oNNKW5lDqIDl1NbdAkcDyePoY=;
 b=ZWAlNLm5zqA+ATOuSpXnYJZK32e8E0bmnqu5q0kFLKIcPL2pkXMLNntcL8AYSFaB4A+h4UEsLT7E1hKrrx2O0r6HbowC5lcPo1xdbpvGfmvPqssNDuBcR01reai+ZqD45N/eX1bLNY+5N2v3ry8CZTobWhKCzwbTzb3ma298DEDs8oBbnWy79bTOC052Lk0TTDMhNRnmtVNC+/n6wmXScszsk+Yi+C7w90FIfUgQBzx7NUz3MWgt9J2BBBVh+7R9CndztAS4jCpJbCkSBkH0Vh0fcx16n/krJDkxGP8JCMT7KxXnDInU1+e9359qvQSI5N5UYBsUjERyN7iczD/5PQ==
Received: from CH5P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::9)
 by CH1PPF2C6B99E0C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::609) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 09:52:38 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::12) by CH5P221CA0015.outlook.office365.com
 (2603:10b6:610:1f2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 09:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:52:37 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:19 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:19 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 02:52:18 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V3 2/3] memory: tegra: Wire up system sleep PM ops
Date: Thu, 30 Apr 2026 09:52:01 +0000
Message-ID: <20260430095202.1167651-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430095202.1167651-1-amhetre@nvidia.com>
References: <20260430095202.1167651-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|CH1PPF2C6B99E0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b30edf5-43ad-43a6-1fa4-08dea69e3667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JLIoAJuqxNpN8jqCxZyQsFO7e/1zv8+PLBxJbsXAGxMvBImzmfOBbdoC50qh67nTNCD7zeQi3qCW7kAY3hzrC1S7GUF06dz9Db828F2q+Xl2ZMPSMsfuDHgw78OvvgItIBZeKHPIOIZiicraN3NYpzqIeQVGaun5vvEORUzxYJxiMvmxDQI6Y0QYa7vPpq3+8O3BMYwrzwujS4dtxF98UVJLaYM1jHGVkpn4MFOfSZIgnYZVjnGc1h3h2P169YBWPow8g0bQ2O2qGivdB/ejaQ5+k2HmrxUwCK3kv0Mk6dEp5TkdhSqYjreZbeMq23PJPLYv743W1qPPsMg3DAYNQj51qWVp8UXvz6aXRbMWNKv035Uh7uk4WPo2X72gNcmdf/BA+lBSvkQiArHnpBSCrOZKA1PLkyOOjmPRezIxkNHxg9ocXIh404YY7/7dtTZW+8E77R4lzE8WrPinAOnOfQFENnTxwCDBlhDAQlllGTQ2G0fXwmRbMMD2/UW2/GxCKpBFmOi/G3OIEwPvB0Pi13VGTJCRTUx8CjTR3CTaQhtNTjPvHbGrdnbKsY6b2pg//Hq9VW36g1RwyWcuQGD7FmajpAJAW8Usdbz8/e84BiiwZXTQcSBs9Sgdavx16ZBcFFq6BpDql7wca965aLLYZ5Cd7XlGkMbDMgKpYHVfpClP2BIyi/VDuALm2FL36caNp3Mn3o8xcw2rAZtz+UKUV5D2/Z9mbbNrjkeY4/mgpzTV4HQWbhGWGHmuV3dKzb1DkbItBPS6QN8CpCJ6B7oadQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gI/aLRME8VufWqKSsNoE217NGZpIveWhxj0TWpLLDMj4RHxJLtRauonCERDDXcxUzUbJoEjP3zat4DN/m0nYr1pCHTt2uH0y7+41xTJEzpryt/OATHvyxgUzatFSneJjvUyX1buDhdGvpCN76+kow1Fdk8rJq+oCYF1VWKOqr+jQwPVF8SINle8FTpunqF+mZiwZkkeqL+A34aTezAt+OsSV+E9yeJ9lkTS3teH/66LfrYUv3XYbkcQlxcxA2S/CqCZRjjgaYf+WQqaF4esd6YLLyY3lUFd1WmgGZ5INmAzR5w/Qi5GkJ+8jMlZvM2mPnGqkGiZNCMVBJOIExZRbEX2WL0/MxpMFaN534ZvwS+GCAOtxZutmk0Nz9+TV9+2tn607Srzb0LkbzaKp+IAPEmtIduZ6dmbkGtMcuJnT2bPthAH0V04FJZZcszpQLQyO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:52:37.9361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b30edf5-43ad-43a6-1fa4-08dea69e3667
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2C6B99E0C

The tegra-mc platform driver does not register any dev_pm_ops, so the
SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume) on
system wake. On Tegra186 and later this means MC client Stream-ID
override registers are not reprogrammed, and clients behind the ARM
SMMU fault on the first DMA after resume.

Register a dev_pm_ops on the tegra-mc driver and route the system
resume callback into mc->soc->ops->resume() so the existing SID
restore path runs again on wake.

No suspend callback is needed as the resume path reprograms all MC
state from the static SoC tables, so there is nothing to save.

Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC clients")
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/mc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index d620660da331..64e41338cdf2 100644
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
@@ -1010,10 +1011,23 @@ static void tegra_mc_sync_state(struct device *dev)
 		icc_sync_state(dev);
 }
 
+static int tegra_mc_resume(struct device *dev)
+{
+	struct tegra_mc *mc = dev_get_drvdata(dev);
+
+	if (mc->soc->ops && mc->soc->ops->resume)
+		mc->soc->ops->resume(mc);
+
+	return 0;
+}
+
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

