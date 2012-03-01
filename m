From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v4 5/9] tegra: i2c: Add I2C driver
Date: Thu, 1 Mar 2012 15:29:08 -0500
Message-ID: <201203011529.11213.vapier@gentoo.org>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org> <1330536689-9121-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2157465.YtJ4YFePuy";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330536689-9121-6-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--nextPart2157465.YtJ4YFePuy
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday 29 February 2012 12:31:25 Simon Glass wrote:
> --- /dev/null
> +++ b/arch/arm/include/asm/arch-tegra2/tegra_i2c.h
>
> +/* Convert i2c slave address to be put on bus  */
> +#define I2C_ADDR_ON_BUS(chip)		(chip << 1)

i'm not sure the desc here is correct ... it's at least a little bit=20
misleading.  addresses are 7bits, and the 8th bit is for telling the device=
 to=20
read/write.  since it only gets used in two places, might be better to inli=
ne=20
the bit shift there ?  hard to say.

> --- /dev/null
> +++ b/drivers/i2c/tegra_i2c.c
>
> + * Copyright (c) 2011 The Chromium OS Authors. All rights reserved.

guess you need to -2012 that now ;)

> +#include <common.h>
> +#include <asm/io.h>
> +#include <asm/arch/clk_rst.h>
> +#include <asm/arch/clock.h>
> +#include <asm/arch/funcmux.h>
> +#include <asm/arch/gpio.h>
> +#include <asm/arch/pinmux.h>
> +#include <asm/arch/tegra_i2c.h>
> +#include <fdtdec.h>

needs to include i2c.h to make sure your local defs stay inline with the=20
prototypes everyone else is using.  also, asm/* generally should come last =
(so=20
after ftdec.h).

> +static int send_recv_packets(
> +	struct i2c_bus *i2c_bus,
> +	struct i2c_trans_info *trans)
> +{
> +	struct i2c_control *control =3D i2c_bus->control;
> +	u32 int_status;
> +	u32 words;
> +	u8 *dptr;
> +	u32 local;
> +	uchar last_bytes;
> +	int error =3D 0;
> +	int is_write =3D trans->flags & I2C_IS_WRITE;
> +
> +	/* clear status from previous transaction, XFER_COMPLETE, NOACK, etc. */
> +	int_status =3D readl(&control->int_status);
> +	writel(int_status, &control->int_status);
> +
> +	send_packet_headers(i2c_bus, trans, 1);
> +
> +	words =3D DIV_ROUND_UP(trans->num_bytes, 4);
> +	last_bytes =3D trans->num_bytes & 3;
> +	dptr =3D trans->buf;
> +
> +	while (words) {
> +		if (is_write) {
> +			/* deal with word alignment */
> +			if ((unsigned)dptr & 3) {
> +				memcpy(&local, dptr, sizeof(u32));
> +				writel(local, &control->tx_fifo);
> +				debug("pkt data sent (0x%x)\n", local);
> +			} else {
> +				writel(*(u32 *)dptr, &control->tx_fifo);
> +				debug("pkt data sent (0x%x)\n", *(u32 *)dptr);

generally inlining these types of bitsized casts are discouraged ...
=2Dmike

--nextPart2157465.YtJ4YFePuy
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPT9wWAAoJEEFjO5/oN/WBDecP/jcmc4aSQcYlzlgA+iunffqL
49s5F6z2ZO9lWzkaIn7Qb6UbyD94Js7rdDuQPkV+6DRVx7udQ2u3QuHWr/f2QuP0
r6EvkXUoKIS64ANz/FDxLGTM4fjkCgOCCMBmwtBQyg852fRm4OtOzHm2pB6UcZje
nJiYlyMLpyXL+Qr1MOil0SynZHeqqcghUH6SzqyyExOmNC3AR6hS3Q+ZTXTZGfNN
n74VAiU5jZV8i4zmenIrN9m3cPmqxQp6iXPaAgisPajpqHe8QXofZwGsImt7l2GR
cm5ZRIox++eWniUp0dperiFpy9POjAlg5m5l0+4nHff5259GjU9H7C9myeNKZY3l
cPtVgOozDfv5iLuwtyJmCNOCqGvfwCTQoa5WQXefUIRlDsv1wVQo8/TVNIwJBdOB
xUDlI16hYoGKxLmXYQQmfk3KFrAAbRK8VFUDAbNqacQurAkjBLdlAwjzMu95lQR4
tr9Q/gd6jc7HXDM3FCqB/5pr5B2HCtZ1SvNAEkAx99U6dEz4MQASCM1M8PIKQQaL
c5LgCj2+aO3e+MA3kd9dgG4rABYZDqKGNELFNtCoYjpqTGO7Yk7uj0bcYvmbfipe
7iQ4CGscufF3ixp+n/tjAhMkavldSRJUTlvnf8sEhwVNv8ksHQLRgdfONuQ9n0BB
BWsiXhiwWUSprBiFGn5o
=a1Im
-----END PGP SIGNATURE-----

--nextPart2157465.YtJ4YFePuy--
