Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B624DD1E
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447665; cv=none; b=iYr8xueeH91oETJNqidWf/zyk3UvQi2qQXs0C0snCowymIJxFZv9wPzj5Ix0zuzyreU5opwoCrQTnHSAguC2rLiHvDI48imnHnu3uBzZj5ucojtRO7QmkowDQg1sJZOdRv+nkTDc7m0J1s1Awxc7ekrWqMalYF9BruoA0z2dC90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447665; c=relaxed/simple;
	bh=RkJAhHI9guhFeGcgAo0p+bb9aQhe35Qaf3tHDdTBIcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FICcs6zD7qFFX0/xkcBSW4zKYshxQWBxdVWxjlXXcBCbY2wBJXXVIXuhw0Af3fe/vOu+VOrnc59PDLkXFHsFxQczbybWGbXVs6QKO9ZNxTzBY9AqUdP/2WMsIlIWOPGgP2Wo/IYlTh6UHqCZdwTKy+Rpbx0jQjjEbR/hK5SrdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OQsQnP4K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OQsQnP4K"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso65000515e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jul 2025 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447661; x=1752052461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PbvP7ii94AY3d065syIHwar8NBZworl3T0ee2JlaVU=;
        b=OQsQnP4KRRNHT+M7psK8vg7yyPO3Ldg62k9zn96bFhn2EPQ8CcARz5631zKTir3I/e
         lITguTP2coD4pQ2cbg4AvQN+rhFskUgCDzVlOAh0aT8BnJ74vjUOcmj0aIPipp6ftwE+
         LZBda/rEJP5amyE9fZV2NhvBMnZmtKMdb3FH3uq2uccX9idtj1E2oCqJ5hgqhiNg20ar
         kr948xlQomhnV3mq1yUnCfzMg3iAuyUTZZSPilpVbAwoJsDFkTh3Clb9lE2MBWzDC0qh
         Si5K7f7+87koN9Usy7A2TtbmLCA5+T/BO2cc8VkKd4328rxqwh4yy9oUOLJNUJv6QcMM
         Go9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447661; x=1752052461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PbvP7ii94AY3d065syIHwar8NBZworl3T0ee2JlaVU=;
        b=OWQVSJ68Pkh7whktOy3sm5CIy8IW1SVgiU3ccM6mRJ4aDoFXWREwY6+w6OnzoBZ7n0
         bQ2geh5PnsdG5bY68RLfv6REwEirnXQ+0/tQotcJMfl7pHBALUulhkMhXTex8j+8rx3y
         lCpR7GzkA5WyQuARzea79UD+2rpILSKy7aD2ehYeY3IQmF9azdQUwWxkRU6m4HFOJDF8
         y6OLeiLZXFfshprTy+ONwLLldM5AEVcrYL4WetoEHYOvd+vhMdIdxftuFk58iLAVFkU7
         QNgLqEx2YCFBcwXStMVEpMe6LFQDLB36gERBosImGfi0YRoY3wtbNks1EELB3MXVFrml
         VVJw==
X-Forwarded-Encrypted: i=1; AJvYcCXgC+j5Cb73GCi7+RFREEy/i9evGpdoWuePsUyFRriHvsFk7gc3Yvntk7jcts64zNF34C828lYkZDiFBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWZBJIumy3d/saryFeYeqxeYHF3FkwiW4oU+1R4ET01myBlC8V
	Fpr7Mwbm24J/WwOha2p0eESThYkorIJIQOQiTMbUzKzRILLW1s9f4CCaA6pUQgIwM2E=
X-Gm-Gg: ASbGncsmvmah6fMK5c3EbWmoV3r6iTuQcZxYrSVdgObehvYElK8Xj4NzTRO3QX6Rczm
	o6zBjfk3bgE/xgSZ39vtMJtPj2Fw4TeOlDVslok27SrG12nQR/gfQryVYvTpBVQ0RXeU5UdVMTC
	2em8HZ4+m2FIw1VUXhHfNObJrIsBqCi/ZnBprxxlJCOyPlVMS1QpWf3RnDAc0sdCwD8+a74aswF
	Qgy5LviT98+TcTMmc1fwtQgXAk4xuL+zGwXomupWrC6l6jD13zXCppdEItDzPYgWkvNO7W3MRLd
	KPZUS2Awf+0r0TykxI1FTRCdoEAt06Cs47tZZSXdi9WxZxNPhikqaA==
