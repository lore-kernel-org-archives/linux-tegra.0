From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Tegra pinmux Device Tree support
Date: Wed, 10 Aug 2011 11:23:49 +1000
Message-ID: <20110810012349.GA23511@yookeroo.fritz.box>
References: <74CDBE0F657A3D45AFBB94109FB122FF049F17229E@HQMAIL01.nvidia.com>
 <20110809173428.GB32195@ponder.secretlab.ca>
 <CAOesGMjH8hZSAXvDZ6ADO-dtFNecRYC5GsfRiAeV8KMRG=JTkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMjH8hZSAXvDZ6ADO-dtFNecRYC5GsfRiAeV8KMRG=JTkQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 09, 2011 at 10:44:29AM -0700, Olof Johansson wrote:
> On Tue, Aug 9, 2011 at 10:34 AM, Grant Likely <grant.likely@secretlab=
=2Eca> wrote:
>=20
> > We talked about this a bit at Linaro connect. =A0Outside of the mor=
e
> > complex runtime-reconfiguration of pin mux, there is a general need
> > for arbitrary initialization sequences to registers. =A0Also, prett=
y
> > much exactly what you need for tegra is needed for imx, omap and ma=
ny
> > others. =A0The though was, rather than trying to come up with some =
kind
> > of pinmux-specific binding for pin states, which could end up being
> > very verbose if everything was split out into properties, we could
> > instead have a binding for register initialization sequences.
> > Something like this:
> >
> > =A0 =A0 =A0 =A0pinmux-initseq =3D <reg1 value1> <reg1 value2> ...;
> >
> > And then add some macros for DTC to make it easier to define things
> > like pinmux setup tables. =A0Although the binding above is probably=
 too
> > simple and naive.
>=20
> This seems to break the philosophy of what the device tree should do
> -- it should describe the hardware so that the driver will know how t=
o
> program it, not include the code itself?

Arguably, yes, although it's a barrier that's been frequently broken
by Apple already.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _oth=
er_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
