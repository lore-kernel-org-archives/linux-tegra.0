Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F425392C
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447668; cv=none; b=hJEetyDGYCPlKWA+4z/8WF++Y1crDWso1pcN7IB7SYvwJ5m+aEnAG3+g8ONbkYa6FlJrVXLsA2V35T/f4PTa1UrR6tEyzTGgArY+ru9NIbiARIGo2TjrooPNqO3eK6pek8LqZe0OwExFu/deYQ62/yJzh+DUi9ojGO4VGnHUxrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447668; c=relaxed/simple;
	bh=NN72aqjpwJSv2irviEDiSUqnOMzC4st1teZcnfhIUJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zbjzai8Et/yNT7all3guU/4XoB//Na9ghKUl6PWPzn+IYUwi4a30gLf5Pn1sBW1PHa3n9IlS9LgiU8eZFC8XG6LkXV3S3hOMpO4qdIYhGjx/piz09qU4LvSlrZd9z97dq7HoExpHP/F7rXyfEzKqEg39gXsu2Z5J9GziW8UOF9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g/bBa63l; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g/bBa63l"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3530561f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jul 2025 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447665; x=1752052465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zmv3tRKIBVq49AP27DBsRvEkqxDC0NdKZdExvK5QdPc=;
        b=g/bBa63lD/jr6iRfDzYLsFEwsb9Dksnzy+gQCdTT3JluZVP8StBAnYHpmzyaLlaktn
         0pkR+aoGn4kxpAIZaLJaswAKVkEESQDR2k1PKQS2CTjITRb3EfPFRvAesnunaGkmG6if
         Tffs+uCl4Lcp6Ti59LkwGVHNqQhDXhKNqJ+fQZMyX+dnHOQzwqNb4+3ixg0CnhKgP65P
         ul5Y0g8zUy99e231hoiEYKR3XQHLZ6MrpD8r0BNhc93LrDlsk79it6I4mMhrpDXDV0ad
         PHXUx2Er89zMRCiZGNNe2gM3Kc3q22ksIZV6onkNXCgwdPWCHtJzf+nNzEgjefX3AerQ
         T8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447665; x=1752052465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zmv3tRKIBVq49AP27DBsRvEkqxDC0NdKZdExvK5QdPc=;
        b=VTwhm4TA7b894Q4P09RmNMCTdPZYBW7E0akVT4T4V6oprkCg7ytrbEu0vKGVus7UPy
         V/hPGw5t5bZWp0Wi4PVKxgcMiXCNkiKrITQNSyNyKiI7DY33wckiitLNuP9vUyrOkGeL
         MLlSh0zmVVqDkvEkUkMiClYgwI4t82SZahCLuGX9Eu0yzaWhejEBKWoSisWAqh9Kys5o
         OkkNL1KXIKocMJ4AxDTqvQCbOI9eDk39/pB+UoBoSv6dlkOggX3a317xRr2CJV5Q3ptL
         f13pJqSE7VVx7bHe8ez8YQxnTfnhEctHRISPh3oGXHetDqpR5sKsgz0BWs4vlBpEpZDV
         A1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWBrce3Q6ysW0k7lP5uQYejEiXlSO2z0xVV4gwvcspAX+FSDo7JMPOqxR29KwVHKDEmUExEcHyr1/2KRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycqaZEIJeRTRVqmdm0RlYcu8dCyDcv+x3Ubc0yk7AMvtlKaFQX
	8Za+mOSZZT6bVsF/J9Y+Mukk69NxYOdrRiwD/58+OvL3iTUkK/u2ZuPTjfFfHs+SSCU=
X-Gm-Gg: ASbGncs+m7khJlfFAHmVjv6nT469Iz8gVy2XDbdGcPAHWM1sg6Us4ZoMlDMol2qs9wa
	aWXD15iAM5UUkBFF0H7NgCSOb0axAU0fMwnK+C0RP1C66+lLgUb+3HJpz+AhELuYCYR3RLG/K47
	dksqNzqaiQCrv2vCo3uIJnwXVJrR5eSL4o+Ab7Nz1cIMIkIgyQkkp5pSUdlFCCeLHGR76zy/0RM
	5Hrm48Eek9j5rJsRlOxCmt/k/xepCLUfYpyVaimpLQGuvURZpJybKNyj2w+E+PeoXPYGJJkzxhE
	PENCpr+2VgfDk2I5BDnqcmCEWpR3nMlNOzs0eOKZPDgB0jhUdfwF9g==
