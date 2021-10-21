Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74905C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 11:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B749610CB
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 11:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhJUL5u (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 07:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhJUL5s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 07:57:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4563EC06161C;
        Thu, 21 Oct 2021 04:55:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id g36so276740lfv.3;
        Thu, 21 Oct 2021 04:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V1jEJHNy1rpIMC1prko3vAzn6yRQlR45J0vSd88M0Wc=;
        b=XOMAHUJx0i/12kKJAXzxVziVwGKqGOSnAI1TsCe02UCieVeT5TKeDLmXlDLyDxpPdH
         SKeavDKLW8GV/KarRKogZt01hDZtJVr+ejkVRSCu+6iaDB4g8xLkW6ZVFM/DcDwO/J88
         WF2swpt7wLMziMbmB7NWpZvLgF3B+VDLcryOF6y5C019tMAI0P5bO7fKHwOytCZRivIy
         KJEkIeEwEjhufc6CwZEImW8gHgCgoMJ2fFE7Dgh58Nl8A8/MxNzSW21/Taho0QyVHcJZ
         K7zXlx5fYU9CBej/2QANlERqlDsUbcxt7bciF+I0GeV/Xt5SBWMOWvXZPnd4va5C7+/c
         qs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V1jEJHNy1rpIMC1prko3vAzn6yRQlR45J0vSd88M0Wc=;
        b=fmODIC4sIeGgfdmfVm+ewCLa0ujeEkiA+9MSDecxVXjhJciAe5DBalqdJ1MWfsPcQA
         Tof3xKPAVLVB/VTo9XhxeAAb1HVFjF1YaLiowTcJsC0A2iU8q9WayVg3+TBCmvbTFs0r
         XrYoJy44lQdHEAVGJDSuad26KkR2OG0HsdPfknTRLkq9F21MsewbLLlmG7MjmIGswtYH
         KB1mmCdH8BxSaWYrbgYQV+Ov11k2bzhqD9AgkV5jyJ/1vLGh81scBhlGbFIpw1xq3Aje
         jlHN84QqsmUKfqCo0ztaMeMGnnv3GAZWolm/fnUVHF6d8bVdrfP2H9a3HgWQGiNuvZiH
         H24w==
X-Gm-Message-State: AOAM532fK6WGR0XqZrW+Dl4cA3XT2J0LvY++EzXrI8BM6u8QtEd2aPb5
        vZN/Ej1BURcCTIWM/19Dbz5NHuKNCf0=
X-Google-Smtp-Source: ABdhPJyt3bxMyhH+ZwiH/BUspV4Vdc1aLduwGkpeVI69xJqU2kMcBQppVdxrb4d6Cw2tkqL31P37Bg==
X-Received: by 2002:ac2:5f06:: with SMTP id 6mr5065587lfq.516.1634817330659;
        Thu, 21 Oct 2021 04:55:30 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-10.dynamic.spd-mgts.ru. [94.29.39.10])
        by smtp.gmail.com with ESMTPSA id b30sm440565lfv.288.2021.10.21.04.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 04:55:30 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1] usb: xhci: tegra: Check padctrl interrupt presence in device tree
Date:   Thu, 21 Oct 2021 14:55:01 +0300
Message-Id: <20211021115501.14932-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Older device-trees don't specify padctrl interrupt and xhci-tegra driver
now fails to probe with -EINVAL using those device-trees. Check interrupt
presence and disallow runtime PM suspension if it's missing to fix the
trouble.

Fixes: 971ee247060d ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Reported-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 1bf494b649bd..47927a1df3dc 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1454,10 +1454,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_padctl;
 	}
 
-	tegra->padctl_irq = of_irq_get(np, 0);
-	if (tegra->padctl_irq <= 0) {
-		err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
-		goto put_padctl;
+	/* Older device-trees don't specify padctrl interrupt */
+	if (of_property_read_bool(np, "interrupts")) {
+		tegra->padctl_irq = of_irq_get(np, 0);
+		if (tegra->padctl_irq <= 0) {
+			err = (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
+			goto put_padctl;
+		}
 	}
 
 	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
@@ -1696,11 +1699,15 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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
@@ -2132,7 +2139,7 @@ static __maybe_unused int tegra_xusb_suspend(struct device *dev)
 		tegra->suspended = true;
 		pm_runtime_disable(dev);
 
-		if (device_may_wakeup(dev)) {
+		if (device_may_wakeup(dev) && tegra->padctl_irq) {
 			if (enable_irq_wake(tegra->padctl_irq))
 				dev_err(dev, "failed to enable padctl wakes\n");
 		}
@@ -2161,7 +2168,7 @@ static __maybe_unused int tegra_xusb_resume(struct device *dev)
 		return err;
 	}
 
-	if (device_may_wakeup(dev)) {
+	if (device_may_wakeup(dev) && tegra->padctl_irq) {
 		if (disable_irq_wake(tegra->padctl_irq))
 			dev_err(dev, "failed to disable padctl wakes\n");
 	}
@@ -2179,6 +2186,9 @@ static __maybe_unused int tegra_xusb_runtime_suspend(struct device *dev)
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int ret;
 
+	if (!tegra->padctl_irq)
+		return -EOPNOTSUPP;
+
 	synchronize_irq(tegra->mbox_irq);
 	mutex_lock(&tegra->lock);
 	ret = tegra_xusb_enter_elpg(tegra, true);
-- 
2.32.0

