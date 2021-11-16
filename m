Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B66C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 15:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 497A563214
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Nov 2021 15:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238615AbhKPP5t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Nov 2021 10:57:49 -0500
Received: from mail-sn1anam02on2071.outbound.protection.outlook.com ([40.107.96.71]:45126
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238545AbhKPP52 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Nov 2021 10:57:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePwU50NaLvA0nHiwSrqmZsFLjBLLs/hYybmCcFVM0bMRx9kmQ9uVHE0nxlTPkpJjzHTkw++g+97etGgcasPypMuN9ymeJ8TkUc/v59K7lYuE0aDve9oCI5vsdNMkcgRK3p+8/Uf4Iz5LgVRYlAzivgB0Lc6yp7IBuDzwRFAdDfOh+UX4Skcu4KYVWpbWW0FbRDcge3kXmAzsaW2ObSO4BKCXvONak/D9fBzcV6gbpt/1BKnBW08oLTD73CqQM1SshUsyA3Gte1bicgfz3tVco2O2vEvcCrVTQyUyBJgZn4gplBwdNh30Vj6ywNFsxYdsmVsLn8WZBc8COQDj9FusLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKaeI8GJO4gcUMAejjw7T4zdSbub5hIvV7S7kSnUyXI=;
 b=MtSHqZwhpvGPBH56bU2UMI7bqgG9Dt9YLBx5ZjhaB6fkKmAnVqtBO5b4ij/dkVMKlDvUigEUAxTXFMkr8imT9hr1uzMTBODlN8rTY6JMNYODQqWEXynFMeG6x57HvB5a5YK3/jccEYP+cnr/586m/PfiQrU6wNqT5N1UWJ4gp187YWOdjLJOcPzrCIntRAUlyBIhPDFgEEQikwD1/EUBchID+z0iyhMoRAx3GPhP1teNht1RjCKk8/xffBm4fp5Ie72XwKTr7l/CE8ExPFUxF9PqfwbP3K8pk7UGGISP93DRY4yRLJJXCX0pZd/kjqorEYNZKdkyFLJESb76lRGs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKaeI8GJO4gcUMAejjw7T4zdSbub5hIvV7S7kSnUyXI=;
 b=kEyRVPMHVxxex3L+st2D3KuIxuhYipfkWyrGIzu1ljkmzLZH2RZM6riwJdMXSDYoHCXG9ggxbTPYpt9jKu5OIwkmG+gk9jeEYSb0zqJ8awljKid+Jcv3Y34rwtJRTgqX2L/19urHp4f8SUQMO3IrIiTnSlC9SXSYGPAqYqdcKd+txYuYeFXsLRnMI5hQPRgN4mcpkOLDdVBOhHGSEj0EhX6dhDqo2OvW7oGB6bvZdFMybxqKfmJ1WZb1e8v5Wu6d/w2G4sJyATlOF4/3DBOVIaDH0IPnnguICyxm325+mQPjU0aPSqPl0RF7weXmBR2GeL71WPYT3JUmZ2uFtDD9tw==
Received: from DS7PR03CA0209.namprd03.prod.outlook.com (2603:10b6:5:3b6::34)
 by MWHPR1201MB0141.namprd12.prod.outlook.com (2603:10b6:301:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 15:54:28 +0000
Received: from DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::b9) by DS7PR03CA0209.outlook.office365.com
 (2603:10b6:5:3b6::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Tue, 16 Nov 2021 15:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT026.mail.protection.outlook.com (10.13.172.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 15:54:25 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 16 Nov
 2021 15:54:24 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 16 Nov
 2021 15:54:24 +0000
Received: from moonraker.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 16 Nov 2021 15:54:23 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
Date:   Tue, 16 Nov 2021 15:54:12 +0000
Message-ID: <20211116155413.164242-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e6ef6f3-2df0-44ea-6a7e-08d9a9195d72
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0141:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB014120A2E4BFE1864322F2D1D9999@MWHPR1201MB0141.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yw98o8xb45ILbJVt/H+u1NsmL6HLPrcy8Opj5iVH5ajB3BLhYvWhdyf45rv0+d63X07LnKk7+OOVlskjsHGNWQvksKmvzUUhHK0Rc6ccag3uFZEiuSzAHruFtOeSbj1qkzgfzKEdu5kcDY8BZm8HIpPGD1gxUJ5qI8oitV7HK0azawUjLZ7Gary4LA38Pizs2aBBNw6B2ZN1hjx7Mqz8OnG5eez7dRKyNFpjhDOq8JldHqM7IOyu1iH0fdT0wwhK+qXf0DiZVos7B9F1LlIzJwDZdEBKCZP975TsBdauQVN7PLHxxpvxW3AxY7tewjOQrSkR/pHQHk6egA0BfCol1kiPC37QEKzdRTi/bU1E81bvdX4hlLEQxj3U531giMf5lR6Z805n/nWxBikOn+N0VZaeHJVEc7mvtiDFgzl2uP8suMIvxStQVa/BeIKeGrtfl+txShkCs/VVQ1jwf8mQrzoA7Crbi9UO9KVnrL4eHLGojpiLTSVxbfCdcOsttUtlG6sPre9l+LfGkWgva0YrS3nzQ94C1ApaLNXE1nkSyY+INa4ZIT2CXRTZ1fBGAZ/M54SHkDeu8i/GFNXQ7t02itDBNsMwY+WNCoZaq/HYt3ywC7VvhaoyvTfuQLu3wAYmbZzbA1ICAO+7G8qFx03dKVdUjG00lbIKI+ozMO/KVgS8DsEltHEDLEIknRvPSVMYQ9krUU4Q5M4I+ZnA1m2N0twkjWT+Vo6mVdxmQQwNwPJZRYNqu5K33/G9DV5T4IU+LvxZThUSdgYruK4Prmd2AK+oS2m2ic6jCbIOBpRgOiJXwl5L1x4TteTkIsOP27E+tNnWwSSZC9JYK4xFrgIKsw==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(7636003)(316002)(5660300002)(54906003)(86362001)(356005)(4326008)(2906002)(110136005)(7696005)(8936002)(6636002)(107886003)(8676002)(186003)(82310400003)(508600001)(1076003)(6666004)(70586007)(70206006)(26005)(36756003)(2616005)(83380400001)(47076005)(36860700001)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:54:25.5672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6ef6f3-2df0-44ea-6a7e-08d9a9195d72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0141
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
engines.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Fixed errors reported by Rob's bot

 .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 135 ++++++++++++++++++
 .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
new file mode 100644
index 000000000000..93e10169c079
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
+         items:
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

