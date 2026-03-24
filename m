Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9977963B9
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376871; cv=none; b=Izl0ZqyfpydNsQ+8EhJ4sL/SK7JTKhI555q4W34nrWIBuMCRcux8B6PhQfSYFJb4OZ3QRwt4/oZfOwgzi35DIys8hiB2aVtJsIaP7XG1ApKBSpZgRUaDNaujs3neaHmW9nhFMeMxvgGm5Ja51ZTsPeotG4IvSIsIlCBW9aZexr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376871; c=relaxed/simple;
	bh=INy7r9nqYAh8xRryTtp2F3L3u24eOCBCoOZXV2Ktc3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O04Ufd66178xn3svLWMUgYt07c7V9Uljc/XtsZy3n57I20NzGT/qZ84/1BZDJ4JTwCkZMP0X6yQUclf4dP5agf+lJats+P0pFW33neKOqaLUupoeT9uVkctPxtAGKjcRZKaK6uvSESMj3/vlom01pVQ0ZB8mvyUt1Dqs184TT2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAkfYh2x; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAkfYh2x"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so941361a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376870; x=1774981670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=;
        b=qAkfYh2xYQHXiHGQvivSqGXRcMqtWLP3pggJM1DGosW4QJUlcSjbPvSm6kfq2uXYLi
         Ou8tZ65iGdJQ/xmJn+SXVToRlUTmNYFpdCB9UCWhQFG/2sXdWrFD7YHT0HirOt8/aQKM
         Y6pAVVpbtz1BjwZj+b5EzYj9Et0yFcDBVNo/lS+qimPsBuYxQjAGwZRP0+LRFRCGVhoz
         NA0txW/yQdxnUtw47dcAV8cgCFDLi1U0eaphyo7BBXWsF46CmTRIRK1p/rNxvX4PbUSR
         j5rKQwmNGjU9/LoAVe7HlzVvKhnPekeTATFynMs651ziTN9iXQ2/pe+bhBJT22TcqTq3
         ea6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376870; x=1774981670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOUVvE5FNmjkaySdFPrc+7+hSpPNsoY2HaGuj8AkFfI=;
        b=bnNhisGDJwIx8t3+aBrbLHTsd+lj9YGYiVH58+BILbSAPG69YWt2w2rwIKKrxuqhhh
         aVZMnY/R1X5DuoPvzBxVqyKkJ1E2PYN3l6Qy3eaGO9A4Iu2yqJ99fuG5DpyMwK+yDQ1c
         gPkEYnHjZAXRdMYB995kyEIo5Tk+aR6rrQYxKmXJoTL8lOBLaVP4+3E4MNEQOpjR8XIp
         IgJyI8VZ87gpsC0UKBpIX2cT3awvTz1H9ZDSZOyLMlWoFuVtr/QeNcKcc47j3OW5Xi5y
         8Cp3YE0Gp/HxX3aLB+9+dUHQkXWb0vlBZxHk4EgxV18CZ/A0CFAd1xiyshmCIm0GBOuq
         mv9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdnE7I1IOksz9Dm9R3RoAIurxDa4o950VQmpJH1tzAeCyLw7SlJWwqIKevHlH7xXn53/153EBSyJ2lfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhXhXjO3SEsQu2LdL7x973YVfrhgdSz16qO8L1hfzilWwKvLb
	Iu6CJ3UEwSK7ZkpFNHHj/Qc/yIXQImn9CVh6mlQ6809OfJztXePCeK5a
X-Gm-Gg: ATEYQzwEt9soJ/h9RNneinCqKGft8EGuxX5N/LR5nlgn5pzJWPgxy8p7zJK46vK+yYE
	JoCvKOwKz0e/72EqL4/afEeG58m641Z1K3NFYIRfQ9NGzmKNnQ7m+Iu2az4xctLtErLmOr7UfKD
	Bhm2Imsuiqj3DSIZaZ1qqaYoRKve7Tp4gOLFdseUqFzCJTAurkpaLBt6JpcttPjtU47U45bM/ff
	Ps8mzQGiFhHkcv+qXLSuY0I5qu+AW+KXwPmSRHFdkqCpp1FkbiaG3/8a43t9vQ0F2Qz0U5oF8Dy
	+11XUeuFMWzVLvJrvzr7lP6Lis2J1+Mb0KBV8HxMp/xPie7y38F4eNusDvCfL363L/qmBYFHD4o
	6/llAfhpes4Zg9gKtWSgJiZRU/D4vJKvODt6mrGrJj/LNHvnPq/q9s9kwcp+iY4ICT6Q+4wj0wF
	BvdjKfQOMpMk6Gu0CcShwh1iNzpacmDT2exmpv
X-Received: by 2002:a17:90b:1dcd:b0:35b:a656:a60a with SMTP id 98e67ed59e1d1-35c0dcf48dbmr341601a91.8.1774376869963;
        Tue, 24 Mar 2026 11:27:49 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:27:49 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:52 +0530
Subject: [PATCH 04/10] i2c: stm32f7: Replace dev_err() with dev_err_probe()
 in probe function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-4-7e591cce33a3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=6197;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=s9JDU7GcgsnDDFXsrCxagGOfCSdKXg3wGsXTsgZz2H0=;
 b=ah0pTzAjwcV8FwCOGin97Y4dMl89Nw1GTUGKElGrgDchfwSWIGhdZL4fJM5yOH/LB2Vze2ERu
 5pFUk9n36AADxerpZp4V7L4H+yM/I6gEVGRW6UOTZNuNCinHlE0yV/c
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 78 ++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 70cb5822bf17..e7cc7f0fb56c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -481,28 +481,22 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	int ret = 0;
 
 	specs = stm32f7_get_specs(setup->speed_freq);
