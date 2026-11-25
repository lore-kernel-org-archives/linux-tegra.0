Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624125;
	b=hmcWXu9o157xxd7MHfFskxoUNbT25WhVcPZezGOIBfHnyxtar0PQUf6znTw1XSEiMYNN
	 Rp3rS6qQacWjiAn9SxmkB0gqo2QpsDZTPs8XLy8gHu2UZVvKngfVrG5hcds1tipJJU0nK
	 ozIHc3TslQxnoQIqzNs4FlcISfOEUPnbjGdeafZUTC1oAdsR+szO30EmOVC2+YYcnH8k2
	 EJgx6Ab2dGS6L8XFtD3ecIer4q1YnLQ8+vKyLXubh4SFWdMtykuH1DTihw6QfLK5iOoha
	 PxslpeAB15LQhlmC8R6SI01XCdev3SWtPRPUpJn0KojFViwf53CUfMJDRq2OuCiQiug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
	b=WCaOnv72RBzYJNYOXX+bvJ/8pWYdRTHII0LxLc4+B3KWCnB0HeVXb5uyv/ScGmpad3FN
	 85dRabrHsUaJ9KTsg7CeGTaeE7p64ymFOECAsfld0JoZ3KGh3b6v64eA2+vudJd7G3qpE
	 9zr757hsx9Ic2Bu8gHC2sPzUqvkmUbW15LHLX1n1y6EQDNaNcTVuUEXuzxPCgUbUdhnc0
	 IKoSaKqI2RuR3+wqSEZZeZpsgDtZJPfkEloWI6gAklErZpWdkxdmUaB6C4X6JmTi/u32e
	 9DGXbvQhEmnLOxF1oNqWenb6WngHHh5DOhFhWms1Rpm1mVBPdF3ZcY2gp8EqS06YoqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lo7MJUFE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86958606A332
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86958606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lo7MJUFE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so61729875e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624124; x=1796228924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=Lo7MJUFECANehTUUolZEwHLlSbcAVnU/5fbdfWieLfVAhlye/yHc4o0AYGdoSIbUqA
         azACxwY1sGS2+BKHaH3yV0x7vslu65W12rRVOyXqDf+WYwxWmzJp6Lt899jSwME0Wh06
         zNOmktMVqNHpHKd56kNtM4Nhvpr+Pch0j1tkSkKfiytMiOKltCs5Ia0do+A8LVErsX3/
         ci4g1dpE7Sn+z627yGypM/Jrl0Xx9t0P2dgbkIN3fI61XZmyut5vaVHjr6CPfCdskW5N
         xjH5SlEX0nUixO6+do7UGprtp7LswCzRoQicPQ27IuwIbrJlWjhVIBBtDcjTTREEzrcH
         ayhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624124; x=1796228924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9nhx36rv66fiz/y7GxdJ9BH6dutjbJDQmWR3T0evLU=;
        b=Pe4GF2uZuvp5lbxNXZ+hnIdbip6P6cojk5gAjenrXLuq9A7vfpqSaTbV5o1S067ARo
         sm2TokxVjin4Eumrj8Wn/5w0TnoJ7a6r4vpbcaccUxiR+GBHWvGtr96hexbu7CV2O16o
         7uhFlLqlteZrIKaTt8RCi5ITg0m1Wg49b1d3ZYCnJLO/c8twoeN1UvVbxLN1iKlk6tkP
         HgMK5aXy//9VuJwbmSWqkGx3qrBawW0zEgvomHZmLkqTz2QnnriVNCLsrERnF7Gw4ITi
         b26DoWbqKIUBJ9Oxj1qu2FV0eogC+M8hEVYnHQwwtcBCPw7MI5Zb9tI1uIXjSjGL34JB
         Zp+A==
X-Forwarded-Encrypted: i=1; AL+hErEfaAoDDZziZsZdueVW3KBv9j0DRQwEradmDf5xE89H7SjxSdEQbu40M3XXOkQo9t51CnbeIYZ9kvvR2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/T9+D7cq6PHO+bO5S4/7LQ3RNt/8b/hZs5OLII2pnf6OEmMZ3c
	m6l3NqXBeL9kXufPLA81Sk6lkmUTT6Nn3rXhdVAmon0O1KKrsAqU4Tqvi35bcOD0isg=
X-Gm-Gg: AZFdTZekUvtdu9aBr6tBGpqoa54G4zLdJlXZZCEsdDiQQDpPlti5jv7JA/2h1qCvBrz
	ZjvueTdOj5M7UxahqwNQtyQtS7xAgAfFT3L3BiTkwnPvY3badrMMcBmiCgQddIv0G9JVW0tG2lK
	obJBYIJzn3nNTTOSOTciejZhMZKy8X1YNCkKivJD38A5ukMufjifqEo4d56Ug52ZiuG9L30v8sS
	bw4Ig2ZJsCAx4bYXkgs4FlxTm7LpKssKZc4A/BGx+9x07WXJ0fjSA7g+n+XFfnTiyl3muLiZxg6
	hw3DP2WQ5XGRgZkhW3bOfgqhkQBK0AUfdAs4fJu2BA69p1b6Q3BTRL1iXJydBKcHXN0ylW2GkYR
	8sBm87CucRpNRgJValWKpSZehtGFFmG2PMD8Sz6IfHtozxP2pHltG+zxlhcz6CmaLnQr4q1dv60
	fuxDFns3n9GVDQL6YuXPLmaKEGVIBTAE7YgK8D4sWQC+T6AUnZWHutXZq3MR1eICYYdjkJKKvPk
	EveGbSarwryEd9dkvbz8jtWvfQBCblZRx627sdn1d0cIJYPsE9g3VkAcNSpGBHT538Zwb2UhxgH
	VASAW7nc0juthIeJ7FuiiSfREmoRtPh3D4B3gV8ecD01wA==
X-Received: by 2002:a05:600c:848d:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb88810b2dmr361648545e9.16.1795624123960;
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:43 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:29 +0000
Subject: [PATCH 03/10] mtd: maps: int0800: Use named initializers for
 acpi_device_id
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
Message-Id: <20261125-acpi-mtd-v1-3-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=833;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=blggJzzi34PPFng5frzDjV1f6bR0P7BZrevZFLsW314=;
 b=ZHZnM3Lf8DzUboiERoH/ypcNIiAQvRVlt4l5CMlhz7vJ+CymRE50z5L8UPm9qLmBzcXPpEYvV
 3V+SKJgc8HhAzjwEkWT9COXnLzIMM7NmIiKpGWF+rOcWTSAb6lbGtOg
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/int0800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
index 1f5a7c4936dd..feb721908989 100644
--- a/drivers/mtd/maps/int0800.c
+++ b/drivers/mtd/maps/int0800.c
@@ -88,7 +88,7 @@ static void int0800_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id int0800_ids[] = {
-	{ "INT0800", 0 },
+	{ .id = "INT0800" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int0800_ids);

-- 
2.53.0

