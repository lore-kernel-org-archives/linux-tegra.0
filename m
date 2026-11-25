Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624135;
	b=cPQVGjFdeZ4IQ7gAvGdI/pxvin9HFqLas+rzS+P38LXdV0uZNsaBINTUnjF5Pe3TVm1N
	 4Y5MlLHMjXJYgTtE3dAqxPunIitswavzvYwrWPdAo8MOfPNH+dC1OELbTztZsjVSP/e1V
	 szhz6v+JEO+CemyDjCCF7n/GVgQi1XDAyz6ZbMUU2S1ZnMNkitbJAWrZD2QfIXJVSREEg
	 9PTEkk/4nRCKqIlek/hDJyeXW39vS1njcvNwJpLQT+XuC7hUutiaNlHHkJt/50HyZwNqC
	 MpQ0/0cxxcWyge1zLQBMV5FkfPaXvTzRZbfeQFzhYWgnWwS4+uE3EhqVveNCiKA6k6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
	b=kNOveULUQXXi/e0ld9qPYMeRNo9FiRphrcm6fnQzOVCz0GI/GkvH3xOHrU3Dfl7isem1
	 kfOwtECSZ4GS86zYcFuho1mcGXQfTgiRBxbSj5tPGeTRXTI6uMls9HRoZQ99LlVsdNlc5
	 atOaNCNKz5d9uWh9JCxkFuLARqRqyu4WYECWn0eVJn4t/LM2hbW5GiNiNZFy1/ZVaaOs6
	 +AbM3SvjtpEiXbrSxJ06YqzMB+CDUFZNcXPJH4VKc+QFmh83As4I/2QH33ZgCSWLRC0qE
	 CM2vaOqEncj0MxdSIPOlvPQThtFrLwYM3+ca6kT/+t/vUekqSMmSXW/Hie/WADJREkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lB9qYEvq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19928606A323
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 16:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19928606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lB9qYEvq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so34881355e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 08:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624133; x=1796228933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
        b=lB9qYEvq1aq8iOrrMA7Sx04sw/vYKvALTLOlLDY2KO92Cr0N6JlcOIDx3UXVdpHF+C
         kw5WAXUfVhSvJ2xxY2h0UtIM4rbV/wII68xV51MBe1wpI1tUdE0u8y+CklsF2IrEHwLf
         3ZNGg4QBrfbFwII6I/tucEdzt6kCZDZvN2rW6F74LA7YdZ+b1biJNF41efElFfN/KRmf
         wlOvN7xll33UcQ5IwewzQz0dOkCWvnmB2H3aGwFkfBPmiTSICQJFksGJ85+Myi2V/nwt
         GxejVEqHYlDEuHGnikccmjn0t/jjChiia07XhyQ+vM8aahkCHjwes7+f23BunF/p1Akv
         AXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624133; x=1796228933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
        b=cNg90VRVssJlQ0ob93HbitXAnZ9OcjjHJkV34X0OWvz72sEQbVpHD+VP+yoGssuH5G
         igiH5k4sxvlivmL7JRIhabQRO4QElPyjrDmT/mDTMHYZgwa//yJnYZDJT9YRmoUs/wFv
         GLMdwQjoD3TYpcjJNvYGwAeRF92Dltzoj7CneD0sfN/m0jqX9JyXAZyln+PKm2c//vqF
         065MARRdQTdTW8a7ECGY2+cFtVqf0zJWtrfKGHLqABWCNRMF6/WdxgKo0yr7QLz2RwDe
         f5WL2PPgGEwiMEsP3mFlSSbrI+9r5phjqlsFJhUwQKpsD+1muJdro6120c+kIwyndniV
         6GcA==
X-Forwarded-Encrypted: i=1; AL+hErFjegkOfo3NsgQ47ulEM37fr1nG+yiSsxprbN7Of3fKZNmVIAkJJPDXFnjIVbR/spqQrLnRwjJqCRZDag==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wOTGm4aduGW12Ybfi0S7FhduNfY4nhEP9YwPY28ZanOtvNLd/
	JWReE0q36gCIL947tV6JMpLvpesLYAhS4wKXtKGBpYLz7T/mtGJLsjRFUE2+8ZbLqqw=
X-Gm-Gg: AZFdTZdgAxF6AvDF/bR5TNT+/bGNAi+2bfKQooCcl6yHXEVs+iaA0NZWWs1nGx7bjzP
	7nyl9XRGS5N8U7kuf8EstE13AAfwW+OohyxqUKBUSPp/TNh6q5ohTPLNI+kKAoswkJs/tpmsvfH
	F083Ss6dPK7n4IZkLsGIXv/zyGYHbMlg1N60GTLl10zSNX6YyUag/wB9K87tO3naZxpsgG1H14j
	ehxpCIW/CXd8k7jwTLPSDuC48KP8+ZwQ9IvD2ixJIWfNkvVzRhHrNshAXOmlN7hd6tLWw9daHkT
	1oIZos+qAF8lmxSDyfMlvMFkTZIWnJpG+xL2x41bC1ZfeDhCtKrx3UYAS63WLApzFRWMelbYmPe
	PkN+cy46fSzre7W8b5c92Q8esloKx2COVYC/u1kGWr9hqYnr+1XJm8xZ46CGRHhwur8e1ttNcZU
	wOeOXy7oX0Q5gn1LmunkBpxTTkoENK1hv9Ei9X8patYcl3r2NEPnJizAQgBfugG/699DIWsniX0
	v0f/xdn5C+0Ff0Eag1WWq3CnkR2X6LRkP57io1Xd7RPloEbUHoxgyP1+VHummjFX1uHnIn6KDug
	esktezKunjBwozygyEaPrMsNk49yQ6HZP7TeYlWJdQmBpA==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr367217635e9.22.1795624133592;
        Wed, 25 Nov 2026 08:28:53 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:53 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:33 +0000
Subject: [PATCH 07/10] mtd: hyperbus: Unify list terminator for *_device_id
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
Message-Id: <20261125-acpi-mtd-v1-7-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1400;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=MqS4iZQmtSnMUE+1CE4BRTfcmZv4r/EuEiyu/lunNWQ=;
 b=RjOJCajFiP9KV73PmMUa7M74MYmvCY+UYchwJ0DItvXMOOEvWaLyZVGGPGplnX/bvY7hOn58V
 ubNzVDoXbvxCV3x0jZyFUwCc4fN8Q5ycQmLU63Q+/GExIGSiHODobkY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 2 +-
 drivers/mtd/hyperbus/rpc-if.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index acbcc3b55d86..bac24d9ca02b 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -255,7 +255,7 @@ static const struct of_device_id am654_hbmc_dt_ids[] = {
 	{
 		.compatible = "ti,am654-hbmc",
 	},
-	{ /* end of table */ }
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, am654_hbmc_dt_ids);
diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index 9eacc9ec7382..a0917f407d7a 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -165,7 +165,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 
 static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
 	{ .name = "rpc-if-hyperflash" },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
 

-- 
2.53.0

