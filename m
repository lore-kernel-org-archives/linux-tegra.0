From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL v2 1/4] ARM: tegra: IOMMU support for v3.19
Date: Thu, 04 Dec 2014 16:03:49 +0100
Message-ID: <3327156.hTO1VnvNbE@wuerfel>
References: <1416570832-6220-1-git-send-email-thierry.reding@gmail.com> <2157417.mTprjOdEjk@wuerfel> <20141204144354.GA31464@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141204144354.GA31464-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 04 December 2014 15:43:56 Thierry Reding wrote:
> We discussed this on IRC and come to the conclusion that this approach
> (encoding the table in the driver) was indeed the best for this
> particular type of setup. For the record I'll try to explain the same
> here and provide more details.

Yes, thanks a lot!

> > I was assuming that you'd have one 'struct device' per client in all
> > cases, so you'd have a unique association between a swgroup/id tuple
> > and the device pointer that you pass into the dma-mapping and IOMMU APIs.
> 
> The majority of devices have two clients: one for read transactions,
> another for write transactions. These are typically named <module>r and
> <module>w, respectively. But each such module is a single device and
> represented by a single device tree node.
> 
> The display controllers are somewhat exceptional in that they only read
> data, so there are no write clients. But they also have a couple of
> clients, one for each display window (or overlay). Like you said, this
> looks really like each client is a unidirectional special-purpose DMA
> master.
> 
> Some examples:
> 
> 	HDA: 2 clients: hdar and hdaw
> 	SATA: 2 clients: satar and satar
> 	DC: 6 clients: display{0a,0b,0c,hc,t,d}
> 	DCB: 4 clients: display{0ab,0bb,0cb,hcb}
> 
> Each of those is a single IP block, and each has a SWGROUP that contains
> the set of all the memory clients.

Yep

> > > There are patches in the works to add support for EMC frequency scaling
> > > and also latency allowance programming.
> > 
> > Ok, I see. The part that I'm missing here is how the client driver
> > knows its number, as you write that we don't have a device node per
> > client. Do you have a particular binding in mind already?
> 
> I was thinking that each device tree node would get an additional
> property, maybe something like the below. I'm not sure if it makes sense
> to turn this into a generic binding, given that this is likely to be
> implemented fairly differently on other SoCs, or perhaps other SoCs
> don't even have an equivalent of it.
> 
> 	mc: memory-controller@70019000 {
> 		compatible = "nvidia,tegra124-mc";
> 		...
> 
> 		#nvidia,memory-client-cells = <1>;
> 	};
> 
> 	dc@54200000 {
> 		compatible = "nvidia,tegra124-dc";
> 
> 		...
> 
> 		nvidia,memory-client = <&mc 1 &mc 3 &mc 5 &mc 16 &mc 90 &mc 115>;
> 	};
> 
> Maybe we'd even need something like nvidia,memory-client-names so that
> drivers can determine for which specific clients to set the latency
> allowance.

Yes. We'd have to discuss the binding with some of the other SoC maintainers
to see if they might have a use for this too, but this certainly makes
sense.

	Arnd
