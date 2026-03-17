Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDC3AA1A9
	for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748926; cv=none; b=aaIE/Vqrcc1ze6ebj6aOAqE0a8Pu7M6yI5ltuFC5MwVi6H0oFQcWpnhBQMaOsYrsXcRNXGclXFMOpIxDbm9vcf6TdPL2sH4Wk9RxepzdiDvGoJLitcqwn1kKsTdzOE7rS9E22NCzQ21aoQu6gSNtIBNonLKLU0Bk3mieTJorDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748926; c=relaxed/simple;
	bh=11DAw/kCHF17HiipkU5IJW6HjqTUMPDE8q8+zAIblH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ty+VG919AhNO1GenuWRo5hmzAZu8MTtmK0rBsEiy4U2xc7kn8fBnddYs0HfkxieZzP+Xv21sOug+CBg9Z1qkRHfW1aIyXzt0Zg5etzQ5FGYLx0ngsQfe6PiYSf+pUmqsNsHPw4cx2oemJ1yed+Dqf4juLgV0/aRaGTWm4QfxE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIYKCFlz; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIYKCFlz"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-67ba6e63922so3316759eaf.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 05:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773748922; x=1774353722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4U3swru7TEkDA3qT2+EBKpTQ2Rmhos3NsgOvV3Hu4Q=;
        b=jIYKCFlzXY0sJx7lrKWwa6ZL3qI7tdYINspk6xrrSFX8FaYsCqIPcY6fQXVTP3rG87
         hPHCRIJtoXV0uQfwtqrNqpacu4vQiY46mXEH0+VbwHHTs7CJY6sWOO1xasm9H8tPQr0O
         0ZqaMNFfvdOhi6ygwth0Ivr4oV7rO6NB2ZACzueUbpOLHldCc/jAI0/KoJzvjAiNYj2y
         VDsv8l1qWA/f70TksPP7lRn3CtpQafWaX7SPrlUN0QVEwNYL3uJL/JoD5Z32u63dOdIS
         g9Tbml3Ne5dNjhlDnZCLTz+00xpbJHk/JeWHztcxUEPx/f8UByKzl/W7ZSXR0pvRrvxJ
         lb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773748922; x=1774353722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4U3swru7TEkDA3qT2+EBKpTQ2Rmhos3NsgOvV3Hu4Q=;
        b=U4JAdU4zyS2zQLVZnxL2C6LBV8oksKLjbd7AgRvng7qgXm8scvIt4eeNeCd4vvDiqU
         08nNI7MRqNYf+Xdwy56h8ox1njgXVw7hw0VAzsJuzAkmkxjsvlvs/pATc1WZSno7QzU6
         F4RwGOdgIIJxxz/yM87GAI2uTPLmh64+Xjnkn64GRdRYziXgUZNXmKZUOM+YefJSS2Vx
         aWTNUSPrWc9/nE/pKWsEWJimvhFW+IKa/UrKDQEzQ1tHEXkWAQqxdYcX6FinwG8dYJ7Y
         wMSqL+ogyi24qrFTPFAtoal0N03S+Gy4uygNrLyq+jAWXjY9xnCR8vSrOvTBvVWHnzKp
         MiHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6RICopZh0yHoVkX2qFadtBQ7kzZYdA+aa4amvi6jIA3gcGj++vPbjkd3gpq/iaqrPnR72tzfIvrWwRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHev5TFp11NYYjC17dTbkBbGPfR3Ht2tvPcJxzvxBRs1IWejlj
	OgwPsr76Z0Db7yZMxmIgrCZC4KMWTzaRZDHIEWusZzLa1yUDkNj/3ewu
X-Gm-Gg: ATEYQzxKrzlQxAgsTn8g3PY1FAg8lNLDZp9NKDQInwjYd5EuAIlZGZ3O/WLKv6AI6vj
	mHpEGyXH/znyVFc6sW7pchEoq9UUQQsDeu5XMWTjXO4DtMg+R82/sD9TLCpAGm86VjX5F2w3gPU
	YucxlmJEsO0h+bJ2oSf6d9GSs+NrKFXxDNqghG03mLpx35bTTGXgPO/g4qGMWD7VQQnG1LmW1fF
	XTVhyXQ6Ps37x7UUe4T44ajHDD5KGe9FePKHmomh9rPyc8jouKqtkkmbzXF24IAx/GsOoIoXhFq
	UK9neKf+D0Km4XoaFrUEb0kzTdL4FTmRfydTArGJWouKVe9d4XFQ13KAPYRrAfX7aINxX6WHWIq
	CfxY3XYBh5iLQQxKg3US0V/mKsPuc01/JJmJuetnJoEZqeEMZ4Lv3J7KYEDhsFqIJKzkIKc3TEf
	XqeNPWWg1FD5BiAcS5LA==
X-Received: by 2002:a05:6820:220a:b0:67b:f19f:892a with SMTP id 006d021491bc7-67bf19f8b46mr7437748eaf.37.1773748922494;
        Tue, 17 Mar 2026 05:02:02 -0700 (PDT)
Received: from fedora ([187.137.224.200])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67bc8db5156sm11602743eaf.0.2026.03.17.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:02:01 -0700 (PDT)
From: Martin Bojorquez <dihed1973@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Bojorquez <dihed1973@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c
Date: Tue, 17 Mar 2026 05:01:14 -0700
Message-ID: <20260317120114.39057-1-dihed1973@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Block comments should use * on subsequent lines and a trailing */
on a separate line, as required by the kernel coding style.

Signed-off-by: Martin Bojorquez <dihed1973@gmail.com>
---
 drivers/staging/nvec/nvec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index e9af66a08448..0e655f79ea4a 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 			to_send = nvec->tx->data[0];
 			nvec->tx->pos = 1;
 			/* delay ACK due to AP20 HW Bug
-			   do not replace by usleep_range */
+			 * do not replace by usleep_range
+			 */
 			udelay(33);
 		} else if (status == (I2C_SL_IRQ)) {
 			nvec->rx->data[1] = received;
-- 
2.53.0

