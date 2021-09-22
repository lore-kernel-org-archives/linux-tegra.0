Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47461C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 20:54:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2611961181
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 20:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237744AbhIVU4Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Sep 2021 16:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233797AbhIVU4Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Sep 2021 16:56:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B985BC061574;
        Wed, 22 Sep 2021 13:54:45 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b15so16663451lfe.7;
        Wed, 22 Sep 2021 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3cZeXwR2k4hTcaH9mMdu8oiulnnc0/J5L3qGGtoXYkE=;
        b=VOX/1XqOVC0VuQxpTcgYxzURn2nBP/v5n9cHk5GMCHvurDdQ01yW8/eJiRqLD6Ywh5
         NMcyrqu9AmxXvcZ+ldCDbJGl1P0N+yk7IAUujRdexxJgXOd3giyPU4OQX3eACta8/ATD
         qcDMjQ1TZ/X6hpfLApbH/XjoZif4Whl7GSo90xHM7t4V1fRyyLWrV1/hj7/fJ/iIgCV3
         Ij4IkB/jdGyI+fZ84GPTFKNeKZLre3M/Nc8xBwSF9h5mJLKLrpoV6EI8nQy7miD4Tze4
         PitFWhftCmSCpylPet2EtuX/ebuUxdS/cUm37Y+AT6Es7N5RjRhwMwRoKUTxsWPxyDGh
         qMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3cZeXwR2k4hTcaH9mMdu8oiulnnc0/J5L3qGGtoXYkE=;
        b=oLGtR0ecnO411nr/v+Ag6g7nQVjYTpYUXNSHd1swckLU4hHwP4CHhs1+EgF6D7hVsS
         JHIfwhdOOi9NY8pq69tnW+qIE4IAbBHMwrDlXO5jx3byJPLBkdu28pS37eINm3thywEK
         PEoTlEZPI9/Wned56BKdwKtjmYl37piBMMkzxM/UZiT9LrQx/j94/+o0kZfe346UDuJf
         e4xYI1Pl+ppnzN1M9Wp7qqheuVLlWtHPtu7HRuboo2Lm6lKi50kLN+FwcnmX1h/EhkCM
         eG5lfqe1VHJh3XelQ3e3K+6h7Yfiz+jaYZfd5gCkdAxVvgWCKkcZRZfFUtU9WVk9QntA
         VE+A==
X-Gm-Message-State: AOAM533JF68sazKBHhRwpkHkeKYuTMQwhzR3qwIFS5Z0ulBdfosrEwSO
        vAZDG/WPVx12RDoz4W8LMQE=
X-Google-Smtp-Source: ABdhPJzFVQnTTYL1T8QNgYqC6+HYZ4LqvglqVxbOzzAWLXdF28v4QpsMsXlM+ycKlVC2jQYjif6Y0A==
X-Received: by 2002:a2e:5443:: with SMTP id y3mr1401240ljd.482.1632344084132;
        Wed, 22 Sep 2021 13:54:44 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id e24sm261883lfs.212.2021.09.22.13.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:54:43 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] ASoC: tegra: Constify static snd_soc_dai_ops structs
Date:   Wed, 22 Sep 2021 22:54:38 +0200
Message-Id: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The only usage of these is to assign their address to the ops field in
the snd_soc_dai_driver struct, which is a pointer to const. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/tegra/tegra210_adx.c   | 4 ++--
 sound/soc/tegra/tegra210_amx.c   | 4 ++--
 sound/soc/tegra/tegra210_mixer.c | 4 ++--
 sound/soc/tegra/tegra210_mvc.c   | 2 +-
 sound/soc/tegra/tegra210_sfc.c   | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 78d660447bb1..d7c7849c2f92 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -206,12 +206,12 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_soc_dai_ops tegra210_adx_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_adx_in_dai_ops = {
 	.hw_params	= tegra210_adx_in_hw_params,
 	.startup	= tegra210_adx_startup,
 };
 
-static struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 	.hw_params	= tegra210_adx_out_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 83176e1663ab..af9bddfc3120 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -241,12 +241,12 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_soc_dai_ops tegra210_amx_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_amx_out_dai_ops = {
 	.hw_params	= tegra210_amx_out_hw_params,
 	.startup	= tegra210_amx_startup,
 };
 
-static struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
 	.hw_params	= tegra210_amx_in_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 53fcd8f6605a..55e61776c565 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -283,11 +283,11 @@ static int tegra210_mixer_out_hw_params(struct snd_pcm_substream *substream,
 					    dai->id - TEGRA210_MIXER_RX_MAX);
 }
 
-static struct snd_soc_dai_ops tegra210_mixer_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_mixer_out_dai_ops = {
 	.hw_params	= tegra210_mixer_out_hw_params,
 };
 
-static struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
 	.hw_params	= tegra210_mixer_in_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 3646ce9b0fd1..7b9c7006e419 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -387,7 +387,7 @@ static int tegra210_mvc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_dai_ops tegra210_mvc_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_mvc_dai_ops = {
 	.hw_params	= tegra210_mvc_hw_params,
 };
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index 260dca6f6d25..dc477ee1b82c 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3287,12 +3287,12 @@ static int tegra210_sfc_put_control(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_soc_dai_ops tegra210_sfc_in_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_sfc_in_dai_ops = {
 	.hw_params	= tegra210_sfc_in_hw_params,
 	.startup	= tegra210_sfc_startup,
 };
 
-static struct snd_soc_dai_ops tegra210_sfc_out_dai_ops = {
+static const struct snd_soc_dai_ops tegra210_sfc_out_dai_ops = {
 	.hw_params	= tegra210_sfc_out_hw_params,
 };
 
-- 
2.33.0

