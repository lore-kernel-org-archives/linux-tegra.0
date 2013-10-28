From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 1/5] ARM: add basic support for Trusted Foundations
Date: Mon, 28 Oct 2013 12:04:43 +0100
Message-ID: <CA+Ln22FdkcxOfq-yxVVQ7vTLWC3TYRBbAOZ=e3WmpSKkgk_DRg@mail.gmail.com>
References: <1381527938-22840-1-git-send-email-acourbot@nvidia.com>
	<1381527938-22840-2-git-send-email-acourbot@nvidia.com>
	<20131015110725.GZ25034@n2100.arm.linux.org.uk>
	<525D7969.5060908@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525D7969.5060908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

2013/10/15 Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> On 10/15/2013 04:07 AM, Russell King - ARM Linux wrote:
>>
>> On Fri, Oct 11, 2013 at 02:45:34PM -0700, Alexandre Courbot wrote:
>>>
>>> Trusted Foundations is a TrustZone-based secure monitor for ARM that
>>> can be invoked using the same SMC-based API on all supported
>>> platforms. This patch adds initial basic support for Trusted
>>> Foundations using the ARM firmware API. Current features are limited
>>> to the ability to boot secondary processors.
>>>
>>> Note: The API followed by Trusted Foundations does *not* follow the SMC
>>> calling conventions. It has nothing to do with PSCI neither and is only
>>> relevant to devices that use Trusted Foundations (like most Tegra-based
>>> retail devices).
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   .../arm/firmware/tl,trusted-foundations.txt        | 20 ++++++
>>>   .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>>>   arch/arm/Kconfig                                   |  2 +
>>>   arch/arm/Makefile                                  |  1 +
>>>   arch/arm/firmware/Kconfig                          | 28 ++++++++
>>>   arch/arm/firmware/Makefile                         |  1 +
>>>   arch/arm/firmware/trusted_foundations.c            | 79
>>> ++++++++++++++++++++++
>>>   arch/arm/include/asm/trusted_foundations.h         | 68
>>> +++++++++++++++++++
>>>   8 files changed, 200 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt
>>>   create mode 100644 arch/arm/firmware/Kconfig
>>>   create mode 100644 arch/arm/firmware/Makefile
>>>   create mode 100644 arch/arm/firmware/trusted_foundations.c
>>>   create mode 100644 arch/arm/include/asm/trusted_foundations.h
>>
>>
>> Is having this under arch/arm appropriate?  What happens if the API
>> gets re-used on ARM64 for example?  Would drivers/firmware be a better
>> cross-arch location for this?
>
>
> The reason why this has been put into arch/arm is that the firmware_ops
> feature this patch depends also resides there
> (arch/arm/include/asm/firmware.h).
>
> On the other hand it might also make sense to move firmware_ops out of ARM
> since I don't see anything ARM-specific with it. Tomasz, could we have your
> thoughts on this?

I don't see anything wrong in moving this out of arch/arm, feel free
to do so.

However I guess that some (or all) of the names will have to
be put into a more separate namespace, as the term "firmware" is a bit
too generic IMHO. Possibly something like platform_firmware could be
better.

What do you think?

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
