From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Override bits for PLLM
Date: Tue, 11 Jun 2013 18:01:24 -0700
Message-ID: <20130612010124.8816.81006@quantum>
References: <1370515677-6807-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370515677-6807-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2013-06-06 03:47:27)
> PLLM has override bits on Tegra30 and Tegra114. This patchset implements
> support for them for both Tegra30 and Tegra114.
> 
> Changes since v1:
>  * Remove some stray lines from 'clk: tegra: override bits for Tegra114 PLLM'

Pulled into clk-next.

Regards,
Mike

> 
> Peter De Schrijver (4):
>   clk: tegra: Add fields for override bits
>   clk: tegra: override bits for Tegra114 PLLM
>   clk: tegra: override bits for Tegra30 PLLM
>   clk: tegra: Use override bits when needed
> 
>  drivers/clk/tegra/clk-pll.c      |   82 ++++++++++++++++++++++---------------
>  drivers/clk/tegra/clk-tegra114.c |    9 ++++
>  drivers/clk/tegra/clk-tegra30.c  |   18 ++++++++
>  drivers/clk/tegra/clk.h          |    8 ++++
>  4 files changed, 84 insertions(+), 33 deletions(-)
> 
> -- 
> 1.7.7.rc0.72.g4b5ea.dirty
