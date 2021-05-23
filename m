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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A84C47083
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5313E61152
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbhEWXqc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232070AbhEWXqb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:46:31 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351DCC06138B;
        Sun, 23 May 2021 16:45:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f30so1033594lfj.1;
        Sun, 23 May 2021 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C/YzaFVHHjWNgRf6nbKhMfyavNiyvMnhUpV/Qwaqx/s=;
        b=AogWYbp2571hXKwtIuF4bCZiBf3P0LLL8n/tk5gItLQkDYA1OMnqjybNK/f/UA/XmM
         V8BPFNu6wC6r545xqZ42lVU+1Ch7Y+AkeOterZrhXk053Xg0hHQzULJO5W5skYhJYGh9
         iEczqLo0ZyyGOw1V5QLoUUeTvNuVLM7h/vcUjbiW7VxAbPkfsfzGuJtAjryX+uYkZ8gS
         wShFf5vu/DzsxLazK2HF3y/hdEVKyh7UW51exsl30jDxghWfLAszc72H7lVxr6Bdolpx
         r2VwGo+mfehQmr01jWrffSV5ush0yDsZIi8V1fAs2ymDllggPFXozNua+VxcxEbCH6tf
         hmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C/YzaFVHHjWNgRf6nbKhMfyavNiyvMnhUpV/Qwaqx/s=;
        b=XwTXIULwi5kEUFcRZIBcfdQPhe9j+s0L9fqUWFj9UgL5GHiwpVvBypzvB8mPI2Axvc
         emTrzkbX4hshu+iZusbH7QuhOvMPwJ06n2PR1ShTDPq3gJBtOODsD4rCtXYBWh2I9LU+
         9WchwFye52EHABrSKM7BNfF1G3J5nqSK4Rs4u4RTMQ41UOdVGBn0fKCo9GmLjttdliSd
         1SEzTPpFBouYSZ3ZcmA6agcX19of17RHA7xUZJeceU+n2RubzmkPyIoVELArpo6kqphq
         KRQlc00lpUYgZDNpkLeH5vwmR3h9/NxY4DDGRyGWcqgYX8YC47Ut9fh7+H2JRwgCzVkN
         4nSQ==
X-Gm-Message-State: AOAM5339AUI2rwvTjENmJp8Vi+hfFIajLzpzCP3NxKA4iqpjVSDxraBh
        0aWtFxNQbZ4ojbPjpGm+R88=
X-Google-Smtp-Source: ABdhPJwYX7c2QidUiFvbyA6SfWUONiARQmi6QnR3vrM84BTIdW1DjUk+HWswv9Nf11lrcyqtTGrP6g==
X-Received: by 2002:a05:6512:3f28:: with SMTP id y40mr8881209lfa.136.1621813501584;
        Sun, 23 May 2021 16:45:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:45:01 -0700 (PDT)
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
Subject: [PATCH v3 3/4] ASoC: tegra: Specify components string for each card
Date:   Mon, 24 May 2021 02:44:36 +0300
Message-Id: <20210523234437.25077-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523234437.25077-1-digetx@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Specify components string for each card of each supported device. It's
a free form string that describes audio hardware configuration. This
information is useful for ALSA UCM rules. It allows to generalize UCM
rules, potentially removing a need to add new UCM rule for each device.

This patch also adds asoc->components hook that allows to specify
components description per device.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 9 +++++++++
 sound/soc/tegra/tegra_asoc_machine.h | 1 +
 sound/soc/tegra/tegra_wm8903.c       | 1 +
 3 files changed, 11 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 17579decceda..a81f2ebfc00c 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -399,6 +399,8 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 
 	if (asoc->add_common_snd_ops)
 		card->dai_link->ops = &tegra_machine_snd_ops;
+	if (asoc->components)
+		card->components = asoc->components;
 
 	if (!card->owner)
 		card->owner = THIS_MODULE;
@@ -434,6 +436,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -466,6 +469,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -527,6 +531,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -569,6 +574,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -616,6 +622,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -649,6 +656,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -681,6 +689,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
 	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index 080c1a26073a..fa325bfb2c8a 100644
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
index a3ec1f50bcb8..3f4f582fb02f 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -108,6 +108,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
+	.components = "codec:wm8903",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
-- 
2.30.2

