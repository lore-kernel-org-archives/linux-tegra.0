From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH v2 2/6] PCI: tegra: use new OF interrupt mapping when
 possible
Date: Fri, 07 Mar 2014 12:31:37 +0900
Message-ID: <004b01cf39b5$bf13e690$3d3bb3b0$%han@samsung.com>
References: <1394025951-32438-1-git-send-email-l.stach@pengutronix.de>
 <5318B232.2020507@wwwdotorg.org>
 <1394127555.4582.1.camel@weser.hi.pengutronix.de>
 <201403070125.28582.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <201403070125.28582.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Lucas Stach' <l.stach@pengutronix.de>
Cc: 'Stephen Warren' <swarren@wwwdotorg.org>, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 'Bjorn Helgaas' <bhelgaas@google.com>, 'Simon Horman' <horms@verge.net.au>, 'Shawn Guo' <shawn.guo@linaro.org>, 'Ben Dooks' <ben-linux@fluff.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Thierry Reding' <thierry.reding@gmail.com>, kernel@pengutronix.de, 'Jingoo Han' <jg1.han@samsung.com>
List-Id: linux-tegra@vger.kernel.org

On Friday, March 07, 2014 9:25 AM, Arnd Bergmann wrote:
> On Thursday 06 March 2014, Lucas Stach wrote:
> > Am Donnerstag, den 06.03.2014, 10:36 -0700 schrieb Stephen Warren:
> > > On 03/05/2014 06:25 AM, Lucas Stach wrote:
> > > > This is the recommended method of doing the IRQ
> > > > mapping. For old devicetrees we fall back to the
> > > > previous practice.
> > >
> > > Tested-by: Stephen Warren <swarren@nvidia.com>
> > >
> > > I tested both with and without patch 1/6, and the PCIe-based NIC on
> > > Beaver worked fine either way. Without patch 1/6, I do see:
> > >
> > > pci 0000:00:01.0: of_irq_parse_pci() failed with rc=-22
> > >
> > > ... but that seems reasonable given that the DT that of_irq_parse_pci()
> > > parses is missing, and did correctly trigger the fallback path, so
> > > everything still worked.
> >
> > Yes, this should be normal. It spits this error for old DTs, but keeps
> > doing the right thing. I'm not sure if we should downgrade this to info
> > or dbg.
> 
> No, I think printing an error like this is appropriate: it is an incentive
> to update the dts files, but doesn't look too urgent as long as everything
> still works.

+1

I agree with Arnd's opinion. I think that all dts files should be
updated properly. This error message can be the good way to do it.
Thank you.

Best regards,
Jingoo Han