X-Google-Smtp-Source: AGHT+IGTmm4jTikwN2VGwBNAxx51rzCBt9ao4TX3exq/7NZm6Hiin2DGw8Q7fWQBOSkwwMPNJ/w3zw==
X-Received: by 2002:a05:6000:2509:b0:3a4:f7ae:77ca with SMTP id ffacd0b85a97d-3b1fdc20aa1mr1411408f8f.3.1751447664576;
        Wed, 02 Jul 2025 02:14:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:13 +0200
Subject: [PATCH 12/12] gpio: tps6586x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-12-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dzEZyQb/TffciTBuglIB85TDIVsqFc54rkSmHofFPX8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhhtYULyctCIg0hBfEEWvehjyvTXWYFEXCBG
 SErYwBkd42JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YQAKCRARpy6gFHHX
 cjVFEACPDNGwDFvzi5UCZgFldPon9+X/rScnJUb2vh/WsnJHJyD/0LaFIwkAQtbCOo1CqKXzY75
 D6wnIjv5S7bEKT2CTsx1I2Z8T+Sn7pBZ82Kmz33kLiX6cKNG2ghc7Vxmy1T66bOQIQNQZ3UgURT
 s5YaykSkWDjUQOv//cCjbByPlw8IpEo3oVT6a6hpZSO1AsmWzBTRfv1l1JxAWexfPzwqBLJg8fb
 DGCEXceEl5X6LtC2WvCRbtUQDGNf9qcM2XFLIvYANLs1LFw8VVfmPN44DlwBxbACf2G/Ig5Btlz
 tblCQgh2mbB8V/O9UmbJ60UmJ5iEb/Z2rG8GoIYr10rxm/yGz1A1z6VFH06Uepa1UPkjqQQyHXn
 kYFjn1grhI6OzTB7nUqKd8+ktUppIJBeaPAB7yoU11sr96MdVvBopa2syhHl7EI6RVdc6QmCwxl
 I9UVisYsVV9WOHJCCmE7xrSOBM1ySQMdrHFZpDJcxoWV+W7iuMwKVe05/2zXzgcM2nLZEfL/ISC
 eigHTL3e+d7vFQidKXf2qWeEz09CdSozw/8fhwUg2HwIu/9EyLrw3bNlJ3CN2iqlUTQ/PeYoegZ
 YQj2GmsteV+0fJm3FWKKc7FdD3dlU25KwVEsfqD8jQicxUcPJ4Mn8cTvqexel3TncXL9NSIkmBG
 YNjyg562TerE/NA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps6586x.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps6586x.c b/drivers/gpio/gpio-tps6586x.c
index d277aa951143ccf9560bd77d461786f120e46a52..f1ced092f38a5e491378fec2d80dcc1eb1182cbd 100644
--- a/drivers/gpio/gpio-tps6586x.c
+++ b/drivers/gpio/gpio-tps6586x.c
@@ -40,13 +40,13 @@ static int tps6586x_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & (1 << offset));
 }
 
-static void tps6586x_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps6586x_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 
-	tps6586x_update(tps6586x_gpio->parent, TPS6586X_GPIOSET2,
-			value << offset, 1 << offset);
+	return tps6586x_update(tps6586x_gpio->parent, TPS6586X_GPIOSET2,
+			       value << offset, 1 << offset);
 }
 
 static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
@@ -54,8 +54,11 @@ static int tps6586x_gpio_output(struct gpio_chip *gc, unsigned offset,
 {
 	struct tps6586x_gpio *tps6586x_gpio = gpiochip_get_data(gc);
 	uint8_t val, mask;
+	int ret;
 
-	tps6586x_gpio_set(gc, offset, value);
+	ret = tps6586x_gpio_set(gc, offset, value);
+	if (ret)
+		return ret;
 
 	val = 0x1 << (offset * 2);
 	mask = 0x3 << (offset * 2);
@@ -95,7 +98,7 @@ static int tps6586x_gpio_probe(struct platform_device *pdev)
 
 	/* FIXME: add handling of GPIOs as dedicated inputs */
 	tps6586x_gpio->gpio_chip.direction_output = tps6586x_gpio_output;
-	tps6586x_gpio->gpio_chip.set	= tps6586x_gpio_set;
+	tps6586x_gpio->gpio_chip.set_rv	= tps6586x_gpio_set;
 	tps6586x_gpio->gpio_chip.get	= tps6586x_gpio_get;
 	tps6586x_gpio->gpio_chip.to_irq	= tps6586x_gpio_to_irq;
 

-- 
2.48.1

