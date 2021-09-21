Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFACC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D12561186
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbhIUL3k (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 07:29:40 -0400
Received: from mail-co1nam11on2051.outbound.protection.outlook.com ([40.107.220.51]:7009
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229474AbhIUL3j (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 07:29:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L//HKWminii7Hscwuh6/5aEykxdFaemS4Q82PICQt2K7sSC3FAehA8O/k9YB3OK8T2NjWsT2mWNjZaIof2WGPvTamlF1Cpx15dpUkHTLBEcopIr2FTRZCwKynPoyjkwjatLvPHsiPdnnFYDJqUUnkp9GNsh1WPFZaH5pyLNmFvjRYcOFUWyrPFarHyS/fLOG75mZaNZkvau8rt9/rxsusySILc7xZfWtpMxODu33hop7D9jt3Z+PMWvsVuJjpJxCs5ihFgXL3m+5iPM5FZf44e5lRyMn5DN52o1PlFOK9jri/7naO1ynK00tn0AeiHVTGtX603g+B2istXx93PNEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cR8d6s2kWfaIES57q6kvQOAP1mbLKSTdIyeHhXG/VI0=;
 b=QzRm5RfxRPSfUAOvCn8WjGL7Vph+1m0vPviIMSCLFXPZTxAGqonO6HRkDDo6rxDoc7pmF64nppVWj8ZQByPT1unf5sK4HSKACF6TuAjaT/cngun2mXZrnTRK2xGYuVFk3PDDB/FRLVF8opwN8gwiLKXCzUJqp7thYNH6yihzSYPB8SMRTFNEdJOrum4Z2R8HNGOIGatEnSxWEHA9usmy6e78pOMMDDIRcpjQF0JWAl7eM+UX7z28LyPEtPxBBXQpmQ3eNiJjCMi95NceuMDzcbs2UbOkfRh/UGCzdQwqGDLBlRAS4tE9XQh9Ar2l6tmL/l8ZTh8jZsHbMhiV08kxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR8d6s2kWfaIES57q6kvQOAP1mbLKSTdIyeHhXG/VI0=;
 b=ROhEJqJUZ32vCZ+8z6IrVJH/GwA5+aRnxJ77PfYjM3m2+VUyifET9ARlxgNPq6Rnr0ZRKY2AJMxYm2TVx2VZXjx/xEmZeH4pIXk9J5MO3QdTX50kzKLU/I5MsEmjkRj1BsC+/VlYwe9I6cnaSW5kgUEY/BQ1fT4PmVjXJydeneEHFqnGpcckqItLkXNQyggMXvtcuuvuowz3W97wS7uNGP2EslFQM60FUhykrPiSRFMXQeoJSHuIxhONQtvojHAedPFEyR1rE9sjxWI46Lk1x8GyVTLZuvuUghoEQL5OgiIJDALTd2GBTblkPfAw8IGzdechBkEcqgr7tJpgmiamjQ==
Received: from BN9PR03CA0950.namprd03.prod.outlook.com (2603:10b6:408:108::25)
 by SJ0PR12MB5504.namprd12.prod.outlook.com (2603:10b6:a03:3ad::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 11:28:10 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::a1) by BN9PR03CA0950.outlook.office365.com
 (2603:10b6:408:108::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 11:28:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 11:28:10 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 11:28:09 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 04:28:05 -0700
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
Date:   Tue, 21 Sep 2021 04:27:14 -0700
Message-ID: <20210921112716.3007-2-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921112716.3007-1-bbiswas@nvidia.com>
References: <20210921112716.3007-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 750cf578-a840-4c40-8c16-08d97cf2e431
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5504:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB550452BF91BAA77894E053B9D7A19@SJ0PR12MB5504.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6z645AZfGApY2TX0RognKk0OAtRKILOYtf4UuSkdIPwYC7XLcnKx2OXmC6pgCyZDXhaK6KmUAhLtMIKRLJa85i3DQomBCMBHagVVZ9az1K5vw6iNZFYA1O62YJTA04yX1mFenzWqpnc8SlYkUswekFiUsa47AfTyPdOgDG+oPPIFyL1iQcm5BulTVJXc2hIP9FzG/1JDhshJyyVmM/cwaplrG87rOdCea9ACOGJXjDtiSmZFTXBaIkiEsoBCtuSArZxas6Ld+KUx4Y2EOwb6weiFNEF5icUAqwirmSx0kydqIhPtacQAcdwIMWEr2kd5BFUm/wygFokBCh1PFCQ6Pno1TCG5BmqmeKHZOnRPTMQIM6LkKw36tnS29EmHZLCGmExtr+dWAJ/zJHmu+5MIZGZd6oiJC7B31hatnCfc+sj/SLZzorGwqxaIbKTd5nVM7IUnNBUpYOLaXbFqmD7L5XH/wr5WajlbZRisexclPBlG6/tN7g95/aInk7DWNukJjgg/Mt+RcPPz9zPAHtu9OPDaQHl3Sjvhn8S1r2Mp/P9H5/ull7DnpRYdYJJBSuYBzdCERgYLvSwq4WBwOxal5ivhUN6GsvUu3Y3P8ieXqV7i3hxmo45DQdDYuCSYK/oiIykREraMiACp5LW7NVeD7yWN1p7NQxhEA7bZ7eXaThDwSQCGZEStqKOgaN1N2rrSH4auhClHTxgdf0O8DMCZ3g==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(508600001)(47076005)(36906005)(110136005)(54906003)(8676002)(8936002)(316002)(2616005)(36756003)(186003)(356005)(5660300002)(107886003)(7636003)(36860700001)(426003)(2906002)(7696005)(336012)(7416002)(86362001)(70206006)(6666004)(70586007)(4326008)(1076003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:28:10.0329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 750cf578-a840-4c40-8c16-08d97cf2e431
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5504
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

