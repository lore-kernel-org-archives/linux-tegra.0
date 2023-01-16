Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CA3C54EBE
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbjAPPva (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjAPPvZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:51:25 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F43CC0D;
        Mon, 16 Jan 2023 07:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IniuvupnkNQ/HTjYCU0dkb3CFg9zKSSym4L6Cx9L4IYNaS8vVJEoJQWgH7mdeoTC3xgLqTaoFOD+OfMUQukR5zFdM6+I0q/8ieAv7tSKRw+8scz86iQk5TMQgaAyxwsZ4qk5pD3kBnusfBuwVtxVp39sqdfoRfBe/f9YuvJ/tasK0sBCwHEQDo8U4Uo9eKuvRSdVv94xoiwE7u6szDbi0Mcj/znn2icOwkJoMECPIwW2PkRxML2SsIkbBd1C2ROPpkt7L3HnkiAVUF16UVLgPo7dTvrKozyyK5tC3/sMAo9l26nQTp2RwNPkekVIZ7C5pQTbMNYAFVcgTgdw6tVjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTQdoUINfb0iEOrD872vLYF8OZgxImmj53n5yi2Uxko=;
 b=IzToy71gQWZ/vbzQIEbH1mqpLl2KNyNZCgPs8SkRLW/PqQU7yXlwG4w0/Lbqg33OzB7uzpzE+9x0eVpikUJgH7eBNktJSCTjS5juzmEq0W/Pfq77M9wf5H302y4lHBTZz3tNpcunAwoNNOc0vN8Fb0HUj7S2iO+GxpwBK3yaGydqiJD54OUPf9p/8b/wnP1i7J2+TSiNaxwS3XyFJLzUO+lQWpwOxVOmorNsVFoziJUCcvJM8dbbFZ5iPluFTOE+b5Bg0uvANF1aM7ZAA3fA1oU8hEWc9OGBcwMcZH3i6JU3ki1JLnRkUT+N4bsv1OFmtxFppCFs6gLFTErIQxiZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTQdoUINfb0iEOrD872vLYF8OZgxImmj53n5yi2Uxko=;
 b=t4+c/O3JPwQp9tuqcZZ3w86JlTttMDfUcpln1XNSjO9yd4SnVAk2+2Kh6jTUCvEmQ4+KEEtXzY9dHYZRsllq6y7yxV0/yOlk6jZimNFnUzoS9zb1AGzNnUEkN5Z9tfpX+G+J12qfR6OpJdLei29PqNoSMP+A95/TohHRw7RYf635iKzLsOtpdaBqIRoH/Kxcbz4sLhRyRYdlfP64FcjIGNx+bYQYshyVZO0Y8QNEKWHt2+t9cf44anLRox0eG7KzmpoO7CHCqzF5QEKk63xRZfC9Ml+JLspYT6oGr+IYYEzr3MvPk3CtMit46y7E5a7vYG8EsceMyxGwTtEUVvcxcg==
Received: from MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::13)
 by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 15:51:19 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::bb) by MW4P222CA0008.outlook.office365.com
 (2603:10b6:303:114::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:51:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:51:18 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:06 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:06 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:51:03 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wayne Chang <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 1/5] dt-bindings: usb: Add binding for Cypress cypd4226 I2C driver
Date:   Mon, 16 Jan 2023 15:50:41 +0000
Message-ID: <20230116155045.100780-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116155045.100780-1-jonathanh@nvidia.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT082:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: d863578a-2ae8-4f81-39f0-08daf7d9823a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5YA32rtJ69obmZrwN3ysRS/sxhtwa2PdX+JBk2u5zYF7+kXHHj/oq6oTJAhzCrxfeo9b8yCgAhWtKZbG+mw1VC/U/EhUtcqRD7qIB89yXHxboUHgJlWd19YbHu472CpcylJE4YT1D0hfOtgXODs63bpE4gT/AVYlfiiT4aZYRwbs4dxNzM02PN+hDY5VCt3QM4zhIdh1h4pTBcJWPvU22RYGgsSExNgkkOu4MaTxNviNe6joT6yp6WNeHi/ddFXxHiT1UaKmHRj+k2/fYqpw809Vo+M3XGGY8UDMrxH2prxaC5NWbBpS+rI/91TBhMImI+2yibCLfqhM4AWzoVz/tb4XhBD3JSTa5JyVEqb1a2gx3MCJXKKVXUQgY0sAHYmWdSO3qGo2tRXwTxLbaJ3v9CadcoHghHSBt5EoOaLJ134XCCfT/moSZW6Gc2DJD5ZR6ox2IwZblyuMJEwgEbZ7NlVu5LfgD2ErZAP2HLoQdBhKXPaJbGa73ZDU9+09STLqJe0d2q9GI6CY9hDtLTl2BXe5C64W7onCwlNR6pdJmkeAAiMMOxGdv8+BK7CZn2cLVdumtcB/LW0TikpqXsplbni7Td+AgbUdNQGegzy2Dfcoj6gnvu/aD1MTq/quRL8M8k5FGLujy6BoJ3gCJBewbdaEf1ZxX58FEoZYVGU9ccykwvFmIjs56CBeJe+MjTBMNfn2YzcK7ZziEYP+ntsp26gErV3xBOCW/tIvF2lP+jjnl13jI8e3xKmLyL5ym1YlGUXsBdQDziB/n22EmtGfwjjqsu2SrCPTuGCH3fVo9vVDeyPS2wy5vWnPfbsZly8M
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(356005)(8676002)(82310400005)(4326008)(54906003)(40480700001)(70586007)(82740400003)(7636003)(316002)(336012)(426003)(70206006)(5660300002)(36756003)(7696005)(41300700001)(47076005)(8936002)(1076003)(2616005)(110136005)(2906002)(107886003)(6666004)(36860700001)(40460700003)(966005)(186003)(83380400001)(478600001)(86362001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:51:18.9601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d863578a-2ae8-4f81-39f0-08daf7d9823a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

add device-tree binding documentation for Cypress cypd4226 type-C
controller's I2C interface. It is a standard i2c slave with GPIO
input as IRQ interface.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V3 -> V4: no changes
V2 -> V3: fix additionalProperties warning on new schema
V1 -> V2: based on the review comments. Fix some addressed issues on

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
new file mode 100644
index 000000000000..5ac28ab4e7a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd4226 UCSI I2C Type-C Controller
+
+maintainers:
+  - Wayne Chang <waynec@nvidia.com>
+
+description: |
+  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
+  controller.
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
+    maxItems: 1
+
+  cypress,firmware-build:
+    enum:
+      - nv
+      - gn
+    description: |
+      the name of the CCGx firmware built for product series.
+      should be set one of following:
+      - "nv" for the RTX product series
+      - "gn" for the Jetson product series
+
+patternProperties:
+  '^connector@[0-9a-f]+$':
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
+additionalProperties: true
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
+      ucsi_ccg: ucsi_ccg@8 {
+        compatible = "cypress,cypd4226";
+        interrupt-parent = <&gpio_aon>;
+        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
+        reg = <0x08>;
+        cypress,firmware-build = "gn";
+        status = "okay";
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

