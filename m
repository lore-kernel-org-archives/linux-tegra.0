From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Tue, 18 Dec 2012 13:02:58 +0100
Message-ID: <1355832178.1490.66.camel@tellur>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de>
	   <1355516086-11116-2-git-send-email-dev@lynxeye.de>
	   <50CEFD28.7080601@gmail.com> <1355743334.1490.7.camel@tellur>
	  <50D024B7.400@gmail.com> <1355821912.1490.48.camel@tellur>
	 <50D05891.3070006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D05891.3070006-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 18.12.2012, 19:50 +0800 schrieb Mark Zhang:
[...]
> >>>>
> >>>> Get confused here. Why we add all bandwidth up? We should loop all the
> >>>> bandwidth requests in "constraints" array, find out the largest one,
> >>>> compare with emc table then finally write the registers and set the emc
> >>>> clock, isn't it?
> >>>>
> >>> No, bandwidth constraints add up. Imagine two display clients scanning
> >>> out at the same time. Both on their own may be satisfied with 83MHz DRAM
> >>> clock, but if they are running at the same time you have to account for
> >>> that and maybe bump DRAM freq to 133MHz.
> >>
> >> Ah, yes, this is correct for dc. I skimmed the downstream kernel codes
> >> and found that there are different logics for different clients. For DC,
> >> their bandwidth request should be added up. For other clients, e.g: USB,
> >> set to max bandwidth request is OK.
> >>
> >> So we may do more works on this part later, to write a more accurate
> >> algorithms to get the final emc rate. For now, it's OK.
> >>
> > I don't see how there could be any difference at the EMC level. You
> > always want the EMC to deliver enough bandwidth for all registered
> > clients. You certainly don't want to risk display corruptions just
> > because USB also demands it's share. This might be a bad example as the
> > high priority of the DC transaction may kick out USB, but still.
> > 
> > There might be different ways on how clients compute their needed
> > bandwidth, maybe USB only request bandwidth for one high speed port even
> > if three ports are connected. But that's the clients decision, not the
> > EMCs.
> 
> Make EMC to deliver enough bandwidth is right but if we don't do
> something while just adding all requests up will make EMC always running
> at the highest rate, because EMC has too many clients. That makes
> DVFS/power saving doesn't make sense.
> 
Clients should only request bandwidth from the EMC if they are going to
use it. It isn't too clear from the current patchset, but clients are
responsible to set their bandwidth req back to zero if they don't need
the bw any more to provide the EMC with opportunities to scale back down
again.

For DC we are not using this right now as we are never turning off a DC
at all. But I have some DPMS patches in the making that will show how
this is supposed to work: request bw for the current mode, clear out the
req once you stop scanout.

As explained in the comment at the function prototype you don't request
bw because you may need it to do something fast, but because you need it
and your engine will malfunction if the EMC fails to provide this much
bw. That's why it called the bandwidth floor internally.

Regards,
Lucas
