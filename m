Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082436;
	b=c1DSA1SAyQ2Eqa+n0fpvv5Csv9try7i8osqPN+QEitTMWzVZutXP7KgPUIJHKDEtY2La
	 c0PO7HyA+DBbv9WEEwXpkvZobUP9GX63hZfQ/VurOTnVHacAtjSKMI/fSGdMOmqLX7REm
	 Btx6XFH2S+2mNXtUt3U4VC4joaNIlHNoTsMtieLom9m5jPrLfxAjMlzHcpMzaFm7VhvDc
	 53/9sQsw9dD9U0Uo/R1WsIiOk70P97UBp6dLBHpRKifkU/bcYwwElEC3vtK65YNPvbOAI
	 +b8ANmft8A6FiLSKn7cC8INv3RXAZcpy+bmuuzrc0WRJhOq1hXtLz3Eo/X+jWbf3jXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082436;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
	b=EX9d0DSDt8bTNMG8n8n8E13sXsMUwTIZLcLwsgp5n/K8Z469/oo1PHzFTQF+4ew+j58j
	 kUl7TgRmU9Jgoh7qzMfDsVXsa8Bdiubts5ep7dfQYpJofqiU7604Is2qffL/evgMIrm62
	 WaFmQgepAb3Tc0gkrSVkHQ5+W+YWNld8Tcp1PXL4xdMZoTIyYE92QOTzE9OwRoKMR+tAB
	 L5tINmqDLjbwXcCwoIZJxbl3hlGAxNNSZRujuHo7U1p42udZpPdQnaS11aCAjTfWKXbzL
	 x0vzue6cc574GAE7fVYOUUYFfsE5ID48q/Uyx+8m2evnHYEKO1DummPGpHHVgUP2xPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DBF606EEA8
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41DBF606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6f8a519e215so22932eaf.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082434; x=1794687234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=xRg6Q+/RWtCMRDxBo7pz8zf6gF7DD+6Jsev1Mb9sKLtEvVhX8FnewA9tOyolO/9QM9
         CD3CoQ+Sn47d9VU+fQQnUvhXojWCX2ec34nD2xvYLMJoR8rB6jfZCvi9i8XV5PT19cdR
         5WlwifyFTIlCjQcMfc53fjY5AKm80nCuIGnx/H6IPVDnvVsnMJzzmkZW/J6a1Nq9ry0A
         1ZVhAsWF0LkRc6xZV6z87IWxn/lRhC7isu+nOk7ZHCgboYIjMPSdb2upW1yGAdzsJ+sE
         x13UtXKZ/ecVhaTh5JZlTSM/7Q37LOfj2fCkKMAza720nz+jv5ofPW54oMe8abFAsZLE
         uvBg==
X-Forwarded-Encrypted: i=1; AKwUvBxMXJ5NEhjWusn0/7FYs77+jxFUZckpv1ST0SqlA4nMjCs9qePaAJeUH8OE9k8TH/BnI3T31OkxDsmIxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fe0KZXCBYksh4IKqKmz1p4qkQrNRdDJp3GjZY6+w/QQqfUwkc
	cR2DGX0R63BvI3fT0SkpG2hPGQOSzl1g2ZCNYydYCfrarCpu+F+khTYaegcqMYOrRiE=
X-Gm-Gg: AYBFou0c6tsCc7UCtI07hzdQ+nLNJj7xtD+qcJVJ1EpVGPGUZxi80TaBr54WtE4eI69
	vs6ZX/HNL0hkH9eWNfpxNJdyFUcfcfvPgcgBcq3Mxf9E5A+czoCZxoyfEFRC6CTl9hiqw1Id/79
	fzYSFJKZc+5EeYq1vCcgGe5PEvR11jqO7lcGiForjM5tTiU0ADdhuH++QRXez/kR60TEGnnsD8R
	k2lwlJbMgfwO4J2ILI56hWDj5W/5nVlRfXdGrh8rMnAedp5leyN/MmsERqn6Yglbq+PvYJA2RgH
	0kggPGam4RqhqNC7vxUXDjssLKuANVurVxo6lgDZA32G19vwvYjBvNQYqwB84km6Z7K5SLXzGEQ
	Jvm0aVN8RvW6QAVqHk6zwa2Xym+b/hkd7T5h/PKwx3avckvISlwoUKIcts9DPOT+XWJxmC+jWUz
	huQubWxuI0rsAJg3Fw+xb6wQxLq8abRy01B9iTd//oT+7tHvjurWZcEScF2iS0w8Voha7pm84Z1
	ajE52OV2TYLUCzN9G7iPHaZef6k4E/1A+0Y0mZ8jwVoyBIXRFWnAw+dIRqkn1YuXaktfneWahMh
	fpbMGKMVD9YIvQ27uTvCZ7ouwVTDa67nb46Cv1sdkYD0iBk/m7DU649uvf+g1uXFeqnCuD7Z9/o
	yjz8Mzw==
X-Received: by 2002:a05:6820:2910:b0:6f6:baee:3ccb with SMTP id 006d021491bc7-717009e3477mr1267617eaf.9.1794082434177;
        Sat, 07 Nov 2026 12:13:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:45 -0700
Subject: [PATCH 48/58] mtd: rawnand: ndfc: retain chip state across removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-48-0181ef0cc4c8@gmail.com>
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

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..50506ad87fd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,13 +171,27 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
 	return ret;
 }
 
+static void ndfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ndfc_controller, ndfc_control));
+}
+
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
@@ -187,11 +199,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +214,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc_release);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +259,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

