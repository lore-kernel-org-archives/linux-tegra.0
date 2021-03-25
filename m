Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBBBC433EC
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7381161A2B
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhCYQl7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhCYQlj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:39 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489E9C06174A;
        Thu, 25 Mar 2021 09:41:39 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g25so1574215wmh.0;
        Thu, 25 Mar 2021 09:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Q+j1GqCZFi4+qQgCx0LC4bT27WTzGH7CBTvodsUZHM=;
        b=ojuuu4gBe1k4o/+sr7yukFJHJbsZy5104xR/oYR0V5NV1T6SaK+NHj+bW+gYOlQXUL
         Y8W56frzfTLS9IyE8nVpfmKxlqSN3D+EIrP0DF8vxd9rnB8qDT12H9yLIEOekpdAKJxv
         38cccd5Eucn488MnG5YoI7ET86x3TPypbMDaklHU3gTFyPGdAyKVpq+209NEP2s2sfQU
         1agzxCTrdqKcPG9pweyrKJd5eud2Fsgdgl4c+KJ9tlsg9i4dYLNZCiYeiiC/gieNkw6f
         b1Y1yNa/IOwiprMx3B5nc2vKm7zWqY/U66KhRU5EGzELO8EmF8gy6TFe5Lg07qu7+80v
         CzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Q+j1GqCZFi4+qQgCx0LC4bT27WTzGH7CBTvodsUZHM=;
        b=dbTArbJRbQEfHQt6G4Sz4yHccmESECIuxOBtBzQMuVOidor9i3eEvaA9nk7oXc//qP
         mfdrvVMpOfqa5kwbiYBt24T2VSA0Yl7soIHIDckH5m/RjUeg9aYP4EQESBFp0nT1NWbr
         8EHJjbl6yuHhICJZuQ5fwbEp5a/87fVeq6yQtyp3Vw1rYOpE8lpNe8Esl28dHTK3QubN
         ahd89OHxXwXGtZ4L8rqkeZbvt8sn3j6FrWbACFG/WXNhkkWi8AygvN9M3VSEUU4y9dbc
         06Dwc782Ffcc9Ie3ZBIA1+MGqdgAhh9zH9gcvIbzr02Ba0v14v+ixlC04JNiUPgfx1QB
         w9Cg==
X-Gm-Message-State: AOAM533PwfINWMV5rN64EYHnGejK4ZFjMx6GFYIZF7IgTKikX16Is6fw
        hDnmxyd9635Yq5RKwvSDXgg=
X-Google-Smtp-Source: ABdhPJwoDL4en4zYpNM492n/Dxi+3ot61NbBHPTlye3ZpuB2n9TQsemYo/A31qPhpAwZ820G66g1bw==
X-Received: by 2002:a1c:f406:: with SMTP id z6mr9130449wma.24.1616690497885;
        Thu, 25 Mar 2021 09:41:37 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g15sm6440468wmq.31.2021.03.25.09.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:41:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 13/13] xhci: tegra: Enable ELPG for runtime/system PM
Date:   Thu, 25 Mar 2021 17:40:57 +0100
Message-Id: <20210325164057.793954-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

This commit implements the complete programming sequence for ELPG
entry and exit.

 1. At ELPG entry, invokes tegra_xusb_padctl_enable_phy_sleepwalk()
    and tegra_xusb_padctl_enable_phy_wake() to configure XUSB PADCTL
    sleepwalk and wake detection circuits to maintain USB lines level
    and respond to wake events (wake-on-connect, wake-on-disconnect,
    device-initiated-wake).

 2. At ELPG exit, invokes tegra_xusb_padctl_disable_phy_sleepwalk()
    and tegra_xusb_padctl_disable_phy_wake() to disarm sleepwalk and
    wake detection circuits.

At runtime suspend, XUSB host controller can enter ELPG to reduce
power consumption. When XUSB PADCTL wake detection circuit detects
a wake event, an interrupt will be raised. xhci-tegra driver then
will invoke pm_runtime_resume() for xhci-tegra.

Runtime resume could also be triggered by protocol drivers, this is
the host-initiated-wake event. At runtime resume, xhci-tegra driver
brings XUSB host controller out of ELPG to handle the wake events.

The same ELPG enter/exit procedure will be performed for system
suspend/resume path so USB devices can remain connected across SC7.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 407 ++++++++++++++++++++++++++++++----
 1 file changed, 370 insertions(+), 37 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5b39a739f8f0..ce97ff054c68 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -15,9 +15,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/phy/tegra/xusb.h>
 #include <linux/platform_device.h>
