From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 01/17] irqchip: tegra: do not disable COP IRQ during
 suspend
Date: Tue, 18 Jun 2019 12:58:57 +0200
Message-ID: <20190618105857.GD28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:15AM -0700, Sowjanya Komatineni wrote:
> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>=20
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
>=20
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Iw/EACgkQ3SOs138+
s6GLLRAAvKzInFHRhecpwNZPDwkUnBKfQIyiErHNkSUfLXJP6QSIaQa+BCBJuoNf
BTxROMwnCIJebjytKZIoLlNjND82Hk/5NDNhjivrBhsXVdmL4vCnlwFNSCQNEqbi
Hp2iVP/LtvGNaeG2Wrp3UD8bA7w4Qb94jXItmE2iwLfCaJV+7myCiySGJea3CTqQ
p7PCgu0joBLlfFG9nYE/JA+VAZPSi+IV7mCvyWquvVV7nfca1Cjfje1FcJDn08YI
eTMxfqj+hSUrmYadTXgqERUoZOPHjaQ/TGTyTsyWKsFvR/zTB9PNZpzo7o7wOnik
0ph9gZo4LKY88tSzdK9AM+r3F5sMQCXM8WAETePUrrADLLRUEQvnTKeG3tJvaIRB
Zk1WbiJIXH7K54epAeuLnu4zHFj5XFaDs4orPkXhF36d1BouB01KZ9KytMnnrRUv
tIVMGNDFuYV77jKUdAVUl0qBoZmFaYDW+WfGfassadJEpgJDNR4SgkhJZrq2O0VF
3J2mc8k0frM0EPbtldLOpAMGJbAbchHFKd51mRxVNBLYFzA9N8N+d6oC15ZIpBKN
iiM35hN9xskQpJdZJYsNBISdEW8+9AcODhhY8FrD6B8IvV4wPaTvmdAj+NhI17As
M1P9Sm4OTVElx0ApVdGLDdDir6s/I5CiErAqXEQejQKlmMbAxnI=
=NwCH
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
