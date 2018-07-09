From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: tegra30: Add Memory Client reset to VDE
Date: Mon, 9 Jul 2018 10:58:01 +0200
Message-ID: <20180709085801.GC13963@ulmo>
References: <20180520134846.31046-1-digetx@gmail.com>
 <20180520134846.31046-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8483778966301089058=="
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180520134846.31046-3-digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============8483778966301089058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 20, 2018 at 04:48:46PM +0300, Dmitry Osipenko wrote:
> Hook up Memory Client reset of the Video Decoder to the decoders DT node.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra30.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDI5YACgkQ3SOs138+
s6G2JhAApdcg7IFWFMgqlbOLmpx2EiHprBIO5z2l0xJrC5l+f/h9apDygmRdO9h4
JK6REB7VXt62Ayjmm00n82XEwt9hwtnDxQngwDI9ILjdNYb/wU2IpvNEBEJVx2Zh
72+axVijaTvmZlhpx6V6BvRpHjd0RzsQhC1GiKJSBkszdaK4n6Es/bCtpZjPRFpo
Ptyay0KMjEf4yvuW1noxJHEZrIjdP4Zn5+TuLCEyVivpu/w8xAABAwqUMR3SMOts
JtEY5of4+ETl/ob/HsadvN3vjpxiKUUzkDjlysXcKhsQCBPqBtiEc48WHzngW8VX
TEOHotePbuEzmxmpEuy39btr+GzGNcX6eK2tJ23xm4hFaXU5pfP/ppUPM8ZY/gNj
H7BjGD3O/k0odkhigmL3p59tSafDbe/Ff3dOpqjx1FKOjzjIvEXBnfU/Osy0cbfp
SE0neBcWEv7RSoaptnz/Vd+VwM/e0JqKFTMlqFhTMW8yX4MPBo79Hi6A6EpgaCG1
uTDuIOTiKMGiTaitWziKJw7zQo8As915yJPadrKqpnW3Hgbka06bKa1aVmdKGMXn
VuTrhaEHhV4shLkbD4pV5PkWGlJwP65i9liubZ9RK27qv3q6NXxo3iFr7thxGiAs
koh+O+O9L1/3fzN4ccJbmp9Dngc+EqD+A40DY7tAAAXbfpmAsF0=
=h8rp
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--

--===============8483778966301089058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devel mailing list
devel@linuxdriverproject.org
http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel

--===============8483778966301089058==--
