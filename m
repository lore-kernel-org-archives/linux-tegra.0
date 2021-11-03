Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB28CC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 13:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88CAB61051
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Nov 2021 13:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhKCNz0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Nov 2021 09:55:26 -0400
Received: from mail-bn1nam07on2051.outbound.protection.outlook.com ([40.107.212.51]:59399
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230472AbhKCNzW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Nov 2021 09:55:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOAgc5iki5Uic2xYYdBpJuBztMJQSzpApw1Qsd04+OxBmAwW1tCNTXP/CTnJqvuDzEJ3HZ0SgVGhHPnTYg4RVMe9SZVR5zpuOcFnA4p25F1sCvYupQGAF/57NthMeBROH6sndmxXwlRM4EuF5iJzm+u6h/pxYff9+G1K9u3QeeON2Z9Giq/fkk40U/m5WW99wlP1WnWZJHMSE8iZ/HkoKuSEz9UIJc9mvhoxRdMVkgTgblqCWTXV8imjFY4EqrN8ICoux1Mfa4C70hSke4Cfj7m4I63fwvYhA4sD83kUKDWtRDt7wFPm8mxDcVxZefH2M8AHzcj1HVM/of3MSDnkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxGpevw6OQacUXyZpIHtMKVu626NIMq+qRRpKEjImp4=;
 b=VDQCqIidhEVTujUXYPS4TADP9da493PDtTH4P3R1MXnu75hOIVL2pvFHxfecfrHL78InhkCIwyLzqu9ShUitMT/MrLo/aNlipCLfiemPjiZnMaMOPF5lRRsB3YPM7nRyMgDwvexfBV5s4D8fquPvn1l1oZ/3iSKLHRp5CQKZchbEJhCMyMRU1b46KJX96NScPivls1oN4NAvMHJq0PEwJbmppLy9WxMVL+XfwomqFD4NbXGooHYnwMhdbjbRZLx5Lyb7+gbQKoRqhgezYOD+KOzOqlSY8/9GyK3OPSI8foN9m0AZx2cvpWULAUtvZhMOxyY36njAP+Y1rVy/KdfOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxGpevw6OQacUXyZpIHtMKVu626NIMq+qRRpKEjImp4=;
 b=V/yVWA5DXnVo9tb4DERccGnx4JajRa5QiuLTl6WOX2SuOgxxxfQvfcxiHO+EpU6nzM4euJaPOS4RfrP8zaFWHR1p7+DH8KpkvcSQzLGvCY8E+DGdTNYY/pukFox1V8wFW2902sxcGCj+VClBOTDKh9TyIIb3L9LkndjBrjIvLkStXI9Ni4kmEP6q/wl7wAiHYRrFmOq9Fqr2X2gzPnI4so6YjWoEmIXrfq1EEeDBXYzequNUSnKz+RJZp+AUqAqYdkCVt5W4L3UyNnDYNhERihBmF+YeIKRQ5WRm1Cm92m0MwFVMTR6iydE1pOmkN0J91c5tMYobJwKsLHn14ylRbw==
Received: from BN9PR03CA0986.namprd03.prod.outlook.com (2603:10b6:408:109::31)
 by MWHPR12MB1728.namprd12.prod.outlook.com (2603:10b6:300:112::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 13:52:42 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::96) by BN9PR03CA0986.outlook.office365.com
 (2603:10b6:408:109::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:40 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:40 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:37 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 00/10] Fix kcontrol put callback in Tegra drivers
Date:   Wed, 3 Nov 2021 19:22:16 +0530
Message-ID: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2cb194c2-e96f-4b86-d1b4-08d99ed13429
X-MS-TrafficTypeDiagnostic: MWHPR12MB1728:
X-Microsoft-Antispam-PRVS: <MWHPR12MB17280A588B155348FE34DCA2A78C9@MWHPR12MB1728.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3TPVgStiv/oCSzfWc4rGZQjlcQQzYkbsYXGaiYMMPVMWOCTP/HKWbau86LX8E4hdQehlICwjjyxodxxUBZO0mOjJJRXNkTXrIUKF8RwUo0k9PZYx96hXNDaxgm27GsuQbY30Q6l7F/uFVLTxHubW2wbYPtcANVk4ZYcLf+xCq3S+irsbE7g/fJ3Vzik/at1+zqQwYyw90F+m8sPcMvcY1g6smPbxX+mnv6Z6Vy6y1yvNDbudMq69AMko0ibR6HCtJT1tsRIdgIRS0Qga/CfOU5IP7tfCx6cXRlOEj0Ul0qylu6Gqi8whDqPySUdnwRIXEcMmYKZSE6L/YeAO5iEYhPlYrdleNPPbGAp9tCOjTRGQNIVa4uH0lWkgsCfdrzCHyWXpGDcU5gEeRfIWrJszVk9TraqKzqw0YtMdwNilHvgeTRyUnpbX9BFhGvj1bHxDOljFFxFVk/QP1elKqjDUrQd4ok+SiZH5+S7CkBZRaps8fAq0VQ9MkVxq+/WwhWEsubbHg0QfJ7gM/aowgWMvs3nMPlmC6kCZhU9MCtL7X5EnkP3fE29d2bJw/oQ9T2eVzrCYQ6WrteRfqtkBGpl/e+1LqrXsgwpdfylIQdJIVi8XLueYKCVJjUkI1q24wrjUSTLanhHaywR4AHdm2cfW8gi5gkhh8UbDFvniqvOjyzfcuOoSQPTQK/jacULncch+mliJUmDKMJUme9k8K3wMqCRG9viCxOfANoFcqWcL3IPHXVMhwNk+am5pHcxcT6xmSUFwS02D2a9Z5d42uBOQTQ==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(316002)(83380400001)(2906002)(54906003)(7636003)(36906005)(6666004)(5660300002)(107886003)(110136005)(356005)(966005)(2616005)(26005)(47076005)(8676002)(36756003)(36860700001)(508600001)(4326008)(336012)(86362001)(426003)(70206006)(70586007)(8936002)(7696005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:40.8476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb194c2-e96f-4b86-d1b4-08d99ed13429
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1728
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series fixes kcontrol put callback in some of the Tegra drivers
which are used on platforms based on Tegra210 and later. The callback
is expected to return 1 whenever the HW update is done.

This idea is suggested by Jaroslav. Similar suggestion came from
Mark during review of series [0] and drivers under this were updated
to return 1, but missed to take care of duplicate updates. This series
updates all concerned drivers to return proper values and duplicate
updates are filtered out. I have added 'Suggested-by" tags accordingly.

[0] https://lore.kernel.org/linux-arm-kernel/20210913142307.GF4283@sirena.org.uk/



Changelog
=========
 v1->v2:
 -------
   * ADMAIF, I2S, DMIC and DSPK drivers updated to take care of
     duplicate updates.
   * Similarly new patches are added for AHUB, MVC, SFC, AMX, ADX
     and Mixer drivers.

Sameer Pujar (10):
  ASoC: tegra: Fix kcontrol put callback in ADMAIF
  ASoC: tegra: Fix kcontrol put callback in I2S
  ASoC: tegra: Fix kcontrol put callback in DMIC
  ASoC: tegra: Fix kcontrol put callback in DSPK
  ASoC: tegra: Fix kcontrol put callback in AHUB
  ASoC: tegra: Fix kcontrol put callback in MVC
  ASoC: tegra: Fix kcontrol put callback in SFC
  ASoC: tegra: Fix kcontrol put callback in AMX
  ASoC: tegra: Fix kcontrol put callback in ADX
  ASoC: tegra: Fix kcontrol put callback in Mixer

 sound/soc/tegra/tegra186_dspk.c   | 33 ++++++++++++++++++++++++++-------
 sound/soc/tegra/tegra210_admaif.c | 23 ++++++++++++++++++-----
 sound/soc/tegra/tegra210_adx.c    |  3 +++
 sound/soc/tegra/tegra210_ahub.c   | 11 +++++++----
 sound/soc/tegra/tegra210_amx.c    |  3 +++
 sound/soc/tegra/tegra210_dmic.c   | 35 +++++++++++++++++++++++++++--------
 sound/soc/tegra/tegra210_i2s.c    | 26 +++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_mixer.c  |  3 +++
 sound/soc/tegra/tegra210_mvc.c    | 18 ++++++++++++++++--
 sound/soc/tegra/tegra210_sfc.c    | 23 +++++++++++++++++------
 10 files changed, 145 insertions(+), 33 deletions(-)

-- 
2.7.4

