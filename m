Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439A233D9E
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447661; cv=none; b=cGI2p+2p4t94PAYfNpkCsnhSqFQGD141LNm0H++219hnIpBFu/TOeRA/h2EzW9los1eQhpXV2swYgOfkmRdjWrEukZCwFCb4y0otP5W8QVfsdYUlfeFzFAmFnwGyMxZSMTOwtkqGOXuKWY08Wcs35SPALWVyzXB8mwF8udhRz0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447661; c=relaxed/simple;
	bh=B1ndyCLlQ4ODPRpMSNjb1k1WG8/IUdEqzvCtKASm/ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeXskXAavsKiQYjHGnARPdBrZQy0AirxVTl770mDHH7PWEnXnD1Bp5zWU6CqGpwamVOULFH0fowbwfnulNERZ39J4tAhj8WYdDEbQxpHZuKSxud3OQ/pPk4o2sF6kXIwwOSUZvA/tcCk0JRTC7YzzKo9ard5KDq8eAUehdHYYhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wRgALTSk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wRgALTSk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cf214200so34316765e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jul 2025 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447657; x=1752052457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgVeELJ5kbUgF10HS6VshSVIN6iNDw21kmNN6tTpH10=;
        b=wRgALTSkjr7fg1e2rFvccfBLF+acrH83zg+2y/HbrmeQ/POeZZmCphS7aAxVDMpPBm
         ljjc+oHyIOPBSGy15mPTEyQEsOxFUR7gHEqAlIL00gugz/Z5m/Kmd/IcFjcRofpd/DMv
         OOJ7yGJWXxNezIBYM7eAaTi81t7pV/P97ekGM/dOV26AobYXk2FVjREIylAGn1DwllXm
         aKg9EjoRIZ8HZzYjP8XtPXqbTHuE9XCCgo+aesun8JgFyqt7ZZR8DBmZ85OzXqz/JsWv
         dePj+om4Gq/DtU+mT8PqD8qs3QUGd56NRunv9u6slcPU2gZLb8sOOwOYEnpRv/J6Uc5w
         WlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447657; x=1752052457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgVeELJ5kbUgF10HS6VshSVIN6iNDw21kmNN6tTpH10=;
        b=ZRsQZtIme4sIICAwQ/F6mfvTRNFoq3ibVYqDXySru/AWo9d8jUBt55lT0nwQlOjB1M
         ljqVjhA2XKf5q5fL+y2hKom6lSMNEYUFRdLxgxX9EhmoxP6CYicLEiVO7+VvYnbrQ5EN
         bGCLz0pqp2pMfnqiA7iga0p0Ip3Qkc9ULzzohL1g4wsmeK5+xvGArQYaYxtW4698Ji2n
         rwWHuDgpoCLLTLGEO0y+RE192lwnwwmra0QoacVYgTe3seVuofZNoOdcx0wzPoSKvkCE
         shTkYeRaX+7S9HJi/PpUMrv9TisNc+NqSWj/0YwBcj2GL72159ZqNsOrhB7Xc22eM1TG
         0LWw==
X-Forwarded-Encrypted: i=1; AJvYcCUUXAbCRIn9/6wtP2yzdHhOtjrJCHz3KNKYF+/lp8h0BG/1NOgYQ8/v/NX3fpOQeLBVUXIGB82CaHH2CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfif483bT8YBlXy0iXk8ZMUvFDAbbJyOY39+BRR9ch2ZaxcoFu
	SLdr3A9UiepN0tZ2pt+nSZgq1S+3NXQ5WFZZbiTv+P/YBMh5boZpeAa4qlm0NlicAsw=
X-Gm-Gg: ASbGncuAq+dleOk8RBJpd33GidNzodID69qiNxIaylzsnnH93k5ZJicuAniJA2KGtET
	tSLTVmKdm46o7CUd4xnRm3rRvUI8jAJSwhE5ASp5V0joPtV17hpkHrtrFyoXquFVBAyKcAmlVqC
	5rZHKwf47PMFR08wrdHvb1+tPnrZhcIZHgL1uScw/Q2o9wtYapQ+KPvvboFOEN0L8zUwYBtgmMT
	apQz4bxm9Rqjt8K4qXFfqQp5ldgH1FA3tmBxK5GWXFxbp+tf19dcLpVrThbad5zqlVtrTT8ODVR
	O7bmmQ6ftRWgEKhYUH3G3FGbBBmMBlde4oP+6skTVF7LsKXMqIqxZQ==
