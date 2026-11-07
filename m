Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046604;
	b=WFgVdQEFlW2XuDQ4jq6Bnymw3pJr7EsKHZ+AW20HNWd41mX1+fCz8ayOqrkNnqhohxju
	 dV087CMnhzt4pJtAo836rmjOYHnOgr+7SRvSiFyl0oddA2DQdsMf66VH2Ica6mcmwu0hg
	 iGiosW2t7qNiUcgNdctWEEalm9sTOfos5OEd24u4zkbJCjO+Oqgqja+7EZmnOLRPi9fUj
	 VL+aA66kR2s4/jjnUNW3AvU5kG7tas7VuYVZ5y6ABM2pYKQIuHMoM8+prJcCMauUGK0ZC
	 LaD+iOtL9NL9MX1rNpisswNMerlo+QcG0PO3KTHoaYu0Mepuu0UCfwG7U3UXrPTWOyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
	b=zX72rPT+5lEXbj47o9xzzs86WDJ8tBuwyNjBPi1vdD7WjuIIX0hb4lyKsYW5oXfE/08z
	 NDwCqa8+WIZkDje/onOIfuNCePZ5CLZnRudzz8dnzXJQ1fD+7nQmUpTb2F6YE50wgRQN9
	 10PPwxNpookJxgQ0F+2Fy1DNgyyscqcgAmG0JRoMN3+8t28qCYihwp/joXOGC2jHhIP5M
	 wYkwDAIRGKLnyfKzFiCFexlby7ZLdH868ia0fKdnTigdMMevnJgYMwYPjWpA8Ztx0BIAZ
	 fwW4t08G3f9aa3khC5keCy12Nz37I6HY4OGScBXyLrbgjPbUF+fM4h873LnBXuQ6FxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO8RG3WS;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA513606EEB8
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA513606EEB8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO8RG3WS
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-846566246e8so395256a34.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046602; x=1794651402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=aO8RG3WSN85Oc/jLNxr3u0TD40PcAUMRT8KkpkkubGBYTSXTT0yeXUGx4jASB/VQyc
         aujtwo5AGpXdEBDMcEa2qx0/jX4uxlw9yTB6vxEYirQkhV8GW+pdcyvgyEHo2j7NMAyL
         mRTcjmonqsTND9RWVpABL6yNh/dQ2SPbk2q6nE5EZAoHQcIqH0iHqlnPKR6sF00yxg0+
         T61M/KN1qz4wyi4WZv54n4pU1Vsi75SWWN+1oWe6LS9U9nfp751s92vg/xHEYRGxZz6I
         OrkjGSVbPACH8Uj3uWYKQPoTEyYhXWC+EYyFSxecqpaV3RqdljxPIHNIeZtTkWJR4+eW
         UWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046602; x=1794651402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=f8NkdmAL4Dyl/XdlA3SGtW/O+VG4uNBf/TUVEOdkymeMS525EHdajwq73ylHrOVNob
         Do4Dejeo7wXgXpSMjngwgif1/o8JDOVg+YeIUXDxxCbB5qfldgCjPwMwQDoX9zTZ7AWU
         9J5hR38Srpg61uSY/aPw4cCwQk1X5devjIbClY4H/RhhnMr63rE37YB5WGazFxkUt6qa
         zejwBUjGuxgN3nIZEuG7oz+3Vt0UZSyhLu/oAj4i/eiOfeS9DgnW4htrWQTwjP99Zud1
         MCvT0Q4+L9NxD7KMSREMk/ghBoP9Lcaq9pZaSB0tggewBHj4R7nYcIe4AEyfZ62daTaJ
         4vMg==
X-Forwarded-Encrypted: i=1; AKwUvBzMfSYx/8oNLphLXHVMVtdq/t4V04OO9qRjhbaeY17uOsHmC5sVsHSxTkQWrqWPXq1d1zwkmzHpfbJThw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9u9uvRTAS1b9OXKkyQWJdJSCB23Pk560hYcTDWIpI41SkiHYJV
	sQKL8OCFUnKLYLFITWtXGEJBXCieyMLBQMwsGSEWN3T58z97rI5w/YYB
X-Gm-Gg: AYBFou09K7gGIWPTI6bu+/3mu+1bNH7TjNb0MwavizUDuyIaU830aS74+Dd22PT0lK0
	fuOuiZbjuqx7fcwiyMnEhxv52aR9dLd3HBItUzdZocJjO2PYEWFJZD2Djdf2wjM0NJ0Rzjrge51
	fNCwavWxk7ddj/Bx758uzmtzBB6RxwViYym/qSqOA6X9on7VShotwEqJ/KV9a1sApz6xt3vCPGW
	COEagTnZmAep44Sq1NSbHULi27DTtKNnyPiAuOFvcSkH6AcJHkYZBRM/3fexK0ASyuGfJxr+mPu
	WWygWc5uFor/Xlja5CZMtGK30g0pvnBVoVF+22oMsEVbate4ts3cfySM+LSg+dF96QEZ+fBg882
	jwZyhHXH880Z/9MipREkH57JEwiCMSXu3BhbsyDuixZ/WQSZPO56uz4rrh6XChoU5Sgn7pU2v7v
	HlaNG8IDnyqADehqXDo3TbOWRWIuNc28rX0bfMoE3AiQ79f28F+VY0dzoI62LsQH1tGn8LA0eFx
	43LD/ZWoZ4jrHntgidtHX+ZbFyDLxfTYcURgF8enRfjaDMASrQvW9Oaqwe2I0z9CMV6NHi/8ohZ
	2ygxLqiyBQcFRTSYgBKjq2YYfaqpFgga/s/6tiGUk/mNFGZhcsTG2kOkIlk0E9e2IAvC/Wa3Fxq
	K98YcACLQgH54D0d97VOyIVbzNCU8RrFQtBAcsYJ/XGSYgLZq6KjohezAznarp8LZwn4wmPjdcc
	GUc/lVVU5nSMnAgAKuyIO2E6URsp/TcZmrgGoYIS0H4gQKl0l0K6iiwIXO2Limi5yF0vW+Upyfn
	A==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
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
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0

