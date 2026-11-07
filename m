Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046592;
	b=f+QApA0eGsokywWAN8gwBHbOiaQdhcGvfN05Bp/BJgmXEWkwvWe9jWgFx09/YpPpKKkx
	 9y7Z8+gOXvYngzfUA5KOy6l9ocWmJJKWYf24VjYYYQWUPMWAYh0AG4F0opinSoaELGGtC
	 ASCMVx+SZQzUK1680Ms/x1cxOoFnlcQfKfptZAujKuI5/WAF8VDY2vOzj3nYI6piVVPQV
	 mVa17i8HPESGxhinmeY5h1/yKTzAELGms688+aHtqXc2k0hvdwfdyQzhtvX0ezs5CVBSs
	 d1hYrl/SLR0Xmbr3pSTPMJ2p3/0f8fsimdb7/Kj3EnlqGktqLX3eLaGMHmQMCZPtt2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
	b=5R8P1VZXYNEd4YZHM15ThQk+wN7u96DK00A0uesp6hEmcqNa8GHPx8hBhkZJVIR2d62j
	 Kp3DT4CMcuD2qNH7rU4WNHQri5OFP3DZcuLQi4DWfE+kzNn8hCVbePlJZe3kRNWNRjzZp
	 L2m4Dzh0JoKrD0FW+xxW60RXIJEPmoXBbcLsbyA1W4LlRwErMhcg+iPqPTxLZvdEPZHDU
	 laDXN4zdHJG/5jPVfkOjMChUHDZMmiTJP9wyhTNW28ZiTfA+9N3iEqPzT2ARQMgLDkF+l
	 ncA5P4cBRHv2ZqPnO+Jsm1m9KAJ4vyMgQ4Ayo81CI3Y0ovvFibX3h0iQmN081GHtJ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hf5XVAUs;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83424606D83A
	for <linux-tegra@vger.kernel.org>; Sat,  7 Nov 2026 10:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83424606D83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hf5XVAUs
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-85f34b20042so249726a34.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Nov 2026 02:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046590; x=1794651390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=hf5XVAUsF8EPd/RdVeIWVS5oZGsS0lby/+9Kj4QlGxI7nmPIXVSyQF7JqySogUecbd
         yRFpCeLuScpBXGbVWXv4fQxq54pXgi4KnhAQvkI0KOlqaD6k65pYeD+leZOff63AtnOp
         vwgCjG/FpYB1e7s2J6kUroDzwPkTebX92DPPuYqdHlU831TrCt+WHho8CY6aszmEKM2F
         /XYdhwHchv3jUMRW0vBpNMie5Iss++8mGpZHCGvcbCMgKxBWNNrvFR1RvqpBkDvlIh/P
         woaS2DxX7uQfjoQ36gFraLZmORdjMXrIPemQWt/Q+pC48wS4VEiQkwU9TX1WkyT3NT55
         KKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046590; x=1794651390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir8ocEsY2ITCHB73OM8DOt1TO1FexBL3HI8zDqPQjm4=;
        b=Ul/5ikk5ULSsqvY2BeP6uzkNjQPQBHJnK47gjMkFAJ5GQRZL2vCnA0zfAONL51gSAO
         dSR2YyXVTz9iGfA0LGTk+QKDlkpYjxTSM+m3DbD67fUYWn9XQvxoHfyHd8O3ST0ijDVk
         jyCrWc6Wl9+H17Dq2Kkd677NaTgxfiRAvgTB4txwkqw5dQ2UTGNUac7Sp3dVK1thZd9h
         Pe6OI3fKX/1G4Zhovczq6kQkBUcUpx1rEJ26y6CGJItJANX9DdLZPhyv9NJF5SDkm6HP
         vq70o8DrhUb2qEziElvjfodx1IKC4Le7/Uh7zS5hAFoUqYG4yTSCjf71ndcvU+uhb1kQ
         G1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQCRk62b8LlfQYDuwycLXl9faHpbU1AxKCcNZo7qUTud+upl8Y4FvszByKMjJ4+PbTHv9AmKyvF4q/uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7yuqXFlHyu6qCbGErz6iw8nKr9zrIHwc/kHdQN9mrGRbgNYSD
	sCXRNGKO9l/NJyd2JVAQK1VMSAZwPKxmVfy8kQx+n7qFBiuf4z6OZnx1
