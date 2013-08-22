From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: add Palmas pincontrol to Dalmore device
 tree
Date: Thu, 22 Aug 2013 11:46:55 +0530
Message-ID: <5215ACD7.9060400@nvidia.com>
References: <1377088461-9499-1-git-send-email-ldewangan@nvidia.com> <1377088461-9499-2-git-send-email-ldewangan@nvidia.com> <5214F8FD.3070003@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5214F8FD.3070003-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 21 August 2013 10:59 PM, Stephen Warren wrote:
> On 08/21/2013 06:34 AM, Laxman Dewangan wrote:
>> Add Palmas pincontrol to Dalmore device tree and make following
>> configuration as default:
>> - Disable DVFS1 and DVFS2.
>> - Set GPIO6 to gpio mode.
>> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
>> +			palmas_pinctrl {
>> +				compatible = "ti,tps65913-pinctrl";
> A node name of "pinmux" would be more appropriate here, since the node
> name should represent device type rather than device identity.
>
> Aside from that, the series looks fine, but at this point will have to
> wait for 3.13 I think, unless this series has a side-effect of fixing
> some bug/regression. Can you please repost once 3.12-rc1 is out?

Sure, I will correct the node name and post the patch later.
