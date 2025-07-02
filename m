Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ECE253B52
	for <linux-tegra@vger.kernel.org>; Wed,  2 Jul 2025 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447667; cv=none; b=bzuL5AWgbHH/wshF2agI/9OiENG1p9Xy6dqPEce8OF/mcqK7C9ulIfCxIGrAgAWnuw8X1ZPQEcweWYYh2MAi6e8LoWMXFvLjb/tpf45WJCHtlfQz1ovg6dBe+CFcGRvYiR0AHvVj9zo57R4pYabNgyMIBV6pEK6gm808dQFWZ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447667; c=relaxed/simple;
	bh=DguSM7EjLtrwVpT0x9yjX3iDCS5eIB2Mafki1V+bITE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TktmS/hRJgBlpFoBqBL+yP6vozVKzCF5o/yWZbbu9Oe0At3aBWH9yfjJ6HpeJm89yI6qPSymEJeSxzRNp+xTUZLTkiURVVy+7z266yG/w2TK7yWUNd1iaecziPcwzNX1QbluzignknV5ldVHbE7vQBFY8Uv53T4YKRt4IhphftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=deGiJ0Wn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="deGiJ0Wn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3791636f8f.2
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jul 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447662; x=1752052462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpx2zRD2zETOgoqOp3qUcnPAf5yA0X9HjvfLuJL1NY0=;
        b=deGiJ0WnYhydWqGGsIG5V/SWs4qWXLsGJb6XlikUry/llBeFnpLRnylo26yJ1a5M5A
         /FjVI87Z2YMqiDO4gSMSuaM6+PyPP37rHibMtBkEF8jWkzd+4DsXmb39qNzcVB1kVUCA
         r1cLroc0hhbv3JVEXnr8kZAo/FntXqNW6GnaOoobIZ/GiXEvW7NST/tx+mZoV69P7gmq
         D7j3dPHVXQlBIaZVggB9L3GyW+zXzXY+XqDAeYJhpNq9JKns33DJ7GPJ6TXPw4+Rgxk4
         eLZkPYaweqbkeE7J1fU7iftNOVs4gkHcjs4zCaZO/5EnVLazr+R2BTnduC3P3DiOjtuj
         hODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447662; x=1752052462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpx2zRD2zETOgoqOp3qUcnPAf5yA0X9HjvfLuJL1NY0=;
        b=E+RcupITYSQ23M8OacPAexqnWc4/cawqRMFqhxXl7lwXs0mAiUl01vzmIUgiWrfdTV
         8BUBjLJZAcq93tg57RygSzTN/WlV2i0qz0Lwk3oXRnk6IPy3pa3cxu2FjICyxzT3Mokm
         63jxBV+Yw/naQmcjNJ0uI33V8Kx2IE/oAKWydAWwtB9BPc+KMN7Y3nu8ji+QQR9fvzgk
         ei3UwGWcEDlrlFMCWkZ0cc7V0DvpkI0qGsUapb2KM8w+Iqdk0G2+ZEtE6DuhLP0dULbj
         bmIjfTtADWPf4Fehz7kQM9LBlLQe2kGvID8VwE4Y7W+8dueEHuNVjpPrd+iuP2jEWe2/
         xz/A==
X-Forwarded-Encrypted: i=1; AJvYcCXdvXtVaM/av8aPo/gkqL+tTuhS4PXKlg9FihAvjHqgyV1iNOwoWR85pSxp33dbqlZRoe/ZYZDXEsHVWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPfu1MoNcCCisSXQoaZ64gx1JztMwxJEWfzozWATwnFfZtvn05
	PVlIb1HAmScJQBMwlH5TILZf4mJQybG1AmVZkPdcq24sUSvVzLOzEnNwK2HTghvtE34=
X-Gm-Gg: ASbGncvI38adf6iOYgHJ02RdRMeY+4hV+ysEvYTOZuwNp3AcFytVz47mpRo/8nr0BPE
	C1+QEjHPHhSwr0jGn6mjwfxD3NkqBy01uhCLk8/sx7MbVrrUOxxG4FnUYHMTq9EKqPFvhhB9hEe
	fHxKkLLhbUaqZYVKC076/NaCzkEVfGFeiSzZR14auN91WAi6CBRtNTIP9OYC3BGwvDfEjC6INaG
	Xptb8nI22oVoo+YFEFfGrGQlOYYwjy/CEVaiANJ9sI/TJSGdDfaSqK13vgD7nimaYBoBK50UeLH
	W1AjhARW9PsbTCtisCHuYX3BMlEWNzqzenzQJwVuQqp8aNzI0LXhIhTMg/jg2gyW
X-Google-Smtp-Source: AGHT+IGVlrwZBWWDYlC/97CvbiHdRC8yezOYirmKDD5NIJ7Sc5+XMfy9yrxtEVYeo1wrlkHfZ9kXzQ==
X-Received: by 2002:a5d:5c12:0:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3b1fd74c02cmr1405354f8f.6.1751447662245;
        Wed, 02 Jul 2025 02:14:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 11:14:11 +0200
