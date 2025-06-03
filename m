Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B6517C224;
	Tue,  3 Jun 2025 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748983161; cv=none; b=UwIcrL7UhsRlEQGbdtZQdwMWcCpoxnfBCtzW2X6ivNq0hocAjrJvELQk4eESL2eomThZfCeF98OGS3vsqmslJDtoUKB0HjeRdTLE2i51Sz2mgeEXXv9FJzXCHbEtPZEHL16mY9IDyjIUXm4GVwks7KVC7k4Zz5Gw9SENRiViNTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748983161; c=relaxed/simple;
	bh=lrn9yhVHbHWZ5mXEe9CH6pC/dm0YLGaICm/gri4Dj9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZgVN6sUVLQfGWRfiO8p0BgkH6KpbFpJZNZfBCsgqLKEnr3B7M1TPvCuVORKAWbI9W9DXSqLLW2B6q/PiNM7/W60DQGRWWebXIUGV3lrbvgeFwEmtQ8XRQeh3VoUZllkdaCTI8FruTVVkRVLYxM4p9MAV6jKBMhCrUgcGJ8jzPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=sgk0VBiU; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="sgk0VBiU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Bay90DQT92IuqmHtqLW5SL201i6ewsYeFfNYqS0IHf4=; b=sgk0VBiUEWhXTmfR
	yqQdx0YdmKK87a8TZVf++8Ve/7Aj8IvwXwObDNDZLwMLQWawxVSBdUUe44hxcc38pi4YzoMVery+Y
	VAHTVDDHYFQ/wepIOrmsx5oPRDErmJ0RJGrz4cbONYjInP9vGqors7YVlNzi7FnWlOrPPnxBXXvJR
	LnixHqi/efuDJ4H23674/cNLbRBvx3pYWntoy9qxgBcCwx85hNchcNyqR1fLghE7HeoIE4yC5/0MH
	yykmE0pAmX7AcbkDOFj2Hvg6w+i9+jiX9zOwUfyVSFgo//O9iiqyBv5Wsdrj1d8jyerOHelrv0kEw
	k98plQc7vacY1N8bzg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uMYPa-007TPC-2Q;
	Tue, 03 Jun 2025 20:39:06 +0000
From: linux@treblig.org
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] usb: phy: tegra: Remove unused functions
Date: Tue,  3 Jun 2025 21:39:05 +0100
Message-ID: <20250603203905.279307-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

tegra_ehci_phy_restore_start() and tegra_ehci_phy_restore_end()
last use was removed in 2013 by
commit a4faa54e3aa2 ("USB: EHCI: tegra: remove all power management")

tegra_usb_phy_preresume() and tegra_usb_phy_postresume() last
use was removed in 2020 by
commit c3590c7656fb ("usb: host: ehci-tegra: Remove the driver")
(Although that one makes me wonder how much of the rest of the file
is actually used)

Remove both sets.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/usb/phy/phy-tegra-usb.c   | 89 -------------------------------
 include/linux/usb/tegra_usb_phy.h |  9 ----
 2 files changed, 98 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index bee222967f6b..fb9031628d39 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -711,58 +711,6 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
 	return utmip_pad_power_off(phy);
 }
 
-static void utmi_phy_preresume(struct tegra_usb_phy *phy)
-{
-	void __iomem *base = phy->regs;
-	u32 val;
-
-	val = readl_relaxed(base + UTMIP_TX_CFG0);
-	val |= UTMIP_HS_DISCON_DISABLE;
-	writel_relaxed(val, base + UTMIP_TX_CFG0);
-}
-
-static void utmi_phy_postresume(struct tegra_usb_phy *phy)
-{
-	void __iomem *base = phy->regs;
-	u32 val;
-
-	val = readl_relaxed(base + UTMIP_TX_CFG0);
-	val &= ~UTMIP_HS_DISCON_DISABLE;
-	writel_relaxed(val, base + UTMIP_TX_CFG0);
-}
-
-static void utmi_phy_restore_start(struct tegra_usb_phy *phy,
-				   enum tegra_usb_phy_port_speed port_speed)
-{
-	void __iomem *base = phy->regs;
-	u32 val;
-
-	val = readl_relaxed(base + UTMIP_MISC_CFG0);
-	val &= ~UTMIP_DPDM_OBSERVE_SEL(~0);
-	if (port_speed == TEGRA_USB_PHY_PORT_SPEED_LOW)
-		val |= UTMIP_DPDM_OBSERVE_SEL_FS_K;
-	else
-		val |= UTMIP_DPDM_OBSERVE_SEL_FS_J;
-	writel_relaxed(val, base + UTMIP_MISC_CFG0);
-	usleep_range(1, 10);
-
-	val = readl_relaxed(base + UTMIP_MISC_CFG0);
-	val |= UTMIP_DPDM_OBSERVE;
-	writel_relaxed(val, base + UTMIP_MISC_CFG0);
-	usleep_range(10, 100);
-}
-
-static void utmi_phy_restore_end(struct tegra_usb_phy *phy)
-{
-	void __iomem *base = phy->regs;
-	u32 val;
-
-	val = readl_relaxed(base + UTMIP_MISC_CFG0);
-	val &= ~UTMIP_DPDM_OBSERVE;
-	writel_relaxed(val, base + UTMIP_MISC_CFG0);
-	usleep_range(10, 100);
-}
-
 static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 {
 	void __iomem *base = phy->regs;
@@ -1123,43 +1071,6 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 	return err;
 }
 
-void tegra_usb_phy_preresume(struct usb_phy *u_phy)
-{
-	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
-
-	if (!phy->is_ulpi_phy)
-		utmi_phy_preresume(phy);
-}
-EXPORT_SYMBOL_GPL(tegra_usb_phy_preresume);
-
-void tegra_usb_phy_postresume(struct usb_phy *u_phy)
-{
-	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
-
-	if (!phy->is_ulpi_phy)
-		utmi_phy_postresume(phy);
-}
-EXPORT_SYMBOL_GPL(tegra_usb_phy_postresume);
-
-void tegra_ehci_phy_restore_start(struct usb_phy *u_phy,
-				  enum tegra_usb_phy_port_speed port_speed)
-{
-	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
-
-	if (!phy->is_ulpi_phy)
-		utmi_phy_restore_start(phy, port_speed);
-}
-EXPORT_SYMBOL_GPL(tegra_ehci_phy_restore_start);
-
-void tegra_ehci_phy_restore_end(struct usb_phy *u_phy)
-{
-	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
-
-	if (!phy->is_ulpi_phy)
-		utmi_phy_restore_end(phy);
-}
-EXPORT_SYMBOL_GPL(tegra_ehci_phy_restore_end);
-
 static int read_utmi_param(struct platform_device *pdev, const char *param,
 			   u8 *dest)
 {
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index e6c14f2b1f9b..40afcee8b4f5 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -80,13 +80,4 @@ struct tegra_usb_phy {
 	bool powered_on;
 };
 
-void tegra_usb_phy_preresume(struct usb_phy *phy);
-
-void tegra_usb_phy_postresume(struct usb_phy *phy);
-
-void tegra_ehci_phy_restore_start(struct usb_phy *phy,
-				 enum tegra_usb_phy_port_speed port_speed);
-
-void tegra_ehci_phy_restore_end(struct usb_phy *phy);
-
 #endif /* __TEGRA_USB_PHY_H */
-- 
2.49.0

