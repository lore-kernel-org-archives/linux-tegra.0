From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: add EMC clock driver
Date: Thu, 19 Dec 2013 12:05:57 +0200
Message-ID: <20131219100557.GE17188@tbergstrom-lnx.Nvidia.com>
References: <1387272400-4689-1-git-send-email-josephl@nvidia.com>
 <1387272400-4689-3-git-send-email-josephl@nvidia.com>
 <52B0D6FA.2060101@wwwdotorg.org>
 <1387359758.2576.38.camel@jlo-ubuntu-64.nvidia.com>
 <52B1E950.1040001@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B1E950.1040001-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > I guess using the clk_notifier may be OK for the 1st case.
> 
> In both cases, isn't the overall operation something like:
> 
> a) Do some work before changing the EMC clock
> b) Change the EMC clock
> c) Do some work after changing the EMC clock
> 

There is hw interaction between the EMC controller and the CAR module.
Writing to the EMC clock source register in CAR will trigger a state machine
in the EMC controller to handle the change of memory clock. The details
of the state machine and how it needs to be setup are different for
each Tegra variant. This means we need to be sure of the exact sequence
of CAR and EMC register accesses for this to work. In theory this could
be done with pre and post rate change notifiers, but I'm afraid this would
be quite fragile.

> Admittedly, the exact definition of "some work" is different for your
> cases (1) and (2) above, but the overall structure is the same. As such,
> can't the EMC scaling driver do (a), then do (b) i.e. call
> clk_set_rate(), then do (c)? Or, in your case (2), do we need to do

We would need to be very sure clk_set_rate() doesn't access any other register
besides the EMC clock source register before returning to the EMC scaling
driver.

> funny tricks like running from IRAM since we can't access SDRAM during
> the clock change? If so, I'm not sure how having the EMC clock changing
> code is going to help your case (2) anyway, since we'll presumably have
> to code up a custom stub in assembly for the part of the code that runs
> from IRAM...
> 

There is no need for assembler or running from IRAM (at least from Tegra30
onwards, I don't know about Tegra20).

Cheers,

Peter.
