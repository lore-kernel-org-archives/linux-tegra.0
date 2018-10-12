From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH v7] regulator: fixed: Convert to use GPIO descriptor only
Date: Fri, 12 Oct 2018 13:59:12 +0100
Message-ID: <20181012125911.GT30658@n2100.armlinux.org.uk>
References: <20180906122436.25610-1-linus.walleij@linaro.org>
 <20181011090112eucas1p286d8c1edfc1a2a207d8a11c5ad7eb20e~cglSx9qcr2394623946eucas1p2y@eucas1p2.samsung.com>
 <CACRpkdbTdmQQTg1D9jbcHGcT4kZermwVA+QEnUJGf+VYqoKRkg@mail.gmail.com>
 <c2726f18-f0cd-0d3d-c950-3e7212efd34d@nvidia.com>
 <1539272073.18645.12.camel@toradex.com>
 <CACRpkdYDoFhBJy484Hvf0e+zv51w23hqtBYLFxXsiLmWs63CWw@mail.gmail.com>
 <1539337415.30485.21.camel@toradex.com>
 <c1722bee-230a-d0ad-d2de-790ab1ce9fcf@nvidia.com>
 <20181012104338.GS30658@n2100.armlinux.org.uk>
 <1539344591.30485.28.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1539344591.30485.28.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>, "aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>, "jacopo@jmondi.org" <jacopo@jmondi.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "broonie@kernel.org" <broonie@kernel.org>, "shc_work@mail.ru" <shc_work@mail.ru>, "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rppt@linux.vnet.ibm.com" <rppt@linux.vnet.ibm.com>, "zonque@gmail.com" <zonque@gmail.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "philipp.zabel@gmail.com" <philipp.zabel@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 12, 2018 at 11:43:13AM +0000, Marcel Ziswiler wrote:
> I don't think it is that fictitious as it makes it crystal clear that
> there is something shared with all its pros and cons. E.g. what happens
> if one of them regulators wants to turn off while the other one still
> needs power? The regular regulator dependency tree would nicely make
> this all clear.

If you're introducing a regulator that doesn't exist in reality
just to be able to share a GPIO line that is wired to several
real regulators, then it _is_ ficticious.  You're not describing
the hardware, you're describing something else to work around the
shortcomings of the implementation that can't cope with how stuff
is wired up in the real world.  You're making the DT description
fit the software implementation, rather than the software
implementation fit the real world hardware.

Having a single GPIO that controls multiple separate regulators
which have entirely separate supplies of their own is very common
in electronics.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
