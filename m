From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add kexec support to defconfig
Date: Thu, 03 Jan 2013 14:45:02 -0700
Message-ID: <50E5FBDE.90804@wwwdotorg.org>
References: <1357161141-26430-1-git-send-email-swarren@wwwdotorg.org> <20130103210541.GB4412@avionic-0098.adnet.avionic-design.de> <50E5F5A3.1060507@wwwdotorg.org> <20130103212903.GA27749@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130103212903.GA27749-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/03/2013 02:29 PM, Thierry Reding wrote:
> On Thu, Jan 03, 2013 at 02:18:27PM -0700, Stephen Warren wrote:
>> On 01/03/2013 02:05 PM, Thierry Reding wrote:
>>> On Wed, Jan 02, 2013 at 02:12:21PM -0700, Stephen Warren
>>> wrote:
>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> 
>>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- 
>>>> arch/arm/configs/tegra_defconfig |    1 + 1 file changed, 1 
>>>> insertion(+)
>>>> 
>>>> diff --git a/arch/arm/configs/tegra_defconfig 
>>>> b/arch/arm/configs/tegra_defconfig index 742dc41..e621603
>>>> 100644 --- a/arch/arm/configs/tegra_defconfig +++ 
>>>> b/arch/arm/configs/tegra_defconfig @@ -34,6 +34,7 @@ 
>>>> CONFIG_AEABI=y CONFIG_HIGHMEM=y CONFIG_ZBOOT_ROM_TEXT=0x0 
>>>> CONFIG_ZBOOT_ROM_BSS=0x0 +CONFIG_KEXEC=y CONFIG_CPU_FREQ=y 
>>>> CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y CONFIG_CPU_IDLE=y
>>> 
>>> Interesting. What do you plan to use this for? kdump?
>> 
>> I plan to burn a kernel (and a small stub, and a DTB) into flash 
>> instead of U-Boot, and hence not have to rely on any bootloader.
> 
> Why does that require kexec support?

Because I'd be using that kernel plus an initrd to download the "real"
kernel over e.g. TFTP and kexec it.
