Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5CFC433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 16:36:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 516B3610D2
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 16:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350071AbhICQhT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 12:37:19 -0400
Received: from mail-mw2nam12on2075.outbound.protection.outlook.com ([40.107.244.75]:27233
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350057AbhICQhT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 3 Sep 2021 12:37:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQZee4PXNZ0sbD/A8rNPS5Dg8qbTR34eGnBTwmoe9N6RpaY6pp1frA+kJerBloRei+LW2g7R/dqN1ngXbtcDzO9QZOK+fEjuskotebkZjR8xfLyffFrMel0R3NDqFH32R9A4JZR/xg/lx9vvpD/6GFZLc9AUXkXA2xaZAh/pNy4upFypfz2frZGbWdzEk+lL8r/G6yn/5lPA4r2IFMUQxArXPX7Cdw3HBUN+EqlPTB4D5THpm6m2fuWzpxyE04cEfvaFUaq6+5lwSzEWgq38TcdJmFJHMj3YMxH/H+Rwhs+1hELLbXcVm4PSr9QGSUJSkvE90vzOhqgOcgq821cbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IqYDkXfxFiPyPl1mKIxBWrw6lLH23mqdxkSJRBoeKAs=;
 b=Vf98XlIT9HeogPIG7W5xmR272ATymWf8Tg6a+Dzohsbt+ZCVil582a2BJB8fytm6U8hJldXioMqbgMZxEuIb2zffwMfglLNVbeevyddXTNpSbGuxX/y3+c/zZOr3Asb0ebGTZtigdv55/44U1GazHrvQETLwOO0vdrKLrchaTD9V2OwAOVm4E1XkAtzPLT8Ei/3L1xHQfo28srfo36VW1uSSDZmDgec1WdhuDfHYkTRbAuIUSwaUrkg9Y5y6HP1tNLH7ayKeAxVD6JoHA/1yC7CtNKVTOA1MdFRHe46YVdMNles9cPsT21ylu7DXIf51tpA6LSADep9ifY3nmALTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqYDkXfxFiPyPl1mKIxBWrw6lLH23mqdxkSJRBoeKAs=;
 b=HHLV4eZGwOege+AA3cUYYMDdCOmtERCbuTgpT7ketai0Rh/TIpr060xuQgtzgZrnI3CE5eS6VDoWKl2IWcq6vSW8FqfDZjXVeLrioYhyXrOaEtWeTrM/qZYocDW9xFttfLnHB7kXwWxi51BMD5YZXx7Wfwg88Vn3tXIgEnRvXL5GXGJhZ/0oSI7zYz/DJZCdAK3p/I3shy4ARTOwx7LigUjKYjnzBkiMu2+6BXqQeiaDb0qV6kTwFaGbOYl0hkNfwrG+8l89P3GtYL2+aXmQ/ksNhKsPdgNl2LChG0dMRlZjce2UkjMaj1kzNGsCvlF69cZJ2nwFiNKwCOBctky30A==
Received: from BN9PR03CA0389.namprd03.prod.outlook.com (2603:10b6:408:f7::34)
 by CH2PR12MB4261.namprd12.prod.outlook.com (2603:10b6:610:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 16:36:17 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::2) by BN9PR03CA0389.outlook.office365.com
 (2603:10b6:408:f7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Fri, 3 Sep 2021 16:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 16:36:16 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 16:35:35 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 16:35:35 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 09:35:32 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 3/3] ASoC: Remove name-prefix.txt
Date:   Fri, 3 Sep 2021 22:05:19 +0530
Message-ID: <1630686919-19495-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 768b6e4e-edbd-498e-99c2-08d96ef8f3b4
X-MS-TrafficTypeDiagnostic: CH2PR12MB4261:
X-Microsoft-Antispam-PRVS: <CH2PR12MB42614FBB92D928F8383AA3F8A7CF9@CH2PR12MB4261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XwRcPSs/pLwHusrN+Bf0qMdAu4qOzNwNkS7SNp5KXb0bHpB16ubls716vK0nZbFNIJCLHhyM6nBXNrPADSe3/obhwnCTgreaQnyN137wNhy1Yx2xKEOOExyFLpIzlNXrgX/wdvxLI+mE3yuN43tX/PJIuyBpvo5Nu66IcIMoUpA8et4aT9S2JR9ZHGgPinslWD1e9hqwOQuvtpikOaF9E8GGiZPDsug/Kt5EvXmYO7m1KHRbcU6s4FWNkUUDrOVEABCmFO3zpgY5Xzl/H1XTXOCOtSqRcRCpJn9r/22ikGij+qE1lDj/FDUNO+1D6igMzRN/0QrVJpphAAIQuWExwRK7HC4oBxPHlkSGnI38ZE03S2Zr8zRNDmbdYAFhz4gvS/v6J+Y1aind1sj40VK/DmDAVuNjVa54Pm52RAM5hfMjAO30VC0fPDKh88IicS7tvWMN4N4XYWysHQDSgIoReThKu4cTHbSs2b2zTz/VIfUl/QUhJ7OTw5Jm11sGtUGCrf2e4dkLvj2HDDGLXItgqseH/6yyWFvpd840u6LyClYNlsTBE2PltrQ0Bdf8CwhEVZW/eMHRSQ+cw1UJWlRVzTB06XwdMscobRIQKedguVWNQaxK+d3GQwBeqje0rXQOeoEvhci5dMMHEpwxYVhASvTr3t7OiGgpdLlCXR5ueZHpuPoEoA6Qxm2eWz8rvz3a
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(39860400002)(376002)(46966006)(36840700001)(26005)(107886003)(82740400003)(86362001)(426003)(4326008)(7636003)(36860700001)(478600001)(6666004)(336012)(70586007)(70206006)(2616005)(186003)(83380400001)(2906002)(7696005)(82310400003)(47076005)(8676002)(110136005)(316002)(5660300002)(356005)(54906003)(8936002)(7416002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 16:36:16.3772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 768b6e4e-edbd-498e-99c2-08d96ef8f3b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4261
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since schema name-prefix.yaml is available and references are updated,
remove txt based doc.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/sound/name-prefix.txt      | 24 ----------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt

diff --git a/Documentation/devicetree/bindings/sound/name-prefix.txt b/Documentation/devicetree/bindings/sound/name-prefix.txt
deleted file mode 100644
index 6457759..00000000
--- a/Documentation/devicetree/bindings/sound/name-prefix.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Name prefix:
-
-Card implementing the routing property define the connection between
-audio components as list of string pair. Component using the same
-sink/source names may use the name prefix property to prepend the
-name of their sinks/sources with the provided string.
-
-Optional name prefix property:
-- sound-name-prefix : string using as prefix for the sink/source names of
-		      the component.
-
-Example: Two instances of the same component.
-
-amp0: analog-amplifier@0 {
-	compatible = "simple-audio-amplifier";
-	enable-gpios = <&gpio GPIOH_3 0>;
-	sound-name-prefix = "FRONT";
-};
-
-amp1: analog-amplifier@1 {
-	compatible = "simple-audio-amplifier";
-	enable-gpios = <&gpio GPIOH_4 0>;
-	sound-name-prefix = "BACK";
-};
-- 
2.7.4

