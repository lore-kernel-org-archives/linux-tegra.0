Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870140;
	b=C1xYD8puyjz3hbZydHZqpRuCh90ZYMVocF39e/gzUDGtsl+mPly2os0an15D8MJ52RG9
	 iCl46vPbA67dvGQcsY3ZRCIVcuR+cRJxu9MxrXyHMMi5bgsH8BtOF7ZsI5kcaOZ0pxw3T
	 4DY8BEUJCBX8lSs6EEYjNvIycXQDN5Uypr9CMH7LKAN7GNekuuTPl0KK8+pXog1cUc51F
	 8Dl+6pOLEBuqkxk2c2q4D7Rvy68E2WvdbmkGfc7rq1eTqNNSdU7XHXjq0PYwD+be+5dA/
	 58+m7aD3PfuW3aHP/Y33QEVr0NCalUw4x3nfJ/u56PO4N1gfDxUO4uXz2JSMr4uJxpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870140;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
	b=GwEjv0k5KiQ+Xzg0ejipO1jOxVdZ8OUZBAA6KG/cEOzgotedrtKoO7aQmruLMbFco2/u
	 2s9swwAoFsqe5ygkYTlWv77bCRIrcpbteDgHaCRdF3RHy+Lzncq5QoQ1p3vo7VGCPplzt
	 yNcadEucB27GuEmhKBPSyHf+YoZsPEOAd+xpIyomLcDFicStGS0LhaG5zoaNJs2FmRQYP
	 EXNvex/YIgThfouEIh0bGe5rYysYKe3S2y+X8Jn61ZODAD2XaqDHACjpKoa/QF9fwwND+
	 k+/LLPwy1R8Du2InE5CFjGa4Jy+Q/FeraA2Pl0t4Vd1+nrQYsst5mKLZ6PlnYDcgHvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A6606A31B
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 09:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5A6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-53644b28706so24025671cf.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870139; x=1794474939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
        b=y7Qpe7fVlASXxXnSDHaSCatrjIhN21bswy2mTvyWKrod+UrC2tmmqI1dQqRJQ4Ci8T
         Koi1ZU7sq7wQD2/LWY2uCvg3AxsuGDAOCCrCyZFyq4jG12210enLtx5feJw78d3Z4Q4Z
         rDRTMVPt65eIW1ptsc4TFbRFzjuUlO3n5AO3svSGIGVFw6KRHdGbT/f3gtRjC+2hfLOO
         FG9lBg26bFy0eSX803c8DKOS/Q0UhnsANbXRjJ5YGQJpXc6MTbYGuUS6zk3UOhw8EQRf
         1DjYyBGBy4qQXNhgrtDLEzZ7qg6wh8TSz+rRotd9dKaOt0DPq7qvPCtOF1+5CWfEcMwQ
         HgCw==
X-Forwarded-Encrypted: i=1; AKwUvBzYkMvCRoxHp/bkDNr0uwOchReHvz5rZwxjZ21eYX3/Bd7jhSdV9LvuVAjTHOWkUzuhgd1vg57+MdEAzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z//NCY+QXEtlgeFwIoD1/trwgszMae3Zqlit0TmSAquHI/QM428
	CoUBj3PgJIVRHWopZdTdrQiS9wSBirqDE0yJcp/YW636DUt25FX4ey2cZCTln/ddo8g=
X-Gm-Gg: AYBFou2tqUPeEQpnzVSHkJzcC/194NWLET8OQxJnJjk4NOoE/RVSwNyShT8aciroCfz
	31WpKedMqEMYvIsFHJLHcozqAGSofmj9TnnJJRGKDjXM4+g3Xn9jWn7KpCUfpia+mas764Hobe9
	kP2Sg+1W4RqKvb1D3k7asEk8FaoYXhAD5QsS237lZzG950BSabWgOOEiAlD2VPR9Y8zhiyMMmXI
	KXlWh2MS1l/MyxQ944ybm7Ut67g+6D8eWi0ER2qE/dgpepX7M8n75Yd3dpGYEzJpfRaS+VpxJgG
	RYnzMON5nf3PmfVxJ70nrXFDgeEe05vs2qfhgLISb8x0XZSwQ3aVsrDg4ojRw2Jiah5kkbBDFqs
	e89QpYS2Njd9JqABkqvnqJjwzzxcPppKt0CHG8CFYogxKAt2aAGaV47jix6oGP0mv4WWFzzkPXS
	/LEMS0CxJSvbvOnAz+BTEBCV7jZGp4So38nNOR8O7QC4SFWKO9nhKb2UMtfVARHKvSXblMilPVs
	pi4Iti1QSSpPgaLvGxDfyuby/sX3vWvbjQTj1XdHZoU6bga58p7Rq5SlRYjOPJ/7K2KdMs4Kv4C
	ZfCq3GZAW+Y7sB8RR0X+2DeKvat0FG5a+KNJw6doAfxLpFTTcq58Wk7QflerwxqwlJjObQ==
X-Received: by 2002:a05:622a:1212:b0:539:c527:259 with SMTP id d75a77b69052e-542b82f8c10mr314937991cf.76.1793870139141;
        Thu, 05 Nov 2026 01:15:39 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b0d0758e7sm46699461cf.3.2026.11.05.01.15.38
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:15:38 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93ece7a73b9so191040885a.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxIBi330DRqEECC6Et/yXetKozGj8o0C9IDQPjjXP+P8qT/BktHpYZVsCxLemqbpX/5h2ZKissqfTLEaw==@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr9146730137.33.1793869733877; Thu, 05 Nov 2026
 01:08:53 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
X-Gm-Features: AclHuK-Joxo1A4dnmlO7hQLoxC6QCg3Be9nelvt7mgpbpsg01EIWZ9Dok6aJ4CQ
Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, 
	Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 18:56, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/sh-sci.c         | 9 +++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh-sci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
