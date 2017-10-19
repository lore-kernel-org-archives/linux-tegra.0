From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/6] arm64: tegra: Add #power-domain-cells for BPMP
Date: Thu, 19 Oct 2017 12:49:52 +0200
Message-ID: <20171019104952.GL9005@ulmo>
References: <20170905084306.19318-1-mperttunen@nvidia.com>
 <20170905084306.19318-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+svXpSx+RSEd8UhP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170905084306.19318-2-mperttunen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, robh+dt@kernel.org, mark.rutland@arm.com, digetx@gmail.com, amerilainen@nvidia.com, dnibade@nvidia.com, sgurrappadi@nvidia.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--+svXpSx+RSEd8UhP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2017 at 11:43:01AM +0300, Mikko Perttunen wrote:
> Add #power-domain-cells for the BPMP node on Tegra186 so that the power
> domain provider may be used.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--+svXpSx+RSEd8UhP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnog1AACgkQ3SOs138+
s6G8xhAAovInjshP9kEmVnQ6qrtJiWhoROtJmnhreNx0OPg0CpZavSnz+cxHfer1
yvzDbxd1LX9ESizG/1nv6eKcgYBjY4wbWA/mcJNKUt4fAz0/1NggpPd+22QyxsjA
e6Qe3G9dxnUOP9LwLsvbc+BBTd95zX/nzbdvRwx5msMumE/MK9PPaWNFKYpa+l9b
bt2kp1BHZy0VvNAjK+/GfL4pMmLkMACF7lHVYO4AiaRx5VSg9bat1JGDrBFzizDj
FPNkPSoqWBCEWnFDUgMZ927F8h5lNrDXvqMMcsfnJtBmiRlCK9ffnhNU5G35UO9e
IGcFn1uPXwT/wy48fKQJdw5BuuZTMwpO1scEJHIqLq3bXzqwhg69YaKEiBNHfv9N
HKWFzaHlgdVWKeDIFTNb5Tddvc61bQtwznCwh4eK85TuiCyC4t7FBuHpy9XyWUmT
+k4C8Z87ZFnCdU6zbv7hQ1yobysZWlCzRcWJqWmrTIhm0jNTHU0CZfMIalsC8maR
9GLoO2pbLCLWthiSjgizClp4K373Q6r8hy5wVifxu/GQXn7XimebsA15cMV0DaYp
zrjdFOUBO9Q1pqoZwzw1gD6Mhn6mSGWQ/BTgB+DX3A+7KeBN6Z0RYt+/1EJVKIUP
Zi4/C99ft0l6ewM1fBRpAqGtEYr9xpijXMZaJQtzK2zISrIob9g=
=hcjR
-----END PGP SIGNATURE-----

--+svXpSx+RSEd8UhP--
