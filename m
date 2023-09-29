Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4726E7F154
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232977AbjI2K2D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbjI2K2B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:28:01 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2571BC;
        Fri, 29 Sep 2023 03:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gyu+erusCLtplk8gvqLZerTR5/SC1cV9ny7+8A14uohSGavR9RLjRwUrWVf6bySfCs7xL7SGTLfUpxcswrglSCHIfxkbHc2vYc9d+SzJ9eseMK5n2Rjrhnc0roYvo3qr1MIpcQ6wnVI6VbU0EmcJgmFhVlCyvf0szBNHtQZ3uKkPq2rLWIe2enFRDBuvaw8Ci/YOQrde+/8mcwzA1MCMrH3dQlcjyF6nekx3+qHzBoFsvsYv1t+3RJitsj80QleEH6FGKOgDCNQJINNVDnEwriF9tuHmczarAJl2Zi0aVy+QwKhnFIifIWvqU81tB4YTaD97I3cL8GZd7ZM1xKxW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elHLBbtv1zcjEj9anL0X35M1mh+/aEBf2anjlL6RkzI=;
 b=XKU+gWAECqdM68yh6VFhFQiF3DkSLIhu7+J9v+tgQ+zFYIEDldA4tSYTXVq4SzE0okYIyuya7/iilCMjKJeQry15HNp2HvlQVzJnjb+3zap9gS1XrhJOfJcDqic1smmzdYTguOJIyFa4Abj2PI6+XQWNkMjazKRrBiEbv3sclUYo6nk7kschIGm6SJ6OYrrJEehNME8SgofHDG0Gul9UbqipvaOZWwLUtb1m8YIUYZ9N7ZIFAJthmGS9je8GaNNK3C0fytZjmPbqq48tnwP3uhhsyfdiJac9+a64nK89bZ4ZpLVbCzcAJ6ziSbVQneCNB4ZG6yfsbNUE1OvtHqDmPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elHLBbtv1zcjEj9anL0X35M1mh+/aEBf2anjlL6RkzI=;
 b=FEwekaZ40wRTkAx3RiWoKqMPfzr4rzb/2DczozjYJX6WSHhXf0VwXTX1/4usKueDzYa0maAkasYbN/6s9YQDa8fO7A+wvTKDzQkxyXpCuPiTjgq/ks5efiQznKNlujCtuyJugp3uY6QSaqxIPtadl9brOrJiBeyU53tkfWSm+f17DmDal3pkgoYe7v4P+WwZQjOnSSB86wACnyFUj5sUdZb8cMbfnm3pjWS/wcrbp/6cXSVNSSQh6OpulA19bHvW4zFp0bkBdgVKDEv5qmcWCig1qkR6kP9cSEW8BEKjiwdaBX/tCbRs4P773n5yJrBBOE4TfnQ5kS698U738hVbXg==
Received: from CH0P221CA0048.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::29)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Fri, 29 Sep
 2023 10:27:53 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::65) by CH0P221CA0048.outlook.office365.com
 (2603:10b6:610:11d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:27:52 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:27:52 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 29 Sep 2023 03:27:51 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:27:49 -0700
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
Subject: [PATCH V4 1/4] dt-bindings: hwmon: ina3221: Convert to json-schema
Date:   Fri, 29 Sep 2023 11:27:41 +0100
Message-ID: <20230929102744.84989-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929102744.84989-1-jonathanh@nvidia.com>
References: <20230929102744.84989-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad9b062-bb70-4f9c-33be-08dbc0d6bcd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /MuVwRpc6HjYp25hHbOkT6kx0o4V0yuofIhkEXiDUjxrZxHRXGXxPj3OZhk+0rcRD9iz5f//STev69OZjO5oB9509jQGeWJKe4b6NyFNPfgNKz8Yto/frYAyd5IuNnZUk7iNNNXPXNOwd5YxmQcZ7HUw18K38dg1aX8OKzRFRBDurYRhQDbqrWcfQpjrEO39OfKbtX8RCKczhrKmF8pfKrhW6aIce3vxDHEWvVoh7lnX3ewNvFKdK/opUdWBMHtDXdXVNuxcBw2/8XYURDYejwnjJZvaCQD5HmIGLZ7OVyJP8GC/IOOVhAMYlRu3JWu0OcZoPsPMvtIGkGueB7KSBzrBkvOdV1FDPwmFc77UHL29kyfWqgEXZqHWqiLFLjJQ7ZpBLycfZ6iG2Z98hJ8aGmhgaKhm26BIaoGz5/Jo32u3vEhbJU7UU7Hz9P2YXYTjS3g2JUfbWsfU2pxQfRGNoP2+rC8m5FVPbi//IZQrmlNpQllrNxYTe4KDZ+PNHiaz/laIKK4RMpAWD2L/jIQtP2E6zU9B5PAydzVEKi75QFrq7b2RxLPNYRjQbqqqjkK62tzboP555+v8bQt39NP5BhxJu3dd/mNBVypNnrDgwkUDH9v/BNhdwZybLNRrCOXRtjf+oSKy92n98uoExpA6KHv7g/NuUo77V2I7Gxx0m4jaPdEnmlT0mW6evtD4JiQATb347S6xW3k2vf5WrtADPl63NMs9bkwcNqelPY9nZ2WbCEf9h8CHrMIMWuBqveJpY1Jt3OloGTmrSF0Hk1sU+A==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(82310400011)(1800799009)(186009)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(41300700001)(110136005)(316002)(54906003)(70206006)(70586007)(36756003)(426003)(336012)(5660300002)(83380400001)(26005)(356005)(7636003)(47076005)(86362001)(107886003)(36860700001)(1076003)(82740400003)(2906002)(2616005)(4326008)(8676002)(8936002)(6666004)(478600001)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:27:52.5561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad9b062-bb70-4f9c-33be-08dbc0d6bcd7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437
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

