Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2664D1E5B88
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376929; cv=none; b=O+DN1TmMwTk+9hmWC+1fyI5hY0Hfme3gXqWaaFCencNxDz8LHGE1+sE8dH/ZAz+1oID8kc2+r0yvRJiE3CmCIfAwUCjo0PzLoMWBlyqNrqWzZiJh35h385wZOjFRhvua/SDsF6e4o98KLk+ggLOxoBjlc3XkoW+9/WvGWfsjnmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376929; c=relaxed/simple;
	bh=WclG9/5UCAVmNpJ6wIy91+8u1Ud041oHxz1zl+TJNjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dijt42eQETM+0aqErgM/D9o5QgXaXuU8DMlFLQCdwq/tCZJ6qMWO29IcMYSzIMXMucTS6lElG0wggN+9WL0xTdjJXilz9kZE4KSJpBkeRSwu2KunEkHZI0HxVP4vV7kZaE0rJsl5LNM8QB8iHO3+Plsug7N9z+T8xKOZQDstYU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNwhm2D7; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNwhm2D7"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso3729319a91.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376927; x=1774981727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
        b=PNwhm2D7X/t5grbCzfbSsK938XLqC8zliWWJl7CHQeygpCZhAYKg9ueMW6WcooRWtm
         hx/+a574mi6Ddy2NR7xtXVnJuy7cRErVDGBX9UqYcdOOElMzK5cra+ldtlYXQd5kESR5
         UUKhBEkRjSz/F7tWlojAuRS19GTh+gg8CUiiLHic3k+Nz7yf+T/K89Vkh8Wn67U9hJht
         khTlX9ALg7J8Vzjq7NvUePRnxVyfkaF3AMb5FCE/ED5VR3ZRAvTEFnntWFuw0jjgfgZC
         0u3C4aicVQZl8UeTBMQLCeDaFYcc+zzXGj9JCZI8SMncELHZH+86BQGKyFc6sgd7zQhn
         xlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376927; x=1774981727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
        b=Co41O4PMVrWhoKSVXShfrdxDsaD1VZvl1HsOHcYYULj6u7HgxVg4/y4yCbUnq8cyaT
         euc1Ign89bpcU0enI+XMoXP9Xi6WeslxP3GXMt1fUpsYQpyibnM9Dmpr+GVVARMvazzq
         iqdEyE8Xe1QRSCChWvKUeADBwHD0WjTvDc12Hg7N48Qrrn0RSV+r8v3LObSjLwKD5gPo
         qqWkJlneDqewacSePUQSGk8nDax7J+6DWzX03QS2BwlTwUoqT4nNeRNORZYkSs7Nmk1+
         fLylPkO2Xx+f6Yp37l4qVVnQP4yGPphhXoeVlc2wYzBCEG5f86CUc61C+hBW7/ypt1C5
         jXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl60wUPT2JnKoa3Hn4pvKL6ZrtZvD8hKL9xPBO8CbvQHG9tuPnj4uY8C7PYqyG+ywJjl4c/SBKW5nhsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycdd/6G/1tTcbuw59vTmWXjb+JnAg0DRfr0n/BQhQ8I0CoKycQ
	aHKFV+QT8kgjRit4P1iVPvHpoi0IJhh33wzhzaUTwg6O414gcuPDHiXv
X-Gm-Gg: ATEYQzzD4RAVlhqeNeq0Uik0ztpAfVkIrfbeEzQUyXFoEDwUsbsvk+yTqXMkQTMVgsA
	AGLxjTunBI9wTD6F5KOOVGs5jNNRH1hGgAqP3XfF5JleNKD/QrWAfnnPiitr1e2EE+m1Tp1V8mo
	DjXz+qeSje6QAKedJj6PGv8ZTp1Vk2CMceAaFALm8wFCQfpAvv670kT+zar+ozQcEgs6Lz97Xiv
	HYXjwuoGGEGqxqgSPZB6p2tJwqxUkCyPqymw6fx7PImHPlVck9YYiLIo5LBzYuPmsJjYOM6D2hg
	w9ID6ttrU/uKIOpDP7+LgTlyF65hXEaarM7RHnguC2X4t+iYYiJbRvA0GjUH3+DDYo/EkQCdsvk
	9Re+UciCn8wDlmqxkXZfJzswZSISFESLqJGZYH9F8rAKlabwj1jlIYAclO+b+T5VIhMMh8APczO
	oeGDkDrtClKiLSbdigrGHv4dTOo1hIURK15ocp
