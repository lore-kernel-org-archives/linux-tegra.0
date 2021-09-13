Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752D1C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:42:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A20960E8B
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238626AbhIMQoM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:44:12 -0400
Received: from mail-mw2nam10on2049.outbound.protection.outlook.com ([40.107.94.49]:13408
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238758AbhIMQoK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 12:44:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5DG4Wji+qu/DSrV2yGi31/+JkhHF1S2iwl8DfguZVZ3fQKmS5DswhPrJZ2CUD+/+0ybl7A1JMqVmHmsLSXnb+Hq2o9ksTRIzrkRBvI3Pq+VZELs/GASfrtIIEyRM6J4SptXGZbOi6fNn4HHewO3eFHNsP+hFSB0ylwuO91Tfj5ri6mjQ91xZcUx19S5Dp5g6cELztGuL0jPWidvW6adlJMVS72ua8gFR0p+LxTxAz2WL2hN6qOQTjD6FyUF6bBJlaEr+4IDV0ehxBhrBUZmSvywfQFIzQ4HSxlXLVEg8SQ4aKclWSqE2vgGTFt7OV7DanEbBHs9wIAgF+4/EhkSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OrSZKOWs4rdh5mBwsUT+O1TBA0O0LBuknJBdn/YJ/u0=;
 b=JGj9H1HhFMDOTJYFoDOKRKKuPxmebxexe6lE6WzJDb6Ls/X4NSCYcDRFW58t3qwWZ+5L4uvTXohASpW7xxOiwZ9TIHcwFcRcF9K0veLchAN9OiuWwmnfQColy+WoUszFwI0SksoT2yNVyU0MSQ4gCm9eyHcHFAqKtdOog2TXAn7bHw9kuTu9phwjLvq//Ckdve5So8Av6RndhYkiCVLOjO8KNMnWeJqeeLNfQCyqSYclN9ZbUkXTwLyfM6RcD6caDybasxPG6uCpwl7iIrPYOeYCl7L33c/5rLMDDQnwgSBH5WqQjSxhXkrbw2j6QnuJnYCRVJaFc5kwpU4KUGkr1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrSZKOWs4rdh5mBwsUT+O1TBA0O0LBuknJBdn/YJ/u0=;
 b=SsJ1O6bRDQ50NDoRcbLGfrrgJTc8pBxnNA7+83HhFCt9JB8PNqjX4xQf8GtVQnAcMBQcB/jrer7PwBSTkF64vapCUYCLWYfA6MFoNhzkcjcbgxqRpDZBhPeR6xMAGJDnpsYMjv8wZajYw9j5tn4t7t8tMA1xPBlRaNsBY8DzL0IBRkkBVyuT3KmiyeIm6QHzAVdE9I5LRpD2FclxePlj16DXUlENRRkSJXvHSHWGImOMYj8h6NsIonc0AOgs9ywT3HDGtYaN0E1cDXT3zdyTjNTk0Nslu0kJ/xbYro2LlZwU204rDPr9otYUTcz/gmndJPfThvqYBfAILpFeCTZjdg==
Received: from DM5PR2001CA0011.namprd20.prod.outlook.com (2603:10b6:4:16::21)
 by DM5PR1201MB0252.namprd12.prod.outlook.com (2603:10b6:4:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:42:53 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::78) by DM5PR2001CA0011.outlook.office365.com
 (2603:10b6:4:16::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:42:52 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 09:42:51 -0700
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:42:47 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
CC:     <sharadg@nvidia.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 02/13] ASoC: simple-card-utils: Increase maximum DAI links limit to 512
Date:   Mon, 13 Sep 2021 22:12:10 +0530
Message-ID: <1631551342-25469-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b044de1b-ee9e-4d79-5d93-08d976d58765
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0252:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB025267DE1E484D5751012D72A7D99@DM5PR1201MB0252.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8NJ+j9ncpPYgKR236ATDN/jglnyk8iK2dQY5NiNr1cWo/By+JruyBwBlX2mBmP0qn1Opde3PPHiN67h9WJNmg3+wgOCaqSuWwhPAyz+r6QopfMLthlNUXje/+uOH15rP+ShyeO3r2SWXmbB8pUUmGE/+vkoyuUDrJMyf1KQiITX8oN4cJPffowaSnRmRqio5t/PfDuQt/jKWR0q3NKJV9HgPs0ykK92OeXZyBN0//uv4E3FQjCPity8szNBdjoZuE9KHj57GFlahb7JMua+TQTGam2cnb5msbruYRsOxdGY7yAq7EwUVDTI8DXM1UXMP2gH2jEBLUVu+eXSXHAEARILc+5sKsPBY/Doh2n0t0UPCDWdJqe+r1xPCDsiZjhlXdxeBKSSCHIkQ82n0Us3gdfLe/4peiWDrN7iqigpwFhiVC70cPRxnEr72LW90oTsUW3bBCJY+CdGo/0G8JDKX/Br5RfeS6t/UJzQU0elfweuEwT2k+e/sm5pgpKjvXYdFf2lLdYUXWevmqmY7PX9EO7EPzRXcsYRN93HNP4exsFGIQlW7rHKx5XRyUnBzclZ3zeNqu2a/LaAu+/txOPXW0vE8cCGPCUqB0rMKePKlEwa13s5NQHQuqOiCzSgLkyD4KZqgyjjGPoCtdMz2jNEbtf5T5YCel+9rJRSKrIBX/p4YoU1Yvggr7aRB3I5FNDA9a2f2vVmAHHUJ8fB+txEjuUXZag1aP9CUPfyeLspH9A=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(36840700001)(478600001)(8936002)(70586007)(82310400003)(5660300002)(86362001)(356005)(921005)(70206006)(6666004)(186003)(2616005)(7416002)(2906002)(7696005)(4326008)(8676002)(336012)(47076005)(7636003)(107886003)(316002)(83380400001)(26005)(82740400003)(110136005)(36860700001)(54906003)(426003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:42:52.0235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b044de1b-ee9e-4d79-5d93-08d976d58765
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0252
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current limit of 128 is not sufficient when more components are
added to the audio map on Tegra210 and later platforms. Thus it is
resulting in probe failure.

The requirement is of nearly ~200 DAI links. To give sufficient room
for future additions the maximum limit is increased to 512 DAI links.
This is a preparatory patch to add more components like resampler,
mixer, multiplexers, demultiplexers and volume controllers to Tegra210
and later platforms.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 51b3b48..6b78034 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -115,7 +115,7 @@ struct asoc_simple_priv {
 		     ((codec) = simple_props_to_dai_codec(props, i));	\
 	     (i)++)
 
-#define SNDRV_MAX_LINKS 128
+#define SNDRV_MAX_LINKS 512
 
 struct link_info {
 	int link; /* number of link */
-- 
2.7.4

