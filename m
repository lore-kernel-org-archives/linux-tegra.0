Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E96C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 21:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240322AbiBGVaT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 16:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbiBGVaT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 16:30:19 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B94C06173B
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 13:30:18 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id f18so321551lfj.12
        for <linux-tegra@vger.kernel.org>; Mon, 07 Feb 2022 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ta04whGTCnFU1H5shz/mko09ftNjeI/vAJqNZLbgbaE=;
        b=Pxypyx8Nucm9a3KD8J2kuxpg5JyU7vFtrbKVwX4Ia4VHk/Y+ebMkLUCQpyzXFLKf/R
         izApD1EhHF6qMoMIrnLTqFtXeqAHanvuTvxEMdqg87dApAgSdm9hHnD8FE3rN63t/onI
         51Vn6m4nVKpRkEW9u7qUSz7hItZgaLnqyGmWYpuPhCLqBdxJyF7t1JlsD3eXzdvkIyGJ
         zKUtfrvmsBarKyWAb782tuNA2pW/v38nXuf/TXNim+1Uu/d6mm+eLqiE0qcpAVfT7pkP
         +knNncueWv4iN70jK4/LU7cjgrNHufCkaecugiGC2Kgo4c7qHe64Qojix/b8lUG0hb+o
         LjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ta04whGTCnFU1H5shz/mko09ftNjeI/vAJqNZLbgbaE=;
        b=J1haqf9H7UiRe/OkdqCq2GNhk1rUWruXEyVz/Rw4NX71sB+JnRc+etXPHtozzJUBL3
         +eBUd/qS63q1VkxQsziueLNPXvl9HmjR+y8Yp919RDJpkS91IUxMdVjvMr1pB1fphQpP
         qIpsbBt5p0wqxFcJBqDMhHZsaGir2Zyn1+Obkn8Z2EEjNJgRMiyNbh8QqbSbC9DaSbog
         MVGXlPaTMhjN8V9tv1E1S0AJCVgwI71R5/zptOqF3u2SnCxfgIm+hg0H7L8kR5UKmjXU
         t9+ssk+x0+Kez4KYe495JfXq/sTrGovHTbn5+UtMu3iKP5RiB8QM+F3rhPEKlJgAPQLf
         KQOA==
X-Gm-Message-State: AOAM533f1Ql3YoNIMBlIFbtb7zCU0cPGzAgGt/WhA0lYAlzZMu4uM3xy
        tmX0Q225yB3tC+HsYlzblEI=
X-Google-Smtp-Source: ABdhPJw8TSqr9ot64AAqq4OKoJZEeGlULYp2r2hWK9l3l8dZV4lqQfJf4KG5KtmQrzHwu1iBRhQP9A==
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr979333lfo.164.1644269416616;
        Mon, 07 Feb 2022 13:30:16 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id y19sm1651246lfb.191.2022.02.07.13.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:30:16 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] drm/tegra: Use dev_err_probe()
Date:   Tue,  8 Feb 2022 00:29:23 +0300
Message-Id: <20220207212923.10386-1-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Replace dev_printk() with a generic dev_err_probe() helper which silences
noisy error messages about deferred probe and makes easy to debug failing
deferred probe by printing notification about the failure to KMSG in the
end of kernel booting process and by adding failing device and the reason
of deferred probe to devices_deferred of debugfs. This was proven to be
useful in the case of eDP driver regression by immediately showing why
display driver was failing when user asked for help, otherwise it would've
been much more difficult to debug such problems on a third party device
that doesn't have developer setup.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 13 +++----------
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++-------------------------
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index eb70eee8992a..9435c867c865 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3211,16 +3211,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return -ENXIO;
 
 	err = tegra_dc_rgb_probe(dc);
-	if (err < 0 && err != -ENODEV) {
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
-			   err);
-		return err;
-	}
+	if (err < 0 && err != -ENODEV)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to probe RGB output\n");
 
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 8845af5d325f..bf240767dad9 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1775,7 +1775,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	const char *level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1817,36 +1816,21 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
 	err = PTR_ERR_OR_ZERO(hdmi->hdmi);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get HDMI regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get HDMI regulator\n");
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
 	err = PTR_ERR_OR_ZERO(hdmi->pll);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get PLL regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get PLL regulator\n");
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
 	err = PTR_ERR_OR_ZERO(hdmi->vdd);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get VDD regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get VDD regulator\n");
 
 	hdmi->output.dev = &pdev->dev;
 
-- 
2.34.1

