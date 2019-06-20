From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: tegra: enable ACONNECT, ADMA and AGIC
Date: Thu, 20 Jun 2019 11:39:54 +0200
Message-ID: <20190620093954.GJ26689@ulmo>
References: <1560945082-24554-1-git-send-email-spujar@nvidia.com>
 <1560945082-24554-2-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AXxEqdD4tcVTjWte"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560945082-24554-2-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--AXxEqdD4tcVTjWte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 05:21:22PM +0530, Sameer Pujar wrote:
> Enable ACONNECT, ADMA and AGIC devices for following platforms
>   * Jetson TX2
>   * Jetson Xavier
>=20
> Verified driver probe path and devices get registered fine.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  changes in current revision
>    * renamed agic, interrupt-controller, name
>=20
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 12 ++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 12 ++++++++++++
>  2 files changed, 24 insertions(+)

Applied to for-5.3/arm64/dt, thanks.

Thierry

--AXxEqdD4tcVTjWte
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LVGoACgkQ3SOs138+
s6HmwxAAuz3s2lsYuNspLRTR7ZEw+HSokk6+25gsH3D8xjf6/9CeYFTfEFwu9fRV
svrVsN2wkVUvThaNn5UpajTzJJ+AUg5isdIcNUJ5zwlAbFmhCzwxGFgMit6aMxnz
if2/SLmiNZ6QnzU1r7RUkqMGC69hHhrV7daAEcYTWklLYYmIeU6wX3cLrVCsvnQ7
QF/087CR/T66/ECHcKodVtsE86BrLsiyVaiQq2AeAOscFWhIzv/M98aQb9OiceRm
2OB7nf+qhsdjU1M1G73rpcNuRHdppTOxm2ZFP22mk4VLLLmrL1nHA6XbGUQTNedW
h5TrwlsEVDtUyqLj6OThRByxv0+lvatK9Wor2su8h2v4KZubxL+FjcfbwWN8kgxP
r6QE9Swo2EZzqav5PFaY3nXbG+F1oFaPZpw6MkG70Swv26cwh3DEAvw4a9iPvzhh
W9gaqXYIc01SZkX2Nub5Zx0AKptK/4NI21aE+uO8HnYS43Qydvs+6JVqGA9oRSmT
ZF9Kd+585Upebth/fZHspW0YgxWNlO0WtqWjBt8wFeyMkYamHft1d8kSXGyiccsv
9ZDZncC7trCxQyF4NUc8xibtAO2P2bsc9Sq6qgYfOQxct/4Ve/2queKa3xwIruxB
aCw4MrbJQ7EKFkph8e6gZ8cIUfA29VqxIN/ZmcRP3uI5FkbylCU=
=CBE0
-----END PGP SIGNATURE-----

--AXxEqdD4tcVTjWte--
