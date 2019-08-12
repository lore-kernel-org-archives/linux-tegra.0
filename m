From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 03/21] clk: tegra: divider: Save and restore divider
 rate
Date: Mon, 12 Aug 2019 11:21:33 +0200
Message-ID: <20190812092133.GE8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-4-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xJK8B5Wah2CMJs8h"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-4-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--xJK8B5Wah2CMJs8h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:42PM -0700, Sowjanya Komatineni wrote:
> This patch implements context restore for clock divider.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So on resume, clock dividers are restored back for normal operation.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--xJK8B5Wah2CMJs8h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RL50ACgkQ3SOs138+
s6GciRAAu7ihjAvzjleKr5l/wYMUx50GqCmlDbJPPj3jcAiRgKqgWMrvVdOgdbZp
QdV017XzIRxpMkj8v62RKCOm/PlnAbbZ+a7RGu0qvGpMK5a4RnfrYHvyK+e+DaN4
YSOYsPYSviDEb8kGhWGe5m6cVDaR8b6EZFhqMfNi3eFXp15+c1JZylmbHRlL0cU3
EGlVEXewNcAseec8V4d8EXNEi2DZOKfq4l1hKiTr1HfHqw3RwJeXMF0mbv5DLKey
H0LYXW+dDWn4SLGLOl4KxXh6TUi7pqhkT7Iu9Q8DSVa+LyuYS2wOcHewvDmnD6gD
ELNQ1trgtsbz6SPpVNXVbvXDuYkI+Uzxla2Cs6I7zS2xK4tbQFUeHtSKrBc8cfK9
UP3BQmVfpVR9OQmHUL+GrEiGB05CaYtIoZLOpFvv31XYjYaCy+MtvjnM0HjZGj+K
sZIQ0hSIDGcWDlg+2K7PU3wL7PXOA4C95cVjPjqghkEhnoBP8jZ6qYSHCoZ+UKEC
PhaQue7ePjTN3iSgqp0CGzUDN3+JRxS4MsYVbudTiwxAd+LYD0830r9IwDH2kIPE
o4uWmo67u4pqaoMu3MP4Ll9hJiXur61rLMQXt6MQacvD3eG/bG6W5hP5l00bPEgA
K8TMgeZWF8HtT2QNf7fyJKCzLIC6vV3/w6jtc0VP6EWvDYg3aDU=
=9Mj2
-----END PGP SIGNATURE-----

--xJK8B5Wah2CMJs8h--
