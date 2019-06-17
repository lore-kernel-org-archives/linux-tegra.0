From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3] i2c: busses: tegra: Add suspend-resume support
Date: Mon, 17 Jun 2019 09:02:59 +0200
Message-ID: <20190617070259.GA30126@ulmo>
References: <1559885867-10190-1-git-send-email-bbiswas@nvidia.com>
 <20190614211129.GG17899@ninjato>
 <758d6dc2-f044-6be3-6896-196ef477d393@nvidia.com>
 <20190615045405.GA1023@kunai>
 <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <69a9a7e3-f885-b6ab-60bb-a1165ce2db23@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Bitan Biswas <bbiswas@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2019 at 04:56:06PM +0300, Dmitry Osipenko wrote:
> 15.06.2019 7:54, Wolfram Sang =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >=20
> >>> Without a maintainer ack, this is an exception this time. Should we a=
dd
> >>> Dmitry as another maintainer or reviewer at least?
> >>>
> >> I shall followup with Maintainer for ACK in future I2C tegra patches.
> >=20
> > This comment was not directed at you, sorry if that was not clear. It
> > was more for Laxman, Thierry, Jonathan, and Dmitry (if he is
> > interested).
> >=20
>=20
> I don't mind at all to review and test patches for the driver and can pro=
pose myself
> as a reviewer if that helps and if there are no objections from the Tegra=
 maintainers.
> My primary interest is to have my devices working after next kernel updat=
e, but I also
> like to review patches in general if they are touching area that I'm fami=
liar with.

No objection from me.

Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0HOyAACgkQ3SOs138+
s6FunA/9FnsBC0lgpKTkMD4x/XSYqwhavvrILocW3n6+bcJ2oQonGzaHr3+QJzHQ
9Eipq1rP5XmUzm/OvCyUXWV+jXBuVmgUOt/duHJSC7rRs6YYQuhGYpF5+HWPAoQG
dKiUX4/x/ziFiSorakCNQtTK/nufWC2Oe4k8qc5Gh2G8GRFwqij2DVRmCvElP4qm
Cnf8J6K6gfwuTNX6KAcK0sfbDycBsu6VKa/9A72O8rf47JPCVYPR/8PpvftKzWZ+
CcHHggTE2KfexaydT9VsC2PGniYwkcKp7CyS7YWQ/IPUuaVztydbJCdpmHgsd7yC
kNWYdGUl9TeD0SyzK8vPRMmBiWZ9EqNE621iqg7gS2A3V4oru+NFWvlFsVDzLVs+
SLFberGcdx6lgXDFLK5IMrTlpszfSG8Bwsc78ub2d9D+UU7tmsMXyxMqCbi+bCbu
HbyqnLCivgz8t4lujcBggGWGzn4w+Rx0OafqSm/NhjmQfiBsQ5yc1n/zuEEMT/cO
AkPxOLERNhHUanYwhz4bmErkmbdiKGZAz38I1nYnFzvNxRq77rfjMNgZg7e50wr6
pK5LmpXZ14X4y4Fv1kD5y/CJh97dfrUqIAWiC8Az9N9zJ1mdEwjp7f41U44MA1+e
mZd2Qf3kF1icB8X4lsgW47ObG7YAMK0oXxBdcV5d9RLYtwSoWks=
=+FPI
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
