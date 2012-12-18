From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: dynamically calculate pll_d parameters
Date: Tue, 18 Dec 2012 10:19:36 +0100
Message-ID: <1355822376.1490.55.camel@tellur>
References: <1355767103-5303-1-git-send-email-dev@lynxeye.de>
	 <50D02B0F.4020307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D02B0F.4020307-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 18.12.2012, 16:36 +0800 schrieb Mark Zhang:
> I think we don't need to define a pll_ops for every individual pll.
> That'll be redundant. Just use one pll_ops(with parameter dynamically
> calculating) which is able to serve several plls is OK. Refer to
> tegra30_clocks_data.c, it has already implemented this.
> 
This would be the right thing to do in the long run. But PLL_D requires
a lot less complexity than others to compute the PLL values, because of
the constraints that could be applied. That's why I started doing a
simple function to only make PLL_D dynamic.

I could certainly go ahead and come up with something which applies to
all PLLs, but I imagine this might be even a bigger validation hassle
for NVidia.

Also I'm still not sure how much this patch collides with the clock
rework. I don't know how far this rework has progressed already and I
would like to avoid doing redundant work. Prashant could you please
clarify?

Regards,
Lucas
