Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046589;
	b=LKPnmwrqlS8pIKarXwTaPLiAr5AK8gOSkezeSOySiaP5EY29CV1EbD4w/u/8o6Y7STPh
	 BwGuw2uw9gSyEdQ39RizD9QL8jbMGwmSnBR5/7DPDREPqY/snuQ3Juln8QJ1ZxbzDk1ZT
	 HJVQiN/8v87sbYTc1cEmwTuppw+KuOJ1eTnicgYvDnxDlzdhHWKI5cAQ2gxdctwh+k3xD
	 A2ZHrKWTOMa0X6D4VyYGWhzQVWD5zAThjQYM2FtHMeRPc59ORNi/tB/eDKcvJr6v26IZS
	 WszxZ90Qn2tZMT2rFpW/KGW5gGUbcyWj8W4jFvpkGwvfdxCeZ3P0h+3Dwv51kc6iqWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
	b=uZZpZ5oNGgeCth4yjF34qo2q4JeK3b0ZaME5rvtkWG9uHT4rlT4T3Hf0XYgHz5a+KwXl
	 xRAJk2SY6ssUvu7HlZECci9i73AnpMI9KjqJtA/Nw2Lgw2DUL1rUsnLMsjW9nhkS6+pSL
	 LKJr431XpuRa+izxxAABXk2Fkn/cwbgwn70r/qqvqmR/gPrnGhjDSTUll/xy5RXWbsW1n
	 ntRDsGVYdZyMmeYQywrIuWbtju1MfDr673uCYoagwXuDsMXVPkRT6s9B9M7RYPkW3QhBq
	 v5n3YKnL8YG9p7Fx+rKVxHVA+2dXQrOBG+aWiWmQw4kD8fTCA0QIUMp3nmERhHrmD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5w+IW73;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395D606D820
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9395D606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S5w+IW73
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8470d7d430fso687354a34.3
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046587; x=1794651387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
        b=S5w+IW73HwNOdviSfxc3ToScB56IBx+6OXe8sIz3hOujOgzKextwtnP4S42U8vbMCR
         7epfL8sFsH5jwQO1O60m5OI5WdVUud6E+qn4Tk3aA4TLJMrhnHchBUFSULwEiTDqnnue
         b5DK7M/XRDH6X/YzGzl3jY3Qrwb2jmZa4dnA3oHkYQaMQaRzCeoeHL//imtOSbT56zXk
         cpfcnqoZBxNr5NRD36h+fk6GK5/Ez4NKZNg+7sM+27ituJGiPcfuX/qyy/ZEQn6OfFm2
         dT5eVrHSx7oTur1Tkb+nNh6LIs/Wk1U4ZncMEL8C7wd/L7tl1+anURIN5/gp1y9bPdBg
         Ll2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046587; x=1794651387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qFqvbFurN4PEJpXMJPKtOAq4hdCyVwSYAR6O028L8Y=;
        b=uba6SwyazHIFicznIJQm64KHSgMHhiii7XqkjzvWKbAfl1/FIV/sEq4Qbs6fR9DJUL
         RidwV7WwNq80TFz6XL5YT2P1wPQ9BLFTo8HETREDkO5ewQoU0Nirz5/ANuazuiivTrxZ
         T4e9VfVGoasArJ/ZSFdghEzvkORklPMrfZls/Z+SXTjNHE9FKbZ3Ef9hnM6dD9+vJKZI
         E8pnJZ8lDkCTLImAM5x2SNaXmbPIylpF/Ikd7w6AXDMYm+PVsoTHwThGE9z+fcIaYobi
         zen0c4EcLmYF0h8ZpK6IkS6eAmUS6Lhn1hdYFDObH95EIBViReMJt7fa4OWwhldrCGXB
         n3Aw==
X-Forwarded-Encrypted: i=1; AKwUvBx+1PDFwk8oyenfTG3Vbm6HMnA3t7T5TRwEP3IfjK8eFY2aQmQTUpXNd/98ihEB2OQfiS4nHCHhKG7Sqw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9EoG+UQc5XM/Pa/w6O3SIkcC0nk2hxpExZTQOfw9xGf+DPobMP
	M5bWdkDuH2wG4FEF0rU/uCAHKpQ5rrJ36vBo6OtyE7wRNg7HNpotELJc
