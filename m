Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647F34F5E0
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775996335; cv=none; b=JZIGNCXYLmrml5O/KQD3vs5AGdbO06j54VN46OlPlileABE3FOxM5xv0jlZB9dJyAHH9Tdyaj6DsyTIbexGm9dv+ngXygOU1tPhnMJz5eqA1fg7rAPXu0EQ2s9AUyrqEVbMd28IG51KsBuzkHE+NIava4pK0z4UpKN/YhpvJ5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775996335; c=relaxed/simple;
	bh=msJfBYh+DCzMkSQsoFZg3hlhI5JX+2yB1zp+8QLYXEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRxcA0XGcynVXjToD3rwmDts+EAgIvC1LePWweyYeIbRQ2oXiUtKLw6awLE9KL5uOfzFfF66biB8tuagTMoDGSgirltahsdPoyC52hJQihGiZdYly9iZ2AdGnGCWiyXReGFpfE8uEwmhhuByuMjePNYxXx5kLgodsupPSQooXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjkZ/LSZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjkZ/LSZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2adbfab4501so14263655ad.2
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775996333; x=1776601133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgcJT6YPrQrJvW780ISmc/kCiCj7OaF09LinK7ADVkQ=;
        b=JjkZ/LSZbShI/nN1+PDnIvcVkl8zibeSm5QiGNfeAjlmFWrz9YoCggRrQp5l9nxBhk
         a5ceL1W3hMA/ubVUdzrrbaHDqucWjeqVf3XmTOTSbvxUDDWKbdQfTHB7p877G44k9Gd/
         y5rPAGYhglbamNYl0ItLXxBvh+MlxhUce45nr37fYe6DpzdvvfnLET66XaRdLZ1WSOC5
         JT9laGTazTygZRkORdWXpXWTrZ8cm4tlW89VMH2QGJhzar7W9njJbpzqF4eZi0syEHxw
         196rhIeOc59tqI37T0Ttk87/dM/kb2W93a+BPxDK145JERAbR00CgaE/DnUKrijk3HY9
         6Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775996333; x=1776601133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgcJT6YPrQrJvW780ISmc/kCiCj7OaF09LinK7ADVkQ=;
        b=p1O0tJn+z5YDsC72RjOovH76UrkaSdlCOS1nDvKZT2f/r8xtVG5CVY7W/aDbVll8//
         mXVPNxqT6gcnic3kMBW4bTWr2sZrMa/pTPvPaVzBq49sacVehHuBWiZrlvA4fXX2jnxT
         qLyOOARNUUA+CIhpMXcbxUxo3xzgU2cOhfBHFpUw49IrKxVOTusYh8JXXj17VJIrZFXt
         T+/1uTqGH02q6MXGSvVibNCBrM3M1vxEZ6jGsdvTjQ2BnUylCcRUgxZ9x5BSKPYgWL74
         /BTMXBPgH3BdagFvUULgpMdXGOozsuaEJhCj2KdvZrCuGUr/EKm8/qeA3kLDhJegB2Wc
         4Lkg==
X-Forwarded-Encrypted: i=1; AFNElJ/NqKUjS1y4ioYMWMfUfwFbNENbia0wb2evqr5ASqOip4xUJ7SlB57uJwpm6ym86Ikt6C/FNLTQTlRPPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyXEQ2GWzHaONXWVZ+yi2Lep5vfMX2veJRzuvh2DcINK2tiVBk
	uocTNmq+uZIbQ20uyPM9/xB0RZMBay+sk3shoENksgkRaFIqDdwN0jdu
X-Gm-Gg: AeBDies/J70c64MfXDTIKOSsPClAzHGxArR8Um23yewXYUdcPAPSNYLSe4GTFr09tZl
	EU/TbbB77Vngx+5fhYYc1iQtFfVSlHiV0/lmXcU/aaeK1uCG1cfemb1eF4BDKw3euxPbUzdTAY8
	T0nyBG8kS2YEbj0vLBSkbQKEFnEY8Ow+/pgnqL3rXFejLG1KfGuQxS9yxhCWyik8cpqLta3LP4s
	RPk70qyx9XejryfMNMzgCJ58rlZw4sVCtXa0HGjMncFiGD7bmTxe9Sm7ANl/GfacpgNc+5CrKNX
	vQNYdLns2XYKfpZevD+Ez6owtkExt2aTe5O3tp1ybS9E7yVOvcRI+tZtFx7puh0zp4wT0Lc5/F1
	vX1HTw7jIDxAOmQRMS1Tzo+MEcr/SxeXwRDyTqQN9i/3qJZE0zMVU2edgcNfDmGx763u8CmbrCW
	FKYTnO+iUBVPbehw==
X-Received: by 2002:a17:903:144e:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2b2d5a7773emr97707585ad.36.1775996332835;
        Sun, 12 Apr 2026 05:18:52 -0700 (PDT)
Received: from lgs.. ([101.32.189.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2eae817fcsm28965705ad.44.2026.04.12.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 05:18:52 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Vamsee Vardhan Thummala <vthummala@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpu: host1x: Fix device reference leak in device_add() error path
Date: Sun, 12 Apr 2026 20:18:36 +0800
Message-ID: <20260412121836.2461556-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After device_initialize(), the embedded struct device in struct
host1x_device should be released through the device core with
put_device().

In host1x_device_add(), the empty-subdevice path calls
device_add(&device->dev), but if that fails it only logs the error and
continues without dropping the device reference. That leaks the
reference held on the embedded struct device.

Fix this by removing the device from host1x->devices and calling
put_device() when device_add() fails.

Fixes: fab823d82ee50 ("gpu: host1x: Allow loading tegra-drm without enabled engines")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/host1x/bus.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index f97567e6ae87..e3ac85848aec 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -477,8 +477,12 @@ static int host1x_device_add(struct host1x *host1x,
 	 */
 	if (list_empty(&device->subdevs)) {
 		err = device_add(&device->dev);
-		if (err < 0)
+		if (err < 0) {
 			dev_err(&device->dev, "failed to add device: %d\n", err);
+			list_del(&device->list);
+			put_device(&device->dev);
+			return err;
+		}
 		else
 			device->registered = true;
 	}
-- 
2.43.0

