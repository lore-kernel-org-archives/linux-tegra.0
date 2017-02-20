From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Mon, 20 Feb 2017 19:16:53 +0100
Message-ID: <20170220181653.wanx5yd3ljwf3rch@ninjato>
References: <20170220165234.29299-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zra57tfv2x2kgf3x"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170220165234.29299-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zra57tfv2x2kgf3x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 05:52:33PM +0100, Thierry Reding wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
> HW devices, such as the I2C controller for the power management I2C bus.
> Software running on other CPUs must perform IPC to the BPMP in order to
> execute transactions on that I2C bus. This binding describes an I2C bus
> that is accessed in such a fashion.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to for-next, thanks (will be in for 4.11)!


--zra57tfv2x2kgf3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlirMoUACgkQFA3kzBSg
KbbIMBAAhz2kSPDTL/k36XImswQMRDZ1qMQlHciMXx/0Cv9H3HMIGSi8rV27rLCf
1Tw4QDuZG3Lkbpzs1a2yWQLk6c9Jjq3Hvk//ONG3y6/TLnYhBo/iAGPmOh49LF69
xUFmDgn9fM/Dy/yQLCRgI9EfMlnW0Qzf9s+Lf3EEugHXdvLsXM2Ho9890q6kpYKF
bIpI+Ern8PrPI3/hg4XufqVAC5qZKUjyP9hypacLE4yjqY38rIvSF1CxiTIN2X7M
avraU/WUV3AKiGhvfMkiNrr3DM8pCXvnky3VK8coayKeOxyn+08/ONb//j0z7n9f
XTUx7c95lxcNsk+OPvZS92HZ8a0UasErQyGrIxW3Hwn9eMfLpsFRRshzxcye1H1o
/+MvIH2+22RLSkxoqJ9pYD0YTB6ZLI7y9u+pJW97oMAFncaUv6ygOLk6tnBKdhnw
g7veWsHMWffS4HsiisJGoRh57kBBt5yakR1Q2RmsXu5mHi3yiHh5y71xevoO5b2q
cLWcSrYd/V9baiVpPeWXX5ze7BUb+bmcw4qFmBz980+WcJmuv3NZjZgOH/555LRf
gJKn83uVD7EBG8VNUdDTiepRoZFjkXig4LvHBZHcXM0G7bGxs4AfSKLARmNCZVut
B6J2F9e54YRyiQG1vz+P2B/6q+OVPVwkJSHBmIL/UlYtaAiWOWo=
=3JGO
-----END PGP SIGNATURE-----

--zra57tfv2x2kgf3x--
