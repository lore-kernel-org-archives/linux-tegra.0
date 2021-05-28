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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA16C47087
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD9AC613B4
	for <linux-tegra@archiver.kernel.org>; Fri, 28 May 2021 17:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhE1RbG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 May 2021 13:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhE1RbD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 May 2021 13:31:03 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6041C06174A;
        Fri, 28 May 2021 10:29:27 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f30so6440054lfj.1;
        Fri, 28 May 2021 10:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8PTBqF9bUZ29TAyNJcHkJi9b+wJ01dNiOO2rZosrHKI=;
        b=kKvUfGUyQj0Y4a45HhX/bwTlRBscj+LDu+wz1Fmq0n3JPyzgqSEEURNXBi9KJcgdO/
         9b+fg7cgjIbxjBeTGwiKUZc7yyAQ0Pyffi8asb7iL865qCnQZPJdDX2j3s0RzluaPSn8
         ovUTVxZzYxQaV+ZHp3rkuIEEhvfH6Lve2sNw3aP91TywP4yjYAKpiaENY8lS742/gFXG
         s0xpWsZH7v30/VJbNuRRJ1D/KxJGZNGVHK6a3Su1k8aW871P/XWWzy6JQYJkmiexY54t
         ygBfEBn00KBQSRQTQCSgNK2RS+7ORRz0ceYmnM61Q2Tq11Vj/0vP9ylXcAFB67kDJaTU
         K1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8PTBqF9bUZ29TAyNJcHkJi9b+wJ01dNiOO2rZosrHKI=;
        b=fO+dYqkY9/VVS4plabDSQdKrcNWo+b+e/iDelB08R0ZJb2eL3smTpYdzzXRabQMuCx
         lodRtIHD7wrshM5YnfLF7Oa3uhGNOAQfdPpDL4N6foXosaGfrf8DoHPo2h03FEoDBBYI
         Lksy6J5y4tWIEL7dq5ntSjMj72g3QNUaq3pvZ9Ek0A2XX2fT153CL4JjfcTaw9yIiCpC
         aS8PRRP4OaH6EjlDFkO89Ak1vRs8vsxigWsd9I2ZlIYJ2UuL0GY9vdAHG8vESE8+twle
         w+B6IQS01M/rNTI3fMoL3gVZwi3RK8SiZg9NCj87BrrQn3F5FxMchXZ5AqJVBXE+PI17
         yoDQ==
X-Gm-Message-State: AOAM53337ZBMJ0/6+jvIGVWe+d0kZcbXzT6yj5aFTLyl9LYxegI4X28x
        sklc0wd473rCK9rH+Uxl11XSUHoVjGo=
X-Google-Smtp-Source: ABdhPJxAxDmXB0O4YfFV8hLXuAN1wCO7q1ZbyRUb+4zd9T2gUi96a9lMRwkqBDY6/ITi6id59rXuJA==
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr4392360lfr.619.1622222966034;
        Fri, 28 May 2021 10:29:26 -0700 (PDT)
Received: from localhost.localdomain (46-138-12-55.dynamic.spd-mgts.ru. [46.138.12.55])
        by smtp.gmail.com with ESMTPSA id x207sm518282lff.234.2021.05.28.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 10:29:25 -0700 (PDT)
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
Subject: [PATCH v5 3/3] ASoC: tegra: Specify components string for each card
Date:   Fri, 28 May 2021 20:28:33 +0300
Message-Id: <20210528172833.21622-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528172833.21622-1-digetx@gmail.com>
References: <20210528172833.21622-1-digetx@gmail.com>
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
index b1fdd33cab17..33b5bb785da5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -406,6 +406,7 @@ static struct snd_soc_dai_link tegra_wm8753_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.components = "codec:wm8753",
 	.dai_link = &tegra_wm8753_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -438,6 +439,7 @@ static struct snd_soc_dai_link tegra_wm9712_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.components = "codec:wm9712",
 	.dai_link = &tegra_wm9712_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -499,6 +501,7 @@ static struct snd_soc_dai_link tegra_sgtl5000_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.components = "codec:sgtl5000",
 	.dai_link = &tegra_sgtl5000_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -541,6 +544,7 @@ static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.components = "codec:tlv320aic23",
 	.dai_link = &tegra_tlv320aic23_dai,
 	.num_links = 1,
 	.dapm_widgets = trimslice_dapm_widgets,
@@ -588,6 +592,7 @@ static struct snd_soc_dai_link tegra_rt5677_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.components = "codec:rt5677",
 	.dai_link = &tegra_rt5677_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -621,6 +626,7 @@ static struct snd_soc_dai_link tegra_rt5640_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.components = "codec:rt5640",
 	.dai_link = &tegra_rt5640_dai,
 	.num_links = 1,
 	.fully_routed = true,
@@ -653,6 +659,7 @@ static struct snd_soc_dai_link tegra_rt5632_dai = {
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

