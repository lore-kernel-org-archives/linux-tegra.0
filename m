Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254481;
	b=si6Pz8A+2n9rPA9iBmvkX+BrnM7FtH7/Ci7M9eXI3lZjznIhoXTq/xiYW98f/vkJdO5D
	 KGbqMSbLBXYwqFSH6g2Sjsc/D6+xsjV/d0LkS8niokXxrzHsRXS2rh2co60g05RVJ6zIp
	 Swf/Ot5qX58xlLR8kyPjjtrbNG8aAKdFUuM6QO++tnngIUbbeUsZpPh4UZuaqFDV4EWhH
	 bs8KHnAK/RptgNUfFk4235ldlZkpL50ZAKY8gJNifIBGZ2AkrsQfFR1cPQ7lx8iYx+rud
	 vO7zH4lJLkxKBMXNP0MyDQYsdsHcKIDTJUn0YHVnVa2gB0vyZw3ruvDiFq6tzyRU9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ivEqINlh7ZkJrAoGIP7Qk/ck2w+8V1ulipYhp9Ae/DE=;
	b=mMgecLqH3p71lW20PXv0F23qJr8mBGNDJO9fWA9wuIm8BRowVLiMNBpZ04X8EylyZlBc
	 rkEvW5b3LVhMKzCUQ75xP7RG4gJQwBrYPrpADorJzSt5YxwsSPLq0qiYKlx/9gMhO5SYW
	 u7b8JpKtaOAuD8W1TZK3M7tRe0gszvVeK3l0cuA2TYflaUNf2fNvPbW0tPRCTxQdtkct/
	 b56o62Em5r9m1U4PCTAb7yspfdnOxf/AnG8p6BN2ObJWeFN8CwB05rcVpouvBK8YsO9Es
	 PMaWbzg0Nhiv/2QWazfiN0jeAqqX+Ihb0i14imV/VPkUzmM+HrZFxWK1Sl8J7WkbSSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwY+C7Rw;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F652606A31C
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 06:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F652606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwY+C7Rw
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so995152f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 28 Oct 2026 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793254479; x=1793859279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivEqINlh7ZkJrAoGIP7Qk/ck2w+8V1ulipYhp9Ae/DE=;
        b=LwY+C7RwjoAzSYAQqJJgoj7sJsD3GVBFQOiYIFCE69SQJxXZDaHHi37eO1pT6YYceZ
         vZxTMok1DXPfg10dfo33wGjKI7pivZrg89y17+t08DgkvDVShpi05v4gkmKk14fkA9oJ
         oeQIB/1RHXZP979uSUjNX6IPjavD33d/9VzVW5Yh4jh7gOvyJw1qkcVlj7ABAl74DCJJ
         kNoeyfQdp+3kieiHvy6oYTJYbhkW/XLJYATNI40WiHmm5fc3pVAgsy1wwBSIS2COhmk/
         aC77OBQ0ZARdYK+gR8n/QBScxxVuRDZViItMPooS9pdl4YQYsxWp+7DuINUVGmFUrsIK
         67cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254479; x=1793859279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivEqINlh7ZkJrAoGIP7Qk/ck2w+8V1ulipYhp9Ae/DE=;
        b=LU5v5JbIjMdht5XKbvT8GtZAW/DCW/UO7gVPVAU3U3UU9gXdTyNxorDmBMtZy1YXxI
         a6dbkymQrrtdyqMv4DrvZ50j8nkeZnN5IcQlkXAS7TTupphOTy7KMJrzAsOWwPm3uYKi
         7737YUGe7F2HQErTPsanTjF1xb/blHkLwwN9D0PHLFTbXuKLBSvFvXrjDoYw5Wb/J9WH
         abkTe7VgyxAX/0iuQTHgIah5DethGCi1aRBJRI2Q9bNPmWy18b/etq9idoKPLd/Oe1Ty
         Jf6UCQFTldzA+pdT7yvxXiTxSqM2eD2xLY1qSEyZMrYgGXimow3rLYX7IMmsogsoZ+K1
         4Ulg==
X-Forwarded-Encrypted: i=1; AKwUvBzHOuNKbji3lroPFJO8Md0CzRn7zD/wkqkqO5o3b3AUiqayeAShgHpi6wKncYfvBr1BmeL+xRDPvSBdow==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmqU5gUfl5vqcro1A+8Ohy7JBwqXOIxJUoWxtZWnJJdH7uhqgt
	BLxJxuK7AYERy8wVh+pbZylAKlKkuU7UeC7HJeaYTLWL7FFHe3kt8ZmN
