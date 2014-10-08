From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra124: Add init data for dsi lp clocks
Date: Wed, 8 Oct 2014 18:12:36 +0300
Message-ID: <20141008151236.GD4809@tbergstrom-lnx.Nvidia.com>
References: <1412181642-19415-1-git-send-email-seanpaul@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412181642-19415-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 01, 2014 at 12:40:41PM -0400, Sean Paul wrote:
> Set the parent of the dsi lp clocks to pll_p and the rate
> to 68MHz. The default parent is clk_m and rate is 12MHz, this
> is too slow to receive data from the peripheral.
> 
> Per NVidia HW engineers, the optimal rate is 70MHz, but 68MHz
> will suffice.
> 

Looks good. I will take this for the next merge.

Cheers,

Peter.
