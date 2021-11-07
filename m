Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5345FC433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 22:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 279B461359
	for <linux-tegra@archiver.kernel.org>; Sun,  7 Nov 2021 22:45:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhKGWr7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 7 Nov 2021 17:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235853AbhKGWr6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 7 Nov 2021 17:47:58 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E53CC061570;
        Sun,  7 Nov 2021 14:45:15 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id l22so5248275lfg.7;
        Sun, 07 Nov 2021 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nKLBpn7FGCZZeZkeg4yyWEeinAGCnOMxXV56UTFOBS4=;
        b=Xq/JMX9Mm3gwhsTC4/pppefYLPxZ/81nUek6NZOo1sDQJgcHM2EFMoY3vUGw2g8UP7
         aLf/hhmp+3oJKwbQVf3fhVsa/o0qA4x5OuCcpT4NJXkyfkAnGlXK1WQaQDBcLDO+ghCJ
         VuufuRNkgM6g1onmcmNFzqnKd1On4APtGx+9fNu5NTPS8zeafTY443PSzEmfARD2AKE4
         63XTUVP4kEKuv7qd9ZIWk0qiaAIJdMqvsh0dmlgp6LrThtTZyVFkUywrUTrh2j1udnJL
         ckjfKj1iFIt+FJGKWLH/Rnc2yDGTQzuPBakXqfeEUevxXYSjU8deckGBGyljNznnKFhs
         VcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nKLBpn7FGCZZeZkeg4yyWEeinAGCnOMxXV56UTFOBS4=;
        b=SNSEwGP4VuvTX+iouJt5+g+EFzaA8qCiCe2vFYGKj6S3Jwujwg5L/JoeWVzzhlSAJo
         ny6C8NNE3Prywq1UyzgrXvKsxPRWS941HS+AjcP/I6qjaJ+U7yllh5/tqmCgHrGq+h0P
         IhWFZgnPTghPMNv3Ze0zEvS8loaYgG6377ySxoYTNd103oPznHb9brYOubESsetFDnc2
         IYOQxmBo+EOMaYDMyR3ie8A0s76hxI+Hw52iMNOTmKksWSLr0tI2+Nv0rjELXFJ5IIhv
         OgC0pXWHrXA7MoYm0a2p30LQN+kgrDDckHiHdThqX160AftaQsXChsnvR0r+P8An26iW
         gKhg==
X-Gm-Message-State: AOAM532M9B2Y11tauAcaolvnglGg3jqO2We7xnamLz/KafY6YR1EgckT
        XpljKGHY8+n/GRP4GUpa/+4=
X-Google-Smtp-Source: ABdhPJw/QEZz8Nj+O4m7+v1Thm1A5ZYbZ6nMY7BKDsDZHxoWuG2sVof+JsydkMnIieSHa/WVrCiLVQ==
X-Received: by 2002:a05:6512:1515:: with SMTP id bq21mr67688718lfb.71.1636325113581;
        Sun, 07 Nov 2021 14:45:13 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru. [79.139.188.96])
        by smtp.gmail.com with ESMTPSA id z17sm1414244ljk.97.2021.11.07.14.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 14:45:13 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3] usb: xhci: tegra: Check padctrl interrupt presence in device tree
Date:   Mon,  8 Nov 2021 01:44:55 +0300
Message-Id: <20211107224455.10359-1-digetx@gmail.com>
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
Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com> # T124 TK1
Tested-by: Thomas Graichen <thomas.graichen@gmail.com> # T124 Nyan Big
Tested-by: Thierry Reding <treding@nvidia.com> # Tegra CI
Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v3: - Renamed 'irq_arg' to 'args' and extended debug message, like was
      suggested by Thierry Reding.

    - Added t-b from Thomas Graichen and ack from Thierry Reding.

v2: - Use of_irq_parse_one() to check interrupt presence status in device-tree,
      instead of checking interrupt properties directly.

    - USB wakeup and runtime PM are kept disabled if interrupt is missing,
      instead of returning -EOPNOTSUPP from RPM-suspend callback.

    - Added debug message, telling about the missing interrupt.

 drivers/usb/host/xhci-tegra.c | 41 +++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 1bf494b649bd..c8af2cd2216d 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1400,6 +1400,7 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_xusb *tegra)
 
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
+	struct of_phandle_args args;
 	struct tegra_xusb *tegra;
 	struct device_node *np;
 	struct resource *regs;
@@ -1454,10 +1455,17 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
-	tegra->padctl_irq = of_irq_get(np, 0);
-	if (tegra->padctl_irq <= 0) {
-		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
-		goto put_padctl;
+	/* Older device-trees don't have padctrl interrupt */
+	err = of_irq_parse_one(np, 0, &args);
+	if (!err) {
+		tegra->padctl_irq = of_irq_get(np, 0);
+		if (tegra->padctl_irq <= 0) {
+			err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
+			goto put_padctl;
+		}
+	} else {
+		dev_dbg(&pdev->dev,
+			"%pOF is missing an interrupt, disabling PM support\n", np);
 	}
 
 	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
@@ -1696,11 +1704,15 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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
@@ -1718,13 +1730,16 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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
 
@@ -1772,7 +1787,9 @@ static int tegra_xusb_remove(struct platform_device *pdev)
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

