Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C403C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:43:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8254A61004
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 16:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239198AbhIMQoz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:44:55 -0400
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:40928
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238996AbhIMQou (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 12:44:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fajDTVL0CnzUXoRmCF6AQgrpye8ldDtA0Kd0sE+gYCGvqQsBccTWfo9lI41bSB6q7FcrGbeIQMDcijuyVIxjeYS9JR3zTmfJVnXXtcKtwVRWXX7MoDFu+8X+RWPa2+/atSEZSkvlsYQUoWmMty4d1F7jR87DKpKZ7YJRzvQLWy3CLYmNYwdHZ+A/dFrjsS3CbJJjukW5mnWYAeVqUOzELuqkYJyxQgeQwsLKNgLxAS9odW8QQWa+dCNb1XzCGtfgNsR7EgYWAUzBLh0pwFfBGuyKjms6JQq54/PBVfIRms5msO6qzgmYpxmAo3QyMd5QH0anS/wmB8YcS1AVpMf2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/47jp4yNlnvqpnVaca7ZsQGytr1vStKE+KV7rfaCDqQ=;
 b=RdETtEucow1KsR7puhlfs6DNOoQsSYFJZej086iZ0sMFgK00WUOl+JEaSR3t1m97iT0XhAFdc6Cg4zJ6AzdkCeqMhHDQLJheusMyfY1F6G1K4/GnGkIWSsl2iGEOV2dp/BhGuwO+ZdaD++0K9QfYQwrjnTFmG5PUs831/eDFbgfDBzOJ1nFdfQ+IWTA+N8/zPjflPTSZh+Y3CVEeqB8eKHzNetTJf64++xPc01QkRs7Qvo6vNraPom5GhQxXj6NWGIQmyziAi5MrY5e4E02fi6WCUjl7wN1qtQdNGoIC8b/QH5X5EUTTqOrc/mpCUypSID7/yDNe7D/hYmXouqJ2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/47jp4yNlnvqpnVaca7ZsQGytr1vStKE+KV7rfaCDqQ=;
 b=dk2OYZHpD87ZtYhFSK4204WyQB8CztAyuTTu/rKH7mTrj+FyC7zPalbD8Bc5GwQw/FBKeERdsSSuvy3lO7B8/R96Rf8YKFNUh0JxvotfsqZ0gKJlX5erxTeQlUlsY3MCgypzPvM0UgNKbWTKWKFb6b2Jop9uFDb1d0z+OcSauZR3diOCGqw77xAzb9Vu41XzgOadipljKqOnABEDJNnH8OdCxiJUJ6iM4A1k24K4rjWzgye71B9uQsIwtSg+XEUfUKGf4RmMvqWxS/jy+FvSe3ndNIaabLV6WcgWf1NkAfALy2XYmm/6YSpWW2ZLeUzTYHS/NZB3oZYAeqeZYYXoig==
Received: from DM5PR19CA0028.namprd19.prod.outlook.com (2603:10b6:3:9a::14) by
 PH0PR12MB5482.namprd12.prod.outlook.com (2603:10b6:510:ea::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Mon, 13 Sep 2021 16:43:32 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::2f) by DM5PR19CA0028.outlook.office365.com
 (2603:10b6:3:9a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:43:32 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 13 Sep
 2021 09:43:30 -0700
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 13 Sep 2021 16:43:27 +0000
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
Subject: [PATCH v2 11/13] arm64: defconfig: Enable few Tegra210 based AHUB drivers
Date:   Mon, 13 Sep 2021 22:12:19 +0530
Message-ID: <1631551342-25469-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
References: <1631551342-25469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a068c8b1-d654-43a5-d017-08d976d59f95
X-MS-TrafficTypeDiagnostic: PH0PR12MB5482:
X-Microsoft-Antispam-PRVS: <PH0PR12MB5482B4BDE2D440DFAFE279A8A7D99@PH0PR12MB5482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NJhZ37UFK4Uv2vFrh85zhgkxH226D71X0siEG5xgZeSp6kNiSYG3s8CumgoRIS6Xgbe6OoUYZDeda1zkAOwFEa9EhdTGtAVPf+MNNsQEAZCA8NXxXDYv4M3jOAJOGVJFtYJhg+95Be7tuctCU6m/eOrD2NS39NwFiAVPwaVNAco4Sq2TE+iBHZQhNHN8AisSo3PecA0oGI97fkVmKQhCUu2WcMqlco+ySJ6+hIo7LUWdovSGI/Jr1yAVOaodfV+8+Tx4ESzQgxvunk1XuPdflUX2dJp1YOJax4bD+w4MveiFrN+LVzDsptBFFBteWR9Yor/fSiSSEy9uYcDJFsmhVXBUbs5k+vUPXQMyQKoU0XFypXahHvFT46i9Tqb0mtkSLLsO/1+Enez9aSzQH2JRUcnQbPNAQo1QFuyN+STPddj4OlR4NBpW7cv8AalorDjzbsHFKtPR9ZCoCf/fI8Hchy/BEgEl5W4tk1cN2KF6Av4jiJprmQymnZxJoWREE92X+D6GWglSlMpZDgS0mQzxW1w5mBM9kB377N0lT9hFP3KqtXp2kbjGPQc4dfNZwlAkV206C/OeCWa1NbphLvCb5cvZ+H/CH5SmTI2A+58XU+LREcbaJyEUH/hObJwFQDQLnobLm+4qXlfelCADsGkpKlzl4jk9uyDCdkoqAZ75S96bvjYDlPHhnMJiqo2Ln87vpnEVVASlAFLwFE4+XxEayzmoM3ynIn6wGFb1RnfUabM=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(478600001)(356005)(7636003)(5660300002)(7696005)(47076005)(26005)(186003)(336012)(4744005)(921005)(36756003)(107886003)(82740400003)(8676002)(2906002)(54906003)(36860700001)(82310400003)(110136005)(316002)(70206006)(4326008)(8936002)(70586007)(7416002)(2616005)(86362001)(426003)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:43:32.6093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a068c8b1-d654-43a5-d017-08d976d59f95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5482
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable configs for following modules:
 * SFC (Sampling Frequency Converter)
 * MVC (Master Volume Control)
 * AMX (Audio Multiplexer)
 * ADX (Audio Demultiplexer)
 * Mixer

These configs are used on Tegra186 and later SoCs as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3bf6f8a..b936a238 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,11 @@ CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
+CONFIG_SND_SOC_TEGRA210_MVC=m
+CONFIG_SND_SOC_TEGRA210_SFC=m
+CONFIG_SND_SOC_TEGRA210_AMX=m
+CONFIG_SND_SOC_TEGRA210_ADX=m
+CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
-- 
2.7.4

