Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF8C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjASLSU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjASLSQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:16 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392286B99B;
        Thu, 19 Jan 2023 03:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKdbBHGLYdMyeDzXAuewJ7HsgXGbG25cdtx3kn2Ytnp79vIOqRSld6QhoU1JY8OL3ubPj4SOygVRG/Zadmrpm2MMdLUF8Nl0DO9bBb518/DvWd3N6XFB1mt4zNhpzyv2CbLH25b+ae3S7yb6nbCN2hm0aw9cVx+/SRIzPIFYIgUMqlvbY4iTqoHiTtzCe6eK1PxMbdEA9JpCh59t9njR3atC58JQ/PhaXqC/W7lc7u/GOwDul8nV1dKgqW/BshXrIRr3mazv4TEh505c9wRwGbFnTnDub9R80CzbO1a5SX1rstQsawD+UijFokqVbaQaXJrgNY+dDGexywZEFrRnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mq7T8TiNCsqZICMZGwkOWqDlv5GvYjcPrNFWKvEkbFk=;
 b=dn8S60DJTV+fOIeORQEDab2G51gDb0MyILRB0x8aEFni9481lyorshrOxieCsLWY/BzJC9jpfWCpbaOtchUmGPOi8c3utIt7G+8Vzw0bW/oRZNyzQTg8JoQnOxxp6+pBl4gRI7i1QreIvlCXD5Qm1KEAjg52kLwmOFMNBLZak9n1XlCeeNg0b22TdgS6OVFNcplchEdWbJxDeZdJfCfu9aSUdJA051nowV2hUgaEFxI0b7/2WuGZ1TA3ovlM/wxdsFx1BG2pXM7g7nBSr/PJcQ197XDDebFPQtMqSht5cQW5GOCM9yk7+Jcwko8KcRfnIHPJinnhNVALNG9sA1qGgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq7T8TiNCsqZICMZGwkOWqDlv5GvYjcPrNFWKvEkbFk=;
 b=RKS03xzsmv92n1tMlR7z4jfTpyX9dFIIqW/iqNSiHXoX5WmMcTS72+gV9BdoVIopiFwSxhkzux7EyKOoDF5vJvS8MmYN4WH4LTs6fzUAHl9VF5EGe6IROOJ7rggfVBzFkLqVY4ZiDtsdGsJ5jnOWWVaPC/72K85HCL6W1idMFWZFex6K0M5T3Fl94mKwIfyVZ7rPPuASqxDMEYt8r9uRqmes4wZ+C0FqmdO3Le+fdlk2PZvE089FdNptGVxg3eyUkm+GTezs/R1ewFNzeJzqvmr1C+m9mXCCzoc3pP5Jik9pHaTNfMHG1AichpnO1d/TxU7MaVWzlwINYIWRrglz3A==
Received: from DS7PR07CA0011.namprd07.prod.outlook.com (2603:10b6:5:3af::22)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 11:18:09 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::2c) by DS7PR07CA0011.outlook.office365.com
 (2603:10b6:5:3af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 11:18:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:17:55 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:17:54 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:17:52 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Thu, 19 Jan 2023 11:17:36 +0000
Message-ID: <20230119111741.33901-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230119111741.33901-1-jonathanh@nvidia.com>
References: <20230119111741.33901-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d142053-2970-41e4-b5f7-08dafa0ed820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CCNlmy+ScPaklueFXlA0cWpabcmA8MKvXqo9Sq4iehgVe1HrenOEa8esVrl4YOZXYzTfoVGLIljAYJePai1gtErz/4FnO1EX8iVuvH52uSRN5Dkrkjr5ZafY/fHvzvvNWqEXfWlNPoqNiU2V3Ih5juD5L/orIRnOBfD2O9DfO4OsRkTjyWRygTVPu0Wrws27Kog5vS62SJGJJOzTiqluZvPpCyMWM/sfjhl3EMMQgheLZ+MfR+MMPEciSM95+XIwsCP+Xb+rKbFDNDGoJCJbXs1zHZwNZKdyvO7Xm/dErGDnPHw14BqQDeIysSWFCjlCczI0rheCAusPiGlivUcWLiMOCYwF6IIBjT3Hgr/AM8Lg08PKNCOKTaGqsXQHt+aTEd6g1IBoVawypkJbtLQOEVghtxS66gtBepA5MvRtMSaKi4ABMoxlouXDxXxZ5VhsJSw8vZkWruC4N/VaZ21prbMhNytNDIYYtOPiEFe+SivGPqWsrJRPHFteaOmUqxuoKStfAjdJBUTbt17s2DBAPXOSMykEkiYsL8yCiF7h7cc0M7nBcteJPvNnkp7sZGzrfIqd8kFrhHd95vTuLjOijU9rqwNWm35+MScve6bTBoxc9YPqZwWHQW0p9cVdJvzCHf3LxQgmt1RSoVPxhaM/j4TgSguVz2ypLQn3duFqS/Hzh04+A1adOq5c9Ol7cXGGA70x7t8u1EEn5cPv2HKIJ7tygYmSaEHSTrU1ZcbEvIBcuYhOxB1sewOP3QqB/Yr6MYpi132ijJ4VhQNX2UKYlEKjCF/ShkrmaimKZZTuW8QN03jWxraHsu6qNDh+4kE0
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(36756003)(82310400005)(70586007)(4326008)(70206006)(186003)(8676002)(426003)(2616005)(41300700001)(26005)(47076005)(316002)(54906003)(1076003)(7696005)(107886003)(110136005)(40480700001)(40460700003)(6666004)(356005)(966005)(2906002)(7636003)(82740400003)(83380400001)(36860700001)(5660300002)(336012)(86362001)(8936002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:08.7292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d142053-2970-41e4-b5f7-08dafa0ed820
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add the device-tree binding documentation for Cypress cypd4226 dual
Type-C controller.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
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

