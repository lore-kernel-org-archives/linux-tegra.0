Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082385;
	b=jC3kGa3X5yTa06l6R2Ej+BDo4Hoc71JloOwUOlt2cr/r+NM5jzluQkwiI7QWZ8uebM/E
	 ZvsjaCk6KzI6wtcYYFQED28mOH1aK0BkgLX+0KjXdKuCDYNItpXJpK04M+9giSJ1EdH0g
	 2KD5iPmkhUmHuOGaoAQdEnuxHkU0SZQtnO3TFmBXOwYQhtOOZuo27nzPYQqBOBnRs9ZUb
	 Zzv+A8pcYif8CvKPQJPDjFMZuidut45aEMhB/twSpi51lHRdIJB2WTEfyiEz99bhgrCUE
	 AklrG0AHnnTcrqVNVqww5sGiLx5yqA3hyGrAz+gdSUgd+mYYfS6VWXn/u5/DLTkmIBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
	b=puFtTARIOcSZNzkrO9/WA0EToRV1ONrrXdinEdsEm5gELda2j1D9l+EPnHI0r6hLbBut
	 sBJCoLJtasqhU0CORb/wV60ut9MDW5urqJ7AI2S7f5wsQmvJ4FrovhX/s7PZM94RXA+os
	 oHySpnQl+M0k7L1NR5sJZLYHXqiBx1YeF5eKjaUl8JmeYNGLTtyHM30b2iD1XjCpLcAN0
	 M/8oE9z+uXNG/6P+plpKIG6T/zBfJfN7Ms3n0jZaWBNvtW2yh90wHN9E5J/GFR6Uvay0m
	 Yvgu+aToPLxHoFnBSAkKOoPmPnLmBnRNLcZtqwzf7CfpuZaP9eOMm1X6JEooFUp+51w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E46606D817
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E46606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-53ec2cc397aso8788b6e.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082384; x=1794687184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCEPTuAB8BTrLNvcVsDlta09WPBy7nz8SllM0LSIn30=;
        b=XggYavTI86hySvkLBevMUeZyTSdj/8OCVkmfmp2zS/odGvuN59lxDrBv8qVk0j3PP2
         /JfNABoT7zUMyUPNkGlA0GiCY3/6DOlc3x3tgDJniZxoM1aqlM1pVdd8xFARGXDryuhl
         mlQN99+fyVgDdinn4ECLdnbpAg3YRxlEUZWxMPBYLG3Z3ePLD4XLiX5KM+sXP+zfj2Jj
         mliPguiRjQBKeVbtPLNSknWqrb77VjXo0duII0bYvwhn33kw02NleLwAsPeBNun7pVRQ
         a6Wxa+ULTmw0S5iipskwwsobTy9/ZKEf6RzZCg/vIr+38ZmBAYIr1qdDUtJKo8dltrIv
         DhzA==
X-Forwarded-Encrypted: i=1; AKwUvBygjMAJcN6whx3LPnSQ2rB+nkR/VVJc0UG5a0yHQM7sKEW+jhlSNYv14E6t2VWyrjkeyvP3MMktnFJwMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JvFITUOU9eZGvuD5wMQmnl4AclImurda0JaFrx2TDTOSS+bC+
	TdDsyh/bjLeXymRur8o0+fGYi+oqETbsfRdax/bdSoHjDn3N0XO4Xkld0/0lp+if5lg=
X-Gm-Gg: AYBFou3qY93zZbgrR+9IM1c5jcC4OWn8hKz0sN8F1f3BjXEJC9ECWmfxB1jy19A43wb
	SktBjicnpJHJcT0acnq7vYqM/CE0/65WLEjtZ44fyDTfXE7jW43U7dCmHm/z/ff3zl9uVHQoC3d
	NMjjt5U6pqnO+7IfN2IlZ8l9h+WRmmk37HXC0iamDs9y7ToVvO9Shp3aoFPjrsDe76D3BUYRLGM
	dAJoaMrhtnRQoMv8UHRZKDqhu8cwIs4YKqbckG2+FOviRJeRqydYP4abfwOA5A8c9j9UvQE5+Tz
	Fvbp35VS0+4TVV5LAV9Cjpfh5IKjdFM6KhtEjVOMxXPZ0e7hyLac/SNS4vo/6/8y/UElEUovYWB
	6DlXI6i3ABpU6T1c+iT6usMdm4efEa1+q7AnjuhFGIJSbN/62UE5gBfgF0nTyo0wvrVyj6dEqtQ
	jqE+ow3j8EcpAEIfD9ps3DfzAPnrE6x6gdzxl3M1IGLNcx4ibpZ+qFE5GDdMHK/HdzKaKu51YE7
	2VasRMJT1iJ4VZDx4Uchbsk/C0mbrQ3+6dZXIiOqXGV7JMoWkGCO2XtiK0WvIWLV1ABDxkVea8v
	39MAJd2c9shLk1m/1ltq8Y9ZRbKb95tYZt3BOhPtR50hj586jkKX185RzhXr
X-Received: by 2002:a05:6808:238c:b0:4f1:c824:fd06 with SMTP id 5614622812f47-567e14c28c5mr4851806b6e.14.1794082383637;
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:28 -0700
Subject: [PATCH 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-31-0181ef0cc4c8@gmail.com>
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

