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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F6EC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC9F861215
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhIURqj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:46:39 -0400
Received: from mail-dm3nam07on2069.outbound.protection.outlook.com ([40.107.95.69]:47680
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231321AbhIURqi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 13:46:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLKqssHCFUJS3xCsa3lgz7lTVrSQkd7kUqMFPl24krzFS+z6F+nob2OYks2bbY1t2e2n+kD3ZHMIHBduBICytDWoSyxtJGq6Kyn7LpcKlM4Bw134dw0VoXmUC6z2aoo92GJqVKNgbQsAKejknbm0Qq8Dik0hpTF40yrjzPHAbUkguZgVq7R2t/6zn/5QVsMg1hrAEMjxBN3SmSllngFJ2rIvIeloT4jaZsGwxFZjwuX4ASY25ivVqXZFXh0mgaey0dBYPWcM5Wpl00+0qgytGwQyiOvsyr9fYcMVobXeWmlAexxpnmiYlIblhNkYxJJqfxSaIvMsTgV+H/E5xRW8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=aEM1hiM1LgwuBPUy3ufcBIIWJrxp0sMzFMdtiFi26UM=;
 b=aZlh89gpTW5YuIusINBnsz3B5BJSBykXUgeClWwdtdsxkuzJZfHKta2Jwzc3oUrGIEKzXB3XfY241dgCM880coL+hf2/BbTjvc5P5QncvrwKvI4XsfjiU/AUtbnM4KkPbxZl7oGLLU8AVB2hHlKNPFuqtCJsWYoYtRPNWh5vJ2WyEuynuYl+1k0rkzUXZXCAMifpnE7oPrEs7NIRSp8PwLCKQ9vzmVJKrAF5jYBqpnXguq6oXSo55X7ly3zx8GOXrU3bbgqgGJj8TIzqleBS4SYWydiwuXcQR50C4s3ev8rqHu7p6UayqBo+o7JoHy6FyW5Bzprp25g+1cuw0sdwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEM1hiM1LgwuBPUy3ufcBIIWJrxp0sMzFMdtiFi26UM=;
 b=qZu2q0jVffMSOmWg6RB6Ab/zaX70E2ikoSp7Fj+zU4iG+9YjAqS7vGAYFFGchUegGjxP9y3yDEPNArqAxc7QlRfW0Rg8ShFXVfDlHKDlifakoy9khnACL909C0qhSsQ2W1AFMY/NZqYHkS6jsZwtYt7qkHmeHBpi6gi//bU0xOZSQ1zdsqE+HHFKzb5tYootCqkxDFQLUA+iMLGeh+RmGYaZDaBwSqs+bkS9zVGqVbiiHIwxfyLzVY7D5RfLQaXAX9AJJ6y5L7loZVqW20h6Zvq1JEQb2ZTcURE5agM3hVdzBch0f5M+ImpIA4rWEUicjSDEap8r7gUIhQ8qWLs2ww==
Received: from MW4PR03CA0096.namprd03.prod.outlook.com (2603:10b6:303:b7::11)
 by DM6PR12MB4497.namprd12.prod.outlook.com (2603:10b6:5:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 17:45:08 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::9d) by MW4PR03CA0096.outlook.office365.com
 (2603:10b6:303:b7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 17:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 21 Sep 2021 17:45:08 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 17:45:06 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 17:45:02 +0000
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
Date:   Tue, 21 Sep 2021 10:44:33 -0700
Message-ID: <20210921174434.4839-3-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921174434.4839-1-bbiswas@nvidia.com>
References: <20210921174434.4839-1-bbiswas@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7de9be47-dfcc-4f9c-a73f-08d97d278d8f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4497:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4497E198DED6853521379B24D7A19@DM6PR12MB4497.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18CfHukkcCNa3YhsJuHUYTJNpM2r9jw310ujl3MDKWow1mPmq4yeXkmS0P9YnrlZs4VZSVD5wcACF7F88iAZEWlRIcycVeVPyylc9hFtgBSoCQaAw6S5S7o5ZpN2VeP+cUnV5c40yiul0k1EmPSwTWMhRv2QuM/U/Be+syrSNlMnSlYqYuHcAat8F0sKIzOO6bp9tBeuZk6qhDeV6dJW+0KaezZrfw6zwQzEkIKqJyPyaK8I6pCFyWuCrI5kCArvC4VKi6EkF9FET088berVHoUQxmR7dQbUhHiZHtwsCX2+qVzZtyajCYU2ElvXPPZF/u3QiX9jyS5l/5eRiJbm9Qr4fqHbM/ylwbYLFPaL8Vm5cVq098JQQBP/UV8QKXVP3TJrVD9/RizC+D3wppbSCs0LziQhRuFrvpJmDisFZkoeNZ55nMHcnIssTo6HbdGwti4lmSpN8tTovjpjB5yzMNDVe3WGFxJsuojD/p6d8fzKMPX1YO7Ufhah4uvWg9cS7qs1d6Z13OyBPHidz52iMIbbMu6vbWzJXnCXyo14ra8Nw4eNq95FC/Jmeb2ZduOnIAEo8UABRfdLOFE+33ulNKvk9SSzDkx9jbaVgLOtOVcZ/IHJByOXaw8vUczI8jogTHkLruGzYgVIP267QDlO7+bxBNJhzggbIPlHXHeUK7/M6I+bIEeU6XlAMz/H0SzfuORWqnnLUl3R3Pgtm804qQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(8936002)(70206006)(2906002)(6666004)(316002)(1076003)(36756003)(186003)(4326008)(356005)(7416002)(107886003)(426003)(7696005)(82310400003)(508600001)(47076005)(336012)(36860700001)(86362001)(110136005)(8676002)(54906003)(5660300002)(4744005)(26005)(7636003)(2616005)(36906005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:45:08.0694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de9be47-dfcc-4f9c-a73f-08d97d278d8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4497
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

