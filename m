Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E608E810DF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbjI2Khb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233052AbjI2KhP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:37:15 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2070.outbound.protection.outlook.com [40.107.95.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904CD1B2;
        Fri, 29 Sep 2023 03:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUT1EfsW2uU9yzFBn9bizSY1HZcxHfHrHpBxdn95poRAv8PYLOUMO7SV1zwTxlPtFW2w3slP8kzGvLwuxfZHtccK1JPtfqHAEXNEhDAo9pHD6X6SinSCoRDdxgbpPZLGeqP6gBPF1PlUoZIFcivmUzujC0rtGLJv8eBnvFrsd2xHNkO82pqOtIgf24gulJJC53nl06dlPHN9Q4bG4Etb5ys4S0IjNOCaAsLgO6P5n0pLKkco8wGRv3qUocBEJsyrQthgK4QF7iGNRO17KzBmdbzdNNNLtm0PlkhWufu60/MKBxKuvjYjGYZ5vzn7FUw3NwhGqOHFKkzQnvI5G5JuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMfHSHVXBV/Gn3LdqZnwcM663CH4zjrI17d8liEWcIg=;
 b=mtB0A9SzuVHRpigKxq3Qo8sASzwx1PowNB2KxlfHq82iJoaLscLdGPBynMO/ovXB4HCl54k62CGYpBpPQPBZgXfEwZM0avqLF5G3yvLoJnLspEBKI9/6+YwDeDiEeAjZ2wi9iJ1z4Va+RIg6oClshXyz4cRjr1JAP+/NNMZi8etkQOGfttNYnrdbxiU2TD+lGDWNvoLK3fRZ5ui4SFTT/CkRE6alWbKuHcE31in+e4N/qg02aaMAoSImsSrWtwccamWIzCAZS9SB/ypqNyKv5e52HdRwsfHS7fwVLwlw6JmWy2ouVlVEQlwlrRPZAKSqi7Z1BRUr4olGxYDBekOP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMfHSHVXBV/Gn3LdqZnwcM663CH4zjrI17d8liEWcIg=;
 b=Uypk9Sp3v/smNu33rFoIRGQuWM/gUaP/eXJ+eGImXH/z71YKwQ21e8V2PW7MElpI5PXh/2vYRZTZJMzwX5UUhPJ/ezBfep5RllHSBBfH8fxF5c8RMzO1MIj7uNbSWV+fbs130hnO8LFfeSzCTRBwrNTREJ1KPVY/X7ie6/yXpKDy3P+P1L+7zOB0sYnr0hJ0QkfE+MWOpU5IKKM7Gu2kIWZATP7wh8sTWN06fvx1FIZ/HrfBScaooU0jqRylmir0hi+4nGWBnxkvfsTSV681GuuKigBdcczuP5l6z+2rgYi8OhGJSwvpHKwtr9yFgBDGKiy6rNq0znvevk8lqZtjjw==
Received: from MW4PR04CA0147.namprd04.prod.outlook.com (2603:10b6:303:84::32)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Fri, 29 Sep
 2023 10:37:07 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::74) by MW4PR04CA0147.outlook.office365.com
 (2603:10b6:303:84::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:37:07 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:36:57 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:36:57 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:36:55 -0700
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
Subject: [PATCH V5 1/4] dt-bindings: hwmon: ina3221: Convert to json-schema
Date:   Fri, 29 Sep 2023 11:36:47 +0100
Message-ID: <20230929103650.86074-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929103650.86074-1-jonathanh@nvidia.com>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc96328-9558-42e7-58cf-08dbc0d80780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHIzetiJsaF6owY4sLKSi0qpDGaFiWUFtSAtQhwQeGEgF+6zDk8ZI3p9q34DUCzp1Os2UQUE/9PYrVH+aI5MWb7xirbgZtDmTpVItm5EHAwS+bnd+A3f1wcTaJRuttluX0QeBbWMGlXVTsUqDJGjgWtt0Ku/bSNQLSLY23l/6KaK+rmtV4FW4UTFxxeI/QPXm/gDdJ0dl1MRo82Vu2HWTmgZtwTgtNb+xdD/s7xwslpCHmHSXExncFo3cY0AkM5zsHlY/An+mSOP40vFY3DdoHeDLCW6fTjnrvnFmYjikWwSYNp4v4+2v1G97yXDVfbrvCcLzzLhoTjVw5C2gdp77RcaeQvCEv8a/lDISmphcyuumesb2ppnztyFrrZh6GgwIp9XCYOGzwcyGcJXCG8hBroBKyCR0NYcyspOv9aRAdCtef3Pf2dS4HtjZigzTfkIVUaGWCY69LORg1FtqplAWmQmmEAY1OBWDEymvhMQwCmi3OCACsPmB3eZu7Im5QFnS1IZobCGBaVz2kJsm+pgMzy+pzaJeY7HCHxZ+vHFcJAXJHItkAwbq7xbpFjIAKCPaju2AI4rTVvkbmwT5tDX8Zvd1ZIRKj1UdRKDsPTNLp0Bxb3IukVolQ0hRkz8h6OsNkPG8EQsI9e58mNVRXV2Wg6LDFpO+5sIs8Uuv0re0YqNeGTU0LKIZFWlU1WDpVrNCTFWPoU5gLD5CadIoSqrLHYAJttLeh5cUMvARC33BW3l9MWj5qbhw6pv+9PxvvqnMvWgnx4ncY2JeRGh1o9FxQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(186009)(64100799003)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(2906002)(5660300002)(8936002)(4326008)(8676002)(26005)(36756003)(1076003)(2616005)(40480700001)(107886003)(41300700001)(70206006)(316002)(54906003)(70586007)(40460700003)(110136005)(6666004)(356005)(83380400001)(478600001)(966005)(336012)(426003)(47076005)(36860700001)(82740400003)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:37:07.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc96328-9558-42e7-58cf-08dbc0d80780
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454
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
 .../devicetree/bindings/hwmon/ina3221.txt     |  54 ----------
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 102 ++++++++++++++++++
 2 files changed, 102 insertions(+), 54 deletions(-)
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
index 000000000000..0fd8ae5f6a22
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -0,0 +1,102 @@
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
+                /*
+                 * Input channels are enabled by default in the device and so
+                 * to disable, must be explicitly disabled in device-tree.
+                 */
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

