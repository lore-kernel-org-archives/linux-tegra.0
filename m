From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Add Avionic Design Medcom-Wide support
Date: Mon, 30 Jul 2012 10:05:50 +0200
Message-ID: <20120730080550.GE15245@avionic-0098.mockup.avionic-design.de>
References: <1343228775-1330-1-git-send-email-thierry.reding@avionic-design.de>
 <1343228775-1330-2-git-send-email-thierry.reding@avionic-design.de>
 <5012F95E.9050200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5012F95E.9050200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2012 at 02:26:06PM -0600, Stephen Warren wrote:
> On 07/25/2012 09:06 AM, Thierry Reding wrote:
> > The Medcom is a 16:9 15" terminal that is used for patient infotainment
> > in hospitals.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-medcom.dts b/arch/arm/boot/dts/t=
egra20-medcom.dts
>=20
> > +	model =3D "Avionic Design Medcom-Wide board";
> > +	compatible =3D "ad,medcom-wide", "nvidia,tegra20";
>=20
> The filename implies just "medcom" but the compatible value says
> "medcom-wide". I assume the two should match. Are there multiple medcom
> versions, with SW-visible differences?

Actually there's about 5 different Medcom versions. Medcom-Wide is the
newest incarnation and is the one using the Tamonten/Tegra20. Older ones
were PXA and VR41xx-based and there are also Atom-based variants. For
the Tegra20-based devices, Medcom-Wide is the actual marketing name. I
know the U-Boot support also currently uses just "medcom". For the
kernel it's probably okay to keep it to just "medcom" because I doubt
there will ever be a second variant using the Tegra20. There is probably
going to be a Tegra30-based variant, but the DTS files will already have
a different prefix anyway. I have no idea what the marketing or model
name will be, so maybe using "medcom-wide" as the compatible value will
be best.

I should probably sit down with marketing and talk about this.

> > +	sdhci@c8000600 {
> > +		cd-gpios =3D <&gpio 58 0>; /* gpio PH2 */
> > +		wp-gpios =3D <&gpio 59 0>; /* gpio PH3 */
> > +		status =3D "okay";
> > +	};
>=20
> You want a bus-width property in that node. Same for Plutux.

Okay, will do.

> > +	backlight {
> > +		compatible =3D "pwm-backlight";
> > +		pwms =3D <&pwm 0 5000000>;
>=20
> The tegra20.dtsi doesn't assign label "pwm" to the PWM controller yet...

Yes, that's in a separate patch that I forgot to add to the series.

> The Plutux comments all apply here as well.

Alright. I'll update the patches. I suppose most applies to the TEC as
well. Perhaps it even makes sense to separate commonalities out into a
tegra20-tamonten.dtsi?

Thierry

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQFkBeAAoJEN0jrNd/PrOhzucP/1A+dgJlR9Rm58jfDupjIlWC
MSDo9gj7mG05MBqRBa8h8YYZ4ax6jAWA7SiXy93Rk6MnmRnryclMUpyJRqnY2IUT
MYcVhYmN6XOPE5M1e1UECdqEvNDwKBH4qvyx4hJqE370Y5XwfLmMq1dpymB9k1iV
VaqeVUAXEL2MTqoFtUdj0lYEF7OHQxBm78ZBjZ9hmmMOrLE3YgscWDf7UlYtRqq7
b0jbGL5KVNO88tfti2wO0K5QZ6QeI35+YB+lSPwMnyl4eNV+3OpFlrZagCiWN90b
ghYeF3ghJoF7IzkWe5tcpNnsnF+hW+KAUPS0XD7JM0rZZz6Qa/c7rUiAZW0ev78N
EJQ8E4etRblaGSUmePccBcDNrpJr6eR7rrU1heThJOVfuNruyHxq3YkfQUrBhfus
tEAsJm30MntuRBVEtmn0FKquRX1Cz79yWnEyhqaibJcYvr2C9yNKEqBotRv+6RdO
gjZQAvqFDWK2/Lstnhth+dc28woEmCg+XIpRN6UpfkxA/pOCWQVj777OJAKe5aeZ
6mwi6Mu1T/lh8iq9R2Gi/OQXf5s/dKcAA9wxavskwhcm5lIle69V3wcp7ZHjvKjt
SXJPHi4KKkjvAp05ZR6pl0iAUNo3rPJ8OctZg9g7ygBLdKn2zqf0hMMVDMQa+i2p
Lx1RqcYIwwOw0CHgR3wz
=EUeA
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
