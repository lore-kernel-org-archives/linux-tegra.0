From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v7 4/5] ARM: tegra: Add efuse and apbmisc bindings
Date: Thu, 05 Jun 2014 16:55:22 -0600
Message-ID: <5390F55A.8090207@wwwdotorg.org>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-5-git-send-email-pdeschrijver@nvidia.com> <5390B9F3.8030108@wwwdotorg.org> <20140605221301.GQ5961@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140605221301.GQ5961-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/05/2014 04:13 PM, Peter De Schrijver wrote:
> On Thu, Jun 05, 2014 at 08:41:55PM +0200, Stephen Warren wrote:
>> On 06/05/2014 07:09 AM, Peter De Schrijver wrote:
>>> Add efuse and apbmisc bindings for Tegra20, Tegra30, Tegra114 and Tegra124.
>>
>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>>
>>> +	apbmisc@70000800 {
>>> +		compatible = "nvidia,tegra114-apbmisc", "nvidia,tegra20-apbmisc";
>>
>> Is the Tegra114 APBMISC register layout 100% a backwards-compatible
>> superset of that in Tegra20? For both registers the code currently uses
>> *and* all possible registers the code could ever use? Since the APB MISC
>> is a bit of a dumping ground for random registers, that feels unlikely,
>> but perhaps it's possible.
> 
> For all I can see it is. At least for the registers the kernel is likely to
> use.

But that's ("At least for the registers the kernel is likely to  use")
not how compatible values are defined. We need to explicitly look at all
the registers and actively decide that it really is compatible in order
to mark it so. If we don't want to do that, it's best just to use a
separate compatible value for each SoC, and add a couple more entries
into the match table.
