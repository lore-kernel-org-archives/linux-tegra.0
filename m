From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 07/12] dt-bindings: i2c: Add support for 'i2c-bus' subnode
Date: Tue, 28 Jun 2016 23:32:16 +0200
Message-ID: <20160628213216.GA1598@katana>
References: <1466697545-11868-1-git-send-email-jonathanh@nvidia.com>
 <1466697545-11868-8-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466697545-11868-8-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> For
> example some Tegra devices have an I2C interface which may share its
> pins with other devices and to share these pins subnodes for
> representing these pins so they have be shared via the pinctrl framework
> are needed.

I think the above sentence is hard to grasp. Can you split it into more
sentences perhaps?

> +- i2c-bus
> +	For I2C adapters that have child nodes that are a mixture of both I2C
> +	devices and non-I2C devices (such as a pin controller), the 'i2c-bus'

I suggest to drop the phrase in the paranthesis. It is true for your
case, but I don't think it's generic. So, it is not an obvious example
like "Yes, sure, I see that a pin controller has I2C nodes and non-I2C
nodes". At least for me, it was more like "It has what?"


--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcuzfAAoJEBQN5MwUoCm228UP/3qfvgbeEpYJsY8IWqlouStk
pIA9GK1ohUeiW1yx415X/TSw+e8ZBDoe4Dt5gZck8o5pdsayTuETPQJz4xuplllI
3lpB6FJnzz8Y6AciadXGwYFQ2BFh5WtcLdpj766K4tucUCd5Frc8U/n1lW5GZtzC
okaw/+uDptfry7zNtFoIJ8Bd0zsPTv3qq6V0pIihQf68sWSjsGf6UAALw4h6/NQv
c5jzagY9/KWcXlONy2tbTheuNWaRIMdVbIDdpgnjQ7HCFZ8WZPCJ3M5suq03s6G4
qKsXxDd5liYCGzdh50+JebYie3bGsFFzYc4vl3KRhy8KP60JmSQMg+qLVPIq23FF
Y47ST152QfWW603Z/52KAA7xBUB+x7CCqgaMg63VCh3yP/sP3hZwydg2VTFnR/+e
XpD1hGBYrws6lEWZ1DGxePjqrP9rU8Q/LkEPYaUmCXxmpLnqgt29xx9Dlr13gVVZ
P/WKQPnr4c+DAVxZWz7R5S0AN3vRc10OBJJM6N/iUxfRp0CTfKPbmabFKiurkS6i
C7yxWqY6v1cKheCmBKbMVXK4J+aIF31CuRoaAbKJ3QHN3EJYniIDwxHEosIG/Vjt
NGlrmPFjqNTzb1pIIlat9xz95xo0hTRo2FsCe/63SWQ6qnBatCY//AGxMSDeqYPJ
Pij2zn7th0hdPl1A+HEQ
=P/gx
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
