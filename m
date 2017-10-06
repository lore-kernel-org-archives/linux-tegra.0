From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked
 infrastructure
Date: Fri, 6 Oct 2017 13:11:19 +0200
Message-ID: <20171006111119.GC22706@ulmo>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com>
 <20171006110749.GB22706@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171006110749.GB22706@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2017 at 01:07:49PM +0200, Thierry Reding wrote:
> On Thu, Sep 28, 2017 at 09:22:17AM -0500, Grygorii Strashko wrote:
[...]
> > - all GPIO IRQs mapped statically
>=20
> This series predates your work on the dynamic IRQ mapping, so I hadn't
> picked up those changes. This should be easily solved by the attached
> patch, though.

Here's the patch.

Thierry

--- >8 ---
commit 139c254bf963bf373d83970e530a56599f1832cc
Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Fri Oct 6 12:12:27 2017 +0200

    fixup! gpio: Implement tighter IRQ chip integration

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b3bd19b793d3..2e450afe61b3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1708,9 +1708,23 @@ static void gpiochip_irq_relres(struct irq_data *d)
=20
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
+	unsigned int irq;
+	int err;
+
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
 		return -ENXIO;
-	return irq_create_mapping(chip->irq.domain, offset);
+
+	irq =3D irq_create_mapping(chip->irq.domain, offset);
+	if (!irq)
+		return 0;
+
+	if (chip->irq.map) {
+		err =3D irq_set_parent(irq, chip->irq.map[offset]);
+		if (err < 0)
+			return err;
+	}
+
+	return irq;
 }
=20
 /**
@@ -1856,27 +1870,6 @@ static int gpiochip_add_irqchip(struct gpio_chip *gp=
iochip)
 		gpiochip->irq.nested =3D true;
 	}
=20
-	/*
-	 * Prepare the mapping since the IRQ chip shall be orthogonal to any
-	 * GPIO chip calls.
-	 */
-	for (i =3D 0; i < gpiochip->ngpio; i++) {
-		unsigned int irq;
-
-		if (!gpiochip_irqchip_irq_valid(gpiochip, i))
-			continue;
-
-		irq =3D irq_create_mapping(gpiochip->irq.domain, i);
-		if (!irq) {
-			chip_err(gpiochip,
-				 "failed to create IRQ mapping for GPIO#%u\n",
-				 i);
-			continue;
-		}
-
-		irq_set_parent(irq, gpiochip->irq.map[i]);
-	}
-
 	acpi_gpiochip_request_interrupts(gpiochip);
=20
 	return 0;

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnXZNcACgkQ3SOs138+
s6EhvRAAvG5FeT69BX+xWE/aw2i1hofExuNOt2A+PZOGulwoOOcU9mhVjjO8jCZc
RYu98ba1GHprud6JItNSENDVMqEhd4qWX3HVewYg/uFiHFqQgxuruqNrHpMpmI4R
4Z7adscjHH6ow/7WmtkMqucblCZ9lqbaSEPW3+vq+tbX26I3vcBE6dF/eScHu/uU
v+0SGZiTa1VJ4TLfpT5wljsRJ69NhfuN7RUu4lP701ClraAEOUNlpHr/kATn5pf5
IZpAXX4Qt/wHL/LfEmU98Hd2106tIHgaf+Lbpnz/vTB6lwngpKBAHNE5PncI4IZX
9ai5hLgPoj1glYBQcn/SRJ7bo5lFZWyUHtIIGPeoEWobxp/0fJfbfGo/H3sHoNuP
FjOvFlBeHnpXTar1/ImTSgR2OZ1BetqHRAUYVUWQ+XkMQXHCH6ZuYFp6EjLUxemW
y1eoWMbVWuYvqZuILB6gynO8tThs1XmV9PrHilr3FhiAZutmMeSGw5HxXnpXvycS
++JfdBQA1NNHJC7BIZrmmtC42Tzrb0ED3fu2InqTU9KXuhJc3u1ne5yyK8DOym33
dt5nG6H8C6qEoCt+dNqQxfXkpS7nV6Ib31KeMGaCzBiTHDKS31D6bv+2jcBRR5oB
RIO9eSFGTHqnyuCCBy4OtQ+UYXoG1RAhB2MpFX7ARXjDxeELd+8=
=OwYr
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
