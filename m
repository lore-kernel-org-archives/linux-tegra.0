From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: tegra124-apalis: convert to SPDX
 license tags
Date: Wed, 17 Apr 2019 10:54:54 +0200
Message-ID: <20190417085454.GD26626@ulmo>
References: <20190410071007.13276-1-igor.opaniuk@toradex.com>
 <20190410071007.13276-2-igor.opaniuk@toradex.com>
 <D9979557-09AE-4EEB-8524-437E630E339C@ziswiler.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <D9979557-09AE-4EEB-8524-437E630E339C@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-imx@nxp.com, jonathanh@nvidia.com, festevam@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, marcel.ziswiler@toradex.com, stefan@agner.ch
List-Id: linux-tegra@vger.kernel.org


--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2019 at 08:13:51AM +0200, Marcel Ziswiler wrote:
> +// SPDX-License-Identifier: (GPL-2.0 OR X11)
>=20
> I believe the parentheses don't really server any purpose here. With that:
>=20
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> On April 10, 2019 9:10:07 AM GMT+02:00, Igor Opaniuk <igor.opaniuk@torade=
x.com> wrote:
> >Replace boiler plate licenses texts with the SPDX license
> >identifiers in Colibri/Apalis DTS files.
> >
> >Signed-off-by: Igor Opaniuk <igor.opaniuk@toradex.com>
> >---
> > arch/arm/boot/dts/tegra124-apalis-emc.dtsi | 39 ++-------------------
> > arch/arm/boot/dts/tegra124-apalis-eval.dts | 40 ++--------------------
> > arch/arm/boot/dts/tegra124-apalis.dtsi     | 40 ++--------------------
> > 3 files changed, 6 insertions(+), 113 deletions(-)
> >
> >diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> >b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> >index ca2c3a557895..36211f876e33 100644
> >--- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> >+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
> >@@ -1,42 +1,7 @@
> >+// SPDX-License-Identifier: GPL-2.0 OR MIT

The old text below says that this was supposed to be GPL-2.0 OR X11. Do
you want me to fix that while applying?

Thierry

