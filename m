From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dt: tegra: paz00: add regulators
Date: Sun, 24 Jun 2012 13:31:51 +0100
Message-ID: <20120624123151.GZ4037@opensource.wolfsonmicro.com>
References: <1340406842-27135-1-git-send-email-swarren@wwwdotorg.org>
 <1963397.cqAXgGafFs@ax5200p>
 <20120624110306.GA16455@sirena.org.uk>
 <4127323.noaajNecru@ax5200p>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1XmnKQGVLLNJnMip"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4127323.noaajNecru@ax5200p>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--1XmnKQGVLLNJnMip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 24, 2012 at 02:01:58PM +0200, Marc Dietrich wrote:
> On Sunday 24 June 2012 12:03:06 Mark Brown wrote:

> > > > +                                 	regulator-name =3D "+3.3vs_ldo0";
> > > > +					regulator-max-microvolt =3D <3300000>;

> > This is one example, it looks like the rail needs to be fixed to 3.3V.

> I think nowhere in the code a regulator (beside sm*) is programmed to som=
e=20
> different value that the maximum given here (this is not the maximum the=
=20
> regulator can provide). I never understood why the kernel code always set=
s the=20
> regulator to the maximum value if no other value was specified. IMHO, the=
re=20
> should be some initial value, e.g. regulator-default-microvolt, as the=20
> original driver (from 2.6.32 ages) did. This way the maximum value can be=
 set=20

That's *never* been in mainline, and nobody even bothered trying to
submit it.

> to the hw limits, but maybe this is a bit dangerous.

One of two things should be happening.  Either a single voltage is
specified (in which case that voltage will be configured in the
hardware and consumer drivers can't change anything) or a voltage range
is specified (in which case the consumers are expected to manage the
voltage and the most the API should do is bring the voltage within the
limits given, though I don't think that's actually implemented yet).
Specifying an initial value within the range should at best be redundant
as the drivers that are actively managing their voltages will be
overriding it anyway.

We certainly shouldn't be specifying the limits of the regulator itself
as normally the board design will be much more constrained than the
regulator itself and like I said it's stupid to have to cut'n'paste the
numbers out of the driver into the machine constraints.  We should
instead be specifying the constraints the system is designed to operate
in.  Chances are that if nothing is able to actively manage the voltage
it's not in fact safe to change the voltage at all and therefore the
constraints should specify only one voltage.

In the above case the fact that the supply is named "+3.3vs_ldo0" seems
like a fairly clear sign that the board has been designed for this to
operate at 3.3V which makes the fact that the constraints go down to
1.25V seem at best odd.

--1XmnKQGVLLNJnMip
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP5wiwAAoJEBus8iNuMP3dO1wP/3+NuI646K7U5frBL+gEm1r3
ScZa4HYcUarHqV53iVlrkbavNkTgDXdObnNN894RtUTUlaaaXrsAUa0tX3arkuiA
vx++WULu/AujW+M+69+Cz63Uu+pgPmawY9a1KoIg0eFdvpy2C3lgEVkxR1lOWPXu
hveTMJvuI6aWnj90g8L7WmtNjpGmfhEnP1ZN48I7Q4Wl0xhZ1JOfDmjH9vdBz50n
NCSc5g8vWnr67ipq9/2544YLO9Dlf8vtBB5SNH5JHToikpffGNqZMy8+VDSEhq6S
SyjIabLV8MXokZbEMjDnhzTc/lPgmsSB+QKfezdbOitR0Q24b6LMwExlA79uTw0m
jTJeXkszHTTnlnjVB1T1/1lPYMEkIkFH8g+E3n/0QTrX6dPPwhMOdrXQnhmD6kO0
MMFgwKoA9pqjaIDSLe+H1eA6+9CuQqeAv+/ev81ovWGi040d48UYVHPIWvMPB21w
fwKDmWRdSnlwfE3eJNeFqFoeB+sNxz8/gJNWs9J7RoJxSrurrFFECjFRWWqFgXq9
zlRoOuvlZFsrBr/xWciOvlW6HiffDwWr7Wnhlua5Kjf81RcUDn/GgkNKNRst0zhY
kAyRFDQGPNA6PQYO/UZY7zay/RCXvtmQgKQ3AxNtrfPHIRsZ4R7qpEvJOrzIY6gw
1Bxti6wCJpPT8mfJD5IV
=/nj2
-----END PGP SIGNATURE-----

--1XmnKQGVLLNJnMip--