X-Gm-Gg: AYBFou3BOYSqO6HalEnVdeOL/ZT0Mn/M9zZ6YTy7jgj4aPTU4F9DwE9qzAlie5avGwg
	tYJDv8MkqTKLMaqiM6mc24xvNcrY467kFQBXlS2u9uPHFMpx98fIPNINNOZ4DWkd+z7REl+1YYv
	dZMPy1Gq93g3uG0HQtZLVFIlkRKnYML3G2flixlQoMIzqXSh2/lRqQq5HJzeCxCfJhk+0T4t2Fs
	+t/Pu12VWi3KAUMmXUKBQLqU9+nJ52XCE2TPhGnidbEF3vKdWB77Md/SV3hDQo8rlSb4V9SA65Z
	8OS/0yEizjb7jQgNq1kzv5TeH3k95iZCnNDGffoOdoxvelHO3lFOKXZ9V+BQvp/ifx7FsMsm2Yy
	IBqBp8oVxVgIZWwhN/qzoylO3MI7/XgAs25mPNLfuE61fsWOe2pNa69GYoO+ZbvCiSNTY3LTKQI
	ogZOTR5YlXsUnTPK5CMO0VBuFV+DBMNkXvZdP0H13v/Z0NOOXYpD0lCAWl4MLULohjz1FsPCaij
	E61wfDtPUEu+Pwy+438y5vB6PU1QDBsiBgcFEAGD9O/CXkzRsCyp6RedDX1olEQgXR4Ur3k8yQg
	S8EVkVXUx+kWyzxQNXnJdOx7gjyDf9uIRtDaEJVW+jWwUmB14MlFPDNuJAM7YGdK0o8tiiQxxqY
	Vec8y8/fk0ZFd4rBBrg75j/BmBv59mpsN0R1wwicN7IiC9zEamp5RGlRl0AZbryHu6X2nJvEUkq
	ksYKvE2wkGbCvaUacHwft7jtmOTSkcut6bIWXpmfjhE/bs6eqJNOrj
X-Received: by 2002:a05:6830:4c05:b0:822:e9bf:6445 with SMTP id 46e09a7af769-85f1cf838e3mr5603674a34.9.1794046590411;
        Sat, 07 Nov 2026 02:16:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:15:59 -0700
Subject: [PATCH 02/58] nvmem: retain provider context through final device
 release
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-2-0181ef0cc4c8@gmail.com>
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

An NVMEM provider can keep its read/write context in an object separate
from its parent device. Retaining the parent does not keep that object
alive, and nvmem_unregister() can return while consumers still hold the
provider. A device reference can also delay release after the last
consumer is gone.

Add optional paired callbacks to take a reference to the private context
before publishing the provider and drop it from the final device release
callback. Balance the reference on registration errors as well. Require
both callbacks together and document the associated module lifetime
requirement.

MTD OTP providers need this ownership because they are children of the
physical flash device, while their callback context is the separately
allocated MTD master.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 12 +++++++++++-
 drivers/nvmem/internals.h      |  1 +
 include/linux/nvmem-provider.h | 10 ++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..851fa5cabecb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,8 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	if (nvmem->ops->priv_put)
+		nvmem->ops->priv_put(nvmem->priv);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -896,6 +898,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->reg_read && !config->reg_write)
 		return ERR_PTR(-EINVAL);
 
+	if (!!config->priv_get != !!config->priv_put)
+		return ERR_PTR(-EINVAL);
+
 	nvmem = kzalloc_obj(*nvmem);
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
@@ -922,6 +927,12 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+	if (config->priv_get) {
+		config->priv_get(config->priv);
+		ops->priv_put = config->priv_put;
+	}
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -945,7 +956,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..dcf5d81ca1b9 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,7 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	void		(*priv_put)(void *priv);
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..03e8522bab17 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -98,6 +98,8 @@ struct nvmem_cell_info {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @priv_get:	Optional callback taking a reference to @priv before publication.
+ * @priv_put:	Matching callback releasing @priv at final device release.
  * @ignore_wp:  Write Protect pin is managed by the provider.
  * @layout:	Fixed layout associated with this nvmem device.
  *
@@ -107,6 +109,12 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Note: @priv_get and @priv_put must be supplied together. Each @priv_get
+ * call is balanced by one @priv_put, including on registration failure.
+ * The put can run after nvmem_unregister() returns, when consumers and
+ * device references have gone away. These callbacks must also retain any
+ * module needed to execute @priv_put until it returns.
  */
 struct nvmem_config {
 	struct device		*dev;
@@ -132,6 +140,8 @@ struct nvmem_config {
 	int	word_size;
 	int	stride;
 	void	*priv;
+	void	(*priv_get)(void *priv);
+	void	(*priv_put)(void *priv);
 	/* To be only used by old driver/misc/eeprom drivers */
 	bool			compat;
 	struct device		*base_dev;

-- 
2.53.0

