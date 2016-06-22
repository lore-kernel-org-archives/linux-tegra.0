From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: tegra: remove board_init_funcs array
Date: Wed, 22 Jun 2016 14:50:13 +0200
Message-ID: <20160622125013.GH26943@ulmo.ba.sec>
References: <20160622124052.1263574-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7200773269277608684=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160622124052.1263574-1-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-tegra@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org


--===============7200773269277608684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QDd5rp1wjxlDmy9q"
Content-Disposition: inline


--QDd5rp1wjxlDmy9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 02:39:41PM +0200, Arnd Bergmann wrote:
> In a configuration that enables CONFIG_UBSAN_SANITIZE_ALL, I am getting
> a section mismatch warning for tegra20:
>=20
> WARNING: arch/arm/mach-tegra/built-in.o(.data+0x6e0): Section mismatch in=
 reference from the variable board_init_funcs to the function .init.text:pa=
z00_init()
>=20
> The array is no longer useful here since there is only one entry,
> so we can simply call the function directly after checking
> of_machine_is_compatible(). This fixes the section mismatch
> and is easier to read.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-tegra/tegra.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)

Shouldn't these section mismatches show up with default builds? I
haven't seen any when building Tegra configurations.

I'm going to apply this patch because I think it's useful, but it sure
would be nice to know why I need to enable this new UBSAN stuff to get
these warnings now.

Thierry

--QDd5rp1wjxlDmy9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaomFAAoJEN0jrNd/PrOh75YP/3UiN/pDybfXcayFnlvBPmpx
XRWKAk7QmsEtB87UtlZX0D9JFs1zVMyeB5IGLBBhyS2wNOLUF334aJrHG0rglFDL
3F5VVZixprwLSddIcaUJf16AHmTiPuYKEDljOh3AmMR1nKLnG5U+YChffwrM0eBJ
kpfVJ/SWzyyKAUwUVNJOWMeZSxUqhMCHklCHXu5v7ry5ZM1qf44Zd/ReAXVsGyXq
oNGzotdy7WhCLbP1ZIAXwRgNT1spTcd57xfaaYJVY94eUC2djnrUIh25yTdQ7M4L
Z9sBlSaxTcXcRYldZMku2SEk1JUT17U/biwsWaBxFLdbJII/XuPb6otDr/cpBnS8
pTPvgZ8+zL6J3cllpbocfb8Sq0luTKWYYODCRCcGsdiMJNCKOrP2cOYdqrWcZ4Ek
W1Xc6YCdCDX8hjguI95SSBxIF1zZT+pVA2L5OY7s8qQcoBasIZTv6jiNdBPOe+u9
sBiZfIhGT28f79q9+bn/Lur9AccyJEeS37juNiKJSI0OckRL0jPkVExUbP2AMVut
27x3HMXoVgaZ6KoUO7xaPrYSIu0gHpLXOMV9s0uJXzm6poGp/QZpb+mi2zaDQcXk
PWVstjVfInrCExc9f05BGdvbk/23LZOcdggtRhBUp5GDTM3EiYLwVgIvG5cfAkVy
Sy4yvyy0badK1Ds1BaAE
=LJ85
-----END PGP SIGNATURE-----

--QDd5rp1wjxlDmy9q--


--===============7200773269277608684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7200773269277608684==--
