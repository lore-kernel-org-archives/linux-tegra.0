From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 1/8] dt: bindings: tegra20-emc: Document interrupt
 property
Date: Thu, 25 Oct 2018 16:25:59 +0200
Message-ID: <20181025142559.GD21521@ulmo>
References: <20181021183052.32023-1-digetx@gmail.com>
 <20181021183052.32023-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021183052.32023-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 09:30:45PM +0300, Dmitry Osipenko wrote:
> EMC has a dedicated interrupt that is used to notify about completion of
> HW operations. Document the interrupt property.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt        | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-4.21/dt-bindings, thanks.

Thierry

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR0ncACgkQ3SOs138+
s6GNKg//Z6X1BmQbDbtD5HPPAZ8oy/HUQd4ncma03Dig/W0/Z/uNubmsjnuc8THd
pO2rzpwgLTGIdLU8imY2d8vOUE7Hd5tgAbV03xW+x+mDZkwD6YRxqggO0PVYFmFw
36zwvI+apL0oSNc4HwM2uh3S5JbiyjlB+R6VGuHI1J7y6xq+9rAZV+u5NftZUOYi
SixGyeX+EiB49I9MBTkdKI6FVGW+a8a90nFgrRalQCsSvUAn/SwlEX7ePyXuOCTX
T0pEgcQJgprPaF1c1TpCvStTXajipiclkGTGwiG/iSdzMTlsC+EJd0OrxStSiFxA
6tPhz7cR+3bZY5OdWsh8tEsBvq8DiylrFo0nmAwaY4bmaDSMxPyNLolfk0EKgODk
2PqTNe+yp9ajUf2mRp6u/o3FHIGB9Md79wTkSUh1eZ9USJ2972j2oxUJcYej+4Mx
qd0+gDl9AKMuiZ5dFB5qf5erG2IyGZY1o3pzFAi04eLXlitmd830OtER5dR+6E84
jLl8Z+wXlQBykc9/3xEFWGUd+mj1LPQJ9XiVEe5gWCWdpI7q5YUkrjTbuag5Q9Wf
1P2dDQXpHk7251I+Oi1Z36xpXrx2jVbxgSdkNPXwT61cF+2X0DIDpo3iMKY/izfV
o6qxT36n0joi69wHtoo+baK1irGeJYTyuozYLsM03kGhhZt9jOA=
=7q05
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
