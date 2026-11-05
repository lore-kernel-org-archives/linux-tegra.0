Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870913;
	b=DVJzhKm97CBA2Namiyv71PRA+DavltcQv5cQU2Onr/qlbwkhchfW1BtQ/ojVZChcScAZ
	 cB3m1+9kH5lYwYA2N6fW0g+WuJJ1GuStyoNDm/6oQoqt1Zs5rPoDsmIH2ivkQTBbrwRr/
	 jYoRo0h66+I/+SMGiE19Gvev0OBhs4938aJYndBQN8WlUxo8dwsSzzybF3Fz1SQbRSrzb
	 /ZcPNHDhaB+kRXNH9aDNGj0dHwrY85LJLFiD/0yiiuxV8wBZQnomM8JU5pEtAUDC+dQk5
	 eaqedR2zOXZ4x+XICl/K/IyAxnSkMxMlUjFeeNRsVSThUkk8jmUf1jV6WvZT30ool9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870913;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=I0hybhcoPcxqNhihKe8pfShDV6ntSD5tRpzjDhCiMkWljlnD2/ANysJD7AsZFpRs1DEi
	 YSS+Gp+v/VbBf/UazJebSzNQLWAmfwudAfc7W/A6V2092i/RtWSh2eyoD1Vx+oR9OBk/s
	 PkQhp5vGO0eqZthroH/EuGoJrHLk23Ll84j+/0nQrwNKgpvdy0p0TRdwFInio9zimRt3k
	 xxqEG7IslreG02oNuMfP71VgxRi8FA9AvpFaTkx3TqJWxXGjI8It75BdMlcqJykE5V7f3
	 6r4qgBnf/TbjxGadTmd4vKjOHrNt4V63rNX/Uq9CADWK10OA+PeMfyfoBtG6pf27bYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F93B606A32E
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F93B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53665358476so17333671cf.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870912; x=1794475712;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=Mavi/jhi1dMcmeTgIOzv7Ks9e6dgTzov39aAep7BxSR63ETDxEGcwXgcVs88ZHgI+I
         vCnO8PGl5kDcjHGSkWl1FyQy74pZNnKN2bkl1sdo1Q6tvn6X+064gzEdsS3nsoYr9sOn
         1YwUgL0tw+Ti5Vyw2ktwhlOQAo6RrQIL4MqyJ4+Qca9cgPxy3JyZR02gDhc7o3sJmsT0
         QI94VuvHouQF29PybINQchMlhl0Ei/dpyejyq7ugiWloJehIAMY8zNXZ52FIPFftmeua
         kjzgImEFytuP/Rxd3CJs0ZxMz6r11DXrgFhU7lDgCyJVcaRD1YJQSBPOuYaVetHmyvuh
         psfg==
X-Forwarded-Encrypted: i=1; AKwUvBwvTqpBBthbv+o/i5TFYxI3j4KzbZHIp3BvxWV/pAGM7ed4Z5pAO7dLUa52c9Zd/qQQKsPWiV4VVrMJig==@vger.kernel.org
X-Gm-Message-State: APuU4Z8UTCNCnPzIskgz8XaROf9cos47EoAxgFzNdZA1hPHsmWYYy7P9
	qg2FWRlTNpEjw+YWiu0z6DP6OYFBtKEVSFrMRcE1xUiR3pkQjHHTNHVSxOplMmP4+44=
X-Gm-Gg: AYBFou0EYH4gRlXuE2aVgUJZx90hS7NPJd/8ZCgPCN13OEKf0U2kkn5g796bMhoB69s
	mR3Z6dKStk+Z8YDFtXn1pryKEjPFf/qoWvM7ZchfDUSQ/znurty65i3r/nMlCwG1NLStWcz+9N6
	1/EQWfVZNZGqbGkCC8TxI6A7zP2A1+UUyY2Xg4flFy52Rop9zWHr4KIq4ulpJsOcFf9hTeF5F3b
	71/95QV1lWFG6bvVqSn7tWilcnr56zxNJyHhBkSIwKPFId0ABVqNE7eYxZ/qA96Unh5nagSu89A
	qxxQt5BZT4W3oV1pBDvBwbgniURdbn09VlyPAiZ0Q0Mu+MiFC4trIGr/jhmsRGbRZAjR9V3yt5D
	gyPYtoUvR+rZpJ7GAapGZ+RKdjJkojgFhFCxoTQjycdg6MnlVbj7xWayV9wvXyrVi2RbYonu9K2
	wk88+Xc8gVDylCYkK1PkajK4rN+OTqfsFKGyKvbu8CsMsnMXLOKI+hQJ5fQ4CHVnG6Ja4L+yVmA
	HF15qdyIUv6c5S6eCgBqTDZXKHc4lynvGm5BsN9j4uera0zGvlNMtpCLBXBFpNF+TE6ZKnqQljx
	VwnM7uWFUm5rYynK/PeoW5ghRMfFs5CrG9BjoamxnVN7jvK6CZUof9U4ygAIb7al4A==
X-Received: by 2002:a05:622a:53c4:b0:534:d386:fa67 with SMTP id d75a77b69052e-542b71417c8mr294696911cf.40.1793870912159;
        Thu, 05 Nov 2026 01:28:32 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e896f09e3sm32681036d6.25.2026.11.05.01.28.31
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:28:31 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ea16d8072so111266d6.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:28:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxgDB65U27JNzU0LretPx6yvHqq0SDPv9CEsOR4Q1u7Bn0AqfD4WQmFc9llimNZlQrzTPFd5hWqQX8wzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
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
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
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
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
