Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9D0C43216
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 09:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC02060F39
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 09:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244930AbhH0JjO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 05:39:14 -0400
Received: from mail-dm6nam11on2069.outbound.protection.outlook.com ([40.107.223.69]:21344
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244847AbhH0JjI (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 05:39:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Spx2zxdTYI26rFnQE+hxYwxOkqMjhDD59jklm94ur7k1zzYHlwWKgTMcFMfTJzI5RyO8pjrLhiekronZMO26xbqGuwy21/2BJwbDYI8w1Y9doIqkdXKqfpUZ7ESqYBv9Wh20KMobUvfl06bEPML6m7I5WdBhsyz072C0utGpwqI8xVkOhW/otdhBwbUhvMTrLLloVaKKY0/prae1ayGzo3MjrHJBsVbktOzD7kxRMxRqmobapR/UY57ulC5rgSpokoEKyiUuoI+Y1Bea3WJTP5d/xaD0PRvJXEJnuVOO/lo3mpYhwoAy/5Nfa78OuFYvNWG/mwZ4BjBNtK2BcEC7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGpzHu6VB1AcJHhdAsrBBxAa7ZoscF3N3XqyzlrjMVc=;
 b=Ft1sBXpynEHk0iuiEln1hpIW2Lr9RioqeFbiBjp2lailSnIq3s3D8Pbj7umrdvsblKd8o2nX7J03gFCV9Yk8M+3wVfPCJVpDsvC2n42v659onaBdzai2QRSc7K5R0XX5sSmBaTq2GTwXadvNGZ06B+hka4prIztO0yPkAitLJn3+XE2zZ6a/yooGDgGKotkR5ylPdxVOlKlRCHIdPNkA1/etI/yQY9wfL7fzvSNPTHvLDx4uD1hd9rIsKzQJOkrRRakJtGb67J8A7gRkL1fN8c+3s7tvoA+dUFfq9n2uo/u4BvC0F/5WfthwO2HdfZ3eRJ9wu+ThyNI0O4OxSMWXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGpzHu6VB1AcJHhdAsrBBxAa7ZoscF3N3XqyzlrjMVc=;
 b=FTL5NfxY88l53JtKhTeXnLz6KqIOArK7XnUA80DeIJj/nX/YU64FC1S0pEHoZqz6dbIqzK3bdK2NK9/VnHxO+AZnyVjnGmGp/bLhgA2OyXhOQz6ojncJOI2vzE5F9w1QWWNP3hMxz4Yi2lOBTcy8yKk1nV6SmGhX8ThDx4MyTAX4PpQvnVTeVKgRRBloZ4Qtt2m2wHPJmyhsxH6bvsGxir/XymF8L82EKfcWIlkOmpY9RA5Ikrwy591LMLneVu6wCuoei61HdoHgn3wieAA/Q/6M7dhOOlBsUZr5TjExAN0JuK2ZIXn5AbxrPsG5jPoMReUfJNPwp9irVVm6oNixJg==
Received: from DM6PR13CA0054.namprd13.prod.outlook.com (2603:10b6:5:134::31)
 by DM6PR12MB4497.namprd12.prod.outlook.com (2603:10b6:5:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 09:38:18 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::18) by DM6PR13CA0054.outlook.office365.com
 (2603:10b6:5:134::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:17 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 02:38:17 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:16 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:12 +0000
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
Subject: [PATCH 03/13] ASoC: audio-graph: Fixup CPU endpoint hw_params in a BE<->BE link
Date:   Fri, 27 Aug 2021 15:03:49 +0530
Message-ID: <1630056839-6562-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1c775c8-bcfd-40e1-c488-08d9693e66a5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4497:
X-Microsoft-Antispam-PRVS: <DM6PR12MB44976AD43072FA59B75E6ECFA7C89@DM6PR12MB4497.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkMHpLu75YDNx77V2jFrfhbYhTKW2m9p8IMVT9b4FAuy7tfW3ueO6yq1H1nKEYJNNgWWqj5rpL4hKc2q/GGkDmJy5k/WHegObuPgXyaXjOARufO5Ii796mOCrdEeRGoY1E+o9jy5FBPVrMwLwygvlPYPIIQWzdH0VOe6rK25WEvdZfIljAxlqEhDpu3h7B7NA/Icp/AFNa0OMZZsrOQwPdmUkLyUZi0XKDYlZfPX5/8SvDzPld5W1+FuQ+2Uiykx7JhmzTkr5lFjV/QXfvyMbPK1KIee3MbchbDlJi1qu+zwM+jRh2L9S/nR9dj08bEfLAvTlsrcCIBFFiXDjI1wD3lTSmLAbqP1EF5Zi9xrQA1SW/6obilIQnL9xvhdzKR8mDoYHezGDfMU0Uz5Tx9Jtmrzg0Nx8kj+28C9CAWHd+3W1s2l4skSYQrgIjlNMbPVbrgp7BKaVlih4hbWslItgeILhzdO0WGSTqVG8FyFlkbvzMB1g7Tad2wroosKk5S0cZ25OvEm+VG2+klbL7zZTtGq2xwv+SFFMFehP1AFBMjw9HBEuTh0ugV8t93sgk9T77yf1yYkXXbK3sboauLW3Xj+d87joywetwLfz8fZigvsouIFvfDS7tAR6Y2+mbh9PkVuJxDq0uswoAO6M5c7ETuACg9DhuhMTlXG56+mive3ImZfVJFBtWjxf1ngnJ6jAEWAMXZH483ggyhF1qqBnOaW03CX110Z9fNvmMb2WZk=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(36840700001)(46966006)(70586007)(86362001)(83380400001)(356005)(47076005)(82740400003)(7636003)(478600001)(316002)(110136005)(336012)(426003)(82310400003)(186003)(36756003)(6666004)(26005)(7696005)(4326008)(107886003)(8676002)(7416002)(36860700001)(54906003)(921005)(8936002)(2616005)(5660300002)(70206006)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:17.9595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c775c8-bcfd-40e1-c488-08d9693e66a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4497
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When multiple components are connected back to back in an audio path,
hw_param fixup may be required for CPU or Codec endpoint of BE<->BE
DAI links. Currently fixup support is available for Codec and this
commit adds similar feature for CPU endpoint of a BE<->BE link.

For example a resampler component can be plugged into an audio path.
  [ FE -> BE1 -> ... -> resampler -> ... BEn ]

The resampler DAI links can be:
  BEx (CPU)              -> resampler input (Codec)
  resampler output (CPU) -> BEy (Codec)

Thus input and output sample rate parameters for resampler can be
fixed up as per the resample requirement.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 5e71382..7439122 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -309,8 +309,10 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		 * For example: FE <-> BE1 <-> BE2 <-> ... <-> BEn where
 		 * there are 'n' BE components in the path.
 		 */
-		if (card->component_chaining && !soc_component_is_pcm(cpus))
+		if (card->component_chaining && !soc_component_is_pcm(cpus)) {
 			dai_link->no_pcm = 1;
+			dai_link->be_hw_params_fixup = asoc_simple_be_hw_params_fixup;
+		}
 
 		asoc_simple_canonicalize_cpu(cpus, is_single_links);
 	} else {
-- 
2.7.4

