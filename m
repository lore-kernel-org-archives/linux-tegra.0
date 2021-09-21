Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400E1C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 270A961211
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhIURqg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:46:36 -0400
Received: from mail-bn8nam11on2080.outbound.protection.outlook.com ([40.107.236.80]:15873
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231321AbhIURqg (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 13:46:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg88qy3veQA996zGP0/6Layb9+UCk9/D1Idaz4pyCP6x93YZIDPNkWS1F7cLLdj0IiLXjgianuKZIiDudE8guENQP7g71IYfwNrpJ5OiRJZNXw6IhQcJIIXUP+R66dDFOeogyBdoJJNllpiJZssMhtCikWjVfbfzGr8hM9X6YZ1tAQQnaug7n9uRCDHAO0ZVM+2kk10BFpPzbnWJuiqV4ETUbp5ipXYBgv/eLtGhT/6ed7UU7PDLAWTzrx0VfiIUOFszu2tyEcFyuHsSV7wjWXircVJeH9IxciGDzDQMeH+QODWHh3qhb/6gTyIudQVlPkE1AVaqsgqXzBdIsEBEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cR8d6s2kWfaIES57q6kvQOAP1mbLKSTdIyeHhXG/VI0=;
 b=ktZwbOf2QRk4OWfPWQ7Ox1LEPDWjNdHU5vdEMyNQU3yLMCJS5FEfPWBF9bPLykaQ2weeaKCSNMtV2nmeG3jeC3X4CUS96xd3UM6hrOsl52dl8IXK++FwE3ObMgzqwJKf6cIjI+gbCu2D25dKF1IJN9Duqu5LpaEB7GL+NBAfwlvQmfpfWNMfsoKBg9elOXnxM0dVFUsWNEQNOUG1d674jkiFFWK8ufMLKpr+ymOolUANOcYwDcDZSdktzVDwb4Lnpw0XPbQLZv6P03Bq+a8QasLrOmqGEdsgYPuX0qNn4vZ1OxckGlgEKGvBKmoFrS9gk5IZo1WGHlU/fwW1oH4ZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=canonical.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR8d6s2kWfaIES57q6kvQOAP1mbLKSTdIyeHhXG/VI0=;
 b=odqFuexuSx76US2rcID0uTtPTUoCjxm8NKQy4qHa2ZWh6iLQeLujm2iqRDNGlpRmxfmP+zylw8KmCSIHs4bsa00neJ4YeNovNHeZRb559Rk3K/oP1cu4hTjxbIxsbgJUCNdit1yAcl+6CPXc505MaU0RbTcldTrgnX4mgMtZp/1VKkih/560xg7NstC8pkQcESu4Y6eZLPchbsqfpXkgQQZ5bBecJv+2vCOQDrCMY7E0L7+9GTWq4jzQljQBvHk/G74u/lABj3DjwEt7f085fizTjAvglU52ZC2OylhJuHemaAQUpH3XohLYgP4cZkor/wgevapjr91fXGznl6wSzg==
Received: from MW4PR03CA0120.namprd03.prod.outlook.com (2603:10b6:303:b7::35)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 17:45:05 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::d7) by MW4PR03CA0120.outlook.office365.com
 (2603:10b6:303:b7::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 17:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 17:45:03 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 10:45:02 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 17:45:02 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 17:44:58 +0000
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>
CC:     <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX license
Date:   Tue, 21 Sep 2021 10:44:32 -0700
Message-ID: <20210921174434.4839-2-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921174434.4839-1-bbiswas@nvidia.com>
References: <20210921174434.4839-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98c39ab4-2fe9-4e77-b376-08d97d278af3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5291:
X-Microsoft-Antispam-PRVS: <BN9PR12MB52916DC7B32731DA0689FF96D7A19@BN9PR12MB5291.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zul92PluKfRVtKvFsfWZ4MleQPaQ2zIQEq7OhdK/edduwOSRu8DjB3SX+S5kqEGwXYSzgaY0gqB9GKSR4X5/1cPtET0liQTdIVK/RXZuffbAmdJDqP/oCYbNZz0cXO0yYJTooXWw0445qdMIhH9GITRD/HuZQtD2kSM3dFRmWkANVoyqqFelIEyYPSotU7iFO0L6d/Xn4z12kRaCJgOJIvGl00ZyjKAkkF4WDB4Gu8khVH7fper6kb6hcf5Aldbk7ThsWBrtL7+HAb4SFmWh5NrisNybHj6561vhLNs2aDyaEOhpMz0MPtTGDEyseQtCs0/yIrDa83NCUu4qtc5kGy4575geNZ2nEV7IPsGnItRZXT+zbX/sEu34yPihHonHr9ECGsWS5YejCjeWO+2yRQzSUBqbDgBL41e8HbaaJAU/sGybI3pUAgoaMSfJbaWj1pHPPYv397SOCY1PoIKoylZY1IL286eSBi8Wmz3z+TL/7xATzPsoqMBG6NKC62mzM03rbqVsSXxqQeAYSrf8qdObMQ8QR01GgUQ/eILH1oc2XK8ot6nUCFU1SF3T24U+p2nKzPbrQK06ITRsGgaCDMa8yBgvQZzWn/MxJ+JPTb3IG8G2zdsb96rPTUEE0vjR7SIlu27c3f3Mb2chEewn98iBV7PtFAtlg9RXahi2M0THeHtbL9cKDO01Hv/ktKjAm5D4nsbyMSdUoOPbst6cgw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(316002)(6666004)(47076005)(508600001)(36860700001)(36756003)(356005)(186003)(1076003)(7636003)(7696005)(70206006)(54906003)(426003)(336012)(70586007)(82310400003)(8676002)(8936002)(7416002)(5660300002)(26005)(86362001)(2906002)(110136005)(4326008)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:45:03.6970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c39ab4-2fe9-4e77-b376-08d97d278af3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add Dual licensing SPDX license identifier for tegra186,tegra194
memory and bpmp-thermal headers.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 include/dt-bindings/memory/tegra186-mc.h            | 1 +
 include/dt-bindings/memory/tegra194-mc.h            | 1 +
 include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 1 +
 include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 1 +
 4 files changed, 4 insertions(+)

diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
index 82a1e27f7357..be313d3790ae 100644
--- a/include/dt-bindings/memory/tegra186-mc.h
+++ b/include/dt-bindings/memory/tegra186-mc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 #ifndef DT_BINDINGS_MEMORY_TEGRA186_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA186_MC_H
 
diff --git a/include/dt-bindings/memory/tegra194-mc.h b/include/dt-bindings/memory/tegra194-mc.h
index eed48b746bc9..16bb62bf8166 100644
--- a/include/dt-bindings/memory/tegra194-mc.h
+++ b/include/dt-bindings/memory/tegra194-mc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 #ifndef DT_BINDINGS_MEMORY_TEGRA194_MC_H
 #define DT_BINDINGS_MEMORY_TEGRA194_MC_H
 
diff --git a/include/dt-bindings/thermal/tegra186-bpmp-thermal.h b/include/dt-bindings/thermal/tegra186-bpmp-thermal.h
index a96b8fa31aab..fe9f5043c7b9 100644
--- a/include/dt-bindings/thermal/tegra186-bpmp-thermal.h
+++ b/include/dt-bindings/thermal/tegra186-bpmp-thermal.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * This header provides constants for binding nvidia,tegra186-bpmp-thermal.
  */
diff --git a/include/dt-bindings/thermal/tegra194-bpmp-thermal.h b/include/dt-bindings/thermal/tegra194-bpmp-thermal.h
index aa7fb08135ca..debea44bf115 100644
--- a/include/dt-bindings/thermal/tegra194-bpmp-thermal.h
+++ b/include/dt-bindings/thermal/tegra194-bpmp-thermal.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
 /*
  * This header provides constants for binding nvidia,tegra194-bpmp-thermal.
  */
-- 
2.17.1

