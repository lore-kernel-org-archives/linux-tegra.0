Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6804437EFF1
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706278; cv=none; b=N4xfQsEKbbY1SAdncQ1uOfPdTUezyWFHErN7Y8zPCgMNupdTI/G2R78kxMuRwOfe1Paua6M0FerM3B8yPKonUvS8f4k/AzU3m0FuJO8FbaGuIHYdpMSKkY0ARJUfZ/FESfM6RXwRom6nej/15F8D2OkwheSGWUUVx1TFwyxpWm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706278; c=relaxed/simple;
	bh=hzR/DJPGKmySS9c+Pr6X+vQuNGBaidaL+cpT+F96Xks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUPi81TTP0Q91GeNNUE9V/OoE1hlK0CqWALeggwv5BslP/9/+JX58v9d8NBniKmpkx8EE9wcb4M+CdOAV44Dcw50iBfCz5U9k1ReiGVW+gpfSTFRXGCWI+IFKVMaJWrIzDshCETCWcLM0isfFXGxRZYDlhu3pi1tS7nd6u2Lv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56ae58f3fc6so1644087e0c.3
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 02:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706276; x=1773311076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=;
        b=OggrO4iqSXMTQ5WtOmescTYJbsWHcNX5xH5SVR1uD7vfEdSrHF4+YfdhO/8nr56nMY
         Rs7I5uJEGnb87QL0ShDsEEtSRdjnrUcHxBQY2RtVdXyUaDkPiGITLexd+vl0/tlQ/wQJ
         S0K8wOeJclrRca4SgK6/PxLjC1fJO8CV+vHmGuyAEoUlFNcyo8hbUdO0qJu7OsDzTZXI
         pkVzEvQJFRaa3CMDWUZZS3wTIA/TotTjPBE/WC/sgq3LeNbHcTPhRHUZRfgOypOBzsti
         NNeU26AuQ1HdAjKLLzt+/jyDAA1G3btMi9wOiA0PCwX+Ma+U23Eg6rogSpOYnIW8WK82
         Ijxw==
X-Forwarded-Encrypted: i=1; AJvYcCV1enf0IrvOL0lbRyB64fj+gX7iqvcqmZoJpgkXfw/yuawUYtjb/d17IqHTKNTcPdNIV4t7QZc+6WaGHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0tCVomHhszArokW2mFHts9TBZDOjT7bDtdkoNEQBrIS+4tNXU
	c7qKi9sIEvz7toCy9XqVVAVnMgxzaByTOv12Glc9saDQXMDzxLjtwVa8rCStdHID
X-Gm-Gg: ATEYQzxrMfweY3GTYVkLjjyj0Qs5gvoNZ6XtV5yv1LT/9aRS0KokCBiQEQ/AdFeqavp
	C3V93q1kzq0GtCoz0Ira63StSe9a4kP4KnLlJLWMLgw+/jbwJRLyNAvwoJVTLngnl1bxHNoOzdl
	GRCyMVHvwjxz7n/iGXgJzkzSUxE8mtrcLORcDA7cNulf7N1WjUnqFKrG8zRTFUqBM3hyV6OMDu3
	pw8aL8aDkyTHBdDw9GU1TUgH233zIW8Ox0NbLi+8NCP/WBnmyFPyBfvUxTIwtwwXEL7gxuMZmsZ
	FOOGfhXA4N1BOS+7pNf0659mqqwNVz8YZCkk3PfXPIb29r4fpPa/0Ke3dJn16LQx09cJjXvxmf0
	VNi6bZmOkB75ZZKsvS9vcXySByBfUqDzAVahDNknllxrP7NEt6/8A9NjOK3K+7ME5ANxR6HchBA
	YjgK50PhPQrAhxtOmj2A95K3YjS3WPkBVnIGtEZnE1Ed+UNALqehBjn3F5ydxY
X-Received: by 2002:a05:6122:4594:b0:566:3c58:efcb with SMTP id 71dfb90a1353d-56ae74c9449mr2457491e0c.3.1772706276312;
        Thu, 05 Mar 2026 02:24:36 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae35d455fsm6287605e0c.4.2026.03.05.02.24.34
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:24:35 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff9d047985so1629137137.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 02:24:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz/z31a4AISeZrZgiijWhZKPxdGHz60aEFmxx2wIO27Gl9QxwgfH3cDwAG3qjDyHGJs4liNp+1H9kTLw==@vger.kernel.org
X-Received: by 2002:a05:6102:3ed5:b0:5f5:320c:4d36 with SMTP id
 ada2fe7eead31-5ffab240223mr2483807137.40.1772706274492; Thu, 05 Mar 2026
 02:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1772644406.git.geert+renesas@glider.be> <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
 <86v7fa7fdq.wl-maz@kernel.org>
In-Reply-To: <86v7fa7fdq.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 11:24:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
X-Gm-Features: AaiRm50s5nNMGcrhF9lpYz1D5nEmYHga723M3h1qHVdFckZiw7-IBT_v4J6wsk0
Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 04 Mar 2026 17:21:58 +0000,
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Replace magic numbers by symbolic DT binding definitions.  This improves
> > readability, and makes it easier to find where the various GIC
> > interrupts types are handled.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -35,6 +35,8 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/virt.h>
> >
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> >  #include "irq-gic-common.h"
> >
> >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >                       return -EINVAL;
> >
> >               switch (fwspec->param[0]) {
> > -             case 0:                 /* SPI */
> > +             case GIC_SPI:
>
> I'd rather not do that. I use *numeric* values on purpose, because
> that's what the DT *binding* describes, and I have no control over
> what lives in that include file (it gets changed without me being even
> Cc'd).
>
> So I want to stick to the binding, and not to the interpretation of
> it. If you want symbolic values to be used, describe them in the
> binding, have a tool to generate the values from the binding, and use
> that everywhere.

This sounds more like a philosophical debate, so I'd like to defer
to the DT maintainers...

About you not being notified: that can be fixed easily ;-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
 F:     drivers/irqchip/irq-gic*.[ch]
 F:     include/linux/irqchip/arm-gic*.h
 F:     include/linux/irqchip/arm-vgic-info.h
+F:     include/dt-bindings/interrupt-controller/arm-gic.h

 ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
 M:     Lorenzo Pieralisi <lpieralisi@kernel.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
