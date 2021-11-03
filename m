Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AA3C4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 13:53:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B48136113E
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 13:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhKCNz5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 09:55:57 -0400
Received: from mail-bn8nam11on2078.outbound.protection.outlook.com ([40.107.236.78]:15393
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231643AbhKCNzr (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 09:55:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXtWUab2D/MAopXoWnHhtqMploUvyPfnyuwZv9W49sU2TwWz8/1Z2lx4UBmomkxA14Uh7M+QiOhQKamkGfFnDOi2ziSieECaMpMByQAfmbeqHJdLbeq8Dyja9RrVvgzANML2RxMdWU+mzd4XiK6yU8Lq1jIsa8YbJnismNccmwrHVmgLNEvlU+9akTSnH3ZEWX/XrPNHX6Ts975jFldSYUeCTdyYLei0eex1MfIHTYPDwn5p+SvEa+ChSAksOoy5PIp0jES2fdXaMTRwPAFDs64afSyZuxUukf7BBWnGK9xcuu3AxRw/Ie9zauuwehrrN2t6SZnOjAIEdaVB+YECWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ugxmlf/o55vAjvWrVe9GahbKf/lSIhQJpc3KN9DrvFo=;
 b=fJI8UmCOIylFLdyCJxaJUn18G3VFERksVtH8eYuLh/5hxmNiNhwJnZc42po+qt4GI7uC7MNyBHKRcCgUMvRiCEy3FVj90k2/p0izUytR4fHZ531+Mx4fIWMC8k4BSS1jILMqoRjawCIJuvSLSUAxRLavVbSwahri3vWa0Cc1jFhkzcKMCFeBzDNC00ZZ1jOIirrivzh8+TlbC3gWYv5YsV0hkWRkscG0VcyaQ1CHKF016q+pl22gC4bfQXw2nfAcp1G420yUYX0wAix0Q86JsAdXN0XIgpMaWHvaCoEhgAIG4EAUb3ZF/NZKBXCz03+3FNJ38ZAkGqbpnzQZN/xqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ugxmlf/o55vAjvWrVe9GahbKf/lSIhQJpc3KN9DrvFo=;
 b=YOgPzSTwDQgQpwk0zzjfgGt0dNSKIPborMyW2cEeN+YALVn66nvXpMebwIJH8WigDnwl9R3b5Amar+ZjPl8QHzX/9Iv+IU8cZknSGdwy4cSp5qaJJxpCooea4/TFT28k9XtxShXuuTrxYZzbeWg3Vekv/pvFWWegE6MDiGkEjGbY5n/1JVnD4pSUZPtzXicWDd2yN5R5FUxaI/Rep6HOz+nuyzFAykfaaDv8tEUrhCwFU9VLioEogM/jfL6LJ3y8Ir/iz+c3oFIN72zebCi7g+185yD2JJhmyeX23SHXyEQ69Xpinm0PN2x4DZ6NyKvWW2bakIzMcTRMZGT9yDNP1A==
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by BN6PR12MB1603.namprd12.prod.outlook.com (2603:10b6:405:b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 13:53:09 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::98) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Wed, 3 Nov 2021 13:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:53:08 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:53:06 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:53:04 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 09/10] ASoC: tegra: Fix kcontrol put callback in ADX
Date:   Wed, 3 Nov 2021 19:22:25 +0530
Message-ID: <1635947547-24391-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd8037d-cc78-4400-bd1a-08d99ed144a0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1603:
X-Microsoft-Antispam-PRVS: <BN6PR12MB16035740F96ADE4E051A6704A78C9@BN6PR12MB1603.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bb2iVKtwfTGLnB6apgKz7PARO9HDQpSWVug+Quq0CL/6e+s25kbYsvnuwkp8RKeGNkoY7fbTW2T3W5jTOznPIJlX1wfAYleVg5TvWGQxLmapdGABlS+kDCWgN0ctlJZ+x2hP8508HhTMORtoe94VukENvcF9+btrw2fw2UP4lyLRctLlJEdLlXokoQ94S+kkKwG1rH9pF6SWmIAb7Q+Nxx7P2/vdi5YCbrEvn9Wlve+D+/kck/NdPtpDrbN6GcJUZ17sfREJdlUK9iwMvymKy33kP0G8BqZ6gTrK8XJSJCC9Yuamn7Nyh2Rox8pxDcn5bYllDnSOpvnujSKc+WH51YJNbdxWiKtSLe6TCJO853EJqNJuOJLhWFmqwJtG6Y0gXnePX2p4DN197goJVOozLDsLNp51iaCI1LUcka/C4p+KVUSR74BJt7XD/E74wh6s8ihTaJogVHLpA8VUN6TGiFf2IkMERuL/my0tA9KrFWyfT8RRjVM8mQi6iYXTUJlCDQatJ7e3J0TQlTSBWu3JDoYbUmeQobkQIJT842wp8Kb8yusfH0bxMysNiBayAhhyhyBrS6D43B80Q7rkbvA94FdkaZe19Ufw/C/H6x/P9YMMGCExL05G21x0pReo3tFPw1tjYPi4kiBC1pRvCyFYxGMJ52oUR8dNWcWNr0egrz8URrFUVSbQdUcbzVhSA790Mc9Y7Cf213cKreu8ENbt/g==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(26005)(36756003)(316002)(70206006)(107886003)(36906005)(6666004)(36860700001)(5660300002)(2906002)(356005)(7636003)(8676002)(82310400003)(7696005)(186003)(8936002)(508600001)(54906003)(110136005)(336012)(426003)(2616005)(47076005)(4326008)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:53:08.4695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd8037d-cc78-4400-bd1a-08d99ed144a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1603
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Filter
out duplicate updates in ADX driver.

Fixes: a99ab6f395a9 ("ASoC: tegra: Add Tegra210 based ADX driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_adx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index d7c7849..933c450 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -193,6 +193,9 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;;
 
+	if (value == bytes_map[mc->reg])
+		return 0;
+
 	if (value >= 0 && value <= 255) {
 		/* update byte map and enable slot */
 		bytes_map[mc->reg] = value;
-- 
2.7.4

