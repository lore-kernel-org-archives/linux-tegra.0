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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB5FC43381
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631372313B
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 00:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729187AbhATAdV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 19:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbhATAct (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 19:32:49 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E930C061757;
        Tue, 19 Jan 2021 16:32:06 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m25so31709667lfc.11;
        Tue, 19 Jan 2021 16:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yicVcioy3NHi4/FpPSm/VNwWX+j3sMZfurtCccDfD1k=;
        b=UfwaWr1L5LewNfH5tPGaIPEpfDELXTNCv4RkE8uU1iidYd+RoXeDimeuJlRFEENNKQ
         F6sWmllixCA5G2TJgxrArNLfFblitYuiSi0YjLokri6ZDLWdE0zis1dJLbBlObtut/At
         AqqW/PB9g8B0ntIbN/ISB7OC0rQ+Y9cxrZoAL2FNQy4eQESHNdXE2fZV9oKzy+zfAW4s
         lCWAO8YKLwEzqBDOrFfGkGxLmd/7YFiFxNHN/MkZc2fcGgCy+6eqMyR3qhj4CYvtxEle
         1i3UIRktAl/uONze7wceTxDhxhOFMteIio0XsI8i06F2xlHgkfxau3scSk6EymrApnjP
         p0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yicVcioy3NHi4/FpPSm/VNwWX+j3sMZfurtCccDfD1k=;
        b=ASiZT4RrWj+q2p/zD2UQFnoClY9GLabXXf5lJExoO/0q5Ax5noDvUK01kRX0NQO8ur
         yKuOw9zRuThEyZfvEJHJSPTbjZJxKb/qk6oo5e8fHQu83axiaoHYjyHdC51WlwAZvC7u
         7YfXnZZC81Y6vdECZ9lxnbbEbUu5mwLwODDobS9n5h4id8q99O2piPej5LcT8pMM/Qkl
         iqHGB42uYbjs35JK3VSr2bN0zN5uero+mBEJvxKGguwb+6pXVDRLIDhCGU4CgnPZYzI+
         qjW0fpFdwcVSp3U3v2lnvAsr2ruTaw2crwP6+6R8cXr6KgjvaiyDbQ86PMEp09ibg6ra
         1Uog==
X-Gm-Message-State: AOAM533p+PtuzYZ2g2Uc1Q3FaUbtwsxHUcBtVfWGbAQ6x8bpQPT5CvTD
        AynY9vPEAAGvRxQzh/TDflM=
X-Google-Smtp-Source: ABdhPJxmTKVzbvYAflmcu14BOAbwwAuIv8vrnA2qcbWISAZZGdAxl4L/T1qztTNKxALT+c+i6M21cA==
X-Received: by 2002:a19:7109:: with SMTP id m9mr2833504lfc.351.1611102724843;
        Tue, 19 Jan 2021 16:32:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id s27sm17710ljd.25.2021.01.19.16.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:32:04 -0800 (PST)
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
Subject: [PATCH v3 2/6] ALSA: hda/tegra: Reset hardware
Date:   Wed, 20 Jan 2021 03:31:50 +0300
Message-Id: <20210120003154.26749-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reset hardware on RPM-resume in order to bring it into a predictable
state.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index a25bf7083c28..04dcd4cdfd9e 100644
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
 
+	if (!chip->running) {
+		rc = reset_control_assert(hda->reset);
+		if (rc)
+			return rc;
+	}
+
 	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
@@ -176,6 +184,12 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 		/* disable controller wake up event*/
 		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
 			   ~STATESTS_INT_MASK);
+	} else {
+		usleep_range(10, 100);
+
+		rc = reset_control_deassert(hda->reset);
+		if (rc)
+			return rc;
 	}
 
 	return 0;
@@ -441,6 +455,12 @@ static int hda_tegra_probe(struct platform_device *pdev)
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

