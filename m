From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: use clk_disable_unprepare
 instead of clk_disable
Date: Fri, 15 Nov 2013 17:44:25 +0000
Message-ID: <20131115174425.GB15393@sirena.org.uk>
References: <CAPgLHd84PK+6b0OfnRqBppvBk9i3Xy=ZEiPQO8ZCPz+NW9g4Uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5406192521295661911=="
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <CAPgLHd84PK+6b0OfnRqBppvBk9i3Xy=ZEiPQO8ZCPz+NW9g4Uw@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: alsa-devel@alsa-project.org, swarren@wwwdotorg.org, tiwai@suse.de, lgirdwood@gmail.com, rob.herring@calxeda.com, linux-tegra@vger.kernel.org, yongjun_wei@trendmicro.com.cn, thierry.reding@gmail.com, grant.likely@linaro.org
List-Id: linux-tegra@vger.kernel.org


--===============5406192521295661911==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 05:53:45PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>=20
> clk_prepare_enable() is used so clk_disable_unprepare() should be
> used instead of clk_disable() in the error handling path.

Applied, thanks.

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJShl1xAAoJELSic+t+oim9XboP/Ak0jVieWD6Nx+6X+/tGgRtS
KyJzP6Iz57KVOqTK+54qK3b+Eqv9FZ1uG3x6XbvrNXVhJ5mlTv8UUw7tUBmt1PbV
SKfHpdRd/3w29LC74z1lFAh7lAcvi7L+0C+amb+BZJp05sqCUnc2pepgG6AIxW52
ptt2gCOXgTYWh9bVdQdAFW9mj5k8w4GlXEss4YzOldj0tBj92UVbqPH4XYXHP6PC
0lApkwb0wUK0Q+IDuwI874kMS3UumnbKvd2iQkM+31Ifnyi1RRO+ihJpuGAcsSgs
C3sUjRHDkvtj/xdZhgye5e3wX0yQOKE0hh4zIA2i2GWny5zwfOIX9iVMbBvtT0oN
dSJ9lKLSg5OuJNhzyzfe+dn/dKlsinsVjRCm2To482PDXnBCkcic2HGopK5vp+jM
o78M9KMTvPyVtST5iH9hKonz5w2QjInk0tQ5+QKTiXnsCKwivUqUoSA2ycyHgZ8Z
h/NJ3Xl2cVLv9R1AhfzU3UYiPbbS6OU3qURryKwFO4rkVNijZ/5QM4uHp/Xdb4QU
mFnu2DvvAs2nYZHYueVgjypRlL8MCms1Uu0k5mHME67c4R77CYVqsrau7K7Y8TUs
VQmFrhCAVFKjPfDABj6pX1RX5TWzitqXNDK6BPRSjX8vwXD7Y48HToMGqwMINU9m
IWr0/wW/32lZRO92Q6tr
=3OAr
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

--===============5406192521295661911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============5406192521295661911==--
