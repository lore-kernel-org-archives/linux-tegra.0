Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177376;
	b=xRNYqiDzvsQeu4lnAYMdAYypKcn2t6AesrRBw+uWG6BSvG9MsjJK9lkcht6BBlDKUoVS
	 wfMDZpjseIy0RqtknWqxh+GLU314+yPOGTkXRb8wyKATRvv5UnFo7nrCIJl2MPuUPb6wE
	 D+4hhfnB0mYd9RPJajq5OlS4q/H72UltSGfq2F9kDZfZpRKK5Rm2zlZ+QU8ws9G+sTftd
	 6/wNthuvFhXOq6xBWNDnEyq3LLKD7IUVQ4iDN9C+jEuF0LdWFNS6Ahla3XxF0F52kjdFJ
	 D4C1c9xqyjRnFOhhuYuOXCfGomanmUNz7QbYfR6C5/x/zyNDT5km6JsVTWPWB9zPdsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177376;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tGkZ37/zC06Ljml2cROQ5b9F/JqqDikx7jjKmAJ6A6A=;
	b=MK+A2MmkfHHDPow088vyQ0T13wDtPt/qraRgw7Y6t+aJ7Y8YB4IYhLYzS4iWewRyJ9P5
	 LfN3lKtM3Ph4g8jmID2/vhuuJ1yEnG5NxEEnnk1Le3BmrpnLHJqWjlG/dlpPb22y+w0Lb
	 OGg6P9eaQ3Eandt5vQO1womWCT2tqiqAiEQsVAWUjOiGuZo5DhNOPloFmLA9Zqz+AH+Kj
	 fMpidofJ2C7lGuZG++hCQNVHDUeWK/i+hhoAgflAiP7vpumfkuyrMM4uZTezwTnf1jM1E
	 nCSirF+buFyrXKrG+uNcNNQGhtciR1ksKKVCSfkECloy/aiMCSQbocrwZev9mtVnb3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WbWVfNoc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.55
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7B606A31D;
	Wed, 28 Oct 2026 08:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WbWVfNoc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7cmLZVQ4SzqrZj6ppErsozAR7dPy4l4Ips6DkQ6MG0GZodjo0h+0Oyg0PzQpxr/KaPD1bvINMlv21Bh4q9hsoQEiWFuzOsjZoYuLmQy9Czy32SHpSPIJeObZ8bjZ5k4oHI+OokHBR301n5GkPV6Em2w1jV/2GH1CrftWH1Cb/+VHLW5AQVnxviF/rmK7PbzW3Wc6yMz+9QLuBA8ziKqAJfwVXOyaViix1ptZ1L2XpYgj6/0BUDvmmDvgmMlSWuBqCCcUep0dqgGcaiWk5NwftAQpDw8ZC6GAA0+7h1Iya+DxLnK/QHDiBqVVshFbbP0mKwXHpcjSn7GVVaI+vNzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGkZ37/zC06Ljml2cROQ5b9F/JqqDikx7jjKmAJ6A6A=;
 b=IvJxDCGnKcjb6cxVIlNzzVcjN+AZxp7zVjIyigUeOhPA3fZ7Xfft0A5euZ80Nla8tlukXSQeh8DrprtFwbMu3nsKC4G2HzoqFcatqH++7s3YOhXp43QHXD8gO1jR+clvzWK4DH7yZ8n1ciDfrV/iRHHu1cLuWMii/gvQblpLsgSn39Q8uisHJ4aFXB/YHXTmRABfy3oSz2dNCLJ4/ZarzRa1hOl/cWVB7ig4DaZjTexVfIeUyk9egdTT0dnuoCx25mY4iDTy5Iq3cwu3Hqj6wEEuRDQ7RFz1a57/pTR/XXC+E27FRW7fqGBGk/XEKlHUX6yd5YomvqLNQWKhzYwEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGkZ37/zC06Ljml2cROQ5b9F/JqqDikx7jjKmAJ6A6A=;
 b=WbWVfNocXGOGkIMEVwib7Z9nq/Zsf0AoS4AaZdrBw+1wIe/7D/tlY5owKmBjc2M/G1ZpORm4csfvtps7DY0AOoFLYqTn7jb7v8ko6xDE/KgiBrDSzDEoj7Dko+LlrKScFWE0lIIGNoDSMCq6CObRJqkmD67lxoyj60rXTasjJB78N5hLJ/LTkoZQxZ0nU5FKEEJdH/R/BWzhQDY8006N5B4h2pO8CNaUfpHQ6Cwh3NYHI+HDuxFWsuElCO1hTFxGGM/tVtdrF8bxq4ofkExMKclRsehRbVhPtocvH2fySsjablRz/9hqxm192w/yzr71feumPEtD/ye3ly4NRQ5c0g==
