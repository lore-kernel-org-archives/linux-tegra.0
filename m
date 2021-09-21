Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29FDC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:28:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B0CF61178
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbhIUL3s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 07:29:48 -0400
Received: from mail-mw2nam10on2052.outbound.protection.outlook.com ([40.107.94.52]:65312
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232400AbhIUL3r (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 07:29:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjmpvqJ2wi+Ebe0c7BDCqPXDJeFWX/qrXE/XosJ1tS6X+T6/tDgzezej+MLUKZUQZvJDkhhPEdP5fHpBqEe/n31OMjPSttHcPqsmRTqwnfqHUfItJOow8KjAqHAQFmCnjRqw7pojzfOTp5c0P1PIAY4XzPoZP7/APi3jkIKxMPpJpdM9LcLfermXd1txasSycLVlvcGPko7BtCK+I8QK+Y1TttqkrMyWD/4s5nRGAJkxGJ4oZD9I4+S9+CDm0nHfYuTu5SnZfDy93/+AsrEw6TD1YT6alUJ/aBGtzpqSJMGzBAhnOhUVSuUM0B8gLeV6cNmKSyNqSek16I16DWoHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aEM1hiM1LgwuBPUy3ufcBIIWJrxp0sMzFMdtiFi26UM=;
 b=lcyN1yeu6A6ZZnhl/36qcqzSUJuO/WjQx/0fAYGi8eM8lcpOEytfMtl+J9mNaNKka2bf7S/IMMIyi/fl+c6RTxQWYkrx2N77abO1jRczM4swrlQ3rlZkEQydWdTfjjiYR5ME/uGCPmbYkkNtSguGh7rRitC6Npu4VV+XQf4o6WZGHpEe0EYgAlJTChSKGHtCbJLJIA+R7QpPVJdKYwnLWbo5MkrZTkhaHSD2JwrCwQERZXX3yQ87AQZVnvBmeTURCVpZAUB74cfvpRlMd/ScqAg7LxYQdEIOZZcsA5AxqyH40vkcWy7zbOzXM4DMyIWKRRy/MnAT5fSXrmuIXicoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEM1hiM1LgwuBPUy3ufcBIIWJrxp0sMzFMdtiFi26UM=;
 b=OtEwLJdQ8tuV8bwrCadWiQWuc/xwVRAcVXudsqlU9UHmy6+T5DsXeM5gbMuDMYezZDCYHTH5x8L4l8Niqd+9wAaGSKJKe6g1RtlLg5yEhFYQmN269apFMpGgDNNYf5zmRrA7HsDAhx7vG14sXt/Sr+qq+qly8CbuXbxAI2eAGoSK+Y3NegZ1wUk2BbxnqSFRwMBR7YX01dRRee92yvEqKcxEbOU9Xod0g1v9i369BDS2EQOYxt4cb1gOpkd2dcgEm75MsXqrtdELDns8G0OxdoMB8PDaHALa5NH3pzyAKVwn1jUJ3mY3KIDNOSceDPbOO99XOfv+miT7/u5fLoWTyw==
Received: from MWHPR07CA0004.namprd07.prod.outlook.com (2603:10b6:300:116::14)
 by DM5PR12MB2549.namprd12.prod.outlook.com (2603:10b6:4:bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 11:28:18 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::a9) by MWHPR07CA0004.outlook.office365.com
 (2603:10b6:300:116::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 11:28:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 11:28:17 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 04:28:16 -0700
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 04:28:12 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>
CC:     <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 2/3] trace: events: tegra_apb_dma: add SPDX license identifier
Date:   Tue, 21 Sep 2021 04:27:15 -0700
Message-ID: <20210921112716.3007-3-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921112716.3007-1-bbiswas@nvidia.com>
References: <20210921112716.3007-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9941ab0-0599-4f0e-13c0-08d97cf2e8dd
X-MS-TrafficTypeDiagnostic: DM5PR12MB2549:
X-Microsoft-Antispam-PRVS: <DM5PR12MB25495C7DC938EFFCA425A810D7A19@DM5PR12MB2549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1d3mdHBS3A8tZXX91NuvQqVVV5yfPQQcjoGWH005tXN/Aa80AjjxUzMGVXAJYuTZ3aISypwMHFPpQ2XvT329Lc5/KyRfj7hjMnwqvRuEv9x7b2mvdiDD0oHPf9TV6qt5TWNFELVTnb7kKVm6rzIC4HdCuh+eHlneZneMHw9J7hoxjfKODNVp6qv1P4SCZnb6YRiYlA2TtsY6QuygdfoPiVkQJVQXELSnelxdz+CECynoFpT19E+EP2K7ZA1IFt+b0+GKPT4paeh4KksYap326Cyn6pBu+bfAYbQEjlLR6BoII6oL12h6Kj9V6zHb643FcSOieQ9R/wMtxQF8+jTw1oOlZIz217mNY4XbznRZdyHKIosxWNIhUhpsEKOaLPnZB7lP8LwCO1L++8L3edhYp6IornEMdRrXlMxa0yVlJGfeNiaaeLn3oFooOhxatj1FWBMzzbdQ0ZnUQ9mbHIyZg/DRtm8z/rAk+C6XG4cNhAJpqVl3ffpO5t6jkHTQpzP2X0owsULoq+GaqlLdDeREn83cRLfQ42tWEmY+55VEhASi4PHLTu3kE3RYro5Q0hPGsq4Vqvgm56/xOk6j8gqkDk2dR9ur6wdWOnYrrkOkbbFtAQlq+0gaqRhqEE2oABEYdTuowMinLRJLM04KuWsfr6RtudvjLOiv8nfqSpP8ugGc/B9L7yeMDnXsch8CjXjkpUiJDDMig8x+3yDo3R0pg==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(186003)(7416002)(7636003)(508600001)(86362001)(47076005)(8676002)(36756003)(426003)(110136005)(316002)(336012)(107886003)(82310400003)(356005)(1076003)(4326008)(5660300002)(7696005)(2616005)(70206006)(36860700001)(70586007)(54906003)(8936002)(4744005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:28:17.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9941ab0-0599-4f0e-13c0-08d97cf2e8dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2549
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add GPL license in Tegra apb dma trace header file.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 include/trace/events/tegra_apb_dma.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/trace/events/tegra_apb_dma.h b/include/trace/events/tegra_apb_dma.h
index 971cd02d2daf..fe10897b00b8 100644
--- a/include/trace/events/tegra_apb_dma.h
+++ b/include/trace/events/tegra_apb_dma.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #if !defined(_TRACE_TEGRA_APB_DMA_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_TEGRA_APB_DMA_H
 
-- 
2.17.1