+#include <linux/usb/ch9.h>
 #include <linux/pm.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -224,6 +226,7 @@ struct tegra_xusb {
 
 	int xhci_irq;
 	int mbox_irq;
+	int padctl_irq;
 
 	void __iomem *ipfs_base;
 	void __iomem *fpci_base;
@@ -269,6 +272,7 @@ struct tegra_xusb {
 		dma_addr_t phys;
 	} fw;
 
+	bool suspended;
 	struct tegra_xusb_context context;
 };
 
@@ -665,6 +669,9 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 
 	mutex_lock(&tegra->lock);
 
+	if (pm_runtime_suspended(tegra->dev) || tegra->suspended)
+		goto out;
+
 	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
 	tegra_xusb_mbox_unpack(&msg, value);
 
@@ -678,6 +685,7 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 
 	tegra_xusb_mbox_handle(tegra, &msg);
 
+out:
 	mutex_unlock(&tegra->lock);
 	return IRQ_HANDLED;
 }
@@ -818,16 +826,6 @@ static void tegra_xusb_phy_disable(struct tegra_xusb *tegra)
 	}
 }
 
-static int tegra_xusb_runtime_suspend(struct device *dev)
-{
-	return 0;
-}
-
-static int tegra_xusb_runtime_resume(struct device *dev)
-{
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int tegra_xusb_init_context(struct tegra_xusb *tegra)
 {
@@ -1128,6 +1126,24 @@ static int __tegra_xusb_enable_firmware_messages(struct tegra_xusb *tegra)
 	return err;
 }
 
+static irqreturn_t tegra_xusb_padctl_irq(int irq, void *data)
+{
+	struct tegra_xusb *tegra = data;
+
+	mutex_lock(&tegra->lock);
+
+	if (tegra->suspended) {
+		mutex_unlock(&tegra->lock);
+		return IRQ_HANDLED;
+	}
+
+	mutex_unlock(&tegra->lock);
+
+	pm_runtime_resume(tegra->dev);
+
+	return IRQ_HANDLED;
+}
+
 static int tegra_xusb_enable_firmware_messages(struct tegra_xusb *tegra)
 {
 	int err;
@@ -1251,6 +1267,52 @@ static void tegra_xhci_id_work(struct work_struct *work)
 	}
 }
 
+#if IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
+static bool is_usb2_otg_phy(struct tegra_xusb *tegra, unsigned int index)
+{
+	return (tegra->usbphy[index] != NULL);
+}
+
+static bool is_usb3_otg_phy(struct tegra_xusb *tegra, unsigned int index)
+{
+	struct tegra_xusb_padctl *padctl = tegra->padctl;
+	unsigned int i;
+	int port;
+
+	for (i = 0; i < tegra->num_usb_phys; i++) {
+		if (is_usb2_otg_phy(tegra, i)) {
+			port = tegra_xusb_padctl_get_usb3_companion(padctl, i);
+			if ((port >= 0) && (index == (unsigned int)port))
+				return true;
+		}
+	}
+
+	return false;
+}
+
+static bool is_host_mode_phy(struct tegra_xusb *tegra, unsigned int phy_type, unsigned int index)
+{
+	if (strcmp(tegra->soc->phy_types[phy_type].name, "hsic") == 0)
+		return true;
+
+	if (strcmp(tegra->soc->phy_types[phy_type].name, "usb2") == 0) {
+		if (is_usb2_otg_phy(tegra, index))
+			return ((index == tegra->otg_usb2_port) && tegra->host_mode);
+		else
+			return true;
+	}
+
+	if (strcmp(tegra->soc->phy_types[phy_type].name, "usb3") == 0) {
+		if (is_usb3_otg_phy(tegra, index))
+			return ((index == tegra->otg_usb3_port) && tegra->host_mode);
+		else
+			return true;
+	}
+
+	return false;
+}
+#endif
+
 static int tegra_xusb_get_usb2_port(struct tegra_xusb *tegra,
 					      struct usb_phy *usbphy)
 {
@@ -1343,6 +1405,7 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_xusb *tegra)
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb *tegra;
+	struct device_node *np;
 	struct resource *regs;
 	struct xhci_hcd *xhci;
 	unsigned int i, j, k;
@@ -1390,6 +1453,14 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	if (IS_ERR(tegra->padctl))
 		return PTR_ERR(tegra->padctl);
 
