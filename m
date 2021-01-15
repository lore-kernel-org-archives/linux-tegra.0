Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A423CC433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76B64238E3
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 14:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732954AbhAOODC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 09:03:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbhAOOCr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 09:02:47 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023E1C0613D3;
        Fri, 15 Jan 2021 06:02:07 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id n8so1687261ljg.3;
        Fri, 15 Jan 2021 06:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AugsGgJqZ1BGVrmdxP2mTwl2YppbUHC2dM5EBDLuhDU=;
        b=IxNGpxLJ3m1M2ajO7Sje8u8SQld1M1P1+ZaI/Xsr1LmnLk2Nqt1EpCUbZK1RIQPrJW
         ksb9hj/PLf/vm0Qqo45QdeCPjv0WBJso39ru6vsSvFglRz7lwXsqJuuX8D2LcK2JyIn6
         sq+aHBYkkcLWMD/kpi+cScaLD59QR1brKUckuLke2Y8GvjJG2yd6V6H4pky+sXpmA4sK
         8nOiDvzQyV0Fgn0GuukuIGZgN0iH06+71ii7o1nPEqwAeDEpXKbfst0Rzr2MNz5YoYa5
         TNMEsOVtjkA5JijE+cunlCi6vV+hLg9Juiuv/yfMGhntTe6ONmOpvJwiVPprK8kcj2En
         9OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AugsGgJqZ1BGVrmdxP2mTwl2YppbUHC2dM5EBDLuhDU=;
        b=aeiZHW4TOcy2gZbDTrwwSXkkUMgIRGEV6OP2PC0FifbMQdgabBm9XNsgmhSbuiXhvl
         yfpHaXRUEU17+l1f1eb2VzB9/+D5D2GtQGBdZAQAOy6BX+DuvzW6u395YH4GPsxArkg9
         zHRzPo/VhfoUiRA4ivGinLsJmnOy5HSQ9J6+y681Hbs3QeXjCQfzBb6TErdYqbFjIJUt
         hy2rFKuUqxq600O0uWO+99BxbYTOfa0Hn9fl25B8vmX2bcJqzKVi5z8DMHuOSSMqkMUQ
         WL0Fz9CSZf8g1Ri5Rl6BcZt7BaW0ecIFpuEkkqqSseI+cxKbcP2DJWoxCIzmzg4OoslR
         ZLpA==
X-Gm-Message-State: AOAM533KgC4DEx6XA18CkKbE2Cx7egvFK7W4Tr3s+das6u28atkGRy8y
        vOPzU3VjUzQ0LABgBd5Mhiw=
X-Google-Smtp-Source: ABdhPJw36bp85tyShH9IZv6D27k2onC6FL7LnhG43lJklst0eAgRiXi+nIWQqrkwJw8FRJW6560yJg==
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr5415923ljq.312.1610719325486;
        Fri, 15 Jan 2021 06:02:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:02:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] ALSA: hda/tegra: Reset hardware
Date:   Fri, 15 Jan 2021 17:01:42 +0300
Message-Id: <20210115140145.10668-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
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
index a25bf7083c28..1467725e390d 100644
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

