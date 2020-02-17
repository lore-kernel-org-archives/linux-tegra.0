From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 17/22] ASoC: nau8825: change Tegra clk_out_2 provider
 to tegra_pmc
Date: Mon, 17 Feb 2020 10:52:32 +0100
Message-ID: <20200217095232.GA1345979@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-18-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-18-git-send-email-skomatineni@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:22PM -0800, Sowjanya Komatineni wrote:
> Tegra clk_out_1, clk_out_2, and clk_out_3 are part of PMC block and
> these clocks are moved from clock drvier to pmc driver with pmc as
> a provider for these clocks.
>=20
> Update bindings document to use pmc as clock provider for clk_out_2 and
> change id to pmc clock id.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  Documentation/devicetree/bindings/sound/nau8825.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KYmAACgkQ3SOs138+
s6GxrRAAihq+8+H0SLe9ilINgoYMiaAY6gPvuTZW61dZ2Ha2NyXs55DMCkhF25IB
d3ODCkhYdw413lhlAooJ2twqgm2zasMQ9TN781WpWghavlO+ljjNrOVUdn55nkeG
43Qd15MWCfP5F0rgNh9OC0AGjbVjLLGy+QsRV/80fx5yl10lI9PlGwUfzVsiywdk
YWYrlXvQHbiwX/SxK7SORJDHVGix3Y+L6Gxxer3UGvx05Za6Alav9LP19AlMjlh9
ZRL/DS8yysIqFgPlNCbryn3LHluNSruFhVTXboxvFiJRU6WB/1kXpnoVUWLhBOqt
jQgf13JBi+c8uiHkxdK2N4/VQW2crJGziSbsmbSkrOnRnZ78lcWTEV9lVBy0JcJw
AWZJBadrUSz+3DKefFXBsapZic3gJ48sLgt4OkwZTN57j3+BGsVP3Fn91NfJfokU
+28gibibpYcxzmXj/iM5HC7yc7Qh/lleSYrwtOkrBKeIflVL6e087WfxHm3IMgTu
RmTrtann6aWswPbUqkwT6o9Mr+IJu77onGUkkPNzIq3jijWYNpw4QZz3BYEwSKdU
xaoBR6SAFiudJ1DcKLf50S9lskHO7PL6rgflaf9JvA5TkhQB+F8TiAytUj9uRbtO
tjE9lYDWqw8NMar+d6qvpNw4Bhz1Ck/lsXxUxe4shxaAoorg16E=
=rWpZ
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
