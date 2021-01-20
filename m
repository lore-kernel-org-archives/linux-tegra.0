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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E0CC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27DFD22D08
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbhATAc4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 19:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbhATAct (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 19:32:49 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AB6C0613C1;
        Tue, 19 Jan 2021 16:32:07 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id p13so24096924ljg.2;
        Tue, 19 Jan 2021 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8rBTMV7FjiQ0b57vNb8pEJGf3JqjCIY3wyHC8onGf2E=;
        b=J+dTeFs0G/gPtQBXzLmy9VAY3WYWQYtCnJwxVvcso1iLW+bjH8KoHJzTdOqBplAy4x
         QN/kvogo4QEwGJHC1X6TF8wF6T+268CND1QL2CjYoERr0heDSsL0YLVZ+zEXtoWOnzBu
         VcBaXAlPw94yzYf79lktexjCiqDS82VAk4pw6UG+jwThaPKklMYZdIyh+oIBlM2tK7/y
         rVaPa4z4hfNp9bTUQCmgik6/CgSLeucvh3RcHR7sDwR2OfC9EEsLKIUvawTC56FBWiVz
         TPq59qF+z+R7pRaG1BCQdGLQ2iO9khXGCh2OloBsdGSaaFZAU1qK3H9CSjykd/rFYrfQ
         5aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8rBTMV7FjiQ0b57vNb8pEJGf3JqjCIY3wyHC8onGf2E=;
        b=tfAOAzhPemtgs67nC+0Inh29aAh0oR1LAskSc2MC2IiFaHjMvkUqBP9GX6+2LTkhrV
         YNzMJUWkd20YDZNZU9SvJgC85JW4CpvyDwQGWux7jV/nZygxofCfgmsEmcOdeLrOSl0t
         BrRgyYoBPStaRCIEsw+ziErlKGXYZwWW5zCj5dOPlv7e4oTa5rubkrYiPrrPGPyN6S7T
         0jW5e+s5hRJlvrxB+J54iiH3uS7ipW2pYwD3m25xM6j69FwQGFIme8Ppk313N4FE56Cm
         gYgab5BGlVPPScZ4ZDe2+2I6hjtcF+2sgv36rilxARuYeeteht+S4/PvFRhUD6EG1Ufc
         OZKw==
X-Gm-Message-State: AOAM532nZ7BEmhBhNlqg4vlKG4jTDt5BUahiKHt2tzICdfEcqmt+gwvj
        S448LTMaAXKjnoDLRdRzD+54eUduKZ4=
X-Google-Smtp-Source: ABdhPJyYzq3WELdEjQx9P0zrMxgpxwEJcvLCdOapxWF0zilScuPvg7luG9e2xB8ENxkGhpqwlXDp2g==
X-Received: by 2002:a2e:bc28:: with SMTP id b40mr1742191ljf.167.1611102725701;
        Tue, 19 Jan 2021 16:32:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:32:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/6] ALSA: hda/tegra: Remove unnecessary null-check from hda_tegra_runtime_resume()
Date:   Wed, 20 Jan 2021 03:31:51 +0300
Message-Id: <20210120003154.26749-4-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The "chip" can't be NULL in hda_tegra_runtime_resume() because code would
crash otherwise. Let's remove the unnecessary check in order to clean up
code a tad.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Suggested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 04dcd4cdfd9e..6f2b743b9d75 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -178,7 +178,7 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
-	if (chip && chip->running) {
+	if (chip->running) {
 		hda_tegra_init(hda);
 		azx_init_chip(chip, 1);
 		/* disable controller wake up event*/
-- 
2.29.2

