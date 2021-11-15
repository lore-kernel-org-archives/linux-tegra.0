Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3360FC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 15:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2033361266
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 15:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhKOPU3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 10:20:29 -0500
Received: from mail-mw2nam12on2068.outbound.protection.outlook.com ([40.107.244.68]:41283
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236465AbhKOPU0 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 10:20:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gseSOF/ROTrUTV6wMdhQpXXo7AtB4/nfK1oDo/mcQBcyXGRiXFENtaOQW5isj0r5aqY/AdvfaNQOH+1zGbhQ8H7anJFYGaxEEh7Pi+qP3OBTo8WTpcWLqPccsYqfPf5NnM9GrctbASb/U0mrUJPqWEiqaiyCh35wE1eSj2iG1F3cNU/aAWEx+91Bbews4jGuT/snEQPJRbSC3Pq4PTYQe1Ot9d2+jo8RZvqXKrD4TG4w56d5lxreA/kuDhlblb3MBFPZAXyChmHVeOPJNPkx0qw6Yx0rs/ZgLwU+rbvd2b4m7M/ylOJRz1pBgroIH5hA55cqRvyo9k/zku1QgaPGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oaccqM4gwmU4z9wUARyq2NA+z9i4vUMQFKWrx3fiPc=;
 b=Qj2d4Jnk/egwbwJqocBq6Vkwk4qAYBYj+PSYjwYr4L8kOuc1x3bwCDT6cCR7QCr/zYz0nPFgJNbqe7YiCNbsrlHkSN4ihaw4iTTw6McXHV/Si7nM62ZBSMJq3dq8erycQBsD5ZvevjsBYX8pJhna92QLiGqdpflsmhb24KPQALX/8frci4LpzM0eYRBVD0B9Xp5ZTVSjXQEbr+S5pW4cn1sIfolF3TmN3EVqvo0/4W/r6AvoO6Sf27RDkVrGpqxLvEwbdkdhXrB/lTjttqjsHT2/sMwmjP/NGA2k1H9XIlLAIUtOhN9ml74hbfhywcHX95i+HGdbWwFUVCcPm1YpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oaccqM4gwmU4z9wUARyq2NA+z9i4vUMQFKWrx3fiPc=;
 b=lRphNR6LjeQ0daBut15hyLAUzKzC8x6PQZ7+iu+41XcqgrDEIFRhZXB9b39yOc0cJ1a8aXuk3KpEpqtwBSP57CgCompbLH+l0gXyLvFMv2oN6HysmGdACSEyAqVthhMAmFTDAzOCdc8jn9ux0nrc7QpHXy1n6a97G7bK3lraeqKgIW/N9MlUz5u9bwDVKLJH29yGEC/+9gXxRkY/hrB6Vy74lZ7+ctnR572w+dIClvleENGHAZ77S8gIGHsC1vMz+7NHV9ThebMDBnwagJYvSN5wUfieppYHSh42ee2aL3TU09AqKlm4cRb53UKi5w06v994lddVZaMV0rzpsquzWQ==
Received: from DM6PR02CA0153.namprd02.prod.outlook.com (2603:10b6:5:332::20)
 by DM6PR12MB3082.namprd12.prod.outlook.com (2603:10b6:5:11b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 15:17:28 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::2b) by DM6PR02CA0153.outlook.office365.com
 (2603:10b6:5:332::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Mon, 15 Nov 2021 15:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 15:17:27 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 15 Nov
 2021 07:17:19 -0800
Received: from moonraker.home (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 15 Nov 2021 15:17:18 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
Date:   Mon, 15 Nov 2021 15:17:06 +0000
Message-ID: <20211115151707.287764-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 042973ac-eddc-4020-9c31-08d9a84b0938
X-MS-TrafficTypeDiagnostic: DM6PR12MB3082:
X-Microsoft-Antispam-PRVS: <DM6PR12MB30828E4D44739E6067F0CFECD9989@DM6PR12MB3082.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yg/NN9fJZ6CZntG9QtP8D7Y3f52CIIg3Q4BEdFq7BTZ6kkJSWJp+90NEMoZ5zSUjOnSW05z2U3ZqLCJOYUHcZVACGyu6kOH9EyVpjbGLdNbXx+NrqVLTa4MeLb7mPRGi3FImfuz55Llamt4azyRY8RBYq+WzR1XnmFeefSjySlHAt7tWA6GLCcrK9LTEBNShTRrIOfPbCVBfO738Wl0q0cc06oklK+dbglX7sBPjMA6ZpmCz9ig1y2tSfSMATH66Evp1goYktpkhuA1jM0o/fqscP4D1tcR9yBBN+3SLVRztfTVWnUFO8BjU8ARfNz7Fcu7VhMM91ZBdW7cE3R615CJfMdFONTxJqCjotOxwLmLhw/A2CIDZpbNaQpWqWvHpmeTMXkPib7/gx4y8ECdqtAZDM5+8hw+o3bcbDYWx1gSsQCYdsJpQgWQ5gd/JSWSaOr6GF7WZv44pVQ4YzyMCs+n+9Ga8wD9lNBMYs4b26azlACy0wGUJGMSVrG+FUFIL7dbkcqV0djDtrCTCr2d7zRw5uzArcinCt09JC9K+aDlKKpYR5rkQ1/VV4OxARv/S662rZAJ1o5PC+nuL+ayRSqara1fkR0/dr7QLEYU1EgWmqfhaO/JfhFrexJ3BU6PLOG4uOhxSOm6Xh24HdJk2BrDLvkPQUzznUzvn0vrKKTeeVKnPeAmEY1GtOL14mmbKdYNhRihemRi7RcPFic9HUEcOxK1Aamhq9KIOE/l6xfCLC5CJDfx/t5TmfIZCc3eT8oDXgZYJ/XaNbZ0U2aJ6KEPmZkErSSdaYoEzcirkAEnMqA34+miSSvMTjoM7MfJJMrqMlw3CLryV2ok2EQ919A==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(110136005)(316002)(426003)(356005)(36756003)(2616005)(36860700001)(70586007)(70206006)(6666004)(47076005)(336012)(8936002)(86362001)(54906003)(107886003)(4326008)(186003)(6636002)(5660300002)(1076003)(508600001)(7636003)(2906002)(83380400001)(26005)(82310400003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 15:17:27.9185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042973ac-eddc-4020-9c31-08d9a84b0938
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3082
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
engines.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 104 ++++++++++++++++++
 .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++++++
 2 files changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
new file mode 100644
index 000000000000..5071832ce23a
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
@@ -0,0 +1,104 @@
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
+    items:
+      - description: DMA read memory client
+      - description: DMA read 2 memory client
+      - description: DMA write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: read-1
+      - const: write
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

