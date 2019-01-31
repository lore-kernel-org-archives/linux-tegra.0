From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 2/5] i2c: tegra: Add Bus Clear Master Support
Date: Thu, 31 Jan 2019 12:31:38 +0100
Message-ID: <20190131113138.GE23438@ulmo>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
 <1548864096-20974-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548864096-20974-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 08:01:33AM -0800, Sowjanya Komatineni wrote:
> Bus clear feature of tegra i2c controller helps to recover from
> bus hang when i2c master loses the bus arbitration due to the
> slave device holding SDA LOW continuously for some unknown reasons.
>=20
> Per I2C specification, the device that held the bus LOW should
> release it within 9 clock pulses.
>=20
> During bus clear operation, Tegra I2C controller sends 9 clock
> pulses and terminates the transaction with STOP condition.
> Upon successful bus clear operation, bus goes to idle state and
> driver retries the transaction.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  [V5/V6/V7]: Same as V4
>  [V4]: Added I2C Bus Clear support patch to this version of series.
>=20
>  drivers/i2c/busses/i2c-tegra.c | 71 ++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 71 insertions(+)

Almost perfect, just a minor nit:

Please be more consistent with the spelling. You've got all of "Tegra",
"tegra", "I2C" and "i2c" in the commit message. "Tegra" and "I2C" are
the correct ones.

And to clarify, it's fine to keep the lower-case spellings in the
subject because that serves as a sort of tag. In prose, always use the
correct spelling.

With that fixed:

Acked-by: Thierry Reding <treding@nvidia.com>

--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS3JoACgkQ3SOs138+
s6EB6g/+IjKYSnpCAhoigIKxi1yW7e07mlWu62zZXBLdQkEsxQoMFGkr5+0d9FgF
wGR0Uox9v+bPHt3A/A7svqD1o+5b7TFM8jCVAlNepMU81pk12qhU5D6BveZjdTTw
7MT4PIF46AkI0lLbs5wZ8nnkw0Nx1QKoWpUPqnot2AgJGEwQjPHBmRRs+UtgSRam
EugV4SmDXbzkMEBuCI28H0r1JegmVl8HZ/3gKqHPN1EvBUov3F/u5xB3rN8U55Jr
8ZDCbUWMU2nzZzRW/KPmEhQXNH/g6eN2L774gPhddd1RlqZheXxVgk3G+u3OWpVA
XKCeRDH+Sr5vzIN/5nvqKaUiFjdg1gvbF40gmoeWC6HoJ2wxv3ru42xntMC9oph0
eMvSHkk7dfr6U5UntMulBOn5U05ap/b482Ht/NXkqo8rgBznAg9z4Asq+3aaENoK
1nop/WrDuWLmBvmyoJq9E6MCyFXo2mCERUqacYR3rGW6Scjf+UakRzS+YC5ypObP
6yr/aJOjbKc7/21h+lOAiSJXfTh+tpv3iYg6tIndXZaSLarXF1Jk1P2MICC35WCw
NZBvMQCp6d9EtfBCP7g8yJ9zfHVAfBLQpwFDVQ3YRaHIEP5ZOTkuXxWYClOcv/iK
DFEEq6Nl77z3/gMnej+RgNqxdhyjY32cW/aM/bcuuyHiti6qfDI=
=x02l
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