X-Google-Smtp-Source: AGHT+IGsbQpNGpsWwygDJDy3w5MbAg5foRLDcgsBAjfS4y6V4+H+CNdcJLnsDTe/iGDKUgTVRhzcmA==
X-Received: by 2002:a05:600c:c109:b0:441:a715:664a with SMTP id 5b1f17b1804b1-454a3a4b4c1mr11962395e9.20.1751447661251;
        Wed, 02 Jul 2025 02:14:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:10 +0200
Subject: [PATCH 09/12] gpio: tps65218: remove unneeded callbacks
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-9-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zWboDg3N5zb2XaEN8szzzSbn3MNGMgClzlNJIPkFkw0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhh62c0BZgIE/W4nLb0zSNR0o9OQNiyi80Tk
 T9Q+te1SxeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YQAKCRARpy6gFHHX
 cmhoEADSugLmkmZIlBjfyk6OsGwx0kWZkz3LDtgzG7vF4qCBoUG4qyO1UbUJDB10WokBoagJCGD
 2e7Z+XEcLJ6lar/VXAkUrVFYRMu8W0MyMZsExZ6QTuPNBF+b9+1B/umRU6CUTi685wEFahmg9Uk
 yNSKWLWOvz2DOZ/6ajvV/LQIzGe05CIFyAVAeDxwN2zE89jtNZuiCNfeFhhE6caIGxM865QUKH5
 4ssfYViRBXxJ1Rl9aVjBLbWUIX6n6ZxWxBbT9i6xpDV5RGzKQDQgcWqQTrRwjuJ099eJUqyRkFD
 qCYveWbmcA/hr/iiM5dOx3ZFT3B11TVZmfeggQrSAUSar5dtZKrEzhE2sGyPls8GwK/u++b2PK9
 v5mzQyRNmFd6Pa1Nnt7NrGu5mAKUCFLAJDW/Vj1tPM8M3tYVVG9tqJEby5I1TjslidTtLIVDnsm
 bh/ItfgNTqBzXh/2RB7MmPYLN92Ml3OkUiGu0rpBH9P7ALFYBY0b9OJ7khmI9xARo7XlncCCQDm
 CrC4FpK4vx/HhQcRDnFNAMjMASQ8oW6+bIppzr4q8ntbz7M2RUUOmKkS+lZBadAc7iDrelqQ2v/
 NGCYVWUUQG63xkfeQ23Ewj/KhqyAmLBhMeGWn/5N7bZV9gsLfUuo04zHZyoL4nu1ILRZiWB0Ymu
 3IXsWxrJhSVu+TQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core can handle output-only chips that don't implement the get()
and direction_input() callbacks. There's no need to provide dummy
implementation of the latter in the driver so drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65218.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index d7d9d50dcddf432c0825246d8ff54a5c980b0ae4..68e4f0a19f4eb945b33e5992fdf30a29a40bfc1e 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -59,11 +59,6 @@ static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
 	return 0;
 }
 
-static int tps65218_gpio_input(struct gpio_chip *gc, unsigned offset)
-{
-	return -EPERM;
-}
-
 static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
@@ -174,7 +169,6 @@ static const struct gpio_chip template_chip = {
 	.owner			= THIS_MODULE,
 	.request		= tps65218_gpio_request,
 	.direction_output	= tps65218_gpio_output,
-	.direction_input	= tps65218_gpio_input,
 	.get			= tps65218_gpio_get,
 	.set			= tps65218_gpio_set,
 	.set_config		= tps65218_gpio_set_config,

-- 
2.48.1

