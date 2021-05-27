Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2345AC4708B
	for <linux-tegra@archiver.kernel.org>; Thu, 27 May 2021 18:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1AED613D4
	for <linux-tegra@archiver.kernel.org>; Thu, 27 May 2021 18:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbhE0S5J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 May 2021 14:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235599AbhE0S5H (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 May 2021 14:57:07 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5ACFC061761;
        Thu, 27 May 2021 11:55:33 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 131so2199270ljj.3;
        Thu, 27 May 2021 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5c4GgBUi169adG89RpxfCaKSFuH1lGlp/e1vdo4dVbQ=;
        b=u0JaQadS2KD5i6ubeKLAsCOGL83jVab5h8Wentq/DU5SSnd/DCToBNeKxO2TZ+ENW2
         ZCbMezKpZ0j57pq+asjqtBELvUA1Jfxcu7mcJLggq21uYBe7RI0jf1+uUagzkfL+Zld1
         WZwWx2NwkP3QVoeQTKyLWjoCycspYbyPGdFtAcWS34eyDp50T+8CwMjCvPb7VX2MxGSk
         kZORXX002No7/tCBU0Gug585UHLc5Fj0tVgV5LHvcqFfO7oYA4CZUpB/wBP5amgNF5yY
         LEylcnWm4PeELy3maZR9Qb4A9tbBiWVX/1KCi/qof3BlH/P4EpLWGU6/ZeKa76xKlbSY
         gruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5c4GgBUi169adG89RpxfCaKSFuH1lGlp/e1vdo4dVbQ=;
        b=Z3rGpFvwzFyQkLSrvNZCEWofPWDJijRtARFBt4Aj7+jRFkFL4Gqz/v9iRxzrft7RSo
         laHLREsd40RmLFjDHSmG8p7Udww2WbjwiDEuMZxQ7qXkqMEr6xRTAyBPGpvsJVcVryki
         ++LZHa7BGIrefPuyw8Xty4DRWmwWwLG7Mz5/duTf310pCBt/qUAcdygLUDc9mDmKIAEU
         eBoW8v9zgQ3cAQREXEbSOQdo7TmNF8k8N1xYLkEqrGkTurpHtEiIOURMEqwspgox97Jy
         FuIEyU8fxyqNZYsPHM7XphjFMACIYMn0hML0Z97e/dPXFuM1gHr8C1Mpz5Y5xly/zAUZ
         lvLA==
X-Gm-Message-State: AOAM532UjS0MDUdRUU/yrRPUNG3UWqwqK4c7357GlgQUkgKZTxkhvclS
        WEIAOCQT/brxX3fteiszQv4=
X-Google-Smtp-Source: ABdhPJwqx1V1zw3mAosyyfQCWAC76ShrYIYJ55r8O8XoxOe2e0RtwuHu+njMQhip7guhaLP6z4YBHg==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr3611730ljk.107.1622141732103;
        Thu, 27 May 2021 11:55:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id p16sm265217lfc.113.2021.05.27.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 11:55:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] ASoC: tegra: Specify components string for each card
Date:   Thu, 27 May 2021 21:51:25 +0300
Message-Id: <20210527185125.18720-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210527185125.18720-1-digetx@gmail.com>
References: <20210527185125.18720-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify components string for each card of each supported device. It's
a free form string that describes audio hardware configuration. This
information is useful for ALSA UCM rules. It allows to generalize UCM
rules, potentially removing a need to add new UCM rule for each device.

Acked-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 9 +++++++++
 sound/soc/tegra/tegra_asoc_machine.h | 1 +
 sound/soc/tegra/tegra_wm8903.c       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index a28ee0d60992..1af70b0873ad 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -371,6 +371,8 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
+	if (asoc->components)
+		card->components = asoc->components;
 
 	if (!card->owner)
 		card->owner = THIS_MODULE;
@@ -406,6 +408,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -438,6 +441,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -499,6 +503,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -541,6 +546,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -588,6 +594,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -621,6 +628,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -653,6 +661,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
 	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index c60ac6c393a3..3b337baf132d 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -15,6 +15,7 @@ struct snd_soc_pcm_runtime;
 struct tegra_asoc_data {
 	unsigned int (*mclk_rate)(unsigned int srate);
 	struct snd_soc_card *card;
+	const char *components;
 	unsigned int mclk_id;
 	bool hp_jack_gpio_active_low;
 	bool add_common_dapm_widgets;
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 74101d2c7785..5751fb398c1a 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -129,6 +129,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
+	.components = "codec:wm8903",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
-- 
2.30.2

