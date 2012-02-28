From: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v6 11/20] tegra: fdt: Add clock bindings for
 Tegra2 Seaboard
Date: Tue, 28 Feb 2012 23:16:56 +0100
Message-ID: <4F4D5258.7020901@aribaud.net>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org> <1330375973-10681-12-git-send-email-sjg@chromium.org> <4F4C11E9.1050907@nvidia.com> <CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1D6A@HQMAIL01.nvidia.com> <CAPnjgZ1LsFeADVHRcS694EwJrz3V+ONdp9ds+bdAG5rNupQ_ag@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB0@HQMAIL01.nvidia.com> <CAPnjgZ3vsw2rH1CdiN_3xzvJr2pUTn_SY4jNEf-w26cRK=3gmQ@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB8@HQMAIL01.nvidia.com> <CAPnjgZ0VGRSgb92u2UbNf+_HFF-EXhLZzC4XdYUvAjVKtz1XtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0VGRSgb92u2UbNf+_HFF-EXhLZzC4XdYUvAjVKtz1XtQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Le 28/02/2012 19:46, Simon Glass a =E9crit :
> Hi Stephen,
>
> On Tue, Feb 28, 2012 at 10:41 AM, Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
 wrote:
>> Simon Glass wrote at Tuesday, February 28, 2012 11:37 AM:
>>> On Tue, Feb 28, 2012 at 10:31 AM, Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
>  wrote:
>>>> Simon Glass wrote at Tuesday, February 28, 2012 10:38 AM:
>>>> ...
>>>>> I am going to add your binding, less the #clock-cells which U-Boo=
t
>>>>> currently can't support because it conflicts with the C preproces=
sor
>>>>> (at some point I may look at a patch to use sed or some other mea=
ns of
>>>>> avoiding this).
>>>>
>>>> Out of curiosity, why does the C preprocessor come into it? Is U-B=
oot's
>>>> build process running cpp on the .dts files or something? That's n=
on-
>>>> standard, although perhaps it could be a useful standard...
>>>
>>> Yes, but at the moment we only use it for '/include/ ARCH_CPU_DTS'.
>>
>> Uggh. That's going to make the device tree files look different betw=
een
>> the kernel and U-Boot:-( With # disallowed in particular, it's going=
 to
>> prevent U-Boot from /ever/ using the correct protocols for parsing t=
he
>> device tree. This seems like an extremely bad idea.
>
> Until we change it in U-Boot, you mean. We could move to sed or pre-
> and post-process the file to remove and re-insert the #.

Rather, to convert # signs into something that the DTS cannot contain=20
and the compiler can withstand (and it should be printable ASCII, too).=
=20
is '##' a good candidate?

If so, a forward conversion would e.g. map '/include/' to '#include' an=
d=20
any '#' to '##', and the reverse conversion would turn all '##' to '#'.

But something that simple is bound to be wrong in some way...

Amicalement,
--=20
Albert.
