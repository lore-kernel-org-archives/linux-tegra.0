Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F79E71094
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Sep 2023 17:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbjIURCC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbjIURB6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Sep 2023 13:01:58 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF9F170E;
        Thu, 21 Sep 2023 10:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTfGRLD4LVW9e1aKdw52gSS3GpD3u81HOKpqAz7PcseDVY9zEbILFKTZZ1mXP1V4MjonX5cEO6KrZ/GGvhLrdaJ3tMEi3JOmX6pv+j/K/fcLiSjwLjakGNRsN8RqxDYskFzEBMrwA5e0+OIMIe9ucWEsVQiCgW9E22fPpSYg/7yCBLd9UYBk6ZWEiqX+aSe0tj5HTr2ns+7oI9sabhrPi9H+js8LfLRsFPHGsvD0zcup3My+huL0EIK3WSDoQlXNB5tvCYeIVo5af0XBW/XOh3g6Z7Be2zZHqJ6pW/IkczoMl53RzTvWzNV4jApyOGyKRHxNy2pAB1+8/QkWjw1/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elHLBbtv1zcjEj9anL0X35M1mh+/aEBf2anjlL6RkzI=;
 b=BXMRkTnifKVeBLQ7w8kMHk8bpbajtHqQqrTTLocIM/Dx9stsIVd0Gr4VP/Yf3x4gJXmfsi2O62JNtV9qD2bMPUOufZr3ZbJ+76RWVIGOGVqH+4tbKPh90sk2JCGpvQlPvh92dcKYuZOFnyO1QvcFilt17TN1tq3rVKWnz+nwyLA9gl6WgX14kl2ptWc1rdrhhIs+PdaRTtYystAeGJUiZwCpLiZDbWY5xYIAjzcjuviNeGysaqvX+GZUJxD4j0p2DikXiO82Q5IlCNqbV/cu2uZqKntaD2amX7NId0Q3yQB5GdXfndqt7BHxmFpxyEevxtmO2jknqWEBGxFcld8ZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elHLBbtv1zcjEj9anL0X35M1mh+/aEBf2anjlL6RkzI=;
 b=cXG9g91mDLr1V152gA/Ed79RoxcLsZ5fUUoDupIIomkzd43VTR2uwLnHGEcO4cStyQU669o/K9HapvWSVokXm5efSyVcVjPYWNw83z1HU3VDRnCtJzenvZMiauQandGio0h8bfXdKCGP5U2q4T4q8V+uZMR/E3umh8pqEY1iMWY4ZozkT20SfgxbbBE2Q7gsB1gT268Pg7JxgQFJUcTrSz/ZcmWdo4o2pKLsYN7Mzr4UkgscXuZMLK8ajX0paGJFY49nbJVISc6qaJ8Uu7jMHhMsuoXV7mDRxhcUqGcmrKgVfu7DN37GYsvmDJtxlf3RVRHHSu8GgLggmj2tV63Y3g==
Received: from PR3P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::8) by
 DM6PR12MB4433.namprd12.prod.outlook.com (2603:10b6:5:2a1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Thu, 21 Sep 2023 13:12:10 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10a6:102:b5:cafe::25) by PR3P251CA0016.outlook.office365.com
 (2603:10a6:102:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.29 via Frontend
 Transport; Thu, 21 Sep 2023 13:12:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 13:12:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:35 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:35 -0700
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Thu, 21 Sep 2023 06:11:33 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Ninad Malwade <nmalwade@nvidia.com>,
        "Thierry Reding" <treding@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 1/4] dt-bindings: hwmon: ina3221: Convert to json-schema
