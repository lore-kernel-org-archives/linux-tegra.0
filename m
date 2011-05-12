From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: Tegra: dt: Split out separate Tegra SoC DT
Date: Thu, 12 May 2011 09:40:54 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04986AA33D@HQMAIL01.nvidia.com>
References: <1304136751-11629-1-git-send-email-swarren@nvidia.com>
 <20110501145546.GC19918@quad.lixom.net>
 <74CDBE0F657A3D45AFBB94109FB122FF0497F1B198@HQMAIL01.nvidia.com>
 <BANLkTikC9bAWiGsLP48djMB-jTR767JeNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTikC9bAWiGsLP48djMB-jTR767JeNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant Likely wrote at Monday, May 02, 2011 2:16 PM:
> On Mon, May 2, 2011 at 12:00 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Olof Johansson wrote at Sunday, May 01, 2011 8:56 AM:
> >> On Fri, Apr 29, 2011 at 10:12:30PM -0600, Stephen Warren wrote:
> >> A mostly unrelated question below.
> >>
> >> [...]
> >>
> >> > + =A0 serial@70006000 {
> >> > + =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra250-uart";
> >>
> >> I know this is how Grant specified it, but shouldn't these also ha=
ve
> >> a compat for ns16550?
> >
> > At present, I'm not sure it is technically compatible. If you look =
at
> > drivers/tty/serial/of_serial.c, you'll see:
> >
> > static struct of_device_id __devinitdata of_platform_serial_table[]=
 =3D {
> > ...
> > =A0 =A0 =A0 =A0{ .compatible =3D "ns16550", =A0.data =3D (void *)PO=
RT_16550, },
> > ...
> > =A0 =A0 =A0 =A0{ .compatible =3D "nvidia,tegra250-uart", =A0.data =3D=
 (void *)PORT_XSCALE, },
> >
> > That PORT_XSCALE is different to the ns16550 entry. Arguably, that
> > field should be something that comes from the device tree, just
> > like e.g. reg-shift, but it certainly doesn't right now.
> >
> > Grant, what are your thoughts on this?
>=20
> Heh, when I added that line I just mirrored the 'type' of 16550 as
> detected by the 8250.c driver when it probes and made a mental note
> that it should be revisited.  I don't know the hardware very well, so
> I cannot easily say what the right thing to do is, but making it
> ns16550 compatible does seem to make sense.

I looked into this a bit more and found the following:

In all the existing board files for Tegra, none of the
plat_serial8250_port initializations specify any type value, and equall=
y
the flags do not include UPF_FIXED_TYPE. This causes the UART driver to
probe (run tests on) the hardware to determine exactly what type of UAR=
T
is present.

However, of_serial.c does set UPF_FIXED_TYPE, and hence port->type must
have a valid value. I suspect it'd be a bad idea to change this since
it'd affect a ton of extant PPC platforms.

Equally, PORT_XSCALE does imply different HW behavior to any of the
other types, so tegra250.dtsi shouldn't just specify that it's compatib=
le
with "ns16550".

However, I believe we should make the following change: Instead of addi=
ng
a specific Tegra "nvidia,tegra250-uart" to of_serial.c's device table, =
we
should instead add a generic "xscale" entry along the same lines as all
the existing generic entries. This is so if we end up with 10 different
vendors with "XSCALE" serial ports, we don't have to add an entry into
of_serial.c for each one.

Does that seem reasonable?

I'll send a patch series to implement that change in just a second.

--=20
nvpublic