X-Gm-Gg: AYBFou3rTJSTks2U4jx9azQCUBsBj2Vp85Jnunk+ISkGsJvoFJPdG2ISb2mAgkfLTJn
	KZO1FrQSW9zkbm6AS3hChtjiAYpPXQcuPcjdtTIkgwTIf0ZERf6U5ujDT7NGfpEq/n74dt9T9Rp
	AhW9lwqMDp5njiNyY0d559CS7LLIMOUVaVjHYgHh5FGhyXq/i0La/DupifSTYb8ZettR0mulO6x
	osATVFQ0gon5y4sXWd8WtQ4rSFosahILHkhjA6CD05rnk8iZDj/WbjPPfPQKBLykRNAn59Z7m4s
	FuAPqSr7BDtxn9dRfC+e1wC8wp6y8hMg+1nwuSRShoQzZBtwtTnKcyc7DAvNd5IzEGrJcicxrwP
	wGQO6nzK6ODDMgA1dQSvpvAj8YBq5iXgQIbtVyCQqBnsF+ly+PnqGhmxxs2Ca0UxPWsvxyeI5tL
	7lSpwTnPwohd47QUh8m7dpCBKl28rhL24rbMk6AQgt6Xc46rIjJkRcjO/ldRo/jp+XCxtnlvyKu
	U4nRJ0TN4EI5BAZ9RW4k5q7f/1j2llXZJZSXIS0IpE19CzAsL1OMqhtAeU05NjwzDKmmpifWwwU
	nkYYCJuyff7WaS7Xtp+ql3kJNXumeg4WWYWh5QUM6cnaVEPiHpPXtmAlhc1cGEFgn9yAGW5TXjS
	gSmm92emVkggoW5FoFKhIpRQB5FMfudqd127XdiVPLMSHaeukA2NviRPaYf3+l2eLuzG844y6++
	xAcNPMf/CXU62HIb8LzsqzrLgEbiBL2fmQnf/LU9Ui7K8sNaGWCa3n
X-Received: by 2002:a05:6830:4101:b0:844:4959:e856 with SMTP id 46e09a7af769-85f1cf2dfcbmr4924112a34.11.1794046587358;
        Sat, 07 Nov 2026 02:16:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:58 -0700
Subject: [PATCH 01/58] mtd: clear OTP provider pointers after unregistering
 them
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-1-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

If factory OTP discovery or registration fails after user OTP was
registered, mtd_otp_nvmem_add() unregisters the user provider but leaves
its pointer set. mtd_device_parse_register() then unregisters it again
while unwinding the error, accessing a freed provider or dropping a
reference still owned by a consumer.

The same stale pointer survives when the factory OTP error is
-EOPNOTSUPP, which mtd_otp_nvmem_add() treats as success. In that case
mtd_device_unregister() can release the provider a second time later.

Centralize removal of the OTP providers and clear each pointer after
unregistering it so subsequent cleanup cannot repeat the put.

Fixes: e0489f6e221f ("mtd: core: fix error path for nvmem provider")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8efa2d88556e..558a605ba749 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1016,6 +1016,14 @@ static int mtd_nvmem_fact_otp_reg_read(void *priv, unsigned int offset,
 	return retlen == bytes ? 0 : -EIO;
 }
 
+static void mtd_otp_nvmem_remove(struct mtd_info *mtd)
+{
+	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd->otp_user_nvmem = NULL;
+	nvmem_unregister(mtd->otp_factory_nvmem);
+	mtd->otp_factory_nvmem = NULL;
+}
+
 static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 {
 	struct device *dev = mtd->dev.parent;
@@ -1082,7 +1090,7 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 	return 0;
 
 err:
-	nvmem_unregister(mtd->otp_user_nvmem);
+	mtd_otp_nvmem_remove(mtd);
 	/* Don't report error if OTP is not supported. */
 	if (err == -EOPNOTSUPP)
 		return 0;
@@ -1180,10 +1188,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	}
 
 out:
-	if (ret) {
-		nvmem_unregister(mtd->otp_user_nvmem);
-		nvmem_unregister(mtd->otp_factory_nvmem);
-	}
+	if (ret)
+		mtd_otp_nvmem_remove(mtd);
 
 	if (ret && device_is_registered(&mtd->dev)) {
 		err = del_mtd_device(mtd);
@@ -1210,8 +1216,7 @@ int mtd_device_unregister(struct mtd_info *master)
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
 	}
 
-	nvmem_unregister(master->otp_user_nvmem);
-	nvmem_unregister(master->otp_factory_nvmem);
+	mtd_otp_nvmem_remove(master);
 
 	if (IS_REACHABLE(CONFIG_MTD_VIRT_CONCAT)) {
 		err = mtd_virt_concat_destroy(master);

-- 
2.53.0

