From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 25 Jan 2012 14:30:51 -0800
Message-ID: <CAPnjgZ1ZLmeWNC2cHgVZJgbPdOiYAVVSThB8fc63WC5AyJ6s1w@mail.gmail.com>
References: <1327521469-28863-1-git-send-email-swarren@nvidia.com>
	<CAPnjgZ0u-s4B19EOcNTWGFu4duHqOs+cnccFczpfPJn9Aiq0iw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178CB82121@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB82121-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Jan 25, 2012 at 12:31 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Simon Glass wrote at Wednesday, January 25, 2012 1:14 PM:
>> On Wed, Jan 25, 2012 at 11:57 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > Document a binding for the Tegra20 CAR (Clock And Reset) Controlle=
r,
>> > add it to tegra20.dtsi, and configure it for the board in tegra-
>> > seaboard.dts.
> ...
>> > v2:
> ...
>> > * Resolve FIXME re: multiple clocks with the same "reset ID"; give=
 each
>> > =A0unique clock an ID, and ignore the reset bits, since this is pu=
rely a
>> > =A0clock binding. Code (e.g. U-Boot) that wants to use this to det=
ermine
>> > =A0CAR reset bit numbers would need a table to convert from the cl=
ock IDs
>> > =A0in this binding to the related reset bit number, if any. In gen=
eral, I
>> > =A0think that's true, and the U-Boot code that handles "peripheral=
 IDs"
>> > =A0should be reworked to handle "clocks", the peripheral clocks be=
ing a
>> > =A0subset of all clocks.
>>
>> The clock enable and reset enable bits use the same numbering. I thi=
nk
>> you have invented a third which is an arbitrary number which doesn't
>> correspond to anything in hardware. That makes sense for pin mux
>> function perhaps, since the indirection provides a useful concept of
>> function number, but here I can't see the benefit.
>
> I didn't do it because there was specific benefit, but simply because
> we have no choice.

I was quite happy with your original proposal which made them line up
where they could, and used other numbers where they couldn't.

>
> There are clocks that don't have reset bits or clock enable bits.
>
> There are some clocks that are really different clocks (different mux
> selection or divider control registers) yet share the same bit for re=
set
> and clock enable.
>
> Therefore it simply isn't true that there's a 1:1 mapping between clo=
cks
> and clock-enable/reset bits.
>
> I deliberately made this updated binding have a different numbering
> scheme to the clock-enable/reset bits to make this clear, so that no =
one
> would accidentally confuse the two concepts.

I think it makes sense to line them up where you can (all but two
cases out of about 60 I think).

>
>> > * Define clock IDs for all the non-peripheral clocks too; inputs, =
PLLs,
>> > =A0etc.
>> > * Separate tegra-seaboard.dts usage example into a separate patch.
>> >
>> > This patch semantically relies on Grant Likely's common clock bind=
ing patch
>> > series. Once that's finalized, this patch could be checked into th=
e kernel
>> > provided there are no relevant changes to Grant's patches. I belie=
ve that
>> > Simon Glass wants to start using this within U-Boot ASAP though.
>>
>> As I may have said I am really not keen on the idea of having a tabl=
e
>> just to use it in U-Boot.
>
> I don't see any alternative given the way the HW is designed.

You had the alternative yourself the first time around. There clearly
is an alternative.

>
> We could ignore the way the HW works and assume that clock ID =3D=3D =
clock-
> enable/reset bits is true for many clocks. However, it's not true for
> all, so I think that'd be too error-prone.
>
> Equally, I know that you will need a table sometime in U-Boot to map
> from clock ID to clock-enable/reset bit and many other per-clock
> parameters if you're going to be initializing stuff in U-Boot from DT
> rather than hard-coding it, so I think you may as well just add it no=
w.

I am happy that there is now a concept of a peripheral number and we
don't have to refer to everything with strings. I don't mind if for
hardware reasons this peripheral number doesn't always correspond to
everything we point it at (clock, reset, pinmux, clock source). But I
am uncomfortable with it corresponding to nothing because it might be
'error-prone'. This seems to be introducing a layer of indirection
which is not needed at all in U-Boot, for example.

I prefer a clock number which corresponds to the clock enable/reset
bit positions in all cases it can (all but two) and a different number
where it can't. At least this saves one table. Alternatively perhaps
these bit numbers should be specified in the device tree also? I was
rather hoping that the device tree would take us away from having lots
of tables in the C code.

>
>> > diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra2=
0-car.txt
> ...
>> > + =A0The first 96 clocks are numbered to match the bits in the CAR=
's CLK_OUT_ENB
>> > + =A0registers. Later, subsequent IDs will be assigned to all othe=
r clocks the
>> > + =A0CAR controls; mainly the PLLs.
>>
>> Are you sure? The ordering doesn't seem to fit with U-Boot's enum
>> periph_id in arch/arm/include/asm/arch-tegra2/clock.h. That file
>> follows along with the hardware.
>
> No, that paragraph is wrong. I simply forgot to remove it.

Well I vote for a return :-)

>
> --
> nvpublic
>

Regards,
Simon