+	np = of_parse_phandle(pdev->dev.of_node, "nvidia,xusb-padctl", 0);
+	if (!np)
+		return -ENODEV;
+
+	tegra->padctl_irq = of_irq_get(np, 0);
+	if (tegra->padctl_irq <= 0)
+		return (tegra->padctl_irq == 0) ? -ENODEV : tegra->padctl_irq;
+
 	tegra->host_clk = devm_clk_get(&pdev->dev, "xusb_host");
 	if (IS_ERR(tegra->host_clk)) {
 		err = PTR_ERR(tegra->host_clk);
@@ -1534,6 +1605,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_powerdomains;
 	}
 
+	tegra->hcd->skip_phy_initialization = 1;
 	tegra->hcd->regs = tegra->regs;
 	tegra->hcd->rsrc_start = regs->start;
 	tegra->hcd->rsrc_len = resource_size(regs);
@@ -1616,12 +1688,6 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_usb3;
 	}
 
-	err = tegra_xusb_enable_firmware_messages(tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable messages: %d\n", err);
-		goto remove_usb3;
-	}
-
 	err = devm_request_threaded_irq(&pdev->dev, tegra->mbox_irq,
 					tegra_xusb_mbox_irq,
 					tegra_xusb_mbox_thread, 0,
@@ -1631,12 +1697,36 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto remove_usb3;
 	}
 
+	err = devm_request_threaded_irq(&pdev->dev, tegra->padctl_irq, NULL, tegra_xusb_padctl_irq,
+					IRQF_ONESHOT, dev_name(&pdev->dev), tegra);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to request padctl IRQ: %d\n", err);
+		goto remove_usb3;
+	}
+
+	err = tegra_xusb_enable_firmware_messages(tegra);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to enable messages: %d\n", err);
+		goto remove_usb3;
+	}
+
 	err = tegra_xusb_init_usb_phy(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to init USB PHY: %d\n", err);
 		goto remove_usb3;
 	}
 
+	/* Enable wake for both USB 2.0 and USB 3.0 roothubs */
+	device_init_wakeup(&tegra->hcd->self.root_hub->dev, true);
+	device_init_wakeup(&xhci->shared_hcd->self.root_hub->dev, true);
+	device_init_wakeup(tegra->dev, true);
+
+	pm_runtime_use_autosuspend(tegra->dev);
+	pm_runtime_set_autosuspend_delay(tegra->dev, 2000);
+	pm_runtime_mark_last_busy(tegra->dev);
+	pm_runtime_set_active(tegra->dev);
+	pm_runtime_enable(tegra->dev);
+
 	return 0;
 
 remove_usb3:
@@ -1672,6 +1762,7 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 
 	tegra_xusb_deinit_usb_phy(tegra);
 
+	pm_runtime_get_sync(&pdev->dev);
 	usb_remove_hcd(xhci->shared_hcd);
 	usb_put_hcd(xhci->shared_hcd);
 	xhci->shared_hcd = NULL;
@@ -1681,8 +1772,8 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
 
-	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put(&pdev->dev);
 
 	tegra_xusb_powergate_partitions(tegra);
 
@@ -1696,7 +1787,7 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
+#if IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
 static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 {
 	struct device *dev = hub->hcd->self.controller;
@@ -1722,9 +1813,17 @@ static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 static int tegra_xusb_check_ports(struct tegra_xusb *tegra)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	struct xhci_bus_state *bus_state = &xhci->usb2_rhub.bus_state;
 	unsigned long flags;
 	int err = 0;
 
+	if (bus_state->bus_suspended) {
+		/* xusb_hub_suspend() has just directed one or more USB2 port(s)
+		 * to U3 state, it takes 3ms to enter U3.
+		 */
+		usleep_range(3000, 4000);
+	}
+
 	spin_lock_irqsave(&xhci->lock, flags);
 
 	if (!xhci_hub_ports_suspended(&xhci->usb2_rhub) ||
@@ -1770,45 +1869,186 @@ static void tegra_xusb_restore_context(struct tegra_xusb *tegra)
 	}
 }
 
