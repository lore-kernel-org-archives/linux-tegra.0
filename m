From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Thu, 11 Oct 2018 19:45:54 +0200
Message-ID: <CACRpkda+J6R99SQP9yFVH2HANJSi3M4GjT0duaHdv8wZcs7ahQ@mail.gmail.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
 <20180906122436.25610-1-linus.walleij@linaro.org> <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com> <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Philipp Zabel <philipp.zabel@gmail.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, jacopo <jacopo@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Russell King <rmk+kernel@armlinux.org.uk>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

On Thu, Oct 11, 2018 at 5:00 PM Jon Hunter <jonathanh@nvidia.com> wrote:

> This also appears to be causing a regression on the Tegra124 Jetson TK1
> that also uses a shared GPIO for two regulators. The 2nd regulator that
> uses the GPIO now fails to probe [0] ...
>
> [    0.680021] +5V_SATA: supplied by +5V_SYS
> [    0.683964] reg-fixed-voltage: probe of regulators:regulator@14 failed with error -16
>
> Not sure if you have one of these, but otherwise I can help test.

Would be great if you could test the patch I came up with for Marek:
https://marc.info/?l=linux-kernel&m=153926854327176&w=2

FWIW what makes it so confusing for the GPIO maintainer with
multiple consumers is that unless there is some mechanism
(as in the regulator core) to pair them up and avoid them shaking
the GPIO from two ends, it makes little sense.

So I guess in the long run I should pull this into the gpiolib somehow.

Linus
