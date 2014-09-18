From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/4] clk: tegra: Move mipi-cal initialization into
 clk-tegra1[12]4.c
Date: Thu, 18 Sep 2014 14:26:21 +0300
Message-ID: <20140918112621.GK26779@tbergstrom-lnx.Nvidia.com>
References: <1410360725-4286-1-git-send-email-seanpaul@chromium.org>
 <1410360725-4286-2-git-send-email-seanpaul@chromium.org>
 <541079A8.9080304@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <541079A8.9080304-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Sep 10, 2014 at 06:17:44PM +0200, Stephen Warren wrote:
> On 09/10/2014 08:52 AM, Sean Paul wrote:
> > This patch moves the mipi-cal gate registration down into the SoC
> > specific files to reflect the different in parent between them.
> >
> > Without this change, MIPI calibration will fail on K1 devices if
> > the 72MHz clock is off.
> 
> This isn't a problem with this patch per se, but I notice that what's 
> removed from clk-tegra-periph.c is data in a table, whereas open-coded 
> calls are added to clk-tegra*.c. It'd be nice if the open-coded calls in 
> clk-tegra*.c could be converted to a table (simply with SoC-specific 
> data) and processed by the same function. Peter, would that make sense?

Maybe yes. I will look into this. For this patch, it would make more sense
to keep the entry in clk-tegra-periph.c as it can be used by both Tegra124
and Tegra132.

Cheers,

Peter.
