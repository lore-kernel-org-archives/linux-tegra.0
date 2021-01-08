Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DDEC4332B
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 14:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B660239ED
	for <linux-tegra@archiver.kernel.org>; Fri,  8 Jan 2021 14:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbhAHOAU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 8 Jan 2021 09:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbhAHOAP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 8 Jan 2021 09:00:15 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6308DC0612F6;
        Fri,  8 Jan 2021 05:59:35 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id d9so9825930iob.6;
        Fri, 08 Jan 2021 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v3YUKh3Pg+3HEmWFEzA6lV+W8xXHYJpJ+0Kz0Ylu/I0=;
        b=GOEfVOeF+iauU8s3f5xN+vySJJL75+qUxx13gPkp6BxYrf3ZpvDuz6iLgsQ+1qV84Y
         TtTnmu9ZLNEj9fSZsIHZeBF7IRDWzLvLoRurqNKGEJ2Ys1OVUt4zntLQYChpTuk/ZTmy
         lAXGAicWa/C9SFlDLPTWyNlMEm/xC1aKOhWguiaffn3r/eIe4vRr3aaAWUzMpUCa/qzl
         eDLd8Z3d1uGg5HnPbFIa7IIJxTrR5KISNk/hOKd206XMfSPFHaLdLKhC88FsNtOTQs7x
         qn/PK2LHIEMmjFm5mcRS5IBYY3rGX2Uxdom7V2KV4BEdclUtOEvMqx1laFL4vyDKAks8
         5TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v3YUKh3Pg+3HEmWFEzA6lV+W8xXHYJpJ+0Kz0Ylu/I0=;
        b=HmfSXR5kkIBVgF/e0N9Uj3Qdjem4+ng+3p92KRpiyTK6v7eJFDo8RqL7cTu6ifKrDI
         3ZqHarLnB/CYTEdNk8oaJtgmXV635XFo8Nyw/tzHPO4+k123oyfBGZk+V5nBmB0QB7PP
         rx5rfCqQX/I50F0iqrUSiNl6/SAghFHdWJMHTX8+w5w665QUpy8TBeTomobjK4JyI7ln
         3JifZ6QH7UuUEk97EpM2Wttxl/HcK5IteISUwam+7nPnm7cDTEHfgINXpU5WtCkZ8VGx
         GmmezEA2xMZIjsSKdDFvuY/L/5c0p7xlz/g5gyAkVHriCgeePIuwEn7wEUUwEP7rVfMc
         AZhw==
X-Gm-Message-State: AOAM532aLAUctS5WOAOkX21dV0wPlywkk2+x7JX1pCsuKVGYT0y4v8zt
        rnBa2wS2NYsKiezOxcDcZsQ=
X-Google-Smtp-Source: ABdhPJyq3vyCn6Be2+obp8pxMdElBtgDGBCoHR8SfzvmL/r/TeRvqDvxO4BZCcIetZoFLBvygFklHg==
X-Received: by 2002:a5d:8a1a:: with SMTP id w26mr5458680iod.112.1610114374783;
        Fri, 08 Jan 2021 05:59:34 -0800 (PST)
Received: from rockpro64.hsd1.md.comcast.net ([2601:153:900:7730::20])
        by smtp.gmail.com with ESMTPSA id l6sm7570063ili.78.2021.01.08.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 05:59:34 -0800 (PST)
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
Subject: [PATCH v2 2/2] ALSA: hda/tegra: fix tegra-hda on tegra30 soc
Date:   Fri,  8 Jan 2021 13:59:13 +0000
Message-Id: <20210108135913.2421585-3-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108135913.2421585-1-pgwipeout@gmail.com>
References: <20210108135913.2421585-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently hda on tegra30 fails to open a stream with an input/output error.

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

The tegra-hda device was introduced in tegra30 but only utilized in
tegra124 until recent chips. Tegra210/186 work only due to a hardware
change. For this reason it is unknown when this issue first manifested.
Discussions with the hardware team show this applies to all current tegra
chips. It has been resolved in the tegra234, which does not have hda
support at this time.

The explanation from the hardware team is this:
Below is the striping formula referenced from HD audio spec.
   { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }

The current issue is seen because Tegra HW has a problem with boundary
condition (= 8) for striping. The reason why it is not seen on
Tegra210/Tegra186 is because it uses max 2SDO lines. Max SDO lines is
read from GCAP register.

For the given stream (channels = 2, bps = 16);
ratio = (channels * bps) / NSDO = 32 / NSDO;

On Tegra30,      ratio = 32/4 = 8  (FAIL)
On Tegra210/186, ratio = 32/2 = 16 (PASS)
On Tegra194,     ratio = 32/4 = 8  (FAIL) ==> Earlier workaround was
applied for it

If Tegra210/186 is forced to use 4SDO, it fails there as well. So the
behavior is consistent across all these chips.

Applying the fix in [1] universally resolves this issue on tegra30-hda.
Tested on the Ouya game console and the tf201 tablet.

[1] commit 60019d8c650d ("ALSA: hda/tegra: workaround playback failure on
Tegra194")

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 70164d1428d4..361cf2041911 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -388,7 +388,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	 * in powers of 2, next available ratio is 16 which can be
 	 * used as a limiting factor here.
 	 */
-	if (of_device_is_compatible(np, "nvidia,tegra194-hda"))
+	if (of_device_is_compatible(np, "nvidia,tegra30-hda"))
 		chip->bus.core.sdo_limit = 16;
 
 	/* codec detection */
-- 
2.25.1

