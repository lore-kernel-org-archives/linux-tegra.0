From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 8/8] dmaengine: Remove site specific OOM error messages
 on kzalloc
Date: Thu, 9 Jun 2016 16:30:34 +0100
Message-ID: <20160609153034.GB5438@dell>
References: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
 <1465321121-22238-9-git-send-email-peter.griffin@linaro.org>
 <CACRpkdaf1d8CvBmFCT+bWiXR9ddJ0Mpu5hMi2fzR6sLCXt3EqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaf1d8CvBmFCT+bWiXR9ddJ0Mpu5hMi2fzR6sLCXt3EqA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Leo Li <leoli@freescale.com>, Zhang Wei <zw@zh-kernel.org>, Barry Song <baohua@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 08 Jun 2016, Linus Walleij wrote:

> On Tue, Jun 7, 2016 at 7:38 PM, Peter Griffin <peter.griffin@linaro.o=
rg> wrote:
>=20
> > If kzalloc() fails it will issue it's own error message including
> > a dump_stack(). So remove the site specific error messages.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> A few subsystems may use a cleanup like this...
> I wonder how many unnecessary prints I've introduced
> myself :P

Wolfram did some analysis on this a while back.  IIRC he also
presented on his findings at ELC(?).
=20
--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
