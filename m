Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB13C433E9
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:32:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB79064F10
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhCORcS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 13:32:18 -0400
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com ([40.107.93.51]:54848
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234049AbhCORcQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 13:32:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1woKfulkKmdW62DbNy68EJCpYdOQwd9GEkcdfpW7YdgF0KKZplVmCFCI9c2OHfZHSM+QzyL+7wxyeGIy6Ndi4C4dIIywuXsFEN2h4lBV1mgZDq1eNmy8hIrxqAnP8ijB9bGpul7xZD7MJn/KKbNuvLCR3msKoS7LFSWfvet67fxXmun73Wlj8egZQiEZgqyFbvNmOFh/Nk+bsNndbCiEnGVSTrp9phSgpo8cmYnuD/cs2D0i+hySotdZDTPqYctsjPTDSSe6MDzuMaAlcUI+TiZ5+yUa6jwI2ihFLL5QtSe8StoIyBWsRRZTG/1xiYbwPkE43YtvYpu8YMyAcC1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvMB+SmVqenYtoji9nyeUsmGS00fwDO1pCM+PCuqC/c=;
 b=avl2AmlXPEl7El52YzPu5AsJUfdX8OKC5tYgDpc+L7gui8EK+ovlGsD2jLqqcm6iot+fyZXI//CgKZ4ES/y7/CLtoTtKdSVxZILBosZRy/Rt+NngmsRRACSagvvHq8TNBZceCkgF38bSt7KYu7HVLFYthMizzRUssy0PnLnFO9f9YFP8LAv1d1qpjtJ5WGfAqrHX5JkMhu71o1GpE85HVsFvB6/EUYQZMWfB+p6QxNsaN671RR7Yen3JQIfiPbfQv6uaIXtApxx2l2lH5bD1vzIK/KiMpaFci3l+0SpO+NzUpBNUoi697zqVy9IxxYT+x2wBSOrsO55yqNHZBjfU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvMB+SmVqenYtoji9nyeUsmGS00fwDO1pCM+PCuqC/c=;
 b=KPOd1maa8No7449fLDI6yglEcCGfeYFzT2T4HV/dqeWsprjjGQ7QThOUS3SYRqP50My8v8OWaWERKN6raqUeWOS2aK3YTQXAuJ6pQAQz4JDjUqD97gui0Hht+rqZ2LjyjWREGx3DeMZxHfpMz6RJ7N164I/1Tn0LjB6C/ATC5G/usMNeCjk3+YWaU0N8WiLCryglbOYf7pFtZaaVVw2DcOUhd5rT9hxeYaw3QdBSQw+4jb5djShtrTcsXKca7cecbo1d8Xh1108/odHHURfWIGh6ljKlnl5DXwF0HGCHgH2J6kZya1s5UHYu7CI8CcXKxiRIeVmVQHOeCU+nhHHXig==
Received: from BN6PR17CA0044.namprd17.prod.outlook.com (2603:10b6:405:75::33)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 17:32:14 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::79) by BN6PR17CA0044.outlook.office365.com
 (2603:10b6:405:75::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 17:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 17:32:13 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:32:12 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:32:12 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Mar 2021 17:32:09 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>
CC:     <oder_chiou@realtek.com>, <michael@walle.cc>,
        <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 1/2] ASoC: simple-card-utils: Do not handle device clock
Date:   Mon, 15 Mar 2021 23:01:31 +0530
Message-ID: <1615829492-8972-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e4346c7-1723-44ea-f9a3-08d8e7d845be
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254C479CA757832CDC8A43AA76C9@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TMGs9HYW+LdEV6OyI0MSH5SjVjXwtLjZ0W9IAebEf8XHDX2WlCjGrvb1hWGFehq2WRLibwhMJuLfem6TFnC7Y6zFfHZh5mW3eU7+z+oAaggi8bpJcprMk4IH4rPfpK812lvHdCXHJKCXqCTWtmIQ9dkjv4BzcL8plIfBvfz8vAQ8J6RsxgPjrrbfneMugn+68eXh+nwTr/mtYvCRJwAEjua1vDk/R66sJhTsHM7WqHwxbsaukJExvvU23rvhsr48hSzlrxqXv9V96XeixiNCP6i8eBG7HkPASlNe+/+GM+4iRcbQYLb6K8r7Ylxqvp9Ste8zXD7K8WPpUaTEiewf1NQhfgC8ggBwL19jmQtcCsaxPVCEk2QqY3NUNjjp/g7Cq5jl4MgcQ06NTBV1ueOSWGGq9hgOpx1Q8y/ygFTwILGlxrT0Qh+eAQsplEJLoCqJiG1rH7maB4+UPzBT+a81RX5THKzhkE2XFQSXOOF9w6Hfrynn6mZKo3u2E060OMo21mH/pOy1mjd+p95OMH3E2LRz/g9vvc0n5jmb4LAwFNfjbnGLaZpdJaWZ1uDXa5NFhdUNLnLtkZ4z02iXU1SZfHUA8KTvOTmuQc1g7Cy7l+beMnLFmAoRp0fm64Lk/Yw+T5YG9pt10zWAgRyDjJH5Kjjp5FBmEpJGuyN2qXy2PGccDMZ/oPSf3Y94FcIpcYsW
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966006)(36840700001)(426003)(316002)(2616005)(70586007)(70206006)(54906003)(47076005)(110136005)(26005)(8936002)(83380400001)(8676002)(82740400003)(356005)(478600001)(34020700004)(82310400003)(7636003)(5660300002)(4326008)(336012)(36756003)(6666004)(107886003)(186003)(86362001)(7696005)(2906002)(36906005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:32:13.9432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4346c7-1723-44ea-f9a3-08d8e7d845be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This reverts commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device
module clock"). The original patch ended up breaking following platform,
which depends on set_sysclk() to configure internal PLL on wm8904 codec
and expects simple-card-utils to not update the MCLK rate.
 - "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"

It would be best if codec takes care of setting MCLK clock via DAI
set_sysclk() callback.

Reported-by: Michael Walle <michael@walle.cc>
Suggested-by: Mark Brown <broonie@kernel.org>
Suggested-by: Michael Walle <michael@walle.cc>
Fixes: 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module clock")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card-utils.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index ab31045..6cada4c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -172,15 +172,16 @@ int asoc_simple_parse_clk(struct device *dev,
 	 *  or device's module clock.
 	 */
 	clk = devm_get_clk_from_child(dev, node, NULL);
-	if (IS_ERR(clk))
-		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
-
 	if (!IS_ERR(clk)) {
-		simple_dai->clk = clk;
 		simple_dai->sysclk = clk_get_rate(clk);
-	} else if (!of_property_read_u32(node, "system-clock-frequency",
-					 &val)) {
+
+		simple_dai->clk = clk;
+	} else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
 		simple_dai->sysclk = val;
+	} else {
+		clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
+		if (!IS_ERR(clk))
+			simple_dai->sysclk = clk_get_rate(clk);
 	}
 
 	if (of_property_read_bool(node, "system-clock-direction-out"))
-- 
2.7.4

