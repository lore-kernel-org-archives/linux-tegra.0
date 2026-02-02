Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333F93115A1
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019554; cv=none; b=VXaWP4Zy6oTVQ5+RhZi0JFePuqOSXkiUamQLPwVLWjxsggfKgMxWmUAcQgN1l8nw8MzvCnEfsW4viHtCzoxr8tZ6syJZqmyxvK6pXxflw49y/auAg8/L20QESVTf5XcMjfb9PoC4Oyesj3//SC4s8mWvh+H641GA9I9kw5spVpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019554; c=relaxed/simple;
	bh=n/CThmgES7RXr4ZajWKrN9/m0RRv4RJTJL21HVrLWFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ke9DZYKcsMzK2E3jR7ImzW0yQgh1hxsPDUIdKsXCDsPoyi+qY440HyPJXii4kWLfA/UsdJNGRHMZ/bNVyjpHuycNXfkQH4YEB3Qj6v+NtviRHrk70d23XQKfFd/FbxEvEz5cxPnMX9H7Rx1vhNGA1D6r6Wfu4tQGsW5pLfNRWus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKr1MLn7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKr1MLn7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso18621025e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 00:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770019551; x=1770624351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD7rckHxzS8N+mHFS5nFPnTWeJ4w+M+x7cKu/hU4Kac=;
        b=gKr1MLn7mOmDPKywWPIC+YnQ29h/Wzl3I4CM1CbcupQHIj4CACHdDLcpZLZxmdtxBB
         0fmIXwWUjifOT0QlqEtxBL6qLxqtowQ5tb3PNX5PWyj2+GrYc66Yv/Myjiz6I73Ed1lt
         BMbd65TiNQTjmgmNvFyvU9ZedY0G/ToNTXus/6jzQNrT4a57Tf8Hyhli0SNEIwjuoB6c
         QPM8yyY+8LQtIg7lS8+yOpYj7beUpc2BGuyzbOCUCHfrJgtWbGDV4Bpm7tKWGEANWTkR
         +adfHNh0tdPmy3y4M14UPb35ZzOnhV76Zu+c4eQz8jniBFr9LlELhNzyWnbAhcz7igwI
         A3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770019551; x=1770624351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kD7rckHxzS8N+mHFS5nFPnTWeJ4w+M+x7cKu/hU4Kac=;
        b=xS36G9Sc5+RH0USj3eMDNTAcBVYcclrgl9Mxkeqo6ke/OTsRqmJyjMNVhaVoRLhDyv
         vVxaXVAWUB8T/bSLebvMWbjli9o0grcsEhne5b/QDnWF8njeFJEDEyzJ8J8Jvda3u3pU
         d0Dx4GlMSxZsynK0XbbmzPiBXUV6tTkdTC4pTAhAeS8CiSwHLDyNXGEdPns614UiUSdG
         0g0m1zeJg0PpTVS+ENkkiG+rVSowEh9UXb1B5QaHf50C4SkxUxZC4oBF5lzFCoWqAQp1
         I9vJkCuMzHTLUTW8YIMGHKHn9kyEE7InCvBmEL6dj3EZI6wT3eUgos6byteyKfCPw+b9
         oo/w==
X-Forwarded-Encrypted: i=1; AJvYcCXyAI3e0hxUMSS1osm+DgDXCxGdS8KOxhkAMWWiDmmNYZ+cc+EiHAHiIU8ZjZY3C3H7Oe2y/BkMEsjfvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwduJ3bHfeMa8RWeKLvC7DOrLtOP0jwWcQeD/RhEDuJB3LyH/+R
	MQPUDLmOnxa5aJY+lfFwPWKYx9ykGd3WmPduf/RM0IvVRpl9zh2no/SP
X-Gm-Gg: AZuq6aLbUmyF/YksnK9R4qNWRhDEgqwQDOTj7j4n1xuZOuRfKk3ovnln6yZBI6hiJTM
	5mqU4mrkm2QvykZB04OohwCOK34ZfptMHtSeE2IoIbkqcWzuY76A0lUVKmKqZSWsKPM611t4cuS
	gquDiJQcH8IgxppML9W73o7+IX1SzkiEsbcINGXuWI5nTIoZ7Mjs6+4fBl66meQd4v7yOGOp0Kk
	NLagkxF3mAHiJLyMeZT1tWxlk8LXSl97/Lb04bcNy2wsDqoveJoe5zkzs2x9/0iCydkeswByQx8
	6eeqPWPmJdNpu9BbiU+iyq4ssUpP7ms8xSKfmyQrDcL6AbQLBA0GyO9RIWyHTBRQ/lOXG+5/sg6
	FjsmsS3i8pPjOyuuJjbQme+MgRn831AyGaMhuXymJtProcAQMAzEj22jkXZCKKYXgfZnnqXmw1W
	zP
X-Received: by 2002:a05:600c:1e0d:b0:471:1765:839c with SMTP id 5b1f17b1804b1-482db4d8565mr135084615e9.20.1770019551448;
        Mon, 02 Feb 2026 00:05:51 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm475043365e9.9.2026.02.02.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:05:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] usb: phy: tegra: return error value from utmi_wait_register
Date: Mon,  2 Feb 2026 10:05:24 +0200
Message-ID: <20260202080526.23487-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202080526.23487-1-clamor95@gmail.com>
References: <20260202080526.23487-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return exact error value from utmi_wait_register during HSIC power on.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 3a7a74f01d1c..6173b240c3ea 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 	struct tegra_utmip_config *config = phy->config;
 	void __iomem *base = phy->regs;
 	u32 val;
+	int err = 0;
 
 	val = tegra_hsic_readl(phy, UHSIC_PADS_CFG1);
 	val &= ~(UHSIC_PD_BG | UHSIC_PD_TX | UHSIC_PD_TRK | UHSIC_PD_RX |
@@ -984,12 +985,14 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
 	val |= UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
 	tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
 
-	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
-			       USB_PHY_CLK_VALID))
+	err = utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
+				 USB_PHY_CLK_VALID);
+
+	if (err)
 		dev_err(phy->u_phy.dev,
 			"Timeout waiting for PHY to stabilize on enable (HSIC)\n");
 
-	return 0;
+	return err;
 }
 
 static int uhsic_phy_power_off(struct tegra_usb_phy *phy)
-- 
2.51.0

