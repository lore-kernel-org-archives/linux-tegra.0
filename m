Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012053.outbound.protection.outlook.com [52.101.53.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ABA3A5E61;
	Tue, 31 Mar 2026 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956260; cv=fail; b=VVECxtNiint0LSx0JHTp8nYj2fKS8XsZ5hTienHt0jDErRdjALnLyF2vQ5jVmDysmKvXjZAE4wO07nRbHmT+wka/2FTJMhg+6xxPPbM3FnthlNYwy/ak6TYx20Co11uvB1lEdxW6FCniJYIDvzeH9OhDBSudrqQKPdUX2BPzs4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956260; c=relaxed/simple;
	bh=B20rldJrHnDxwH/DOOKMAlL/Ct9rX2LCTvKlDx6zQ2Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5s6etzWONFZm65ypZInSJ1jVEVxopbZSGOfOoTE8Ew9FgR3Cx93azOUQME4OhoiQGNWUqQWCH5S1y7GsZgAE0ijk/Ip4jalAZibU0a/8bZnmA+EbIu2PsT/ZXEILWMP4ptN0MkCsb2Iy4pHzO2iueDSrl56bPt6LeVE2RJ9yyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CZEbcX+m; arc=fail smtp.client-ip=52.101.53.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CZEbcX+m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSzvpnoH6KlPv1+E+iJst9D8u1aveSMBPHc10GWMl34WhtavMiOZjrNOqT6lw0fvNKwlGmESUyqWxjXUR7mbWKZYqgtLi9ZiPdAen+SWE6RviG0hcO26OEP5HBE52D/whEWKmGqzTI1MlH2Bo3vb7h8Eo6E1z72B3btFIfYXDZl57j6He9cJe1He/kFOIROwL1qMg8NNvuPGkr78E/zPPA1FxXk76KpRxeEuF+c6QrDCD0ZazPCcbFZWXMxEj+ujUCL/srTdaNywJjQtgglpMItSBcTqoSyDyHDJTlIu2QvS0e4JrLrB/+6tMYel3nAI6e8arLMMveCn7mG+fAhsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+VXDrw9C3kAi4qtY/MzuHfj/N/7Anss9Qi6PFri9pc=;
 b=OgR2E3/0QG5C57AM1x+FjXMxLtImJt3pPa2ANQjUHeDnGkJ89zcYu8UFzBp6LvjKqvegdr1/khbD+jErAlaxo/8esJX01AfsOO6oVtrLKN6etuF5WNU5UrAbzW6gN5A8p6v6IFRsvCvW58ZQMg6KAosy74a1M120zhdv6cMA9vvfRPIPacMPSuqiAhZGp+Tf3Fzst27TTXztX32QQPsRGXUjNuzJdxaUH3hAQVXtzGtUbglmFBiolptfciUyIuPWCZfH9yFaB1TiL6PVBXWwmYUrKMLe8+IXRTCpFF3HRacMhYdtW7COanuWDblIPwZcsQdpCBIkBQaS5t54HygEwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+VXDrw9C3kAi4qtY/MzuHfj/N/7Anss9Qi6PFri9pc=;
 b=CZEbcX+mES8/pP/XfogiUg6F0YIM47mZcFkBrXCvHA+lMbaDgSWM94hy7OS9PjREwmLW8RxR7MmXBVPvFpM3bsUYug297bYRk9EwQptc/Jd2Cj/EQV3chH6T0FF5OLn9Z9564nBoNUylrNQSdGuqcckPEBETH7I1qrXvvP4EMwYQA07oU5pTGaIfXqhPesb7OQopjyfnzsiGHbUafuTNP98jynAuHO0T/nrXYVVc1fWmXI7h4a8L5OnkNwu3jKULwbnATlOLhA5DOZB0km+47hq3rGaNpnjZvrDzbK1HmzYQ4u+0NwcOgMRTsZXEUTt8Nfhx7T+LI/00CMWXcMyeog==
Received: from BL0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:207:3d::32)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 31 Mar
 2026 11:24:11 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::9a) by BL0PR02CA0055.outlook.office365.com
 (2603:10b6:207:3d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Tue,
 31 Mar 2026 11:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 11:24:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 04:23:58 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 31 Mar 2026 04:23:58 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 31 Mar 2026 04:23:58 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<=thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <sumitg@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH 2/2] dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible
