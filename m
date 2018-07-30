From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: tegra: Add a TDM configuration
	callback
Date: Mon, 30 Jul 2018 16:07:49 +0100
Message-ID: <20180730150749.GK5789@sirena.org.uk>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-3-jorge.sanjuan@codethink.co.uk>
 <2392df6f-12bc-74fe-ec0f-50dbb7b9a33a@nvidia.com>
 <20180730101800.GF5789@sirena.org.uk>
 <2a91268d-351b-d342-42bd-8ffbf33a316e@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0007691884723473734=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <2a91268d-351b-d342-42bd-8ffbf33a316e@nvidia.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0007691884723473734==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T4Djgzn3z2HSNnx0"
Content-Disposition: inline


--T4Djgzn3z2HSNnx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 30, 2018 at 03:04:46PM +0100, Jon Hunter wrote:
> On 30/07/18 11:18, Mark Brown wrote:

> > DSP modes only care about the rising edge of the LRCLK, the pulse can be
> > any width without causing interoperability problems.

> OK, thanks I was not able to find a spec that defines this, but I saw a
> lot of codecs use a single bit clock width. So then equally making the
> default '1' should also be fine.

There's not really a spec for this, it's just what tends to be
implemented.

> I still do not like configuring the fsync width in this function. The
> fsync width needs to be configured for both DSP modes and normal I2S
> modes and so it seems it would be more appropriate to do this in the
> hw_params function for this driver.

You *could* just always use the I2S width, it's going to look odd when
people use a scope but it will work most of the time.

--T4Djgzn3z2HSNnx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltfKcQACgkQJNaLcl1U
h9BB0Af+IyXKfsxp1Wb1UfKoIPDIVgYtmwl+1Y8/bfWN3+FAgD2w+KKS2NA5mRBg
WpXyuoJ1JxIj4016p+YX1JBtzQKAULHGaEK/GjWGHbh0e6hlG6uKgnAXTD2bGBjT
vz0SanSzblF0DTUHzH4gZHc+/K8TK/LUWjLdDmrOFePZ+Uk83fCDbtPuJWPQ4t/B
b57efuww3wXP0tAKIKFAtW+trIWXhByODi/tjqsR2VFE9gcUIsgpPtiq+dkbhPDb
3GJMrdExpTTIh5oG3oBu+8MyhJxw/Km6djZrC5cXPUXCV4B/dg0Y7TXcIRn5/lDI
8gaHajCblyhEYmfxnF+8ybq0yjffag==
=Bfke
-----END PGP SIGNATURE-----

--T4Djgzn3z2HSNnx0--

--===============0007691884723473734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============0007691884723473734==--
