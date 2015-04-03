From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 1/4] i2c: tegra: implement slave mode
Date: Fri, 3 Apr 2015 21:46:26 +0200
Message-ID: <20150403194626.GB2016@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <1427745615-5428-2-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427745615-5428-2-git-send-email-danindrey-JGs/UdohzUI@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +static void tegra_i2c_slave_write(struct tegra_i2c_dev *i2c_dev, u32 val)
> +{
> +	i2c_writel(i2c_dev, val, I2C_SL_RCVD);
> +
> +	/*
> +	 * TODO: A correct fix needs to be found for this.
> +	 *
> +	 * We experience less incomplete messages with this delay than without
> +	 * it, but we don't know why. Help is appreciated.
> +	 */

Uh oh. So I assume this is another reason for staging?

> +	if (!i2c_dev->slave || !i2c_dev->slave->slave_cb)
> +		return -EINVAL;

The core checks for slave_cb being valid.

> +		i2c_slave_event(i2c_dev->slave, I2C_SLAVE_STOP, &dummy);

You could use value here, too, or?

> +	if (!tegra_i2c_slave_isr(irq, i2c_dev))
> +		return IRQ_HANDLED;

Minor nit: I'd prefer == 0 here, since it reads "if not slave_isr return
handled".

> +	if (slave->addr > 0x7F)
> +		addr2 = (slave->addr >> 7) | I2C_SL_ADDR2_TEN_BIT_MODE;

Nope. There are 10 bit encodings of addresses 0x000-0x07f, too. So, you
need to check for the flag (slave->flags & I2C_CLIENT_TEN).


--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVHu4SAAoJEBQN5MwUoCm2PUEQAIxJZ/wIXpg8wHVeqEBNcFxx
I6JTL0zOs5vNHqXef4vxjyXXzpnrPYp1wB2fqCDYsAN94d0msEven4knlxPZLT1b
hV3hRmVwnsT0tIyhMoVPvva2MWFB5dwm6tDwy9h6MkEbqKfsjcJ5EygTEHfnX2MD
pEeppoMYZjo/ABkKkSdPPGrDggxEXekShxMEsjXKtn6qMglEJHBB4U5oS/J48gFP
9+XqVJRqIQw2D9azEUJzSEYZ1Z8ouVjelBlvqL6WOwqr7E3IbE+RweYkZah8o5GD
vnKNpoNMzIY8AQ67WHJ/z+dge7oJtm5muTIdD72AEnOqo1aO7yTbljGzFqkrc5UK
Os7YzlCQGAxiU83+xjYKpa3RleBDan0JqWiaB2StOcZuFeSe9XJqJ2i7cES8guuU
YqXjWvcTzBc3f0zyF6qjcOpzFUWapMycmzZ8vamsmVN1UnN7ypjcKrpsPP60vy/X
g7EW2CL2pbA+bwDgvIPj7Cb3dMs+s2E4l/bMtPVbfDGq/vRnhWsO3Sim4kk3eGbt
+JTS8y2HYIfxOShpR5HHvDBqkcYgp2P4iHTXofKn3VG+YJjxTfKQBjUlP80XScsz
glaojH0/PzmFEiHgmuQD2/HKu3Xu/46LKxcEEcS32cURJNW5gU6yNRHLAv4s1J7z
q0JmaYqBo5B/F7u8Q8bk
=tgej
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
