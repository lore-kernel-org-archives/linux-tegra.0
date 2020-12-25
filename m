Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D66C43381
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Dec 2020 01:21:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D462722AED
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Dec 2020 01:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgLYBVn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Dec 2020 20:21:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbgLYBVk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Dec 2020 20:21:40 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5FAC061757;
        Thu, 24 Dec 2020 17:21:00 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id s6so1807030qvn.6;
        Thu, 24 Dec 2020 17:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZaO4eapAX6YcgJ1V86x/6Z20q4JeFpmENkNZ+Vh17YY=;
        b=VaT/v3w7fIQwr4+nVx3FsfDl6sKjC+xegP3RJ5aJvK2cB6iqn22/Dyc/o6WByT7IMX
         9J5q1AOse3dJO7cN+i2XYBmjnq+cksvabKySclkdaJbH4TMqOwjxPWvAkK95835uzpBk
         kbZ/CCKTXsIMvhyEcJTKJQIHIEdsitddgiaZ/qVCX1zBMIsOV1R7jrb3bT5tuIZO2rrD
         O2q/azdZcystt+XcuDNCoftIjo0y5/G4tqyVbcF6dpugV/TvbnZctQggiQMrzIuhZoV4
         BLOyT0Tsg2m+aYBYfSzuvrgjmV9M1l8ObtKZ6n4jyVejzpjwQdUuvgp6zZzW7TnSHyPc
         KhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZaO4eapAX6YcgJ1V86x/6Z20q4JeFpmENkNZ+Vh17YY=;
        b=VdfHAu/UR707NjVg3hQHXtsh3XW8h8708nt0kbzQo6zSxP5uDptx4p5OzLY4LvcYuJ
         8AUQDwKNYmYryj9BB9n7eQTRtdlJ12J2jZtR3Cod2DJ5k+bwP9E9QoW+CN9LWmLwI6i7
         zxnIkKE+FTL2Gpm2SA4Q4JnBVZfuHlA8VwomD4zgUMm0CxXC8nvIgQcgudzBH6Zkpjqj
         isMFCCwcHYPxjOhmxNOWVjEn5uwn876pkqJ81h3t8ZwvPyt8IbvQOc8elIDrVc/zfrLe
         DsU0TU3kV4Fa02zKBocLXUOB5d7gNCWxTBIvuc6L+hG8GdDTXduYjmm4p83rI6vb+aiS
         F1Vg==
X-Gm-Message-State: AOAM532Yi0J1Y87rKWYcAgwkgOfF8fzWcgdWZR32RuuV1u2ww9UnL2JV
        jcPZv3+mknQfLrusv5++8yA=
X-Google-Smtp-Source: ABdhPJyYpB3bNPAkvnqr+S9zrV/ifONY2HfJ9E0hXD7pAU/LgUB43e0WkZWZz0Pddacjq23iySU+TA==
X-Received: by 2002:a0c:ca13:: with SMTP id c19mr25994106qvk.21.1608859259481;
        Thu, 24 Dec 2020 17:20:59 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id x47sm17583505qtb.86.2020.12.24.17.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 17:20:59 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Subject: [PATCH 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
Date:   Fri, 25 Dec 2020 01:20:26 +0000
Message-Id: <20201225012025.507803-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225012025.507803-1-pgwipeout@gmail.com>
References: <20201225012025.507803-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently hda on tegra30 fails to open a stream with an input/output error.
This is similar to the issue referenced in [1].

For example:
speaker-test -Dhw:0,3 -c 2

speaker-test 1.2.2

Playback device is hw:0,3
Stream parameters are 48000Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 64 to 16384
Period size range from 32 to 8192
Using max buffer size 16384
Periods = 4
was set period_size = 4096
was set buffer_size = 16384
 0 - Front Left
Write error: -5,Input/output error
xrun_recovery failed: -5,Input/output error
Transfer failed: Input/output error

[1] states "Due to a legacy HW design problem", implying the issue applies to all previous tegra-hda devices.
The tegra-hda device was introduced in tegra30 but only utilized in tegra124 until now.
For this reason it is unknown when this issue first manifested.

Applying the fix in [1] universally resolves this issue on tegra30.
Tested on the Ouya game console and the tf201 tablet.

[1] 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on Tegra194")

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Ion Agorria <ion@agorria.com>
---
 sound/pci/hda/hda_tegra.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 70164d1428d4..f8d61e677a09 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -388,8 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	 * in powers of 2, next available ratio is 16 which can be
 	 * used as a limiting factor here.
 	 */
-	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
-		chip->bus.core.sdo_limit = 16;
+	chip->bus.core.sdo_limit = 16;
 
 	/* codec detection */
 	if (!bus->codec_mask) {
-- 
2.25.1

