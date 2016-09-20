From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH 2/4] ARM: tegra: nyan: Use external control for bq24735
 charger
Date: Tue, 20 Sep 2016 20:02:47 +0200
Message-ID: <1474394567.1215.14.camel@paulk.fr>
References: <20160828173246.32621-1-contact@paulk.fr>
         <20160828173246.32621-2-contact@paulk.fr>
         <00697eef-0b36-1ff5-9c7a-43c1b53b52bc@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-6cH71l0qMPGEyletmZBe"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00697eef-0b36-1ff5-9c7a-43c1b53b52bc@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--=-6cH71l0qMPGEyletmZBe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 septembre 2016 =C3=A0 18:40 +0100, Jon Hunter a =C3=A9crit :
> On 28/08/16 18:32, Paul Kocialkowski wrote:
> >=C2=A0
> > Nyan boards come with an embedded controller that controls when to
> > enable and disable the charge. Thus, it should not be left up to the
> > kernel to handle that.
> >=C2=A0
> > Using the ti,external-control property allows specifying this use-case.
>=C2=A0
> So the bq24735 is populated under the EC's 'i2c-tunnel' property which
> is there to specifically interface it's child devices to the host. So I
> am a bit confused why this is expose to the host if it should not be used=
?

Well, it needs to access the information in the read-only registers provide=
d by
the chip, which is allowed by the setup in place that you described.

However, the EC has its internal state machine that decides when to start
charging, etc and so should be the only one to write registers, to avoid
conflicts.

> Again you may right and I did find the original series [0] for this
> which specifically references the Acer Chromebook that needs this.
> However, I am not sure why this was never populated? Is there any other
> history here?

I am also confused about why it wasn't applied earlier. However, the cros k=
ernel
is using the very same scheme.

> What is the actual problem you see without making this change?

There is a risk of conflict (even though it's probably not that significant=
),
given the low variety of possible cases here. The idea is simply to say tha=
t the
EC is in charge and to let it do its job without interfering.

> The original series states ...
>=C2=A0
> "On Acer Chromebook 13 (CB5-311) this module fails to load if the
> charger is not inserted, and will error when it is removed."

I'm confused about that comment. At this point (and with this patch), it wo=
rks
normally.

> Cheers
> Jon
>=C2=A0
> [0] http://marc.info/?l=3Dlinux-pm&m=3D145447948705686&w=3D2

Cheers,

--=C2=A0
Paul Kocialkowski, developer of low-level free software for embedded device=
s

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
--=-6cH71l0qMPGEyletmZBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJX4XnHAAoJEIT9weqP7pUMr2MP/2g674+sQU25p5MVGeU+5Sa1
eMDSHmqUDhTajZjJYt3MrGQB9wm9Ib8eRNQ9IbjtGw2/pVYEpeRMonONMOypql3U
GOkopl46Ea2wKrmwakqxIGQ12gf5qra0+04xgt0qY27bRiTM2xg1/87Thsp5FA9B
uAgqdhEWzG6WCodbreYPINeTMN8LjduUPLg24PIJO7w6HCcsaUK2ejb5cBrNVTIa
F0ObJJV8YxjLh6WeinNN5KgtGBGzILgvA3VJa6aYvfsW8ISd0Vw3MmQFv9EisorS
if9v1Rd7Tv7+5xSK3u/51HU8yz8G0fXRlun8ULUdea1ucYonvhezEdmTlJxTx+2u
fmZA+vtkiOc2sDi8uocVJ/230R+clx+B3E+CVKGOT6/9Sv/DWmp45pcMqBeveNLd
an3DzTVKdNspv+XZlSVWeKeIyd19fVq+/u7jZ42mKBuxdfS9xAHZZJjFr7Mi28gf
E13Dv5acylrs7kC11YQjLK7sRNWBQrGDCpbRXu5qUtWMCCK6Obf1sy+iWuS4LqI/
+NA3uK523LUUJMSu5SmEvf+hwllNNa4hbX0mPYhVVi9jzTpzAWGh4+CbIkWnRoLZ
AUmHB+FPwYKQKWPluS446/IBAa7Q1eEXFM2BeKyi51tzS1pUa2/szhE6TdSzRYFM
ratAgq6tP1jJoSU9sAfw
=V+Xx
-----END PGP SIGNATURE-----

--=-6cH71l0qMPGEyletmZBe--
