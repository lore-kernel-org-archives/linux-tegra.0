Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F01BC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D4D161B7D
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243815AbhKRHMc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:12:32 -0500
Received: from mail-dm6nam10on2047.outbound.protection.outlook.com ([40.107.93.47]:24833
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243695AbhKRHLS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:11:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3/TrL1eVPKc7DcVBvNdrRA9A3KY1Q7f1y16N16K7avNi5ZAe4uxH31K4zSs/7tk9PSxCOVqBOcSuJCCIk5quI5mmELilb1drDxyZ2Hs1wYvPyAhejR45f11gfjEXnWoCdCB9DJ/8LRnhVSaKOoIKwGwLL7T9xk4zGkS6Cx351kgRrUsjPwGBt0G1Z7FzgOJbPA3Stk97xM7v24hfSMc47D99oDDB7HukKhply1lVe183Ah43ZWO6I1fqpvrqF+uKEo2eP5y4W7QR8kDoORqPz+CRZ15Qru6aqTs1qxsrGnUcQidVM4Np7KuD7ROiRftQKl+kmgJglB/kdgsmibHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MILkjcPVK1cJw0GpgLGNZUa1pPeCN+g+hdwQLaF2TE=;
 b=kEkkJTZa5WYLfhh5THR/Js83kZkgbODANZRwDN3LxYUJfzDEgy2m9dsTZ4aVaZObZXSPbk0cVidSp+3z9Dltu+K/q7XCuEufwhfuwSlqUd/qDLsoFSATkj/d5CqC0pKkZ2XWs8NK04zJIHXtehnGsADfWgA0tD64Tqf8VJXkS7mOZgMCMhLCzt7OGj/7/DMGslXlWNk0yhqwNvPorG/dJBvMM2oI91E57HdNg8N45MLAvL47gheWXV8ZdE7ZpIej/CVQRukqs564DnGzqkfHppF9Gk7PKhm5RZZK6/erFD4jD3W1FTGHAgGZtq2uu8whhbUOfAaqrZoA4Snzz5dmSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MILkjcPVK1cJw0GpgLGNZUa1pPeCN+g+hdwQLaF2TE=;
 b=aQmL9egdXVohZ5c+2wRxeIPJuCyWkBCybRInrG0cJYuVHG1ZRKXT3uArBRUdU7sI1dqQspePYAU9fCsv8CfOtvQTBL9ZZE8zVsssUbWKNfyP2PKGrS97ZW2p2O6S2jk9sZw0ATCQIb9hp9td4rvl9wVtvWoEiyseHnymGHAzL60g3zJLKs2KLARhl1RtL+HPnXStMTc9v4o8MRl70REZrj4lyqDlWCgm39+dwXjZWcWItb0vO9KtK5RPACUhcgENaRfcU0ifM6D0W7B+oB6c0sdTR3U4Fg2ZfdWGZif8k02v7mIc1fiNynY4sfVrIpfbG+7clZiPJaqSWmCtspDOQw==
Received: from MW4PR04CA0276.namprd04.prod.outlook.com (2603:10b6:303:89::11)
 by DM6PR12MB3148.namprd12.prod.outlook.com (2603:10b6:5:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:08:14 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::4b) by MW4PR04CA0276.outlook.office365.com
 (2603:10b6:303:89::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:08:12 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:11 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:09 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 16/16] ASoC: tegra: Fix kcontrol put callback in Mixer
Date:   Thu, 18 Nov 2021 12:37:11 +0530
Message-ID: <1637219231-406-17-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f613140-d815-452c-6dd7-08d9aa622f31
X-MS-TrafficTypeDiagnostic: DM6PR12MB3148:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3148305FFF454FCAA01C5738A79B9@DM6PR12MB3148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdFY90hmIzYuFiDWx8/bXSlF1ul0Lkn4fReDmJmeWTP2Sqy1Gk9aHT8+MO4kypMJskDhxCKfYT1agNlVvQCWG01qm9Z3E7fwU+6vDllOtMqKhBrbvru9QOI40N63jDWpQZ00TnkhIeJj2n6jxPZ4OeVimqFZFhFVsxyvuZEU02Lb5vH+K85oX8Ue6rAhlgy5yckk0Dz7DpN6iRJW4AAfkFxlaYYl+VWyieXv75sgIjLk4MmkUy0qDBrpG9oDr6MJRKB2RZmexSYmax2q+h9UHHX/wGvCotPVxZRTdDX1zscSxXN6N3+igzts655+uJN9aF41HejOYj3FrCWLSj4IiVQQbaObEqvQ6M5KK0162V6LlGdZzWtO9nmy8bW6Yi0+7wmHSztBqC/7fgjaZ318Bcn5BRlXYMhD9xjZ5RktZt8gbOn88ul18Qv1mJN/EfSkVooj9L29d8Coqszb3sDNTrcPQLn4J2GHuQkGw+c3bJAMqQSkmyh7g1OuOboNOCJl937POpQ9wtMhEZ/53zvHdsUi5eMBz6QCoUJOXqk+klDNjh3UtefRSsFzZhZdX0VqfOFcuHISgrRvghYJbEOQN5vr1E790twceKvhZjPhKgIVaE1xLt3RWfWXzxytoNWjxRpU7zbLOD7e1cVCtmauLI4KwMlDS0e3TG5vgIwy2pAHGC8AcfHVhEvl4CXy/uaXlIA5JSYuwX4Wjboqy91cDQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7636003)(83380400001)(26005)(7696005)(82310400003)(70586007)(5660300002)(2616005)(6666004)(8676002)(186003)(356005)(70206006)(4326008)(316002)(36756003)(107886003)(8936002)(47076005)(508600001)(2906002)(426003)(336012)(36906005)(36860700001)(86362001)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:08:12.3921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f613140-d815-452c-6dd7-08d9aa622f31
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3148
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Filter
out duplicate updates in Mixer driver.

