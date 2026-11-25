Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624137;
	b=triX3bia9Ygw/tkoVnBot9dIp0Eu9NlJiPm5fIwMBRboS+yrlovWLw02mLt5pKgclRMW
	 xzXLO9qXg2vrTt1TyD99aqISADVf7+DbAyKLo+EIUzWcoP3g16Se4vtY+OR2uLZ6Cz7BD
	 bZXDDCY5EcsWM29+7M3+YSuhv2glf+QtneFJqI6ZK6YnFi0my/0wFGnkYExfWhlG1iTV1
	 yTmEaEeURJAyNTZ5enq+p3EUKqFCvWH1TxB5ZHDRQNBh01l9jLFV9I42dygnBwbF2uWHt
	 ylqEyOoH4ZBe9aBOWLxyuWYv9SFCod7Ubc8ztmQqGlkNU4rEWQpV2y2xQ6l2hdn9+pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
	b=Daae8MzepTWYO+AeOxD1DxT5qG1m6uL7et3dzs1giczk8YNMN0bDSGRvjeocKSTBQkwR
	 DrqjrAs0E+egvB5tgWfaUX7kDK8GOIvSeOjCW5aEAy+xSNN75oQ9OxPuX6qdPc6uPjZGf
	 z52ZLEP6fUsItbv1gDu3I9+1V7iTZciIqoUCScas0SRq8tXsQi+xGvKclbolquZKOpn8N
	 f8jFf9LfljiXM6oCxf7abcUVHpKW8kKC89AhYQJMisHF/LbXnfwFzcjtBLxhgHCHDd0RK
	 NialarUQzFV5nRAI1Rc8MPHxxWAw72oxbm2SwNZnuXo5URdg+/TDQy09O221UdMyUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M7Ja1AuV;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505C606A333
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7505C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=M7Ja1AuV
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so77387605e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624136; x=1796228936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=M7Ja1AuVeoTnyB9RFWfQgwgxmrXhovapQSDTqFdDe/H3GNmks+5G+Y8h126tI4bDRC
         CGqnWVxzvwmw5bPwaYmH7vIajDu6p5aY0JlCGB/sB2xoy+Qf6mMRjn7xXCz4WatyQliT
         Pg4ZVjN4qnNsbAsOpRD0E80PBC9utkVvB/Au6vos32uomnmIt+hWiz1tH0mQHYMHeT7k
         VQ4qkFZhB5/qClO7ygQ+2jYQz446RIr3o8chXvrtLqsWQ7pgDZlgXN0O/bzaSN+INWT3
         7Q3iW4EVd4OUrUGDQM/LQBVpBxphPEyNQef/1/IWpLF+NTinFscXPmAZ+yom1Bfp/WsT
         BhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624136; x=1796228936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgcQq5x/Y8QFhx80+Eu+QadOSuCUE1CUEnmcqVfNUk4=;
        b=REAoEOkKP0i7Lpi/51cZuHtktnVkw8rIMOcgDoz5EkSw1MautkvPON6G8pzzw9ca1I
         DCxpePgp1NgORqQujLRcKv8u9mTj61rA1Uh9TkcEhMba1XK1xqS2/RYkQcYgmMjS66i7
         PRmBE/Fb+ygwSQ23obOY78eNSwBxl69X3sFT3OiGPl9hb5l7tFM1cRWWkeuLesOomZGd
         Qg9sYlcFV1ZN0CI3WMaciXkYSlGm57dNgzzvdE0SFzBk/Jn5A03k2as1ck7DUWwZPxxu
         YpYBnEVNMGpUvVC4GvbWBcP5UaDc2pIxUkMF+l1YTF/C/XO8xTPNS3GVVlj8liUfGymZ
         A7LQ==
X-Forwarded-Encrypted: i=1; AL+hErGTVSVJTGxqRlYE86c/aRP+AcsBPpGPXKgdRFt3rswvrk6MV5iZqRnSKOPYNJ9qKKgKNwdAxWxyeXiXKw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CrIm/a5JexBbzqnlqIgi3mfPn42XI0M6QRUgOSg97SXHOybkY
	XABc+Dnoa2OjFa5zW7qSX4B1n/8UqVRGWQvNDeTsD9FrcrJatCam/EFtFT2N0N/E+gM=
