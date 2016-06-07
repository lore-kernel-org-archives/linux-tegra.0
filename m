From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra: Fix build dependency
Date: Tue, 7 Jun 2016 10:20:46 +0100
Message-ID: <575691EE.8020409@nvidia.com>
References: <1465022156.547.2.camel@ingics.com> <5756913F.1000108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5756913F.1000108-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 07/06/16 10:17, Jon Hunter wrote:
> 
> On 04/06/16 07:35, Axel Lin wrote:
>> I got below build error:
>> ERROR: "tegra_xusb_padctl_legacy_probe" [drivers/phy/tegra/phy-tegra-xusb.ko] undefined!
>> with below build configuration:
>> CONFIG_ARCH_TEGRA=y
>> CONFIG_PINCTRL_TEGRA_XUSB=y
>> CONFIG_PHY_TEGRA_XUSB=y
> 
> The above does not make sense because the error is from building a
> module but you say you have CONFIG_PINCTRL_TEGRA_XUSB=y. Shouldn't this
> be CONFIG_PINCTRL_TEGRA_XUSB=m? However, the error will occur either if
> you compile as a module or not, but the changelog should be accurate
> nonetheless.

Sorry I meant CONFIG_PHY_TEGRA_XUSB=m and NOT
CONFIG_PINCTRL_TEGRA_XUSB=m as you are building the phy-tegra-xusb as a
module.

Jon

--
nvpublic