Date:   Thu, 21 Sep 2023 14:08:15 +0100
Message-ID: <20230921130818.21247-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921130818.21247-1-jonathanh@nvidia.com>
References: <20230921130818.21247-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|DM6PR12MB4433:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d43cc93-c9f3-4185-755e-08dbbaa45c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dfi+OEHSU4YQQXA90xoRyR0eiHegVaLkjtKiaGeMqhx8cXThc25+Q0MyFqPneXjLVKwVpxcV37RVUjZpqx9X6nk37Sig0sJzreIxLINVZJwU+5IewZNxCyAOUi0xSdMkLqNv1xfc6d+/BcfwardOfPzYXyKuPFaATsegH2NfibRTi/6yvSZwcnLU7mNn7aRez3T1B2ldfIaW3cNNWvf/fGIAZUr8qt0c3m5bs/DC10u5wJk2CU0LhxcrSEEFg0rG/MR+wMhjkOJtRrrQ40GXJQZyVZO+83tBJ0Zp68WBIEcZ28+4nCFXxSydXKAVC8vx48zrp53uuekjZ7KJ6G5vsk31jcpd1FhwG0rxPx8Og1AAUNS5tJ21ExESWV9CkUhHxTdzYmh7oSFtcf2cWXkOp+zrSwpoJ/N6q8ED1326+Yn7cCTISsR1Dd9wWuYV3ih+Iic2o6Xd0npd74ixW8s5mYh24NuWnlnQamCohT3kyX6+h6GyMusglB40NagoLwwi2pR7i3bOF6FBxB5VullrhBfyq9xd6bfJiVXVC/kb7xXKhxtCL75AMmlckZgISY1J/6rcbbpe5H/YC5xu01+QAQ1dZubkKPOe2p/g2gGZZPErgwWLVAVkx8dUU/HCGoNtQPUIZHTFLnYzwUbfdLQmrtxpc2Ai8/mHJgpmwvnr7o9hCA4KTI9FqpQUTohsX8U7gn1yh1UwITPCd8RpQHNI1JX7uqNra2xdlMPPHrzhIKkcbrfqKS7Ibr8Clcw3LG9BuEz9Ly573oKhurIuGCqlhg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(46966006)(36840700001)(83380400001)(7696005)(82740400003)(5660300002)(4326008)(2906002)(36756003)(41300700001)(8936002)(8676002)(54906003)(316002)(6666004)(336012)(478600001)(966005)(47076005)(426003)(36860700001)(70206006)(2616005)(7636003)(356005)(70586007)(40480700001)(110136005)(86362001)(26005)(107886003)(40460700003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:12:08.5864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d43cc93-c9f3-4185-755e-08dbbaa45c32
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4433
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Ninad Malwade <nmalwade@nvidia.com>

Convert the TI INA3221 bindings from the free-form text format to
json-schema.

Note that the INA3221 input channels default to enabled in the chip.
Unless channels are explicitly disabled in device-tree, input
channels will be enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../devicetree/bindings/hwmon/ina3221.txt     | 54 ----------
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 98 +++++++++++++++++++
 2 files changed, 98 insertions(+), 54 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
deleted file mode 100644
index fa63b6171407..000000000000
--- a/Documentation/devicetree/bindings/hwmon/ina3221.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-Texas Instruments INA3221 Device Tree Bindings
-
-1) ina3221 node
-  Required properties:
-  - compatible: Must be "ti,ina3221"
-  - reg: I2C address
-
-  Optional properties:
-  - ti,single-shot: This chip has two power modes: single-shot (chip takes one
-                    measurement and then shuts itself down) and continuous (
-                    chip takes continuous measurements). The continuous mode is
-                    more reliable and suitable for hardware monitor type device,
-                    but the single-shot mode is more power-friendly and useful
-                    for battery-powered device which cares power consumptions
-                    while still needs some measurements occasionally.
-                    If this property is present, the single-shot mode will be
-                    used, instead of the default continuous one for monitoring.
-
-  = The node contains optional child nodes for three channels =
-  = Each child node describes the information of input source =
-
-  - #address-cells: Required only if a child node is present. Must be 1.
-  - #size-cells: Required only if a child node is present. Must be 0.
-
-2) child nodes
-  Required properties:
-  - reg: Must be 0, 1 or 2, corresponding to IN1, IN2 or IN3 port of INA3221
-
-  Optional properties:
-  - label: Name of the input source
-  - shunt-resistor-micro-ohms: Shunt resistor value in micro-Ohm
-
-Example:
-
-ina3221@40 {
-	compatible = "ti,ina3221";
-	reg = <0x40>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	input@0 {
-		reg = <0x0>;
-		status = "disabled";
-	};
-	input@1 {
-		reg = <0x1>;
-		shunt-resistor-micro-ohms = <5000>;
-	};
-	input@2 {
-		reg = <0x2>;
-		label = "VDD_5V";
-		shunt-resistor-micro-ohms = <5000>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
new file mode 100644
index 000000000000..d0e64a72af5b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/ti,ina3221.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments INA3221 Current and Voltage Monitor
+
+maintainers:
+  - Jean Delvare <jdelvare@suse.com>
+  - Guenter Roeck <linux@roeck-us.net>
+
+properties:
+  compatible:
+    const: ti,ina3221
+
+  reg:
+    maxItems: 1
+
+  ti,single-shot:
+    description: |
+      This chip has two power modes: single-shot (chip takes one measurement
+      and then shuts itself down) and continuous (chip takes continuous
+      measurements). The continuous mode is more reliable and suitable for
+      hardware monitor type device, but the single-shot mode is more power-
+      friendly and useful for battery-powered device which cares power
+      consumptions while still needs some measurements occasionally.
+
+      If this property is present, the single-shot mode will be used, instead
+      of the default continuous one for monitoring.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  "#address-cells":
+    description: Required only if a child node is present.
+    const: 1
+
+  "#size-cells":
+    description: Required only if a child node is present.
+    const: 0
+
+patternProperties:
+  "^input@[0-2]$":
+    description: The node contains optional child nodes for three channels.
+      Each child node describes the information of input source. Input channels
+      default to enabled in the chip. Unless channels are explicitly disabled
+      in device-tree, input channels will be enabled.
+    type: object
+    additionalProperties: false
+    properties:
+      reg:
+        description: Must be 0, 1 and 2, corresponding to the IN1, IN2 or IN3
+          ports of the INA3221, respectively.
+        enum: [ 0, 1, 2 ]
+
+      label:
+        description: name of the input source
+
+      shunt-resistor-micro-ohms:
+        description: shunt resistor value in micro-Ohm
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@40 {
+            compatible = "ti,ina3221";
+            reg = <0x40>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            input@0 {
+                reg = <0x0>;
+                status = "disabled";
+            };
+
+            input@1 {
+                reg = <0x1>;
+                shunt-resistor-micro-ohms = <5000>;
+            };
+
+            input@2 {
+                reg = <0x2>;
+                label = "VDD_5V";
+                shunt-resistor-micro-ohms = <5000>;
+            };
+        };
+    };
-- 
2.34.1

