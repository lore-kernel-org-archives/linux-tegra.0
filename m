Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782BEC54EED
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235400AbjAYUnD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbjAYUnC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:02 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A944EC1;
        Wed, 25 Jan 2023 12:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9LhL4bj6s8pdGRW1+Z+9isW24hnQSpn4vDieYU+5mQWkGKP3Y8EJ8cFdc1VNkhVh2HyVvGNMMgpEqJdEJGWLQ2jqnBDKHpd7uWIItEyFTiq5ApcHFl7Gmpowy9lUvulMsmDMnjDcDTHJ7gy3IwDF+xdo40Xs/uhLV1wXOMTq+M21DdEXdblOWqCN/IW4PqcdkoT5ZhS4VJ88295Uh9Id8BhXKmgwx2JSumUhDFTPt4H2mFPI28lrb+M5LreFDgafvx0OALJUHIqYLO4TxDesgHQyg6+jGEaELkJPJWblN6nYSs15Riq/y0pNZ3YQbMpatKFohBeRHvmC5HOd/ZM1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6HbiRZ1urvuJmaxuQ6LZw8uIshhdiNrPL6tdTCA8zY=;
 b=BhhRCDLW6QKb1SHMTDLACwNSHZTC1fo7UR4VHRPIqW/yJUJcolZU1FQZYGNICzOKdTwqkUpTYy5DT3nUrL5vT+xFR+g/Td6jYKmbqTNXdrAUSfMCQ/4rEPRfjYhvvcYou0vvKZtVjZaRGgBWs/tL5Rxvr6EcIKOmXwSqq9gE9oHz3JYdCuRLJut2oIYKZrgq0SInWoaWfgFFo1q4QFQiPOCBl8x++Nhky3gAebkKJOHeCgPT3bBZcBpzIoMLS1qI9IVRfHBU4x5oHmTqmrgWb9TMBt72iZchondcGCTC+tPe4geulg/Kd/PXZGwJYn7ZG72cL01lMdAe2dsUqxgSSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6HbiRZ1urvuJmaxuQ6LZw8uIshhdiNrPL6tdTCA8zY=;
 b=QeWhhW/0uZe4kWnxljn/5WDozoj8yto4vwGo69sz649pKkO5Aie9a0qjqfGfUX9OwlobSlUA7pYRQVbYH4UlJvpLTn1ssyF63v/N9/bOJZWkSWSleXOxxDZ6qteAmUXqCd9cGyU4xNPZSisqt5mDaObhyfImRSs+AQI81k15PMr1/mNhDeTs6vU+Z5HTMBqox//t4vKE49BOYmUYedfjyu2o5ntz4aCLiBwulgF81bpMPiS9cLdzDIMCxGBaIwA1Fgct3l0Mo6CeinssybfbDYkekH+hdg/ZOOM2Mgzi8ChDoVl7zaYOTSwD8xFS32cdd3jbFK801iYlcWa0ebrLsQ==
Received: from BL1PR13CA0150.namprd13.prod.outlook.com (2603:10b6:208:2bb::35)
 by DS7PR12MB5909.namprd12.prod.outlook.com (2603:10b6:8:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 20:42:43 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::a6) by BL1PR13CA0150.outlook.office365.com
 (2603:10b6:208:2bb::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.10 via Frontend Transport; Wed, 25 Jan 2023 20:42:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:26 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:26 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:24 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Wed, 25 Jan 2023 20:42:06 +0000
Message-ID: <20230125204211.63680-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125204211.63680-1-jonathanh@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|DS7PR12MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 08985b5d-fcac-4002-23a3-08daff14b4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h/kMzXGUBN0KtGoMolaLY3J+zAxmikhn6l5SRSt2MhCROa61Gk3DK1QxKSqUtU9gY5lz91GWsvyUq8GV5h5446WtWhNghgrRf0xyJC6OIsQdwEvjHu7bx7n/PQSIBgoXg0UnsuwBJjMvRt2Pfs4GAtrZZ24SAfd7sXfmuxee/xLvImYROtIf3n+/G9DbS404LG+cyz+oYznBFYAil7Evj2F+BTPx0kl0Mn4LuIkl4zyC4kMUDh9s+splLU41FYH0N1j7ge4HSX7L21gC/FfBZKXQVSPEd2oFyAYCxoxEj3BJQLlsOJiqThUV9yp3C1wRH1FjIOZoE2YsLWmHFTwljVHK5PYAhOOhh3U0JP3BPHwg00c80D5MuLWzEp2pVFqYpmlNmnfFli5s7Dd+4VXdTmxSdIXA7/Cg+ox6jIUGhlO6x8WXu7hP1/hTOiRZwbET9NxX3esuCG/1hwKju68ClYa+0I7RQFqA+kNzU5a9IV2V/pyU/5cBlErGsiTpZIaEuEeTrmgoSMEN9Ax3j77+C4bUqx48scZI5OTF4Erw68r/ztE3krvXPhP0NE83PhiAgcbsgOL/rlobHKapmZ1iJCPFEVVtZgOGKNbZaZfyCwot3tVlD7cfGqUURQn5z9kkTZA+a8+D07+B5VQ0Q+gibWv/vFaRgNrlRlD5Ap8P5mrIW/f+pO/+v93jO7Op6lNi4Nw9tM0/yMn8w5cdCUXgtPzMWOthOYPitU1L9R0/fMaGWWgLYSnLUCJB5sJfppKhoaMp/6eJxfyfy5yviRI7XMkAuaROR8oPqcCTL2GNFJm593KhrDEyemoiYIvH1dIR
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199018)(36840700001)(46966006)(40470700004)(36756003)(426003)(2616005)(41300700001)(8936002)(47076005)(336012)(356005)(5660300002)(7636003)(82740400003)(2906002)(83380400001)(1076003)(966005)(86362001)(186003)(82310400005)(26005)(478600001)(107886003)(6666004)(7696005)(70586007)(70206006)(4326008)(8676002)(316002)(36860700001)(54906003)(110136005)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:42.0685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08985b5d-fcac-4002-23a3-08daff14b4ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5909
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Add the device-tree binding documentation for Cypress cypd4226 dual
Type-C controller.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V8: removed 'additionalProperties'
V7: updated example to use 'typec' for the node name
V6: no changes
V5: updated subject and updated binding to use 'firmware-name'.
V4: no changes
V3: fix additionalProperties warning on new schema
V2: based on the review comments. Fix some addressed issues on

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..7ab23d8fdb20
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
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
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

