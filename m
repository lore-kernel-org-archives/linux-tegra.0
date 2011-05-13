From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: dt: Split out separate Tegra SoC DT
Date: Sat, 14 May 2011 00:56:41 +0200
Message-ID: <BANLkTikdKj=U1eu79XB1qriXeNqeoqhZ2Q@mail.gmail.com>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
 <20110501145546.GC19918@quad.lixom.net> <74CDBE0F657A3D45AFBB94109FB122FF0497F1B198@HQMAIL01.nvidia.com>
 <BANLkTikC9bAWiGsLP48djMB-jTR767JeNg@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF04986AA33D@HQMAIL01.nvidia.com>
 <BANLkTimHcXOZa61yC5F=TDoiaUk4cA3=4g@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF04986AA65C@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04986AA65C-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 13, 2011 at 9:28 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Grant Likely wrote at Thursday, May 12, 2011 5:02 PM:
>> On Thu, May 12, 2011 at 6:40 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>=
 wrote:
>> > Grant Likely wrote at Monday, May 02, 2011 2:16 PM:
>> >> On Mon, May 2, 2011 at 12:00 PM, Stephen Warren <swarren@nvidia.c=
om> wrote:
>> >> > Olof Johansson wrote at Sunday, May 01, 2011 8:56 AM:
>> >> >> On Fri, Apr 29, 2011 at 10:12:30PM -0600, Stephen Warren wrote=
:
>> >> >> A mostly unrelated question below.
>> >> >>
>> >> >> [...]
>> >> >>
>> >> >> > + =A0 serial@70006000 {
>> >> >> > + =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra250-uart";
>> >> >>
>> >> >> I know this is how Grant specified it, but shouldn't these als=
o have
>> >> >> a compat for ns16550?
>> >> >
>> >> > At present, I'm not sure it is technically compatible. If you l=
ook at
>> >> > drivers/tty/serial/of_serial.c, you'll see:
>> >> >
>> >> > static struct of_device_id __devinitdata of_platform_serial_tab=
le[] =3D
>> {
>> >> > ...
>> >> > =A0 =A0 =A0 =A0{ .compatible =3D "ns16550", =A0.data =3D (void =
*)PORT_16550, },
>> >> > ...
>> >> > =A0 =A0 =A0 =A0{ .compatible =3D "nvidia,tegra250-uart", =A0.da=
ta =3D (void *)PORT_XSCALE, },
>> >> >
>> >> > That PORT_XSCALE is different to the ns16550 entry. Arguably, t=
hat
>> >> > field should be something that comes from the device tree, just
>> >> > like e.g. reg-shift, but it certainly doesn't right now.
>> >> >
>> >> > Grant, what are your thoughts on this?
>> >>
>> >> Heh, when I added that line I just mirrored the 'type' of 16550 a=
s
>> >> detected by the 8250.c driver when it probes and made a mental no=
te
>> >> that it should be revisited. =A0I don't know the hardware very we=
ll, so
>> >> I cannot easily say what the right thing to do is, but making it
>> >> ns16550 compatible does seem to make sense.
>> >
>> > I looked into this a bit more and found the following:
>> >
>> > In all the existing board files for Tegra, none of the
>> > plat_serial8250_port initializations specify any type value, and e=
qually
>> > the flags do not include UPF_FIXED_TYPE. This causes the UART driv=
er to
>> > probe (run tests on) the hardware to determine exactly what type o=
f UART
>> > is present.
>> >
>> > However, of_serial.c does set UPF_FIXED_TYPE, and hence port->type=
 must
>> > have a valid value. I suspect it'd be a bad idea to change this si=
nce
>> > it'd affect a ton of extant PPC platforms.
>> >
>> > Equally, PORT_XSCALE does imply different HW behavior to any of th=
e
>> > other types, so tegra250.dtsi shouldn't just specify that it's com=
patible
>> > with "ns16550".
>>
>> I investigated and found the same thing, and that is why I set up th=
e
>> current code the way I did; to preserve the current behaviour.
>>
>> However, is the current behaviour even right? =A0My impression from =
the
>> code is that probing for the type of ns16550 is little more than an
>> accident. =A0Is xscale really the best behaviour to select fro this
>> device?
>
> The detection for XSCALE port type is solely based on the writability
> of a single bit in the IER. The Tegra documentation says this bit is
> undefined, so I agree it's probably an accident that Tegra's UART is
> being detected as XSCALE. If I disable that part of the auto-detectio=
n,
> Tegra's UART is detected as a 16550, as expected.
>
> However, that setting doesn't work correctly. Specifically, on Tegra,
> there's a bit in the Interrupt Enable Register (IER) that needs to be
> set to enable interrupt on RX timeout. Without this, one needs to fil=
l
> the RX FIFO up to its attention level before the HW interrupts and
> before SW sees any of those characters.
>
> That's one of the two things that the XSCALE port type causes to happ=
en.
> The other thing is programming of the IER UUE bit, which is the bit u=
sed
> in the auto-detection that Tegra apparently doesn't actually implemen=
t.
>
> While researching this, I found a patch to 8250.c to add a specific
> Tegra port type:
>
> http://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-2.6.git;a=3Dcommitdiff_p=
lain;h=3Dff4d0279c458b724d273efd88ee87ff7caf48991
>
> I think the overall answer therefore is to:
>
> a) Upstream that patch, although I'll want to separate out the new po=
rt
> type definition from the break handling, since I haven't researched t=
he
> break handling part of that patch. Plus there are a couple of things =
I
> need to follow up on internally before upstreaming.
>
> b) Update of_serial.c to point the new Tegra entry at PORT_TEGRA inst=
ead
> of PORT_XSCALE.
>
> c) Update the hard-coded board files to specify port_type =3D PORT_TE=
GRA
> for the UARTs rather than allowing probing.
>
> Does that seem reasonable to everyone?

Sounds right to me.

g.
