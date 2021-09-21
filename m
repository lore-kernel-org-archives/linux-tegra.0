Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CD7C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 034E661181
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhIUJoL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:44:11 -0400
Received: from mail-mw2nam08on2071.outbound.protection.outlook.com ([40.107.101.71]:6625
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231428AbhIUJoK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:44:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDtfjFOu2LigEyzsrlQ6xAXwqgksUdFvFEMAxYIhKevGusvHJusr0dVfoGOxiQ5Xg/kTDlb+07EFgcgvVDuV8HCkIAFiZqd/LPDhln1gwISpUEarjqWpHVWoLDJvUf4IgC4vr2DFplfNtI+dOLe0g5hW0Ypu7GXPDtr9Q8R4PFc+5adbSOrE74upcn2xmjJz96eGztre//pwYQ+MBRk42vaLxUxo9WK4o/h6IXMnzYcfebz2FGa94XByxF9+8Uv4wRjweOA+7ZRScNLJkBvPVnEWePaJx5Q+N41aBjYuE0S+CkxbeQjsLBbdajjCetkoyLo0RXzYYmOmFozIsitcMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cR8d6s2kWfaIES57q6kvQOAP1mbLKSTdIyeHhXG/VI0=;
 b=oMZfGlaEVrcCRx9BHK1xw4VXwQPaWywJMaGKqUfUfScesabkvCB69psaQB+7cQz9y8zvg2hJxleEtg0YXC1Wjf+iydDscz7pE6ESIHTORy2khM6DjVl6G6aqenMC4GqBsxMqyaysVvouXAqu65V4GRdofDD9UebqRCIKvvfIe4zXm6ZSj2DkOWv1cuDYojhg2fB7GJ+RNKYQM77m4rXTm68BK23V6mlsJrCYQw19DiWpaMVOvFwO14wcxiyE+5BOJrAG+SFXVx6LdFz0sqgWW8f2FfpA28cm0OflMYktVP/G5gEgVtoqn1HYTI+hfIe2r00sR0wzlcJCHwzX7ytlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR8d6s2kWfaIES57q6kvQOAP1mbLKSTdIyeHhXG/VI0=;
 b=n5O2h8jPuCGOAUK4rHTjt0M3Mahq6/+r0qX87V0DSdDnLvKJiI/M0LYEOMgD6R+hC1SbMYDDsOMLESdXwUU/VgrHxHkv3IBxh1edqaE63HLXVlbdHmw6609cygTyYKSiCwz6IkP3zw377h1ajkJnwlnR0HX+NIjjx2WT/kx4AGwST0wzxPYuTADZnoS8WkqWFAYwAzwTkfXHsfdQ785l1J1EnuW0vaTkJGEgaKayMVhpIm2ea87IFZY3PV4pGQMDZqNIANiBReq2N86vCjH1qAvjxdow3b2A7RDE1eTZ1pLtXGhNtPMqjOfPMk0SdY8Pl+9VcuFPejU/8W79G9W0TA==
Received: from DM6PR11CA0063.namprd11.prod.outlook.com (2603:10b6:5:14c::40)
 by MN2PR12MB4581.namprd12.prod.outlook.com (2603:10b6:208:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 09:42:40 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::51) by DM6PR11CA0063.outlook.office365.com
 (2603:10b6:5:14c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:42:40 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 09:42:39 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:36 +0000
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX license
Date:   Tue, 21 Sep 2021 02:42:04 -0700
Message-ID: <20210921094206.2632-2-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921094206.2632-1-bbiswas@nvidia.com>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 667b3f56-f6fd-45e4-45e0-08d97ce42760
X-MS-TrafficTypeDiagnostic: MN2PR12MB4581:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4581BA5537FDCE5F75543E08D7A19@MN2PR12MB4581.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hscyb3tzWvbRwAPkAxQ6DMzrxDbzjvXqfStdZL+SWrJ4mivnLpPMzfnYpUcDalwCitlUN6eC8zpQjOZx/1fQH24cuybNEJpM/ap2jn3HXdg5WAHT6rD1k18FrfGPVJ69RIrdZuDijApPfhCKrJH4MWdjDYC2weth3MMPLFLicUgIWffTF/uBKrxkyjNOsUYwaM1fg2TOO1m75ghe6XDa93rsM/Wp+ArK/D8mb74CNZTcoWvRMKfy/nTKMYARv9jRsMp6QAAztfYJXYHFgJSmsu+ySCWnCQtcdIm2yQZNIx0v9eWNQA4rPjR3e/htD1iK0GXFqxUR7bVzLPkjEetef7iAnKl92ruU7v4lr9NiCnujD8EQG0KgMsEPGQvgK5dF8+B9hj3hN+vHp/vSrC6yHpeUICp5WlicflxOP+n9+jXkO/B8nqSO3b/cwQCQ3LMEvZcGWGs+17SaevmOX1a9l3NRm4MaUBcdt2/s3i5LUy+iIxPp8tdWTMt4hKvYONFid5X7jJAF4KVZvvetymQQuHShYrHI1DJOh/DENQJfDLaBVLQTvogIdMiF5prZSGkzKR5NDG77o4Gu3IEAL8eOgHHh86wRvJfJmun0Uvikpb9I4Yv/b3wqbeTi1fWqnsd+I24J2ZEvjZ82AyWlZRdb8pcvJyM1E2avNnqisJj3OiKltZteBmgj3KO3HfEetaupC69yl3NcRGezsOVNv5K4qQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(47076005)(1076003)(110136005)(26005)(86362001)(356005)(7636003)(70586007)(70206006)(336012)(5660300002)(7696005)(7416002)(4326008)(186003)(36756003)(36906005)(8676002)(426003)(508600001)(6666004)(8936002)(107886003)(54906003)(2906002)(2616005)(82310400003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:42:40.2852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667b3f56-f6fd-45e4-45e0-08d97ce42760
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4581
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

