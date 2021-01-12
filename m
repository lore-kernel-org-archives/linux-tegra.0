Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCC9C43333
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3B542311B
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390668AbhALNAG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 08:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbhALNAF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 08:00:05 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E3AC061794;
        Tue, 12 Jan 2021 04:59:24 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x20so3171095lfe.12;
        Tue, 12 Jan 2021 04:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lg8D+6k5px/5X05zXz+RxGeDF297I8gzkoxsJjGQbFo=;
        b=H368JGk7iitiesfWx27XMaxrW3JztEyAntacKIDIzEvx4fBR2dR3M9bQ4t3j5plvCF
         G3euq9OBw5FVVxBx5VeX8I5FjyR935xO8+LJLWPfwfIFcNwYnhSMOjUyiICyuFbWOiIn
         dIhW/zSJmJQNN6c64J/oWNUQjpafNa77LEABfVtI1ijhOhCD8V0wB9tFISPZSo9APbrJ
         LhJMBYbRDfq0+BDsNcpxfYL8B/ecivFdq/UHD/e5JOthDmm6yhiM8EvHX8PJ6VPQnFAa
         Fmkr5DM6ZrD2VfmmPbz0hLLWoKhLawAKiv0MwgNNOoUF9i8NmBUkljQd0On7pU2NVYBG
         VWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lg8D+6k5px/5X05zXz+RxGeDF297I8gzkoxsJjGQbFo=;
        b=ArzxKNE/7ElI+THrBkSm4A98APmYZSf662FkOd6/S0irjy+kAKtdDAnsiuizpfsQeJ
         zFvtHJEnst9hqgMdFHafpm3AHhVq90+FWnBcY3Cvn0jNPTq6UiZj8rC+lB4534ReYxMp
         lqNu29IHuhrW4LVecCzMPAXTIYx4iLaTMC0NGp5P3/14K2b17SYGw+C6BKPU0mkozfbm
         L0Ngg5Epx1MjI69pc5OYND7VHRi1F4v9BiYIefmoOy/o4FNR5/AlS3j2u2QLNPbawOG3
         x7Z/t/7ikwvJqKRoShp3oklNODiTmSds8AosVZHtIM9cKTDz2mjH1EvUE/LdK0m6rYpw
         TxoA==
X-Gm-Message-State: AOAM530e5Q06GYDyxXp/HcfxCQfyi9lOGW6D1f8YDEI5bRl0pPWPaKf4
        rFrCd4lWnae01j/ELxZ7Tx8=
X-Google-Smtp-Source: ABdhPJxuONy2OXLST4ArDFBkn4J6Yegat6lHb2aCHoJzj6SLlnQmMD6UEqiQLnFGX7uycRMM3Jqphw==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr2242856lfd.584.1610456363250;
        Tue, 12 Jan 2021 04:59:23 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 04:59:22 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] ALSA: hda/tegra: Reset hardware
Date:   Tue, 12 Jan 2021 15:58:31 +0300
Message-Id: <20210112125834.21545-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reset hardware in order to bring it into a predictable state.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 4c799661c2f6..e406b7980f31 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -17,6 +17,7 @@
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <linux/string.h>
@@ -70,6 +71,7 @@
 struct hda_tegra {
 	struct azx chip;
 	struct device *dev;
+	struct reset_control *reset;
 	struct clk_bulk_data clocks[3];
 	unsigned int nclocks;
 	void __iomem *regs;
@@ -167,6 +169,12 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 	int rc;
 
+	if (!(chip && chip->running)) {
+		rc = reset_control_assert(hda->reset);
+		if (rc)
+			return rc;
+	}
+
 	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
@@ -176,6 +184,10 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 		/* disable controller wake up event*/
 		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
 			   ~STATESTS_INT_MASK);
+	} else {
+		rc = reset_control_reset(hda->reset);
+		if (rc)
+			return rc;
 	}
 
 	return 0;
@@ -441,6 +453,12 @@ static int hda_tegra_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	hda->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(hda->reset)) {
+		err = PTR_ERR(hda->reset);
+		goto out_free;
+	}
+
 	hda->clocks[hda->nclocks++].id = "hda";
 	hda->clocks[hda->nclocks++].id = "hda2hdmi";
 	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
-- 
2.29.2

