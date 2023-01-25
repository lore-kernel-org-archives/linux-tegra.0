Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5436C27C76
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236107AbjAYUnI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbjAYUnG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:06 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A0D5CE62;
        Wed, 25 Jan 2023 12:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2+vIw5Bj2/QLTc4Fva7udSUGUXCLAcGhj8erO+nuyk0ymTikXY5w+x+9VRP7G6iN6cmxRwT601E2KglfjvnO8EE0FLxG1sIgiIJWywCEFwuLhlkisr0zbIBYWRrVYK3AE1qD7H/NwkJPkHVmpPO6U00VLn7QwIYpXJgQDszKwiLdV88gzAvfIxaUJhgzLTRDYlG2G8gzL/DW5O27pGS0FhgaHKy8YSXvKH7UkrsRQb0YaZWEE0reKQvxpoVWDTibllj5wSmhMJxRaQB+NkVOEjz7WnF+X+OT3nzN1CC86YR/04VdTObSmSxDdfLg6bQ0QkCweYNemTfq1szlSjmJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTjf5G+NXaU5lXSrwxsQOaZCTW7Hi7Dv348B38qYUFg=;
 b=UWw5d2NuSHTv+/mY2hFGVHdKU/kmbHrRowounRPvN3eioh3L7Pk13JpTJTaARzkedN0TqLeauxgoMaQssmzkovQKUDvl0f/57SdfOv2Iez6Qvj+FTUs2/rZmnY2E/OHIhEsuYkCHTgW8bTKxtwL5DDtnqFzq15lcSmpLIYs+E3mIkQBFrlb3EneUUJSKnnuGATBaR+pKSvqpWG7b0FKkHWOBmls9inb5KT/HYjGX4CHdyZ60Lr3qVcfYwjaf2n4JQwQl8ocl39iBp47ByjhwCtDksy/TEQA3e1v0cBdex1xVuoCjoG8Tk5ui8ds0mEWNmoFsPG8eHjZVg6wtxVRZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTjf5G+NXaU5lXSrwxsQOaZCTW7Hi7Dv348B38qYUFg=;
 b=urdbrbEZM7BJyQcm8Ivm98pC6tMn+7edoXC5Jlivk71wzUhgpehuQWCaEw4foKTRdOI2Ih3pBuvzLA8Hb6cqT1k+4CfOOsyEz25KfHWibAaK5Xfcn4/sCH32+iTA+diTJih0P+7WKMJ20BfeQ7XkIYeUe6up9syRB1Tca1lrB4D2D9nrxZBljkGtmuLzHZztflL8vd7cIx6qJE1ZjokgdsKmBPYboZYaXJs/aBKK+lGhbNvLZyxXTIpfRdhJGx49/NMrwsz9EUEUpQtdUFNwoy7ocTonDnoM9Qzd7npMlTcd9Zuxh70otTgyCrQogtxxKmkjprtQBJGQ0ecIMKXaxw==
Received: from BN1PR12CA0003.namprd12.prod.outlook.com (2603:10b6:408:e1::8)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 20:42:57 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::20) by BN1PR12CA0003.outlook.office365.com
 (2603:10b6:408:e1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 20:42:56 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:40 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:40 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:37 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 6/6] arm64: defconfig: Enable UCSI support
Date:   Wed, 25 Jan 2023 20:42:11 +0000
Message-ID: <20230125204211.63680-7-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230125204211.63680-1-jonathanh@nvidia.com>
References: <20230125204211.63680-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT021:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: ffee2512-cfdf-41bd-4dff-08daff14bd31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lVGgq4R80UcBEWLSyHIYotP1gfcE2jitff65aN7YbItrNfnhaNtGQYsaJ9j3OZlUaxqXeA/FoODBGwDwkfWRxFjPsmLbMUhw8Uoq56vTM1EeqZMme4ALhWfLXb4MxMQTf5pMlH+xBUXCOj9ViJqtbpJc8+VtVilfcCgZnot8qgkOx+ApHsL31zg5C7WIA6J5KtGzlaAFZ7nW12iiqLQUtySMntIjbTg4oH2v+Ry/zeAbB4hUUcJnkkTiLWuuY4D1L3Q++oOsVkx7aDHgmYoP1L6MZJluRHEwYDHQrCAwU/KswtwJcbzuDxJcLrATo0a6lZIFG6rlrsc8VwVpONsgK82s5XOOQNtlKcIfG7McvKn4Ty0TaOpUdoW/7iTXtQu+AFxWrdc+YJVZNQJ0ZBAA7+1slVUvcLcZQAXNLuwK8IvdLBkGDUvBn5fTZ/kEjER8r7TeyMJ6grfrs3oMgNamrMLnL8+ZBEIo+1OmcjPRpWeC42lQQpiyGfCMbuweCHIPNKRLtJ0FJuZzwZMGygjSVD8ZkHbTsYFc8xt9PxD3v5G0k4XE2Zrrl+O7BQp2d3MBuqfIp6gG0nHNSqju1GILXBVrMqU2pA2XyaGZG4YsTyZ7tembuZ+6vW/qtRfCT2zpu/Qf+i4F5oqjHv9enh3gtkl8kINTgqa8Hzp2Hvn+Vbnfl4fBrF3JODAee24AkLNdYO9rS77VqjbR98zbHxSEtA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(70586007)(4326008)(8676002)(54906003)(107886003)(110136005)(316002)(26005)(70206006)(41300700001)(336012)(2616005)(8936002)(356005)(1076003)(40480700001)(4744005)(82310400005)(5660300002)(40460700003)(426003)(2906002)(36756003)(478600001)(86362001)(6666004)(47076005)(82740400003)(83380400001)(7696005)(7636003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:56.2869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffee2512-cfdf-41bd-4dff-08daff14bd31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable the TYPEC UCSI support and the Cypress UCSI driver that is used
on the NVIDIA Jetson platforms.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V8: no changes
V7: Added in V7

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 984553d55e17..d487d0e2b8e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -959,6 +959,8 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_UCSI=m
+CONFIG_UCSI_CCG=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
 CONFIG_MMC_ARMMMCI=y
-- 
2.25.1

