From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Thu, 11 Oct 2018 19:47:13 +0200
Message-ID: <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
 <20180906122436.25610-1-linus.walleij@linaro.org> <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com> <1539272073.18645.12.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539272073.18645.12.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>, jacopo <jacopo@jmondi.org>, Mark Brown <broonie@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Philipp Zabel <philipp.zabel@gmail.com>, linux-tegra@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 11, 2018 at 5:34 PM Marcel Ziswiler
<marcel.ziswiler@toradex.com> wrote:

> I guess that is also what broke HDMI on Apalis/Colibri T30 causing me
> to submit a fix [1]. I may also help testing.

I see there are many ways to skin this cat.

Does this patch fix things for you as well?
https://marc.info/?l=linux-kernel&m=153926854327176&w=2

Yours,
Linus Walleij
