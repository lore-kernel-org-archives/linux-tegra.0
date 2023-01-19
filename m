Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF65C004D4
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 12:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjASMRE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 07:17:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjASMRB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 07:17:01 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7241715C;
        Thu, 19 Jan 2023 04:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWL+mqjcsjv5kRO/2wjPgi2AVTGCb3FLU1pvcFfN0qTulNgtG+LqoS6kArcXhbZq/jTXBno7U/v0DrogavWpjxMgDUjODRi6n0hl5x1Dpjx/ba77VcTeoBRX8D+l8/6LMD56Zpt+cU9bSAk6boEoIuGn7+bMsPboz6nlhswJcowbpgJMYGQIsAVUOxp/2RU8x2v/4n6ldR2jEoU4Dv4UGljfI7WXqx1EnZtwz3dfX4z0nz6/JVVy5XtqqGAqJUt7kXWmkRIKhTpyX0bbDoLIRnCtTsTtW9uAGrfb2/rdb3hfrqEdEFcZgD5e1T5TqblkWY3tyG7ATfjE/87ZRl7RMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu1942/4Y7BPbre7KL+rDV9PJz0S+SGb8wVkCEPKuG8=;
 b=XxTR++MwpQDqhqMhSqL4RScaxm32wK82ftC673VGEw1Z2n++FyH3GF6rMjJ5J0ZX8AEW4KyCvmSzTfWo8FV5cqN8g2NMNCmI2HLKATgDGXmWBQ5G/NA5BKROdyDI6IcaSrHEsKU3Eo6SWEJ9ack49a/7QeyAGaO7Ub8kFLXgkeSMigmXLePBCEFXwkVzsdPiuOSHLlMSFlLpb664nKJHXnnGeQ8loUEznlLlY4AxvbpC0DGQzUVmdDmAtMZ5WWhO4nmwEwvlbYZZvS6gQgBD8KdBPQ7JCbZK9Y2VZ/s6VNGHCyBPcDqPcyKJvb2zm+tjfbIjW24YcWOJR07d7LZexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu1942/4Y7BPbre7KL+rDV9PJz0S+SGb8wVkCEPKuG8=;
 b=aDQ2e78uYJzmeSvnMal+zKYJS7ICGOXMU9Jkpx/2/spNaWoSK52HJmLZNHoQq8tlAnj5+UO9s5maQBI4ZRP/Ub/ZYWPSpjZTloo64GGUjMeyS4h5vIASKHSZSu/0rfHAKr18pzgF+BySnvj5Dm9b42VRx2u0kEYnIy6tbjcMO23/y/bR09RQ7EENR6FS1XyRdmc2g4vlfZfhPn4eoyGf22br8nt6Cl6KWc7ocjnNMxnWWblMmWWx+bLN8SvAF/tcc71xXzAFxp1gMRheIRbU3bTvCwhJ7TQiDbeczHmpkrLawa5OoosekVZ7otdY5NvMZ+H3RlGCooEIYVAH3CZ7Fg==
Received: from DM6PR07CA0098.namprd07.prod.outlook.com (2603:10b6:5:337::31)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 19 Jan
 2023 12:16:59 +0000
Received: from DS1PEPF0000E657.namprd02.prod.outlook.com
 (2603:10b6:5:337:cafe::82) by DM6PR07CA0098.outlook.office365.com
 (2603:10b6:5:337::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Thu, 19 Jan 2023 12:16:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E657.mail.protection.outlook.com (10.167.18.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 12:16:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 04:16:57 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 19 Jan 2023 04:16:57 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 04:16:55 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Thu, 19 Jan 2023 12:16:34 +0000
Message-ID: <20230119121639.226729-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119121639.226729-1-jonathanh@nvidia.com>
References: <20230119121639.226729-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E657:EE_|SJ1PR12MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 087e779c-0e25-4b3b-0077-08dafa170fda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XR07vjtDqvbINEHeBfoiyArVrFK3oiIHQDCAlhDX/e3q+UGv4OHp20QTq7snRoG9HMcXPLg2Bv/3vDDZexGCFOJmnDusXUUxf8Sos46010UqTaAaxZZQvEoAo8biIHfxYuKr9+li8ZTtHisWrTzCOv2q7MLY0VfPKQVbyr6mayCeRekTszXG3UkwKmg2ZPye/GgaEI9x7rhyITKS2PPu1yXoLTmJffncu0CIfeetbeXrmArqoG4Y5LYzOySsej1+fPVR5iUdjsk504vwxrdklCaONYr+KzTgz28+B/8hmT7nlPxSG5XJlKkKo4y3j7+vY/IVTNHFDYOuo1bRfOFrgxQeWc2UesWOdiWcO5JacJJLQ6KsaRP+I+81YCzpDRb0dKglqzuim8H8/oZGYO/MzW6YRl5+XYit3+rYphavyi55Ngbg3GU/kN22hU1HtBce2Xl9DqAaFQfr2lsf1BQ+qKhsxh9sEKQtFIPxynmNCYzpte/MrRBO7SqWjCB6TatAuNOH1LueurJXrkFBpdm2D01jIxJXxIHd9Rf3jSA4CEYHFwBeJ0JqsfP2d01/UX2VSZJVZg1fCCU+lGgYcb+8au4PUCiBbxG+/XbCtQEv7lOh71h+Yv7/AnTxPzevoiWUmg8hY0RmSAmA7FGw9iN/xA4ECC2MyoLXjRuOPnvApSyf8+5euQtmNRa83MnNNwtiXe2BGHnO34E8iOHaTbfy5j2Z4Xy8VVWjstg8AT68F3Bmc1eRlyK6tVJLgj+Ju+1sOiosdL2NM6p9eBTJsXzrU60KOgPNdegU4HtM9xjr0TbPJ0bCjFWMd2SdKEJoy5cQ
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(47076005)(40460700003)(36756003)(426003)(8676002)(41300700001)(6666004)(4326008)(70586007)(70206006)(26005)(8936002)(478600001)(186003)(83380400001)(107886003)(966005)(5660300002)(110136005)(7696005)(336012)(316002)(54906003)(2616005)(82310400005)(86362001)(1076003)(82740400003)(2906002)(36860700001)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 12:16:58.2077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 087e779c-0e25-4b3b-0077-08dafa170fda
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E657.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add the device-tree binding documentation for Cypress cypd4226 dual
Type-C controller.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V5 -> V6: no changes
V4 -> V5: updated subject and updated binding to use 'firmware-name'.
V3 -> V4: no changes
V2 -> V3: fix additionalProperties warning on new schema
V1 -> V2: based on the review comments. Fix some addressed issues on

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..5d87c9f09913
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -0,0 +1,86 @@
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
+      ucsi-ccg@8 {
+        compatible = "cypress,cypd4226";
+        reg = <0x08>;
+        interrupt-parent = <&gpio_aon>;
+        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+        firmware-name = "nvidia,jetson-agx-xavier";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ccg_typec_con0: connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          port {
+            ucsi_ccg_p0: endpoint {
+              remote-endpoint = <&usb_role_switch0>;
+            };
+          };
+        };
+      };
+    };
-- 
2.25.1

