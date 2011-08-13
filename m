From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: Tegra pinmux Device Tree support
Date: Sat, 13 Aug 2011 20:22:12 +0800
Message-ID: <20110813122211.GB7244@S2100-06.ap.freescale.net>
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
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Linus Walleij (linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org)" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
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
>=20
> I know it's a hairy problem to deal with one compact pinmux
> representation that fits all needs. Maybe making it overly generic is
> the wrong way to go about it, and let each implementation define what
> it needs? That way the simpler implementations can do something
> reasonably simple without having to deal with the overly complex
> options of the (over?) generalized platforms out there.
>=20
Though I was part of the talk on Linaro Connect about register-write
binding, I still like the soc specific binding a little bit more.
Let's see if we can eventually change Grant's mind with more people
on the other way :)

--=20
Regards,
Shawn