-static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool wakeup)
+static enum usb_device_speed tegra_xhci_portsc_to_speed(struct tegra_xusb *tegra, u32 portsc)
+{
+	if (DEV_LOWSPEED(portsc))
+		return USB_SPEED_LOW;
+
+	if (DEV_HIGHSPEED(portsc))
+		return USB_SPEED_HIGH;
+
+	if (DEV_FULLSPEED(portsc))
+		return USB_SPEED_FULL;
+
+	if (DEV_SUPERSPEED_ANY(portsc))
+		return USB_SPEED_SUPER;
+
+	return USB_SPEED_UNKNOWN;
+}
+
+static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
 {
+	struct tegra_xusb_padctl *padctl = tegra->padctl;
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	enum usb_device_speed speed;
+	struct phy *phy;
+	unsigned int index, offset;
+	unsigned int i, j, k;
+	struct xhci_hub *rhub;
+	u32 portsc;
+
+	for (i = 0, k = 0; i < tegra->soc->num_types; i++) {
+		if (strcmp(tegra->soc->phy_types[i].name, "usb3") == 0)
+			rhub = &xhci->usb3_rhub;
+		else
+			rhub = &xhci->usb2_rhub;
+
+		if (strcmp(tegra->soc->phy_types[i].name, "hsic") == 0)
+			offset = tegra->soc->ports.usb2.count;
+		else
+			offset = 0;
+
+		for (j = 0; j < tegra->soc->phy_types[i].num; j++) {
+			phy = tegra->phys[k++];
+
+			if (!phy)
+				continue;
+
+			index = j + offset;
+
+			if (index >= rhub->num_ports)
+				continue;
+
+			if (!is_host_mode_phy(tegra, i, j))
+				continue;
+
+			portsc = readl(rhub->ports[index]->addr);
+			speed = tegra_xhci_portsc_to_speed(tegra, portsc);
+			tegra_xusb_padctl_enable_phy_sleepwalk(padctl, phy, speed);
+			tegra_xusb_padctl_enable_phy_wake(padctl, phy);
+		}
+	}
+}
+
+static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
+{
+	struct tegra_xusb_padctl *padctl = tegra->padctl;
+	unsigned int i;
+
+	for (i = 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
+	}
+}
+
+static void tegra_xhci_disable_phy_sleepwalk(struct tegra_xusb *tegra)
+{
+	struct tegra_xusb_padctl *padctl = tegra->padctl;
+	unsigned int i;
+
+	for (i = 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		tegra_xusb_padctl_disable_phy_sleepwalk(padctl, tegra->phys[i]);
+	}
+}
+
+static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
+{
+	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	struct device *dev = tegra->dev;
+	bool wakeup = runtime ? true : device_may_wakeup(dev);
+	unsigned int i;
 	int err;
+	u32 usbcmd;
+
+	dev_dbg(dev, "entering ELPG\n");
+
+	usbcmd = readl(&xhci->op_regs->command);
+	usbcmd &= ~CMD_EIE;
+	writel(usbcmd, &xhci->op_regs->command);
 
 	err = tegra_xusb_check_ports(tegra);
 	if (err < 0) {
 		dev_err(tegra->dev, "not all ports suspended: %d\n", err);
-		return err;
+		goto out;
 	}
 
 	err = xhci_suspend(xhci, wakeup);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
-		return err;
+		goto out;
 	}
 
 	tegra_xusb_save_context(tegra);
-	tegra_xusb_phy_disable(tegra);
+
+	if (wakeup)
+		tegra_xhci_enable_phy_sleepwalk_wake(tegra);
+
+	tegra_xusb_powergate_partitions(tegra);
+
+	for (i = 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		phy_power_off(tegra->phys[i]);
+		if (!wakeup)
+			phy_exit(tegra->phys[i]);
+	}
+
 	tegra_xusb_clk_disable(tegra);
 
-	return 0;
+out:
+	if (!err)
+		dev_dbg(tegra->dev, "entering ELPG done\n");
+	else {
+		usbcmd = readl(&xhci->op_regs->command);
+		usbcmd |= CMD_EIE;
+		writel(usbcmd, &xhci->op_regs->command);
+
+		dev_dbg(tegra->dev, "entering ELPG failed\n");
+		pm_runtime_mark_last_busy(tegra->dev);
+	}
+
+	return err;
 }
 
-static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool wakeup)
+static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	struct device *dev = tegra->dev;
+	bool wakeup = runtime ? true : device_may_wakeup(dev);
+	unsigned int i;
+	u32 usbcmd;
 	int err;
 
+	dev_dbg(dev, "exiting ELPG\n");
+	pm_runtime_mark_last_busy(tegra->dev);
+
 	err = tegra_xusb_clk_enable(tegra);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to enable clocks: %d\n", err);
-		return err;
+		goto out;
 	}
 
