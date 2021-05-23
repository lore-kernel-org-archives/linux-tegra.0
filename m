Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504F1C47083
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2691561152
	for <linux-tegra@archiver.kernel.org>; Sun, 23 May 2021 23:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhEWXqb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 23 May 2021 19:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbhEWXqb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 23 May 2021 19:46:31 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3891C061574;
        Sun, 23 May 2021 16:45:01 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id i22so37866544lfl.10;
        Sun, 23 May 2021 16:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xVuavUbxhP/h5ufdXkl/W8pz1JR/yQ3WYtl07Hx+SBA=;
        b=FiNhKb7C+Fzp2BKv9q4Z0Sl16sEuxUtVhjivKNgx6P9coFik56+NT902uOn9jGxskH
         WSQ4Jpmf7NWawnXxnDzaTqhrqinmobYRzq+2kVx0yXaEBaUfUlhuYUtewNS9fHNywjLI
         MX47rSSSnNBVed2ne9hIaHm4CEj9tP79W5nwGKb9bkKNreT/JEstC+xXcFdziHOKhY0v
         jAyaWrFMG2KSWTDxmube7n2emqe6xOfY9z7mo2I3rBFGOJ1Jbtte0tlr4W/Zci6+VFKf
         lpJcoP0NRTKwRgl3DdSTyuK4i9LHYPq1msPwwtAd7J9sMHuXy1KSttzdHztKQAlM18ou
         EhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xVuavUbxhP/h5ufdXkl/W8pz1JR/yQ3WYtl07Hx+SBA=;
        b=gLPIvclA2H4O6dilYr31+ZDOzD6jg0m1ConiqwGa1o4Depuu/YrS96DD/rPJLt81Sc
         l6GUqYccpvSm4kkIjXehaXZLtrmT0BjWc6IzDh7KCrCn1CE5sHuVCtLZssrPP+iXsun+
         vZG8JpvbvnmY3GuvT5J0Ynop3TXuTJcjyC1c9PHBb0lllor6WzUizTkmnmSqpriaAqEj
         IoMJdXSHMM9t/B4w7mYxAOEIKjqirvSfAboqz16oYcvFVLXzJEF7je/XIkNPN4FyFUY/
         PMQXugEW1BO92tlReCh9mltsYcRaWcEfXTUU+yFzDofwcIACMqYh0NXeIQru0RNaCc+c
         dusw==
X-Gm-Message-State: AOAM533sSSIUTONKsMoWVM/SJW1AJMUlGhJlqt99GOmsTqpnfWMUdLd4
        jrJSivr5f63DAjFRsQ8y1rA=
X-Google-Smtp-Source: ABdhPJw27HQEsg5vivuUmrrHXm3FHoxSkRVzLf+016MTENSQbYaozAFMm7C64o3oBpHTdQBYPTl5Fw==
X-Received: by 2002:a05:6512:10cc:: with SMTP id k12mr2326606lfg.621.1621813500051;
        Sun, 23 May 2021 16:45:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru. [109.252.193.110])
        by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 16:44:59 -0700 (PDT)
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
Subject: [PATCH v3 1/4] ASoC: tegra: Set driver_name=tegra for all machine drivers
Date:   Mon, 24 May 2021 02:44:34 +0300
Message-Id: <20210523234437.25077-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523234437.25077-1-digetx@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver_name="tegra" is now required by the newer ALSA UCMs, otherwise
Tegra UCMs don't match by the path/name.

All Tegra machine drivers are specifying the card's name, but it has no
effect if model name is specified in the device-tree since it overrides
the card's name. We need to set the driver_name to "tegra" in order to
get a usable lookup path for the updated ALSA UCMs. The new UCM lookup
path has a form of driver_name/card_name.

The old lookup paths that are based on driver module name continue to
work as before. Note that UCM matching never worked for Tegra ASoC drivers
if they were compiled as built-in, this is fixed by supporting the new
naming scheme.

Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_alc5632.c  | 1 +
 sound/soc/tegra/tegra_max98090.c | 1 +
 sound/soc/tegra/tegra_rt5640.c   | 1 +
 sound/soc/tegra/tegra_rt5677.c   | 1 +
 sound/soc/tegra/tegra_sgtl5000.c | 1 +
 sound/soc/tegra/tegra_wm8753.c   | 1 +
 sound/soc/tegra/tegra_wm8903.c   | 1 +
 sound/soc/tegra/tegra_wm9712.c   | 1 +
 sound/soc/tegra/trimslice.c      | 1 +
 9 files changed, 9 insertions(+)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 0a0efd24e4b0..81ea6ceba689 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -139,6 +139,7 @@ static struct snd_soc_dai_link tegra_alc5632_dai = {
 
 static struct snd_soc_card snd_soc_tegra_alc5632 = {
 	.name = "tegra-alc5632",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_alc5632_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 00c19704057b..5a649810c0c8 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -182,6 +182,7 @@ static struct snd_soc_dai_link tegra_max98090_dai = {
 
 static struct snd_soc_card snd_soc_tegra_max98090 = {
 	.name = "tegra-max98090",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_max98090_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 9afba37a3b08..3344f16258be 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -132,6 +132,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
 	.name = "tegra-rt5640",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
index d30f8b6deda4..0f03e97d9355 100644
--- a/sound/soc/tegra/tegra_rt5677.c
+++ b/sound/soc/tegra/tegra_rt5677.c
@@ -175,6 +175,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
 	.name = "tegra-rt5677",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
index 885332170c77..ef6a553e0b7d 100644
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ b/sound/soc/tegra/tegra_sgtl5000.c
@@ -97,6 +97,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
 	.name = "tegra-sgtl5000",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
index efd793886689..27089077f2ea 100644
--- a/sound/soc/tegra/tegra_wm8753.c
+++ b/sound/soc/tegra/tegra_wm8753.c
@@ -101,6 +101,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
 	.name = "tegra-wm8753",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index e4863fa37b0c..f219c26d66a3 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -235,6 +235,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.name = "tegra-wm8903",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 4f09a178049d..c66da161c85a 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -54,6 +54,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
 	.name = "tegra-wm9712",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 6c1cc3d0ac33..cb4c8f72e4e6 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -94,6 +94,7 @@ static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 
 static struct snd_soc_card snd_soc_trimslice = {
 	.name = "tegra-trimslice",
+	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &trimslice_tlv320aic23_dai,
 	.num_links = 1,
-- 
2.30.2

