Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858813939A0
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098904; cv=none; b=kVy/XS9qpzWjkES9Fwoxe3t3f6Uyp4M+nyW2k0l7n8DzNZD+KY4pC+G092TzRoZZ9PtYAd4wfZkdKz4IF7vjeH17XkMIsqj76hVyYa0yF4PFnzM6uMr4cwx3UKaybrqlBhJ4INwMXiZeigzJwYnf8S6SSp819/9KkbaN4e9a9Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098904; c=relaxed/simple;
	bh=MWbUKB2ezRImDoJVgS2/+wEVlNLF38LUmNJhx9sh7GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQl5mF5VjRWEXnVnBDa4IcTeSW95bty6MxGYyHdkUHnHffld5f7T9MjPbd8dJ8MWF/oCLFVWf45C7B0Qj2ChL5547z+4EETXildLy/TYDEdGNZNRbhxP5G2XnTxtio0jP9fXM7rnP3D7Ngo5ZnS8u2CBO2sc+8qEQuUXZ4IFYeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYCCQJJr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYCCQJJr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso5894053a91.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773098903; x=1773703703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zThsLLueEsXMRUWwQCRT0ylC/fnc8iJ8IJ/w6hvboLo=;
        b=kYCCQJJrpau+WlSNWNvtEUJQIP8deY/OVMDAr3myKg7j9Caj419udngtZUuU3oiowh
         0KkjppEdxBpeHu258CKto2eESaEoIq2Zck8sFCB0xyowGnQwT482LU2bXX5IdYh/+BjL
         Azj6sw9EvGHZQON+9gy4kqMOJshzuHIdNvJ2LW7uIJpSpYuxIU7/m9epfGK+1hENTBY7
         qaPtgXF+ElnUL2MhZCjaJ/Rk3CiLHaGNHfAYSHL++jTWzkrk4IedaNEhScR5SxvUdQIp
         6D6Fp9llhcgsdXPMBcvVtziyHaNr7fLvIo4xsjmqBOyXXjtC4SUwRqpmi81OMnqGRxrE
         BupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773098903; x=1773703703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zThsLLueEsXMRUWwQCRT0ylC/fnc8iJ8IJ/w6hvboLo=;
        b=OLuaQrKnZ2mWqGrpOkivsbu+AwQIfSmoQMsAS6waNzBqP9mf7ELjJiB2szcsoWXW1d
         CgE4qwSn7P0qVyGv4O6mAxiq51mWMBQbjQCJSzzZsbt+oz7w5I/Wn2yNn4VgGc0SR0bS
         FGEh+sBIl4XK+V13Uo3T+kTYvB39rbmwKvL4OOoQvypMj50Tu4551wZdFpDj15SOW+LA
         J2672/xpFIKKfOuU+MzpHmIXK99OLvzGruYCVNO2d+JifvfSMDnImrIB8sKtOiVT5J/P
         BQDFWIqZf6pli19sy9TF09e8Tzq6U8+w2i/Uj5vaNR11qM1JfZynghmxzB/atYzvpPSf
         dJTg==
X-Forwarded-Encrypted: i=1; AJvYcCW9DbylShRAJ9wXA7ft/QFmiazn4+xwhTK2mR0aY1jT0fNeyZDcxc0BQqEIlwmT543nYTayZ4iejkNpcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybqC3jmjwRD3Suu1c7jxlJQN/GusGP0FhWuJjwj94lkvjZE5z7
	l4lmY3n6eyERIeaamB48uWAiu0RmpbBOdy7CVaq8u0qM26XOjpbq8ceKdnpT7IKaxOk=
X-Gm-Gg: ATEYQzxHM8S4+6qrfn7/ew/RBkQdBJX/G+aDtW5+xbSx9TlJbzh2WTywjWKWjErgAYW
	VbYuqeYLmK+4n0YgIKcfk23Oy7vgtG2dEQffmJuyUsfAOkDEDT11pgiGcvhsOu2WUVE2j3XO4YL
	X9FqBDcufPC65mc4PHS7p+kQiIiL1OJNXNNNoqLqoEdZmiq47msRmRnJk5XMB/DoSgzFwRqy26A
	BTrIexBWTgAHWLGpy9aalharX+A5JaYQMppcI3z32Z+PzDcP6jgOh7f3tW6IrbA1/z5Ssx2G70L
	UdJZ4Bui3jXYKeeX2WSzIhd00x8EdfSAhgFqWAlgMkSzhGgdER6kYAE7Vrlf/IMb1Q1zZ93y5gm
	xXiY4kRJOPbS7Ew80vBjqrPhRxnzub5RxX77BauoJp2fS2UGTDUcfZLvAQwSEbeu/oCa54Z+oGR
	2rVpgh1ZgaZFcvt0+StlyCH6yQAxePBbIVbXPfGZzsJcjpHQRsBXUSOA==
X-Received: by 2002:a17:903:ac4:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2ae824dd11dmr127212465ad.27.1773098902876;
        Mon, 09 Mar 2026 16:28:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f9678fsm130423725ad.68.2026.03.09.16.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:28:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: tegra186: allocate irqs with the main struct
Date: Mon,  9 Mar 2026 16:28:04 -0700
Message-ID: <20260309232804.331882-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an extra kcalloc call by using a flexible array member.

Add __counted_by for extra runtime analysis.

Assign counting variable immediately after allocation as required by
__counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-tegra186.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index fb26402b6c47..aa7c3e44234f 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -125,7 +125,6 @@ struct tegra_gpio_soc {
 struct tegra_gpio {
 	struct gpio_chip gpio;
 	unsigned int num_irq;
-	unsigned int *irq;
 
 	const struct tegra_gpio_soc *soc;
 	unsigned int num_irqs_per_bank;
@@ -133,6 +132,8 @@ struct tegra_gpio {
 
 	void __iomem *secure;
 	void __iomem *base;
+
+	unsigned int irq[] __counted_by(num_irq);
 };
 
 static const struct tegra_gpio_port *
@@ -859,10 +860,16 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	char **names;
 	int node, err;
 
-	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
+	err = platform_irq_count(pdev);
+	if (err < 0)
+		return err;
+
+	gpio = devm_kzalloc(&pdev->dev, struct_size(gpio, irq, err), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;
 
+	gpio->num_irq = err;
+
 	gpio->soc = device_get_match_data(&pdev->dev);
 	gpio->gpio.label = gpio->soc->name;
 	gpio->gpio.parent = &pdev->dev;
@@ -889,21 +896,10 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-	err = platform_irq_count(pdev);
-	if (err < 0)
-		return err;
-
-	gpio->num_irq = err;
-
 	err = tegra186_gpio_irqs_per_bank(gpio);
 	if (err < 0)
 		return err;
 
-	gpio->irq = devm_kcalloc(&pdev->dev, gpio->num_irq, sizeof(*gpio->irq),
-				 GFP_KERNEL);
-	if (!gpio->irq)
-		return -ENOMEM;
-
 	for (i = 0; i < gpio->num_irq; i++) {
 		err = platform_get_irq(pdev, i);
 		if (err < 0)
-- 
2.53.0

