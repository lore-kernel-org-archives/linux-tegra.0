Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEEAC433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Apr 2022 16:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238021AbiDFQks (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Apr 2022 12:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237972AbiDFQkc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Apr 2022 12:40:32 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE16241A07
        for <linux-tegra@vger.kernel.org>; Wed,  6 Apr 2022 06:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+Aqb2+E4eLrke7RKoIVeWikl6k1ZkCIeADvVO+odIBNGjr+W/QeSWwoObgNcx56wGzhYNI5DMhMuLhT/e4vLNwNqoHuLoyO/mHnMXd5ybkCu9bqHBTyT8yvbstFa5i//ShiCV+rnIbMJyWwDG3RFbPUBJ7NqcZYlwAxdOgXbs0/I6B/gvztlM59z0Ez4cAMuOM6vzfXGnkh6ijckqpC9Mb5t+t+OcTIdySOm477zusXyM90UK6Fq+EQujwQS4Zt3jqt5YGffvTD3fv92iWqFdPukXnHYpzr0HGfSjZI+tpepTZVpWc0DX9wiXeOgAUZmhf69MPKqmgttoSKjTy43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMQ4qIid+AVVczxwkh976xZlbEGw++nUKp0T0NTKFx4=;
 b=mRc6+gJ+E+v0+GSzjHXdhcxRBKTKM/plXw5TpDcYGwIwr9dyN6y8k2o7E76/J/M4TvsBFc63yDYIj2+5j+GjzlONJzMXBDBiS/cQ2EZb4vFoCsKGQb4E5fBCN76QlE7c4wI2PwiBYh2jvMrt4n/emxuJFIvm4dD5m5zahfWeU41qgVfbp23q08ZcYBYv7VGBiTRaZvZ/dqoh4x3b2hD6EPZLob6Vwnj233+gY1V8kOPGRg6jzTFVyFdd4YgP6dJc2kDUnWuGGISswH+sO0kZWtPd/QZw5T3ZdMYmWcRqFIK8T/JKaFRkAIWsEjsIQWUZreUV2xYK1cUdSBjPQ/digA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMQ4qIid+AVVczxwkh976xZlbEGw++nUKp0T0NTKFx4=;
 b=H+QaLBJDYJhafArB2OfnE9QFf6mg311dphIWWeB/3Wudd4DEd8Gj6b+YKWFJs753WZp9YmgvAs35ldSthArGC5D80MkEXiGiuHUrDCBqiJEkVeW+uUxFM5rVbMItHXngNmKChwmTPPc/vb3pvidpAdSYgBkDlrdTLeLOdkjNgQFJIPuUUUgYS/DuemR50LyNefiqtTQniU64nHiP6abbJVPxEwHhG2Ausr+H+NioTwK8l61TKP0h+u16snCEEeHODVwhS61k2GsoYezwtIz/ISXrwy4zvwLDytmEBPoqSBGhbKEEAvOiS83Q6i8QdsgffuO+/bMTVNSoWVPC3wR95w==
Received: from BN6PR17CA0025.namprd17.prod.outlook.com (2603:10b6:405:75::14)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 13:59:29 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::33) by BN6PR17CA0025.outlook.office365.com
 (2603:10b6:405:75::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31 via Frontend
 Transport; Wed, 6 Apr 2022 13:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5144.20 via Frontend Transport; Wed, 6 Apr 2022 13:59:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 6 Apr
 2022 13:59:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 6 Apr 2022
 06:59:25 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 6 Apr 2022 06:59:24 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ARM: tegra_defconfig: Fix enabling of the Tegra VDE driver
Date:   Wed, 6 Apr 2022 14:59:20 +0100
Message-ID: <20220406135920.129589-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d58a858-e1a2-4332-6f35-08da17d5aafc
X-MS-TrafficTypeDiagnostic: PH7PR12MB5926:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB59260126B663956AF28B2B1FD9E79@PH7PR12MB5926.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryzzm2HCv6wWKRbWnqGfj9cuLRCT/j+AD1ZLRuFKLI/5ghhzNsMrhleD2Wo3dnnpDMs3V6PPE/3lLsZnWAlHbCmS8WqQtpI+qy3Zfb1PSKne1Z8NYoYJwTSumZDI0Ms+yw12I6SoY1iZES5LVPyNqY+zNJJo+mfBNUf3BVM0vFM+tvl1rOj20zAILwIdCr56tUDBCMz0K1TQVA7Pl3t3hriuPnisFfUhHQDlzWpeKJIlOkLCgwGigQDAKdt6SxYOVip7Rm1jqCloupd2WU1n303CHH+mmjSbuuLviy23Lq2t7zintUgcRpFhkRTpx3q1Jc4E91q4znXe6o+aAdeMifM0KmHG8V28wXk3eo9ZwkcQLvvHehLyj+1+gDa/AE8fyLfgflqwITmmAIzLi3g6f/1r8yjhWFm4npapst5hGK3+SDwnYm/vLOK4yCYcfra/7J68d9q0lTVLYTqUy9K9oc5RB2f5i8+XY2DbS03VwwgwNobh6INTTniOL/g01dNEIxvSbEz5NG+xi5A/OC95qza0Uy5Y18TKmRYbyqscLgve5PBMnsHrwGqs2RhGExOIcx5h1S6QbdqkUuc+5IVP2J/WLqMouQg/jKZQBiHZxsDcpQwruIzDyawEPsSJ8+2PsbEamQ+E2+1EMTrpTBctKswBczfdL7J4cFBmSSwOak61HUd/tyremI0wv/j/u4+VYKIKo6vAyvF51U2Pjkl5bQ==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(6666004)(6916009)(36756003)(4326008)(47076005)(83380400001)(86362001)(40460700003)(2906002)(7696005)(8936002)(54906003)(81166007)(26005)(186003)(336012)(82310400005)(316002)(426003)(36860700001)(508600001)(356005)(70586007)(70206006)(8676002)(1076003)(107886003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 13:59:28.8771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d58a858-e1a2-4332-6f35-08da17d5aafc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver") moved
the Tegra VDE driver out of staging and updated the Kconfig symbol for
enabling the driver from CONFIG_TEGRA_VDE to CONFIG_VIDEO_TEGRA_VDE.
However, the tegra_defconfig was not updated and so the driver is no
longer enabled by default. Furthermore, now that the Tegra VDE driver
has been moved under the Kconfig symbol CONFIG_V4L_MEM2MEM_DRIVERS, it
is now also necessary to enable CONFIG_V4L_MEM2MEM_DRIVERS in order to
enable CONFIG_VIDEO_TEGRA_VDE. Fix this by ensuring that
CONFIG_V4L_MEM2MEM_DRIVERS and CONFIG_VIDEO_TEGRA_VDE are both enabled
in the tegra_defconfig.

Fixes: 8bd4aaf438e3 ("media: staging: tegra-vde: De-stage driver")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm/configs/tegra_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 289d022acc4b..c209722399d7 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -286,7 +286,8 @@ CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_TEGRA_VDE=y
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_TEGRA_VDE=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=m
-- 
2.25.1

