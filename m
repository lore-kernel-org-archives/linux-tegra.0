Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EE337DEB9;
	Mon, 27 Apr 2026 07:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275286; cv=fail; b=Tp6HjHWsi5aabShoD1cDUJcmQiI6az8HjBjkn4FNms/QdUj+W9sX3bAakyNX1Y+v+0AeMzcqalLccgq8ac5sp4mmBE3P4E3ZWeRlg3lfc8A3mZlPgSBY+h1FozZKzGcssnpjIJIjUl4TJXu6lZXVz5xqyYumHqLwpkgjRnDC1Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275286; c=relaxed/simple;
	bh=ZIurds898gywzargE3Mmg73GkH/VFIbdCO0snv3KK8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clw+2dsNuAWhDFtBYXQt3/sNhxeaYdPkM3jdhJYiGxo2Ozx3d0GO6Y9sfPCKnPaCrv2FEKv7LTtoFfSIRyE9Mz0Vs93pmORHuVZuNRYOjY2zISf10fHTE75CmaTOcXJ0aNSFr03xtXmfihR42Q8pSADT9xas4xb7hNm8XMf9i+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fCu3/J5B; arc=fail smtp.client-ip=40.107.200.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fCu3/J5B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Knko0lE580gMCGxls36ysugMRMH9kaPTfid4G5CGig1TH2UIHt4bMXnp7sv6tm2VD8IzE/xkqeINBdzw1YIKI2uoWE/wDzzJO40e9XeHpmTQDk4To7jscw2q0H4WmpIlLA4bC3XMQqYtGAmIia3NVxwfc0a2XFZ4+k0YhLE0wUciydo0YB+Yya+zKueaqb5sKAEXt+nA0j3UnbetzFBgwLQBqJFeP1Z9Wsia/9NhTEFAVPrHgt/UuBJR9b9I2hGhnFfnOjTxcL8JE8jI22JpWlD+eMkEO2HpbZ8/RiDp0YyoQMvte6hD3lW4HtOTLUwv2YcMJRxW8CxlZyMRBTtYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amogAVzO+Hkw1vq3Tni3iQdYSoAqwzD4IwTh1LQsqH8=;
 b=wGlIy8x/UNgbxopr8ttlaQYjY2aQTVY73ndoWiM7gw1x3/tfhpFsfeo56KkgfNM7PtLfPLp1r4nvQPHEhGfgYJIwtYYc1Gx24oZ06xSKz5EnfR1sdo3T0mH8tSvUzk6CWhr445eKoF7GehGPFpvaTEpSzTgCTl/OKw11U5Jug7NKxqPblTeZ0U5lfmdImSQuwlJ4VI49S1fxGEqbu2N57PTadZq1GtaU3Y6ghN1Q3ID03qGDFqYbSJCgzNYLcXf1UpeWTI7G4xT7F1eJu+yHnbfCMubFhb2KGPIbpAW6F6DKiIjQU6X6bK4MdL2WN9gcsuQMgfu5Hg9cMn/E70VeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amogAVzO+Hkw1vq3Tni3iQdYSoAqwzD4IwTh1LQsqH8=;
 b=fCu3/J5Bzu3/TwlcUdk6RrtTzNY8IsGDe8ZAROURtDxIFVx3dv0KCr7XpKxpV/oNIuNZhvVfCVUL89jhojWKSNJcjcgnQCv/z/tl1E34PG7WEI5zt+9qvDckqdQ743r6iTM5CpcNR8vbLTsXTdzvP2sK3ieMp1l8TYPcModYCEEWC85iOtQPoc0WSRVL7DZCDKg/NxNd039vo+dcayEY5Rqbxg6gmwNKHgA0vw3QDkXeSZDUbp9owkg7lWwAN9R1N9vwj0YfLWhlKq1kp8+YI5pGcv/u6tl2W02wsYFkYP8dpwUW1dwklPt2CWgRcPN3Cn1UH7+HH/sberxvJmbj9Q==
