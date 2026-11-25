Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624128;
	b=ga4/diJkVFojnbzJIQwoqcsavY4YpHoqNagsOcPHoFY+5RmkaBhvoJM7rVxKUrKf6HCt
	 1x8rNXq5r/VcCEydXUs7vcwJiHX8sPk+aIw3VP7miLSrdr7dmcJWNoQuurSEmagc4ueZc
	 JbtD3+nniQKYzP6j0m5O8j+ynfrH8YBv0RkCjqTconRqxHVNfsokVHspMi5Y6HEoTGp6F
	 10/VCzCn2OX1QLZ9h/3xXcCb7HWrWGbo81MeZ2OUQnhGmaXcEypGOsjcMkzh12Mn/7hA1
	 pEpve13tgCIEscRStSS0zuZmNr0/X/VjLW+3qg/tSZC61us1usw4lmVp87uqjDv4dVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
	b=m530xvgl/XPAQ6/JNtZohtOlMtRf9euTt9Rgw73jAmzRMVw5arw0bCHZY25XwuVKid5r
	 Gr3i4naLA/ajxY4HQOyVNmSeDOup7CZwkgpGd4eDTIO1vBWz3DmfAHPO9LDpMvQcgON0o
	 KfSYhXjuxs2WuxTcYY6M1DYoHKkkfkrnwZzKBFRsbetqUQdV30ifgqKnpWK++gyE7WXqD
	 sxbeovYWXVefFQr7N0gczUqBxVuLg2Nji9IJdSoWWwnx7yKaM+4AYDY5NWd5OrkJZHi1g
	 zDCAC6uCLlR8Qx1ZBa5ifC8ncQ3/r6vm2WYRt9D4p9IuIXj0YP8CMB6AehazszliVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NefMCsFC;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2BA606A32E
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2BA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NefMCsFC
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so54800905e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624126; x=1796228926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=NefMCsFCYDXwhFV3ueputNOzDkBj4XzJivUz2f3/HIbE1fJlAZ9HYyIAIkcjs0UXAW
         uzT7s6u+4XuGELC2Mpc2tBhIjwM/gp9PM1WseEEcwm5yz+M4qG1dQYgRKQoMHqcUqjlz
         8ZjjabXUmAopEHH0nRpqomLHzOVeH7IckjszkEGd0yQzVqXRhMG5BjZbc/4PlYIxzC9v
         3NQpqlwr010/Nynz8SoNlM2e7DQRTxY54NPmjxkxxsZXV3kMPkjwMPf9Wwj9Nc5Ss3BF
         W1d3nsV9W/vF2SSvBmEfUp6QQD6F08os+W0PL0tPlL3CykglVfWa94ZslCHWlwaLwsr1
         dUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624126; x=1796228926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnNdjklB4uWYTn3msQzxTr6Lo2LMKVqTjQIZzgFKEJ4=;
        b=Im+tK9o7ErxIyQ2Xq6R2N+EV/SabSlj3sxczV4QTjVqDIgkRXBAOowsew8fdNTh40X
         ImFCIjaz9FG4BFFbmfxOpjcoO7FThsFwxh33BfgO6YJxDYSVtfjbih/D4Y/3pH2v6AEp
         vkNr6j6XMy3sTlohNNDEUpwWrXy0TlNM5D1CRHMIbIZBkV+BtFWql9B+SJGogGEtXcMS
         FEMqzEOb7ei+SWSPBLBYR3pCXEnzoXyZREAgm6/nZueNGF9sSCyW3lSXcw84cMO1NguM
         V5FeriYq/0r2VcfCbPht/zJUt7cxHMtqmmq4Ssm9RH/eYeuKwfYJucGiiaZBWSBQpBMg
         laOw==
X-Forwarded-Encrypted: i=1; AL+hErEwmODPTbggwomH2wGBL/eiQqDKrZO9gDvjpgnGuVnyZgj60zLm5+F99UPqXk4kgnejtsEU6K6fDQj6FA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ERFwkNLmiVYW0FREQtjdL4wzCXAdA1RC3OZXq83SQqQgpRIGf
	IDyvq5Yfhz8EkzWPNf29Li8weezRSkkJgbouyaivWkibAbS2iDDa3pyev9HcuRFbnrU=
X-Gm-Gg: AZFdTZeQfBhAw7AiVwzXN/Pda8Uf+IxhLdK/B4n1rYOXHeJH2mr6XicW6yHXt2HcmNY
	lsqd4y4FUPLtZXoGIq0pQQooQmumjMVfjurV6NEoSKAxsfReNRYt9HLj1d3dkZuW1GcFJTwrX2C
	oOG8RpJDhciTFEP4o+KTorDR8N6ijq9QZ/Fnx7I6Ttf9N1YPynGXrkJQEpYb4z3UTh2P87o1sCR
	892HinWR2NMfjZ+hwtZwbIFONGOqsff6hkuy2U2oE3tWuqKP0Yhi0vsyUFH9+e5xNLStRPZr+CR
	1sKHOIyfJ2W1X2DaGv2maM262XL1w5wKY8D7xHB8EDtzG6CMBZf8TkkUY8Vz9lYrWNjil/MSxPA
	2tjzoDD1iiTBRBkwebGZIV1Ovrel8Yl5sNCYvwRwkTzqFOevwbL8PtErWeBSYrvQ4vYCE4To7V2
	xRdq40Kn0xJXL9614BePz8NEWQCdafIqVCgrpcDCgCAC9PVAAjgXZW9oEE9tpCiXdYNfb3eBHv7
	s/xaixNitLr+iDQAftszcW9cZp3HQh6nOP1cHiYQ7p9Sqrfl8BxTjozkYQ3pL4N+uZPN3PTl7uj
	eGIRkktAh6dG584xY5d8u+PMY2QPCy/hbHR+h201c50RSw==
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr405948895e9.18.1795624126434;
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:46 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:30 +0000
Subject: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
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
Message-Id: <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1549;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=pw1yVugjZoJ1sYzSavbjoh9EtNi40KpLFcyq3KxCgNo=;
 b=kcHPBXNDukNV21LLTOphkMkZzHhEUE3GVm5MT4GkuuM2LkB9EPUAINUu71xJWBBbyUPxGyGvR
 NyJA9ZKxwfTBYz6TriU3QIhP5Egb+QnpqA24EfhtbypOZI53FKPwK0u
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 2 +-
 drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index 4f6631950a5b..01048ca46a60 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -474,7 +474,7 @@ static void hisi_spi_nor_remove(struct platform_device *pdev)
 
 static const struct of_device_id hisi_spi_nor_dt_ids[] = {
 	{ .compatible = "hisilicon,fmc-spi-nor"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
 
diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
index 30fe2d414f07..71ee50eb1a71 100644
--- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
@@ -440,7 +440,7 @@ static void nxp_spifi_remove(struct platform_device *pdev)
 
 static const struct of_device_id nxp_spifi_match[] = {
 	{.compatible = "nxp,lpc1773-spifi"},
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(of, nxp_spifi_match);
 

-- 
2.53.0

