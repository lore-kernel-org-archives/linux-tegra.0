Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C67264A83;
	Fri,  1 Aug 2025 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754070097; cv=none; b=PFwOHeMaVMbXt0E+NnkwqMUoop3R9r5xv5rBpZw/uVCln5FeTn5rNemKYVEJyusEt+BI76LntDuVWvbKqs73qpmcf0uW4cx263Z0J7frr+vww3Q4l1CknlEApq+8yiojlh10R5x19MwG8KZeKRwVij+qWmRfUh+wtaKlCafDnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754070097; c=relaxed/simple;
	bh=iof5uvS5Qt9ud+acUuSX7Xq1xUhIO7S324Ypng3zcTE=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=Xc2MQLM71eBjY4Vjb8hBCkEYAg6LWTYBa8G2BKcYqsF1TyDZ6gcYqvqreswcpox+wp3oguPfYMIAfWh5zk8/6cUaSgnR78ULUYnkzlPVtMqX8qgOuviEvBViQchQX3us2L1dXcR//gkPx5u3i1rVBkOoVQMBhM30lx6dmvonpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GNL1+IYy; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GNL1+IYy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xTBb/AKF/oJGoi7LY6md+Zn5yzHGPw7lcCLN9w/FXzc=; b=GNL1+IYytfpMPR+RB6ID7kHh/x
	Rr5VOlWkSWBJMyV1+xGq9Wz+uCXFX6XQnaRFviXXVR+3+hb6jIzSumGlRxvJ7f5fdhrQiaAWuHZ+K
	rr2LYpNZU1ICR76PS7H1hlGW0R1+wBVaYFEf4JQ5o/s322ZJZMf0EPeBvmmCIHJNHDSRiKvAO/wy8
	JptceiNRzFLa5R0nLiRSxfEkOwSZgr5+SI03mSYFZvkOHMZROx6Y87VcQVBD3nI3Ybfh1Jh3t64B0
	RdFCPBPYWBBXfJzPVbBjw6S/qc83bXYBrXQ1GG3sDqN71SIyY1GU46O2hqvpHEr92OpQX3acUDWj3
	UtlPSyCA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50548 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uhtkz-0006pD-0x;
	Fri, 01 Aug 2025 18:41:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uhtkH-007KDZ-JT; Fri, 01 Aug 2025 18:40:41 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: tegra-xudc: fix PM use count underflow
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uhtkH-007KDZ-JT@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 01 Aug 2025 18:40:41 +0100

Upon resume from system suspend, the PM runtime core issues the
following warning:

tegra-xudc 3550000.usb: Runtime PM usage count underflow!

This is because tegra_xudc_resume() unconditionally calls
schedule_work(&xudc->usb_role_sw_work) whether or not anything has
changed, which causes tegra_xudc_device_mode_off() to be called
even when we're already in that mode.

Keep track of the current state of "device_mode", and only schedule
this work if it has changed from the hardware state on resume.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 2957316fd3d0..1d3085cc9d22 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -502,6 +502,7 @@ struct tegra_xudc {
 	struct clk_bulk_data *clks;
 
 	bool device_mode;
+	bool current_device_mode;
 	struct work_struct usb_role_sw_work;
 
 	struct phy **usb3_phy;
@@ -715,6 +716,8 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	phy_set_mode_ext(xudc->curr_utmi_phy, PHY_MODE_USB_OTG,
 			 USB_ROLE_DEVICE);
+
+	xudc->current_device_mode = true;
 }
 
 static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
@@ -725,6 +728,8 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	dev_dbg(xudc->dev, "device mode off\n");
 
+	xudc->current_device_mode = false;
+
 	connected = !!(xudc_readl(xudc, PORTSC) & PORTSC_CCS);
 
 	reinit_completion(&xudc->disconnect_complete);
@@ -4044,10 +4049,10 @@ static int __maybe_unused tegra_xudc_resume(struct device *dev)
 
 	spin_lock_irqsave(&xudc->lock, flags);
 	xudc->suspended = false;
+	if (xudc->device_mode != xudc->current_device_mode)
+		schedule_work(&xudc->usb_role_sw_work);
 	spin_unlock_irqrestore(&xudc->lock, flags);
 
-	schedule_work(&xudc->usb_role_sw_work);
-
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.30.2