X-Google-Smtp-Source: AGHT+IHZW19OYyWsuJKRkKyJd4B15hzcvnXr7azzlTLLvYuao6zKW6NrUTf0WAA9IH/OMkzj0HZ9IA==
X-Received: by 2002:a05:6000:645:b0:3b1:3466:6734 with SMTP id ffacd0b85a97d-3b200c3cf30mr1339455f8f.44.1751447656753;
        Wed, 02 Jul 2025 02:14:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:06 +0200
Subject: [PATCH 05/12] gpio: timberdale: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-5-0d23be74f71d@linaro.org>
References: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
In-Reply-To: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SJAWbb0fuUiKjfO6048fqxHmqK6VaXLHP3IKnd4QdRQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhgr+kuNKvnHEXh4veawT2GvyWoNtkyJcLJY
 /sHOOMH5AKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YAAKCRARpy6gFHHX
 coK7EACBDroouAgZcdK45re/MRBT6JnD4umGGm0FhYtbUI1CGtys92ajBjsb7KqyfYCPRzJLqJS
 flVDGJgZDJFhZMDOCsA2NDW6DUllXxWObAr4YXlZ6vvGhsmrXbKf54E1s0rDuocALdsB26oPCHG
 OcgSwkW9uvd5nlTVlMKkuMKg79C0RmGA5czawUZ+pPc52a1PEW9YP40Y+ACO8IUy6MEdXmgQ+el
 5mDRaALSvG2IPP8i836BT8WAGnYGZByJbAWOaoGoQncY5xq0TfiB658GN5TirNh90HeMWGsdzhj
 6Lg/MNHuSGe/NzICFF2asycCsOtgszboQ16BGW88MBiSRG00E2c6hpDLhFVvkC4Bo3ONN0yvlpn
 1rHARKMOvH4T3YRDUATnOhnx4XBqUTNLjpL5suBXeOo0Tm205pGCXezmldvaNm9y+KPF0qmXvas
 ZvIQsAK9k8qYGQ0ohPaR0I5P+hDKAtQBD76S9UBMvoNibBDLn+0tVT8tSfBqKRgG6S9ogho29Oe
 bOBeXnKd72RgsWsqwbzo77eXzQRvQ3izKOCSkvcYE00ofzzD2kgPnVR8FNGLI5N/NJBwGXmsWHc
 Pu/LrYTigoYANyx+3+oGKdpypceUPD2IWIs35Prw4v2/AKIHyQe3NC6FlLREf9obSDj65x7N6ed
 7DZrjAPsmPOCg/Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-timberdale.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index cb303a26f4d3cd77368b5bdac42aa42821b39345..fbb883089189095cdc0101d864ab90dd042c73a3 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -80,10 +80,9 @@ static int timbgpio_gpio_direction_output(struct gpio_chip *gpio,
 	return timbgpio_update_bit(gpio, nr, TGPIODIR, false);
 }
 
-static void timbgpio_gpio_set(struct gpio_chip *gpio,
-				unsigned nr, int val)
+static int timbgpio_gpio_set(struct gpio_chip *gpio, unsigned int nr, int val)
 {
-	timbgpio_update_bit(gpio, nr, TGPIOVAL, val != 0);
+	return timbgpio_update_bit(gpio, nr, TGPIOVAL, val != 0);
 }
 
 static int timbgpio_to_irq(struct gpio_chip *gpio, unsigned offset)
@@ -254,7 +253,7 @@ static int timbgpio_probe(struct platform_device *pdev)
 	gc->direction_input = timbgpio_gpio_direction_input;
 	gc->get = timbgpio_gpio_get;
 	gc->direction_output = timbgpio_gpio_direction_output;
-	gc->set = timbgpio_gpio_set;
+	gc->set_rv = timbgpio_gpio_set;
 	gc->to_irq = (irq >= 0 && tgpio->irq_base > 0) ? timbgpio_to_irq : NULL;
 	gc->dbg_show = NULL;
 	gc->base = pdata->gpio_base;

-- 
2.48.1

