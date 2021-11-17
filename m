Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29296C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 09:56:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F06263244
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 09:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbhKQJ71 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:59:27 -0500
Received: from mail-sn1anam02on2076.outbound.protection.outlook.com ([40.107.96.76]:10433
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235741AbhKQJ70 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Nov 2021 04:59:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzj7ajbWhfNxmW91bm3+lwT/0BoaOrv0ym63zG9fTNvhulYc8T5qifmpflUHubYBG9iXYHivhur3xGeCrZ5GjfB+jqrsXBGbgKXc/ztGK7oDDsh07bFro2iPehXYfFEa1Hb6TnnqqZjHBTh+VI52L3W3yIBwRFvijDxiQvlg0CrmrIFMvlmaCXmJSFTJ3dWsmX+F6d1oBaNCYb2E2jNsfzjKUREC+sTub3fEX+Sg7n0RaUl+jFxLv6zFl3ezRPd0CzPCh0VTsV4+Z1Ru513S+fX730tiNFRndIDk5qW7rlK0bnaS2Rm+vFEpLXEb/Mdh5+BSnwyoxQGg+Azyp755iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX46un4wkzovF72nSCtTQmW5ENCaTcrFLgi9cGA+kl8=;
 b=l4H6RuJzd/Pey1SE1HG46f9owprTVEecD81XZc8z+9JHjSIIt0mN4xIj3uDjegz2UB49BiJzIR/UY8hkzOFwn0cC8RoKONtUBJac/WaSpb70Pw0i/sGTwmFpuJneAd5mcSmwai+fVBw9SXHABJus9oUL9KN2dNDBmAov+gwBDfEaTrzkqo/SOaBAC8epfvCRdRGbH9yvHJzO6hNaiOHN5rqeWZSAnBAR241oZEe9RkUSLL4AonEKkBMQGYswnIwTTnJMUxg0dVtv3Lrt/CgsjKO7gvYb24Lw07errbQOYHHep0fZxco1lc4s5OyP5OF5vx4WaEnWhSx0UptOxHnRuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX46un4wkzovF72nSCtTQmW5ENCaTcrFLgi9cGA+kl8=;
 b=RSJ6bF4EwYSgUk4mkuCTHkl1NHfojT6ZM+qNPoVnqlGfAi496QfqZj2jaTnfNZMMKvx22JTjuivF901/RCw/PRzxJLAAF5zGWXaJ7r/TpfljKVfqolPFuVSCMXeP4mhY8M7fHajPJoG7pdoFeKhomH+Irg3qoVMiDKdsn7VHDwgb06U44i8tG8vRlpj1EEQni4ol0q80CkkCvgmZXLcb0LaQR3OFgRoYxcxQCjyz59IhvnqzitSVAdgmr9nJha4vNWU/c0zftrdjcZ4RHktKZ+82cH8QmFvMwbtcMH6RFwPQDhrGhOUuxvbLRs+eZNmxgQ1QQMTI+Lm2rlu2xEhPKA==
Received: from BN0PR10CA0008.namprd10.prod.outlook.com (2603:10b6:408:143::27)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 09:56:25 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::3e) by BN0PR10CA0008.outlook.office365.com
 (2603:10b6:408:143::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 09:56:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Wed, 17 Nov 2021 09:56:24 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 09:56:20 +0000
Received: from moonraker.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 17 Nov 2021 09:56:18 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
Date:   Wed, 17 Nov 2021 09:56:07 +0000
Message-ID: <20211117095608.60415-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3353121b-ed78-4207-0211-08d9a9b084a8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4143:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4143EFFEFE6EFAF45317EA03D99A9@MN2PR12MB4143.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mawl7PRPj53qkMjNOtVFMFDFY8Rm18gorc3lmDv1Xf/IwzfnljjNgYr5460c0qsb0r9pume7cXol99rvOk1zdwYQaYOpqk1kU1FoHMgsgj7b4e+4uLbi3AoQAGAGKQfPYPbl8UAjuLBjEbLBmEifLBypflNxwULCfs7oSlVpcDeN64ePUiboGt4oCkH/vrWn3+zsjcKuDcLcvW2I5D0dD840ToEsjg/vtZtqr6mBDZimpmCZm/Uk7crYVr5EUw2zCzk+nyrb93nGa38bTPaKHFQRHu9r9iTBxTUDivfs6bkn9JCxAmClnzPBAVq152G1eNICtH9vm4XoVj9GG/rvq63ZcsG0ULUunssgQW1Ti18qn2DHKv3Vx2jjREPUNOgl3XUieEkRRVmJ2F1ALX1X8tlpY4qGOalib9ek13e9Yy1SdeyFMyXkxflsat5JTYyIR7GGXMBa95SqTQR2TPH+bFxgV+6QVs7ZtJwtHFq+dsCsrpYTbLAj5UelWXPj/oTTvGKTE4Fsr8Uuz06NhtpTjbux0jNWnIdN0fAj7bfLthCGNPKzeXexKgDcaViK36d35kTuMGMapJkwnecVe8GNb+1Im7K7zLdoDD5vVeEQZWoMYD4Kdg+fV/xo0D36UEWWN/JEq1+aaZHkb0tIPFnpQPTriRasAMN8mf2X+c8ThRsUQ8jhAxPdpqPwB0FaAlGAzBllABnWRgTH4lgQJx2zxvk8KHo9Y2P4cMGUsjagbUuRW1jXP94ptHcvdcCIMLoE99qevlHk0WytnMo2SegECNBRbCLIlfBbPil5PYUd2jwPrzMQBu/8XS52BPYIZXJ24nJvJl/5CRycTW+ANybXqg==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(107886003)(4326008)(8676002)(7636003)(7696005)(5660300002)(1076003)(336012)(36860700001)(6636002)(86362001)(8936002)(47076005)(186003)(26005)(356005)(70206006)(508600001)(83380400001)(2906002)(54906003)(110136005)(6666004)(82310400003)(316002)(426003)(36756003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:56:24.8170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3353121b-ed78-4207-0211-08d9a9b084a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
engines.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- Fixed indentation
Changes since V1:
- Fixed errors reported by Rob's bot

 .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 135 ++++++++++++++++++
 .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
new file mode 100644
index 000000000000..e63ae1a00818
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvenc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra NVENC
+
+description: |
+  NVENC is the hardware video encoder present on NVIDIA Tegra210
+  and newer chips. It is located on the Host1x bus and typically
+  programmed through Host1x channels.
+
+maintainers:
+  - Thierry Reding <treding@gmail.com>
+  - Mikko Perttunen <mperttunen@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^nvenc@[0-9a-f]*$"
+
+  compatible:
+    enum:
+      - nvidia,tegra210-nvenc
+      - nvidia,tegra186-nvenc
+      - nvidia,tegra194-nvenc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nvenc
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nvenc
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  interconnects:
+    minItems: 2
+    maxItems: 3
+
+  interconnect-names:
+    minItems: 2
+    maxItems: 3
+
+  nvidia,host1x-class:
+    description: |
+      Host1x class of the engine, used to specify the targeted engine
+      when programming the engine through Host1x channels or when
+      configuring engine-specific behavior in Host1x.
+    default: 0x21
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - nvidia,tegra210-nvenc
+            - nvidia,tegra186-nvenc
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: DMA read memory client
+            - description: DMA write memory client
+        interconnect-names:
+          items:
+            - const: dma-mem
+            - const: write
+  - if:
+      properties:
+        compatible:
+          enum:
+            - nvidia,tegra194-nvenc
+    then:
+      properties:
+        interconnects:
+          items:
+            - description: DMA read memory client
+            - description: DMA read 2 memory client
+            - description: DMA write memory client
+        interconnect-names:
+          items:
+            - const: dma-mem
+            - const: read-1
+            - const: write
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    nvenc@154c0000 {
+            compatible = "nvidia,tegra186-nvenc";
+            reg = <0x154c0000 0x40000>;
+            clocks = <&bpmp TEGRA186_CLK_NVENC>;
+            clock-names = "nvenc";
+            resets = <&bpmp TEGRA186_RESET_NVENC>;
+            reset-names = "nvenc";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_MPE>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVENCSRD &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVENCSWR &emc>;
+            interconnect-names = "dma-mem", "write";
+            iommus = <&smmu TEGRA186_SID_NVENC>;
+    };
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
new file mode 100644
index 000000000000..8647404d67e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpu/host1x/nvidia,tegra210-nvjpg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Device tree binding for NVIDIA Tegra NVJPG
+
+description: |
+  NVJPG is the hardware JPEG decoder and encoder present on NVIDIA Tegra210
+  and newer chips. It is located on the Host1x bus and typically programmed
+  through Host1x channels.
+
+maintainers:
+  - Thierry Reding <treding@gmail.com>
+  - Mikko Perttunen <mperttunen@nvidia.com>
+
+properties:
+  $nodename:
+    pattern: "^nvjpg@[0-9a-f]*$"
+
+  compatible:
+    enum:
+      - nvidia,tegra210-nvjpg
+      - nvidia,tegra186-nvjpg
+      - nvidia,tegra194-nvjpg
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: nvjpg
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: nvjpg
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  interconnects:
+    items:
+      - description: DMA read memory client
+      - description: DMA write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: write
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/memory/tegra186-mc.h>
+    #include <dt-bindings/power/tegra186-powergate.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    nvjpg@15380000 {
+            compatible = "nvidia,tegra186-nvjpg";
+            reg = <0x15380000 0x40000>;
+            clocks = <&bpmp TEGRA186_CLK_NVJPG>;
+            clock-names = "nvjpg";
+            resets = <&bpmp TEGRA186_RESET_NVJPG>;
+            reset-names = "nvjpg";
+
+            power-domains = <&bpmp TEGRA186_POWER_DOMAIN_NVJPG>;
+            interconnects = <&mc TEGRA186_MEMORY_CLIENT_NVJPGSRD &emc>,
+                            <&mc TEGRA186_MEMORY_CLIENT_NVJPGSWR &emc>;
+            interconnect-names = "dma-mem", "write";
+            iommus = <&smmu TEGRA186_SID_NVJPG>;
+    };
-- 
2.25.1

