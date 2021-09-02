Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5CFC432BE
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EA83610C8
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237166AbhIBFzJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 01:55:09 -0400
Received: from mail-dm6nam12on2077.outbound.protection.outlook.com ([40.107.243.77]:17408
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231831AbhIBFzI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 2 Sep 2021 01:55:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXnswyLmBixDyYEmw/1xSwYC0cQOrWhEwzD2lyVBmta+nafZyPIzOvmt+MeNn0Wu3qf4oFyjPvZmKSf8J4VvNGtwgbd3xKuI4ECpMVk0Z7ABSf13A/xCO+IyJGQzDtoTwhkcD8eBP/d0qNZoHvQT3sjAXBdOwcmTWJrKbS1V3icBthZVELeyEbGCsJLNcB/ic7MlgwrDdhiVyLijSrRq0jpHuCRP5w0M4Z20n2C3zDAX0sfiOTi2tKwpEem8Vna0MDQvHIMNEuxpuAc4VioRDhbnwBg/9Ws6K7IjkRGCPINJJenBTLREhCoLqmRvuPO/IGRTNcAGHSC0tEQqcJxUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cZKL2T4NEN7gh8HWzlk1bLUF2jptXZ5MtDrhN3ZYcc0=;
 b=Cho1bPQIZWMsiK/EEcrzYk8mB4laSvSdbMiOGnhWLPojqIgAoXNWz7hMIqfXVSqcf1f0K1+tHgqp3QtwBtNjsQMV2Y1mS+9sdpNxD/0SfTd0eH2dv/MaWk6qaNzl5ZPiHStwIjf06jeO6vHauxyJm16R9bS8FJ+4/gWN+vwAVaqAnLvyStOzaw6OxpewkPtLIYfxilpKL6gQmvX+KTPufK8hJRgKrvoPy0BlvJfGwxrT7ukw2UcD92nzeXFZxHOHKFq1uyRarioqPZ+joEOn/EheZqGJgwVIjZwpLo4cdVrztOQrWjjPhe9yZGpGCXyWe9pt8lOkxWfvvXt3lXo/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZKL2T4NEN7gh8HWzlk1bLUF2jptXZ5MtDrhN3ZYcc0=;
 b=CarQ0zndImtO7Obgp5Djc1wBYf2iA90ubsgevvrF6mbz+EvGSlfNanw10CnBLiMxIG6MoEGZFmFGCi2w9HFC4Bte6SukjwBdfygCOG061dwOE5v73ijDcqJNRPQN4zUOIGrthcRo4Dtcb6uW6vGB4QI5N8APQzs9Oj6+DBueoaHZ+dYS8C4vtp2cy1cwhFVHwkBxB5bEhhMp4T5T0/dHnS2KTMfdjUzuE9Onpv2hsiE3ZqebN1A6riu5pefF9qMQZjbk/AeCGyYMVyJHhh0uRGha1LEM7CBYA5wTLsw7XpDSLnQ0MVuUVVB9P2AQHLDIsylPxUiQ+YhZ8SJLZ6bLqg==
Received: from CO1PR15CA0107.namprd15.prod.outlook.com (2603:10b6:101:21::27)
 by SN6PR12MB4768.namprd12.prod.outlook.com (2603:10b6:805:e8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 05:54:09 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::5c) by CO1PR15CA0107.outlook.office365.com
 (2603:10b6:101:21::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 05:54:07 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 05:54:06 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:03 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 1/3] ASoC: Add json-schema documentation for sound-name-prefix
Date:   Thu, 2 Sep 2021 11:23:51 +0530
Message-ID: <1630562033-13231-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaaf0f68-d7ba-41e0-cbe4-08d96dd613f7
X-MS-TrafficTypeDiagnostic: SN6PR12MB4768:
X-Microsoft-Antispam-PRVS: <SN6PR12MB47688D6DB155856027AFAA3FA7CE9@SN6PR12MB4768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0oLD/X03gFj+9clkLSSRY7u4nmRebTbNtZQ5lDXRoDBZp+0y1rIw42qi8a46aI+/8Kwx5d6YTDf59MK16E25+y4K30FZaF6sVPu84T6reJ8g5+o+Ucsu8QbIt3ITx8kXeWl1I1vtNiAnPNVgato0oCFTqkm+NcaFUAcy/mJ7wSFs1ZqKsPxyA8ZuV7Ogfe4KiguImTds/JgFSjpk10LNdiEjPfOENJxhWofpJ30Vi5GJvtV2LbXvAkNgQCsahcFejDprPILIKAH2CT21oXroJv85lMs+a+otu3r7qbBs/Yjz5gaxzbkJSdJst7t41Tbh8iWaorCF5/+qwRNJWrk2dkszb9yBrDGhKAiBifLG0atw204+DMW8e+gjykn1JlYk6DCKYrEktJst8J73oRC85p5LtFf8AvoBE4ZE2rvxyf1+I5t+5ReTyyHeEMT+yn9mLfCUJgNglXQy44HkycC/ILkNXPOP5wsTBXd4R6hqM2caydsDQVvUybZFo0jbiIfiuJq5TJswyYHn9hPclh7gpeedAq9au828UYWZqCRTcJmc1acjqCj5wZKOhUKMXqV88ZAMKubVETrctiNmRZMcYXu9H11EpP581j9T82zA0nohpxB16sNdOmDEscLUP5kJsgbfpezu/mQa8AAO/elhSR+hs3Heyn73Q7Kbc0kVvw4DBoCkc95oXoU92HzEq4szqzhxdJY0fkShsq8psa9ieMkhVaa9WiPeysEbJ0ALJPIIkvOP/+I/LvV3TWE3RE702J3Y2RBrnVJFzZY+I1moKpN6fe99wOQrMf/zRcn3cDitFEgamMPzTs7TjdXhJ6C
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(46966006)(36840700001)(26005)(186003)(336012)(7696005)(70586007)(70206006)(36860700001)(8936002)(2616005)(8676002)(36756003)(7416002)(2906002)(82740400003)(426003)(47076005)(966005)(36906005)(110136005)(54906003)(478600001)(5660300002)(316002)(6666004)(356005)(4326008)(7636003)(86362001)(82310400003)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 05:54:07.2802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaaf0f68-d7ba-41e0-cbe4-08d96dd613f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4768
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'sound-name-prefix' is used to prepend suitable strings to a
component widgets or controls. This is helpful when there are
multiple instances of the same component. Add relevant json-schema
and is inspired from sound-name-prefix.txt documentation.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml

diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
new file mode 100644
index 00000000..b58cc9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Component sound name prefix
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Card implementing the routing property define the connection between
+      audio components as list of string pair. Component using the same
+      sink/source names may use this property to prepend the name of their
+      sinks/sources with the provided string.
+
+additionalProperties: true
+
+examples:
+  - |
+    analog-amplifier@0 {
+        compatible = "simple-audio-amplifier";
+        sound-name-prefix = "FRONT";
+    };
+
+    analog-amplifier@1 {
+        compatible = "simple-audio-amplifier";
+        sound-name-prefix = "BACK";
+    };
+
+...
-- 
2.7.4

