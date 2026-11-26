Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708754;
	b=FDViDBLRvEgWyzwGhh1inyg0YXkBBfvQUs7i93yhOOtpbfRct5p/8O40HTNoF1dyuhpm
	 /VAraIfxNLYqTilJWWXSL25WOBcQgb/+YMtru+sXMGjlv4D02ZPJVgVv573sSmzbO2U8l
	 GifQoq8kB6R4ozCO1e+3e4meaKlRUhYGM9jY5XcFMF9CZTb3CKg7bsG7jV3oks2Duch1M
	 nOUOG1L9u0KzUHvfJHGZypPKsFFGvWu9kLyeeV/BuUJ6t5FXS458JqxerfXgwCEwhE+yD
	 UFNaXOx1x9v6Ri0mdfTb90GiyZjp1WwDYl8n5zg5gsJNie6eFitzVPXkavMsQo1/V4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xdJp+FlW0fAnBajETS7/P+7V0hYHEUFR0KWFN0IaqRA=;
	b=OicDslMJJ+RRURCR4TBcbBKioSlSZAXYLIVE7LztZOLh9DBCP3JY5AFs9fxI5/tKB2Se
	 BbNHx6hnID/HAlJLyGHQ8+B+vnSYc5NM4dApi5B95xDv4cpCeZVO0a/Z9Z9S3JZZvBC5a
	 S3af6wVd6cFcz3oyRaheD9DkFopIs9zPP2aOt067ehSyLzZ+2p7n7aImd8fSbS6hxau6r
	 aCPSHYutNxxW6Ed8EmZresgIK4r8Asxim+j9cmvcnCbXWn/omxvIZj0GYlIggrPXqSlcs
	 UdK21lnMPq0Jnvyllb37KgrLhwxy6pDsM4yh6K/RPLBXp98Ott9cIX333q+wf+TFL+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr2+JTZn;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F176606A31C
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 15:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F176606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr2+JTZn
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so9178294eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708753; x=1796313553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdJp+FlW0fAnBajETS7/P+7V0hYHEUFR0KWFN0IaqRA=;
        b=dr2+JTZnoqQ5ydoqHLJw5HDebXiwsQxPv/wpFTjgGIVJyfNDsoFmgLKfkPx3ggrRqA
         ngEZ6NeCmv1npWvMuch6Cix+6odE7FiPOOXMKNUtBrwr4FunUfR/kbF2VAXk/Pc2cA4J
         1K0/xySxzaI5GKCIk0hwAHlu7O9ropeohMIjni0cn7/+FYi+GKF8K1f8Tfcu84EyI885
         +7iEbxii6KCvbiupWUITr1vtEd0xNpHCVTjCsBuJ8wSAqxxcw2/bhOdp80UCcfbljhbr
         Snqz2ptyQX95xjZw96jPsnibIPvgC5AwqfHyx5luSNEXfxZQeGQZlIy/+08zKXmBctU/
         rEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708753; x=1796313553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdJp+FlW0fAnBajETS7/P+7V0hYHEUFR0KWFN0IaqRA=;
        b=vGFuYkKtmL6uvncWdSGJmULRrFWZc25v1alBUeughMNWkQIoP7OV5gxQLLxveyxIue
         Gx42sLW+L2M3zGUNXx+w6knQR4fFIsh9m8iGTE0KvQ7NTrK6zDftTJWPs0/OJcrRqmcq
         1G0YYKzDEBXniPHi65bqUSqZysVwxGRCyVIW0Eo5l1lvXadjEWu7GfpId838UGuB8l0F
         FOdp07Q+9HzsVu8KTmS/2rn8xgRJo7BvVueP0hAo1UU9f9fl7r/yBbyNzBPZW8F81NQ4
         7E5TPYRPiyTznBS+zalmjGccE/jUNpVT13l5ycus31v+25z7DwqlOOI3PhLjgSqzmKb/
         srmQ==
X-Forwarded-Encrypted: i=1; AL+hErFpFwjNBV7tpZH5A4B/fzt5Ky2QbIfUjfIzg0ZTk/EzQyiPkuy3mcK4p+FE42S+QlQ0ila84Fi3Lz2AcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8D6CcCsNQKTXAyFwSN4QN/iHbPO7tQ9wN1LO3weiXcALx6eKDk
	rxJjjBD0hc3XIkAGfq5nBDaF4V0++5r1+pBYYw4BnhKIlh1SzsIXgYg=
