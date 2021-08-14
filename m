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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA2DC432BE
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Aug 2021 20:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7F7E60EAF
	for <linux-tegra@archiver.kernel.org>; Sat, 14 Aug 2021 20:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhHNUNJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 14 Aug 2021 16:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbhHNUNG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 14 Aug 2021 16:13:06 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59681C061764;
        Sat, 14 Aug 2021 13:12:37 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so21165115pjb.0;
        Sat, 14 Aug 2021 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lil9AoIO0pvXft/wgCoMRBl14pUNq2Bwl4VjQXc1qVI=;
        b=sVw7hCV8yRTqkPORb847X6o48bQC2n0dn45Eh7Lyqtd7a39t/SEH/EtoSSngFP82GN
         So162zopl0Mfj7ghGwdyPWKUnows5xRA/kDf5CHjikzrj1LwvaGtaO5hgmJ8LPri+Jas
         XWqJ25D+g6NCK+fpXa2ZML8Iw2F0W8825kuwgtwXZ7ymBhsNw3C/c79RqneE/yCvp1b2
         g1EOY1X70c+kZj+albuZp7XnUi8ODg0Qhd8EB2JT0Skz3ZvqGiDYW0WOwDrs01azprdA
         0NdvaOxSuaaWQaFy79GEurrwCVQ2p/k29esGGmSFr9629L3YSMWxGXsXQClRsaUgeVOL
         QCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lil9AoIO0pvXft/wgCoMRBl14pUNq2Bwl4VjQXc1qVI=;
        b=E2jFJc5zaULbZ6XHp2pchlMhsdrulw6rQdXjs0704v+AhxR2dSO4guwoG2ZUNEXddB
         MFMD0GuRaFA3jPWSVGtrU6zFJYPcv4ttJBpVnRoKVEaNzvb855FWvi3FpGGJSwK7vXvD
         kzpzA156PVaLlCU3FdROb58W+9GoJxzGtzNyjpZ40WLEailvHtphpGg3MTAAgyZRpkU3
         /XI30bIrslAhv1Apj51aoTQRLwa+IX+5tqB/XGDQUiCALDHFKyyvOaF+nopvGr0CSjkG
         ROGOu0j+tgibBveKh+gg2eTH4K/pRtkWyL1H5+UhL/QHwzFpTwOn2J3CFyIy7a8JC3Nv
         /bVA==
X-Gm-Message-State: AOAM5320iDP//cFP2BYhCfk3/+SUuHMgSMOxYxE27OgVvm0wBjbXAppq
        Ajly38UK2RTjU45bII9e660=
X-Google-Smtp-Source: ABdhPJxHkBe/kNjoFSqi6fNUoIZJHki5U4Q7eFa+ruFr7SX7NFjotH1BFbtYN4tQAkwqY/jIvhFAnQ==
X-Received: by 2002:a17:90b:395:: with SMTP id ga21mr8974448pjb.159.1628971956923;
        Sat, 14 Aug 2021 13:12:36 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id u6sm7309420pgr.3.2021.08.14.13.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Aug 2021 13:12:36 -0700 (PDT)
From:   Aakash Hemadri <aakashhemadri123@gmail.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>
Subject: [PATCH 2/2] ASoC: tegra30: i2s: Use of_device_get_match_data
Date:   Sun, 15 Aug 2021 01:42:19 +0530
Message-Id: <f4e632e0023d90c43b2b927e752585142a9d9c26.1628971397.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1628971397.git.aakashhemadri123@gmail.com>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Prefer `of_device_get_match_data` over `of_match_device`

Retrieve OF match data using `of_device_get_match_data`, this is cleaner
and better expresses intent.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 36344f0a64c1..d4c5594efaf1 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -418,7 +418,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
-	match = of_match_device(tegra30_i2s_of_match, &pdev->dev);
+	match = of_device_get_match_data(&pdev->dev);
 	if (!match) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		ret = -ENODEV;
-- 
2.32.0

