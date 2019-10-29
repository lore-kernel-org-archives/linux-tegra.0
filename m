From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/2] Tegra30+ CPU suspend-resume bug-fixes
Date: Tue, 29 Oct 2019 14:33:05 +0100
Message-ID: <20191029133305.GG508460@ulmo>
References: <20190730172340.14037-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190730172340.14037-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 08:23:38PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This small series addresses two suspend-resume bugs: one affects Tegra30+
> due to a typo in the code, other fixes CPU hang on Tegra30 specifically.
>=20
> Changelog:
>=20
> v2: Reworded comment to the code to make it sound better in the patch
>     "Use WFE for power-gating on Tegra30".
>=20
> Dmitry Osipenko (2):
>   ARM: tegra: Fix FLOW_CTLR_HALT register clobbering by tegra_resume()
>   ARM: tegra: Use WFE for power-gating on Tegra30

Applied to for-5.5/arm/core, thanks.

Thierry

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24P5EACgkQ3SOs138+
s6G5Sw//S0grOxV9TM8J+h8JsMlBe3IItRZfnQw0WAcovTCfk3BVoEEMvR08zuGd
lu3KKJSPyvf0tISCn/gFgrhNlBtwytO9Mv0gJRNB846UU3vedB6qzm026oQKkvRR
rFcYkuWXOt1rFofXbQGuXsT5cN/WlrgCmNbGCJBTkLAYnNVG9ASPrwD0Y2teidRU
dT/fzKNQlpvFNqBoRhXJtUY8T5cYULd0QVqWhqEY9X33LL0rR9fR4X0Bm3awgMsm
F2L9/7/mLl+BysnvIvVkQ+SbNwwks2diaxIEWlOogb8JM7uo5rzqacfTtVBd88Qp
xUAfpZ2iZBJw2FqbZ4R+v27K3f8OG+DgT2grxqiWaWkHtjma8Lfn8KwOwwIrpE4d
drdB5MjUJJNLBJ/Ki4fvONLwgcTYHCw1sZbaZydmDvYAh2RBG5esrFjU0IDCVQqE
D6FidCp0Xk+tQtKECZ8gGPEYIpMJw9eImm6iVRdV+YoS8w8WHjh8zLULciHyWx6b
a/jGGo835Xkv5EVv5LdH+tVIhR3IwOADjHTuWSNTYtXCijLOTgvhszvr3IChjw9Z
ejRuN7ZVDllPLBxmZ/dpx+M+bVLy1Ymm1LdnYjXBZg8UzE/N8cyagkaVpQ4vzN3e
X7SfNXDS0c9kE/SvJVkTlsMBucxua7Nc3lab70p3M+qKdhWwRn4=
=vR6p
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
