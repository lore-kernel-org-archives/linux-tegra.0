From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 5/6] ARM: tegra: nyan-big: Proper pinmux for TPM i2c
Date: Wed, 25 Jan 2017 12:16:29 +0100
Message-ID: <20170125111629.GI9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-5-contact@paulk.fr>
 <20170125110644.GF9344@ulmo.ba.sec>
 <2710b1a1-eab5-0a0d-657f-e6bc9b5cefaa@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1E1Oui4vdubnXi3o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2710b1a1-eab5-0a0d-657f-e6bc9b5cefaa@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Mikko Perttunen <cyndis@kapsi.fi>, Peter Rosin <peda@axentia.se>
List-Id: linux-tegra@vger.kernel.org


--1E1Oui4vdubnXi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 11:10:56AM +0000, Jon Hunter wrote:
>=20
> On 25/01/17 11:06, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Sun, Jan 22, 2017 at 04:47:52PM +0100, Paul Kocialkowski wrote:
> >> This corrects the pinmux for accessing the TPM over the i2c line.
> >> Thus, it allows correctly probing the module, that previously failed w=
ith i2c
> >> errors.
> >>
> >> Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
> >> ---
> >>  arch/arm/boot/dts/tegra124-nyan-big.dts | 20 ++++++++++----------
> >>  1 file changed, 10 insertions(+), 10 deletions(-)
> >=20
> > I've applied an s/i2c/I2C/ in the commit message and applied this. Can
> > you also make sure that these changes go into the nyan-big configuration
> > of the tegra-pinmux-scripts[0]? I know Stephen wants to keep those in
> > sync with the DTS.
> >=20
> > Thanks,
> > Thierry
> >=20
> > [0]: https://github.com/NVIDIA/tegra-pinmux-scripts
>=20
> Looks like it has already been changed ...
>=20
> https://github.com/NVIDIA/tegra-pinmux-scripts/commit/5049f75b3099515ffb7=
f064dcf23568c17aecb01

Excellent, no need for any further action then.

Thierry

--1E1Oui4vdubnXi3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIiQ0ACgkQ3SOs138+
s6FNSA//RprzIMg/gwIRZGTVR+R6ePF0gmlikWBVy1/H+R0FweZITFB3Z1Cr7AqN
5RlbSrR+kSn8VgaENtj/VtYPSJI7VKs0663x5XNK+MSpirDG0gM+cWA+5LVYkxfE
8qCbcRRxK6cPq0u0r2Z6r2JnQINI9FihjIXJGrDOXzo2pVLmNKqIlTrThPzeeKiG
PTU03PsJqPlfIoWUrMIIYbDOECASQsvVEHHwvKIaGf2UU4mZn4WA/d5YGx2TjSGf
RU/PFcDp62dDt8R0Goxe/mRDd2VXkRIvKCacQzhH3LWp66P67JOtgxkXZse6m59g
xKfIxwr6qzM2J9zPRAM+gi9jVVENE0/PSymIGHNGjNcONCTg1ifkBqkoERDbW/Np
+YzumnbrVfyUON7MbdhEKj3pOjI+SDuEjet7ZtVWcicEigV34nUYUuYXFcNMr+os
MXp1vXcrL/SIEbnFkLzDPqgiZ9sqFvYJp8F2IVy/X0CI9dQC59lOPQvFB+c09QVe
7/lcETyzKhgLPY1GtZJdMMj0ZEHoo7ERFH4mILYpjazPFQx0nc/S2v5eQJEBnZ+R
fo6BTEC49K55U66AFtoNTlvbcH7gvxKKWt2Sr8nEQN2ldiwU/XoKxf5Hs0dNpTou
VOeHZ53nx0wJ2tVJuXWOwbDYx9CyBkpV0EOnrwdBRT6BbizvM2k=
=rIQz
-----END PGP SIGNATURE-----

--1E1Oui4vdubnXi3o--
