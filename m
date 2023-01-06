Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47C4C61DB3
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235350AbjAFPaP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 10:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235609AbjAFP31 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 10:29:27 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B68CD09;
        Fri,  6 Jan 2023 07:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlqdoTr6MDA7lAxgVwIB8QQeKiGfqD/WKvvdMGzFthrcsOBSHvGMXGXOi5LUj/BTo2f/CLdjspftBnA6KUPsdBkH+16IpICMzKkWQc10NLFU/3/GiLEUcX327XKn4oAE/+COCMAqVySKC/7RhhvJd7Iqgf2UhVOB7FuNpUGfyhdJmYZq6hdUuJapMGub545bs5RGslhL4ACp6FGitoYEr/Z7fjn3CqqmEH5+pUA46CoP/mpwUAMJtsNU5M3Z37pex9djb/TCYhnCKO6MWCPmtAGWBcDBJ2uzi5SQgaYVyBbGHwSkt7lym1Qhp44IphNcEoFNNuiB/7/PmQf5DPrjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NPbsWLYuMoQBsLBf+pFVZ1787MbHXGSVh5pm8bkBLI=;
 b=loRIFWAzqJaLKGqYLeabcwxDI4StaTtVuBvYLODx5HqrQdf8wrwXC1gaHFzibRXeS9CIyR/UBSUAElknNZqBmfHjJx+fmP6Fa9EUp2aSn3P6mBjn0c/s/Gcvjw1l7lMm3EtiRKyggXySIoDkhde3VaxnP8aDEIkxwufGlhivFPmB/+PQA7VbVATCpTbnZsrMZPZu3BYVVEhodJb0Mn7PqjxcHV67z0cNjERF6narRFk1FC3diwBwxancD2Jv+IUutEKNBFMac7+zuzAnBnVcWIm0lXkysbMjcA2r9WuS4/7oThwWqmTcEb3UMiWwgiu0nJJn0jry5DnJ4LKyykWm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NPbsWLYuMoQBsLBf+pFVZ1787MbHXGSVh5pm8bkBLI=;
 b=QCfqQ2y4DgAqIbzVeqzrnuFbrqnDXbxJUPNUnJ3FX8G9RwtLkiWok+0Ufngy3uAm8UKBZRZMcUCRI7DmArYDoGFo6LC3pq9IAAopdxdPU8S8E+EMORWLOraMana/J/JDXlAkrw1uj0EZ4Y/SdQL/r6e392CZzSmp/8mwPWR9SazfIwngkbEvM3xOcxVpoAZ9j6kc4FC4oaPpHCgQr/LqlA4DRj5M/t+drSoNV19G9WcyRgq0FnlmT4fHHmnR3Yg86GPPDoWL32Cs8GgU3yfQjZWlkFCTpzIXJYXJQy2Gwfb8wtjP+9Nhb11ho3K6cE5do/qqqSoSU1A/6rNPGBog+w==
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by DS0PR12MB7606.namprd12.prod.outlook.com (2603:10b6:8:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:29:23 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::36) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.18 via Frontend Transport; Fri, 6 Jan 2023 15:29:23 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:14 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:14 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 07:29:11 -0800
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
Subject: [PATCH V5 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host controller binding
Date:   Fri, 6 Jan 2023 15:28:53 +0000
Message-ID: <20230106152858.49574-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106152858.49574-1-jonathanh@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|DS0PR12MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: aa2522e0-be97-459e-477e-08daeffac9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R/KHQ+8xp5vn+33qk7+FrkcPH1+jMjQZzL9x/yyf0N9IAaqYsEStRSn/Ygqg+bS16XK2W/BhfjXZFMvsU9Q3khnKdTEjr/MIkPlKZwu5PYPoX4IWv09Ru1PkTLvKCL+uOnUOUC16BqRuoNsEEVadvX6/hE5ZD+hqJvVfcKd5uPveIJwaG9B0Td8rHfedor4hNrOPRQAVkJnY+JDdRKRhT0vqAxoLkCRqMgnjIOl6N/mZ/g9n4w+mR8H+/O9xP9zWQi+xkOOsGsssnqvYoD1QtRG4P61fg0XkgPnsBwnexUyPHwRz9idHKtfCnmMxjI1x+p6xH7jnSi6j4vXS/Nq9TygcBpDCo84KXM2mE1KaITnIRP6fmqtgtc14ZG3h1SLaXKQrW0YI2KvGkTv//9A6eABCWj8Y9cSamVSu9/Ix8reptTPJHV0bU8tRyR8NZ7sD6snQK8XYrndVoid/NGfFE+JTjTX46a4jO/nnwFaNHdMDpWQn1xCVvpt2pHV8x7CAPicbwNv6LytaOsQn21+sUtF0I+zgdHXbJ5doCJP1fWx1Gkwwg8q9hQVIZ6x0bThqTBThWe+PoJ73D2M7VyIW2Z7C8DXft49vWYBxZzLQo8fCx+TptxNWq+QzY2DCKTH7AhpjF1153Gh6GrA8BWLGp4naFC+8veAEQFx9m9p0bc4PbkbJRx6z2HTa3W70fOuG5aMByQrdYVrwg7YKTSZj8LeERxDr5upjdlr7be8GbVj+OO1/hkoweLQm/5sJUm4pkPPfnBI39ww7G6/gAPheUcQR8hL55C1bVCNMb0F0OelClI8EzN3U7mghdQXr77Ll
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(5660300002)(8936002)(8676002)(4326008)(41300700001)(70586007)(54906003)(70206006)(110136005)(316002)(966005)(478600001)(40480700001)(186003)(26005)(2616005)(82310400005)(7696005)(1076003)(107886003)(6666004)(336012)(426003)(47076005)(83380400001)(7636003)(356005)(82740400003)(40460700003)(86362001)(36860700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:29:23.0044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2522e0-be97-459e-477e-08daeffac9b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7606
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
V4 -> V5: No changes
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

