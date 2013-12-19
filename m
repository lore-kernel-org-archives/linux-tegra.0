From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: add EMC clock driver
Date: Thu, 19 Dec 2013 13:46:59 +0200
Message-ID: <20131219114659.GF17188@tbergstrom-lnx.Nvidia.com>
References: <1387272400-4689-1-git-send-email-josephl@nvidia.com>
 <1387272400-4689-3-git-send-email-josephl@nvidia.com>
 <52B0D6FA.2060101@wwwdotorg.org>
 <1387359758.2576.38.camel@jlo-ubuntu-64.nvidia.com>
 <52B1E950.1040001@wwwdotorg.org>
 <20131219100557.GE17188@tbergstrom-lnx.Nvidia.com>
 <1387453408.1712.3.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387453408.1712.3.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 19, 2013 at 12:43:28PM +0100, Lucas Stach wrote:
> Am Donnerstag, den 19.12.2013, 12:05 +0200 schrieb Peter De Schrijver:
> [...]
> > 
> > > funny tricks like running from IRAM since we can't access SDRAM during
> > > the clock change? If so, I'm not sure how having the EMC clock changing
> > > code is going to help your case (2) anyway, since we'll presumably have
> > > to code up a custom stub in assembly for the part of the code that runs
> > > from IRAM...
> > > 
> > 
> > There is no need for assembler or running from IRAM (at least from Tegra30
> > onwards, I don't know about Tegra20).
> > 
> Tegra20 doesn't need any IRAM trickery, the sequence is just:
> 1. set up EMC shadow registers for new clock frequency
> 2. change EMC divider in CAR module
> 

Nothing needs to be done after the divider change?

Cheers,

Peter.
