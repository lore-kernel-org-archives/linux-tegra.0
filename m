From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/9] ARM: dts: tegra: last minute fixes
Date: Tue, 16 Oct 2018 12:58:52 +0100
Message-ID: <20181016115852.GE7449@sirena.org.uk>
References: <20181016104730.4598-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7756129264029270759=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181016104730.4598-1-marcel@ziswiler.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============7756129264029270759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a1QUDc0q7S3U7/Jg"
Content-Disposition: inline


--a1QUDc0q7S3U7/Jg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 16, 2018 at 12:47:21PM +0200, Marcel Ziswiler wrote:

> Marcel Ziswiler (9):
>   ARM: tegra: fix simple-panel compatibles
>   ARM: tegra: apalis-tk1/colibri_t20/t30: eval/iris: fix regulator gpio
>     enable
>   ARM: tegra: colibri_t20: reorder pmic properties
>   ARM: tegra: apalis-tk1: further regulator clean-up
>   ARM: tegra: apalis_t30/tk1: annotate power I2C being on-module
>   ARM: tegra: colibri_t30: further regulator clean-up
>   ARM: tegra: apalis_t30: further regulator clean-up
>   ASoC: tegra_sgtl5000: fix device_node refcounting
>   ASoC: tegra_sgtl5000: fix platform name vs. of_node assignement

These ASoC patches appear to have absolutely no relationship with the
rest of the series.  Is that the case or is there some dependency I'm
missing?

--a1QUDc0q7S3U7/Jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvF0nwACgkQJNaLcl1U
h9AFzgf+ITBvjGNS4tK/XQ0Cfn4GUpc11kkK5bQd4bUf3W3bwEnCpTsd6+NfAygz
7wOdbPJcJIbtlUgf2fMQav9od6IEuC4v/1nM9+hCXP0tQo9rQwylSO4WeEmhcrHc
dT9kvMIzzvt3Z4961v7Lrn/1/8YHbC/KV1/2lGnvzY0XiJPbKT3c5HggvDkeeE7W
kwStdeuWl2S1SR2nSqhz1jpQEvu4PZGSNaVHkC8s4wHNFMXZFgjvTTC1vp2TXX2o
HpmqazjTHdg1bptQOJChifkzj6F5RBn9gdKsqdz+T/ThSzOtnq2gY0+wKXwahYvM
g7zfc+XcHzP3Jtg7uEW+WZVaAYXwUA==
=OQtb
-----END PGP SIGNATURE-----

--a1QUDc0q7S3U7/Jg--

--===============7756129264029270759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============7756129264029270759==--
