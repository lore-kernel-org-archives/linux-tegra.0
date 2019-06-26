From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 10/18] clk: tegra: add save and restore context
 support for peripheral clocks
Date: Wed, 26 Jun 2019 12:12:13 +0200
Message-ID: <20190626101213.GC6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-11-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561345379-2429-11-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:51PM -0700, Sowjanya Komatineni wrote:
> This patch implements save and restore context for peripheral fixed
> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
> peripheral clock ops.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry clock and reset state of peripherals is saved
> and on resume they are restored to have clocks back to same rate and
> state as before suspend.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph-fixed.c | 31 ++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph-gate.c  | 34 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph.c       | 43 ++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-sdmmc-mux.c    | 30 +++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h              |  8 +++++++
>  5 files changed, 146 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRP0ACgkQ3SOs138+
s6HUlxAAg/MnASD5SEdQ3qYEq3xg2eWTdZZD+3JhKSO+AJM87Pcw4Q+k+vAaG5fC
iZ1QPSnJwL6M8iyjlOwM+J9ZJR+0ZtrHlBZ2Ru+wvKbUCN3fBXg0n7iFEwtWfRwe
6nut9ykShtaLtoq7bg3XFJr4OmZONSj+tsXBDJnCYwHSHSerV/+ElJhB9U94I34s
52DayIuq6xO2DOqo3HCP6nOFRsev73+vFJSZHFxANWiDcMW4XzZ62wZJ6DQLUmuC
vsdEE0SbCuUhPoAsC4G1sqB39EIg8eIgBKPgOlLuCc5TazZdglt3eGfjmsw+/AR9
6ezH/g9lKZ3h9JtZkkM1gckkj8TLpToP00VFV1m6KD3xLGsslhwPLAQT171Sphia
pyLO8rxqaYyX9boAHOGsq03kFmlr6/uVHn3bxa/vhcsX5/iOzVGZUHwqC50ATm5R
yHPx38hJIAQuFcv+OfSigkAOkXHhPAOSICisE/Mp8v5Ecb4bNF4H+GDpcgkSvrFp
luAmTT/PLaixvu6B+r+BKbRpp8llcaAzMNS2I6YsnLGHupt6LuIzprwTxDQ1xcDm
eZZH5kjMP8wBrynMHGdhnAYUIXgADVz07RLZ9E3Tr1Ur4yHBIJRHD5sUU/u5ILJI
CLOaAS+4RVlCizUE7ILijzsWb19EmLpwcbB1GLCgK7FW3nae51s=
=Fq1s
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