X-Received: by 2002:a17:90b:1d8a:b0:35b:e5ba:c0c8 with SMTP id 98e67ed59e1d1-35c0ddd9ed9mr320446a91.28.1774376927304;
        Tue, 24 Mar 2026 11:28:47 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:46 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:57 +0530
Subject: [PATCH 09/10] i2c: sis96x: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-9-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2523;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=2gYAVvyUJk/qxHL4KJceROL4iNDzsuJ4eDXGcgjkpVk=;
 b=vB2gL2qhGY3YL/cIJqmvowLCaQEngaBk72sJRkrwCl3oRTHnnpcQvD7hzPfvDqHKUYnT4Wr6Y
 Zfn7Uu0NXm6B/rb6bM9jYBJr8GEREU1oPwc+1RRqWHn4xFjESwTrs7U
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis96x.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..eee41dc9d706 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -245,23 +245,19 @@ static int sis96x_probe(struct pci_dev *dev,
 	u16 ww = 0;
 	int retval;
 
-	if (sis96x_smbus_base) {
-		dev_err(&dev->dev, "Only one device supported.\n");
-		return -EBUSY;
-	}
+	if (sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EBUSY, "Only one device supported.\n");
 
 	pci_read_config_word(dev, PCI_CLASS_DEVICE, &ww);
-	if (PCI_CLASS_SERIAL_SMBUS != ww) {
-		dev_err(&dev->dev, "Unsupported device class 0x%04x!\n", ww);
-		return -ENODEV;
-	}
+	if (ww != PCI_CLASS_SERIAL_SMBUS)
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Unsupported device class 0x%04x!\n", ww);
 
 	sis96x_smbus_base = pci_resource_start(dev, SIS96x_BAR);
-	if (!sis96x_smbus_base) {
-		dev_err(&dev->dev, "SiS96x SMBus base address "
-			"not initialized!\n");
-		return -EINVAL;
-	}
+	if (!sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EINVAL,
+				     "SiS96x SMBus base address not initialized!\n");
+
 	dev_info(&dev->dev, "SiS96x SMBus base address: 0x%04x\n",
 			sis96x_smbus_base);
 
@@ -272,9 +268,9 @@ static int sis96x_probe(struct pci_dev *dev,
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(sis96x_smbus_base, SMB_IOSIZE,
 			    sis96x_driver.name)) {
-		dev_err(&dev->dev, "SMBus registers 0x%04x-0x%04x "
-			"already in use!\n", sis96x_smbus_base,
-			sis96x_smbus_base + SMB_IOSIZE - 1);
+		dev_err_probe(&dev->dev, -EINVAL,
+			      "SMBus registers 0x%04x-0x%04x already in use!\n",
+			      sis96x_smbus_base, sis96x_smbus_base + SMB_IOSIZE - 1);
 
 		sis96x_smbus_base = 0;
 		return -EINVAL;
@@ -287,7 +283,7 @@ static int sis96x_probe(struct pci_dev *dev,
 		"SiS96x SMBus adapter at 0x%04x", sis96x_smbus_base);
 
 	if ((retval = i2c_add_adapter(&sis96x_adapter))) {
-		dev_err(&dev->dev, "Couldn't register adapter!\n");
+		dev_err_probe(&dev->dev, retval, "Couldn't register adapter!\n");
 		release_region(sis96x_smbus_base, SMB_IOSIZE);
 		sis96x_smbus_base = 0;
 	}

-- 
2.43.0

