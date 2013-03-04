From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Mon, 04 Mar 2013 10:08:27 -0700
Message-ID: <5134D50B.8060001@wwwdotorg.org>
References: <512BF81A.3080700@wwwdotorg.org> <201302261023.26939.arnd@arndb.de> <20130226113538.GS17833@n2100.arm.linux.org.uk> <512CF87A.4090404@wwwdotorg.org> <20130226181114.GU17833@n2100.arm.linux.org.uk> <5130E757.6090500@wwwdotorg.org> <20130304063436.GB27241@tbergstrom-lnx.Nvidia.com> <20130304091600.GC27241@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130304091600.GC27241-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Bo Yan <byan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/04/2013 02:16 AM, Peter De Schrijver wrote:
> On Mon, Mar 04, 2013 at 07:34:36AM +0100, Peter De Schrijver wrote:
>> On Fri, Mar 01, 2013 at 06:37:27PM +0100, Stephen Warren wrote:
>>
>> ...
>>
>>> Since some of the bits that enable WARs are banked per CPU, the WAR
>>> needs to be enabled by code running on each individual CPU, each time
>>> it's powered on. When a secure monitor exists, the CPU will boot through
>>> it (at least on Tegra, there is a single register that defines the boot
>>> vector for all CPUs; I don't know if that fact is ARM-architectural or
>>> not), so the secure monitor can apply the WAR if needed. However, when
>>> there is no secure monitor and the kernel runs in secure world, the
>>> kernel would have to apply those WARs, since the only code that runs is
>>> in the kernel.
>>>
>>
>> The boot vector register is Tegra specific. At least on OMAP all cores boot
>> from ROM afaik.
> 
> Nicolas Pitre suggested a slightly different solution to me:
> 
> 1) Handle CPU0 errata WARs in the bootloader

OK - there's not much choice here, and I've posted a patch for this for
Tegra U-Boot already.

> 2) Indicate in device tree if linux is booting in secude mode or non-secure
>    mode.
> 3) Use this information in the kernel to decide how to apply the WARs for
>    secondary core bringup and after powerungating.

Hmmm. That seems like a lot of overhead to avoid duplicating roughly 8
assembly instructions per Tegra version. Also, some/all of the WARs in
question probably need to be applied very early by assembly code, e.g.
before MMU is re-enabled, so I think you'd end up parsing DT from
assembly again, which would be painful. I tend to think just including
the code in the kernel's SoC-specific reset handler is simplest, and
even with the slight duplication, probably most maintainable. I've
written a patch for this for Tegra already, which I hope to post later
today, depending on testing and what other stuff I get side-tracked on.
