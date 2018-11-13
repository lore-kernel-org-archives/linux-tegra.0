From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: remove duplicated function declaration
Date: Tue, 13 Nov 2018 20:25:16 +0100
Message-ID: <20181113192516.GB2724@ulmo>
References: <1542131465-22773-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542131465-22773-1-git-send-email-byan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Yan <byan@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2018 at 09:51:05AM -0800, Bo Yan wrote:
> The function tegra_read_chipid is declared twice in fuse.h. Remove
> the redundant declaration.
>=20
> Signed-off-by: Bo Yan <byan@nvidia.com>
> ---
>  include/soc/tegra/fuse.h | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thierry

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvrJRcACgkQ3SOs138+
s6GujBAAqlo9AHnhBhOdjSAXFFurCj4amejWmCL6OZFU8fel8rCrX6xS3ZxTKGTG
eleeAi/WUTujQJ7w7L531AStwvfCtyqu9e8xZzsl2Kgf5ml732Dvd3nbQRan637m
nVTHvdu5PxZZkWMG+GWiCqG3BJw21SMRNdIMCqkOoY9+pzETj3CO6tfZD2MIrU/5
wlXsicEJzzpKFce7Ccz/M1u7meChKj/3KosAOYbWrk/es7abnZvrOWjShVM/Qwtb
XN9YnNBrUPiVOJ3zB9OyEztIP2qxP4wab54zYNm0DME/bbD8W6NGcpdO9IaC3pIq
Xjw82W+y/F2g3b9rlyu4qFw9O1fiAeLYXcfgykpB9HgHCVy0jaa2N9TZPXWan2r4
teJz5Ozs+GDlY8epBZw4TwxCp3HFG5cMHec6O2tFR0GObnKhcuReha66vGoL3gCa
6qGEx3pQAUEOQvnYATbULf1JTju9cRKUgRQe9iWX0bwBeF7NsX3HWFlJHISpWFwI
Zz6Lwohtv0g9PQTNQdLxEGjS9aLaEMT0GuSzj6s35tlikwu4oyKZjkb8cCHNKDM+
J82r7X/WV8ywa5/vbW4tfBRCXI/oVZvx1NQvkiF8I0wV0hHjgqOWcsGiyZgve19K
3IbitNsyRm74hdjJsHWBVnPAIHOyr/mG4I1xMf7X1SDd1kMGvaA=
=Cd+V
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
