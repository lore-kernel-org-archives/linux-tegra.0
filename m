From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: tegra: Enable DFLL support on Jetson Nano
Date: Tue, 14 Jul 2020 11:18:49 +0200
Message-ID: <20200714091849.GD141356@ulmo>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
 <20200712102506.23686-3-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200712102506.23686-3-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:25:05AM +0100, Jon Hunter wrote:
> Populate the DFLL node and corresponding PWM pin nodes in order to
> enable CPUFREQ support on the Jetson Nano platform.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)

Applied, thanks.

Thierry

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NeHgACgkQ3SOs138+
s6GTrBAAveQYfikelPWoSGyB7pOtruDvFpIQ5mth2Gq+WsQcCiH2Wd4PEW3qucj4
787DGzApuSlKpD8g6lP0RlUqFkSD0Diye9l1sNUodUranfc0VoM5bf8ctUcPnTiP
E2WETtWnzZXhP/Lsn/Bf/lL483G52vWDx/UZSO/74SkUyZUhjKYu8OcDTnd4pigb
mwKhxOtt5m4ic/RLT/OgH41AFQo8Ac8j01rjZZ/3Bhy8jQ/xpfAfCF6sui5eGPn6
Wcpf+IU0GOZeZCYhsYRf3hjrhqe05Yhbfx5PVwgl8M5UHLooH3XXe0aa7xoesRfq
tss9OFAf7C+rG9NodN93xnPmGwD22H2wFSGpV2mPn+oZELw06OFJs/C74SJNdtOX
ba58yrtUxbdacKXwl+I7+TwxLDLzPLOQWN2rXeecooInw7M5CkjUxTmh5B+JX/pV
6Vg8jR/3apz46k2UWilwe4o5vwixIHvUqSENfSM4BajQDe0RN1pZL2h9aNwtlpTv
29JdNnG3Q8SOastfjTJEWIXitjYpXpfaCbfiPJr8Nc3vWoWhSy/TQAcWxpI/EeWy
iOcLfXbLpdh5oDgtDKZ9lJIMEehagV+v3FOgMGpSaNPZ4hlfGBl1vmelnmAyTOSA
0F7b7M4AkYhrPRRjHUkboknTclVoQdkSUfO99MDg31iUfi8aUNM=
=eYI1
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
