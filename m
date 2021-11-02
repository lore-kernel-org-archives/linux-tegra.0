Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE67C433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Nov 2021 18:49:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0215A60720
	for <linux-tegra@archiver.kernel.org>; Tue,  2 Nov 2021 18:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhKBSvk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Nov 2021 14:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhKBSvk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Nov 2021 14:51:40 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7645FC061714;
        Tue,  2 Nov 2021 11:49:04 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id h11so36514971ljk.1;
        Tue, 02 Nov 2021 11:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ezRyMBIdL3Lvhy1+8wI9E48HPuzhR1oOrs4TVu6vc4=;
        b=JrrwETNoeg4AxZ9rBH5sxiHO/kIxNLxQh9t0PeFPa4nrrl0WKqVQ85Zk2YBDUbRCK1
         xCRoJG0uxWj+xq7z3V/sQbSl8u1WDG7O4Xa1hjaQeWJDWLhc2vuHTbkBVPxtWPORpwnc
         GBfGyeqnHwVd37RrPvOo0jKK4FD4AEt0ZdLFnLTLZz+DIA9iejoz+FG00N3ARNCQ5gTY
         WsmuL+l0uqcXSEKP/RAP/gG6Cw7/uyo9Ckp4l9PaK7U8U2nNo1Q68N360c/4EuzpD0VG
         a9qc28SvrdZ5QIsQWfSgKq9W0qn9Fv++HqOvhS/h2cWalv3EJli3CDkbTr8lOyLFsamQ
         OrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ezRyMBIdL3Lvhy1+8wI9E48HPuzhR1oOrs4TVu6vc4=;
        b=Uf8+dxzZbXhCC86RPETKTySBNm/qQ2vC07b2+EhTgy9Pz8tytkudu3AiFIv16OBPZ/
         zccsd0kg1bOPSCMsoIXqqadvFhbM1k2mCULNxL7T7eXTNCex0e7UB7pvF1QSxLQ7s9MA
         UloGEfhkelN0SP71dbmY4qsr3qSl4TPcncCnwOWyynJO93Q5hKS66t1jIxEtYBduGMCr
         yIe6AY7wd8t9f8LveJ9a+4qIichoWATs6NwsIGMamNdRSLd3jLnnFgrCDd38n710SCm5
         LgCAdDeX4lSnb89BDPlh4Bc3UHYgrATl40VU4VnUsQObdrfbNaMsNsdRFlZSnrRPyBRg
         C1Rg==
X-Gm-Message-State: AOAM533mrFFK6BcQYPhn41O7Mx0X6gwXMrykoXWXXsvVGVNFgQaP6sCV
        x++bjsYeiHrOomVCDbV1vX8=
X-Google-Smtp-Source: ABdhPJzFYCG6pItVftKEPz2jfS1bDIqqhXRn4ng/P6b2QOyhWgOaqahCYPBAyLL0wTBbiRX8E7tfFg==
X-Received: by 2002:a2e:86d5:: with SMTP id n21mr5282658ljj.102.1635878942833;
        Tue, 02 Nov 2021 11:49:02 -0700 (PDT)
Received: from localhost.localdomain (46-138-10-73.dynamic.spd-mgts.ru. [46.138.10.73])
        by smtp.gmail.com with ESMTPSA id t23sm151232ljc.120.2021.11.02.11.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 11:49:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2] usb: xhci: tegra: Check padctrl interrupt presence in device tree
Date:   Tue,  2 Nov 2021 21:48:01 +0300
Message-Id: <20211102184801.7229-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Older device-trees don't specify padctrl interrupt and xhci-tegra driver
now fails to probe with -EINVAL using those device-trees. Check interrupt
presence and keep runtime PM disabled if it's missing to fix the trouble.

Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Cc: <stable@vger.kernel.org> # 5.14+
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - Use of_irq_parse_one() to check interrupt presence status in device-tree,
      instead of checking interrupt properties directly.

    - USB wakeup and runtime PM are kept disabled if interrupt is missing,
      instead of returning -EOPNOTSUPP from RPM-suspend callback.

    - Added debug message, telling about the missing interrupt.

 drivers/usb/host/xhci-tegra.c | 40 ++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 1bf494b649bd..0a7ab596be85 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1400,6 +1400,7 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_xusb *tegra)
 
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
+	struct of_phandle_args irq_arg;
 	struct tegra_xusb *tegra;
 	struct device_node *np;
 	struct resource *regs;
@@ -1454,10 +1455,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
-	tegra->padctl_irq = of_irq_get(np, 0);
-	if (tegra->padctl_irq <= 0) {
-		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
-		goto put_padctl;
+	/* Older device-trees don't have padctrl interrupt */
+	err = of_irq_parse_one(np, 0, &irq_arg);
+	if (!err) {
+		tegra->padctl_irq = of_irq_get(np, 0);
+		if (tegra->padctl_irq <= 0) {
+			err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
+			goto put_padctl;
+		}
+	} else {
+		dev_dbg(&pdev->dev, "%pOF doesn't have interrupt\n", np);
 	}
 
 	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
@@ -1696,11 +1703,15 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto remove_usb3;
 	}
 
-	err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq, NULL, tegra_xusb_padctl_irq,
-					IRQF_ONESHOT, dev_name(&pdev->dev), tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
-		goto remove_usb3;
+	if (tegra->padctl_irq) {
+		err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq,
+						NULL, tegra_xusb_padctl_irq,
+						IRQF_ONESHOT, dev_name(&pdev->dev),
+						tegra);
+		if (err < 0) {
+			dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
+			goto remove_usb3;
+		}
 	}
 
 	err = tegra_xusb_enable_firmware_messages(tegra);
@@ -1718,13 +1729,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	/* Enable wake for both USB 2.0 and USB 3.0 roothubs */
 	device_init_wakeup(&tegra->hcd->self.root_hub->dev, true);
 	device_init_wakeup(&xhci->shared_hcd->self.root_hub->dev, true);
-	device_init_wakeup(tegra->dev, true);
 
 	pm_runtime_use_autosuspend(tegra->dev);
 	pm_runtime_set_autosuspend_delay(tegra->dev, 2000);
 	pm_runtime_mark_last_busy(tegra->dev);
 	pm_runtime_set_active(tegra->dev);
-	pm_runtime_enable(tegra->dev);
+
+	if (tegra->padctl_irq) {
+		device_init_wakeup(tegra->dev, true);
+		pm_runtime_enable(tegra->dev);
+	}
 
 	return 0;
 
@@ -1772,7 +1786,9 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
 
-	pm_runtime_disable(&pdev->dev);
+	if (tegra->padctl_irq)
+		pm_runtime_disable(&pdev->dev);
+
 	pm_runtime_put(&pdev->dev);
 
 	tegra_xusb_powergate_partitions(tegra);
-- 
2.33.1

