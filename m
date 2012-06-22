From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 21:08:34 +0000
Message-ID: <201206222108.35094.arnd@arndb.de>
References: <4FDA2DDA.1030704@wwwdotorg.org> <201206221653.31817.arnd@arndb.de> <CAErSpo5dj99iHW0WNEABPR1OO2yS=BwNezOivu6_7Go8sKyjsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo5dj99iHW0WNEABPR1OO2yS=BwNezOivu6_7Go8sKyjsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 22 June 2012, Bjorn Helgaas wrote:
> 
> On Fri, Jun 22, 2012 at 10:53 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Friday 22 June 2012, Bjorn Helgaas wrote:
> >> The requirement (if there is one) isn't anything related to PC-ness.
> >> I just don't understand how things can actually work if two host
> >> bridges both claim the same bus number.  If we do a config read to
> >> that bus, both bridges should claim it and turn it into config cycles
> >> on their respective root buses, and we should get two responses.  I
> >> would expect the second response to cause an "unexpected response"
> >> machine check or similar.
> >
> > But each PCI domain has its own config space, so if you do a config
> > read for one bus, it's always relative to the domain.
> 
> Oh, I see!  I totally missed the fact that each host bridge was in its
> own domain.  If each has its own domain, then the bus number aperture
> can certainly be [bus 00-ff] and there's no problem.

Right. On my side, it took me a while to figure out that you can
actually have multiple root ports in one domain ;-)

	Arnd
