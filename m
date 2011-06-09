From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ARM: tegra/harmony: enable USB host ports
Date: Thu, 9 Jun 2011 08:57:39 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0498E1CFA6@HQMAIL01.nvidia.com>
References: <1307528018-14454-1-git-send-email-marc.zyngier@arm.com>
	<74CDBE0F657A3D45AFBB94109FB122FF0498E1CDC5@HQMAIL01.nvidia.com>
	<4DEFADCB.90805@arm.com> <BANLkTikRZw+OjUit=uLpHYS1KkPeM2FbEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTikRZw+OjUit=uLpHYS1KkPeM2FbEw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mike Rapoport wrote at Thursday, June 09, 2011 12:53 AM:
> On Wed, Jun 8, 2011 at 8:13 PM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> >
> > > I'm not sure if that platform data is appropriate for tegra_ehci1_device;
> > > the ChromeOS kernel doesn't enable that port.
> >
> > There's probably some kind of GPIO trickery involved to reset the
> > port...
> 
> I don't think it's possible to enable port 1 in host mode on
> harmony... As far as I remember, port 1 is routed to mini-B connector
> and there's nothing that would supply Vbus in the host mode...

Yes, looking at the schematic, I don't think I can see anything to drive
5v onto that connector, just detect whether it's there. For the other 3
USB ports, there's clearly something to drive 5v based on a signal from
the LAN/USB hub chip.

-- 
nvpublic
