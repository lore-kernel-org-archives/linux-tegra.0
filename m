From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Do not print errors for clk_round_rate()
Date: Thu, 28 Nov 2013 16:07:31 +0200
Message-ID: <20131128140731.GU26617@tbergstrom-lnx.Nvidia.com>
References: <1385569563-25408-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385569563-25408-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 27, 2013 at 05:26:03PM +0100, Thierry Reding wrote:
> clk_round_rate() can be used by drivers to determine whether or not a
> frequency is supported by the clock. The current Tegra clock driver
> outputs an error message and a stacktrace when the requested rate isn't
> supported. That's fine for clk_set_rate(), but it's confusing when all
> the driver does is query whether or not a frequency is supported.
> 

Merged into clk-tegra-next