Received: from BN0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:408:ec::17)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 08:49:32 +0000
Received: from BL2PEPF000352CD.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::54) by BN0PR04CA0102.outlook.office365.com
 (2603:10b6:408:ec::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 08:49:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL2PEPF000352CD.mail.protection.outlook.com (10.167.249.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 08:49:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 01:49:18 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 01:49:17 -0700
From: Johnny Liu <johnliu@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH 3/5] firmware: tegra: bpmp: Add Tegra238 support
Date: Wed, 28 Oct 2026 08:48:58 +0000
Message-ID: <20261028084900.1047287-4-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028084900.1047287-1-johnliu@nvidia.com>
References: <20261028084900.1047287-1-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CD:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: 603368d4-e1ca-455a-ce44-08df34d06290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|921020|56012099006|11063799006|261009223027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	vznd/Armg5E1xI1vlPyy3RY4ZUz8KFNy1IpHozc3d8iyyM4cUDO+DN5Qu8jhpGRc0QZ4UQbu6ZmsuRLJt5jVOrenMXeoElRht+gDnDatOM3QcI0yRX9mBIi/CJMddG4an5OHBmCJJbA2it0JNt5RlLAzjZF4y7X2R2QDmL2Y9CNi1eM3QAXHYPbq9J+0527byFuxCu1+zpADA/Ni6EUH5zrHczfjH8BuDz5YQUCJbbRAZzXslI3Bhqf1TsD+28GOKu8ndOayGRMDs3+jfsFYozcSDbzhV4Fkrw/sUvLCdK9ugn5+hcKCbKZi6kVhGNmh2O9vklZXkLY1AgZkOxWYmojDWs2CekGxG+mH87smcRNTtVcqu23kJnkT7MzNqh4ceAKfXdp2cD51XWlncLLlIytXPz+Bo08DCyhP3t8eKfMkOCBUKtO5iiroGdYgUI1jmbBtUuBlK5IiSYvu35KJo3UIoGPIpBWfJNHvTYZ1p2oqs7KXmoYmZ8HhipRfxNZtWoEynutK0NH55SxvyD3TnmLmo0M51FIKsEyQBUsvvNCMJqe34x8kFPKVsOsAUsQq6M0FhCSijKfaoOW/7triJB/P0ckP2oupuoOrTqgTNMp27QeV31OLKjVJWf1+Tf3natXqWE7HDzC9Qe9sCN8i8kKxRAlC81OC+EJAeUjqQAUasPqx15m9TRo94gSInTW39OsBAsSQFIV9Q2YhTZSL4vOzbGju+zZY5F1FzHa/ztNyk7Ixs8ej3t0usaGOlZ2r
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(921020)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CYgmV/qHFKTxcf8OadOgl9jOIb5Xw01oetlL0pZxVkJLwtiBHBSY6Js98857YGaXpFk/5xYYGUpPz2gXT//MyL3Hl+luD3VpP7489KWk2qA8vA46//sBv5Qtt6wie8zYHznXB6Ynp1nTGV69H2uRkkS+Lgokukfg2H/H/TJtejrzMNzK2M/pzAGVuSj9rMckOwSK0qYQLnMZxnrSRa9sW7R9NuqSoY1cK7dGgcu8hC5Dzy3/tTcLECljxa9Le30YRKBrGnHkQVYVJ+h+m+DV+uAQGTcI/wukAL0wCVLtaq4aWaGb82JRStXW4RI62qyOznyIqLailB1ivlUZcBB70RRGrwbJnPQKNMmQbQryBeh+wTaqFBOjNpgMXlW6Qwv4//iIQUpn7xWV5+2+UKmmFC0nZGZWiaZqEyR7+SUJAHM2z9i1tRDnHx7eDyjrQFNT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 08:49:31.9499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603368d4-e1ca-455a-ce44-08df34d06290
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17

The "nvidia,tegra186-bpmp" compatible and tegra186_soc data are shared by
Tegra186, Tegra194, Tegra234 and Tegra264. Tegra238 has its own BPMP
compatible, so give Tegra234, Tegra238 and Tegra264 dedicated SoC data
selected through their specific compatibles, built on top of a common
TEGRA186_BPMP_SOC_COMMON initializer. This allows chip specific
properties to be described in the SoC data. Tegra186 and Tegra194 keep
using tegra186_soc.

Also build bpmp-tegra186.o and the shared match table for
CONFIG_ARCH_TEGRA_238_SOC, so that a Tegra238-only configuration binds
the driver.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/firmware/tegra/Makefile |  1 +
 drivers/firmware/tegra/bpmp.c   | 54 ++++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 97f7a5db9d0a..21e87f3afffe 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -4,6 +4,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-tegra210.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_238_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 tegra-bpmp-$(CONFIG_SYSFS)	+= bpmp-sysfs.o
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index d3508e98e338..beeb385870f5 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -1131,25 +1131,41 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
+#define TEGRA186_BPMP_SOC_COMMON					\
+	.channels = {							\
+		.cpu_tx = {						\
+			.offset = 3,					\
+			.timeout = 60 * USEC_PER_SEC,			\
+		},							\
+		.thread = {						\
+			.offset = 0,					\
+			.count = 3,					\
+			.timeout = 600 * USEC_PER_SEC,			\
+		},							\
+		.cpu_rx = {						\
+			.offset = 13,					\
+			.timeout = 0,					\
+		},							\
+	},								\
+	.ops = &tegra186_bpmp_ops,					\
+	.num_resets = 193
+
 static const struct tegra_bpmp_soc tegra186_soc = {
-	.channels = {
-		.cpu_tx = {
-			.offset = 3,
-			.timeout = 60 * USEC_PER_SEC,
-		},
-		.thread = {
-			.offset = 0,
-			.count = 3,
-			.timeout = 600 * USEC_PER_SEC,
-		},
-		.cpu_rx = {
-			.offset = 13,
-			.timeout = 0,
-		},
-	},
-	.ops = &tegra186_bpmp_ops,
-	.num_resets = 193,
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra234_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra238_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
+};
+
+static const struct tegra_bpmp_soc tegra264_soc = {
+	TEGRA186_BPMP_SOC_COMMON,
 };
 #endif
 
@@ -1180,8 +1196,12 @@ static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_238_SOC) || \
     IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
+	{ .compatible = "nvidia,tegra234-bpmp", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra238-bpmp", .data = &tegra238_soc },
+	{ .compatible = "nvidia,tegra264-bpmp", .data = &tegra264_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-bpmp", .data = &tegra210_soc },
-- 
2.43.0

