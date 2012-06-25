From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Mon, 25 Jun 2012 13:07:45 +0200
Message-ID: <20120625110745.GB11710@avionic-0098.mockup.avionic-design.de>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <4127323.noaajNecru@ax5200p>
 <20120624123151.GZ4037@opensource.wolfsonmicro.com>
 <27366523.LjLfRK1TqH@ax5200p>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <27366523.LjLfRK1TqH@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 24, 2012 at 03:27:42PM +0200, Marc Dietrich wrote:
> On Sunday 24 June 2012 13:31:51 Mark Brown wrote:
> > On Sun, Jun 24, 2012 at 02:01:58PM +0200, Marc Dietrich wrote:
> > > On Sunday 24 June 2012 12:03:06 Mark Brown wrote:
> > > > > > +                                 	regulator-name =3D "+3.3vs_l=
do0";
> > > > > > +					regulator-max-microvolt =3D <3300000>;
> > > >=20
> > > > This is one example, it looks like the rail needs to be fixed to 3.=
3V.
> > >=20
> > > I think nowhere in the code a regulator (beside sm*) is programmed to=
 some
> > > different value that the maximum given here (this is not the maximum =
the
> > > regulator can provide). I never understood why the kernel code always=
 sets
> > > the regulator to the maximum value if no other value was specified. I=
MHO,
> > > there should be some initial value, e.g. regulator-default-microvolt,=
 as
> > > the original driver (from 2.6.32 ages) did. This way the maximum value
> > > can be set
> > That's *never* been in mainline, and nobody even bothered trying to
> > submit it.
>=20
> which was the best thing to do ;-)
>=20
> > > to the hw limits, but maybe this is a bit dangerous.
> >=20
> > One of two things should be happening.  Either a single voltage is
> > specified (in which case that voltage will be configured in the
>=20
> I'm not an expert on this, but it seems to me that only sm0 and sm1 shoul=
d be=20
> changeable (and some rail called vdd_aon, which seems to be ldo2 in case =
of=20
> paz00 connected to the rtc). So, all others can be constant voltage. Mayb=
e=20
> Stephen can comment on the actual requirements (also for the other boards=
=20
> which may have similar layout).

I can confirm that at least for ldo0 the value needs to be fixed. I did
in fact post a patch back in February that was needed to fix PCIe on
Harmony. I also sat down with one of our hardware engineers and worked
through the list and wrote down the requirements for Harmony. I need to
check where our notes have gone, though.

Thierry

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6EaBAAoJEN0jrNd/PrOhwskP/jNj8wYMCbaHhemTRFHihUGe
NBPk/SvpvJ5ldA25+cn+3Nvr6v94/v0ZGdyJfQtdnwDa1QNa4vllyzdw/zgygb/K
5jivLMTJV7ReVBBeUpZdPAcxxghXfhxn3K/+/69yV9ToeCZDcs/SEe6kElrfKD/q
QV+/7PsC26uII0tczZzUwto0lxRX9cEzYmnp8wjcyR6CCAx7BZg956sJAHHPgWmc
rHFOqcS9pxCibk1/nYzE0nHtSAcahc18bSgZh6ry9ihZux6lcOXfhNnFEhJGns0n
TJ5NwxFNBIx+eXMJY/sb4FjEe5rQC/jQqhXZ17sIBNLU2ajwy09loaJIF2mfO9Zl
NzXx3IhSizDGnGDfZ+VGo45Anz95ySpCBdeAAOF8+qW5Ji1p0tg6wDvnVnbeSLGz
P3qt+eXotu9cCDkmbj/RXwYvpFD7QKjO0727IV3dyQftuA5pEw8pSHKI0mRSqy0m
hDxc7OCNuG1O8FyfBpYJUYdrKzSMAIdNkwJqdkM/yzWBcsHtddnXLqqaAj/Rh86i
QrmVekKgPIQTRQ5d3C5u6eGXxJe3O42OjZcwWW56Sit2JfH4BL84taTHiBU7yL/L
qrwRyrBkJpqP5qlDrvvCGQK4bRr7rc2AGpvz6zeD/+EXJnczjm84iPfLRvU1C4Jf
G4DJXAXS6qIFD3jhdLfh
=ifEO
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
