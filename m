From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/7] misc Tegra clock fixes
Date: Wed, 8 Jan 2014 14:28:37 -0800
Message-ID: <CAL1qeaG0Y4__viWsZeoFdf8XFN3Wk7CO2abeEjzRZg+wNRV56w@mail.gmail.com>
References: <1388105067-24438-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388105067-24438-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen, Peter,

> Fixes for various clock-related issues found during bringup of
> Tegra124-based Venice2 and Norrin boards.
>
> Andrew Bresticker (3):
>   clk: tegra: fix sdmmc clks on Tegra1x4
>   clk: tegra: cclk_lp has a pllx/2 divider
>   clk: tegra: use max divider if divider overflows
>
> David Ung (1):
>   clk: tegra: PLLD2 fixes for hdmi
>
> Gabe Black (1):
>   clk: tegra: Fix PLLP rate table
>
> Mark Zhang (1):
>   clk: tegra: fix host1x clock on Tegra124
>
> Rhyland Klein (1):
>   clk: tegra: Fix PLLD mnp table
>
>  drivers/clk/tegra/clk-divider.c          |  2 +-
>  drivers/clk/tegra/clk-id.h               |  4 +++
>  drivers/clk/tegra/clk-tegra-periph.c     |  4 +++
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  2 +-
>  drivers/clk/tegra/clk-tegra114.c         |  8 +++---
>  drivers/clk/tegra/clk-tegra124.c         | 46 +++++++++++++++++++-------------
>  6 files changed, 41 insertions(+), 25 deletions(-)

Any comments on this series?

Thanks!
Andrew
