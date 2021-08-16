Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE25AC4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 21:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9842161052
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 21:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbhHPVPo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 17:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbhHPVPo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 17:15:44 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B7CC061764;
        Mon, 16 Aug 2021 14:15:12 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c4so5922827plh.7;
        Mon, 16 Aug 2021 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g1dC/n65USYYjusFSHlK9vgvBZI+Oht+fJhBix7TCeM=;
        b=t4xoxQNZT+ddH/5CyxnTOTAsIOrlFK0h8YIrmhdRIIzq6YqwuYzLmD42x5ufOdt2Kh
         Qjz+yojzhOH+R2Cqvujce8uwq4FQ4yKFuZZ4tWTqbh+Mzm6oOzk485L6ViKdzQRJrK8k
         vrcOIX6Vi10mJirmOboPGb1aJLkvwNJyPUjquLbdSyOy3w3e/0Sr/kIFfXhu6GFwBqGk
         B5knjVopEOwgh63nDkMMLz1TrLO+TgsXvnhcM9ZkxQtB7o4pM+A0Q04hKsvcNTLXD6Tr
         GKVEitBx67K+T66SO1CNCAm61aLGbE6ZsnI2HmOc8bhSzI26WuyNC6Dp/meCt06I+Wfn
         +FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g1dC/n65USYYjusFSHlK9vgvBZI+Oht+fJhBix7TCeM=;
        b=MAJ34ZXbK4QCx9sc0wEIv40qXsRXY1hucRIQ/blGwhJjMOuvUWMYpFXqYkRcJwNCMc
         wgZ+wEhcYfh9B+hM0WfNVf1Wt7K1+8SLeNXzgs8gBoRu1+JPexYjt9w7ipYhASMpzUMP
         rpk5X0tJFxGfEtYRni0PLMxLEuKhyqnaDKcUgMViVh4p7Eikd4XSALp+Fu5lmoDest7t
         DFyF4GxEy2niOc3rDSKxvvhqx5sUP0e6yFVu8HH+z1cRgCXyOzjtzdIOIA3toHYD6qzS
         u1krdYq5IrW1LrJKxoOS/DN8yHCQGlLTPmLGEnM/Ll5BLF7KMsNrqFM8VrKyOirdgel0
         PjHw==
X-Gm-Message-State: AOAM533Ha00Uaiqxwwiv5KKud1Q1MTgdRPELs/1ehFcfyL1yGTeGmsLa
        1yVdEmAieY9Ic6qhez5D5jE=
X-Google-Smtp-Source: ABdhPJxjLEm08f2XZOAIRQkKqH3kneBQs/5LROljNjO6HNA+l0EUm6jIrU0DDbEv3pH+REERz2pRUQ==
X-Received: by 2002:a17:90a:ee91:: with SMTP id i17mr605327pjz.67.1629148512230;
        Mon, 16 Aug 2021 14:15:12 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b12sm103154pff.63.2021.08.16.14.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:15:11 -0700 (PDT)
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: [PATCH 2/2] ASoC: tegra30: i2s: Fix incorrect usage of of_device_get_match_data
Date:   Tue, 17 Aug 2021 02:44:52 +0530
Message-Id: <4805c7fcd35c8deada63d41cb34d40de80f85a13.1629148177.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629148177.git.aakashhemadri123@gmail.com>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

const struct of_device_id incorrectly assigned "match->data" using
    of_device_get_match_data()

Instead assign `const struct tegra30_i2s_soc_data *soc_data` with
const void *of_device_get_match_data(...)

Fixes: 356b94a32a75 ("ASoC: tegra30: i2s: Use of_device_get_match_data")

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index d4c5594efaf1..084a533bf4f2 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -406,7 +406,7 @@ static const struct of_device_id tegra30_i2s_of_match[] = {
 static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 {
 	struct tegra30_i2s *i2s;
-	const struct of_device_id *match;
+	const struct tegra30_i2s_soc_data *soc_data;
 	u32 cif_ids[2];
 	void __iomem *regs;
 	int ret;
@@ -418,13 +418,13 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	match = of_device_get_match_data(&pdev->dev);
-	if (!match) {
+	soc_data = of_device_get_match_data(&pdev->dev);
+	if (!soc_data) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		ret = -ENODEV;
 		goto err;
 	}
-	i2s->soc_data = (struct tegra30_i2s_soc_data *)match->data;
+	i2s->soc_data = soc_data;
 
 	i2s->dai = tegra30_i2s_dai_template;
 	i2s->dai.name = dev_name(&pdev->dev);
-- 
2.32.0

