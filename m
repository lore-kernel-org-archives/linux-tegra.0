From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 12/14] clk: tegra: Add EMC clock driver
Date: Fri, 2 Jan 2015 18:27:50 +0200
Message-ID: <20150102162750.GA10073@tbergstrom-lnx.Nvidia.com>
References: <1416312860-4446-1-git-send-email-tomeu.vizoso@collabora.com>
 <1416312860-4446-13-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416312860-4446-13-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, mikko.perttunen-/1wQRMveznE@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 18, 2014 at 01:13:14PM +0100, Tomeu Vizoso wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The driver is currently only tested on Tegra124 Jetson TK1, but should
> work with other Tegra124 boards, provided that correct EMC tables are
> provided through the device tree. Older chip models have differing
> timing change sequences, so they are not currently supported.
> 
> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> 
> ---
> 
> v5:	* Get a pointer to the EMC driver at runtime, to be used when
> 	  calling the EMC API.
> 	* Misc. style fixes
> 	* Fix logic for rounding down to a high rate
> 
> v4:	* Adapt to changes in the OF bindings
> 	* Improve error handling
> 	* Fix comment style
> 	* Make static a few more functions
> 
> v3:	* Add some locking to protect the registers that are shared with the MC
> 	  clock
> 
> v2:	* Make sure that the clock is properly registered
> 	* Bail out early from attempts to set the same rate

Thierry,

How do you want to merge this series? The clock tree part depends on
tegra_read_ram_code which is introduced earlier in this series.

Cheers,

Peter.
