Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC23644DB
	for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525045; cv=none; b=OSndcGUku387q6AMCGK8as2EHsRMo90DglhImy27TvGxPvvLeI47BLyPSzYbdwhDs/gBqz+MKEEyGvslftfai4wLN3aGGmcF18sZgIBVZXiqUyugRV15OLp14Pj4VaikdCz5I7WusYhQ2WT8Iqrwq8GQIJHYWD2Nw3kPJ4149qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525045; c=relaxed/simple;
	bh=L3pd9O9+k7HD97LBKiHjkt7CjVY/MTLZ0/1GPuvhFoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hemyYcne5zBgadz7Uzf4S+/c/ejnJo19L1y4CbbXx6PjH+Ta2sKx3uzMpbOGmwIW58HVPG4KQO/EOpdPRzPm1OduT0/BK07h0PVHH/1v/H8/AEbyDYxrdvdme1CdfTbkIeVVpFl1P6InI60KX7Bfuz+vqumi3OPE0i76SbIeeXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYjquy+s; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYjquy+s"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6870a365c77so7890287a12.0
        for <linux-tegra@vger.kernel.org>; Sat, 23 May 2026 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525043; x=1780129843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoLIFVfCtco7LvImKkYkivcovHQB6EbUjyp4kpuJb6I=;
        b=MYjquy+sfTodYeCUKJo0VvRo2/+kuyqW+Qq+xpgerwms4qG5y5xtSM4OWNRZIp8fjS
         tCXWh6gR3UzJ2uamcT8hkivvWZ6pP+9LwACxA3jg6dkLXmf7iSlc6zWyYsU/egrfdFBf
         vo7iXPe+bUfxv8FiwM4bTfZkzocgR0JKRe6dxRSO+CAl4Lnr1cGIl+g9evzFaaPsu6h/
         ontf2nLe4SI2OqhdVJDd1NfQf4Wvq0DVoY+MwYTMMgipltHgJvgncjerFjbDNgnJCFtF
         ohXHCNKlsdBF6xN0Kx8sBBsc4gUJ86E9Y4xwlFGDwsD9lj319RRmktVPtZyPZGYHFrTC
         wlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525043; x=1780129843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WoLIFVfCtco7LvImKkYkivcovHQB6EbUjyp4kpuJb6I=;
        b=sjjN/t5UsAMTneWUxElX6fL0HSoQjfSRhTjBQKOJjRt/CSmv4w6CoYXoSxmBXkdYXe
         IE+1Ky3m8zg6nGK0eX5s6BjFlDB49DNzTbie5rGFFIzXQH5fxD83rq+Irm6G45bWKUG+
         GlEkfVaj2kC2Ej2l12JDCKXUpI6vTdIXdaTJ1ssKsVyxs+vGh3KmuJlCVx/7n/TjNjQ3
         55Lkbuq1LJcVFICVIiva6or+VZQt4rVS9WSQdGGrKt298HohmeOfW48Z4phDVFLukeXt
         XJ4FlKZTSupiFAjhV2g0ofR/5XgUmHx7+YAwduB4hxKqolezfNBR42r/9EaAsxsu/6t4
         G1SA==
X-Forwarded-Encrypted: i=1; AFNElJ/9XkYB3WBPSEija5REtq812azDXreqcbnhUFyKtFwXL5ktPZYwIl/Ertg//7aYZJNwnOXfYNpdVuHDeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/r3891ISxjNaWAPz8umPFmpNCCsXNPRMBPek4FEJfMvjvSy1
	lE38D/QVdvazd2Vd/w7OZsYPUW/vUUnxI9D7hGxgKDwZTTNqRhMQJWpW
X-Gm-Gg: Acq92OH1pOMwon9AtdpM3IBFaF4G0T/FeO+o0gFBG1pMpI3+iDoHl9uCcNuJyKWe2qK
	4fDMfy0B7D7cvXM7B0CSZd4+fxjiaMg2z2AmdZfNRfL7P1crwYPJ5iL/Pbw9rx5GmLy+FSKJvhi
	ffLG3v8V6s0AIE707TVF+GOGn9A/3ad3tXQL42/f0oOT9Mc7D5js6zYzrH8WpRjLrcERhZRNhIU
	1cM/qfuHvyf/hBE0FHJ/8VOBwACJ2sTx/ffP6IZCPdu2BVTFxzSvL2ZElQTKhksHd9yvQYLgyk6
	+gy5nY5xyfcogs3P3UHEuVOcmydtwRZLjPcL2TkhnNADgu82qeCU4DrcYSXm5oGM8J9oZO882Am
	ozz82/EQq8bGymmgGm+v9yzvu6lFpGWelqT2iTT6II7wGeLnvk/XBIElfrJneLAaZgcApmBQih/
	LE7EreorbfiU8W
X-Received: by 2002:a05:6402:42cc:b0:688:1d5:44b9 with SMTP id 4fb4d7f45d1cf-6889c43c704mr4015594a12.7.1779525042509;
        Sat, 23 May 2026 01:30:42 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if bus is externally controlled
Date: Sat, 23 May 2026 11:30:11 +0300
Message-ID: <20260523083013.46372-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
References: <20260523083013.46372-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the USB controller and PHY are externally controlled, then the
registration of the controller and the PHY initialization should be
skipped, since these configurations must be done by the device that
controls the bus to work correctly.

Since USB PHY in Tegra controls clock gates required by the controller
itself, Chipidea core PHY management is not suitable for Tegra.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 372788f0f970..a19cb3b33bf3 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -32,6 +32,7 @@ struct tegra_usb {
 	struct clk *clk;
 
 	bool needs_double_reset;
+	bool externally_controlled;
 };
 
 struct tegra_usb_soc_info {
@@ -312,6 +313,9 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
 
+	if (device_property_present(&pdev->dev, "nvidia,external-control"))
+		usb->externally_controlled = true;
+
 	err = tegra_usb_reset_controller(&pdev->dev);
 	if (err) {
 		dev_err_probe(&pdev->dev, err, "failed to reset controller");
@@ -323,9 +327,11 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	 * initialized, otherwise CPU will hang because clocks are gated.
 	 * PHY driver controls gating of internal USB clocks on Tegra.
 	 */
-	err = usb_phy_init(usb->phy);
-	if (err)
-		goto fail_power_off;
+	if (!usb->externally_controlled) {
+		err = usb_phy_init(usb->phy);
+		if (err)
+			goto fail_power_off;
+	}
 
 	/* setup and register ChipIdea HDRC device */
 	usb->soc = soc;
@@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
 		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
 
-	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
-				      pdev->num_resources, &usb->data);
-	if (IS_ERR(usb->dev)) {
-		err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
-				    "failed to add HDRC device");
-		goto phy_shutdown;
+	if (!usb->externally_controlled) {
+		usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
+					      pdev->num_resources, &usb->data);
+		if (IS_ERR(usb->dev)) {
+			err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
+					    "failed to add HDRC device");
+			goto phy_shutdown;
+		}
 	}
 
 	return 0;
@@ -365,8 +373,10 @@ static void tegra_usb_remove(struct platform_device *pdev)
 {
 	struct tegra_usb *usb = platform_get_drvdata(pdev);
 
-	ci_hdrc_remove_device(usb->dev);
-	usb_phy_shutdown(usb->phy);
+	if (!usb->externally_controlled) {
+		ci_hdrc_remove_device(usb->dev);
+		usb_phy_shutdown(usb->phy);
+	}
 
 	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
-- 
2.51.0

