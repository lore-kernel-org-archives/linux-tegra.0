From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dt: add header to define tegra20 clocks
Date: Thu, 14 Feb 2013 16:58:02 +0200
Message-ID: <20130214145802.GK3073@tbergstrom-lnx.Nvidia.com>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org>
 <1360823899-17846-1-git-send-email-hdoyu@nvidia.com>
 <20130214101220.GI3073@tbergstrom-lnx.Nvidia.com>
 <20130214.154250.475978229890081002.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130214.154250.475978229890081002.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> There could be the same kind of requirement from others that both
> "dtsip" and "C-source" want to share the same header file. If we
> consider that DT is the exact H/W description, C-source should be able
> to include a DT header file.
> 
> For example, a C-header file for "enum tegra{20,30}_clk" should be
> generated from "arch/arm/boot/dts/tegra{20,30}-car.h" at runtime, or
> alternatively just "drivers/clk/tegra/clk-tegra{20,30}.c" can include
> "arch/arm/boot/dts/tegra{20,30}-car.h"? The latter may be easier.

Including arch/arm/boot/dts/tegra{20,30}-car.h seems to make much more sense
to me than generating a enum based on #defines... :)

Cheers,

Peter.
