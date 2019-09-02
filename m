From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] merge_config.sh: Check error codes from make
Date: Mon, 2 Sep 2019 16:59:37 +0100
Message-ID: <20190902155937.GD5819@sirena.co.uk>
References: <20190819200650.18156-1-broonie@kernel.org>
 <b744485d-3e57-469f-5573-6d8a32ba0aef@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b744485d-3e57-469f-5573-6d8a32ba0aef@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 02, 2019 at 03:06:28PM +0100, Jon Hunter wrote:

> If the intent is to catch errors returned by make, then one simple fix would be ...

I proposed a simpler version originally that only caught errors from
make, this version was suggested by Yamada-san.  Like Guillaume says he
posted a proposed fix for this last week.

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1tPGgACgkQJNaLcl1U
h9Ay0QgAg/xxPeqP2NZDIjMq3QJRYuPGW0WzVxE5ZNhSp4XYeNPplJo8koUkwApf
FmvBUl0DJSJHwkh/jZNFm+Z6G5T0DrKoM+lgxyzYvDLH7Up6hVUx3Iw5i0v1fuys
kjtgallTF9Jd75gYIYeX1mJWc5HChvKQyx8Q9Vy3UYePbUQ/S/LNZJdquESGSPiq
Nb1Aql0BCqhUVMVKwXf9rk9/fEkvvD/rttciTOfHZiCCqj+eyu5hPrcLXvZgh2VF
ntZSNe61u49S3kwhEN0R8JX0ViZvVpuKE4YqbTccEmVo+A2D7y5NI1na3ODEm/At
jcGbsUlnWjeSpLkD7go+jsqV3ny9Rg==
=jOvy
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