Date: Tue, 31 Mar 2026 11:23:40 +0000
Message-ID: <20260331112347.3897841-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331112347.3897841-1-amhetre@nvidia.com>
References: <20260331112347.3897841-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: d79b9700-e949-4525-b054-08de8f180865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jYAInSMIFeqgxgTJOyB8mn8/BLTWoOE06ecfM2MK+geiEP1va8dDW5olZgcTbCUUQ1+iUQeh4Rv3ajoSPf+pJ2buNU3tMe3eI8gHg2LZa3r2TUehwDqdO1IzLLE9i2WORQ6bB6Z/3uSLpDEqsQQXvsql65igGqNxm3KuzzCDo+MtIZDwVt/gSz2/rj+J7qmNwVLLqllNgly/sTC5bn1ob49BzgysmEMbdWamHzx87a63eT2TAmEXpKHoA3cY1/DdGNK0eGth+CkyzqcqmTlspueQZOpKXf3U0mWyTs2A+NgiRTundBKFT0uhCLVsIEA+fzSPq4E9eX07iHlfcEtEQaFtQyV+Ww017+kKsPc1xGtegu5dPOob1KFuaZvfEiVjcwqIhsEnByrDoxW8dIHmlbfKGy8H+RIMq3EfHxqlx9CnPG/h0I8b4ENynSpDNrjTCvYg0JxmPUcezhJzTlBH7tFSAjrpoW9mGVjDjHFYM8oyFjeFds9UyswpfsL3nXOgoTeXRyHZGQ0eLj13EgExPOzKR+DH03+jeBbK6ohvHBypvkrRvO45Tgw+W+nPROhWZLlgdtPEHG/m0IA2TxL+kLUqKCDT1YrGNU0dthACXG8TJkdeF+EwgdHOfmBcHT61l1UO+Kh6pGksD09HNcqX2oIZ8g5Q9zboc54aQM9f8utNC8xNTkjbu6Ek6p6wYcBhOX6pG/As5LYgCIZPAodWD6Px9IN60HOSWQoeXKBxN14eZJM6uoAsbhIzEk/E5tzOMyAZ+xzzEeDiALENO3B2OA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0HlP44UTQEc2+VurwnlxR1n5LsP11MzBse8ivgiRVcaiJFlSfseam+Yy86wbQVvv/eSDQPBDgTeaMg4y20uhjcma3He6fCWO8IaYD/cpwIsYyuM/e52E3RAww+Dcsq+EcqW2i4v7X9e6xWjas5vINX7Kwc9fFTmQ9wo47ZuwdKeAr7jKByszONH4dQI8kPnFXpYiT9U1MLJrzdicR0zYTihjOsqjAY64oofdEPO2hfYH6J3/aqfUJhWmeNDoArhJdVoPO3go1G3loeM0HGr8Yb+dHBiW/I1UEpw4EeQzxCzGMVV7e04bI0G7T4t0LgvlchrheOLim7qMdVFyfVHrJAqJ0FKCTgMpsdcAt4bc32oJOXHaMUZwEb34vPyUZRH22aU7kpfbuMpsEyr627cLiyPS3Oz1c0g/Wj+ybdJx/m2ouK4/OAaBA8za3t5IYr+g
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:24:11.4104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d79b9700-e949-4525-b054-08de8f180865
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120

Document the device tree binding for the Tegra238 memory controller.
Tegra238 has 8 memory controller channels plus broadcast and stream-id
registers.

Add the stream ID header (nvidia,tegra238-mc.h) defining ISO and NISO
stream IDs for SMMU configuration.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 .../nvidia,tegra186-mc.yaml                   | 31 ++++++++
 .../dt-bindings/memory/nvidia,tegra238-mc.h   | 74 +++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 include/dt-bindings/memory/nvidia,tegra238-mc.h

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 7b03b589168b..e008cb1ccd28 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -32,6 +32,7 @@ properties:
           - nvidia,tegra186-mc
           - nvidia,tegra194-mc
           - nvidia,tegra234-mc
+          - nvidia,tegra238-mc
           - nvidia,tegra264-mc
 
   reg:
@@ -266,6 +267,36 @@ allOf:
 
         interrupt-names: false
 
