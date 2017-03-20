From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: fix disable unused for clocks sharing enable
 bit
Date: Mon, 20 Mar 2017 14:27:46 +0100
Message-ID: <20170320132746.GK22463@ulmo.ba.sec>
References: <1489587055-23722-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W2ydbIOJmkm74tJ2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489587055-23722-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--W2ydbIOJmkm74tJ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 04:10:54PM +0200, Peter De Schrijver wrote:
> In case 2 clocks share an enable bit and one of them is enabled by a driv=
er
> and the other one is not, CCF will think it's enabled because it will only
> look at the hw state. Therefor it will disable the clock and thus also
> disable the other clock which was enabled. Solve this by reading the
> initial state of the enable bit and incrementing the refcount if it's set.
>=20
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph-gate.c | 3 +++
>  1 file changed, 3 insertions(+)

I think you had already sent a version of this patch a couple of weeks
ago. I've applied the first version since I couldn't spot any delta
between them.

Thierry

--W2ydbIOJmkm74tJ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP2NIACgkQ3SOs138+
s6FcLg//SdFeBY0XbrqBGl9TvapcK+Vzx5wScC6O8JvE0wNG/Xdpssg88DTwh4zV
Xr+aMPna7hSmsDlpz/ydULUKblG5dJR8b2TZ+W+cug1qvekiEW/OxG9kK6iaiHXe
bVv1WWm5PBldaJKLFk6ZDDO4WJw2tzbQhYYSjLRJlATtVEGOr08uiDWeIJXkaiiR
iojRuDghj0EPw39OTqtCHXnhV8Eq/GdmzxEjD+xsUvFnVCSYFLdNBMEt1SYOlKWd
T4cLRA34grvwbX62rJRUT3uqIzfRyt4fBTk/LFBQBaCF62UgyMTXmfPNdSh/RinI
mKLxeFxtFb8ZLijyh7zPA+y4sizefhb5lKw9maJ/QeBR5LQvSitLOQ14sWJnUX8R
guH7LvFTq0hnGJGOkKAWMLBlYeKKGFD2yFv6Jo/gVUYBAsfqVJf5Qw0Lo/cV97qd
jVXSccduF3li90EzPKn92ZDPh2W8XK6kIWhLh/6LFHM/chgXo4rD58hPxdkFPCy/
TomwajNT4q2rhJ3ovTmPl8ijMYQg7CS9jqZJIE0TC6yWDy34oCvaWWVx/QrJbfuD
gTQPLtE0S6JEf1xa/3jfZ6265wO/h+Pr3sjw3+orHEFj51GecoFdXevimiY6cvWx
cwt4u2htxKCAESxm+JiEsgXmSzG3cqwGmxq1MyZC7xizUdrlu2I=
=UuH8
-----END PGP SIGNATURE-----

--W2ydbIOJmkm74tJ2--
