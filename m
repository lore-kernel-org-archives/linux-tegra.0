Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624123;
	b=Vv4yhtncxbs4iokwgu4ZqQMzCHe8zpIbpbvUUSWw97fhF6xvr249vLqtlSONtiLg2Kfx
	 V9kEWH+D0FI5PlGpmDfZskt+Qc4ZbGOwX8cglJjqnmeIlVyjRIcp4PaFBUWklu4r7X95Q
	 c6qa7rsCGzblAffjv1ZfWY/Wz2PJHfmpbWUgKnHpdlW27sdiAxbK/4hwjBseATVj4GVdA
	 9FCQ2vCLBB+2b/e321yARQ/qaIvTI2+37DHCpXXTXGS+h0MYvPyk9yD9GsIp0wE0w/fXi
	 dpZuwBitGkBitDwxKz7EMMH1kLSvBtu7oscigxZpTdizZ5S3iHKizNAWfeDQspU2bEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
	b=sDDHJKgnNK5RwBrfFX9RmvRygn53xL2l9AtQykk+k2HzfNSC0SmSwuBBmzaWsZvw9F7s
	 HXhPTVGfL6tMjjmODV7gHgR2lK7qhUkYAHCUHvgGrMiH6iZPT5bcAsOU2GEZGEtOUN8UE
	 /0nt1AOpF4rqfnm+WMvQi3xJi8oirN9ZPxT0JPUbf8LofkZkdyXTJt/51C5i69gyaaDbP
	 eLU8TDIa5x/msKgD03tXWsF1ZnDMX5iOfLDhCnvOEE/gP9OUdq081pZwYJA9BGsp00jor
	 xDIIA09Ea9iIn5h408YzWGmju8wPZ7tghdZCjscEHoWID93fsUJBRCgP0VGTEDemhJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OOorFVPq;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E11B606A334
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E11B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OOorFVPq
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so48205065e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624121; x=1796228921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
        b=OOorFVPqDuMANUYIZa2ZBqgbYBRFch/qkhvSgTVpGdFv4fmQvnNQcp9wEcOzq4qhA+
         K50QVkNh/6lFl0Ia6y9Er/V4PG9ogL6MuNsAJyy6ZeVhalh9vmJWwW4Q4XoWCdI1ZgKj
         bdzySKSnvqTCRAin9rGoLJnhOMQ93ssUwBpCPEaNpF2hAz0VgQV30uTQLkjlK90PGKI9
         cLkGAK817xw5BieMhqOae7PFtn18lDLWw93uP0ekg7na1xJEgVLDmv5w050NWY8BLhs7
         2r9IRpy1+K/idI5gin+0G+6KijC4JTy6E23lIfLMkr/r2mYXuHPTvtWpjrh5ymhocxx1
         pbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624121; x=1796228921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/Paw5QZ9QxbXxzyBtlunqj4eITAuJB1YG4IYSSOnm4=;
        b=GBa6vFgKescE1mcy9Bwef4CrcNcmqtp/s9wpcVuAEvuLasHTjDfEc+Tgr5TB1xa01W
         UO03IIa9yFM6p+R7y8LF3Zyf3NfMF9pBb7Mwgu4ncg14W6Z+w2muMLCKSyUHTfDQuUq0
         spsH5pmjEek/WZ2+dCX6UoSPbcyQn8mrSeWvByfauoq7MG1ScDkVcjQtyRFPGKaTyrkq
         VWGBo8NTQKY3oGxLqhDRtzkaVrAB69w4LuH3sIndtJXEFvDP+950DQbM/FlpoXU9r+tp
         85Rw7wXHJ/MDP0uO18gEoTSRbqolsQsaV3B9vUeMb4MtqTxK1P3kZy/8DbEBnkLE79Kg
         YK9w==
X-Forwarded-Encrypted: i=1; AL+hErHVJ3ktkER37CaxUIV3yTYRt9P8Qg5PiAAcakBxzZ1Zm3sspqsELqPSuae/oe5ZYlaPLI/oirCHBt2EXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bByLiB1Lu8UMhggxE/1AhKm+4rg7p4i2QTp4v9p6LiNYlFD16
	33Vnkejxyyl1PXpJ8+1j0KK5TlwLbxACYi4Drp0X9//mRq+q0/+VhHpfxTqOyYEOXKs=
X-Gm-Gg: AZFdTZd4T0nDBiLgIRG09182DhF9cigDmL0E5p8uu5lzohSCFop9EmtG8iDO01yxqzA
	b3ZYA7XvJ7O3jECNo8gb9KGc+Q3DgOw8XHOAjwEjSy8r2H0/yKOhiee2WaOsYPk3X/9ouTgibMe
	awwaIspu3Sp1sZ5vpOD9jpope3yKvdboqxXUXeB4dtF6OYNyRgsL+dZRbmJzLxmJVrTH8RIlmue
	DViiDYHSIZV4joQYpNSYXYBPXdczcmJ+y7gewpdrqHlSLJjKIlBlWXBfOKb3paJlPh5un2E8Isu
	hAG0YulU4HDDBU5QZ+BuPn4FqwwR6I1Q/Kh4ucV5DhaXa4k/2cIJ2zVuqGRqGkrIWTcIMKTH2dr
	KskiW+PIWegYRQMbjDtEnpak+59VVPfdIAK9HzYqvpLjJuD8QCWSJ8qMu9G2KmlfoAvmOGEYdZb
	raFtJj8PyDC5Wrb4dq3cc7kPjgHF08qJ3vDtsqjIStTxVCc0Yir/QHvm8K/FkutG5NZhc2aUQnC
	o5ZEeGFs/G+qn77Y19ZXue+wkPNH1PID784yzV1BNziAD3R93853sHENxdTyLCdssnFJbsXbZ2N
	R4B38uYGGIAmwoddhp6SbBUYt0BVJAqHgu1fLdjRo2SVdA==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr367205855e9.22.1795624121613;
        Wed, 25 Nov 2026 08:28:41 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:41 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:28 +0000
