From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 0/3] tegra: use regulator_bulk_set_supply_names()
Date: Wed, 2 Oct 2019 11:09:24 +0200
Message-ID: <CAMRc=Me5tC2pFc56oWrcdLqu3YULYWPFXLXLW6uciZ5OPO7_Ug@mail.gmail.com>
References: <20191001132333.20146-1-brgl@bgdev.pl> <20191001133807.GB3563296@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001133807.GB3563296@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org

wt., 1 pa=C5=BA 2019 o 15:38 Thierry Reding <thierry.reding@gmail.com> napi=
sa=C5=82(a):
>
> On Tue, Oct 01, 2019 at 03:23:30PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The regulator_bulk_set_supply_names() helper was merged upstream. Use i=
t
> > in a couple tegra drivers.
> >
> > Bartosz Golaszewski (3):
> >   ahci: tegra: use regulator_bulk_set_supply_names()
> >   phy: tegra: use regulator_bulk_set_supply_names()
> >   usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
> >
> >  drivers/ata/ahci_tegra.c      | 6 +++---
> >  drivers/phy/tegra/xusb.c      | 6 +++---
> >  drivers/usb/host/xhci-tegra.c | 5 +++--
> >  3 files changed, 9 insertions(+), 8 deletions(-)
>
> I really don't see the point here. You've got a positive diffstat here,
> which means all that churn is without benefit.
>

A hand-coded for loop is replaced with a single function call. The
actual generated code is smaller - I posted bloat-o-meter results last
time. The only reason the number of lines of code doesn't really
change is because the line is broken due to the function and argument
names being too long.

> Is there some subsequent work based on this that will actually improve
> things?

I'd argue that replacing a common operation that's reimplemented
explicitly by hand in many places with a helper function is already an
improvement. Consolidation is almost always good.

That being said, I like your idea about the regulator_get_from_names
helper, but it will take more time as we have to cover optional
multiple regulators as well. In other words: it's on my TODO list, but
in the meantime there's no harm in using this since Mark decided to
make it a part of the regulator API anyway.

Bart