X-Gm-Gg: AZFdTZcryN74ZLtBQO7SEbKFGMJbpM6puLz8UOUAN7yHhSQQ+03MiYiAuH3AnkXdV8Z
	LvaFEi/HHVe/NRL58Ib8tC2iKLNW18lQn+bd6PK/PfNYt0urdWxhp6Tl2yEX3dOE4Loh3oqJU0H
	pzVhS6AVclFsqHNzcfmcdVtqdNU9m09x5iUVS6vGjsdl0k220NxBnAiJD4ju/nEdnJsDOrBzHHh
	mIHbe/XTAA9I1E9t2fnD73jvnjb4sfk0hNMFYS2pDEBGisPrmq8ibjc714ZXXkvkOIidpsZ+5Bj
	BbeWwrADAkKljBqsqc5NHSflungPKvB5KDzZysP3fNqjBH7npgR97m6werFoCunrlZDFzDkwKil
	GqoCsrDXMtsq99cS7LOyP37Bkokn62khkslLs36QrnCJ13rh7JInXTI5R8PYX3wAcLcRDO6TWTx
	2EOdjUxgc1kAImvqvRDJlW7RULzy7IQ2TD+3x9Rv5mYot8MtT9nGjFYrOHoe94wXWxEjiLgNgYy
	3y6JMZDbwyXdQHRgfnxajdaBYnQn9WSGvDcGU58GSy74P5uvEBobiSpQnSI3PV3rNtcfUS6e7ae
	/Fw4jaSGQ/yLiPOexDf9GeEOAaHmUroWA1H41uYYrO8jCiC7H6NJlbBMViUl1j5pZMonaJ+lRMe
	1tddsIZ/LWlLY
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr21471812eec.22.1795708753327;
        Thu, 26 Nov 2026 07:59:13 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm35099691eec.0.2026.11.26.07.59.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:59:13 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: tegra: xusb: Fix OF node reference leaks in enabled pad setup
Date: Thu, 26 Nov 2026 23:59:07 +0800
Message-ID: <rc-b1-20261126-vc-166-f94c6693453a@gmail.com>
X-Mailer: git-send-email 2.50.1
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

tegra_xusb_pad_create() looks up the node for an enabled pad and passes
it to the SoC probe. The pad device stores that pointer in dev.of_node.
Neither the probe caller nor the pad release callback drops the lookup
reference.

Give the pad device its own node reference before device_add() and drop
it in tegra_xusb_pad_release(). The caller can then put its lookup
reference as soon as the SoC probe returns, including on error.

tegra_xusb_pad_register() also looks up the "lanes" child. The PHY
provider takes its own reference to that node. Drop the local reference
after successful registration, as the error paths already do.

I used an AI coding assistant to trace the node references and prepare
the diff and commit message.

Fixes: 53d2a715c240 ("phy: Add Tegra XUSB pad controller support")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).

Julia Lawall posted a separate fix for disabled pads in 2019:
https://lore.kernel.org/linux-tegra/1550928043-14889-5-git-send-email-Julia.Lawall@lip6.fr/

An earlier version including the disabled-pad change was compile-tested
on arm64 (GCC 14.2.0, W=1). This revision has not been compiled or
tested on Tegra hardware.

 drivers/phy/tegra/xusb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cd1cd985f36a..aa6ede9f4a21 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -161,6 +161,7 @@ static void tegra_xusb_pad_release(struct device *dev)
 {
 	struct tegra_xusb_pad *pad = to_tegra_xusb_pad(dev);
 
+	of_node_put(pad->dev.of_node);
 	pad->soc->ops->remove(pad);
 }
 
@@ -178,7 +179,7 @@ int tegra_xusb_pad_init(struct tegra_xusb_pad *pad,
 	INIT_LIST_HEAD(&pad->list);
 	pad->dev.parent = padctl->dev;
 	pad->dev.type = &tegra_xusb_pad_type;
-	pad->dev.of_node = np;
+	pad->dev.of_node = of_node_get(np);
 	pad->padctl = padctl;
 
 	err = dev_set_name(&pad->dev, "%s", pad->soc->name);
@@ -249,6 +250,8 @@ int tegra_xusb_pad_register(struct tegra_xusb_pad *pad,
 		goto remove;
 	}
 
+	of_node_put(children);
+
 	return 0;
 
 remove:
@@ -285,6 +288,7 @@ tegra_xusb_pad_create(struct tegra_xusb_padctl *padctl,
 		return NULL;
 
 	pad = soc->ops->probe(padctl, soc, np);
+	of_node_put(np);
 	if (IS_ERR(pad)) {
 		err = PTR_ERR(pad);
 		dev_err(padctl->dev, "failed to create pad %s: %d\n",

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