X-Gm-Gg: AZFdTZchoPJzbEgUWGBgOWQ/G99beAvpY44fNYCFfU2sxEJx+VWGdzGOTPZ7mii/HF6
	reKC9WWQVAYu2fDnMhl4s2kmiJ0Vtau/aaSeM5cYPBFVcFy96YdGWPbigJRFm/vhBR4IVl7pFvx
	gBbrG2wXOQAIb6vtRz0hTd4JGWdwK64ra9hAbInv9LsmBKPq4u8UIC0MOZrgVqYMVUfh974t8YC
	w6EUiBtIzQ/2sedJWEXBqGUG6NejXdxjw/erGMsXaKjp1n0HCFCUYOgRA1/M9yNUFrSXSEQKiUI
	BRYyhSA8LXw+SSsjwVS4o7/jGFowthA8CvahPKHqsDKZYJ2IEwjV6XiI2TdKom9xEFAu0t3NT5G
	LXudaWinqeRDUmYpbxdBS42WKnz6y6VHsFkRIZFJa0/VqETOuVelXCfUpW97mTrJD7scew+iBqR
	qXNIMDBEgeX1e3icSimKcASmwUIv6XiK2yQMDFju8F3Tm6YsQy5U8klGcUhTGYJcpmtINLrByV6
	ybKFAGvY/xLuGmSBM2O4yUzrJs+ApPP2etd/6jBaWtxPp/w1xBJhBpozh+fQVmBwXLGitOVYo2m
	JtvbKYGXw2+ioNi+S9AHTR80oST8jLdDhmM3ZdJ8bnpUf6Wl82C3Ajc3NP1539+/VXg=
X-Received: by 2002:a05:600c:468b:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb888160c2mr388121675e9.15.1795624135909;
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:55 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:34 +0000
Subject: [PATCH 08/10] mtd: maps: Unify list terminator for of_device_id
 lists
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-8-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=2018;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=qZ3dtpaE4yo6DqKw2ZZxvSONBhZmYTuwo6Yz4wDKiAA=;
 b=uXOj27KlhNAZizznn9ogyLPuEGUV9GthH9XWkHXihalhOuNlIXntNNK6vnlTDONhse9U1m2BX
 wgOwv22X4fNCfrJ4kS4rB81GgUoV5JAjSZu8Y1OsSvN/EQwWtziAtg6
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/lantiq-flash.c      | 2 +-
 drivers/mtd/maps/physmap-versatile.c | 4 ++--
 drivers/mtd/maps/sun_uflash.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 519126abb9a5..1ee15d50bd7f 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -177,7 +177,7 @@ static void ltq_mtd_remove(struct platform_device *pdev)
 
 static const struct of_device_id ltq_mtd_match[] = {
 	{ .compatible = "lantiq,nor" },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, ltq_mtd_match);
 
diff --git a/drivers/mtd/maps/physmap-versatile.c b/drivers/mtd/maps/physmap-versatile.c
index 2e779111bf79..9d308c4f21e5 100644
--- a/drivers/mtd/maps/physmap-versatile.c
+++ b/drivers/mtd/maps/physmap-versatile.c
@@ -58,7 +58,7 @@ static const struct of_device_id syscon_match[] = {
 		.compatible = "arm,realview-pbx-syscon",
 		.data = (void *)REALVIEW_FLASHPROT,
 	},
-	{},
+	{ }
 };
 
 /*
@@ -77,7 +77,7 @@ static const struct of_device_id syscon_match[] = {
 
 static const struct of_device_id ebi_match[] = {
 	{ .compatible = "arm,external-bus-interface"},
-	{ },
+	{ }
 };
 
 static int ap_flash_init(struct platform_device *pdev)
diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index cac780cd23f9..2960cebdb0dd 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -138,7 +138,7 @@ static const struct of_device_id uflash_match[] = {
 	{
 		.name = UFLASH_OBPNAME,
 	},
-	{},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, uflash_match);

-- 
2.53.0

