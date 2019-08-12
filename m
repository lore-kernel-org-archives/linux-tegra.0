From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 10/21] clk: tegra: clk-super: Add restore-context
 support
Date: Mon, 12 Aug 2019 11:55:00 +0200
Message-ID: <20190812095500.GI8903@ulmo>
References: <1565308020-31952-1-git-send-email-skomatineni@nvidia.com>
 <1565308020-31952-11-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hABqaeELJqnDDeDE"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1565308020-31952-11-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--hABqaeELJqnDDeDE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 04:46:49PM -0700, Sowjanya Komatineni wrote:
> This patch implements restore_context for clk_super_mux and clk_super.
>=20
> During system supend, core power goes off the and context of Tegra
> CAR registers is lost.
>=20
> So on system resume, context of super clock registers are restored
> to have them in same state as before suspend.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-super.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--hABqaeELJqnDDeDE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RN3QACgkQ3SOs138+
s6FHwRAAnYt3bQr8qabJpmuLiAWddIRGpf0XzLDW6DnRqSmhENAKH09BCH1IJ8bO
RNFI+6CZYoGt38zjU54qQxf2BGFSW1q/63T/+CU318zZ1oUws+0iWQrFPKHIxnS7
Rae4YsOE1UqTucB/uwniVcDVTGTcMmDKx9lA+WgMTcNyRcMFYuKhPjV0BL34Kq+5
2JA7MaqNqrBKSwVqOlN2kAjqa5NOUq57c8MbQ6/blbGQsdgnDrWt9TDR4s3cifCc
tu9HdlV5921/RAP42V2+oCnHnYMNvGAre7Z3ES5GZ0z5DdW48koDA99XexftElaT
+KCuXTdOUrv8Y5x6PQ5MwCxnXqqayjz+4c3v8ahygNBV8K159Kkokt2c8NR6Igbt
Mz403frb3Hp3qstDs6HfvYCsuNFmTmB+/Lhp8xciVyEiuv26CPNXg+OL7rRfJtc2
hQy6RcFw4D8uYRcOS7rkH5m2rot8R59tK+2QqSEIgMlYbNtDuciS/5r83/ro7516
tTMbjYdQWRlrFELVTzmjIQtE2i5PJ4uq8VJsbXOGlx0ESmQIwNcxdwe2nBH6vrSY
7kFuBQvOBTMv7bUvHY4/M+yhZLHOIC77Z/vYPh58Yl8JwxFTu1RNT7esQUcMyJfD
i1u4z1VztUimQjiojE4eGV8tkO6K6f38N0lz1R8T/MyOOOf67TE=
=5pWj
-----END PGP SIGNATURE-----

--hABqaeELJqnDDeDE--
