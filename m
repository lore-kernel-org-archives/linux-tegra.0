Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5746F4AD
	for <linux-tegra@vger.kernel.org>; Wed, 12 Aug 2026 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548380; cv=none; b=f3Y1gYzwB77KkJpiuqKapgzLE9EEy4Aeticl9znugtpCeMCcHw4TLuJ3UWepzfuejQZ8jRsIBd2cuqcKyVUFc93+HUsye0aG7t/3YUCOEq/QYW6tBJrjAzQRV31QFEdRINeR+TsvtX+anDskgodkjR+5EWckYyGLxG7MITod2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548380; c=relaxed/simple;
	bh=mIEIYQbxzNIkZ3zcjSnONFWqLSp6osN6SN3mzfx33Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1j4gMp5qfQXix3Y4sUhbBe7oqh8gXkJ9A8AVolNzIIKJg0DSFz3KOYIeXwXagMqhDzsEWUVPiJrcU7GGndvreU85fFw2HQ6mVsDDsn2evDK2gSmVhcpaBwcbQX8DcOLHnq+V/pOuBH1+N2pvTN74LyOe7FHUGWf+DD5njMjft4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DecKbe3q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DecKbe3q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so642356f8f.1
        for <linux-tegra@vger.kernel.org>; Wed, 12 Aug 2026 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786548373; x=1787153173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J92dMQs6IMyTDyAGWTnLdC2/ApicW6giGlkFuqEPXcY=;
        b=DecKbe3q6NAyJGvTBifchrb5MjXNKdFtIDsZgec5NEeZqnb8CyOoeDFEDlVJB/jALP
         Bi5IgQdRVgMR940txmb4GL0oD9KJ3KB1xma73EjE1JjlHq/gSRFdyxYtHTWbyI5ve93X
         Xsne2KciZQEx6Cnv0iXI8YCQqS33VRML8ZuzqZ9jrSL/vrmwjF6hbAX5cayVD8dj6b9y
         TlamzNm3iA61KSDAW0sXQ6xnpcaqyAoMUBE9AWhrk7K4Jh3xvq+AV52RB4HsBIP2J8Va
         8oWOdzGk6taOcBxsJLvU3btOKcTC4N+ROHR/90ntf2OOqLKZRzpn8vkz2Ut+X8aE5yE9
         rVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548373; x=1787153173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J92dMQs6IMyTDyAGWTnLdC2/ApicW6giGlkFuqEPXcY=;
        b=Nr1e/VYBbO+g70otZ5HblChhQu+xYFYwQ58NYz2yeMl1eIVRUCOOxaupArhkbIK/M2
         0ZprmrovFIjj49gioj352EWF+r22lNcMTep6SghsthfZc0xOFLEkUfNWLQdwtfTYrB5K
         4sgBfV7viWudFRoc4CF0aZhKY76yEvka+nzwHcUvS2Uln2d7T98h/CtRq7pqaq8JyU+z
         06L1n53N2IaXQsRu+iBQ0tQFAlgi0J2/9oUbQpzqDBRUb4Za7ZrGK09u1IB36U4tgeQC
         VirYgk19WUHpPQ8Q1pkRwD7Zx+eFIZx1KKyE703/Vzu3bZ2fkI/7XaspX9zpf7IImMAG
         wpCw==
X-Forwarded-Encrypted: i=1; AHgh+Ronbat7dBmwwDM0ndw7hHOp0ThdGoGLPxcQ/Xfa8wbzevmL9UzxML9zSrYUOHS9y65yR5RzHLnqSlxIOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhL1PVQMUwkKqCGplRQLI7VCdUV7M2qP4W4g46KHGQKWAYWr3z
	1t9hwvacxvAnHteDXSJjeqOBs6D7XWZOi8sTWQ9Ek0LCl35PCMvTPW0P8kd4IikvR8g=
X-Gm-Gg: AR+sD10M9l/QnGTMOQk4dtDA+Mfq21dGoNFQqO8KPFMWjtLLDgi4VqxLmKjXbYodMP2
	lqx33lZ6QfrdSB/NTmtTJCrHj6JD7L6cM4zvx6vVAXEe70IKCahLYRkoPRnaQep7Skuaj/dmsiP
	oBrxtzhX8p7PgjoyVopJ7qtxjG9MNc5s0fmm5RkirMJwROad85jxzzteJVVDAkhj0e+Dz/RgwE/
	VIrrx+ekE7EVJ3QGd3Ip3yQ4aRIwbWVX9ZlxpLqrqZQy2BIKLzOyCLsP2sRrKFwMMH1oyqkoth+
	6bFKrTt0uRRL8jldCK/SJDegLSk0SUccg/DYIAR3SpXAuJ5Ij/cnYpLhXTHgclYKJqqfue6Xo56
	ScaxQw7uhdvT1Tgt4MEuXWQ4rff8AYNIo+PyMGBHDjpUGHm4E6mUu2N/SykbE5gA65J2HbG9nEu
	5vkq/QgFtSuhfimII8GJwDChmXHX9e7318EhBpdMsuGJUcvAGy0Dzd1Ac/p9Ad0eSZmGKG+eXz3
	eIEJWKHvvy/txY9qCpW5LwkwxfRRkVfZTfK+JMIzlMROSm9ciM=
