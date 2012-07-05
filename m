From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: enable wireless in defconfig
Date: Thu, 05 Jul 2012 14:42:33 -0600
Message-ID: <4FF5FC39.3090402@wwwdotorg.org>
References: <1341394488-13169-1-git-send-email-wni@nvidia.com> <1341394488-13169-6-git-send-email-wni@nvidia.com> <4FF5F20F.2050005@wwwdotorg.org> <2114579.sqTp7XiW3H@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2114579.sqTp7XiW3H@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/05/2012 02:35 PM, Marc Dietrich wrote:
> On Thursday 05 July 2012 13:59:11 Stephen Warren wrote:
>> On 07/04/2012 03:34 AM, Wei Ni wrote:
>>> New options enabled:
>>> * WIRELESS: (dependency)
>>> * CFG80211: (dependency)
>>> * WLAN: (dependency)
>>> * BRCMFMAC: wlan driver, enable as module.
>>>
>>> diff --git a/arch/arm/configs/tegra_defconfig
>>> b/arch/arm/configs/tegra_defconfig
>>>
>>> +CONFIG_BRCMFMAC=m
>>
>> Why does this need to be a module? Everything else in tegra_defconfig is
>> built-in, and it'd be nice to be consistent here. Built-in makes
>> net-booting new kernels from U-Boot much easier, since there aren't any
>> modules to copy.
> 
> network drivers (especially wifi) are often modules because they need firmwares. 

So I certainly see that WiFi modules may need firmware.

But I don't see why that should imply they must be modules; they should
be able to defer their firmware loading until the firmware is available.

> I'm not sure if the kernel can compile them in every case. Our RT2x00 is an 
> example (which also needs a defconfig entry btw) but brcmfmac also needs it as 
> modinfo shows. Beside that, I don't think you want to netboot using wifi and u-
> boot because this needs a huge wireless framework which u-boot doesn't have.

I net-boot using a USB wired Ethernet adapter. The issue isn't that I
want to use wireless from U-Boot, but rather than it's easy to download
the zImage and .dtb using U-Boot since they're just copied to RAM, but
getting a bunch of modules into a filesystem on the target before
booting the kernel is more painful.
