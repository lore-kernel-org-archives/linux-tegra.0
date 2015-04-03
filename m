From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v2 2/4] staging/nvec: reimplement on top of tegra i2c
 driver
Date: Fri, 3 Apr 2015 21:57:51 +0200
Message-ID: <20150403195751.GD2016@katana>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru>
 <1427745615-5428-3-git-send-email-danindrey@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427745615-5428-3-git-send-email-danindrey-JGs/UdohzUI@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +/**
> + * nvec_slave_cb - I2C slave callback
> + *
> + * This callback fills our RX buffers and empties our TX
> + * buffers. This uses a finite state machine.
> + */
> +static int nvec_slave_cb(struct i2c_client *client,
> +		enum i2c_slave_event event, u8 *val)
> +{
> +	struct nvec_chip *nvec = i2c_get_clientdata(client);
> +
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		/* Alloc new msg only if prev transaction finished */
> +		if (nvec->state == ST_NONE)
> +			nvec->rx = nvec_msg_alloc(nvec, NVEC_MSG_RX);
> +
> +		/* Should not happen in a normal world */
> +		if (unlikely(nvec->rx == NULL)) {
> +			nvec->state = ST_NONE;
> +			return -1;
> +		}
> +		nvec->rx->pos = 0;
> +
> +		if (client->addr != ((*val) >> 1)) {

Uh, I2C_SLAVE_WRITE_REQUESTED should not use val.

> +			dev_err(&client->dev,
> +				"received address 0x%02x, expected 0x%02x\n",
> +				((*val) >> 1), client->addr);
> +			return -1;
> +		}
> +		nvec->state = ST_TRANS_START;
> +		break;
> +
...

> +	case I2C_SLAVE_READ_PROCESSED:
> +		if (nvec->state != ST_RX &&
> +		    nvec->state != ST_TX) {
> +			dev_err(&client->dev,
> +				"unexpected read: state %d\n",
> +				nvec->state);
> +			return -1;
> +		}
> +
> +		if (!nvec->tx || nvec->tx->pos >= nvec->tx->size) {
> +			dev_err(nvec->dev,
> +				"tx buffer underflow on %p (%u > %u)\n",
> +				nvec->tx,
> +				(uint) (nvec->tx ? nvec->tx->pos : 0),
> +				(uint) (nvec->tx ? nvec->tx->size : 0));
> +			nvec->state = ST_NONE;
> +			break;
> +		}
> +
> +		nvec->state = ST_TX;
> +		*val = nvec->tx->data[nvec->tx->pos++];

Are you sure you want to increase the pointer here? Remember that this
byte is requested but might not be sent out if the remote master stops
the transfer after the previous byte using NACK instead of ACK.

> +		break;
> +

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVHvC/AAoJEBQN5MwUoCm2NkQP/jPGcPGkHllFaw/z3D3AEGJM
bCbPmVtWq/5+2rW6J7KnPNknpMyOSI+6Ac2L8F4A6eHxwXXmO7NG1Yi/NVzPtIUw
NTfNhomzKa+9CnmuoMsouythSlANysEk9ZrfKi+/bOCLMU/LRhWxU8Y0EEXRQaJ6
ctas5xVjOVfBbLVpQrOkaBQQ+4QuOaQPgnZBUufMiFYglE/Xjn+V2oCEL4MFBx+f
xVUf+6VjmazoF06j27XXuwa23S00arh/Q7MDxyMCfJcB1cMS+yGGr0mUJuNIpcoa
fnpYryYum/3Sleek86bSMFCpi59sEU9oOmECepZZWg9r2AZ6DJSBN1qVmQi9TpX/
nF2leQS5NWuvb15IP2JpxsloDyRrVG5XbfatJfSHleHmpn0Ykchx3VFtRCW7OdGP
JIh1n6rXIZahzI9CE2fhCfT593HXYx7intpiPm0tRGkbqYBguTb8tUp4vc18al6W
eDo4NFVS/ZH3tmMUaTd88QZ3EIAO9iIqKuGwuYTkS5gs2EiKmqzqDB11kGIsbvc0
MKIE4oxIFaNaSzB6bGH8zPJp5a1wS0Rd811fLozwG2x07V7pAy7boh6TzOEgAzQX
qyu9pe59JZx/VmzizmASND/aryxOvRkcIBWnCQDXqJq7xhOG7h0xQsiAKdhQpODV
2oAO/iGGJ05jPZgycpJ+
=u+wo
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