> > /*
> >- * Copyright 2016 Toradex AG
> >+ * Copyright 2016-2019 Toradex AG
> >  *
> >- * This file is dual-licensed: you can use it either under the terms
> >- * of the GPL or the X11 license, at your option. Note that this dual
> >- * licensing only applies to this file, and not this project as a
> >- * whole.
> >- *
> >- *  a) This file is free software; you can redistribute it and/or
> >- *     modify it under the terms of the GNU General Public License
> >- *     version 2 as published by the Free Software Foundation.
> >- *
> >- *     This file is distributed in the hope that it will be useful
> >- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >- *     GNU General Public License for more details.
> >- *
> >- * Or, alternatively
> >- *
> >- *  b) Permission is hereby granted, free of charge, to any person
> >- *     obtaining a copy of this software and associated documentation
> >- *     files (the "Software"), to deal in the Software without
> >- *     restriction, including without limitation the rights to use
> >- *     copy, modify, merge, publish, distribute, sublicense, and/or
> >- *     sell copies of the Software, and to permit persons to whom the
> >- *     Software is furnished to do so, subject to the following
> >- *     conditions:
> >- *
> >- *     The above copyright notice and this permission notice shall be
> >- *     included in all copies or substantial portions of the Software.
> >- *
> >- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> >- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> >- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >- *     OTHER DEALINGS IN THE SOFTWARE.
> >  */
> >=20
> > / {
> >diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts
> >b/arch/arm/boot/dts/tegra124-apalis-eval.dts
> >index eaee10ef6512..e2388368d635 100644
> >--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
> >+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
> >@@ -1,42 +1,6 @@
> >+// SPDX-License-Identifier: (GPL-2.0 OR X11)
> > /*
> >- * Copyright 2016-2018 Toradex AG
> >- *
> >- * This file is dual-licensed: you can use it either under the terms
> >- * of the GPL or the X11 license, at your option. Note that this dual
> >- * licensing only applies to this file, and not this project as a
> >- * whole.
> >- *
> >- *  a) This file is free software; you can redistribute it and/or
> >- *     modify it under the terms of the GNU General Public License
> >- *     version 2 as published by the Free Software Foundation.
> >- *
> >- *     This file is distributed in the hope that it will be useful
> >- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >- *     GNU General Public License for more details.
> >- *
> >- * Or, alternatively
> >- *
> >- *  b) Permission is hereby granted, free of charge, to any person
> >- *     obtaining a copy of this software and associated documentation
> >- *     files (the "Software"), to deal in the Software without
> >- *     restriction, including without limitation the rights to use
> >- *     copy, modify, merge, publish, distribute, sublicense, and/or
> >- *     sell copies of the Software, and to permit persons to whom the
> >- *     Software is furnished to do so, subject to the following
> >- *     conditions:
> >- *
> >- *     The above copyright notice and this permission notice shall be
> >- *     included in all copies or substantial portions of the Software.
> >- *
> >- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> >- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> >- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >- *     OTHER DEALINGS IN THE SOFTWARE.
> >+ * Copyright 2016-2019 Toradex AG
> >  */
> >=20
> > /dts-v1/;
> >diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi
> >b/arch/arm/boot/dts/tegra124-apalis.dtsi
> >index 13c93cd507d8..690f881ea9cb 100644
> >--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
> >+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
> >@@ -1,42 +1,6 @@
> >+// SPDX-License-Identifier: (GPL-2.0 OR X11)
> > /*
> >- * Copyright 2016-2018 Toradex AG
> >- *
> >- * This file is dual-licensed: you can use it either under the terms
> >- * of the GPL or the X11 license, at your option. Note that this dual
> >- * licensing only applies to this file, and not this project as a
> >- * whole.
> >- *
> >- *  a) This file is free software; you can redistribute it and/or
> >- *     modify it under the terms of the GNU General Public License
> >- *     version 2 as published by the Free Software Foundation.
> >- *
> >- *     This file is distributed in the hope that it will be useful
> >- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> >- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >- *     GNU General Public License for more details.
> >- *
> >- * Or, alternatively
> >- *
> >- *  b) Permission is hereby granted, free of charge, to any person
> >- *     obtaining a copy of this software and associated documentation
> >- *     files (the "Software"), to deal in the Software without
> >- *     restriction, including without limitation the rights to use
> >- *     copy, modify, merge, publish, distribute, sublicense, and/or
> >- *     sell copies of the Software, and to permit persons to whom the
> >- *     Software is furnished to do so, subject to the following
> >- *     conditions:
> >- *
> >- *     The above copyright notice and this permission notice shall be
> >- *     included in all copies or substantial portions of the Software.
> >- *
> >- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
> >- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> >- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> >- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> >- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
> >- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> >- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >- *     OTHER DEALINGS IN THE SOFTWARE.
> >+ * Copyright 2016-2019 Toradex AG
> >  */
> >=20
> > #include "tegra124.dtsi"
> >--=20
> >2.17.1
>=20
> --=20
> Sent from my Android device with K-9 Mail. Please excuse my brevity.

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly26dwACgkQ3SOs138+
s6Hjaw//VG5dO76fAP66j5JbWJnbPXfN6C9z+QIQpJhh1PhFbdYIaFgCIjog/u30
gnwtJDr3xdNTjTFFcpwbTc+Nkg1S1wvNy6IuUEuJ/sY3JwMSMynD35dIpIjhK7FK
xcJvXU9NQWRW+dPj0rcXgWzBoDqd7Z4V6hegLoI5+MfZa7yBFtnAf7TvCG92Fr46
OOoQb9QhuWUoKSAztR2TVAp11uv/4Ebg/cz3XukWZSiS3vf6a86mOuNIFiIz/wHB
W5xs7nNnQvOYj39ZtoKNVzw3zu7oPzrrtJXehelZNLX5WWZ0ww4zm5RbsM5ZVmwI
ETb5wjTTldM9lJm1ZcH0+udWllb1b8zZOYVCzTQHemy0UKMHphzq8kUqzmJGGx/5
/V8mH7QkhTfeScHvm/8xH4NMs+XEiy8dmxNzM4VHA5UR6kPnjh4P9vRgef7HGgHF
hu6/EOcPlTAJ8y802adopPr20MIMg2Yxi0xSbbqfhPfbmTuypAQP/Izr9vfxUP0A
9lx/IST5liVY4ajuALQhgPNKBakTs6fAe+Bh4NmQ7ow6QyNmN0VquTJrpKagWKmD
/cgTl1jULKz/cQwL/TWd9zRXlClDRfHeaLiZRvQvxPxAp/Ckz/HiyatEh7bsERP1
fUZfCRxxELiD+uVuGXIppM6LUKFTNGjxMDViEGb1Ys5pQyJ/OoU=
=KySC
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
