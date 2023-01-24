Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7EDC25B50
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbjAXLns (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233950AbjAXLnr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:43:47 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41423EFFB;
        Tue, 24 Jan 2023 03:43:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUQw5m9jE0MKFnEV+FsUr9kusRWlbfDvcPrHD2F6ijV3JIHQ4baVEcrSJp4RbtBtTga8tW7k9jlSOsLdX6Lm4uFP1FpjVAj3WCh5NadrTUghoa/ndJPPZ3Prq/xxt0tu93wDbA109OJpg6w9l5SlpvoSF8nB4ZrNt5pQibbWw685T7Sse9nWnnACJFryeE5HiRS8LNmIlCgMzoR/vkAAb0E72jcTJFOrWP8FGL8mR1wfiQvoLfxgoZDSgaJgf18Acrlci7fM5AVlEBGaLkfCSgyDfVkoDx6kt4lGbWtHct/owNPnXxiIKCsPnIGIaz3rffTK5WCVe8pqD11kYiT9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYMwHPUv5zH+etASKTO0ZvSUlbH4fNjQEpYAbPyINTQ=;
 b=FJdVAry9wPDK7woIc3VoA/XjSFAKI9/7fTQ2qpliv1xUSI+WJE0l/BgjzF3tiZyCZlG4Ch4trLeFHxDOA1pVynpkS/aJIwuVaoUTAklZthRWq/x//lOanN5ohAwPtL+yNJ6qGCug7uqggGWQjsMlS3pUd7NDm/D1KXYxhazjSEIX4YYyzI5hCSrSi1XyEQ0n8GVo3BYW69jax54ErFkVbLzjbOQOUvp2ehTUxff5CWaWXKm9GlkpjrYYUVox8H5bbG6F8h1+VgXZOTG2TN7qGPL+0B7mDp5snT2crxlY96uUw4paNVX9KqU48brItaRhKTKYcFKR3yS36aJy091HyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYMwHPUv5zH+etASKTO0ZvSUlbH4fNjQEpYAbPyINTQ=;
 b=cWa7hyvJzxYjW2ndpAlNa672fvG23wmtMgmpmwNS+9nz+z4s6OkqGo7AU/zUXJ9t0BWURPBP28UfU2ib96L8YSF5nfoYmhuCAy2OcF2P3oiQw/omsmAmIV9kJWiPSKKxw71ePauITJUolmzoDPKj4x2RLKdh+D4aGta/0wrPSvcS4KF7zofvJSi+P/jL/+PWgB9EOhfZuW1yPutBfR6JVQXNNWBDorei3LGBVOWtbGNhajAktcqYzeeS4tek/3BXusDtwjl7VHvdjH9MV1wVTZDHHsvIgm1orHMukEIr2ub5TWiwhE5q0g2x4wpM9ljgdcmV0ePmf0MlAK7h5CVAHw==
Received: from DM6PR07CA0132.namprd07.prod.outlook.com (2603:10b6:5:330::25)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:41 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::69) by DM6PR07CA0132.outlook.office365.com
 (2603:10b6:5:330::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 11:43:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:28 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:27 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:25 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Tue, 24 Jan 2023 11:43:13 +0000
Message-ID: <20230124114318.18345-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124114318.18345-1-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: dc825a7a-1b55-460a-5358-08dafe003d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fmkZf4OOr6Z7AHcYD/FVo57l3IgLb9zFm3xRJ7+8yTxT/uH/Ne9nbXAHNkZKiQocHu7ll0iEJSEMvXXaWbAXqU2Aij6uZ62sV5cIu2tiKItr9x9Zs1UniwokVhJnhTuCFRHsIhB2Sw+Cpi5haxzzAuy2DfiNUMrkWfbJfX438KGZW4FOcEncjqSUMqenZW7RgI5eM0v/2rCovHP8hMULokzUVcpM4oNOOH6iEVKXqLBUuXFcMU4o4aUdBB/c+Fl4T4L6d1X1F1wplYjk27pIMSFFgvhTRqTAKOBQeTPTsUiPRo9e6nyEVhztOinipouuyHDZbauP7XfF9xC2RpZyJ4hhSssHo1nDW2YDkapBBvTE7NF1aX+Ie2FUzc4m3EbNNW+iVqaNGAwPrE0d6VSy9YxE9UgyV+L591mZGc8+KsK8BYH/Oe2kmSYmQwCiZkLbiijniFnenlHML8HOjt1VKXPiTJaz28T1DRMqqK+A9Nn4hZkI+JKQckQhXDvPc1NE5VcvjqOvwV6jWjN2V8TJkU2l+pmUnkkmVAuGpdugjS8TJww2hC3CD5hyJoU1pIxMkQKABVahsiOh3HiJPbIniiiKq0jXTA9b05GWiH/p8WIL5jSPQwCozEBpTOFrEaiLcUxmsDPTTWt3zuAgfp8cuoXbTtmTfK7ebbG+cT1wdtvw5zPQIGl9NfbJYMC4cTNroORc0MKM63azN70pAmqVavobFaSKO82KyXP2N0MJKGzpep/fuoVxqMJtfFe9ZGExPmmRncyiKox3ltlPlLdi36+TpAKfTi/kMBgd3B79uyw39sAJ7JJppCTr7HP/gJxZ
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(356005)(5660300002)(2906002)(82310400005)(82740400003)(4326008)(7636003)(8936002)(83380400001)(36860700001)(41300700001)(966005)(7696005)(110136005)(478600001)(86362001)(54906003)(8676002)(26005)(40460700003)(40480700001)(316002)(186003)(70206006)(2616005)(336012)(107886003)(70586007)(6666004)(1076003)(47076005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:41.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc825a7a-1b55-460a-5358-08dafe003d7d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add the device-tree binding documentation for Cypress cypd4226 dual
Type-C controller.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V6 -> V7: updated example to use 'typec' for the node name
V5 -> V6: no changes
V4 -> V5: updated subject and updated binding to use 'firmware-name'.
V3 -> V4: no changes
V2 -> V3: fix additionalProperties warning on new schema
V1 -> V2: based on the review comments. Fix some addressed issues on

 .../bindings/usb/cypress,cypd4226.yaml        | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..6db6d88ca1a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd4226 Type-C Controller
+
+maintainers:
+  - Wayne Chang <waynec@nvidia.com>
+
+description:
+  The Cypress cypd4226 is a dual Type-C controller that is controlled
+  via an I2C interface.
+
+properties:
+  compatible:
+    const: cypress,cypd4226
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    const: 0x08
+
+  interrupts:
+    items:
+      - description: cypd4226 host interrupt
+
+  firmware-name:
+    enum:
+      - nvidia,gpu
+      - nvidia,jetson-agx-xavier
+    description: |
+      The name of the CCGx firmware built for product series.
+      should be set one of following:
+      - "nvidia,gpu" for the NVIDIA RTX product series
+      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
+
+patternProperties:
+  '^connector@[0-1]+$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    properties:
+      reg:
+        maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/tegra194-gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #interrupt-cells = <2>;
+
+      typec@8 {
+        compatible = "cypress,cypd4226";
+        reg = <0x08>;
+        interrupt-parent = <&gpio_aon>;
+        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+        firmware-name = "nvidia,jetson-agx-xavier";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          port {
+            endpoint {
+              remote-endpoint = <&usb_role_switch0>;
+            };
+          };
+        };
+      };
+    };
-- 
2.25.1

