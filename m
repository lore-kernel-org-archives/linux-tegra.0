Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696666;
	b=JHJ/rhsbXU1OjctupOx2xZsq98TosWrMy2+pn7YpsFkFTpWdAoO/ukqLX0qRZeyCsOw9
	 XpoJyJIHELnBrKZG3yBwqN3yQM9ogzTcYG+1OkkJKjHzl0K1C6uwGHAexM0EXfJecWcMB
	 vWWk0zuPnEIzetJekVdRo271DQwst7C7sD87X/CmeIF4og4O5YrFO8MOY7VbgeV2af43V
	 HhRRKEW/FakSV0ix7JXLm1uP/gJsqJx/LSMnVvLNe2MI4WNFs1X40WGbLaRzMjluQrmsm
	 z5AQBvxMXSGpJYrRfGqJiGhHmuuwoRq2xURVhhFuy1xpM//8OcnQ+39xYC5FCNoqVsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696666;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqcwif+o3u40FPToGAPLvgMZ6cthmDqENUhGefULOww=;
	b=BP/+x6iblB3qHLT8SpLITgWkgvX1nnKLMkkynBOj/U72/5Jgw6RpPIcpWWowYK+hYA9U
	 PzwPd3gFWbkiahCdnI3T+3PK4itpTy6V3TP+zVdxzrQRBs3cJVN2NHozzSTzCW4tRRqmL
	 0IrulYixduGhtnIadWzdBb/jSKs77MeJMEQj/jHLDVVN1gTSjc55w7G9O1qhMnoLE1Ebw
	 2Nqp4GWActAkCHt+bzmM/kfp7ZnoEL7C+QwYpyg+muOQTzGOszsSMBk3XHEnkJmCTPUTm
	 11EUuvVY9PkDynF/u19v88+e2fFi91rkm57xU/Oe8TlMsJoQQsjgFrb3km3qxdxS+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4LUQWyP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4AF606A331
	for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M4LUQWyP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E841F00919
	for <linux-tegra@vger.kernel.org>; Tue,  3 Nov 2026 09:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696666;
	bh=oqcwif+o3u40FPToGAPLvgMZ6cthmDqENUhGefULOww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=M4LUQWyPsF3nmCRlW876QNA9V29nkiPdVGG+Ct62VFOdiuZlp61cgbujduwhMLLdB
	 xZ6lWuFuOomycAs5x5jV4huZMLS1zCrqRw5Jnegs6WbQU2W2jzkwREOEBqhXMUvNF0
	 w9DnF0VaZ3qmduXdCRNHuDlSirqM2W6OGbZ95qqLWLrg6ArKHVcH4TGTb0a2VTyK4A
	 EL77Q1IBFBaRh6R5CcHAdDefDHj07kkycKkv9OGl7k+YpD2t+qubSeaxdGzZ1P6gXW
	 PCFqvSl65U65gF+rpZPAQAIkmE7SyIt+g5vewBMQb6dFConYAPA2ZSgauN64nrDqlK
	 M7StDoa1LrLXA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d0so31190871fa.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Nov 2026 01:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxkSMp7+XGWQTldkqxQ+OEURKburStkEVFjiTcQLXBWWmQkl9XyBH0xmPN+I7lQhl6YPvOqrExWOyHpDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/X7CDN0wS34dAmP5QVJFF+5RM6yssre0dwRnE2cTg9RfUrkJSZ
	l2y8SJS3VvEQ2YbibF0CAJwMBBPpfvukvFBn7ii4Vo5NUJcQzbbrkGvXrZQ8jCKOsoLUVkgX5Fu
	+W94t8NBREKbK9rxHKMOIybubsAQPGio=
X-Received: by 2002:a05:651c:198e:b0:3ac:4da3:864f with SMTP id
 38308e7fff4ca-3acb7a9e0f3mr31016591fa.4.1793696664148; Tue, 03 Nov 2026
 01:04:24 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102174005.3933649-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Nov 2026 10:04:10 +0100
X-Gmail-Original-Message-ID: <CAD++jLmoy=--GE4MScaTOa=x9+HAuvhHC7ixA_GYVme2vrcgZQ@mail.gmail.com>
X-Gm-Features: AclHuK8feuY0PnTZqOb4xpNbcV0UYLP8c4l3kas742sFixN6cKUvbMAmIcJa7DE
Message-ID: <CAD++jLmoy=--GE4MScaTOa=x9+HAuvhHC7ixA_GYVme2vrcgZQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 6:40=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
