From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] clk: tegra: Fix PLLE programming
Date: Mon, 7 Apr 2014 17:26:20 +0300
Message-ID: <20140407142620.GA30476@tbergstrom-lnx.Nvidia.com>
References: <1396619715-15524-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396619715-15524-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 04, 2014 at 03:55:13PM +0200, Thierry Reding wrote:
> PLLE has M, N and P divider shift and width parameters that differ from
> the defaults. Furthermore, when clearing the M, N and P divider fields
> the corresponding masks were never shifted, thereby clearing only the
> lowest bits of the register. This lead to a situation where the PLLE
> programming would only work if the register hadn't been touched before.
> 

Will take this into tegra-clk-next. Mike, given that this is bug fix for
a feature which is supposed to work, I think it's appropriate to try to get
this into 3.15 still. I will make a pull-request on 3.15-rc1 as soon as it
appears.

Cheers,

Peter.
