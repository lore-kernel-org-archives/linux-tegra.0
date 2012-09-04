From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Kconfig DRM_USB/DRM_UDL, and select vs. depends, and causing
 Tegra USB to be disabled
Date: Tue, 04 Sep 2012 15:01:34 -0600
Message-ID: <50466C2E.2030502@wwwdotorg.org>
References: <50465430.3090806@wwwdotorg.org> <20120904200025.GA18336@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120904200025.GA18336-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/04/2012 02:00 PM, Guenter Roeck wrote:
> On Tue, Sep 04, 2012 at 01:19:12PM -0600, Stephen Warren wrote:
>> With respect to the following commits:
>>
>> df0b344 drm/usb: select USB_SUPPORT in Kconfig
>> 8f057d7 gpu/mfd/usb: Fix USB randconfig problems
>>
>> ... which end up with the following in next-20120904:
>>
>> config DRM_USB
>>         depends on DRM
>>         depends on USB_ARCH_HAS_HCD
>>         select USB
>>         select USB_SUPPORT
>>
>> config DRM_UDL
>>         depends on DRM && EXPERIMENTAL
>>         depends on USB_ARCH_HAS_HCD
>>         select DRM_USB
>>
>> Surely this is backwards; these should be dependencies, not selects? In
>> other words:
>>
>> config DRM_USB
>>         depends on DRM && USB
>>
>> config DRM_UDL
>>         depends on DRM && EXPERIMENTAL && USB
>>         select DRM_USB
>>
>> or perhaps:
>>
>> config DRM_USB
>>         depends on DRM && USB
>>
>> config DRM_UDL
>>         depends on DRM && EXPERIMENTAL && DRM_USB
>>
>> The problem here is that currently, the dependency logic for USB:
>>
>> config USB
>> 	depends on USB_ARCH_HAS_HCD
>>
>> ... is duplicated into each of DRM_USB and DRM_UDL, thus requiring both
>> of those to be edited should the dependencies for USB ever change.
>
> This should be fixed with in https://patchwork.kernel.org/patch/1373371/ (drm:
> udl: usb: Fix recursive Kconfig dependency), which should make it into the next
> iteration of linux-next.

Yes, this does appear to solve all the problems for me. Thanks.

I still tend to believe that drivers should probably depend on things
rather than select them, but given the common precedent for "select USB"
that exists here, others clearly don't agree!

Sorry; accidentally sent the email too early last time:-(
