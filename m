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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B20DC4320E
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53B6D61074
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhIAQUd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:20:33 -0400
Received: from mail-mw2nam10on2082.outbound.protection.outlook.com ([40.107.94.82]:27040
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245215AbhIAQUc (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 Sep 2021 12:20:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/LHfSogjkGy8J4ZMU6Xc2sGz/kCc/yULEPLOLQdzByGQFlwlwEoQPYqyeyoPbMkbkAr9/ZRepOTDt1jigr9sC6VLPoEWFB6wqDUYwyKYPWHjGiVNeYXSpvB+pTOdtN0JWdmtg6833lg0+7mz42CVW3BakLSm5p/kpt3Uxip1u+j8l+IQOMCLJPUQw6w1jj4RjuIc2cY4emrjY24G7MT/REtuPrnsajuwqRnBLdFPz7w/kpT6jp6ZQ6JaVaRvH0fxwUAfF4l4U6KR6xCWtyA0R4bDZ2JGbaJCuPMqqqIJPr37OIYwC0f7WtrYZf9Yn+IFb1dESVLKx2TrHEO7tsv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZKL2T4NEN7gh8HWzlk1bLUF2jptXZ5MtDrhN3ZYcc0=;
 b=KLD4QL0rw6N9sfdGa/46TambK97Hpp3gfb2W5BALiHtIxtOf/KHbP2QRuFGVeJc203PerxPyxfEBrZQJ5URwTI3j7F1t5t2SSFofxDnxPSvNuLFIqBwyrmCxHlXZgVVQVwKCLZVbTGAXG7H39xCSje2blXHtzXu4RfZ5Hdu/J2iNU8QXkQ1ubbnLf3+wxcElF1CHg5WHczMs5QvCLlUIgwNKHmF0uceSXIsNTBwCpAsruVIu9dyEgmPVOJaQs3Xkp08MqjsTzDT+4Q2tMCemKWRsRltQP5/kmQiaq2He6Xb0zYp0IdDxwRlbRTb5blPMER03QCI6EJSriqIkgylDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZKL2T4NEN7gh8HWzlk1bLUF2jptXZ5MtDrhN3ZYcc0=;
 b=cGhGpI/knSEH42mBkEVFWnXYYWDNqUnUhMz8o7r5H8OgNZL1zlAHrQD27NwG0X3GZEgRslcIXWtKSCpXD/2V+jvWQfGdATicBL5EzlsqVtG6ne0D5375bFwIy9gMf1C7SK/6CYwOpCbIVJ6gyIuMZyYryT+Hs1T92JA++T4LhS47eCfscUrtFQVKDybaWiz3y1RJ3cTDBi9SGcM3HKv1V6mBZcF8yoxwG5jEChuekTyVlrLx0Afy26JSmlLGXrRzaImxe386QezHIzzdxXIOXDjXGezFY1CDjRz58oFBJtgpOIETKb1LjwbwaD40w3hh/fXBAbf/PpUJsPjTEyyL0w==
Received: from BN9PR03CA0057.namprd03.prod.outlook.com (2603:10b6:408:fb::32)
 by CH2PR12MB3766.namprd12.prod.outlook.com (2603:10b6:610:16::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 1 Sep
 2021 16:19:33 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::2c) by BN9PR03CA0057.outlook.office365.com
 (2603:10b6:408:fb::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 16:19:32 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 16:19:31 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:28 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <aleandre.belloni@bootlin.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/3] ASoC: Add json-schema documentation for sound-name-prefix
Date:   Wed, 1 Sep 2021 21:48:29 +0530
Message-ID: <1630513111-18776-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
References: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 403d8701-7479-415d-cdf9-08d96d644811
X-MS-TrafficTypeDiagnostic: CH2PR12MB3766:
X-Microsoft-Antispam-PRVS: <CH2PR12MB37663E7A4B3AEC8EA62F4D46A7CD9@CH2PR12MB3766.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iqjf+JJSJS8yKNTIFJGndEnb6hFja/KvO882vGiBcYQK/chBbYmVhDHjpm4po+KypHftsVxkh8VOwZ0x+ddF7vsAl511XuQKGU0ho84LP8zxIKgkA65Mr0l5IT90/qifS3EcOCGVil7TekGv4cPoRlfyyNvBKgWObnd7hxl6GiBS7HSGtS/c85if3KLfZ2psWXrFt/gTYCe3w3l+Ke4hEiDnLzw5HLOFit1rmWZn8EBOVhoQX/aELSF8e623mMZiHiO8gKG7nfe0KBr+RT8o+FhmwywSjWwmun0sGgr1PUpI+/lEn7e6TJhYK2U3AVznsc1tzPEVVDK+8hIGiTd6VWHVKfyRaXxNL20GeCmTRuNxBoeU1n7hDKEdtwv8fQOapH3ZeeLgskgkOHhLYN141TUhiw7Em46BqGhh6CXdjuqUASzUS1b61HR/MAjnVHSIbRFIe8Qy6XiXyyMbwAEcyRcMAJvyNU9MWSyPOR6mzC7R9bp+ZpMPp0jKnHrvirMUgts4GoTUNFY0Ka9xd6lLQCmd5E/QOQsvUxE+yx8Dj1k9hDJndwRfwHBm7A+4guF4ylHWMC1hLdS4eds61GC1Mq+pf2akEPrhN50hW8OoH7UnfgYaH1Uwsdtq6n2//SyxkFjYIrsrw4D6pyDRLWoltJ48s7KcY/xSuKAyXATEO6n49pPrBUF40KIr36f2c3SI7TMC2CfhtjynYiKIEKPiwwcE/gHwSgNnb7LIdTvTewQkT61+4Dt+eCekdw59QmJEAO2RToIBF2+yt5XIkxGB/IYLH43zVMNUxMaVnOXtGm3oexbTlJLQSI4UJgo9i8Ra
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(426003)(107886003)(110136005)(54906003)(316002)(7416002)(36756003)(86362001)(7696005)(26005)(186003)(8676002)(336012)(70206006)(70586007)(36860700001)(7636003)(508600001)(356005)(5660300002)(2616005)(4326008)(82310400003)(2906002)(47076005)(36906005)(966005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:19:32.1222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 403d8701-7479-415d-cdf9-08d96d644811
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3766
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