X-Received: by 2002:a05:6000:2a0c:b0:47d:ea8a:d224 with SMTP id ffacd0b85a97d-48152b10331mr7156134f8f.23.1786548372494;
        Wed, 12 Aug 2026 08:26:12 -0700 (PDT)
Received: from localhost (p200300f65f017104d1b8d865063c5703.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d1b8:d865:63c:5703])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48150d4e3f5sm8088682f8f.22.2026.08.12.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:26:11 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] serial: tegra-tcu: Make use of dev_err_probe() in .probe()
Date: Wed, 12 Aug 2026 17:25:53 +0200
Message-ID:  <e5a1565edc2b8c0241827f4b9c40c53fca064415.1786547950.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786547950.git.u.kleine-koenig@baylibre.com>
References: <cover.1786547950.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=mIEIYQbxzNIkZ3zcjSnONFWqLSp6osN6SN3mzfx33Xk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqfJCEBLM6FoaOCMow0JlUmDXcZnMO3v90qiKo0 R6NLHlaYpeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCanyQhAAKCRCPgPtYfRL+ Tu1/CAC5Jp/w5ghH9LWrObkngzLmqfCUxpWMs8xqi7KPxprHgYlu59s3evVCVUEPX3S8IiTFeoe 9PHOWGJ4iGzXVFbu9yCk+i1brPxmWkNV8MCMaog/karEzt8Qg8qdurcFOIoJHLSX91P/HaFwhkX Gsx+YjxvpV22hgO2dkjxGeNtvAImWpduVuibxBT1eyLaVTcKF2Qo25jDEvLtSVlZ8rzvvvm7SLe A/yhY2vN4bRbJ15W8O2+hrrSGFXGiSKP/wBvr+eARi8vR+jx1aFdDjb2BQxjts/zK9uxMZ+DBx9 UopMsiwi40s0+AB3b5/JSlkIqrc79PYoXHR/CGAM7UxUPOns
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Usage of dev_err_probe() is (sometimes) a bit more compact than
dev_err(), it properly handles ENOMEM and EPROBE_DEFER and emits the
error code symbolically.

Also introduce a variable to hold &pdev->dev to reduce line length a
bit.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/tty/serial/tegra-tcu.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/tegra-tcu.c b/drivers/tty/serial/tegra-tcu.c
index 7033dbfe8ba1..077023ce1842 100644
--- a/drivers/tty/serial/tegra-tcu.c
+++ b/drivers/tty/serial/tegra-tcu.c
@@ -179,9 +179,10 @@ static int tegra_tcu_probe(struct platform_device *pdev)
 {
 	struct uart_port *port;
 	struct tegra_tcu *tcu;
+	struct device *dev = &pdev->dev;
 	int err;
 
-	tcu = devm_kzalloc(&pdev->dev, sizeof(*tcu), GFP_KERNEL);
+	tcu = devm_kzalloc(dev, sizeof(*tcu), GFP_KERNEL);
 	if (!tcu)
 		return -ENOMEM;
 
@@ -190,11 +191,9 @@ static int tegra_tcu_probe(struct platform_device *pdev)
 	tcu->rx_client.rx_callback = tegra_tcu_receive;
 
 	tcu->tx = mbox_request_channel_byname(&tcu->tx_client, "tx");
-	if (IS_ERR(tcu->tx)) {
-		err = PTR_ERR(tcu->tx);
-		dev_err(&pdev->dev, "failed to get tx mailbox: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(tcu->tx))
+		return dev_err_probe(dev, PTR_ERR(tcu->tx),
+				     "failed to get tx mailbox\n");
 
 #if IS_ENABLED(CONFIG_SERIAL_TEGRA_TCU_CONSOLE)
 	/* setup the console */
@@ -218,15 +217,14 @@ static int tegra_tcu_probe(struct platform_device *pdev)
 
 	err = uart_register_driver(&tcu->driver);
 	if (err) {
-		dev_err(&pdev->dev, "failed to register UART driver: %d\n",
-			err);
+		dev_err_probe(dev, err, "failed to register UART driver\n");
 		goto free_tx;
 	}
 
 	/* setup the port */
 	port = &tcu->port;
 	spin_lock_init(&port->lock);
-	port->dev = &pdev->dev;
+	port->dev = dev;
 	port->type = PORT_TEGRA_TCU;
 	port->ops = &tegra_tcu_uart_ops;
 	port->fifosize = 1;
@@ -236,7 +234,7 @@ static int tegra_tcu_probe(struct platform_device *pdev)
 
 	err = uart_add_one_port(&tcu->driver, port);
 	if (err) {
-		dev_err(&pdev->dev, "failed to add UART port: %d\n", err);
+		dev_err_probe(dev, err, "failed to add UART port\n");
 		goto unregister_uart;
 	}
 
@@ -246,8 +244,8 @@ static int tegra_tcu_probe(struct platform_device *pdev)
 	 */
 	tcu->rx = mbox_request_channel_byname(&tcu->rx_client, "rx");
 	if (IS_ERR(tcu->rx)) {
-		err = PTR_ERR(tcu->rx);
-		dev_err(&pdev->dev, "failed to get rx mailbox: %d\n", err);
+		err = dev_err_probe(dev, PTR_ERR(tcu->rx),
+				    "failed to get rx mailbox\n");
 		goto remove_uart_port;
 	}
 
-- 
2.47.3

