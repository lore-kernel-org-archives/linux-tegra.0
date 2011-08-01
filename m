From: Marc Dietich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: nvec TODO
Date: Mon, 1 Aug 2011 14:27:54 +0200
Message-ID: <201108011427.54686.marvin24@gmx.de>
References: <20110801104549.GG15578@n2100.arm.linux.org.uk> <201108011328.29440.marvin24@gmx.de> <20110801114844.GB19079@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110801114844.GB19079-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> On Mon, Aug 01, 2011 at 01:28:28PM +0200, Marc Dietich wrote:
> > Hi Russell, Greg,
> > 
> > > Greg,
> > > 
> > > A small patch to add something to this staging drivers todo list which
> > > I just noticed.  BTW, why isn't there any easy way to find a list of
> > > addresses to copy against stuff in staging?  I hope I have everyone...
> > 
> > the Tegra/Nvidia/Google people are not involved in this driver
> > development. The hw was used in the first generation Android devices
> > only and became kind of obsolete (in kernels > .32 released by NV), but
> > still there are a handfull older devices using it. That's why some
> > community people (ml:
> > ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, irc:#ac100 on freenode) try to port it to
> > newer kernels.
> 
> And...
> 
>   ac100-+ipbUBPD95tH4x6Dk/4f9A@public.gmane.org
>     SMTP error from remote mail server after RCPT TO:<ac100-+ipbUBPD95tH4x6Dk/4f9A@public.gmane.org>:
>     host mx.launchpad.net [91.189.90.7]: 550 Unrouteable address
> 
> so that list is dead.

It's not dead, it's just my brain which is. The correct address is 
ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org (and subscribers only, you know). Sorry for the 
inconvenience. I'll add this address to the readme. Also note that this address 
is given in the copyright notice in the lastest patches.

Marc
