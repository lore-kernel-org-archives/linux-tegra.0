From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] net: stmmac: Fix possible deadlock when disabling
 EEE support
Date: Wed, 26 Jun 2019 12:45:25 +0200
Message-ID: <20190626104525.GH6362@ulmo>
References: <20190626102322.18821-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="it/zdz3K1bH9Y8/E"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626102322.18821-1-jonathanh@nvidia.com>
Sender: netdev-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--it/zdz3K1bH9Y8/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 11:23:21AM +0100, Jon Hunter wrote:
> When stmmac_eee_init() is called to disable EEE support, then the timer
> for EEE support is stopped and we return from the function. Prior to
> stopping the timer, a mutex was acquired but in this case it is never
> released and so could cause a deadlock. Fix this by releasing the mutex
> prior to returning from stmmax_eee_init() when stopping the EEE timer.
>=20
> Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib l=
ogic")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  1 file changed, 1 insertion(+)

Tested-by: Thierry Reding <treding@nvidia.com>

--it/zdz3K1bH9Y8/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TTMUACgkQ3SOs138+
s6GggQ//S7aRh+7qKUq7BOqNvXA0odDDLtnvYxmihsOI3CtmAEMzA55QyQT18bCn
rXIv7tzANYDZDpnXJHT7lksGRDGXWzmXB1ehc0isKGNIirBYmPt58jUdN9gI7dlA
kf0ivngQUba49jZ45S4zbg+S2bTVe4Xljqx/Z3IUiyHW7vcs5cNTbOozmD1MgY6D
BrBV+TsgIBgfYOcdP8gFlvYDa9GjQKfTQMNkm+3niSyxZBLbCGm2hyObe2acxOmU
O/mJ1h+2vailfzxqViZxB3+kqf0EIWt2efwaDr75Bmyc9NXvWVYzKr8c2teyOODa
9de95vb61PPZrufuoEjpMgEV5aAtDVQVC/zVwcMJF8o4Qc+v5sBR4erhMjsIVctB
QmgxEVcUdfo6MxOw+sa9qJsCvRsLuAdxflpvro7UBLaOthWSh3SaIf0IgSx+mqpK
1x3jlY/vQZ3vMw/6BoLb+3sgnZNMjh1sSYFKZCNVdDqd6l+q/E/Jw7p/hx8txRN+
uiAGlbe6V8Rib9rtvHsE/oIcWR8eMa7s7hRgudRMKHJUVA9Q6B8BX9OA79hR6QXK
Uw1pLJaSoHlyOxY5uJMGgMRMSsn3LkY+Cgc2COu5ILcNtjtO7HrRpXm/TkFARTow
klV31kVW6VEkXJVSasGzev4TAKU99GEDPqEyDJYWiyeCbhfJgsM=
=VDy+
-----END PGP SIGNATURE-----

--it/zdz3K1bH9Y8/E--
