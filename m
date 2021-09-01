Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD00C432BE
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2336F601FD
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245284AbhIAQUk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:20:40 -0400
Received: from mail-co1nam11on2064.outbound.protection.outlook.com ([40.107.220.64]:40064
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245250AbhIAQUf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 Sep 2021 12:20:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogUFgVs5K32hfva8oCgtB7YeHqfpv6IxhcFcLvzKIJJpQw7X8F0IhXyNQkQNT+z22gQmXQCN+D2zdKjf+5gr4jIYe064Drh/OLp1saIRn6fkqtc2vi0CE3X9hK/tN/i4NChQ5x5Qp0cqN0UIUa79QLwRKqY5esO3zEYeNAKQE5P2sb+7IQl5RCJe8kyNLHZsPMv82AA4tF3N4L3tTqjSm5u8yMElF0gfVtWNxPRO23Fe0Z+GdPEvuwF6zj67aHXrTUP+vHC4KBw8RfwpO3nflFQ2kYeeOv7fmeGNGA6Xj6dU2MoGndVC+/rpfGsb1C8r8/vuJ/9NtvS0arHY+67+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1Urvh8W8+anFYE68EZtDdgvfgkRCfVLsazXYK9B2FTY=;
 b=HRnywTrG0KZQg7ph5/WQoYrK2WJlJ4FEJ17GYzilybwF2AUZAvx/OZF5oa28TuB0M2Ku5/UgP6OxhxeCsD+shjZVHiaV5eumlcso/qdXPIgUQsQLc0mcK1auBjVYPED8isQpkpW9A1jruv2KrggRI8D/8jEKsy2fuZXmOGD9nE94KCpyowMuzSNIOuYG+Ik4G3VQoZrUFTbeuhqgzZgotRZB0lFxarvBQS9TgMU5bId+P2UK4kaVDWqjOTqSor3Vf98vY5rjl+dMQ/OpDIfIYgR9DTVJFMUX6co39LtPAU6/AmkfpOUcXwW6bmImaLXmhKdTpxIEBDrZQFZGBosVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Urvh8W8+anFYE68EZtDdgvfgkRCfVLsazXYK9B2FTY=;
 b=Udtdh6g6sdnSwmadhBXIwN0a+C50g36ZOQMR+mqOipluL2ITFFywCKZ1ymmm2D/7NW3/7pOcKj1b72nQajt7R7rd7xA/PkNN/3ekrKIPbQvJsc8ODG5NJda4uTrW4WfuupA0PB3chO356zQfviUYarixApHU6NkEoV8pEfm8IgBRs3DFTAAkJOZJdhAbOalBYlsHG8bDi5c8d660NXuL8A0mRTsARVAVS1utFzZNvB8BL0NVqpNrRVYAaf9KrRsrHAZJx2hvqmbL0T13+xjzNEX8VyhVgXuJm53s2QIiFSLnFy/8V6tybQc6YYqrGKKIB9Fbn8Rt+RDV8rq5lWkqSg==
Received: from DM5PR12CA0006.namprd12.prod.outlook.com (2603:10b6:4:1::16) by
 SJ0PR12MB5422.namprd12.prod.outlook.com (2603:10b6:a03:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 16:19:37 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:1:cafe::ba) by DM5PR12CA0006.outlook.office365.com
 (2603:10b6:4:1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 16:19:37 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 16:19:35 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:31 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <aleandre.belloni@bootlin.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>, <bardliao@realtek.com>
Subject: [PATCH 2/3] ASoC: Use schema reference for sound-name-prefix
Date:   Wed, 1 Sep 2021 21:48:30 +0530
Message-ID: <1630513111-18776-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
References: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d0baa88-7ea5-44d0-81ca-08d96d644b06
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5422:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54228234853B72BA83372599A7CD9@SJ0PR12MB5422.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBulZXeALw7kEAcX1oVHP5undEbeG8AEV5lAi59qdqpAR0AU/sTaS4W/kxk0FyybARRWGyG+W0SaglVnyB/abfwKlBaKClsOPpfl+R3F5y9dEHJe8f+ZOjzVIZZNUtzO083KeWrCVXdqriOjnkOu3WXGHSIHWcQAG3JPQ7f0y+U8sLt3pRgwqVq2gQx6XaBFq90mQ/fCaAzEX5b1dVneHPkTjpj+BiHTI01trNKxcwTzjzpcztB+BiaKBdlfioyux6xr/I7ZcIgh9c4JaT0mrfGAQeUOCl+oVnwXIdIcW2UqoVsZAz+N/q9F7Ym81vQtN3of2pWCFtVsjFn/md6BjcGr1mbGzuQwkkrCyFzDNLDi6vIXDg4Ymy91gyJPnwsZLp11bulOmcXZhIE1L1vAzUncn04XqQJ4gDuo1WO4BZLeCiG1MLz44OZ3M/2uMTslYsjRc/a7gO85+8/Bpb3aHfhjZSCpkN/utAIgdXej+mz9J0fWqS+SXsfAd2JIDMAu5r6YJ/luttvr3eL+KvjGkaEfoSE0LUWyjBkdkiadPtb5tLXL+ByvSAdzsGU3zr9QPA2fshs50AOT9uaSHOecZxFqyOmt69U+Gu7hn50P5yqzQkpki7rJ0XCAcf08WX3DdwiNluozOYHwQZraNfnbIgmq28eo8yR1Mcp2gDFLvTaIXlveDqqSa3JMrpcjgiZIDdkxrg8isyckuuKWKCHnRw==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(46966006)(36840700001)(5660300002)(82310400003)(8936002)(4326008)(8676002)(36756003)(2906002)(7416002)(336012)(70206006)(426003)(110136005)(478600001)(47076005)(70586007)(54906003)(86362001)(7636003)(36906005)(7696005)(36860700001)(356005)(2616005)(82740400003)(83380400001)(26005)(316002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:19:37.1402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0baa88-7ea5-44d0-81ca-08d96d644b06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5422
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use schema reference for 'sound-name-prefix' property wherever
necessary.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: bardliao@realtek.com
Cc: Alexandre Belloni <aleandre.belloni@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml | 7 +------
 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml | 7 +------
 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml  | 7 +------
 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml          | 5 +----
 Documentation/devicetree/bindings/sound/rt5659.txt                | 2 +-
 Documentation/devicetree/bindings/sound/simple-audio-mux.yaml     | 5 +----
 6 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
index 5f6b37c..ae04a11 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
@@ -48,12 +48,7 @@ properties:
 
   sound-name-prefix:
     pattern: "^DSPK[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
-      available instances on a Tegra SoC.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
index fd275a5..0f9f449 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
@@ -49,12 +49,7 @@ properties:
 
   sound-name-prefix:
     pattern: "^DMIC[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "DMIC1" or "DMIC2" ... "DMICx", where x depends
-      on the maximum available instances on a Tegra SoC.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
index 6337070..a830b58 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
@@ -65,12 +65,7 @@ properties:
 
   sound-name-prefix:
     pattern: "^I2S[1-9]$"
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
-      The name can be "I2S1" or "I2S2" ... "I2Sx", where x depends
-      on the maximum available instances on a Tegra SoC.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
index ffb8fcf..c93b10c 100644
--- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -22,10 +22,7 @@ properties:
     const: 0
 
   sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
   vddd-supply:
     description: regulator phandle for the VDDD power supply.
diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
index c473df5..013f534 100644
--- a/Documentation/devicetree/bindings/sound/rt5659.txt
+++ b/Documentation/devicetree/bindings/sound/rt5659.txt
@@ -42,7 +42,7 @@ Optional properties:
 - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
 - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
 
-- sound-name-prefix: Please refer to name-prefix.txt
+- sound-name-prefix: Please refer to name-prefix.yaml
 
 - ports: A Codec may have a single or multiple I2S interfaces. These
   interfaces on Codec side can be described under 'ports' or 'port'.
diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
index 5986d1f..5333682 100644
--- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
@@ -22,10 +22,7 @@ properties:
       GPIOs used to select the input line.
 
   sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description:
-      Used as prefix for sink/source names of the component. Must be a
-      unique string among multiple instances of the same component.
+    $ref: "name-prefix.yaml#/properties/sound-name-prefix"
 
 required:
   - compatible
-- 
2.7.4

