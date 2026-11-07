Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082430;
	b=dR1EzocEdxGy1nBTprT12R21jQqr1Mr5+sexZqnxPxFqgXfFMcS7ju7ydePDt6S+NwtT
	 Clw48lQbAdmW3CfntIQl1IgU9xEXVncmAJvjTobcnDQRH6BG9xHfe8ZcKVSI8hjtBlM6A
	 fyAQnLt7WJFluL604+0kyCwsPshyDPtXzHGikZeyVB7o9oIUEVlSEiXrVWpGYJBYXVGAR
	 aUxyVcC83fPmaKHxy3s+oCGQlxwEFi8Agno8nq6l6EAg3TzTI1Q+TT1oWwKZ5XfPI/dpQ
	 G/YjjPsxh4ATWKpUW1/a8JdMP3HtCING4EJ6JwlCvZzO2/8CiKFOJVtfTxibxI/jnrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
	b=4xTHmjT2QeijBXtsId1E1qXT8YVaALH9oJNyUE0T3Rn6RUiCDWZs697Vilswr8Wk35WF
	 Cvmn7t8x+2DOQvHtZo4MYCs2gFhijcn6EpcFmEthFCkUo0Uca+VUb5K8ceZDvwXl/AJsP
	 hiHrnR9Z//eUOKIdQjhNa0AhSfOc0/1WBwwA+cxqhcZvrFHdvP/gSN0AyPdrnrIxbMEhR
	 i1J96ibf22gbVjeuJGhuLCnw0MfkW7nalNHyBNIJcLJW7K/duq54CQcX+rYiIwWAcKXTL
	 YyPl/09Jm2LyTQH9THbOANRw13JxLJwSqLg/1tXRXdnfJAplJZsYKNHl8eCiAYC6Dig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C696083604
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C696083604
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-716c0217635so30268eaf.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082428; x=1794687228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
        b=qU1Exp7Db2JNBGMT8hleSfcT/PzHKjRREByPvRfm0qE1fHyXI9O0BrzeponX46i3ne
         NiXNI9mD375UXwCObgvOQNQLFh/addoTXAOdbezp4SOdDTBcQmCxCL3dMYCRZMl9NU5o
         dsA26Phm8DtFE8PFCIB3KsWcBTTovSFn4U1GgCgGpBrMjXM5iM2PL1I72NP1LDC2dok4
         DswIs7vRnENoVWAN5Umqp0Kp/6+TeB7bH08y0BZTFEiSqEAeTr17r/QKysb49peyFmOP
         pEDtw9fZFzOZOIU5zj8swJyQ2nQl6e6xd3s+IfThdbHABBduh9+AWCujrrqDZ1AVYDRr
         KaYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAzfsbV1VT6VhNfRnIj02yJ3r2DHBWE4+DiIcLy6jhq3S0stIOe0/60H7hoXUOJXvymKUfMx5pemmOKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZrEdRKKmDW1syzBUrNPGbb1/h30mZpkiLDz9bL3hT44VGKOPf
	yiyrWVHcb+NCO6D8VSYKmLKUVs0MUzK/ix3XxzOUqUWFwjeUKZzOBjUcVBGsK4WIWEA=
X-Gm-Gg: AYBFou0+seiOWItNx5iERRi0MJxzqu7FrAn1U1WzY8Vz6/JG58dIK2IXqR91bTqOwEV
	4/b8JYc308WOr1SsAbu4X8nhJ8UBtPzl7MVKLySR6MJW0poXP8EYvLODSrR9wNDZy2YXQWCzA6k
	YQK5fH7PBQWnMzy1/OTLM0N6x7JaGBeZwggcF+9EmMD4es1jgK72cV6GIdxkxSRQo8lDvdx49vk
	gajPnUhniFwvV+Hm7bbJb1eOEjTt7lq0fNfd1nDN97n6m4GVLuEhZFL/WWEXi1eKjdKB1Y/enB/
	zHbYPTbc7lbzVh3GI5UJsoEFSUJWJeT1lVF3ixWNCk77s5gV23HoZGyaiFH5/58ZgcEvH8b8DmV
	vifXvqe5TvBaJkur1B7lLg+ohhUZBzFSjraak27GkJxBXwaARF+5ElqtABINNcvXflOBHrJgiOb
	VGyQypPQjqYlLWgOist/o0AgoRX8jPWPy1IYbUlfKFPGOERwrHlBqP7zHpmdcnMOhrcKNAqfxCX
	l/ZlqEgFfTnAPsAEbRN4HLCdEY6ofKF2Q2Qx55Z8G4TpRY9O6m3NOIuyTJmfUELbuO+nrrCtbWn
	Ngje72Pbsd7aViJmze12qSSTCaOKwiNvd2wECE3P+bcTypvtpDzNGPguad3j
X-Received: by 2002:a05:6820:c90:b0:70d:7461:973c with SMTP id 006d021491bc7-71700c853ddmr1078198eaf.17.1794082428281;
        Sat, 07 Nov 2026 12:13:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:43 -0700
Subject: [PATCH 46/58] mtd: rawnand: lpc32xx_slc: retain chip state across
 removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-46-0181ef0cc4c8@gmail.com>
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

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..85945e1dd25a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -817,6 +817,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -829,9 +835,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -915,10 +926,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +961,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +970,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

