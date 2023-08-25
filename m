Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868EEEE49A3
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 16:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234225AbjHYQnu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344099AbjHYQne (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 12:43:34 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05ED2212C;
        Fri, 25 Aug 2023 09:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obsqsJzGECb9G5U30EL7SrXtq3usoW1BENiv6bViEUSe9/yVm+rbYUb747XAMyxvE57lh8r+Qsnroh5VahqNU08P2ke8lsd57uqcD1egN7L+a9Q0nzOB2B1ZK3LmN07cSuRiPsxQpJhvofMAEqV8Gh+X6P30ouAdjWaNMJodvSZ0P+qAlL9KQTZK5PPLQUbXqHYGWJr5V+k3y84GHKnCkXUfprz30Mu/h9zLHnWcif55JCxwPD1Fr1NEog/l/iWF7eRY8I6dQLVH/uK/uUFknN1gnh3ZKQLmTlDUt59XhhjlEW8QmqMJLZxBptu5QyAINT+87Wpl18aAwFeM3eYA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyy97ePwUcdz2l/7eJX1rTa/CnJVGwXQDZ9V79Skt9E=;
 b=h/dcTLqjD81qu2nl28bbT4h/VplriAY0e/u6+vXAu3N9NlRj0pb6DRzpZOH96ggiOphxf64Cf5UE/b7WhWqg8+zCr6IQgT558o1BJaSU1ZBo59DVrzeTk6EH8cfn++nEkiPgi0B/GVNG4HoMfR7/q4JdvWJ7NOq6wnDgrTBT9t19j3WdPYfZE3ub+UFFYWdXGzZ3MOuQx5T9UcsRmC4DvaDgmkU8cogXi/0xTVyBR039M3HHoowtKBKvpG4ldKY77Po2IdKQUcpCosI+zoi/vKy7I1X0KfFhq99cDDosbU6ZajyTrFAJO5GxF6xyDzOunlYvy5l/vHxPbrQqD/R/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyy97ePwUcdz2l/7eJX1rTa/CnJVGwXQDZ9V79Skt9E=;
 b=Sahh4zh4H0ZuK5XE5O/DKBUfi8oYp0LmUNBDJJqKk2j4x5Wzo/qm8pGSG5MhlxbADInv64RsBB9JKOMSDyNHViElW5TJhY+Qudf0otjPvU3BYbWnqVp01+HHTuiMannLs8dNy+heLIas2jwcdAXpQvEUlYJJqCw/MZH5TDqMhgsT/kffF1T2AKUdKdWuTHYSQ57ORdYwc2EWcemXSG24iMuzmbahw/Vr7FqPpgP8/PAW2nkSdxNjiyunuSzrWuPU6doxKgcUckxbXx89aIWL1xkIJOe+IVVqO8BiTuQU/6lzd1yenZh2rMUQmzqL4lpDNlxj8NeXsm+bC+0pZv/1KQ==
Received: from MW4PR04CA0210.namprd04.prod.outlook.com (2603:10b6:303:86::35)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 16:43:07 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::fc) by MW4PR04CA0210.outlook.office365.com
 (2603:10b6:303:86::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 16:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 16:43:06 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 25 Aug 2023
 09:42:58 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 25 Aug
 2023 09:42:58 -0700
Received: from nmalwade-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 25 Aug 2023 09:42:56 -0700
From:   Ninad Malwade <nmalwade@nvidia.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Ninad Malwade <nmalwade@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH V2 1/4] dt-bindings: hwmon: ina3221: Convert to json-schema
Date:   Sat, 26 Aug 2023 00:42:46 +0800
Message-ID: <20230825164249.22860-2-nmalwade@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825164249.22860-1-nmalwade@nvidia.com>
References: <20230825164249.22860-1-nmalwade@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3c550a-bf8b-4576-9974-08dba58a5bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKbl5IwROQyPr8IGUIFzo88UsbtaMcqq9cppjT77k8Boa6GsBMGT+xW6MBpvL94Y/hW8momf+nGc8HYkyx/oAYqh0fniZTjlmRdtApQiUCWY+Y0wg+ehjv1gvJvwvcwOKsQNsw3vvQkVOjJ6bu6yPNuAqQ+qL1KFHS3SfsgKvcSGePM7uGgEy0djUdwGETSVb20tgVyeLGTXkxwvOr4xsjclYybSdgd6+QUlKA+03VlyglhFJljZtHfm54JbQm3IZmuYyyKyIilItmn1oI1OgJxU7bEvsClaQkkzaX+PDN0nGTYRtIx4o+/yOPx5m5tz06J2eh/Paivm455dpag4yFMSJi8tgTNUQ8QMSLEkyOFMFBMZAKHIMDGCM3k19I0XucItC3EluB9xW8RpG3NIIXqtDahhOTsSiigX0WPjw19eRqM3NbXQKxzMeq8Nn3PEMc9Qtv0swrE6BcZ7E9sXWy97bTyglYLP67BkwR2FSTyUJ6zSqDFWYamGqRuQmIxjx3rZfa8OUOn7WL+y//njegUZiUzSzeIO/CtEhImsFepE0HygQiTBQbHMg3uiJgAMtpTXvHuxC49yTdieua7v2nEL6VZO3GVg2xgvBwxaiio4wmflCXAhmjnue5xghQ0FabUyAMLxPaUims1Rs2W4zS2A0R//z5CScwzQ01yoF0WUhUkq68CWwT4oxqFzSSrS227CtPnu9RWiOOlC2HTmVYTlvPgnmKIjiwY3ySm2GtflEDKcf/BXg8dOla01xayY1RhCcD3fAxCtPbKVCQKYrgPrAgUGKjyLcUtsMHlAIRE=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(83380400001)(336012)(426003)(107886003)(1076003)(2616005)(47076005)(41300700001)(316002)(70206006)(70586007)(8676002)(2906002)(54906003)(5660300002)(4326008)(40480700001)(8936002)(110136005)(478600001)(7696005)(6666004)(966005)(26005)(82740400003)(86362001)(356005)(7636003)(921005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 16:43:06.6743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3c550a-bf8b-4576-9974-08dba58a5bd0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert the TI INA3221 bindings from the free-form text format to
json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Ninad Malwade <nmalwade@nvidia.com>
---
 .../devicetree/bindings/hwmon/ina3221.txt     |  54 ---------
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 109 ++++++++++++++++++
 2 files changed, 109 insertions(+), 54 deletions(-)
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
index 000000000000..0c6d41423d8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: GPL-2.0-only
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
+      Each child node describes the information of input source.
+    type: object
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
+    additionalProperties: false
+
+    required:
+      - reg
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra186-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/tegra186-reset.h>
+
+    i2c@3160000 {
+        compatible = "nvidia,tegra186-i2c";
+        reg = <0x03160000 0x10000>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&bpmp TEGRA186_CLK_I2C1>;
+        clock-names = "div-clk";
+        resets = <&bpmp TEGRA186_RESET_I2C1>;
+        reset-names = "i2c";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ina3221@40 {
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
2.17.1

