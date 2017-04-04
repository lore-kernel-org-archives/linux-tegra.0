From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Don't reset PLL-CX if it is already enabled
Date: Tue, 4 Apr 2017 16:06:38 +0200
Message-ID: <20170404140638.GL843@ulmo.ba.sec>
References: <1490612465-12454-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HBg0C3yr6HVa1ZCc"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1490612465-12454-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HBg0C3yr6HVa1ZCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 12:01:05PM +0100, Jon Hunter wrote:
> Commit 8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessari=
ly")
> changed the tegra210_pllcx_set_defaults() function causing the PLL to
> always be reset regardless of whether it is in-use. This function was
> changed so that resetting of the PLL will only be skipped if the PLL
> is enabled AND 'pllcx->params->defaults_set' is not true. However, the
> 'pllcx->params->defaults_set' is always true and hence, the PLL is now
> always reset. This causes the boot to fail on the Tegra210 Smaug where
> the PLL is already enabled and in-use. Fix this by only resetting the
> PLL if not in-use and only printing the warning that the defaults are
> not set after we have checked the default settings.
>=20
> Fixes: 8dce89a1c2cf ("clk: tegra: Don't warn for PLL defaults unnecessari=
ly")
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to for-4.12/clk, thanks.

Thierry

--HBg0C3yr6HVa1ZCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjqG4ACgkQ3SOs138+
s6H8eg//bUuAwFMISHkp3pvFph2AKEagsskfvUVut2SgPbVb+jk8zmHpvLNR+Ti5
h0mEwwsqeCHX8vLNQNS5u27+xdG3nsSe/zg3WiDOwoVuY0QYWIXaUGHgtYnO5qLM
6VCBEeY8sM366NyAjvgXk/57xBF5L0kaEdVbCWmcNQxtmO4qgspbjapluR+2rRZw
hquDD4wiX4LLtmlS4OxU/Y4crTmWtjVZZlCsA0xjxzkWr76nW2QMnQ5YG1jnOCLu
Pq+DFwabnGxMhJGR5gGnapc7Mn5OtPv+7jgIyEcvRJKtCPybFulQI+zPkI8+YHuo
GrnzvzW8WnpuZCBVN8EbiL5+DG/Eb7DJqmIy4G+lLCMcO72TWBX36gfzgl/FLZMo
3NjpHcrx3iv1EAF0xu8tShHrNAi4VBkjuNK5olx1ragzJPlAH58uPnzAuMH7Foew
JTsTsomScOZMpATRjowfhIkz953+kk8bSw4duvqM3Gz8+jm4D6yySqZmzaktgyJd
76gAW6ChKEpbcApXYZ5dtBKn2nYNVOiWmTgHgm89WWOt+N1jfpk3ZqjzqzVhlQdo
tzvLNDJgmA+05mcWi7KaXY8hBA/yF5UeLsrkGXea+M37lc9qOqkH6Q1yED6mBABG
8Gnr4J5rdxe+fg3W8eVyiKF6fjIYyWAeWCCJYGC+FNABX3N1OJo=
=/N2A
-----END PGP SIGNATURE-----

--HBg0C3yr6HVa1ZCc--
