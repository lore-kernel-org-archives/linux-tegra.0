From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 16:58:38 +0300
Message-ID: <CAHp75VecxqphJBZ2xUTku-WhyjkDRKQPbxvuGFAZ+-1voZRW9Q@mail.gmail.com>
References: <CGME20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e@eucas1p2.samsung.com>
 <20180906122436.25610-1-linus.walleij@linaro.org> <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com> <1539272073.18645.12.camel@toradex.com>
 <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
 <1539337415.30485.21.camel@toradex.com> <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
 <20181012104338.GS30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012104338.GS30658@n2100.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Jon Hunter <jonathanh@nvidia.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Aaro Koskinen <aaro.koskinen@iki.fi>, jmondi <jacopo@jmondi.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Daniel Mack <zonque@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, philipp.zabel@gmail.com, linux-tegra@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 12, 2018 at 1:45 PM Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
>
> On Fri, Oct 12, 2018 at 11:39:15AM +0100, Jon Hunter wrote:
> > We had the same situation for Tegra124 Jetson TK1 but I don't think that
> > adding a pseudo intermediate regulator is cleaner. If the GPIO controls
> > more than one regulator, I don't see why is it necessary to change the
> > DT. There are several other people reporting the same problem with
> > various different boards. So this does seem to be a common usage.
>
> Given that DT describes the hardware, not the software implementation,
> it must not change just because we move from GPIO numbers to GPIO
> descriptors.
>
> The existing DT description is reasonable, and introducing ficticious
> regulators in DT to work around the implementation is not reasonable.

If there is no way to detect shared use of GPIO line for regulators
(*) from current DT description, DT description should be updated to
reflect, yes, hardware.

(*) Not familiar with the guts of DT descriptive language, don't know
if there are some ways to do a such without additional flags or so.

-- 
With Best Regards,
Andy Shevchenko
