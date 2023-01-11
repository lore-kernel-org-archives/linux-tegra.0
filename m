Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583E8C5479D
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 11:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbjAKLFX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 06:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjAKLFT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:05:19 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::60a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74784F48;
        Wed, 11 Jan 2023 03:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAmfzz6y5PxZWRSfDToGMLa2c1zjN3m7DWPpwPtYv868YR87A5UKXBrAq4JuXaigy7fMdIedcxh3DlR8RlvKW3R96YHzmq/ERI/eLJ8zoKJPdi2GfyxuK5FI+ayZqckP/JLXeoYXkbwk9xGsH2T1uLuajOcT6q7///aNfTC610MIkg/udRxIK5BH0+8R130Y55jBSr8qkIdLVuRxQVOlVVaQkvDl91VZ7AC+/8bnlzeVdOwHC3GNhNXyOr6DHxpm1fEqAVndVNmIWRBGWWQkqkV+YgELm+MYRqW8ragLXOsevsFyzusMdhd1c8K+29Aon16B5qJ+PLT2GLeaYWyYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naasYfbh9yt3EaNAvkPUDMzIZBY9/MU++WU2QeKG7DE=;
 b=WkYKr3taZpne/MkzIHg++7yJ7vAafLU/WDW2YQKhxGGzuYJFEqWBxLcUIvU5T/m8Ds7PbbYeDS+MmuvRBSYNNBJYnZL9N1Gynsat5n1OaKKvDpc7cETQaGy+zMAOt5uDVwGHyJYlIfIdGt4i/AaymhFyTQr6UrJHdJuRdjohY7ZZjXa6XNBCCEscOV+7MfNvCpaYt5Q58dMMx2K1XYMonDgGecdg6xdE6mJgpox68PmbUUOv3nDBhXGCyb5ZEk4PBbzI440hj4GACltFQ0406wAypu0rG/Eqx8XUs9bOPKnggQmg40B/SWexwmzZuxeGG/FLW6h/1IqKHhwPcXghRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naasYfbh9yt3EaNAvkPUDMzIZBY9/MU++WU2QeKG7DE=;
 b=rczEq6nU0wXXyOxn9VgIoVb4faZDHHzMg1sly6v9iiEMKpwlcmFzsow01LFywRgizozUNMdvUCBkly1lkO0Yp2UguCo7jWmxZx9tllA9vRXr62+LoIFQYA+A4ahzPOrse9h4aPoS+81j8BhZ+/4Is3z/9UKP09oKkVmLmTEiq0MEKPWFFzJyLPQW7G67b1GJG9i4Z06OTmNulN2wzmQm6xDccvTx/IM+yYoRLPr4NMaG3zY68UQil0KJiwRpUBKKw5Xhj312DxRgwhjWz3YKj+S1CDrZG7IJphBp9jDb3Yc457eWe0Szn7jCrJ01TbLyqeMo5YRG7chODf0iWsJ2zQ==
Received: from DS7PR03CA0275.namprd03.prod.outlook.com (2603:10b6:5:3ad::10)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 11:05:15 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::82) by DS7PR03CA0275.outlook.office365.com
 (2603:10b6:5:3ad::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 11:05:15 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:07 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:06 -0800
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:05:04 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Thierry Reding <treding@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host controller binding
Date:   Wed, 11 Jan 2023 11:04:45 +0000
Message-ID: <20230111110450.24617-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111110450.24617-1-jonathanh@nvidia.com>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b18d41b-f6e6-4023-cc93-08daf3c3b7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aK3R1BjXKOCstujbbKQKdkPZsfPKsoUaVCH2HtI1e/2QCiCnLZzolfuKoi7HX+qkETLssQQN/JgTPf8KKLCw4IuUOYyu2GHhMLNccQktr+Je8EbVRRENtd8MVsIU4/3m1nsmzeIMyOxv9HzmoP2oFCQDPd+pg2r5EfoxFjLxynPyOfUuOUDACA+Spp8EZpZI4exkLNE2xb1u8ZYrvGuYAuVUzcJ7fgwwWnwUdPIXDRGe9Zdr+/05XaJqLunprgXL6pjkeuavQAZ82Q9KbLFJYDjhpuCmFZvBncZ3fU1eSP0iU2g7A9FSHTAIxvYbxg9scbKxF7pmzZK1zHfvV/5eYEtnsHXEquDdctvyMrokZO0OGYBwHjtaAlS/FpJJ84jieCBrchlKahnq19Iu1Z/gd9oluXxlpHayK7g7pWBLsfUURDmqVmigz1VbpEkkEnkHN4VwqfnVYwq7/WjuA+JKI1DUq6o2jwFFWuZPZzF0F1q917JO3C3YdoLS8/Tw0RxWpMG8k9DAd5uknZ/z7cPPgrhe9HKDPJYOjO+c1eCTDZ5kDEuqdDBFdQ+elw1llGeHyAxC65w/YlNU3tWA62qRKyP/4RyaniBoIMz9ooiG8ilJz2XZkg9F8r5wrXqzQHxnaHwwg38IFKpRRgPov15q+MVr4apwt31X+M+ZXEA3kQLqHNTsdTTezCorS/3S3QrwBB9SI78PwsNWkVYW9Q1SwPIb0RuTxfjwHvDMnUB//sebHGyAz2a+rTNRrW1mdRczOAB6Pqs1nUAuQbMf6EM0eoQs8IAfu3FjkLUOYKYLDW6ACNRP7+YZTokfd2pyhGhN
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(36756003)(26005)(186003)(8936002)(107886003)(6666004)(7696005)(1076003)(2616005)(40480700001)(5660300002)(316002)(4326008)(40460700003)(86362001)(966005)(356005)(82740400003)(478600001)(7636003)(54906003)(8676002)(41300700001)(110136005)(70586007)(70206006)(82310400005)(83380400001)(47076005)(2906002)(426003)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:15.3420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b18d41b-f6e6-4023-cc93-08daf3c3b7d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
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
V5 -> V6: Updated main description and register description.
          Corrected 'dma-coherent'.
V4 -> V5: No changes
V3 -> V4: minor update to the power-domain description
V2 -> V3: nothing has changed
V1 -> V2: address the issue on phy-names property

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
new file mode 100644
index 000000000000..db761dcbf72a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
@@ -0,0 +1,159 @@
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
+description: |
+  The Tegra xHCI controller supports both USB2 and USB3 interfaces exposed by
+  the Tegra XUSB pad controller. The xHCI controller controls up to eight
+  ports; there are four USB 2.0 ports and four USB 3.2 Gen1 x1 ports.
+
+properties:
+  compatible:
+    const: nvidia,tegra234-xusb
+
+  reg:
+    items:
+      - description: xHCI host registers
+      - description: XUSB FPCI registers
+      - description: XUSB bar2 registers
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
+  dma-coherent: true
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

