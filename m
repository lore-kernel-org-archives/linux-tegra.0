Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE87C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1412E61168
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbhIUJoS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:44:18 -0400
Received: from mail-sn1anam02on2073.outbound.protection.outlook.com ([40.107.96.73]:24452
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231421AbhIUJoR (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:44:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk3AGzG3MtAw8neDgWRZmqG3ZvSlUp76dSDIY8rzMunbBqiDE89EWVuM/CpDIjRUVYrS0tecG/HKheOHA/lEcgWytolQiL0BAAXkg1tiKKviDPbkMHqi2vpyKcVv+0/FHVo4zG0+4Z1117MqLJwsHIKM2bcYLmknl4voTCRmkCdbZQKnyaaunfsHa4jS+dtoPkvT7PX/XswbGmUos3Ws0JKiU92dqeokPyuxQ2Rg9tukrrRAcph7OhMUYg8kV/7akKZyT7fjQIRKnZcVhypTY7omqkmOLU+2QdE2l1VSpKStq673lLRWpsluySzo6AXBrGAYIXzU+rHYV+7z7mRJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aEM1hiM1LgwuBPUy3ufcBIIWJrxp0sMzFMdtiFi26UM=;
 b=GaB9UVgKUGRIm9xfqupe52htet6btMrdkxRrJEhmGqVTW4h7+vt8BRj8GvnNEz2XKE3KZ7qz7hHR2QWkHjFxPWcv78ONmphjMZxXwAsmj7hIfmigF/jHDrfu/5o0YkSt7GpIfk06Yc5AcTyMu768D4cFDm337aA2qt+pcYvSDL+urrFb+7ixZm6wOnbWtNWqromuJGWAiAYuNy1vFNGBv3yn3RHaXXzF4HPEtAS5z2wWVPoRXkyExQ6DDwOxIbTKIpax+Z0k2GCXD0zk61hTjBZWWpAsPoYfHcOtfxi189NA8V3vIMVJ6YqrRVd+WBzDlAfQL3VvOEfkMPWc7t0ppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEM1hiM1LgwuBPUy3ufcBIIWJrxp0sMzFMdtiFi26UM=;
 b=VHLFNdrH7ImDx3q2jIkkso9hJal4rw5A48GtUHM2u7hPaBWNVvusl89uQbCvQPBpBl6BtjluonUGa2BCR8rls7fayAKsh1Ymqd4vjidlm/RL/B9bvyeh/ldJIZ2uCQNy1FCkXfXi8lFQP0VlvmAmrFWPXnkOUl0SqrVkRb3WRxk11/X6CVxTtGQ2VY6r6783Psi66zmGONsDMl94M+chqCDE0IqcEleXCxry3thY7jP0aIFXZtECXCk3EMSVguYG8o5UbQlx79B0iAWnHQyI9OIKgkGC/si2Lfbk5ZaHUIapa4OiE59oQfiUgVUhGhHQcbVeyioL4j4+0VNo3yMN7w==
Received: from DM3PR14CA0131.namprd14.prod.outlook.com (2603:10b6:0:53::15) by
 BN6PR12MB1361.namprd12.prod.outlook.com (2603:10b6:404:18::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.17; Tue, 21 Sep 2021 09:42:48 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::81) by DM3PR14CA0131.outlook.office365.com
 (2603:10b6:0:53::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:42:48 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 09:42:47 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:44 +0000
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
Subject: [PATCH V1 2/3] trace: events: tegra_apb_dma: add SPDX license identifier
Date:   Tue, 21 Sep 2021 02:42:05 -0700
Message-ID: <20210921094206.2632-3-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921094206.2632-1-bbiswas@nvidia.com>
References: <20210921094206.2632-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3704241-1dd6-4f99-a1dd-08d97ce42c11
X-MS-TrafficTypeDiagnostic: BN6PR12MB1361:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1361C421DE65A641F89E3A80D7A19@BN6PR12MB1361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZVORVFHlgBbSBxt1zxz2o05EsxrM+HBRJriVzSTpylBWI5trryelW1GcjFKZq6oDm/rAtteMJLWKZR5toUId8BCqxS0otLpVDtRiFX//FXPX5UCxuGJQn3GIfr81UwFqUe3Hf+JK0G7xCaUAACT994afZivfItcIoiaV0K+xAsKnSppQ4+s0U0JjG2Yim6KbV8MBPCNpVxs4nkpiJ2f1TnrCOwCfRFyOLHRR9zReiV8Yu8G8ULaCc9aSIeQaGhKh98H0+pI5Kd2OraV5nEpumCb0SOLMmDq9mTajILh/pOZ81Elgx0zDnqvGEtsQ73J6ZWaXbaiWXtVoILYbxXXlR1l5Gbyol0tiXKfTppswd0EYg4/dkojTZrW1zZ7y8/4iw1srle1T2ysEluAP4wiLJdsOYTvvxR9UqpefMjIzWZjcn8l27WPKPdeBWrCVEPRXWZpyCk0EOAoG2BtkgcjwYvhEHbrKst9xzej7w8Ljp3a+A8OA8PzXrHklAHqud2hhe48RjkLQgMddQq9DrmJ90TNfzzWqILMSc0AKDBB90ANiYNLyHxIBxuREudmMDtpkSJR4ICce+aXrB/U5mhrgODMbY2lZ8noKnoGk4I+LgA/JotJzV7iqjQTWPxHvFeltvc/TRCSo6lmHqBVecfy3z9EmTP8igl7u873IPk7Bwx2i2vltbibj++pRx6u5Ab+nqe0u4wCnaZdM7HpIJMpFrA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(186003)(5660300002)(426003)(70586007)(4744005)(356005)(2906002)(4326008)(36906005)(316002)(107886003)(6666004)(26005)(70206006)(7696005)(1076003)(7636003)(508600001)(47076005)(7416002)(8676002)(36756003)(54906003)(110136005)(82310400003)(86362001)(336012)(36860700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:42:48.2297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3704241-1dd6-4f99-a1dd-08d97ce42c11
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1361
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

