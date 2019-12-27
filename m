From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Date: Fri, 27 Dec 2019 22:48:06 +0000
Message-ID: <20191227224806.GP27497@sirena.org.uk>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
 <20191225175736.GC27497@sirena.org.uk>
 <856d8a92-0c24-6722-952c-06b86c706e97@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CKf/2jVYos1l2hij"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <856d8a92-0c24-6722-952c-06b86c706e97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--CKf/2jVYos1l2hij
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 05:56:06PM +0300, Dmitry Osipenko wrote:
> 25.12.2019 20:57, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Dec 23, 2019 at 12:14:34AM +0300, Dmitry Osipenko wrote:

> >> I'm not sure why clocks should be disabled during the rate-changing,
> >> probably this action is not really needed.

> > I know nothing about this particular device but this is not that
> > unusual a restriction for audio hardware, you often can't
> > robustly reconfigure the clocking for a device while it's active

> If nobody knows for sure, then will be better to keep
> tegra_asoc_utils_set_rate() unchanged.

Yeah, that's my instinct - unless we understand the disable it's
safer not to do it.

--CKf/2jVYos1l2hij
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4GiiUACgkQJNaLcl1U
h9Df1wf/WpeKIdsJm9CpD2g6l/HiFfNALEg3OrDmzNwzbGiCqrMSTPog6EddD3e6
5EmfLE3DY2tSCu1nkVCtEhrfteuwqWsQQDmn6x/+iXZrGLzL0GsLVMhF0TwSgd9s
jIySU0jRy6I/AhnYgQ5qx/UsFjBRIweMVFMeoRJBkn0bzT0T5Q7f84ROYhKZcOtz
e7CHXFFtNBU0zJ2/VZLoILusTGzrIaNkkrZ82+6Zy76v9FyMdVM8LWMwr0V10C3O
8fl9hvJIfXB11FSWf7jsENBla9LotrwLLivIkhsPfUxA6ZYsYjWkw1KeYCOfKwE5
LURwVXe5lfCgCP+WY0M7dh/y2cWpAQ==
=jKXz
-----END PGP SIGNATURE-----

--CKf/2jVYos1l2hij--
