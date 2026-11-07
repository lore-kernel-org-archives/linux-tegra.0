Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082464;
	b=q2L+SY9M0wTTRqO6crMVwb6LtsUX5UnYNrQN5GRny4j9yr3HPfoMYt+oV6OwS3BhopMl
	 oa3St+WF5C+Wg7+37GqlcYFAW5ss/DGz9ZFw7yCkwxcxMsqeyKhGv+j7ws9mnWu7Xz3Ta
	 5e76f3MQyz6i268UTW/YQ2x8duEtqAD/kR136QppchSqXWc4895wSBz/BA7/tNEQ4Qovf
	 Eum7726OL1a62fI7bhf18715BruvtT4LQQOAf9ZsqZ5pNkFOvihqqifqoG+ZyYoAImpgM
	 ldHGrY62+u4Zuqm7uxm5/4tj79VhJvOrKqm8+3sPocDAXwyrAsas8OhqlzmMxcLRcQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
	b=bey+EdigzCJoMrAy+kJ8bpps/8plQ5pastrNOKs7T8Q+65StlpURSa5+g4bqKMxb7wUQ
	 4XtjIycJuBInETnFLY7owe7xEJrP4hqCcKN8J7WtckcM22trSF0hAjHkU/y8W5OKmD3wR
	 o+8vNGnFeQLJgccJWiV5gAEXisGCUOQaLELWzRq7YJft7uu9+qT/M0+crGPvEvVUCsVmx
	 RnTAWgnZ0RWSig+Xo8Fg6nZNjNjWm0V5/WTsTQcyjaV/6Nh7MbjAUeatYRahd9qLDFfll
	 7D/rVmetU2HyWWjVfNzCWUsuM3iPOFtRpEAM8/A/cazedwnYZe41ebJ0itE9X2MBGkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BD60A3807
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 20:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463BD60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df0b02fe91so449964eaf.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 12:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082463; x=1794687263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=DP73bMJP5D3sBWvjSXB48k1GD401Hw8l4gwqAoX3/RqW4gcEEXMzWk7Sj0zWoTQ2JQ
         JfCDW5OmRhPCqaMAYPudvULGsJJN+mQls01qAPhgaxqX4bRGqjdWywoBxnoicsEhSPON
         GjfbbTD5vBx2o/FJXscATLX7yupGkYYv8/kYPWsOADbZx8+rLwVZOgSzVQR8WNLhfBOj
         ofBsqASOVWHQ1YOsoj/8M6UmHXqxbaIQasVgxnvYMUEKwiW8sXH0ToAp13VUjgEP6UPC
         lA3lZIeVrqmUDnRzxrN920BvFMFRH/P1hxvm5Ho7NfUUV0UHURDB9xZ2NHxNr/zdg3SM
         ilHA==
X-Forwarded-Encrypted: i=1; AKwUvBx3CSKxn/KyS66ZnXVsP5eCmEbEPr4WIrBOZ3L0+Qx6IZ1tl6yqJFgEoG2xWCA0mJmm9LTh2mqMlIkxog==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MjiXK+QSvE4JKmihDvsWC86H4LxAL+NwG55UoS3Z3KWPyevRg
	VuTXR3YDYO7ZJx24jeNMAvxhMabJc1XjjTbffqLDszg/B+BXxBrQAmS8zGmz61DF6DQ=
X-Gm-Gg: AYBFou2FnFWBa3AgiF6OU8YV3+Dy5FCE9oFSCswEpeh6zOT8NwaBNYSm2UXnbKtj/mD
	W3b8ai8ctoMWGlgyHaz6jA8N6PgFrDfA2tnPakgjzJ1Yk5KyBnNGqUYsaKIDI9QAgcFaOLzcCDp
	gvrpcrAI8oB9+tBDnWgzyEkgoBSNSd9axHj+xNpk0Z0mEMBWwV5RHQPHZP49ql6zOu9n6WdLI3Q
	GlZnEjz5J5N+PFcrEv0KZBHcAGbKTRHj+5Cy5x8towXqAzVBd7Puwe5FMYU1KxM0yROp7EqpSUJ
	3WM0ot3egX7dL8KcShqyISiVo81x2qIiS2cl8NxEDHcuaPdbz1SmhAOyN0SkxeZlxqHu4K0j58D
	/qm2gg+Ip+LBk9lGCHDkmdNMB6bEr4zpKbGv5qtXai8sfWUmLDPLiXJ9ReUnrZqwLf82BRbYikY
	BvE2CdRnVtK7sb2dgC9ex58b4iVAYyavNVHhiwWPFtSB1ils2FK2PBPdOdTDLKlhAEDKnzVTIAn
	JOXkHOvF7SlVv9kkp5ozj8wEfFzhOzDrUmu7ctadXki3KYSjEofWPME6Dt17a9bdk4dJqLnsmD8
	NMqi44KeVM+F+YolKmyVC7GOzCBLZ6blOxf8LTnps2XT5gjduaYrzLIc4BPT
X-Received: by 2002:a05:6820:4cca:b0:6df:ac2e:85ae with SMTP id 006d021491bc7-71700c8606emr1101384eaf.14.1794082463049;
        Sat, 07 Nov 2026 12:14:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:55 -0700
Subject: [PATCH 58/58] mtd: rawnand: diskonchip: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-58-0181ef0cc4c8@gmail.com>
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

MTD device references may outlive unregistration during module removal.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..a4338b51b49d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1296,6 +1296,11 @@ static const struct nand_controller_ops doc2001plus_ops = {
 	.attach_chip = doc200x_attach_chip,
 };
 
+static void doc_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1494,13 +1499,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_release(nand, doc_chip_release);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1548,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

