Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13FA5C61DA4
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbjA0PLK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbjA0PLJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:09 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6B283263;
        Fri, 27 Jan 2023 07:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9fMUsfcAJg8Fo7Ks7nRsxW7G+YyL3zbWJD5zX4Q3c/1M3BhEsf7btqbng9tJNChymwtELYQdTcns0S47wjWqvK1MfZBr/fO9kiRqnV0yIFkZ+imTaHQLILd3HneJbEjaQuy5pWHb6aa2HboT29asDZ7VCtaejcWojGaI/FQxQYvAVBsOyC32imwvjBwaeuMnreOgc7lX8Tl2yd6G8XXh+yK7sdzhG3zZ5WkyaEpQJOKBWORJlb8tEEfr0dF7r4J6PQgLH5D1x6qxkoDflJvT6ae7y3sGsPD94NVs1rwffAIlYH9kCQXCPLTFLN3eChDkoo1/nQbyFlJTjXXJd3DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcqgtF+b4lBSI0h51UfTuL0QGx8UBt8ILdyl4wAa0w0=;
 b=dLz9pU3qVBOkDg9GrkKVPtLKTfm3P/y5rl9x52Jz4BzDb8NlOvoXLwXvptFQPDwPzrAO+U5Uz+grgGBbSgo/Yihjzx7pVuwlrQi9VU6poGwo+DBHRcKFjY3mXB33KrP5V5P2yaTYUw8a6Ebk/LW3VLJWuR4kvbZg9Y6JExxtFHKBk1q5wdfLXEJZNN/p2IX4XvqdnIsb9Z3GdGx2x83AXq/6aody+M1wQe5rS+53TQnZA/rvWzqmWBwHqcxZ9WOhbdd0ohSDrpScKBkK1EC7Kz157xZ8j3lvCFfkkrWMYHndtzqQz0wBNAtSbTN7bSgxArGWt1woPKG1+cHOHywWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcqgtF+b4lBSI0h51UfTuL0QGx8UBt8ILdyl4wAa0w0=;
 b=ZprANJ2SgNsFdLstaw2FhiEjObcbLD+s00NB7AGZkSd6oLNQQB3nwT4XdiqTz0wf0NdxQ9tSSHRBinhUyhykicAaKh6sE2n59kCVT01GKC8iBeWULTZw8x8JuoGCuz4TFl/Q3wvIKvDtpd+d14+IJuacROc5OC7LcKZQus1T3i2Xo5n/27lEIRd3I/Y/UT/KAfzYzVpyvy7To7eqGWWIiqib9gkJRp+OFNb+LhTCv3DEn+iaGek1VLVrAlX71qKJlsOljBqKOLt4r6xicz6R9/cMQWP5c71JNUrnNHAyyCZh3i5a/bKeVJj7rH/Y2W6Y7RfbFcAsDTU6piiSJUCcLA==
Received: from MW4PR04CA0206.namprd04.prod.outlook.com (2603:10b6:303:86::31)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 15:11:06 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::26) by MW4PR04CA0206.outlook.office365.com
 (2603:10b6:303:86::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Fri, 27 Jan 2023 15:11:06 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:53 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:53 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:10:51 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Fri, 27 Jan 2023 15:10:36 +0000
Message-ID: <20230127151041.65751-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127151041.65751-1-jonathanh@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT059:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cda27e3-e7dd-48b8-dc03-08db0078b67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DuL6Tpt3SbqvW+CI4S+2/3mJtiAfMfXkpH+I5le80tG9T/HhF6fWHfmhEBuU++dc+B4/kIwZ/JCOjq72RmZLswGtp6pwJneF4SjvrEWQuY7b0mEzFy8fL60m/qxIerxn0n3FE4xsc9PdpqzyAx7PguxZAJYz7YhMBjuAC5GkaSPJWZa89KDtJSklRuVNxaNVK1Uj76C6T7/05D2NCCF/k3NlIdwIYNVi8w1KSDLWoATSM3zeKNlFBXL1rynP0FgIwN7Ct+IMl8fb9BPrWSKqJYyvhS0yPzabz3mVHVMmLdIg1P9izwr+VIgAePzvTy6GHDYpJ2qdQ8+Z4sTbdFZcBKfRnBKcPFYAKMSrgO9NhOaS1MD+gn9gOSceLfeo+2YdQh3m8aKoLvEAokKBwTvVN+gPXmCxArI+G7s+bwR1YF9Mf4vVgdkDWQcJkApoOQAtCxlxwkXD/AXYHmfdt0VpeK3HOEPRDEi8AR/t9WKUBUoeIQBr02OrXE2jjxytjB46j8pFsWp5BF9cCmluuS8lkW9YW9fazpRP4Evpd4Ab/vX9rKLwTfIHnpwTQxjFVfshZptjT7V2Vhb/lDru6ESvTFl1f32tNaQh9kEFV00WnmZpGgIsvIuvMdaS6MUeC1+ZvFA53Gub92qMotoYLWehGjM0esAKddoHrkRhfuOeaeXnA9KoiLzk4Oq7jMFyYojVHZpjPSPct4bULaQcmrc/t6eIp/U8c4rWzi4v3/A7KeFu/WeDHsJRnIP2E8snvFH4Fx7pbtN5/0Tkr2n+rBjTOvO3shbAV4OfhHVx3ly9p4cosHshpOF/KKOHhx0ViKKr
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(2906002)(966005)(2616005)(5660300002)(40480700001)(47076005)(426003)(82310400005)(336012)(7636003)(356005)(82740400003)(36860700001)(316002)(8936002)(8676002)(41300700001)(110136005)(54906003)(4326008)(70206006)(70586007)(26005)(107886003)(186003)(86362001)(1076003)(478600001)(40460700003)(6666004)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:06.0027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cda27e3-e7dd-48b8-dc03-08db0078b67f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add the device-tree binding documentation for Cypress cypd4226 dual
Type-C controller.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V9: added 'unevaluatedProperties' and 'additionalProperties'
V8: removed 'additionalProperties'
V7: updated example to use 'typec' for the node name
V6: no changes
V5: updated subject and updated binding to use 'firmware-name'.
V4: no changes
V3: fix additionalProperties warning on new schema
V2: based on the review comments. Fix some addressed issues on

 .../bindings/usb/cypress,cypd4226.yaml        | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..b68f9ba621ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -0,0 +1,92 @@
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
+    unevaluatedProperties: false
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
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+              reg = <0>;
+              endpoint {
+                remote-endpoint = <&usb_role_switch0>;
+              };
+            };
+          };
+        };
+      };
+    };
-- 
2.25.1