-	if (specs == ERR_PTR(-EINVAL)) {
-		dev_err(i2c_dev->dev, "speed out of bound {%d}\n",
-			setup->speed_freq);
-		return -EINVAL;
-	}
+	if (specs == ERR_PTR(-EINVAL))
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "speed out of bound {%d}\n",
+				     setup->speed_freq);
 
 	if ((setup->rise_time > specs->rise_max) ||
-	    (setup->fall_time > specs->fall_max)) {
-		dev_err(i2c_dev->dev,
-			"timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
-			setup->rise_time, specs->rise_max,
-			setup->fall_time, specs->fall_max);
-		return -EINVAL;
-	}
+	    (setup->fall_time > specs->fall_max))
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
+				     setup->rise_time, specs->rise_max,
+				     setup->fall_time, specs->fall_max);
 
 	i2c_dev->dnf = DIV_ROUND_CLOSEST(i2c_dev->dnf_dt, i2cclk);
-	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX) {
-		dev_err(i2c_dev->dev,
-			"DNF out of bound %d/%d\n",
-			i2c_dev->dnf * i2cclk, STM32F7_I2C_DNF_MAX * i2cclk);
-		return -EINVAL;
-	}
+	if (i2c_dev->dnf > STM32F7_I2C_DNF_MAX)
+		return dev_err_probe(i2c_dev->dev, -EINVAL,
+				     "DNF out of bound %d/%d\n", i2c_dev->dnf * i2cclk,
+				     STM32F7_I2C_DNF_MAX * i2cclk);
 
 	/*  Analog and Digital Filters */
 	af_delay_min =
@@ -567,8 +561,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (list_empty(&solutions)) {
-		dev_err(i2c_dev->dev, "no Prescaler solution\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no Prescaler solution\n");
 		goto exit;
 	}
 
@@ -624,8 +617,7 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	if (!s) {
-		dev_err(i2c_dev->dev, "no solution at all\n");
-		ret = -EPERM;
+		ret = dev_err_probe(i2c_dev->dev, -EPERM, "no solution at all\n");
 		goto exit;
 	}
 
@@ -674,11 +666,9 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 
 	i2c_parse_fw_timings(i2c_dev->dev, t, false);
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) {
-		dev_err(i2c_dev->dev, "Invalid bus speed (%i>%i)\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
-		return -EINVAL;
-	}
+	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "Invalid bus speed (%i>%i)\n",
+				     t->bus_freq_hz, I2C_MAX_FAST_MODE_PLUS_FREQ);
 
 	setup->speed_freq = t->bus_freq_hz;
 	i2c_dev->setup.rise_time = t->scl_rise_ns;
@@ -686,10 +676,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 	i2c_dev->dnf_dt = t->digital_filter_width_ns;
 	setup->clock_src = clk_get_rate(i2c_dev->clk);
 
-	if (!setup->clock_src) {
-		dev_err(i2c_dev->dev, "clock rate is 0\n");
-		return -EINVAL;
-	}
+	if (!setup->clock_src)
+		return dev_err_probe(i2c_dev->dev, -EINVAL, "clock rate is 0\n");
 
 	if (!of_property_read_bool(i2c_dev->dev->of_node, "i2c-digital-filter"))
 		i2c_dev->dnf_dt = STM32F7_I2C_DNF_DEFAULT;
@@ -698,8 +686,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		ret = stm32f7_i2c_compute_timing(i2c_dev, setup,
 						 &i2c_dev->timing);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to compute I2C timings.\n");
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to compute I2C timings.\n");
 			if (setup->speed_freq <= I2C_MAX_STANDARD_MODE_FREQ)
 				break;
 			setup->speed_freq =
@@ -710,10 +698,8 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 		}
 	} while (ret);
 
-	if (ret) {
-		dev_err(i2c_dev->dev, "Impossible to compute I2C timings.\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(i2c_dev->dev, ret, "Impossible to compute I2C timings.\n");
 
 	i2c_dev->analog_filter = of_property_read_bool(i2c_dev->dev->of_node,
 						       "i2c-analog-filter");
@@ -2175,10 +2161,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	setup = of_device_get_match_data(&pdev->dev);
-	if (!setup) {
-		dev_err(&pdev->dev, "Can't get device data\n");
-		return -ENODEV;
-	}
+	if (!setup)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Can't get device data\n");
 	i2c_dev->setup = *setup;
 
 	i2c_dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -2279,7 +2263,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 		ret = dev_pm_set_wake_irq(i2c_dev->dev, irq_event);
 		if (ret) {
-			dev_err(i2c_dev->dev, "Failed to set wake up irq\n");
+			dev_err_probe(i2c_dev->dev, ret, "Failed to set wake up irq\n");
 			goto clr_wakeup_capable;
 		}
 	}
@@ -2305,9 +2289,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (i2c_dev->smbus_mode) {
 		ret = stm32f7_i2c_enable_smbus_host(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus Host-Notify protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus Host-Notify protocol\n");
 			goto i2c_adapter_remove;
 		}
 	}
@@ -2315,9 +2298,8 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "smbus-alert")) {
 		ret = stm32f7_i2c_enable_smbus_alert(i2c_dev);
 		if (ret) {
-			dev_err(i2c_dev->dev,
-				"failed to enable SMBus alert protocol (%d)\n",
-				ret);
+			dev_err_probe(i2c_dev->dev, ret,
+				      "failed to enable SMBus alert protocol\n");
 			goto i2c_disable_smbus_host;
 		}
 	}

-- 
2.43.0

