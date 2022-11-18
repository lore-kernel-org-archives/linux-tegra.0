Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6398C4321E
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 15:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241768AbiKRPkq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241949AbiKRPkp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 10:40:45 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E5673BB4;
        Fri, 18 Nov 2022 07:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/KPc3/J5MQzGL2SHuaMi0ET62P8hNPZDa+mN/+mSbmGX9sbneE3hXvQ8LctMTDBm9U9S2U9KBiNJW4sisF1vI629c1LT0IUD8dLdhVCUNFcDIDn87RcGwO43Vk0tmAxFG0q9q5cnYal4cPC5l5dJOYJE9W5ZmpDwL9s2Bj7jYmFtVNZjaF+1p4OTygyRhE6moDgNwAm41WpiGXu2PyGwFsRw6C+Qn5n3QJ2hu2vsBxNe5Z7iLQoWItqWs1UoN+yj9mt2TQP+RgvO3G96+ZYarbhwHkC1y/qdE7+s0bCHxpfXj6zYzoZAZQEQfp3wH3lK9VPViSM+5RIP7rHwG3+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHPnkfGVwUWcUQ9jJWVGZc4B/3aLPLuOwf6YLHsHnX8=;
 b=d6D0BxIm8ADrSBDpbmiCOjAvQ3l3HZBeAOT5OXGr82cOu+9Oxsih8MvQOZj+lohethNa2xssnpvNOJa0Kn6XCIwKuMUj7Dim1hIcmEN0k/VRWUkMf3049P0TfJjKU7xKshdLlr34E7zS0ZM9JJZZ8POwujWi2Xac/+mlEY6RanPfLcfx69icgBSYh5DE4GUlgn67jLA3LjK4jXJ6hBDDYmXTQzhOHAIHKmyRhF8allPybSizvyd8RayMDjId3+ozxp/Zkk32NeGOc/7DRuzPPd/Zu+5It+DCCTTP4D/gyC8qiq09xEf48hRkL+k0osi/yg/ehwzrElZxOrbYNafYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHPnkfGVwUWcUQ9jJWVGZc4B/3aLPLuOwf6YLHsHnX8=;
 b=Hj3S9P9zptqGs6LwgzFTuL549V9/Sc695kjKxph5syMK6um38oy00nfs372duyL21l0olaskfI/eOHGcpMUPZAjDQHn80Ee1kHp69Wg/FGWbcP0UFUYPQY3DjziAOtS7IFdh46h27jFe0QFQSLKrhRn4M+rFu6Qv1iXspqO99j7CCXXpHOen7N8hIAY/eT83NFxaa9oIh7Dtab11MrdYoFDA1jbGe3Tl+aZVYMat3CGCqaA5GCTKOHbMrx5o7BLB5JozN5V0po+qgivznxisOGuPrxWBqBeOe3II+IXZNchV58VqNKT6oW+8uVgQkf1OpxSVkrGupsSHInzklqiCpA==
