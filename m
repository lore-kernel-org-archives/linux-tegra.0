Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22B7C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 976DF61AA2
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 07:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243659AbhKRHLC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 02:11:02 -0500
Received: from mail-mw2nam10on2072.outbound.protection.outlook.com ([40.107.94.72]:41984
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243602AbhKRHKv (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 02:10:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQhqvjH+pHfLbcE1psca/MbAVe/srYTO1BVxvuMv3Gb4ENRAXT2r03+At3hudeJgqItX0OxUK6N+LH0z/j3IY5lmjrNNPk59lcNP7fUD8zZeuB3WcDXt9ZCnDJlh5LlhKYx/hTozRnQBTRrEldFi1t5587bzp/hAFCNRCjC8S6tEsYMwXKc0jHzZdgpS9RILEgWroKhaET0GqzDZfR29D1n3Dj1P0NQmjDBedKO91vU1FnU4y5fVmqTJHqU8Fu4T0dI9dh+nHoaj1iKOcXRWQZ5oUnnOuyr7HvNAP6lbIrSSj/Wa3DJJr2TTmP9GyTPY8fudKpgK/6n0ea2DJ/wmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEEKudTWKk0QtMJIDz95B23T25QBZWfOPG0xmcPBvOw=;
 b=YzZqO5BwxvTGw/3ieciHRMfF4/vUQxORd891w1RGHJq2LLXgubzb7db8+cIGCHHxypJLeb+DTYpjL/uTkvldKYuM66hu7aR0owbgwi8ShqM+Mc5F1ZYQU8bTeHLf9qAYLmUoSHlC9gc6u0meADKnLLMHI9ye4LFo8JXvAyQpR+AJzUmugtrl2FKey+kIKu3vQMUR/I1yR4V3zBLPEkCAoLUGwK32lIa3eW0PcCE2rZF1QzNTyz0LEWOxOLKCm8uS85vD05wven1kcpsLqsWK2yN7uT5mUk0PH2Zcw9Jqg1rcF+QqUKxLNJCmR+GgheJPym72Q7xSYdkuW4AF1IRnJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEEKudTWKk0QtMJIDz95B23T25QBZWfOPG0xmcPBvOw=;
 b=J4+3hiWSpoDvIH57L3LetMiE5R6HKw80n2ERNBkmSKbkfC89+ybqz6PfKLYgtUr8lZl0srJoQ9UG7ii5l85rodUT+peTlA55g5x3JSJfTBSwfQGDVsq2xRLfE5aKvOx8sZ+YxvsR094HAVtllvzGiwaWm7tWDZJGWewNqly8w8tUxWpC8APozIoaUBF18dJQfkn+3mYMZUHVnU9WEgCYB33A4giUBTZ/w0c0hWICcAERtH9AbJKeqUxo9D9SiRGY637V+NBB5afwxQQAjcevlXbXsOUuXtVCG3sO0SToQcCJ2kWFQ6Aj6MB/WkYL96Tp7Um8dBmoY1w7CZV5jN2TmQ==
Received: from BN0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:408:141::34)
 by DM6PR12MB3980.namprd12.prod.outlook.com (2603:10b6:5:1cc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:07:50 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::e) by BN0PR07CA0012.outlook.office365.com
 (2603:10b6:408:141::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:49 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:48 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:48 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:45 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
        <tiwai@suse.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 08/16] ASoC: tegra: Fix kcontrol put callback in I2S
Date:   Thu, 18 Nov 2021 12:37:03 +0530
Message-ID: <1637219231-406-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 914c3c62-fb88-414d-37de-08d9aa622192
X-MS-TrafficTypeDiagnostic: DM6PR12MB3980:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39808A33537152C827D12C20A79B9@DM6PR12MB3980.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBMsFnM/GaoUj+u4eidG64ObEQgibWNhODHVlbu0kjcHSZfAM2Xb4Noxdc3esj7ZNO5gsjoIuReuHRHTy3f+pG5sqLORrcln8s3HO2lt1W+xTseMiM2DrsoB8rwsXS230CDlI4qsJIy62Kpt++Ay4ucThcxL2sPHe8q96bA4tehvJSMlY8XZZy1FHRlv9vS/LoxT5H9Zic3bJ2hQd1108j4vRXHxglCASXkt2o74YXlvWR1wgH3Wxb77RqpPzAUoc21ersJEdoGp6HEOWX0kjPW8223sVELLdoss4DY8C20/1ph7UtVZ3RoKzpWIjb0Fsa4D9R0bTupAJ+MRqKF1mHk4m5i70l4iI9Vf6v+oXmXrKm//qvJ0rdbAaE3XxY1LWovwnWQ+lfMQv/tiYAsvllHWW5xSrnEok2orr6FkJAwb9C8Zjdv7Lyk8MDLW/nIysOW2moU5V7a18FcT7GnsxuivG3XDBA1MdjdEj33MaOxWka4AcI0zNG0mKtkfPf32HwNMO6x1WVBcyhUmQupLyQblKtHPA7jgYwCEcJc3k7THaPdS1lOsSYUw28HyJ6ajnqMzLYQ5HtP2e62r3I+oimG+Ez1hDWy2dZqK74b0wpAhtP3dRErtX4sftc2ykxqeg1UvWd4Kj0XW3pk7LN8z1Loo7U4/Pz3ObX+ypJ5jhEWJIcDiGcnygJj1yCQdHjnXWgSQJEcb8hZRFz8hKLF8nA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(26005)(7636003)(5660300002)(356005)(508600001)(47076005)(336012)(2616005)(186003)(82310400003)(426003)(30864003)(2906002)(86362001)(7696005)(70206006)(54906003)(70586007)(110136005)(36756003)(8936002)(8676002)(316002)(83380400001)(107886003)(6666004)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:49.4184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914c3c62-fb88-414d-37de-08d9aa622192
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3980
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Update
the I2S driver accordingly.

Fixes: c0bfa98349d1 ("ASoC: tegra: Add Tegra210 based I2S driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 302 ++++++++++++++++++++++++++++++-----------
 1 file changed, 226 insertions(+), 76 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 5c30461..9552bbb 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -302,91 +302,235 @@ static int tegra210_i2s_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int tegra210_i2s_set_dai_bclk_ratio(struct snd_soc_dai *dai,
-					   unsigned int ratio)
+static int tegra210_i2s_get_loopback(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
 {
-	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
-	i2s->bclk_ratio = ratio;
+	ucontrol->value.integer.value[0] = i2s->loopback;
 
 	return 0;
 }
 
-static int tegra210_i2s_get_control(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
+static int tegra210_i2s_put_loopback(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (value == i2s->loopback)
+		return 0;
+
+	i2s->loopback = value;
 
-	if (strstr(kcontrol->id.name, "Loopback"))
-		ucontrol->value.integer.value[0] = i2s->loopback;
-	else if (strstr(kcontrol->id.name, "FSYNC Width"))
-		ucontrol->value.integer.value[0] = i2s->fsync_width;
-	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
-		ucontrol->value.enumerated.item[0] =
-			i2s->stereo_to_mono[I2S_TX_PATH];
-	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
-		ucontrol->value.enumerated.item[0] =
-			i2s->mono_to_stereo[I2S_TX_PATH];
-	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
-		ucontrol->value.enumerated.item[0] =
-			i2s->stereo_to_mono[I2S_RX_PATH];
-	else if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
-		ucontrol->value.enumerated.item[0] =
-			i2s->mono_to_stereo[I2S_RX_PATH];
-	else if (strstr(kcontrol->id.name, "Playback FIFO Threshold"))
-		ucontrol->value.integer.value[0] = i2s->rx_fifo_th;
-	else if (strstr(kcontrol->id.name, "BCLK Ratio"))
-		ucontrol->value.integer.value[0] = i2s->bclk_ratio;
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL, I2S_CTRL_LPBK_MASK,
+			   i2s->loopback << I2S_CTRL_LPBK_SHIFT);
+
+	return 1;
+}
+
+static int tegra210_i2s_get_fsync_width(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+
+	ucontrol->value.integer.value[0] = i2s->fsync_width;
 
 	return 0;
 }
 
-static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
+static int tegra210_i2s_put_fsync_width(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (value == i2s->fsync_width)
+		return 0;
+
+	i2s->fsync_width = value;
+
+	/*
+	 * Frame sync width is used only for FSYNC modes and not
+	 * applicable for LRCK modes. Reset value for this field is "0",
+	 * which means the width is one bit clock wide.
+	 * The width requirement may depend on the codec and in such
+	 * cases mixer control is used to update custom values. A value
+	 * of "N" here means, width is "N + 1" bit clock wide.
+	 */
+	regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
+			   I2S_CTRL_FSYNC_WIDTH_MASK,
+			   i2s->fsync_width << I2S_FSYNC_WIDTH_SHIFT);
+
+	return 1;
+}
+
+static int tegra210_i2s_cget_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
 
-	if (strstr(kcontrol->id.name, "Loopback")) {
-		i2s->loopback = ucontrol->value.integer.value[0];
+	ucontrol->value.enumerated.item[0] = i2s->stereo_to_mono[I2S_TX_PATH];
 
-		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
-				   I2S_CTRL_LPBK_MASK,
-				   i2s->loopback << I2S_CTRL_LPBK_SHIFT);
+	return 0;
+}
 
-	} else if (strstr(kcontrol->id.name, "FSYNC Width")) {
-		/*
-		 * Frame sync width is used only for FSYNC modes and not
-		 * applicable for LRCK modes. Reset value for this field is "0",
-		 * which means the width is one bit clock wide.
-		 * The width requirement may depend on the codec and in such
-		 * cases mixer control is used to update custom values. A value
-		 * of "N" here means, width is "N + 1" bit clock wide.
-		 */
-		i2s->fsync_width = ucontrol->value.integer.value[0];
-
-		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
-				   I2S_CTRL_FSYNC_WIDTH_MASK,
-				   i2s->fsync_width << I2S_FSYNC_WIDTH_SHIFT);
-
-	} else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
-		i2s->stereo_to_mono[I2S_TX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	} else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
-		i2s->mono_to_stereo[I2S_TX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	} else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
-		i2s->stereo_to_mono[I2S_RX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	} else if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
-		i2s->mono_to_stereo[I2S_RX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	} else if (strstr(kcontrol->id.name, "Playback FIFO Threshold")) {
-		i2s->rx_fifo_th = ucontrol->value.integer.value[0];
-	} else if (strstr(kcontrol->id.name, "BCLK Ratio")) {
-		i2s->bclk_ratio = ucontrol->value.integer.value[0];
-	}
+static int tegra210_i2s_cput_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == i2s->stereo_to_mono[I2S_TX_PATH])
+		return 0;
+
+	i2s->stereo_to_mono[I2S_TX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_i2s_cget_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+
+	ucontrol->value.enumerated.item[0] = i2s->mono_to_stereo[I2S_TX_PATH];
+
+	return 0;
+}
+
+static int tegra210_i2s_cput_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == i2s->mono_to_stereo[I2S_TX_PATH])
+		return 0;
+
+	i2s->mono_to_stereo[I2S_TX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_i2s_pget_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+
+	ucontrol->value.enumerated.item[0] = i2s->stereo_to_mono[I2S_RX_PATH];
+
+	return 0;
+}
+
+static int tegra210_i2s_pput_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == i2s->stereo_to_mono[I2S_RX_PATH])
+		return 0;
+
+	i2s->stereo_to_mono[I2S_RX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_i2s_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+
+	ucontrol->value.enumerated.item[0] = i2s->mono_to_stereo[I2S_RX_PATH];
+
+	return 0;
+}
+
+static int tegra210_i2s_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == i2s->mono_to_stereo[I2S_RX_PATH])
+		return 0;
+
+	i2s->mono_to_stereo[I2S_RX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_i2s_pget_fifo_th(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+
+	ucontrol->value.integer.value[0] = i2s->rx_fifo_th;
+
+	return 0;
+}
+
+static int tegra210_i2s_pput_fifo_th(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (value == i2s->rx_fifo_th)
+		return 0;
+
+	i2s->rx_fifo_th = value;
+
+	return 1;
+}
+
+static int tegra210_i2s_get_bclk_ratio(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+
+	ucontrol->value.integer.value[0] = i2s->bclk_ratio;
+
+	return 0;
+}
+
+static int tegra210_i2s_put_bclk_ratio(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
+	int value = ucontrol->value.integer.value[0];
+
+	if (value == i2s->bclk_ratio)
+		return 0;
+
+	i2s->bclk_ratio = value;
+
+	return 1;
+}
+
+static int tegra210_i2s_set_dai_bclk_ratio(struct snd_soc_dai *dai,
+					   unsigned int ratio)
+{
+	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	i2s->bclk_ratio = ratio;
 
 	return 0;
 }
@@ -604,22 +748,28 @@ static const struct soc_enum tegra210_i2s_stereo_conv_enum =
 			tegra210_i2s_stereo_conv_text);
 
 static const struct snd_kcontrol_new tegra210_i2s_controls[] = {
-	SOC_SINGLE_EXT("Loopback", 0, 0, 1, 0, tegra210_i2s_get_control,
-		       tegra210_i2s_put_control),
-	SOC_SINGLE_EXT("FSYNC Width", 0, 0, 255, 0, tegra210_i2s_get_control,
-		       tegra210_i2s_put_control),
+	SOC_SINGLE_EXT("Loopback", 0, 0, 1, 0, tegra210_i2s_get_loopback,
+		       tegra210_i2s_put_loopback),
+	SOC_SINGLE_EXT("FSYNC Width", 0, 0, 255, 0,
+		       tegra210_i2s_get_fsync_width,
+		       tegra210_i2s_put_fsync_width),
 	SOC_ENUM_EXT("Capture Stereo To Mono", tegra210_i2s_stereo_conv_enum,
-		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+		     tegra210_i2s_cget_stereo_to_mono,
+		     tegra210_i2s_cput_stereo_to_mono),
 	SOC_ENUM_EXT("Capture Mono To Stereo", tegra210_i2s_mono_conv_enum,
-		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+		     tegra210_i2s_cget_mono_to_stereo,
+		     tegra210_i2s_cput_mono_to_stereo),
 	SOC_ENUM_EXT("Playback Stereo To Mono", tegra210_i2s_stereo_conv_enum,
-		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+		     tegra210_i2s_pget_mono_to_stereo,
+		     tegra210_i2s_pput_mono_to_stereo),
 	SOC_ENUM_EXT("Playback Mono To Stereo", tegra210_i2s_mono_conv_enum,
-		     tegra210_i2s_get_control, tegra210_i2s_put_control),
+		     tegra210_i2s_pget_stereo_to_mono,
+		     tegra210_i2s_pput_stereo_to_mono),
 	SOC_SINGLE_EXT("Playback FIFO Threshold", 0, 0, I2S_RX_FIFO_DEPTH - 1,
-		       0, tegra210_i2s_get_control, tegra210_i2s_put_control),
-	SOC_SINGLE_EXT("BCLK Ratio", 0, 0, INT_MAX, 0, tegra210_i2s_get_control,
-		       tegra210_i2s_put_control),
+		       0, tegra210_i2s_pget_fifo_th, tegra210_i2s_pput_fifo_th),
+	SOC_SINGLE_EXT("BCLK Ratio", 0, 0, INT_MAX, 0,
+		       tegra210_i2s_get_bclk_ratio,
+		       tegra210_i2s_put_bclk_ratio),
 };
 
 static const struct snd_soc_dapm_widget tegra210_i2s_widgets[] = {
-- 
2.7.4

