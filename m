From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: question on possible i2c slave configuration
Date: Wed, 21 Aug 2013 23:34:32 +0200
Message-ID: <1394885.ONCPakntio@fb07-iapwap2.physik.uni-giessen.de>
References: <1674757.GDNdpd4ScH@fb07-iapwap2.physik.uni-giessen.de> <5211BF2F.1010309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5211BF2F.1010309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Laxman,

Am Montag, 19. August 2013, 12:16:07 schrieb Laxman Dewangan:
> Hi Marc,
> Sorry for late response, I was on vacation.

As chance would have it, I'm now ;-)

> On Tuesday 13 August 2013 07:46 PM, Marc Dietrich wrote:
> > Hi Laxman,
> > 
> > Stephen and me were discussing about the possible configuration of the i2c
> > slave controller. The question here is if the slave and the master
> > controller of the same port (or instance) can act in parallel.
> 
> Yes, they can work in parallel. Infact we also tested the loopback
> (internal) from master to slave for same instance controller.
> 
> Bot engine (Master and slave) shared the interrupt number, clock bit and
> clock source, reset bit, and some controller registers.
> So if we handle the sharing of this stuff then it is fine to use in
> parallel.

Thanks for confirmation. I don't have much time now to think about how to 
repesent this in DT. One idea which jumped into my mind is to always 
instantiate the master (the bus is not clocked) and instatiate the slave as 
his i2c client. This should make loopback mode work. The downside is, that if 
someone else is the bus master, the DT bus structure would be broken somehow. 
NVEC could talk to the slave via some node handler in this case. 

Will think more about it when I'm "recovered".

Marc

> > This is of particular interest when it comes to device tree
> > representation.
> > The Tegra3 TRM mentions a that the master can address its own slave for
> > testing purposes. Also the i2c block diagram suggests that there are two
> > controllers (for master and slave) connected to the same bus.
> 
> Yes, this is very much supported and we have simple testcases for this.
> 
> > If this is the case, master and slave mode is not exclusive, or in other
> > words, the i2c master and slave need to share their resources.
> 
> Yes, it is not exclusive and share some common resources as mentioned above.
> > Another question is (because this would add a lot of code complexity) if
> > we
> > want to allow such a configuration at all.
> 
> In Tegra context, we did not use the master and slave together as these
> makes the sw unnecessarily complex. We used in either in master or in
> slave only.
