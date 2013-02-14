From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dt: add header to define tegra20 clocks
Date: Thu, 14 Feb 2013 14:42:50 +0100
Message-ID: <20130214.154250.475978229890081002.hdoyu@nvidia.com>
References: <1360791198-29462-1-git-send-email-swarren@wwwdotorg.org><1360823899-17846-1-git-send-email-hdoyu@nvidia.com><20130214101220.GI3073@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130214101220.GI3073-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote @ Thu, 14 Feb 2013 11:12:20 +0100:

> On Thu, Feb 14, 2013 at 07:38:17AM +0100, Hiroshi Doyu wrote:
> > To replace magic number in "clocks = <&tegra_car 28>;"
> > 
> 
> But then we should probably also remove the enum tegra20_clk and replace it
> with this header file. We should also consider removing the list of IDs from
> the documentation and refer to the header file instead. Otherwise we will have
> 3 places which define the same IDs and we need to be sure they stay in sync...

Actually I generate "arch/arm/boot/dts/tegra{20,30}-car.h" by parsing
"enum tegra{20,30}_clk {..};" with a python script.

There could be the same kind of requirement from others that both
"dtsip" and "C-source" want to share the same header file. If we
consider that DT is the exact H/W description, C-source should be able
to include a DT header file.

For example, a C-header file for "enum tegra{20,30}_clk" should be
generated from "arch/arm/boot/dts/tegra{20,30}-car.h" at runtime, or
alternatively just "drivers/clk/tegra/clk-tegra{20,30}.c" can include
"arch/arm/boot/dts/tegra{20,30}-car.h"? The latter may be easier.