Subject: [PATCH 10/12] gpio: tps65218: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-10-0d23be74f71d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Kj1Uc078M3RGsYFWnX/pxEd96G+25cnoGzALzF84Zao=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhhiaZaWrELXTwJFn30XUF5omE+BRuB2Etak
 C24B5i59vGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4YQAKCRARpy6gFHHX
 cpa0EADcu4X3M7EjtlErW4yrfl3kbML5suesL9nYnC7QAOJ2pjROvgvkpbErlcxBLY1LLejY0PI
 6RCNZ4qhb/Xnxyfa/NIdW1eNSapxwp7bXQ77oeVzl2SXfaA81rsPG7W6utSW/pd2p3iw8d6vSa5
 +JdGW3NbP96Rc7Uh8jyhKvXwHx3Om/C6SV5i1JU0i4Zov9uV7i/KvtTBG0CRr8mDe5iZekQoS23
 YxdZ9l1K5NfUXokCr1W7M48LiAi29DYuZTydb4rupaSDpX4z+clv8rNpZOFJ8CbZ+Wx/U5s8nKo
 JLPogSlkKEs2OezM8zQDypAejrgdZQnmVEMuF0ASzlghXQ7BIVv2mLKSkpiN8lxx2S78eNWPdtF
 AFz4WtbJO0F53M/sUkCX6MedGyNZuZXwTCPr3oJ3ufpfaBmWO7ijwibvW5oLo/hJplJq/SVLYsy
 qzBQt7ju4HHRvQNeoMe8I2754EYNiWcyZuDbjxBdDtEq+1p68k9rbTnDf8uWQg5E6dRY4iMMUKk
 J5ycZ2EUp+QJVndO/iCk1MWW8FtKRQBStObnZ2z3+MYZCVDgBZccjlEH06/QcyxJq0JpcqvTPKk
 vsd7wirRNBst7l6HEsJVXqW/OVYYtKTQstoQw7AoExOgJAAJ+ef5M7MM3ERljiU0m7CwbhY3cJ9
 clwtEVGfiY9g8Rw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tps65218.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tps65218.c b/drivers/gpio/gpio-tps65218.c
index 68e4f0a19f4eb945b33e5992fdf30a29a40bfc1e..49cd7754ed053bcdbf25a4e51e227287257a5f03 100644
--- a/drivers/gpio/gpio-tps65218.c
+++ b/drivers/gpio/gpio-tps65218.c
@@ -34,29 +34,28 @@ static int tps65218_gpio_get(struct gpio_chip *gc, unsigned offset)
 	return !!(val & (TPS65218_ENABLE2_GPIO1 << offset));
 }
 
-static void tps65218_gpio_set(struct gpio_chip *gc, unsigned offset,
-			      int value)
+static int tps65218_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			     int value)
 {
 	struct tps65218_gpio *tps65218_gpio = gpiochip_get_data(gc);
 	struct tps65218 *tps65218 = tps65218_gpio->tps65218;
 
 	if (value)
-		tps65218_set_bits(tps65218, TPS65218_REG_ENABLE2,
-				  TPS65218_ENABLE2_GPIO1 << offset,
-				  TPS65218_ENABLE2_GPIO1 << offset,
-				  TPS65218_PROTECT_L1);
-	else
-		tps65218_clear_bits(tps65218, TPS65218_REG_ENABLE2,
-				    TPS65218_ENABLE2_GPIO1 << offset,
-				    TPS65218_PROTECT_L1);
+		return tps65218_set_bits(tps65218, TPS65218_REG_ENABLE2,
+					 TPS65218_ENABLE2_GPIO1 << offset,
+					 TPS65218_ENABLE2_GPIO1 << offset,
+					 TPS65218_PROTECT_L1);
+
+	return tps65218_clear_bits(tps65218, TPS65218_REG_ENABLE2,
+				   TPS65218_ENABLE2_GPIO1 << offset,
+				   TPS65218_PROTECT_L1);
 }
 
 static int tps65218_gpio_output(struct gpio_chip *gc, unsigned offset,
 				int value)
 {
 	/* Only drives GPOs */
-	tps65218_gpio_set(gc, offset, value);
-	return 0;
+	return tps65218_gpio_set(gc, offset, value);
 }
 
 static int tps65218_gpio_request(struct gpio_chip *gc, unsigned offset)
@@ -170,7 +169,7 @@ static const struct gpio_chip template_chip = {
 	.request		= tps65218_gpio_request,
 	.direction_output	= tps65218_gpio_output,
 	.get			= tps65218_gpio_get,
-	.set			= tps65218_gpio_set,
+	.set_rv			= tps65218_gpio_set,
 	.set_config		= tps65218_gpio_set_config,
 	.can_sleep		= true,
 	.ngpio			= 3,

-- 
2.48.1

