From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 10/18] tegra: usb: fdt: Add additional device tree
 definitions for USB ports
Date: Fri, 3 Feb 2012 13:44:27 -0800
Message-ID: <CAPnjgZ09rECYUizMkCaQj8xC+X2zrC5WHu_ZHzWax=_tHYrF9w@mail.gmail.com>
References: <1328288907-16725-11-git-send-email-sjg@chromium.org>
	<74CDBE0F657A3D45AFBB94109FB122FF178E5D2FF9@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E5D2FF9-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Fri, Feb 3, 2012 at 12:03 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Simon Glass wrote at Friday, February 03, 2012 10:08 AM:
>> This adds clock references to the USB part of the device tree for U-Boot,
>> and marks USB1 as supporting legacy mode (which we disable in the driver).
>>
>> The USB timing information may vary between boards sometimes, but for
>> now we hard-code it in C. This is because all current T2x boards use
>> the same values, we will deal with T3x later and we first need to agree
>> on the format for this timing information in the fdt and may in fact
>> decide that it has no place there.
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> The has-legacy-mode property looks good to me.
>
> The clock bindings need updating.

Are you referring to your new arbitrary peripheral number assignment
or the peripheral clock binding that you sent?

Regards,
Simon
>
> --
> nvpublic
>
