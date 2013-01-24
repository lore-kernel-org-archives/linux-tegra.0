From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: add support for Tegra114 SoC
Date: Thu, 24 Jan 2013 08:28:04 +0100
Message-ID: <20130124072804.GL8364@nekote.pengutronix.de>
References: <1357387486-25966-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357387486-25966-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Jan 05, 2013 at 05:34:46PM +0530, Laxman Dewangan wrote:
> NVIDIA's Tegra114 has following enhanced feature in i2c controller:
> - Enable/disable control for per packet transfer complete interrupt.
>   Earlier SoCs could not disable this.
> - Single clock source for standard/fast and HS mode clock speed.
>   The clock divisor for fast/standard mode is added into the i2c
>   controller to meet the HS and standard/fast mode of clock speed
>   from single source.
> 
> Add support for the above feature to make it functional on T114 SOCs.

Thanks, applied to next.
