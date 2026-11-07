Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082376;
	b=FDaBSkoxa1aRmAr6XRBJJbqRvwk99ReuiZorwt3rj8vG5SN6RQeSA9LPA72n/Yb4su+P
	 5tGSaAOjgTc1Z23Di6l0/l7GrOIl1y7Dp+VmvWKPhLzfVMiaalKUa0Tx7/97fHx9xFgCo
	 mv7A/AazrukVdIa3cwGnliWO2auDgRN58k4gdehU32u+kgTjT3MTCo+gAFRxipl7mwEmP
	 E4V3tyugPkYeZcCsogjbrBsscUDdqRba78DZNpwx84f9/FL0FGbyl3oIiYOCZgyR4jMFb
	 xfvtkhyg66/YghLKyCckKuzlqTZca8XJh8WmpPgByuoNdltWbleJq/JHzy57nW2r+iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082376;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=WZWF34gOVCDoNZBsFNBdQRVzEa1ZPBim3Drz0tOLXU8=;
	b=frVJDs9T3q75rfaUfV0hRQ1MAt2ADcKcnrLglWDAcZ7OrbXZb1FGp8Az7s2EWMcQHVTH
	 q3+vE4U9hoxiTfzmzuj5URJfaCBdtlvM06hfF83N9pI6vvanln1xTca5g30+oirPGDlPd
	 jxUv4NIuAP6ZtOxvSKPrZYNJVzj4xVoQ6mOoShq5CfvfxODzLkhb8+sHulZAyOP05+Jas
	 jR5BSTdrclLCXRpiIpSzHqAuWBi3/maVdsu4ia/VvdjlT++3wv5E00Ee57lEJNjkJCHrZ
	 BrPWxi2dDvR/2V7BQaAq/jhpizVBAVZSBg81C1hoQiUZa66eT5Zj35o0Co0nXnsv5pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7E606D801
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D7E606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6df0b02fe91so449455eaf.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:12:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082375; x=1794687175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZWF34gOVCDoNZBsFNBdQRVzEa1ZPBim3Drz0tOLXU8=;
        b=uXAY+Bo/k2ydqLZUacMFl0HeHEspj6Lkr+UDWDHRCOJBOxILH44Jz3SfQWS0xWGeiO
         qSyDoF4e+fikjlnI/n+mXjRXyI64IitjB2wQcYUMx8/ddp/MAKpkwSY7Kj+zKukGLOZT
         HzBm14YOzM68PKAB+NYRjZg/ehmIFUdVbdvqwmGFAHLRD/lfTvPFrhbPn+JxYtLLcNG7
         cx4kQVFLAwpAs/c5KWE80qIOJoOUYDHn8SshsiOB0UK8SNZ8Ax5sVePIC7uoMILUm7TC
         XS2H2m++qrRCc+QcS0ao/MSvS9GcBn7rzdIP1SEML2JtDbJJ1s7Cn38uU5FCf8yoMQ5U
         t3eg==
X-Forwarded-Encrypted: i=1; AKwUvByEYJMCcogKYLJxogjF8Vv2H2kYtyeTuyinZgVaDviyCIRZz3kRKELxbJglteueXmLuaQsEQyfYckYXAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8K8oWDVWdgQPIbSa3A1sWv8LMd8fGNfVdB6/8Rmdl4uGAhEOJY
	WPvxVOk/VnqDQNVdE2ijF5GBXx13HbfSRrrGE3YCmysYWzLLyRjBKv91InbscyNCSoA=
X-Gm-Gg: AYBFou3QkzJCDDebolY9s2fWvk1rEh18oDWttj2otNLIE8HwwZc9aZu8TtMTup+O6vw
	W410p5feTSB+I0+TyFf7v4E9TAQIy0BF5ydbcynI/FgBZFZXScqwG0DLwO4Ngvv022UWy0blJRs
	0FHjmFCmOtcOgSNIzrqO1YfS99vX246C/SXUmkilsB4BV17QfhP/qSioQW0zFPBlg5p+jHT+J9o
	gV21SmiuxUnLIjbdovIHjfXqJtXIFxWEfwo1hhMMAUNh2gUkbRjRG3UgpiOpe66TmeXmcpgq75T
	c5R7w0aQm2bsxn/4Qz2LKZL5xDp/FdPwLNfy+YzUvOpKBdtm4RCWbI6pAN0XUDleVrOWPnGMCW2
	FsHAUdGwDSuBx6cbvLFye2lZb/UopA2UDP/f+VYnkib63Hm/2cn81uyOMQif+FLs8fCnKwmchhl
	QYxx0GLx8cE8PrCUxvJFJqYjnOJi2YVYXXo1KmsBYpM5E9xik+SYFTz2y7tV9a33kTncvXyO+qY
	v4aXFPqu/DCZkIm+lmaEAfzNPmpqcABRT+HXn6TxQKAMqIkgBiiAOOKBOw5tYLULv6z2GinDjSb
	N3PCAkfpt8CJvY6MtXfwcvwaqZnYfWg8qlv1GpY6D8BWvFVqmRZfHCVHtGyf
X-Received: by 2002:a05:6820:3091:b0:703:6903:75f5 with SMTP id 006d021491bc7-71700d0c858mr1254161eaf.39.1794082375047;
        Sat, 07 Nov 2026 12:12:55 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:12:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:25 -0700
Subject: [PATCH 28/58] mtd: rawnand: loongson: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-28-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..49938c7b9453 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -869,15 +869,26 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
 	return 0;
 }
 
+static void loongson_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct loongson_nand_host, controller));
+}
+
 static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,9 +901,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, loongson_nand_release);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +925,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +950,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