-	err = tegra_xusb_phy_enable(tegra);
-	if (err < 0) {
-		dev_err(tegra->dev, "failed to enable PHYs: %d\n", err);
-		goto disable_clk;
+	err = tegra_xusb_unpowergate_partitions(tegra);
+	if (err)
+		goto disable_clks;
+
+	if (wakeup)
+		tegra_xhci_disable_phy_wake(tegra);
+
+	for (i = 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		if (!wakeup)
+			phy_init(tegra->phys[i]);
+
+		phy_power_on(tegra->phys[i]);
 	}
 
 	tegra_xusb_config(tegra);
@@ -1826,31 +2066,79 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool wakeup)
 		goto disable_phy;
 	}
 
-	err = xhci_resume(xhci, true);
+	if (wakeup)
+		tegra_xhci_disable_phy_sleepwalk(tegra);
+
+	err = xhci_resume(xhci, 0);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
 		goto disable_phy;
 	}
 
-	return 0;
+	usbcmd = readl(&xhci->op_regs->command);
+	usbcmd |= CMD_EIE;
+	writel(usbcmd, &xhci->op_regs->command);
+
+	goto out;
 
 disable_phy:
-	tegra_xusb_phy_disable(tegra);
-disable_clk:
+	for (i = 0; i < tegra->num_phys; i++) {
+		if (!tegra->phys[i])
+			continue;
+
+		phy_power_off(tegra->phys[i]);
+		if (!wakeup)
+			phy_exit(tegra->phys[i]);
+	}
+	tegra_xusb_powergate_partitions(tegra);
+disable_clks:
 	tegra_xusb_clk_disable(tegra);
+out:
+	if (!err)
+		dev_dbg(dev, "exiting ELPG done\n");
+	else
+		dev_dbg(dev, "exiting ELPG failed\n");
+
 	return err;
 }
 
 static int tegra_xusb_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
-	bool wakeup = device_may_wakeup(dev);
 	int err;
 
 	synchronize_irq(tegra->mbox_irq);
 
 	mutex_lock(&tegra->lock);
-	err = tegra_xusb_enter_elpg(tegra, wakeup);
+
+	if (pm_runtime_suspended(dev)) {
+		err = tegra_xusb_exit_elpg(tegra, true);
+		if (err < 0)
+			goto out;
+	}
+
+	err = tegra_xusb_enter_elpg(tegra, false);
+	if (err < 0) {
+		if (pm_runtime_suspended(dev)) {
+			pm_runtime_disable(dev);
+			pm_runtime_set_active(dev);
+			pm_runtime_enable(dev);
+		}
+
+		goto out;
+	}
+
+out:
+	if (!err) {
+		tegra->suspended = true;
+		pm_runtime_disable(dev);
+
+		if (device_may_wakeup(dev)) {
+			if (enable_irq_wake(tegra->padctl_irq))
+				dev_err(dev, "failed to enable padctl wakes\n");
+		}
+	}
+
 	mutex_unlock(&tegra->lock);
 
 	return err;
@@ -1859,11 +2147,56 @@ static int tegra_xusb_suspend(struct device *dev)
 static int tegra_xusb_resume(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
-	bool wakeup = device_may_wakeup(dev);
 	int err;
 
 	mutex_lock(&tegra->lock);
-	err = tegra_xusb_exit_elpg(tegra, wakeup);
+
+	if (!tegra->suspended) {
+		mutex_unlock(&tegra->lock);
+		return 0;
+	}
+
+	err = tegra_xusb_exit_elpg(tegra, false);
+	if (err < 0) {
+		mutex_unlock(&tegra->lock);
+		return err;
+	}
+
+	if (device_may_wakeup(dev)) {
+		if (disable_irq_wake(tegra->padctl_irq))
+			dev_err(dev, "failed to disable padctl wakes\n");
+	}
+	tegra->suspended = false;
+	mutex_unlock(&tegra->lock);
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_PM
+static int tegra_xusb_runtime_suspend(struct device *dev)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+	int ret;
+
+	synchronize_irq(tegra->mbox_irq);
+	mutex_lock(&tegra->lock);
+	ret = tegra_xusb_enter_elpg(tegra, true);
+	mutex_unlock(&tegra->lock);
+
+	return ret;
+}
+
+static int tegra_xusb_runtime_resume(struct device *dev)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(dev);
+	int err;
+
+	mutex_lock(&tegra->lock);
+	err = tegra_xusb_exit_elpg(tegra, true);
 	mutex_unlock(&tegra->lock);
 
 	return err;
-- 
2.30.2

