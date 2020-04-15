From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH] PCI: tegra: Fix reporting GPIO error value
Date: Wed, 15 Apr 2020 13:17:36 +0200
Message-ID: <20200415111736.czeh7a3iqmmasow6@pali>
References: <20200414102512.27506-1-pali@kernel.org>
 <20200414113104.GA27984@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200414113104.GA27984@qmqm.qmqm.pl>
Sender: linux-pci-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 14 April 2020 13:31:04 Michał Mirosław wrote:
> On Tue, Apr 14, 2020 at 12:25:12PM +0200, Pali Rohár wrote:
> > Error code is stored in rp->reset_gpio and not in err variable.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  drivers/pci/controller/pci-tegra.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> > index 0e03cef72840..378d5a8773c7 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -2314,8 +2314,8 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
> >  			if (PTR_ERR(rp->reset_gpio) == -ENOENT) {
> >  				rp->reset_gpio = NULL;
> >  			} else {
> > -				dev_err(dev, "failed to get reset GPIO: %d\n",
> > -					err);
> > +				dev_err(dev, "failed to get reset GPIO: %ld\n",
> > +					PTR_ERR(rp->reset_gpio));
> >  				return PTR_ERR(rp->reset_gpio);
> >  			}
> >  		}
> 
> You can use %pe directly on the pointer for added benefit of translation
> of the error to a name.

Well, I do not know what is the current preferred style of error
messages. On lot of places I see just numeric error numbers.

I did not wanted to change behavior of driver, I just fixed code to
report correct error value.

I do not have this hardware, so I cannot test this change. I just
spotted this problem when I was looking at other PCI controller drivers
how they issue PERST# signal to endpoint cards.
