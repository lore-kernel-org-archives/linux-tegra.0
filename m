Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AE0C64EC3
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbjAaR7O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbjAaR7M (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:12 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36EE38B44;
        Tue, 31 Jan 2023 09:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sfpko5u/US7T+9Nh1RcqkrO9fcP7RkepeHAJGB1bFqAQluWIVGmrxMIPM8bOht0wave/FOqc6lCN4gL3Z/2MzTr2wUNDMRzQW2En0BdyS++501tQZb7oJF9KXcExAmyh5IFjV5/Th0Xnvt1Ggm21pt8aZaX2dciCPdfNhxv0YYAzMpbEk7PhJXa+YqOjBEI67iqRp1dnzVe6Sllz1W8eQPWU8F9wrPYbyDm11T7P6FUH8Nbuz+H+OXvJhfb0CvzfJELQcTwx8kUcIsi+233g7YmL/c6Zbc8925MocVwub9GMTzGfOtolPNIAHGmK/EhHXa94QDUF5Xfu/83/1aVNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aslm7a9SyXLh/GIMuxNvV8X7WGCAha4Hla78fxuDZWI=;
 b=CaUvaBVtEgenClvGUlZY5DDWYOjrMdCYw+mepUV4OyN4oXgKP1h4g9dB05jUwrqlbAHnM8OevfqMaWtAr2vDXud/RGsvUV4b43SRnQamzG8U68pFLQ7zOCNtwElZe0JiTArMlzGQhytpe0x0qLVuEUz2VT+asaeXtvRVpexDceKENvzhEY6DXjW8wsDMcIPgAdmUX2JX8Qj9CciNGY43yNbP7kaPGOtLrGs1/awkJLS/wqEX6s/NbSPKaDWMNv7VAKZOS4wUG025yy2/D+gs/LkxeGC4LM2jZQmM0CKpEoZYefVPaSzMEJr/t2uCFP10keDkpsUN2ln2LS6HZ23kAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aslm7a9SyXLh/GIMuxNvV8X7WGCAha4Hla78fxuDZWI=;
 b=EOUwny7WIxdbfUCD4orjyGyHmVdiCYr05dIarv1r9LqtW0IiohHkZDU7rZIgOsqonoa98GCAZJppzHiWcRCY/64mOfUX/5C8siG60FxTJqw81gFfhRRYEVoGBRscPo5z1+drhmJpDunkPBkdyGe2TV7S3/8XZn5nv/FXz8zosifqcSy2hxlk/UhLHMPhnwwu2+NbxLue38+f2wOayARjc/bTB+DPzcFoSbR/r3g2XBMLKderWLFGDz/gvgeKei2CdsBTeZ9QONvJe2onKEMWE9q9xY3mJTc8fUWEhPrHtX8fSLj9w20uUiifMdBuCGJNUusTMT+FCGuF+h6/SsxiWQ==
Received: from BN0PR08CA0011.namprd08.prod.outlook.com (2603:10b6:408:142::33)
 by SA0PR12MB4464.namprd12.prod.outlook.com (2603:10b6:806:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 17:59:08 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::96) by BN0PR08CA0011.outlook.office365.com
 (2603:10b6:408:142::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22 via Frontend
 Transport; Tue, 31 Jan 2023 17:59:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22 via Frontend Transport; Tue, 31 Jan 2023 17:59:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:52 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:51 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:58:49 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Tue, 31 Jan 2023 17:57:43 +0000
Message-ID: <20230131175748.256423-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131175748.256423-1-jonathanh@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|SA0PR12MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: d71ca5ed-df97-44a8-8907-08db03b4d915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXAiPIvmyU2eKdNb/OVKV9LHFehILxTpEKVFwLjcDG4pD7LrXTP2HbonOdGWbBpOELxItkWL9WPJa3xnLfRjKUOKW8qIdzlEBNAc0G/LBqbQuBnKIguvDwjSe3sfyqZiMs+c4wEM8Nox4lz0modqNvD/Z4vH+dHDL74aP/ViK+VMeN/gBY0XgRJOdkoT4fB0iXQXFJz4xgmP9I6KMKa0S9XFq6xSjdf3SG5YRdJ/JM79PfgGztBXxAgdV7Q3JsuUWP/K4Hy/sVDkdWL2X5iAELEpoRzywiOqLFm5Ob58ZiLwzUDbuDuP/jUv8l+AxYaF1yxyqBEXZVfIjSSILaIZ8XrGD+oW+xMFMvWf+SBCPlIF3Q76Wmnk4ufoeblN5Y3EVGk6SWIJaAXZpbkG22DiqNiLASCfWwMrAI30MSi7eQ7laZS/NzR0ZP3eXFmQ9d9u1SPo5AXrjS27ErmrGepr2OF2SMmX7pHyrCCHAqBYpbqVQIuzdoj77H2oL4L2/9fjEF6SmnXmsSGj9hHqlSbIsEcSGrpP0KNJVtIo7LC8j7/IwE9zWaZxx47cbTP34gCYc+qNuXh9vKWat2rTm1WJKOEKNs81k9O0Px8EK7JQ8UN6kC2PJCXf/qyFGYE9mA9+1xapA+msPPsy3/GKAEWSdQWh8ehErX4mF6D9Zt6lWNvZaGKc8jGVuFUxMh9c4k7/fKDzkmZbA/AzoB/gtZWyMIg42bpqG+A8N+Px++hvZ//b/DT+b1P2rJ1Kzt7nNLePr7Lw4c17k13iNdBBNfHRPwszDNTiHIl2LegmNX1z51ovOnbjgcgcHmIwEoHg/lkX
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(2616005)(82740400003)(7636003)(47076005)(36860700001)(186003)(5660300002)(26005)(2906002)(40480700001)(356005)(966005)(478600001)(1076003)(7696005)(36756003)(86362001)(70206006)(4326008)(8676002)(83380400001)(426003)(336012)(6666004)(70586007)(40460700003)(110136005)(54906003)(107886003)(41300700001)(316002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:59:07.1308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d71ca5ed-df97-44a8-8907-08db03b4d915
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4464
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add the device-tree binding documentation for Cypress cypd4226 dual
Type-C controller.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V10: Limited connector indexes to 0 and 1. Added 'anyOf' to ensure that
     there is at least one connector present.
V9: added 'unevaluatedProperties' and 'additionalProperties'
V8: removed 'additionalProperties'
V7: updated example to use 'typec' for the node name
V6: no changes
V5: updated subject and updated binding to use 'firmware-name'.
V4: no changes
V3: fix additionalProperties warning on new schema
V2: based on the review comments. Fix some addressed issues on

 .../bindings/usb/cypress,cypd4226.yaml        | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..75eec4a9a020
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -0,0 +1,98 @@
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
+  '^connector@[01]$':
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
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
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
2.34.1