Subject: [PATCH 02/10] mtd: spi-nor: Use named initializers for
 spi_device_id
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
Message-Id: <20261125-acpi-mtd-v1-2-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=4183;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=oSYQ7Bs6TY9Bq0it7ME4AMa1HN8RgNqdeSRr8O3thOM=;
 b=ZzYcsPDU1eT9Urm3wkVmXrHRSn8lYS47jYwodaBWVXhHbdUtk3xdzrjUw2pFBpCbVfZ0+gfNR
 dIrCrr0zs9uAk13TU8rgxCJLHxUgZjH9xPYqCVfddGmUaS8ISdiG+oY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the spi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Put every list item on a new line and unify the list terminator to have
a single space between the brackets and no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/spi-nor/core.c | 77 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..a76c669000d8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3662,42 +3662,75 @@ static const struct spi_device_id spi_nor_dev_ids[] = {
 	 * hack around the fact that the SPI core does not provide uevent
 	 * matching for .of_match_table
 	 */
-	{"spi-nor"},
+	{ .name = "spi-nor" },
 
 	/*
 	 * Entries not used in DTs that should be safe to drop after replacing
 	 * them with "spi-nor" in platform data.
 	 */
-	{"s25sl064a"},	{"w25x16"},	{"m25p10"},	{"m25px64"},
+	{ .name = "s25sl064a" },
+	{ .name = "w25x16" },
+	{ .name = "m25p10" },
+	{ .name = "m25px64" },
 
 	/*
 	 * Entries that were used in DTs without "jedec,spi-nor" fallback and
 	 * should be kept for backward compatibility.
 	 */
-	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
-	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
-	{"mx25l25635e"},{"mx66l51235l"},
-	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
-	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
-	{"s25fl064k"},
-	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
-	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
-	{"m25p64"},	{"m25p128"},
-	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
-	{"w25q80bl"},	{"w25q128"},	{"w25q256"},
+	{ .name = "at25df321a" },
+	{ .name = "at25df641" },
+	{ .name = "at26df081a" },
+	{ .name = "mx25l4005a" },
+	{ .name = "mx25l1606e" },
+	{ .name = "mx25l6405d" },
+	{ .name = "mx25l12805d" },
+	{ .name = "mx25l25635e" },
+	{ .name = "mx66l51235l" },
+	{ .name = "n25q064" },
+	{ .name = "n25q128a11" },
+	{ .name = "n25q128a13" },
+	{ .name = "n25q512a" },
+	{ .name = "s25fl256s1" },
+	{ .name = "s25fl512s" },
+	{ .name = "s25sl12801" },
+	{ .name = "s25fl008k" },
+	{ .name = "s25fl064k" },
+	{ .name = "sst25vf040b" },
+	{ .name = "sst25vf016b" },
+	{ .name = "sst25vf032b" },
+	{ .name = "sst25wf040" },
+	{ .name = "m25p40" },
+	{ .name = "m25p80" },
+	{ .name = "m25p16" },
+	{ .name = "m25p32" },
+	{ .name = "m25p64" },
+	{ .name = "m25p128" },
+	{ .name = "w25x80" },
+	{ .name = "w25x32" },
+	{ .name = "w25q32" },
+	{ .name = "w25q32dw" },
+	{ .name = "w25q80bl" },
+	{ .name = "w25q128" },
+	{ .name = "w25q256" },
 
 	/* Flashes that can't be detected using JEDEC */
-	{"m25p05-nonjedec"},	{"m25p10-nonjedec"},	{"m25p20-nonjedec"},
-	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
-	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
+	{ .name = "m25p05-nonjedec" },
+	{ .name = "m25p10-nonjedec" },
+	{ .name = "m25p20-nonjedec" },
+	{ .name = "m25p40-nonjedec" },
+	{ .name = "m25p80-nonjedec" },
+	{ .name = "m25p16-nonjedec" },
+	{ .name = "m25p32-nonjedec" },
+	{ .name = "m25p64-nonjedec" },
+	{ .name = "m25p128-nonjedec" },
 
 	/* Everspin MRAMs (non-JEDEC) */
-	{ "mr25h128" }, /* 128 Kib, 40 MHz */
-	{ "mr25h256" }, /* 256 Kib, 40 MHz */
-	{ "mr25h10" },  /*   1 Mib, 40 MHz */
-	{ "mr25h40" },  /*   4 Mib, 40 MHz */
+	{ .name = "mr25h128" }, /* 128 Kib, 40 MHz */
+	{ .name = "mr25h256" }, /* 256 Kib, 40 MHz */
+	{ .name = "mr25h10" },  /*   1 Mib, 40 MHz */
+	{ .name = "mr25h40" },  /*   4 Mib, 40 MHz */
 
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, spi_nor_dev_ids);
 
@@ -3707,7 +3740,7 @@ static const struct of_device_id spi_nor_of_table[] = {
 	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
 	 */
 	{ .compatible = "jedec,spi-nor" },
-	{ /* sentinel */ },
+	{ }
 };
 MODULE_DEVICE_TABLE(of, spi_nor_of_table);
 

-- 
2.53.0

