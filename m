From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/2] Correct SMMU register map
Date: Thu, 7 Nov 2013 07:38:56 +0100
Message-ID: <20131107.083856.2279900025541125722.hdoyu@nvidia.com>
References: <1383796706-10729-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383796706-10729-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Thu, 7 Nov 2013 04:58:24 +0100:

> Current SMMU register map for Tegra30 and Tegra114 doesn't
> match the TRM. So set to the correct values.

We may need to update TRM itself. I'll check this internally.

> Mark Zhang (2):
>   ARM: tegra: Correct Tegra30 SMMU register map
>   ARM: tegra: Correct Tegra114 SMMU register map
> 
>  arch/arm/boot/dts/tegra114.dtsi | 9 ++++++---
>  arch/arm/boot/dts/tegra30.dtsi  | 9 ++++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> -- 
> 1.8.1.5
> 
