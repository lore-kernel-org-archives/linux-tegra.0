Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262DCEB64D7
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Jun 2023 18:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbjFZSJ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Jun 2023 14:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjFZSJ4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Jun 2023 14:09:56 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670B2E7F;
        Mon, 26 Jun 2023 11:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnPMqGNrDqBuMzXJJYbSenAPjeP/Qcy5pckoryqNfo4vSv00saIBdVWyisZPN1rFnqUP84ufy7tEKrdAXtxHrW64nsq8KjlgoqKCvFqEV95VrOI5WxRyvlYBSRi85zfTh20VKVOTO/1A1OUAS326KQAftxnQkS9+kdl5HXCYp7TCMYIZ86YM7PfPhZp4l+/mrpJi3GKceKOqLCeGF+MQ0SWPQsQA7LYRSu4F+Rl8gOF26ZUqwvRBTI1PGJG3NHsqEyJzTA0AjZ383MmcfKVscqqZlmlwLPEAP5Upw7NGnJl+0Dp/IDB5RuWwt8ESva3aaOAq6NwZn6M0Zm0jooORRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdyniN7iUypRpRFe5FmT5xgF2n3M8MTObNtXYurZFtk=;
 b=NuDIQ1er5tIfS+yqidRyfoSQXQB+2HKMzi9h6j/ozSJ9ZvPD/xxdGVDdffZis731QX8QIbYDZ8iIm01+ctPScLsPjnS6bYYsb9Ru5+cym6UncZVIFjUEOb4MF8BygKUbl6du5t5uYVwhB3PxDhYBF8V4LnQrqgMQqNP63zRMFCSzaxPRe6XngNrC+/dSvNP8ChaqB1qBBalxZVTux8w8VNo4ZIIz/N0xQP3MNgTISVlk3pqtsApmwd10daJ+kIF94Rf1/xa20Odg5VDDhVPHVTZnf51nEmvypm5FnQXMJjWuO3neVgOeNJNZl5KzrgyZNCjKDcEGWDDWUMmtq4iTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdyniN7iUypRpRFe5FmT5xgF2n3M8MTObNtXYurZFtk=;
 b=YmRCLwf1jN9vrERLivcCvF/0v7uaTik26LlXCzHx79bDZ5tdPb2KlqYdu2ICRjiMjAqcOqT+8IeBMaEGZ/+mMfNmW/IDVZeiD+6/DDaA6RpzWELY/J4fp9j1CW3x4B0FP3Mn8sy95l8MMM7nxGA6rRScnTFDBSWIbCqrRT8grd/vydxqdbWPwepaUaNbCIVPRuLrl1EPnoAVQ2wNawBtwqtCBZ8ZbhYLB08R1wla3GNkVn6E1EFWXx3GqanzFDilVmGwFNG/raTNas9dgwYKAs0u7AvULLNLA6KNujHpAQpSgclRw0L1K0L5SxbZs/L6E5yiy4RLXkr8vI/AJ3rgYw==
Received: from MW4PR03CA0302.namprd03.prod.outlook.com (2603:10b6:303:dd::7)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 18:09:46 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::57) by MW4PR03CA0302.outlook.office365.com
 (2603:10b6:303:dd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 18:09:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 18:09:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 26 Jun 2023
 11:09:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Mon, 26 Jun
 2023 11:09:31 -0700
Received: from build-bgriffis-20230515T220707639.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.986.37 via
 Frontend Transport; Mon, 26 Jun 2023 11:09:30 -0700
From:   Brad Griffis <bgriffis@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC:     Brad Griffis <bgriffis@nvidia.com>
Subject: [PATCH 1/2] arm64: tegra: fix p3767 card detect polarity
Date:   Mon, 26 Jun 2023 18:09:19 +0000
Message-ID: <20230626180920.318774-1-bgriffis@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT056:EE_|PH7PR12MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: cb7c8c5e-e010-41bd-6ef2-08db7670861f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dw40r0wfmZF6F2h28rxWAFmsIwap5SzKkrp83v+10Rl4l7uh074SCSkbNtjY2ApI9HxEhEl6hp1G1IHz9jJgGS2CMG+5xX3yU3KpnJQybgkGyOBms4uCJQivkkqB1CVQpdIW4CqnsHfmL+4m6lLzxLcLur6LAcONPXx4Aveum8uXKiSg9HvGsCQmg2QzzxDcP6YSysRDA9ckTYXbQ0YF6wAbb/alvfOvw2wPmwJU6GqCO3Nsw2TMefaQm96AHqYnYXalXInwP3aqZfbbs/XiK4bPIwy+3VEXWZACnYec7JOwwW8gMkpIOn6kh+neeHZJuuBpFeOEN5ljWG5g+3TAkqtpLXnzRc8QLCJZmmhgGY2zWspTN5jDifaohaRKHEzEN2YN6vYSYQG8u7zrk0jV1oOWgCUokCtW++z1fiIMbncMWvv3k5ujNk4r657ZyLaqwUXUCTw2bPvZYUGIyRP4m8oZPh6xQ5rWpn51GHPfGtenbwZDPlMdbBUWxtuI//8739xc48O+nvgxn94Svt9dWc7d+qfLEGR1/UhXdX2HjIdoFEqycDA4Lp+pQ8beK7gfVHrGbMRgBHnhlmFRJQGyLAQc+MmAHE1z/GHmSwETVX7F9OjC5r1MTdY1xhCnafkmVbI0YxjjvyvPDzVwm5MKpHxQ37nvAaxZDnA73NxiheL83qyr12UTa1dO4eONEEoESnqCsYYvVBoXDHYcvsOlG/yqZcpAmkrebVC1oiGmHpC65WnCkNyImDQdESqiAdxP
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(2906002)(4744005)(186003)(82310400005)(107886003)(6666004)(2616005)(82740400003)(83380400001)(7636003)(1076003)(26005)(47076005)(336012)(426003)(356005)(36860700001)(40480700001)(40460700003)(41300700001)(110136005)(86362001)(478600001)(316002)(36756003)(4326008)(70206006)(70586007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 18:09:46.0585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7c8c5e-e010-41bd-6ef2-08db7670861f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The card detect pin on Orin Nano SKU5 (p3767-0005) is active-low.

Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
index bd60478fa75e..831a553ec387 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
@@ -42,7 +42,7 @@ flash@0 {
 		mmc@3400000 {
 			status = "okay";
 			bus-width = <4>;
-			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
+			cd-gpios = <&gpio TEGRA234_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
 			disable-wp;
 		};
 
-- 
2.25.1