Fixes: 05bb3d5ec64a ("ASoC: tegra: Add Tegra210 based Mixer driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_mixer.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 55e6177..51d3755 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -192,24 +192,24 @@ static int tegra210_mixer_get_gain(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int tegra210_mixer_put_gain(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
+static int tegra210_mixer_apply_gain(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol,
+				     bool instant_gain)
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_mixer *mixer = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int reg = mc->reg, id;
-	bool instant_gain = false;
 	int err;
 
-	if (strstr(kcontrol->id.name, "Instant Gain Volume"))
-		instant_gain = true;
-
 	/* Save gain value for specific MIXER input */
 	id = (reg - TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_0) /
 	     TEGRA210_MIXER_GAIN_CFG_RAM_ADDR_STRIDE;
 
+	if (mixer->gain_value[id] == ucontrol->value.integer.value[0])
+		return 0;
+
 	mixer->gain_value[id] = ucontrol->value.integer.value[0];
 
 	err = tegra210_mixer_configure_gain(cmpnt, id, instant_gain);
@@ -221,6 +221,18 @@ static int tegra210_mixer_put_gain(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+static int tegra210_mixer_put_gain(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	return tegra210_mixer_apply_gain(kcontrol, ucontrol, false);
+}
+
+static int tegra210_mixer_put_instant_gain(struct snd_kcontrol *kcontrol,
+					   struct snd_ctl_elem_value *ucontrol)
+{
+	return tegra210_mixer_apply_gain(kcontrol, ucontrol, true);
+}
+
 static int tegra210_mixer_set_audio_cif(struct tegra210_mixer *mixer,
 					struct snd_pcm_hw_params *params,
 					unsigned int reg,
@@ -388,7 +400,7 @@ ADDER_CTRL_DECL(adder5, TEGRA210_MIXER_TX5_ADDER_CONFIG);
 	SOC_SINGLE_EXT("RX" #id " Instant Gain Volume",		\
 		       MIXER_GAIN_CFG_RAM_ADDR((id) - 1), 0,	\
 		       0x20000, 0, tegra210_mixer_get_gain,	\
-		       tegra210_mixer_put_gain),
+		       tegra210_mixer_put_instant_gain),
 
 /* Volume controls for all MIXER inputs */
 static const struct snd_kcontrol_new tegra210_mixer_gain_ctls[] = {
-- 
2.7.4

