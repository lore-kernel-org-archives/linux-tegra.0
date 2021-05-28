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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D96C47087
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 061EE613F0
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhE1RbC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 May 2021 13:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbhE1RbB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 May 2021 13:31:01 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BBEC061574;
        Fri, 28 May 2021 10:29:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b12so6271037ljp.1;
        Fri, 28 May 2021 10:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xVuavUbxhP/h5ufdXkl/W8pz1JR/yQ3WYtl07Hx+SBA=;
        b=kpagjzp2mu3CvyZSFAME7GORlzJIh+kRw4YpHLavKXbOWACtvuvgCc14KPZZrXaVRQ
         Bsq6pTjqrmsP1L2a6dqnU5L401wUEiA9qc3Qx36SFoV1Tz/jSitgl5PReeJ7J03COqxc
         hh7J7NZ1Nf+U+E2djWSlHMEJglrWL36RN+1myexznFJnb3RbR37EEOD5cikci7DpzWof
         sMxiXD+EZtgGuZpskUb62DGQiCtLoWXgWlhhhnY+v5gJsJwwjEcnoWL2hIF+BcRdBCta
         EieFZh8+x19+SZp92kLOCuopT/z5jp1Q4IABZSKuyn4IHz16pnFNsDAeE9q4nSc3iG1/
         dffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xVuavUbxhP/h5ufdXkl/W8pz1JR/yQ3WYtl07Hx+SBA=;
        b=epOrrJsQGtkMAaMRnqkzCP2rlhPgtdrowPDLd6z2+DpcDJ2NLzSzzUQXeXeuHK4l5m
         2s7EKuhSXVmZIEJVsHEJ/r02yyBRIpaM/xFau4m1ijRZV4AFiGGMEPbbaUtizLpOWrZv
         QrWihy/j0bgHndI5wPiv8yp7JtVoJtgknmuGlEU/73zoz82xDV5BAGnarIe6WOWfdSxu
         fi8nHE18Q1YYax6raWj18QuPS0eGxRu/MFBvt7WEqubFqpdqN5qcwEDVHjDKLudNRdOI
         mZKDrGyRqySoQbzNQ3Z5fA5nK1du+HSIXholiBpvaYepz2Y1gSW1vfEhPI5SXN24a1qF
         1kzg==
X-Gm-Message-State: AOAM530U5SQTf3j+ij7cCSZzX4o6Od8S1sISRtULGoU83V5xuCWPru/p
        Uu8WZLO7ADlEF9veJ8AdjGI=
X-Google-Smtp-Source: ABdhPJxz43UM6YHkaP/+39cGAJ9l1LnZV5DO4HSCywv0XywCOG+hOWQ4/SrsjNPIvgyu2saBbzK5aw==
X-Received: by 2002:a2e:a58d:: with SMTP id m13mr7304867ljp.252.1622222964169;
        Fri, 28 May 2021 10:29:24 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id x207sm518282lff.234.2021.05.28.10.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 10:29:23 -0700 (PDT)
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
Subject: [PATCH v5 1/3] ASoC: tegra: Set driver_name=tegra for all machine drivers
Date:   Fri, 28 May 2021 20:28:31 +0300
Message-Id: <20210528172833.21622-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528172833.21622-1-digetx@gmail.com>
References: <20210528172833.21622-1-digetx@gmail.com>
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

