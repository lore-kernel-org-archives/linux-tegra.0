From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] ARM: tegra: Enable Tegra VDE driver in tegra_defconfig
Date: Tue, 29 Oct 2019 14:11:13 +0100
Message-ID: <20191029131113.GB508460@ulmo>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623170730.5095-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:07:25PM +0300, Dmitry Osipenko wrote:
> The video decoder driver was tested by time and works absolutely fine.
> The reason why it is in staging is because it doesn't provide common V4L
> interface yet, this shouldn't stop driver enabling in the defconfig since
> our userspace (libvdpau-tegra) provides combined acceleration of decoding
> and displaying without use of V4L.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> No changes since v1.
>=20
>  arch/arm/configs/tegra_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-5.5/arm/defconfig, thanks.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24OnEACgkQ3SOs138+
s6Hsug/8D9ZjFD1Ul/3scNpLRp1IPnTWhhx+W0DZAVdANmT+CS6SbGdGwL2DeHGm
sTknFJzDEf7x1IOgajb5NcJioElqnPjE4fCQaCUSruNk1mKQjoef3nWlvGWrJxv6
CkLeOFt42etHWRUm47LlBEBhqMZzJ3yFudszWQK1Qm1rtJrfT31IQY14COZAQZQJ
cV98i/HGAmcmrWwPRTm2Kj3HzoZ+qtmFF5Cfk2HqIs7UPz8K4KaNGpbBalAo/6NC
rTVa0nkxIq/hIFKzJ2w8Wq8dJi+fqeaLGKzmzWt0Y9yKCkLRcGW3/jVo+3mSNKf2
a0Mvs1dWpVgiYvAcWuANX3sWDipX0qhyq4jvZ81mdsB0tFA25n3sC9gY3aVMphZO
iZTMA69bo0CIJZLceuTMB6KbMK5VQHgyDrDVJyOc45ZT8jZ4KYkXXmB+oBGJqRPA
/Jw14esu2ojr0Rv54QHzr9ttSypo6TpB70Hy5k0Co8lye3uziOQxcbPhcyWNt3au
Wqa1bczkQoOLaRrjQ/YHzsfAImkBRb3r1uhEhSuAhbhtKU0qXsbT4izhqCHKrjpS
b6NAOAYbA2kX0RPNjVBhGzR5tRS3vafubRYrtOud08HPmW5EFMmzqktn4FOeBVb9
07FZAlIhmhmnvremuifeN+1g4o1XGyloWEzgpA+0uXQitd090v8=
=q4xx
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