+  - if:
+      properties:
+        compatible:
+          const: nvidia,tegra238-mc
+    then:
+      properties:
+        reg:
+          minItems: 10
+          maxItems: 10
+          description: 8 memory controller channels, 1 broadcast, and 1 for stream-id registers
+
+        reg-names:
+          items:
+            - const: sid
+            - const: broadcast
+            - const: ch0
+            - const: ch1
+            - const: ch2
+            - const: ch3
+            - const: ch4
+            - const: ch5
+            - const: ch6
+            - const: ch7
+
+        interrupts:
+          items:
+            - description: MC general interrupt
+
+        interrupt-names: false
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/memory/nvidia,tegra238-mc.h b/include/dt-bindings/memory/nvidia,tegra238-mc.h
new file mode 100644
index 000000000000..be24c0eb3f15
--- /dev/null
+++ b/include/dt-bindings/memory/nvidia,tegra238-mc.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/* Copyright (c) 2026, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef DT_BINDINGS_MEMORY_TEGRA238_MC_H
+#define DT_BINDINGS_MEMORY_TEGRA238_MC_H
+
+/* special clients */
+#define TEGRA238_SID_INVALID		0x0
+#define TEGRA238_SID_PASSTHROUGH	0x7f
+
+/* ISO stream IDs */
+#define TEGRA238_SID_ISO_NVDISPLAY	0x1
+#define TEGRA238_SID_ISO_APE0		0x2
+#define TEGRA238_SID_ISO_APE1		0x3
+
+/* NISO stream IDs */
+#define TEGRA238_SID_AON		0x1
+#define TEGRA238_SID_BPMP		0x2
+#define TEGRA238_SID_ETR		0x3
+#define TEGRA238_SID_FDE		0x4
+#define TEGRA238_SID_HC		0x5
+#define TEGRA238_SID_HDA		0x6
+#define TEGRA238_SID_NVDEC		0x7
+#define TEGRA238_SID_NVDISPLAY		0x8
+#define TEGRA238_SID_NVENC		0x9
+#define TEGRA238_SID_OFA		0xa
+#define TEGRA238_SID_PCIE0		0xb
+#define TEGRA238_SID_PCIE1		0xc
+#define TEGRA238_SID_PCIE2		0xd
+#define TEGRA238_SID_PCIE3		0xe
+#define TEGRA238_SID_HWMP_PMA		0xf
+#define TEGRA238_SID_PSC		0x10
+#define TEGRA238_SID_SDMMC1A		0x11
+#define TEGRA238_SID_SDMMC4A		0x12
+#define TEGRA238_SID_SES_SE0		0x13
+#define TEGRA238_SID_SES_SE1		0x14
+#define TEGRA238_SID_SES_SE2		0x15
+#define TEGRA238_SID_SEU1_SE0		0x16
+#define TEGRA238_SID_SEU1_SE1		0x17
+#define TEGRA238_SID_SEU1_SE2		0x18
+#define TEGRA238_SID_TSEC		0x19
+#define TEGRA238_SID_UFSHC		0x1a
+#define TEGRA238_SID_VIC		0x1b
+#define TEGRA238_SID_XUSB_HOST		0x1c
+#define TEGRA238_SID_XUSB_DEV		0x1d
+#define TEGRA238_SID_GPCDMA_0		0x1e
+#define TEGRA238_SID_SMMU_TEST		0x1f
+
+/* Host1x virtualization clients. */
+#define TEGRA238_SID_HOST1X_CTX0	0x20
+#define TEGRA238_SID_HOST1X_CTX1	0x21
+#define TEGRA238_SID_HOST1X_CTX2	0x22
+#define TEGRA238_SID_HOST1X_CTX3	0x23
+#define TEGRA238_SID_HOST1X_CTX4	0x24
+#define TEGRA238_SID_HOST1X_CTX5	0x25
+#define TEGRA238_SID_HOST1X_CTX6	0x26
+#define TEGRA238_SID_HOST1X_CTX7	0x27
+
+#define TEGRA238_SID_XUSB_VF0		0x28
+#define TEGRA238_SID_XUSB_VF1		0x29
+#define TEGRA238_SID_XUSB_VF2		0x2a
+#define TEGRA238_SID_XUSB_VF3		0x2b
+
+/* Host1x command buffers */
+#define TEGRA238_SID_HC_VM0		0x2c
+#define TEGRA238_SID_HC_VM1		0x2d
+#define TEGRA238_SID_HC_VM2		0x2e
+#define TEGRA238_SID_HC_VM3		0x2f
+#define TEGRA238_SID_HC_VM4		0x30
+#define TEGRA238_SID_HC_VM5		0x31
+#define TEGRA238_SID_HC_VM6		0x32
+#define TEGRA238_SID_HC_VM7		0x33
+
+#endif
-- 
2.50.1

