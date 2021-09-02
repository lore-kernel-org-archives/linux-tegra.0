Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B53C43216
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D928610CE
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238074AbhIBFzP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 01:55:15 -0400
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com ([40.107.94.78]:58369
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237835AbhIBFzP (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 2 Sep 2021 01:55:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNb7vYEmy+9wNgMNFviYWqHD5GRYaDHj99rtilPxMIdzgZ5K8Zk7U7HpGTssvqmMm84kMnLlU86PHRuPBj3APJ8XWeIY54dKvzDhRVVBhGeVq/3pbXicc6cb1X9Qq8mTM95N3mKPjIUR/807cTvCSidUcDk+kNs43QTBvt8wnA+xKR88y0u/MR/p+aqr8MpHzXhFVAn3I9o/fFhcEj9ygaqqu5/+YPnBQMeoRRwvyoyCIZznyfxM0KzerAYwB9kqY12kg1kEgaTMj+Q2FuynINfjBMvttNCpBY2DFFZzXcDGiKmUZ7DnGNOO9QlteOgjR5EU1Yp+gn92EckMdI36gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulEuks/h+Di414nv6dgv8MnTivM5vjlJX0nvQDc4L6A=;
 b=REWJ9QbTLai4WEWfprLnKEKzBlGp7PczQlnaqzo9Y5c+qO3GtJrviqp06DPm4ZjdiDrZ9uFu0cqLpEctV3mRIVsp+kol7CAlAma+nklI04oUROunT61e0LTuHTPrOjVAQR8dOto2BWnGb+bT4jAOtdy4QbMd5/70tzqTpMqwN5IHk1GojLde1btAShvn16UPUKtzpKnwzVwF4ZJNX2viaMascwEbq2uAwmaT5w6buV78jI8CC5MHRc5+sAgUqR+fY67XmJrExqfDWBfyzwSrowqnPrIreaTnpRBtfirZGrOtqfBmsNOK9LGL1OWK50q4Z///w69cqyeWbqatwdw8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulEuks/h+Di414nv6dgv8MnTivM5vjlJX0nvQDc4L6A=;
 b=reowr1lFIkzvDoicX5Vnnxnz2KmQDetMVlGsm63jB9Htrt48DTy94FL7qPwjXxIGdJ4oqsUVkGVixzZ1ds0RzCjlBFlfoZFwag+61STRdIDl2mbTGLUgn2C0Woe0hy1HeoZzyD9mYZ1WWNK9cgLmBi+agjEnySRobgDw88TvYQ9PMiW3eKMppnH93eT9w+AV4beGmnV2bbAScTRIgB/OOkeG/xzkOi6rJsWfL6Dct4G0Ig1hl44jMxMSmseF3Be9kwosj8QZVbiOhybjD35YQgToVK3EJ5snanAdq4WvsWhyxaTvQcpMv5D+8AS1MVdnopviM9EJMxBwflZVvfkRIw==
Received: from MWHPR22CA0035.namprd22.prod.outlook.com (2603:10b6:300:69::21)
 by CH0PR12MB5108.namprd12.prod.outlook.com (2603:10b6:610:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 05:54:16 +0000
Received: from CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::b8) by MWHPR22CA0035.outlook.office365.com
 (2603:10b6:300:69::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 CO1NAM11FT008.mail.protection.outlook.com (10.13.175.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 05:54:14 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 05:54:13 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:10 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 3/3] ASoC: Remove name-prefix.txt
Date:   Thu, 2 Sep 2021 11:23:53 +0530
Message-ID: <1630562033-13231-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 222ba38d-607a-40cf-ba7d-08d96dd61843
X-MS-TrafficTypeDiagnostic: CH0PR12MB5108:
X-Microsoft-Antispam-PRVS: <CH0PR12MB510896DA2DCC8A2FE8E6A243A7CE9@CH0PR12MB5108.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKG8gG1BFS6kz5uiCZIF73AA6FDwXYeq3DoqVbqTH5ok+ZDhRQF5Y/p510BVMLUmDeDgIEIqTfx/9lC9TB09f8WEX3a3MugFFXCmYLT5FiOM3yZEmQ3AQEtFPTKPyAIInic5mBI33WhUMKaL7/5WOSE4M3906VyTpyELyk5oOsLcUNo+Ix3kJnuQSNcroDdK3fVhP4jGCESAwjE3V1X5+0vwLOMxfP9QbB4pThmWmk6ACvR7kdiuVk62AO5CnKhz14+hWbPyUezy59waVBns5DHx0YSAMT9KPgQW+ezfIwybZlv4dEK2Lk7sE8E1GRgEWhP9EdBluFdr07QtJqPW74fQ3kG/SM6ay1vwibJEun8Ll+SA27Q1DI4id7oZmepFkRt00XwNVYwuICd7dNKy2DlgXUnM7Nr2AfVS06Ma2shpwx/Kv7vkDgxOHis5aqtn0AxLC9rZNw+TEHeh8W4mVaU1NILaimF/dyyS7ZmOW1JnCtpyk05A+BR3UVeOZ6IjtAsjpiwC7DtFtEsBNKAiPB3JSbK5qOl/4faPTgCnZGEWzxKNX+6dyY1Lo4Zq7H0m/GpmcSaf7N146vQEoVGZKfo4U/N9qAjiaOKtKiJC7oU95pOp7pKNTd2nEddQbCMDHA9VcEvvLjCRPhN6XwVOz7tack8BldJoz4WgqJAxfC4HtLa+ulbzmCcTaWKD2Bn+
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(46966006)(36840700001)(36860700001)(316002)(6666004)(186003)(8676002)(107886003)(26005)(2906002)(83380400001)(7416002)(36906005)(478600001)(4326008)(336012)(356005)(82310400003)(36756003)(54906003)(47076005)(110136005)(426003)(8936002)(7696005)(7636003)(70586007)(86362001)(5660300002)(2616005)(70206006)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 05:54:14.5977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 222ba38d-607a-40cf-ba7d-08d96dd61843
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5108
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since schema name-prefix.yaml is available and references are updated,
remove txt based doc.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
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

