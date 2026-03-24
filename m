Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D09383C64
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 18:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376939; cv=none; b=M8PUYi7wHl793AuJYOGkp2Zx1gZxUgXAWDXrFYkx2GDXLEGIoJcXXqOEDpa1khD0YDJqUk7iIOWsQYZW3c5MboVV6zxB0fGu0xBxopMd/79uJ8Vs6vzlkhpw7iuVVwovC1BDspQuH2fQjK1inaFVlFcGIj/CuRKEgVuXsqqcNJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376939; c=relaxed/simple;
	bh=7g/jARnkhTd3DIs23AFH73jSfHB7zbCwImSIcA8YsoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ohp3b8P+M6PxygPUx2BuQPkmewe8Maek9bds8ARAV7656EDfiyddE1Z+T6CvbPR3i8ZPLKPmq5OTIxXJQytffywvy7BDUAtgAR2KrgOA9dgWvM7dWzyvai/lxDuD8VUG2gp8yEwLefbqy7zIYBRN/NOCRH8Kgk//JLDe8LYdawo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeayEKFn; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeayEKFn"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3159664a91.0
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376937; x=1774981737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
        b=oeayEKFny7vadu4kiqbm4VW6IkcFRMWDumZCZUWfZYCw/RxXLv0aaKBlq4/VUUbDp1
         KOa5FwW0/GzBQxBlZw6D6fi8V53ez3Bl6fagBvPaNDh7OzWeo774+Sen0yKN4nSYcmCJ
         7mtLkTPv7K6AD1jUMNdOoaQduZzvAhBO0XhmZyAkJTbvUPriCVAuuAMM/Z3g1O4cdtpk
         ou8bmXIQlpxhaPDV2cdSEcDjxt8zhqlatUqSvYdSryoti2ViVZmB6Ac3Sc5DUOq9qS5A
         +I87rhwmm0Za4LigTmct0Tdjgkj658A48UbVEMAW5aF313a3k+aJOEBCbaLBFBJ5Vz+l
         wHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376937; x=1774981737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2MPILU45gcDsKK8jp+8jqoirIZBgcXX7ZY0CuqSl9cY=;
        b=HQ5UXamECbn1kdfshEKFJ6dPrYUFPkxQIUB2APqaG8q0VyMtozjO4oKg8N7QcG/8Qo
         OD4UJ4EXDnMkUNApxLxyzfe3q08haNYdQ8RaUkI0xErcOnYaH/e1L4golbiMkleOme9s
         9c8ZaL+2PrpFpeVl2odppq8pI3SquFGxhg75Pfsdw2dKJ0jgyMKC1OQjTI6EjhwJXPIH
         7/qb+vzPCknxbcKZXF2ejG3QPH6Shi0oBhAfStx2VOYo1gcNbtmPav7xGqDBkvy5PVkY
         zF+0Wx1FwBcKGb+wtBytb97E9jCeAnGefMHPxWtr2wizxVcKa8aC7J0eH7aUrvqON2TJ
         qNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU63MsI6w6J64yOv6gKuvciJJmsxt/oSq0EPAapV6BFlUXcxv2Xxig+26bU5yueStrAd+fJKChsC1qOBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ1YpuedbpHgI7fY6GZkglkl2Uk3GOkBw1AENP35e3WKpjy2e1
	gVWDQpVGSiG+AWZE9/dLRZ2CjugA3EeJA6fxPQTWwGGScoNWxMOU8fVR
X-Gm-Gg: ATEYQzzuxEU4crsyMOolFiCL4bSzu0QIupXzmYGWacyAzJYaq+l4p7T/0eLiBlACYIx
	HE8OoPM5yHmJjt7fU4/2h/am5I0qp4fRDsIojURSThbq1TapcMphWpzlIseot6lgqkyYb5IIJ/T
	i2SEXrXLUFjZA5eAVbwxjTxyx2pdCjanqYOrH+QwsG9xHhy7xFAJh+7HG27BUT3EadTsgriE1gW
	WLwL8yxTh2/X3zSwh/vRlBKoDcRC6ZclY/iqUMAOSeQYpdjB5gNNo2Br0ihTCJw+TiPX4BgF5eS
	9GxWMAdvJ4WvvKTz/R+bcGnHDK5PrPRehwJWwJO8SUgk+mKbauuJ8uMfG9jZmVt53s1NTc0sHpP
	a0kt4XJuM/6cBTCjT8IK3s5T206/j4PzlnjDf7Q1czfneUNF3GEoxUFjWeI3/h/8obexANMEO4G
	2i02VBLzqqcsMuGS2ew0ZfPixp3w==
X-Received: by 2002:a17:90b:3dc4:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35c0dd1000bmr297824a91.13.1774376937217;
        Tue, 24 Mar 2026 11:28:57 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:56 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:58 +0530
Subject: [PATCH 10/10] i2c: sis630: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-10-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2804;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=nhsfDSLdFe3nGX23EexwATKRFgvnwZsN/uRkVIgsfDc=;
 b=MfTL2nua2/UaTOkuHox/mofQ9uGkaQFwD4ef2QTeyEIJWKrK1affTlrqYL2fD+dQbiqZ2kQf1
 368O9MeLyraCsNY7XiqbLSbdhihgwtkeZhLhsjgkAnvnbcpMTIg+zrj
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis630.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index a19c3d251804..3d0638c2bc51 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -431,24 +431,23 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	   in acpi io space and read acpi base addr
 	*/
 	if (pci_read_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, &b)) {
-		dev_err(&sis630_dev->dev, "Error: Can't read bios ctl reg\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't read bios ctl reg\n");
 		goto exit;
 	}
 	/* if ACPI already enabled , do nothing */
 	if (!(b & 0x80) &&
 	    pci_write_config_byte(sis630_dev, SIS630_BIOS_CTL_REG, b | 0x80)) {
-		dev_err(&sis630_dev->dev, "Error: Can't enable ACPI\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't enable ACPI\n");
 		goto exit;
 	}
 
 	/* Determine the ACPI base address */
 	if (pci_read_config_word(sis630_dev,
 				 SIS630_ACPI_BASE_REG, &acpi_base)) {
-		dev_err(&sis630_dev->dev,
-			"Error: Can't determine ACPI base address\n");
-		retval = -ENODEV;
+		retval = dev_err_probe(&sis630_dev->dev, -ENODEV,
+				       "Error: Can't determine ACPI base address\n");
 		goto exit;
 	}
 
@@ -469,11 +468,10 @@ static int sis630_setup(struct pci_dev *sis630_dev)
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(smbus_base + SMB_STS, SIS630_SMB_IOREGION,
 			    sis630_driver.name)) {
-		dev_err(&sis630_dev->dev,
-			"I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
-			smbus_base + SMB_STS,
-			smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
-		retval = -EBUSY;
+		retval = dev_err_probe(&sis630_dev->dev, -EBUSY,
+				       "I/O Region 0x%04x-0x%04x for SMBus already in use.\n",
+				       smbus_base + SMB_STS,
+				       smbus_base + SMB_STS + SIS630_SMB_IOREGION - 1);
 		goto exit;
 	}
 
@@ -511,12 +509,9 @@ static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret;
 
-	if (sis630_setup(dev)) {
-		dev_err(&dev->dev,
-			"SIS630 compatible bus not detected, "
-			"module not inserted.\n");
-		return -ENODEV;
-	}
+	if (sis630_setup(dev))
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Compatible bus not detected, module not inserted.\n");
 
 	/* set up the sysfs linkage to our parent device */
 	sis630_adapter.dev.parent = &dev->dev;

-- 
2.43.0

