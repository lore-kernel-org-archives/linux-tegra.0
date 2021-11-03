Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19749C4332F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 05:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03388610E5
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 05:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhKCFIt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 01:08:49 -0400
Received: from mail-dm6nam10on2049.outbound.protection.outlook.com ([40.107.93.49]:48609
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231184AbhKCFIo (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 01:08:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZanBOCsSWHn6on8feXioCc2IUBN1kUKXL0bPq09JYQM81hLdnZTWofCY9lV7zRXpTwnwPZzH7cT7cWZ008jeW2xuBqzbtRdPib0+ZxX1Lk3g5m3xQEY2rvJaseZF8AUC07YvgMrowh7fusYVrv2JBV8/+sFndGV+kfbcySOoj9Mx+y49qv26wQ95CsbCEwXIIyU8QHEY8mUM+fgY1uVfSgsLU6VvP5SQY5N6OEoYbACA2rSiLxC5ecKHDqxA7FlwLalhCGk38CkzsepuzUc7lSzbtTB2Z0n4JTqUtc0nCyPqZ0ZIx4ptaKgh9zlaeLQxuftukOhK36A0ywMIMWsplA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv9qTG8Mk4JCkjZXIyqN+guo67FWeKDFErBSmO0HKNc=;
 b=cv/h0UwT2aaeU4WjHFIma0GrwPDaWD0+Qotyw04FW1o0YI9iJIGwzXFuTRtmKImultumWNkeDRpjQlFG2NgADVHPggMhdUZC6E4t9thNhIYRRjRYWgq5mwlfiLV+qTsP918eRmudefypk45Wv8rufTetqtGGDkOVFjGuvwbzffQJ9ZLgQf4oOGHhAfjS8sqFLeM0WypotWFdYCKs67qIHDqv9AogMuH30bFN8UaZEQorErS1K0r31zIwQpu9ubAy0IX/dYadx8/BilvS2jVETIWZByCrPmK2aPHtxJQnUr/5tahYQ7LM/12wlNNMv+4EbOgPtbU4BT17PE9YUHFXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lv9qTG8Mk4JCkjZXIyqN+guo67FWeKDFErBSmO0HKNc=;
 b=gsgcCjLqifFyuLFKY94uiw3/5AeI+RX8XCM6F4tdGONOTvX42E/hrtGRGT79hspbdgfYSVuxiozrRtwMgwF2IbCPpEnlg5fM6la9fO7q1iH7yrg5a/a79V/WpgA6eKoo5B7MGJB2bKs7hUnWnPP5e05AH9wuyZ3Y67+b7wM+UDhI09G2JvLRdNaa8gHWToVvKYwG26herP5kM1TcRkYRsGV8JoQwZmbSV7TU/k4teYakj5Zm8kgRWxu65mmoao558pATHv8dtYRqrhOwFsZrH3pj3Y6q483x0bYtZiU5mjDfbI7GwBRHbf7pt6QNy2CB7M8/s78BLCEOYYbyGd7zmQ==
Received: from DM6PR06CA0080.namprd06.prod.outlook.com (2603:10b6:5:336::13)
 by DM6PR12MB4976.namprd12.prod.outlook.com (2603:10b6:5:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 05:06:07 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::f4) by DM6PR06CA0080.outlook.office365.com
 (2603:10b6:5:336::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:06:00 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 05:05:58 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 3/4] ASoC: tegra: Fix kcontrol put callback in DMIC
Date:   Wed, 3 Nov 2021 10:34:56 +0530
Message-ID: <1635915897-32313-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aa8b012-a37a-44d4-17f4-08d99e87a45e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4976:
X-Microsoft-Antispam-PRVS: <DM6PR12MB49763D66DDF45F7445702D83A78C9@DM6PR12MB4976.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0WUvdoxzWrPpbKzSFW7TJavW2yQH3gSsKD20ZjdfqY4pUGYxMkEGwVJKKZWSZ7j1stfMr2PoA3gKXqyuvMAHSBYe9INJv+Z8odaOs+dGtd/aWoFH7tzP02b1Bis53oHDY99Kil8bS5JrIZGzo6wmVB2mZGnK0PY6vnrOV9m/vBPH6Y6YumfL5YsAxyeOuboSNwL/vUlk3XFYkj5k6l/0ukV+xruRI5f4nIqBNZ0tBE9/U+bV/5Hy8GvK6Db9MzJp8qzeYlNwk1kUo0pwOHjxrqMRt29YmdWmYhCGvvmYAnXHcjce2he3JggI3zuj4MpcVtD+r/uoKgKhWjPOZZ7SJFLtiMXXnMr/sScygyVuRSTeKWscTjuYDDfMj/adLTgMovM2DWhZfB42+936Iu+qHWdIQ7IcTsBs5WB3XiQBnRQf0RMPC0YTQ8YmQQ76DSKx28uYNQR+ouBKoohNiYjvB9XuHjdj5jkW7ictcUW7zQscl+4l+qOLm+1D7iWUVQQGNXvkQEZe6bieK9Ph+oVysuuZltW9KRuHkOKI25BvEGVr3gGacy2q9umT6QYHKU3ywE8CHK4pUmjLMRRzU14cQrDDzs7Cda+i3Lt3ps3moknrjMhaN3xbLX2tZleMESoqBfdxPGbnVPt7zpOhsDrugNDQJGX+qQ0Hit3ol6di2ldFykAy7V1wKel9BN8WQYIuXHdB57RNAEqUTfjKlC2AWg==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(336012)(4326008)(426003)(2906002)(36756003)(186003)(8936002)(36860700001)(26005)(107886003)(86362001)(82310400003)(7696005)(508600001)(70206006)(47076005)(54906003)(316002)(7636003)(2616005)(36906005)(5660300002)(356005)(83380400001)(8676002)(70586007)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:06.3620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa8b012-a37a-44d4-17f4-08d99e87a45e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4976
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the DMIC driver accordingly.

Fixes: 8c8ff982e9e2 ("ASoC: tegra: Add Tegra210 based DMIC driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_dmic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index b096478..133509f 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -197,8 +197,10 @@ static int tegra210_dmic_put_control(struct snd_kcontrol *kcontrol,
 		dmic->osr_val = value;
 	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
 		dmic->lrsel = value;
+	else
+		return 0;
 
-	return 0;
+	return 1;
 }
 
 static const struct snd_soc_dai_ops tegra210_dmic_dai_ops = {
-- 
2.7.4