Received: from MW4PR04CA0056.namprd04.prod.outlook.com (2603:10b6:303:6a::31)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 15:40:41 +0000
Received: from CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::83) by MW4PR04CA0056.outlook.office365.com
 (2603:10b6:303:6a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 15:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT112.mail.protection.outlook.com (10.13.174.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 15:40:41 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:26 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:26 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 18 Nov 2022 07:40:24 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>, <treding@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host controller binding
Date:   Fri, 18 Nov 2022 15:40:01 +0000
Message-ID: <20221118154006.173082-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118154006.173082-1-jonathanh@nvidia.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT112:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: 07edf4dc-ca89-4547-c611-08dac97b3fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktUkNJ3JlG1z4N6yeivpJP7PDmHN2+LM3m08F0R4FobL0q+jlMVxjbhJxdCPcP4Pfhaxzbc8WofTKEqqVU150hhOr8EuX10AneblGN60CNgVPoiyYQjSSKpeYKPAYqOF3XwWY2l4yZ1MykjDX/eaDfE9J+Xc89sgjZJvckvpmDYAEhRuDYO9RNEe+Axfao1Aq4fFyCIyCcokiMVN38VDSAgZNuEGZ0D8Oh8KR7rISVhKx9/EADtntszPWfAmvh7MoRW6CNzqdU88YhXuwiDuk8TCmS73cOxVU06x3xnScXWBs5QreCimJKzfHAiput59C1Jm6ZcqdE8EvRt78nYKGq8yf/lmI8mw0ZfgaswPz2SqarnXyAeEouKPdelJEB9coK9cr0WAv2hmSYghzkJEDgbUNv1I55cDBpXfgSoGmFj/TEr+H6lXhE9oYqqljPCY+8YzWGzk5KphIDn95zBNrA/vig6cTmAzAM3/vXwO3WVlSGSlKVOIptKcrRw4fU5nf2DOf5EQvHBjh5Q8JGVQ1o2xR01J+198DpOJzVKt1vcwR6ULjIXmRYS+qA0EvW8XyIrevVHyTg/6CXaqISVpYJYzWN0AWTwL6t5tdCm+d2TRzzm6lI7dKXbIwEk8QTrk4rVJ7o73rhZuXNKNIQ+HA/paZERM/x9NNCe/IZf4eTqsMHBak5KVsBQ6i5LEeMWz4ErDfFNZcYrtlz2j+HkXok84uhXloXhFbXL7GL61GZZh9wZl2pGOGdA7niahoYlScckRTio1bIH3B7kPytQbiZAmnSfIjIOVe4SXiMxhoKhyUeCpmc6IW1xy+5pU3XcGiNThOExl5NkzQKT7P2d0eK6ToHWOCIf0gjNCduIiLsr3eIHcv7Eyl+2dcBdHktPh
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(7636003)(356005)(41300700001)(8936002)(5660300002)(40480700001)(4326008)(70206006)(336012)(86362001)(478600001)(47076005)(82310400005)(426003)(36756003)(8676002)(186003)(2616005)(83380400001)(1076003)(966005)(6636002)(2906002)(316002)(7696005)(36860700001)(54906003)(110136005)(6666004)(26005)(70586007)(40460700003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 15:40:41.0838
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07edf4dc-ca89-4547-c611-08dac97b3fa6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add device-tree binding documentation for the XUSB host controller present
on Tegra234 SoC. This controller supports the USB 3.1 specification.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V3 -> V4: minor update to the power-domain description
V2 -> V3: nothing has changed
V1 -> V2: address the issue on phy-names property

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 158 ++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
new file mode 100644
index 000000000000..190a23c72963
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra234 xHCI controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: The Tegra xHCI controller supports both USB2 and USB3 interfaces
+  exposed by the Tegra XUSB pad controller.
+
+properties:
+  compatible:
+    const: nvidia,tegra234-xusb
+
+  reg:
+    items:
+      - description: base and length of the xHCI host registers
+      - description: base and length of the XUSB FPCI registers
+      - description: base and length of the XUSB bar2 registers
+
+  reg-names:
+    items:
+      - const: hcd
+      - const: fpci
+      - const: bar2
+
+  interrupts:
+    items:
+      - description: xHCI host interrupt
+      - description: mailbox interrupt
+
+  clocks:
+    items:
+      - description: XUSB host clock
+      - description: XUSB Falcon source clock
+      - description: XUSB SuperSpeed clock
+      - description: XUSB SuperSpeed source clock
+      - description: XUSB HighSpeed clock source
+      - description: XUSB FullSpeed clock source
+      - description: USB PLL
+      - description: reference clock
+      - description: I/O PLL
+
+  clock-names:
+    items:
+      - const: xusb_host
+      - const: xusb_falcon_src
+      - const: xusb_ss
+      - const: xusb_ss_src
+      - const: xusb_hs_src
+      - const: xusb_fs_src
+      - const: pll_u_480m
+      - const: clk_m
+      - const: pll_e
+
+  interconnects:
+    items:
+      - description: read client
+      - description: write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
+  nvidia,xusb-padctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to the XUSB pad controller that is used to configure
+      the USB pads used by the XHCI controller
+
+  phys:
+    minItems: 1
+    maxItems: 8
+
+  phy-names:
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - usb2-0
+        - usb2-1
+        - usb2-2
+        - usb2-3
+        - usb3-0
+        - usb3-1
+        - usb3-2
+        - usb3-3
+
+  power-domains:
+    items:
+      - description: XUSBC power domain (for Host and USB 2.0)
+      - description: XUSBA power domain (for SuperSpeed)
+
+  power-domain-names:
+    items:
+      - const: xusb_host
+      - const: xusb_ss
+
+  dma-coherent:
+    type: boolean
+
+allOf:
+  - $ref: usb-xhci.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra234-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/tegra234-mc.h>
+    #include <dt-bindings/power/tegra234-powergate.h>
+
+    usb@3610000 {
+        compatible = "nvidia,tegra234-xusb";
+        reg = <0x03610000 0x40000>,
+              <0x03600000 0x10000>,
+              <0x03650000 0x10000>;
+        reg-names = "hcd", "fpci", "bar2";
+
+        interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&bpmp TEGRA234_CLK_XUSB_CORE_HOST>,
+                 <&bpmp TEGRA234_CLK_XUSB_FALCON>,
+                 <&bpmp TEGRA234_CLK_XUSB_CORE_SS>,
+                 <&bpmp TEGRA234_CLK_XUSB_SS>,
+                 <&bpmp TEGRA234_CLK_CLK_M>,
+                 <&bpmp TEGRA234_CLK_XUSB_FS>,
+                 <&bpmp TEGRA234_CLK_UTMIP_PLL>,
+                 <&bpmp TEGRA234_CLK_CLK_M>,
+                 <&bpmp TEGRA234_CLK_PLLE>;
+        clock-names = "xusb_host", "xusb_falcon_src",
+                      "xusb_ss", "xusb_ss_src", "xusb_hs_src",
+                      "xusb_fs_src", "pll_u_480m", "clk_m",
+                      "pll_e";
+        interconnects = <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTR &emc>,
+                        <&mc TEGRA234_MEMORY_CLIENT_XUSB_HOSTW &emc>;
+        interconnect-names = "dma-mem", "write";
+        iommus = <&smmu_niso1 TEGRA234_SID_XUSB_HOST>;
+
+        power-domains = <&bpmp TEGRA234_POWER_DOMAIN_XUSBC>,
+                        <&bpmp TEGRA234_POWER_DOMAIN_XUSBA>;
+        power-domain-names = "xusb_host", "xusb_ss";
+
+        nvidia,xusb-padctl = <&xusb_padctl>;
+
+        phys = <&pad_lanes_usb2_0>;
+        phy-names = "usb2-0";
+    };
-- 
2.25.1

