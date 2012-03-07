From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v6 11/20] tegra: fdt: Add clock bindings for
 Tegra2 Seaboard
Date: Tue, 6 Mar 2012 18:48:14 -0800
Message-ID: <CAPnjgZ1d-3uOhvtt89XnFuQGx9gV4y3hiSr202r2sW_VNSojSw@mail.gmail.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-12-git-send-email-sjg@chromium.org>
	<4F4C11E9.1050907@nvidia.com>
	<CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1D6A@HQMAIL01.nvidia.com>
	<CAPnjgZ1LsFeADVHRcS694EwJrz3V+ONdp9ds+bdAG5rNupQ_ag@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB0@HQMAIL01.nvidia.com>
	<CAPnjgZ3vsw2rH1CdiN_3xzvJr2pUTn_SY4jNEf-w26cRK=3gmQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB8@HQMAIL01.nvidia.com>
	<20120305204653.GA913@bill-the-cat>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120305204653.GA913@bill-the-cat>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Tom,

On Mon, Mar 5, 2012 at 12:46 PM, Tom Rini <trini-l0cyMroinI0@public.gmane.org> wrote:
> On Tue, Feb 28, 2012 at 10:41:15AM -0800, Stephen Warren wrote:
>> Simon Glass wrote at Tuesday, February 28, 2012 11:37 AM:
>> > On Tue, Feb 28, 2012 at 10:31 AM, Stephen Warren <swarren@nvidia.c=
om> wrote:
>> > > Simon Glass wrote at Tuesday, February 28, 2012 10:38 AM:
>> > > ...
>> > >> I am going to add your binding, less the #clock-cells which U-B=
oot
>> > >> currently can't support because it conflicts with the C preproc=
essor
>> > >> (at some point I may look at a patch to use sed or some other m=
eans of
>> > >> avoiding this).
>> > >
>> > > Out of curiosity, why does the C preprocessor come into it? Is U=
-Boot's
>> > > build process running cpp on the .dts files or something? That's=
 non-
>> > > standard, although perhaps it could be a useful standard...
>> >
>> > Yes, but at the moment we only use it for '/include/ ARCH_CPU_DTS'=
=2E
>>
>> Uggh. That's going to make the device tree files look different betw=
een
>> the kernel and U-Boot:-( With # disallowed in particular, it's going=
 to
>> prevent U-Boot from /ever/ using the correct protocols for parsing t=
he
>> device tree. This seems like an extremely bad idea.
>
> Keeping my TI hat on, I think it'd be a bad idea to have dts stuff
> divergent from the kernel. =A0Have you raised the problem you're tryi=
ng to
> solve to the general DT gurus? =A0My very high level hope is that som=
eday
> we can have them shared between kernel and u-boot (either directly or
> something silly like a .dtss that spits out a kernel dts and a u-boot
> dts). =A0Going with a manual sync from kernel form to u-boot form see=
ms
> like adding a burden on ourselves we might not have to.

I agree, of course. I think the best solution may be to implement
search paths in dtc. I sent a patch today so let's see what people
think.

It is even worse when we copy the .dts and .dtsi files somewhere else
(e.g. losing the original directory tree relationship by copying all
into one directory).

Regards,
Simon

>
> --
> Tom
