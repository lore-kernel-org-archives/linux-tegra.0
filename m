From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] net: stmmac: Fix crash observed if PHY does not
 support EEE
Date: Wed, 26 Jun 2019 12:45:44 +0200
Message-ID: <20190626104544.GI6362@ulmo>
References: <20190626102322.18821-1-jonathanh@nvidia.com>
 <20190626102322.18821-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sl5MdczEF/OU2Miu"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626102322.18821-2-jonathanh@nvidia.com>
Sender: netdev-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--sl5MdczEF/OU2Miu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2019 at 11:23:22AM +0100, Jon Hunter wrote:
> If the PHY does not support EEE mode, then a crash is observed when the
> ethernet interface is enabled. The crash occurs, because if the PHY does
> not support EEE, then although the EEE timer is never configured, it is
> still marked as enabled and so the stmmac ethernet driver is still
> trying to update the timer by calling mod_timer(). This triggers a BUG()
> in the mod_timer() because we are trying to update a timer when there is
> no callback function set because timer_setup() was never called for this
> timer.
>=20
> The problem is caused because we return true from the function
> stmmac_eee_init(), marking the EEE timer as enabled, even when we have
> not configured the EEE timer. Fix this by ensuring that we return false
> if the PHY does not support EEE and hence, 'eee_active' is not set.
>=20
> Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib l=
ogic")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Thanks for hunting this down!

Tested-by: Thierry Reding <treding@nvidia.com>

--sl5MdczEF/OU2Miu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TTNgACgkQ3SOs138+
s6HZQBAAqWrK8d1EPvTwnqLtgKJ5oN+frh+R6yXy+OT9WPSZ3GbCBHmwIf7EXKgP
q4SHLahpmzfSayIS1hoN2hpKOz2T2irwKkE+NcElJqw1e/8sfEQmQjS+CD0TX4m7
CSM8nmu60kh7DWfvERzJZHdBO9lgNY8ib8zCcp/fNeVJRCySW+Pu0c8jjiRDhDbA
DJwKwvWiYNmZS2ycgsKyUNDprThYf7v7SznwWtEETGjCuRIkEFyLAFvEZGi6NEFh
dGUA30V3dyIMfw3QyR2Ixmna61NxWIDpeUHjw0O8GjL4dNv8GPnP+ViKIedxsEdq
3NQTHprz21iu2P8KgLkH6E7vKOzvoncmHaR/L+QXqwnTTLCFyt0XlaQvjPwGw7jV
etePMuaq+8DyRr5oo48V7T4ErBzTWXhWXttOSdy6J8BqNAYhtjjJgYcjmghnxUev
evjssMoZc05oJjenN/l/UvFuvEQofKpWPv3ls68sHjKgOQgp4RL+D194FX/cX+0s
R0rdH9x2Wji7PPEscCIIOVcdRxlNi8JOwDPjrJCmjmlmbWM5uh70khn7Psp5n6Cf
qn4nSdPBfMFT5oD59vxND6MYrvzGpMsmzuiGuhXAEu6a5Xe1xi1DaB4/yTJkxSnh
xofb5RhdAb7fEGbF5LmiO5WRVZk1y2svLc6HUeTIhxASonYM24M=
=Z0mB
-----END PGP SIGNATURE-----

--sl5MdczEF/OU2Miu--
