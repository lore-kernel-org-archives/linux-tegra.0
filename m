From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 04/17] ASoC: tegra: add description to a
 couple Kconfig options
Date: Sat, 31 Mar 2012 20:48:48 +0100
Message-ID: <20120331194848.GG5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
	<1333148852-17806-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6133807306007052592=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1333148852-17806-5-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lrg@ti.com>
List-Id: linux-tegra@vger.kernel.org


--===============6133807306007052592==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 05:07:19PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> Even though these options are typically only selected by other options,
> it's still useful to give them a brief description.

Why do you find these short descriptions useful?  They'll cause Kconfig
to prompt for them and...

> -	tristate
> +	tristate "Tegra I2S driver"
>  	depends on SND_SOC_TEGRA
>  	help
>  	  Say Y or M if you want to add support for codecs attached to the

=2E..there's already a description in the long text anyway?

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd1+LAAoJEBus8iNuMP3dbNQP/jlloRgjBuPtfa9wHG9LaWhy
Dl0TamS0TBTiAVQ/2CRsF6+eHoW0xDUocxJhU9w3ZGKItnRzkFlqYBWSZjLkpZk9
v9GCHPQ1XEg12plkmv27iDKHSP46FTLqb6YANSUqtqhpG7gQDdbOqBTyIF6Th5aD
B771h4nOMaqArWfqWN6ATIqo5mSjwXLXjYhUEfXKRwCtyK/Kf+JCxcaUX8h7VN5z
Gypb1WU2eRQnj0V0kPGfoD1vKvokELG9CuP7VmGyozqvOGdKEFVDw0xfyNqpPyzU
EYVV9mb9hKv/D5r9n39eK8+eyL5r5I88T5STPueLAIEYdppOKO35sEBEiwP16ZRp
pC7hHQ5so3PK6dCfuuGnWszYvJO79xi8mN+T5GdsNtalAs43hI1APFwUA7DJE8dz
5v8avreEGEC4yrEI1v4pZFasLsTueDO4uKP1+Evh70WrHuQZBZnSt8qCG2X80RM8
gFzR5khJYt1gIPfgiF8/xtqIOkUkcLAz1Ib9JvZoH17BVmK2gFp+A3RJI+lZT52A
14RXDnu80TwbxaEVTY54ThoH1xe2Ofno2Qum7sxFOulUz/BFK93hr2udRnD62hbh
NCAHCTm+FjjBIzLaiSsef2QwvufnbpKVVDb/C9sba07HJDQyryQH3TXWZ7pSmkh9
IBp0o9yhd9EWhADrYR+t
=/n7g
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--

--===============6133807306007052592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6133807306007052592==--
