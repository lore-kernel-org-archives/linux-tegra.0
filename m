Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082446;
	b=GM6G1Ny3T6nyspSUNC6jfmCdyuIkb88lq49ePmFLxsNeXqX+Wml/vnb7Gzy//+v8j+SL
	 H69vV/Cd0VgC1pElPZGebgxUL8o07c5c1cyW0iJ1LAELIGPzaC05ooIlITVs+x+polM79
	 vGslDlIlMw88ccTfZFKfXaYdYuorh4FrVinPqS/4eeaFGtA64EDOysfPd4uz5vlcrK6k3
	 rZDJPgiKpjlDkxNKg0w2//iZcyrE7dp2j83hfYjCgvQUt/5ZI+tEvKlKGKwo1CuNQ4NUF
	 Ue1JEn7nw/+eV2D5Ehvq1AU60mcjwAMzbp8ImaQ8sd8VOEOrK7R7TyEEdK78lDhd3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082446;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
	b=sKHNGRupwFhd2P6gmQZ8TnuWh0D6rNvM9D33/1yHCO1Q4ima8ZHT64rmg/Jl1YGS4DCD
	 hTjP+0iM1fAA7nXgZfKDbb3zfTLNnss0Yt7aJMhg5Y7+aRAnomxS2NgtqD7xANgecLtQX
	 BV11NfLIEFnn7OS+HCEJzdOIPpOA99lDlv1qaOqTxt0ZNqjGovD+Ja6FjDi/2AdmVmCnk
	 qebTAb0derOK6iGm75LMARTRuTlKxRI6aO8Exm7Q7W6XX/RgLWfOJO7zhZFSAJAP/8MlR
	 K6lbhqJmyjVOlD5QrCn13SukKurwzQMz9lzSDlZY//juETDT4bLkkFP892dsVEH3z9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9348160A2608
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9348160A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-714d57774d8so1007144eaf.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082445; x=1794687245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slReh3bGXbD9MmyB1S+b4Br8YbCA885gA/KmfHnbZqA=;
        b=lsl47KlHzq5yC/781XnmVgb74CZnMwk6WFk/0Zxaxd6NdI0lB46gujxGTYXgHrq4bp
         SVZZ5GCa8XX8ada9s6mvRSjPPl37LudOCz58c1FWczm2iqevA0QCB2xPuzcee/pU/oal
         KJOvJhsBzGHLCAFkYIONkmq19G4vlgWKabX3A7VbSkb5KPAfgyEyodtCmJLPx0Zs655s
         l2Tt+5+gCKO/537aP2KoHucRIamnG9Gh/sfZLuh1iNn8G84WQIyv+iYAkqT1t8bFErGI
         2Ws9ezHIDTWcKjdRwDe9HtGdS6YB4d/ny/tZLSkCBJ80psl9c/jnqk3l9OOgY/2NcRJQ
         oL6Q==
X-Forwarded-Encrypted: i=1; AKwUvByohHXW009+cMkGjOZFS19ZfsbvbOl95Ub1Z0Ivs3xh231zxX6juvnaftwf/r2SebTiMi9dUAAXgsuNUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z88lxC1A4tsHWR2Elw0Ai71x8X/O4QYqH+SPrfF/BSNruxetDBv
	x4SL0flfq9S9rGsmUDeKMcmD7impzHz8shL4KOZ25ZMLqaClRfDtBaot62mTcNiUDBw=
X-Gm-Gg: AYBFou12zpCAyAk1tWqUX6T1sM5cBzvm62LWYFZnkAeNOYNjtKXTlVH1pckAtgodYpq
	HoLYFe0RahzwOIyceIvfBUhmWbGcPRXhyhcHW5rZxY8M81FhPF5PEsg5GkGcHGdMqpVbgQHy6Xp
	y27dbE0p1khAQ/TB9zXe7C5Xh4YbLnKpnI6zvaI74lRi31FQdfqyNTl0w9NfB3bMtgPXhhm6S9T
	ETKY4CDX2oR3Xu8fYfCsL3iOrdHFiAWrEhjM+MY8MsiGlNK4PM0u/PKwMzyxfc++PNLfNvOoGOa
	v3psMw7V7ZvEhn9/CIF5d8Z09vweIkyWAcMNKPTIDMT0aaBK0GcTY3vfOMbFa+ofZRSd1WGRspL
	BqJnnNps2A/9aOhl3V0WlIOzPUWwc/QCA1TgJP8S61pePR/ym0wAoxdhKbRElBQ3jG3mE0/yXAN
	h4zeweuM1O/5nkxfzZ/h4Jzvu/sLJHP3jRqaERERfXRWLV6y4ZyNnrqwf3//O+OOp6dTb9zk2RP
	BpT3EQl4i2p1mfr1Ezwa1P3jzsFbi4jQnWkjUBSLSacP6SxNPUO7qWZ8OS6Q6KdNwJpdAt1vBQF
	hEc4BlPC+fiLNV+mzlAFbPtnGDPxLQI0DKRocQOdVl3K1//kVe6KzickHWh+LH8srRk7ayOCode
	LAVL8ew==
X-Received: by 2002:a05:6820:820:b0:716:c0d5:2cfb with SMTP id 006d021491bc7-7170f1be2c9mr28227eaf.6.1794082445409;
        Sat, 07 Nov 2026 12:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:49 -0700
Subject: [PATCH 52/58] mtd: rawnand: bcm47xxnflash: retain chip state
 across removal
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-52-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disconnect the scanned chip on removal before the BCMA-backed hardware
state becomes unavailable. Retain the embedded NAND controller and chip
until the final MTD put, including registration failure cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/bcm47xxnflash/main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/main.c b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
index 4d4e185c22e5..60fc440d4515 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/main.c
@@ -19,6 +19,12 @@ MODULE_AUTHOR("Rafał Miłecki");
 
 static const char *probes[] = { "bcm47xxpart", NULL };
 
+static void bcm47xxnflash_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct bcm47xxnflash,
+			   nand_chip.legacy.dummy_controller));
+}
+
 static int bcm47xxnflash_probe(struct platform_device *pdev)
 {
 	struct bcma_nflash *nflash = dev_get_platdata(&pdev->dev);
@@ -26,9 +32,14 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err = 0;
 
-	b47n = devm_kzalloc(&pdev->dev, sizeof(*b47n), GFP_KERNEL);
+	b47n = kzalloc_obj(*b47n);
 	if (!b47n)
 		return -ENOMEM;
+	b47n->nand_chip.controller = &b47n->nand_chip.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, b47n->nand_chip.controller,
+					bcm47xxnflash_release);
+	if (err)
+		return err;
 
 	nand_set_controller_data(&b47n->nand_chip, b47n);
 	mtd = nand_to_mtd(&b47n->nand_chip);
@@ -48,9 +59,16 @@ static int bcm47xxnflash_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, b47n);
 
+	err = nand_set_release(&b47n->nand_chip, NULL);
+	if (err) {
+		nand_cleanup(&b47n->nand_chip);
+		return err;
+	}
 	err = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (err) {
 		pr_err("Failed to register MTD device: %d\n", err);
+		nand_disconnect(&b47n->nand_chip);
+		mtd_put_master(mtd);
 		return err;
 	}
 
@@ -65,7 +83,8 @@ static void bcm47xxnflash_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver bcm47xxnflash_driver = {

-- 
2.53.0

