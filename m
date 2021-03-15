Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9B4C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:32:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FEE864E98
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 17:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbhCORcS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 13:32:18 -0400
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:47329
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232429AbhCORcO (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 13:32:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr+JVVEXOqPewYRzlQfB4kpK0fU0IIg86gxw27ByT2XXxMKWJmZvCV06FljPvXe70t9OHVSVKK8VJR6MgewEMlQ8AYJtRvPEfS9vW/2DQgauOmWlY0OskdmKNHB5kHuXXUIAL6z959APJ/QYWDpyl6TPIcC47+GJkEYHOCjq/gpruo1JEBGDDrQeiLxpJOQHiBHEj/VrMWQL0MSChHYWbJFHcAWCOQO49qbg8MkZlqcuHMHpxMXKMzvfWamlDIuzAWl8Qt5loHpxG5j+0CokNAzOf4olNvx5MeFq8Ukro2yxBYn4pQpmcXihwFNy/pPy5EyFo1Fmevda/RwfeW/sOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oGUU9FrGDPBJrcsFlu0FQEMpJAUhkcuGG5C95NB4OQ=;
 b=Ds60C2pedFS1YUuuqvcUzF57gb5t0cxx4jUiEZLUGWbA/4oHo7TuU8PXeD4q/epe6ewRSqfLfNzL8FNe1AHz+foGCb8FtRjXickOf6oXGyvmXBSEr4lswnf3tcSRvZkP6ByZ9VVo9aDJkf7JM3vAMqSQElkrQaiEKPXWZGvJoark5ZXCIB4JwKIP64ALbik7ROej2b8ymXpFBfHjY3nH/0X0LsEtQzqB2Uti+rAwWqzvwiIpWiir0h7o4lu+bfrODrRaR5P6EQ//0MGqqsh05hAp++IlLSIMnmK6zM1nszbXYQbIUt5UtPVf4c6SdiBeks2nUQ1qklvxV74pw1yRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oGUU9FrGDPBJrcsFlu0FQEMpJAUhkcuGG5C95NB4OQ=;
 b=sQfI7wfQ5yJZE7LgfaDNC06UVY78z/f7jJmDiA8OjD9Um9m+RjxHeC+h8a3K6EYgHefcgjoKsXIr2uIPTrtRzyCgxFIph/fFphCZlwxm7L9YR9g9HTwwzph1UP3ax78VHsQSNUyy74SgZkDqEVldVoSiKwATEHlurWHUzdwxpYKlfygzwnYCitqdUe8+Ku/2ZEtNrMxVezyHwabspl/LoBtMRQMuOKn8Uskg9V+RehmJS9E61EhdHMhKAFQfyZHp/EuRNWR/56hpMwbBLvMUrp8x3Ukk9FORrZpmzLCo+6h6pVj8zaE4dGvkUg+1bvPbiKEnHQ/TFzpSCHcuXaCCIw==
Received: from DM6PR11CA0069.namprd11.prod.outlook.com (2603:10b6:5:14c::46)
 by BL0PR12MB2562.namprd12.prod.outlook.com (2603:10b6:207:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 15 Mar
 2021 17:32:10 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::1) by DM6PR11CA0069.outlook.office365.com
 (2603:10b6:5:14c::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 17:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 17:32:10 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:32:09 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Mar
 2021 17:32:08 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Mar 2021 17:32:05 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>
CC:     <oder_chiou@realtek.com>, <michael@walle.cc>,
        <jonathanh@nvidia.com>, <kuninori.morimoto.gx@renesas.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
        <sharadg@nvidia.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 0/2] Do not handle MCLK device clock in simple-card-utils
Date:   Mon, 15 Mar 2021 23:01:30 +0530
Message-ID: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f65f2469-beae-45eb-07cc-08d8e7d84387
X-MS-TrafficTypeDiagnostic: BL0PR12MB2562:
X-Microsoft-Antispam-PRVS: <BL0PR12MB25621B9D9C0A47EA115FB283A76C9@BL0PR12MB2562.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kTfXLGik8hxAQqwswAd6HcG9I8kA+PbZHlM4xT869Es68sRagDux1curvjEgDrkP6SNhXxXbtfy+AkbGn5/duuTEKC9XweBF21BQ4eqA8p+4Yu4/bH5f6wlPK4GIjG9h5QiKxL1RUslO3GalEVgdIWD/5sU2E2aOSGKnT03RG7+YFjjjvTydb5WTvXF1fOjexKf8Y4YvS8+p1RF4md55C1xs4BrCIVogTFc4nhzB0d+NHX324dFvmqjgBykWIt//cpaTAATofE3uy6kqbcDOKOsEZuPzOTPaO4upwkZH00KFqvbDyfTHgIx8mZifg/EWqYyoQHqnrN+AiH/WjhbrjtO1C/HxlBpg6GR6rUeshMxiHxiBk1wiBtgt6AsQTUodvKj7Yn0yQwfv2x76IPNXaK5uERhLMIHE4+V+snMsihZJ4YuW39rHOtAcz5pG1cprtUxq+mtE5HgMeNhrd2w75cXMPvc4kBUl6/bbtrGZZ3x78q/7Vvtz5IymU4Qn7/KcOiy/2a0X/VImTybdOm5+HY+A5rxarCUV1q0hYNNfTwec1T+F5LvYQLqQkmkO+ZcDLZFSJljXwqljyZshz7tGbDo5OYY3PWZWFuDOuPbU+tWdpdZB7vzuQ7dBu7a8OyqDwW8A/ZiVDVVQqjCEmjC1z7DcIy0AR4Q69XX40dDZTTYW+Ea9TbiF572Yqfqy24nN
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(46966006)(186003)(34020700004)(356005)(478600001)(316002)(54906003)(8676002)(2616005)(426003)(6666004)(107886003)(2906002)(110136005)(4326008)(7696005)(86362001)(82310400003)(36860700001)(7636003)(5660300002)(70206006)(47076005)(36756003)(8936002)(26005)(336012)(83380400001)(82740400003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:32:10.3830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f65f2469-beae-45eb-07cc-08d8e7d84387
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2562
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

With commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module clock")
simple-card-utils can control MCLK clock for rate updates or enable/disable.
But this is breaking some platforms where it is expected that codec drivers
would actually handle the MCLK clock. One such example is following platform.
  - "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"

In above case codec, wm8904, is using internal PLL and configures sysclk
based on fixed MCLK input. In such cases it is expected that, required PLL
output or sysclk, is just passed via set_sysclk() callback and card driver
need not actually update MCLK rate. Instead, codec can take ownership of
this clock and do the necessary configuration.

So the original commit is reverted and codec driver for rt5659 is updated
to fix my board which has this codec.

Sameer Pujar (2):
  ASoC: simple-card-utils: Do not handle device clock
  ASoC: rt5659: Update MCLK rate in set_sysclk()

 sound/soc/codecs/rt5659.c             |  5 +++++
 sound/soc/generic/simple-card-utils.c | 13 +++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.7.4

