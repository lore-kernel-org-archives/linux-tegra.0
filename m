Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869949;
	b=S7t8qnGZlOUb/i8sP1olN1TfZUkVkaUajzGyBSfxEzUm3WLLWOtwhN8/R7TurarK9cXU
	 5Voxr6JfLJ5YIwyhn/IbSl0DTvhcoo4wDlq3jjc5aRjWJyvFXRzFhI5D9jJlqh/dcpzHD
	 lOqR2l4ALBPqnvfEqKoI98jxLs366kCpKBCnA8WBjbxuOH8uyyesBhStG42C434Zbccot
	 JLIKa1c+frlwFsubX92Bdpdrp+bB9YW9VaboK4LTFJHFT0gWxiCEH/0fGYqOKMRLMDSal
	 WyFlxilET9V5g5KvvzNRkKK3cgdo0zZwqUd+tYihTFexOpgbnMkMT6XtJpwAJGjuu8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869949;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
	b=5hVK5yvvyVJtm4yO7cTyCdBzjvgzMT8mszpBOKE+F3LrwvK7eCb8SfDqedz1nAX0krdo
	 Dgf+PIVNogPMSfkkn1/g16c3nzoB8XnuIwGXqqY17C/EBvNKXYHBd7/YkcfypQ/xb0Sro
	 So7zecouRS9DLAuQyekosl4u/Hzt2ANZmFtKQzqDVr0NH5Fg2arbMVi/n2OjoCq7x/Zs4
	 S2bT0NAlMBX+PLkQlBu/x9xXnjnAwH7aKxPyFBysS/rOFfL2MQpNYytvfU9soTMLqgSvz
	 NvUfJxWXQJvZ9DZKiPdtD77XTYEcXtYY4VUakNxfB0ROjDly8EJLz8iW4lF6gASll1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94391606A326
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 09:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94391606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990835cec4bso926630241.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869947; x=1794474747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
        b=quNG7HjyOhQLbgga0arat9j2W5GreZjDdPf++cxsbpwcMBW2C60oKu5ROvYQp6w7mV
         45c873X2NZ5qg6OrSfnCWnDdDCQbKTk2+ujGwtO4uvfrM0VKnFiQPjhog4Z7/q3iUy11
         45WrB88GfM6iSuTiv+OQxN8ksnU9hvDZbLotVYB6w9W9fZ9XA47CfmnfAB/mCkwwUQRU
         ZOt4wEMuHN8IdQuBEg0bG5SKfoZEpJwuGy7y4OKAc/0q1NaMr7duKGXhWLgXEL2i+2wg
         3Xpn9mahi47WVzsrCAiMeZiDQ3pEXhOvx/Co8l8B0h2qN2Oearu+sk3AIhlKoO1fv6YN
         0ndw==
X-Forwarded-Encrypted: i=1; AKwUvBzWlrXZXDKrbbwzlgist4sGIeoEzn4drdC14H8E3EJr1/QZSiUsO2RQ82RQxtRg02aAh2JjjXhvG5u2KA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qNykcBfTdOJLLxEA7nnYMUG7GYNvHokudeMwYAu/iNPSDvdAd
	iRkdR8vV9BWSiO/YHWdVzrNvGXZiNnzuJ7p7x5XZDi+A/H4TnZAp2QvdG1toBvk7e+I=
X-Gm-Gg: AYBFou2Xvx1FJPlcHNS8OyaqsgU85UzkGrQRG8j2s9IKYFUE8+fs7N8JVkvEUweJtGv
	XxWLqGEzSS0EKaK2YtvZxLX5DU2NTMh49qiGl5YJZ2IFaghNGqg61gqh2gnNwnWK3O/cNAThfiE
	Vi4m7DjrkkLH1fAfDqraH6AXCfMGxJ071ywJSLZvP91Z8PtCx/K213W4vlSZ1Zw5t19z2Qm7tON
	nSDQwlOD+5BixeTbxJWolkmF6ZRjyHMkd7Lje5LizpgFKDocezK7ro99CeGGLfFW6nzs17TkMi3
	1VhGmfVxXgogJGAal9kUDh20yFJva9hgYB4X7yO/ibVqt649Xf1o2pjVZxyGKnC1/dJEiG3oTfT
	PaXy9VdyLox5QKkic2RJgFDGSGWlhHFOR1oayQkF7cd2lggXrh+e94Go2ANtz2d/NxOkTXj8fwe
	lOTBYwiRheH+Xe7sVGl0s1tqvsVX5bQqor+DG6AJ4i9exZcQBbVLLR6oKZvTh4aOMDj9OJj8sC0
	8jQ8VE0IPxMYvTSpdk9lDZekx3tl4is1TKOzO0w34xypUxfMoRArxCshrT/F+JtEGUTzKN2vB9+
	LMFEHv2vNdSj9KUsLqNl9Ybrm+LdfojlPW1vGIr8jZnruIaF8gVOq+gF2NXJAZg4FG/9tg==
X-Received: by 2002:a67:ff13:0:b0:7d2:754c:23e4 with SMTP id ada2fe7eead31-7d2754c249bmr2064068137.24.1793869947517;
        Thu, 05 Nov 2026 01:12:27 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d91d2693sm3974893241.7.2026.11.05.01.12.27
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:12:27 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5ec20398b05so861749e0c.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 01:12:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxjONfz/5K7U9QOV6vX/QMvlbayPPv1nvuQpQStF4s9qTI7WFzpF/9h6Em/tJQUeSCPGfyxDoEOcRlS9w==@vger.kernel.org
X-Received: by 2002:a05:6102:a206:10b0:7d2:8610:3223 with SMTP id
 ada2fe7eead31-7d286103264mr1300643137.34.1793869578105; Thu, 05 Nov 2026
 01:06:18 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com> <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
In-Reply-To: <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:06:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
X-Gm-Features: AclHuK_EWQ4VeHP65pJfIPjcWj5wVVyn8PWm9OHeuqD-F_-a-ZgbZgStzpLwqQc
Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>, 
	Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
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

Hi Kezysztof,

On Wed, 4 Nov 2026 at 18:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across serial drivers.
> >
> > No functional change intended. Prepare to make struct
> > dma_async_tx_descriptor private to the DMA engine.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >  drivers/tty/serial/imx.c            | 6 ++----
> >  drivers/tty/serial/msm_serial.c     | 6 ++----
> >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >  drivers/tty/serial/pch_uart.c       | 6 ++----
> >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >  drivers/tty/serial/sh-sci.c         | 9 +++------
> >  drivers/tty/serial/sprd_serial.c    | 3 +--
> >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >  15 files changed, 29 insertions(+), 58 deletions(-)
>
> ...
> I did not look at this code at all...

[...]

> Therefore:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Then please add "# samsung", to make it clear and obvious.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
