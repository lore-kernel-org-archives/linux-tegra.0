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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1192DC4708A
	for <linux-tegra@archiver.kernel.org>; Thu, 27 May 2021 18:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD649613ED
	for <linux-tegra@archiver.kernel.org>; Thu, 27 May 2021 18:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbhE0S5I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 May 2021 14:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbhE0S5G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 May 2021 14:57:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E40C061760;
        Thu, 27 May 2021 11:55:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id v5so2146683ljg.12;
        Thu, 27 May 2021 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xVuavUbxhP/h5ufdXkl/W8pz1JR/yQ3WYtl07Hx+SBA=;
        b=p5DeXpvwPW9QJaPjj/tPJ7mYi8WfpMSWFJPKYkEtkDJ4NEGGnxkCRvLRE7uCfry84E
         VgsVD47v0W8uiyQQ4jfulDsF6CZO3dvE8lrzOaecGHbdj/CMMovAY5KlGZRosB6AJFLi
         h4Yf+O5w85QMxAjGa3tmyTMtp7kpA+SvgUcBo9JXyIsr0yD5lD4PtHWGnoi1nAp/mUZP
         kFw83pveXeDSHiwczQ7H96tgtwfMMmA4RWAmRI/u/U9aBJM0ZaInqCzzXdtpUEcqwFE7
         Okb+EMgGh3scQ10L4WriElvFQxaRWfM6WHVZziYN16+ST8DozckyR4z2PkR664PCpbGY
         CgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xVuavUbxhP/h5ufdXkl/W8pz1JR/yQ3WYtl07Hx+SBA=;
        b=Phz1lCxuTW+9RIFDva98MbaaDxXaK1ElghRCDyuiPWlTTS1Qfe9PsPH6FC30miNY+S
         cank4dXAoKqFUqvXKFq/94EFMRjrqvlJvsyH5++BEKowYsOTA3bwk5Kt/ZViNlOt94jT
         YIrHlrnnkatnygVPkc24pTv7FUTWrJQ2bjkf7yGDcfN6auNNomekibapuCZhgMyXJtdW
         3TW9mKNAOR+/68SlFbSejHicCucTOHGnYx8OVKNl4dVp8gK9dJlzNQtN1AapaoewXlTJ
         5CWOCew2I7Uw7JwM5fxXlV48w1yimZjAZak4uPZtOsNjwtS7N3Nal+YL6X/7LKU6YJ29
         3YJQ==
X-Gm-Message-State: AOAM530WyJisWWCbyPdFt8Z1NHdRbAOJ8XiIKyHaqKlz3wsk8v1vD4bL
        u7dKtb9PXoEvGC+zSSVfHhk=
X-Google-Smtp-Source: ABdhPJwdSgyfG4fzwNOr8lCGV37cC/qX9vTxl3Bdspb0yaKhPNkYrWjPIGiVwfkv1ycAYhZnJT3doA==
X-Received: by 2002:a2e:501b:: with SMTP id e27mr3656167ljb.508.1622141730023;
        Thu, 27 May 2021 11:55:30 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id p16sm265217lfc.113.2021.05.27.11.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 11:55:29 -0700 (PDT)
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
Subject: [PATCH v4 1/3] ASoC: tegra: Set driver_name=tegra for all machine drivers
Date:   Thu, 27 May 2021 21:51:23 +0300
Message-Id: <20210527185125.18720-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210527185125.18720-1-digetx@gmail.com>
References: <20210527185125.18720-1-digetx@gmail.com>
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