X-Gm-Gg: AYBFou3L7kfPGvzqCDNWRC3VFzhryATi4adGm4ly1Az9QdaQvisTaSjr5jyMykjtCyF
	Ql2IDUcEwN9ceDK2/1UChL13Tainh1W/2Gcw17MtAhRJnpcrr6sSV1rGlNLojrl/wXPpOCUxZgT
	ixKI3BJM56fYiuKg25r0oIpaEO4Lwk+PshX0RzmzcdUaZ7ALtjC8JOeXZPE13KwDFhNc5rmpzzp
	ZQC/NsUiK3QYvA8Nm4x1+RnHLvqMDJUySbieJUiUOsjWKrPMVYzO62IG9xtPoJcgLiYBhSYwZVF
	307Kn0oX97XM+zomFFjdYm0aqhwLSmH6eSfuBaLawTrpu+VEniEVFCvgFg50lX/yHGHk1nRW4yW
	rabYF4Diz9LEu/ji5sf95Q/sGJbZT9NB+fNDQvNsirKrat0Zws0oeFjk7eSFh1f152N8QeyOu2j
	HG+XbhD+zIjvYZL2x9bRqJoHJbrZgJ2F3ihFs8Qdyi59P6jGEpQ4fteQEqJCQ6pgeZYub4AApX+
	jlV8j6IJZuT8AXZQ8AXiyanEL6VXvAvfUoQ2Nxwx+D+GbCXngZDcv3axnqR4jV7QuPHamADJA7i
	efGfl6tIPJTGfuqo3Jbvm3RoW+0elOuqTuzS5+DaKgnle3iy8LCRjrqIm6jhYAC5QZV+OjotRwF
	kqWuJby+DrtYY0QoJpFBgIFc61KzBD6E/2fNwjN6g6YMDObHvl4/bYKY6Tn7X2/VAA+LFfijkJR
	gwdOtTvf5BmV5HobeAo+ppjYfRaKhu2xKC6VrGCPP2ccz6ILO1YP+X
X-Received: by 2002:a05:6000:160e:b0:48e:888:36b4 with SMTP id ffacd0b85a97d-48e5d5c3867mr7911286f8f.9.1793254479252;
        Wed, 28 Oct 2026 23:14:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aead-eb01-e474-b637-02f8-0d63.310.pool.telefonica.de. [2a02:3100:aead:eb01:e474:b637:2f8:d63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm32614741f8f.25.2026.10.28.23.14.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 23:14:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Yi Yang <yiyang13@huawei.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 5.10.y] serial: tegra: Add missing clk_disable_unprepare() in tegra_uart_hw_init()
Date: Thu, 29 Oct 2026 07:14:27 +0100
Message-Id: <20261029061427.27973-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Yang <yiyang13@huawei.com>

commit 38f28cfe9d08e3a47ef008798b275fef8118fc20 upstream.

Add the missing clk_disable_unprepare() before return from
tegra_uart_hw_init() in the error handling path.
When request_irq() fails in tegra_uart_startup(), 'tup->uart_clk'
has been enabled, fix it by adding clk_disable_unprepare().

Fixes: cc9ca4d95846 ("serial: tegra: Only print FIFO error message when an error occurs")
Fixes: d781ec21bae6 ("serial: tegra: report clk rate errors")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
Link: https://lore.kernel.org/r/20221126020852.113378-1-yiyang13@huawei.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This fix is already in 5.15.y and newer stable trees, and applies cleanly
to 5.10.y.

Tested on the 5.10.273 review queue (6aa0165f18f12) in arm64 Tegra210
QEMU across the FIFO timeout, baud-rate tolerance, and request_irq()
error paths. Without the fix, each failed open() leaks +1 on the UART
clock's clk_enable_count and clk_prepare_count. With the fix, both
counts return to 0.

 drivers/tty/serial/serial-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index ccc6106a5a253..3b86272cdf390 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -1060,6 +1060,7 @@ static int tegra_uart_hw_init(struct tegra_uart_port *tup)
 	if (tup->cdata->fifo_mode_enable_status) {
 		ret = tegra_uart_wait_fifo_mode_enabled(tup);
 		if (ret < 0) {
+			clk_disable_unprepare(tup->uart_clk);
 			dev_err(tup->uport.dev,
 				"Failed to enable FIFO mode: %d\n", ret);
 			return ret;
@@ -1081,6 +1082,7 @@ static int tegra_uart_hw_init(struct tegra_uart_port *tup)
 	 */
 	ret = tegra_set_baudrate(tup, TEGRA_UART_DEFAULT_BAUD);
 	if (ret < 0) {
+		clk_disable_unprepare(tup->uart_clk);
 		dev_err(tup->uport.dev, "Failed to set baud rate\n");
 		return ret;
 	}
@@ -1240,10 +1242,13 @@ static int tegra_uart_startup(struct uart_port *u)
 				dev_name(u->dev), tup);
 	if (ret < 0) {
 		dev_err(u->dev, "Failed to register ISR for IRQ %d\n", u->irq);
-		goto fail_hw_init;
+		goto fail_request_irq;
 	}
 	return 0;
 
+fail_request_irq:
+	/* tup->uart_clk is already enabled in tegra_uart_hw_init */
+	clk_disable_unprepare(tup->uart_clk);
 fail_hw_init:
 	if (!tup->use_rx_pio)
 		tegra_uart_dma_channel_free(tup, true);
-- 
2.50.1
