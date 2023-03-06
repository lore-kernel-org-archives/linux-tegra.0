Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B5CC6FA99
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Mar 2023 15:09:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjCFPJj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Mar 2023 10:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjCFPJi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Mar 2023 10:09:38 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::617])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4949724113
        for <linux-tegra@vger.kernel.org>; Mon,  6 Mar 2023 07:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncAK6yNUIHB2nSR66gNCGs1JsFbrZyXH4pNYKMIJZI5lMgbuyxtFiBfFIfbPHfo327J2U7RsBkcFFJJ2bRCt5d6OwUNqvaLlBhlhrXUK/wqfPif2Zh2IHEmnq60Iw6ZyHe6S5vP3hyWnsnMEPsTjDb2lxjllxejKVp1U3E77PgJvpCAWGYFKP5ffR7e0yi5gtaBXCjWklG7l+AW2qT6J5A91s24OmW0dXxPSKv/PJgJSt+rI9nSBBAkLr1SG7eMyhVGXitvtzNT0wwlz4/Jc5YHwibVE8/cS+ntttK0EpAEoQxOHDgcluDw9uyLC/r04d78J4Ot/+Zt3X6zXy1oyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRiVvehbzji+d35IP12yTjbaGuo2KF5BSCHQN51pkOc=;
 b=kTU+KVEpORt2hGyiscumH4HIAcVcsHNAzGLr6KnfSUneU6r59dXZB8ahHgdqx9OZ9tX+s0g9C2GdBVJbRtDepJutAyFe3FPgZ9cmE1+J3Ne0+/HyBtjg12LTaMecVmRPC1725+m39trX+el0766o9rbs/SDfVATCD7NHYxryexKbIA4xhwE+HfiRRSFDqmeSVUvoak6TmKSMqyjR/3rzSJKEZCvlNaWP8Nn3cEOPQJcw5XkA7+6HNXiNO+U68K2tfD20k+U47/q8gvEgdrAlEu8fPbgYNctX2AZNcXSw/w7wBg1pGvDBykTYnqxRIvG0avm7E6AIsoJDWlvl0L/AQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRiVvehbzji+d35IP12yTjbaGuo2KF5BSCHQN51pkOc=;
 b=idoC+/CDFlK0ZwOwmdhkUSxqskSQKOsuuoIWiHvQVLZA+95ZQ2di2Si4A4Ba79JwBYspY3t+pBPEE5Ram0BPIvqr3qFOwUp/rKWeZ1uFCNpk4V5ihPA7G2du4MCFcLfUZEAi2K7odOiDOYxp9OoMjVoqv/e9tih11Ci25Zz55OnkvNZ3c5o5KlmYbtxClkfg/BjcK/YSLBzrVIRiiZZPaeRyFpDcfUzxAasHs8jfsZ5ojaS4DGMCd4k7W1dDKbqHvIP36a3fHm5ZwPO0zQrb0PoCReIlvcjvtjsJHsgyN3gnP/vjIDkF/AxOSlfEQDUe+juzv7Y2tkPjV5/9D3AZwg==
Received: from MW4PR04CA0225.namprd04.prod.outlook.com (2603:10b6:303:87::20)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.25; Mon, 6 Mar 2023 15:09:17 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::79) by MW4PR04CA0225.outlook.office365.com
 (2603:10b6:303:87::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 15:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 15:09:17 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 6 Mar 2023
 07:09:09 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 6 Mar 2023
 07:09:08 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.5 via Frontend Transport; Mon, 6 Mar
 2023 07:09:07 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Add the PMIC wake event for Tegra234
Date:   Mon, 6 Mar 2023 15:09:00 +0000
Message-ID: <20230306150900.123616-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT051:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d3605a-edad-44c4-66df-08db1e54c167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UhczaCFGnV5L+XG8VtMpBDJrWUTcaCDaC2GCTwlKioY/jtflEI6cHfqNVj7DX/Z0vR4nemq5EwSdy8XgY3DTsHXTgSZ5lnlCsrG8ZpHNQuri2h6N+/qtbMdKIrfd5yf9gSG7he12lXz6WG3QeLAlXU2O9kJ1oFCVTX/3bnR1OAdW54rbpaIjHy/en2hQIUHsVerD5VHQwabozhfkPpHiHzoRYpQPrxq/dpOAagnnO09Uv1Iy5FkR4IoOifUICkfAl+rxNdbKb2G7b19gMHfnfz9Aptb7eICSBsebl9E9yTJXvpC3EaDqKGK6bgXHct/ZmWETEMFm+8nFo7CstQuGcCQGC5nvh/QiIRx9x3mnCzS5tiNr3I7M36+4TKV2OcvDSsF4eqcsf0xzH0hA5l8DqaXD6KlScKko2/ELvrZx/E4g9HsN4nYO4DRVkWs0zah/CfpA5KcBRtoh5H8Z6E4jLM11NgIZpMhzIfVkxyeXpQvqjMWG3iKqQzuMJumBcvVeEmy2DBwKjfHEqdig88UOnTI5GDhBdu58HT6Oy6cr29P6xJsi3dKuJ+ZALonfFXvor9adUw2g9ZUA+y8J3d0kB6grWt/mzpgxqnyc/7qKWd88FnvV9/pyHNqWdNlQ1QvcgkPSWIf5yqppuWyH4+B30Q6xAd/8JVueyylYm82+O8n7KArsTL8g1Hg+Fz3hIKshmpB47kdwu+xoncXqvYzbwg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(107886003)(6666004)(8676002)(70206006)(82310400005)(70586007)(6916009)(41300700001)(336012)(4326008)(54906003)(86362001)(83380400001)(316002)(5660300002)(4744005)(8936002)(36860700001)(7636003)(82740400003)(36756003)(47076005)(426003)(478600001)(2906002)(356005)(40480700001)(26005)(1076003)(186003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 15:09:17.2985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d3605a-edad-44c4-66df-08db1e54c167
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the PMIC wake event for Tegra234 that is used to bring the device
out of system suspend for events such as an RTC alarm.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index cf4cfbf9f7c5..e3e87d5da9f5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4225,6 +4225,7 @@ static const char * const tegra234_reset_sources[] = {
 };
 
 static const struct tegra_wake_event tegra234_wake_events[] = {
+	TEGRA_WAKE_IRQ("pmu", 24, 209),
 	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
 	TEGRA_WAKE_IRQ("rtc", 73, 10),
 };
-- 
2.34.1

