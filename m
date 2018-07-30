From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: tegra: Add a TDM configuration
	callback
Date: Mon, 30 Jul 2018 09:49:08 +0100
Message-ID: <20180730084908.GB5789@sirena.org.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3702962846655915520=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org


--===============3702962846655915520==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2018 at 01:59:29PM +0100, Jorge Sanjuan wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
>=20
> Add a callback to configure TDM settings for the Tegra30
> I2S ASoC 'platform' driver.
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>

This says it was britten by Edward but there's a signoff from Ben before
his?

> +	dev_dbg(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 0x%08x"
> +		"slots: 0x%08x width: %d\n",
> +		__func__, tx_mask, rx_mask, slots, slot_width);

Please don't split log messages over lines, it makes it harder to grep
for them.  Just use a long line.

I'm also not seeing any validation of the parameters?

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlte0QQACgkQJNaLcl1U
h9BuNAf/cfHPyby2vIiYiBtKNjYyarPLvjsq0p2Q2DrR4uZY3N47QsCyaOYBw7BU
715N9S7k42wEkRpVzHXzYj2MzCj9Zvc2fJCRfnbWWCSUT75cRfzRZi2z8g7yBCsB
cFe/IpO48eFpMBNOlGQbTqa40dtu6SXRMAEa8q63aS34tq35lzB2hEt/WDwdO+J0
XiMXF7Cq9VxDKjOnTW7SOxu5PB2iCTvRSWxr/ts1Ij1cQl1emawM6bsfZeLJxBf/
DFEfvWY0I/U/MUftupOUqA1HSpYrUQ0ADhu8QzY4Kxvj3tPR4DGGj5vA50C8GBjS
VE6qk2lVUgz4pLECIh6wdo8+uIvEtA==
=aGL7
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--

--===============3702962846655915520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3702962846655915520==--
