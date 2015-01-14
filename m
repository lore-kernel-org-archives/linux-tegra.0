From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] clk: tegra: make tegra_clocks_apply_init_table() arch_initcall
Date: Wed, 14 Jan 2015 15:03:44 +0900
Message-ID: <CAAVeFu+Xg+Loh3DC3s4k0u26uiCx-9F6OmDidX+kHKgig39mHA@mail.gmail.com>
References: <20141216203813.22980.2301.stgit@chromeos-P9X79> <20141216203824.22980.48872.stgit@chromeos-P9X79>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141216203824.22980.48872.stgit@chromeos-P9X79>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 17, 2014 at 5:38 AM, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> tegra_clocks_apply_init_table() needs to be called after the udelay
> loop has been calibrated (see commit
> 441f199a37cfd66c5dd8dd45490bd3ea6971117d ("clk: tegra: defer
> application of init table") for why that is).  On existing Tegra SoCs
> this was done by calling tegra_clocks_apply_init_table() from
> tegra_dt_init(). To make this also work on ARM64, we need to change
> this into an initcall. tegra_dt_init() is called from
> customize_machine which is an arch_initcall. Therefore this should
> also work on existing 32bit Tegra SoCs.
>
> Tested on Tegra20 (ventana), Tegra30 (beaverboard), Tegra124 (jetson TK1) and
> Tegra132.

Thierry, I don't think this series has ever been reviewed by us? The
patches apply nicely on my tree and look harmless but I would rather
leave that part to you if you don't mind.
