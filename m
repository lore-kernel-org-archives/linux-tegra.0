From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 6/6] PCI: designware: use new OF interrupt mapping
 when possible
Date: Mon, 07 Apr 2014 10:38:49 +0200
Message-ID: <1396859929.4553.2.camel@weser.hi.pengutronix.de>
References: <1394025951-32438-1-git-send-email-l.stach@pengutronix.de>
	 <1394025951-32438-7-git-send-email-l.stach@pengutronix.de>
	 <20140305184219.GA29903@obsidianresearch.com>
	 <20140404170341.GG9007@google.com> <20140404170517.GH9007@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20140404170517.GH9007@google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, linux-pci@vger.kernel.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, Simon Horman <horms@verge.net.au>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben-linux@fluff.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Bjorn,

Am Freitag, den 04.04.2014, 11:05 -0600 schrieb Bjorn Helgaas:
> On Fri, Apr 04, 2014 at 11:03:41AM -0600, Bjorn Helgaas wrote:
> > On Wed, Mar 05, 2014 at 11:42:19AM -0700, Jason Gunthorpe wrote:
> > > On Wed, Mar 05, 2014 at 02:25:51PM +0100, Lucas Stach wrote:
> > > > -	return pp->irq;
> > > > +	irq = of_irq_parse_and_map_pci(dev, slot, pin);
> > > > +	if (!irq)
> > > > +		irq = pp->irq;
> > > 
> > > In light of the two bugs that Tim found, it might be wise to throw a
> > > 'dev_warn(FW_BUG "Missing DT interrupt mapping")' in the fall back
> > > path, so it doesn't continue to silently cover up errors on the OF/DT
> > > side..
> > 
> > This sounds like a reasonable thing to do, but I didn't see a response to
> > this comment.  Should I merge it as-is, or do you want to add the message?
> 
> Oh, and I suppose the same question applies to the other host drivers in
> this series (tegra, rcar)?

Please apply as-is. of_irq_parse_and_map_pci() already prints an error
message if it isn't able to establish the mapping, thus right before we
fall into the fallback path. So any the warning would be redundant.

Regards,
Lucas
-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
