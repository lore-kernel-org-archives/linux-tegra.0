From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] drm/panel: add support for EDT ET057090DHU panel
Date: Thu, 15 May 2014 12:52:35 +0200
Message-ID: <20140515105234.GJ6434@ulmo>
References: <1400146725-5788-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1107559421=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1400146725-5788-1-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: stefan@agner.ch
Cc: devicetree@vger.kernel.org, linux@arm.linux.org.uk, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, marcel@ziswiler.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============1107559421==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline


--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 11:38:45AM +0200, stefan@agner.ch wrote:
> From: Stefan Agner <stefan@agner.ch>
>=20
> This panel is sold by Toradex for Colibri T20/T30 and Apalis T30
> evaluation kits.
>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  .../devicetree/bindings/panel/edt,et057090dhu.txt  |  7 ++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++=
++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/edt,et057090d=
hu.txt

Applied, thanks.

Thierry

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTdJxyAAoJEN0jrNd/PrOhaX4QAL0axTjxBEU4TgE9odqQXdZD
DrS/uBBpjdMGi58KYJV7EBbEUN6BjgbAGrVyX+TU22RaaKsUdyYNHoHxFHDNPOJz
793+fQPaHLGjR8i9M+x/E00tbgtVnyj5OGZTYfhh5BcOzuEFnFbuOryWNYPdzakz
mNawbUxFvh6bGxuSPMXtbKzJ7lscUr1A5crVQIo4k//cyr1MW3rBDKcdzsYWs6kl
aMHKLuMYsjSoLwMNy28zWPsdGL9RXI/QEt7F06gbyzLATLulDUufCXbk2rk7Iswl
7nF7p9CdAIOLs2G0e7Emvvzn4KtAVPCN9KJXc+W79+9IsOCTm/L+AuONsLSw7c68
W7s4MFz8ehRkVkeTgW4/1J0wR6zjE7zTt6gQSGwtMbof8i5QZ1+6GLKh+1dYfKvw
Yg2dZeBz9h+U4xb2lO5hLe1fRZINawNyijv9psncb7ReKY2pm6eoQiHwKIBuO/F1
hwleFU0OmoqCDXKBQjMNAHz1drM68r5KBYaBs3pLTdH/j933YCAdYv2VaFyEcwx7
Rqldc7ijLeGAAh3jR17wdzb38GaV3TAyWSNXYQH06jTY686oZArwLuwk9EO4+Y5S
5oye9+ogbsaIJaJdggvM2N95wQs048safVUcJoMmFcP/0YKHT67Xf/LrGmB4qtEm
4JzWMXbdXQS62S7ryvG6
=adqH
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--

--===============1107559421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1107559421==--
