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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AC2C4708E
	for <linux-tegra@archiver.kernel.org>; Sat, 29 May 2021 15:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCD84601FC
	for <linux-tegra@archiver.kernel.org>; Sat, 29 May 2021 15:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhE2Psq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 29 May 2021 11:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbhE2Psp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 29 May 2021 11:48:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771F9C061760;
        Sat, 29 May 2021 08:47:07 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i9so9819816lfe.13;
        Sat, 29 May 2021 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z2iUcTqe2R2Sbv5vYWTS2UijlDb+a9ygeGihNURh4Cg=;
        b=UcO71gX0qrG7TirsQESyzzd4kfv7uI1nIe6d6Hlb6ZPNofFQOQE2ltyr6HJpRXopyF
         AQJSFB368vAxyhBnGzbvLiXdRQbQckG8kZIcJ6V4VZGFX/C4B62Cj5RCPKHYEoGDRBk4
         MQB7NMInoyxVrbQ/QjwIBESNOOZdm1MsH6EES9v6mCYabCepX7aZQGPxe3KlezyMuOU2
         gAUvU0GDZ6cGalDjUNwmq8f97WGx09rK/iI0FaG4fD150NhqLzNS63uUqBux6+wCCqY5
         TbSxOinnxboK+ilSmdHqhs+X9K9/HWvUqluxv3zFlkd4Gtzn48K+Y1CMqbr248o7+Fvb
         /PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z2iUcTqe2R2Sbv5vYWTS2UijlDb+a9ygeGihNURh4Cg=;
        b=cjWZlHPEc6Pw18xZcYPZhDhA5BXhapcUvGhIIx6yjeWvMIplOPtijFpVzgDfzkIS2s
         hZBZAXCIaL+S7txjWKqWDlsGbU/WAQtdf6opQUZnniSX9jZ30ThN9ZBvTZf0eesoSFJP
         Lxn5PAFscEuKJzYrJJR/YPGOaP8Vt63pDiLXKQUaCPB/fB0IR9tvcA9u7wH7wNuRRmEe
         Y8YyOQocbZT1Cf/fR4OVioV8E7CdHGEPsFkVG8dzdzZm/2YEPfeIRvcwGg9A6VO3gQv2
         Fe8dnuvOdIhPaQXbeaAw0PQUU5jbwHpYUWJGjg59G/J2NyqcaTKofp5vO+8iSfZdNkDj
         i4aA==
X-Gm-Message-State: AOAM533Fig1BwSL/5ebESvNodVm9lYRr+o1CrfyKy4WRGZm7DFB9DmfY
        5IWtHfE9X8r5ddjA+jweZ7A=
X-Google-Smtp-Source: ABdhPJwBdY5IFjd6EWyKbO9bMfvDkr5gIBgUdSAkD0C8yx+E6VWo3GwlPn2PKw9ocP2f2e4begJXGQ==
X-Received: by 2002:a05:6512:3045:: with SMTP id b5mr9038966lfb.273.1622303225746;
        Sat, 29 May 2021 08:47:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-84-89.dynamic.spd-mgts.ru. [46.138.84.89])
        by smtp.gmail.com with ESMTPSA id y24sm764005lfg.232.2021.05.29.08.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 08:47:05 -0700 (PDT)
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
Subject: [PATCH v6 3/4] ASoC: tegra: Specify components string for each card
Date:   Sat, 29 May 2021 18:46:48 +0300
Message-Id: <20210529154649.25936-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529154649.25936-1-digetx@gmail.com>
References: <20210529154649.25936-1-digetx@gmail.com>
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
 sound/soc/tegra/tegra_asoc_machine.c | 7 +++++++
 sound/soc/tegra/tegra_wm8903.c       | 1 +
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index f052ad2a1f38..31ab7123945b 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -412,6 +412,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -444,6 +445,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -506,6 +508,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -548,6 +551,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -595,6 +599,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -628,6 +633,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -660,6 +666,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.components = "codec:rt5632",
 	.dai_link = &tegra_rt5632_dai,
 	.num_links = 1,
 	.fully_routed = true,
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