Received: from SJ0PR03CA0223.namprd03.prod.outlook.com (2603:10b6:a03:39f::18)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 07:34:35 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:39f:cafe::78) by SJ0PR03CA0223.outlook.office365.com
 (2603:10b6:a03:39f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 07:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Mon, 27 Apr 2026 07:34:35 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:34:31 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Apr 2026 00:34:31 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 27 Apr 2026 00:34:31 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<=thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <sumitg@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2 1/2] dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible
Date: Mon, 27 Apr 2026 07:34:18 +0000
Message-ID: <20260427073419.567360-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427073419.567360-1-amhetre@nvidia.com>
References: <20260427073419.567360-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a1ba8a-f088-4ca2-bbc1-08dea42f6e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U69nvh13z+xA/oWX0Cu3d4SNlGiNdMyNKy1cwANOfN4pZuczne6M/oj1SNE4qCG5eYt7H2qkxj1RUpW1gfyW+TJzmFS5ZdnubUBl3FY+vDC0vc7KSZF4pMdfsr4zCgEpX//hafN6uU/ncIDqVtpNZ9tzEtj3Oqyrm7WhTQqA0zLpZITPPImHNj5MVuVo+CZpfTZgFeNYu8AGXFdPUm5gWFopU8unPRlh0d2e4hKGFr/r63lPrNUUqZ2y6K34b82FDMZ+L6rvsDLPbtpSNMAeTglF2JkWgakGrRisog1AwgJnV2v6OONSTuvv5JAke+Fgv+ntedJI9Sv0WHrIN4dXGD9merBYsCY/IXShqYLlIC43RwaL6CDjInIcCLAOuFr1l690IFRLSl5gETjW+MF/PTjCRXJCGhN719qe3aEjY+LnjYqXWAGBo7yzJiflXortQfVwRSkXTeFTiFx3dCr5AXdgRYFNQBZvBrUfKgUKASkgQzU8hDgccmqZO/T9W+t6+5uKQQbOYH5ntyymdo3zePKzjnHX4Hr+CD/CxQk2oy/R9OrzoekTdXelCFWu/o7cNyE7L7MtbJPXy1YlxKBPSqgNAU91FNzZn6h2osuMhC8Haq76fr+a4dgpfw7PK3LDBYsHSc/NBruYX4AcJLPyKC7zd9w4QAxjyOTsK0uJhaNl00qm/OzeAm62pAOFgkR80SQjoqsKoW0zHXc3UzagCLPvXQQIP37E0lXrEbEqdcaKC7oUrKmIhGxoKTDt+ZF4NeOIgakoFIXsYVqQFYdOZg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OMrakO0cT8gUD0uWs/7oRS4tHdjqES9/gJLIoHGappgJN1LdA9q5zurBFB+trh1EL2F6p7RJt3ouAWgK/P0Xxxov7Wz9o9Dl/AJTfQkPXWO2IJc/E+30/Y0nLK28t8ZYNIj/Lk8drpUz9bSbGS5Q8iuxJP1ALf/oc8OTnH3WDeS2MGNe+2w0x8WEgTi1eyl9RA7BWMsXPv25wtNK8q9y5bBkeCQUMYlywIIP4WHrSgbr+0LMvmtSblwdDwMch9tykjGmQ3HBK+qWr9hxilypp1XceG9gXo4o2KTvN2EUmkOMwolpyCDy/rr6F144gPgjb1Vme9oqwZQN6h7VOXp4chwSL9iVJy8FoR6AlDNDn3v8jIIALkCVQZRRtvD6phYabPvdTAheMsRtWV28mGVlYV37nuxidB5HaOAtSWNwf+R1b5FJnp8tUNZWiTZvsYT4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:34:35.6893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a1ba8a-f088-4ca2-bbc1-08dea42f6e7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094

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
index 7b03b589168b..6c374e2b1543 100644
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
+          description: 9 memory controller channels and 1 for stream-id registers
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

