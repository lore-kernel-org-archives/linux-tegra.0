From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v3 1/4] i2c: tegra: implement slave mode
Date: Fri, 24 Jul 2015 12:52:51 +0200
Message-ID: <20150724105251.GA22787@katana>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru>
 <1437424546-30405-2-git-send-email-danindrey@mail.ru>
 <20150724092720.GA1597@katana>
 <55B210F4.6030700@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B210F4.6030700-JGs/UdohzUI@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> At the begin of my work on this patchset I even denied clock disable call if
> slave is registered (to minimize code that can affect transfer).

I hacked something like this, but it seems it was not enough.

> If only slave mode is used, then this logic is not needed.

This is not sufficent. We shouldn't break being a master only because we
also listen to a slave address (as long as the HW supports that of
course).

> tegra_i2c_init is called on probe and resume. Also it is called in case of
> xfer fail. If xfer is ok, then I think slave addr must be kept unchanged.

This is fragile. Try scanning the bus with i2cdetect and slave setup
will be gone.

> As far as I understand it is a loopback mode. Probably it will not work
> (Stephen Warren already mentioned this).

Just to make clear: I am not saying we should support talking to our own
slave address. But it should still be possible to communicate with other
remote devices on the bus.

Thanks,

   Wolfram

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVshkDAAoJEBQN5MwUoCm2vmMP/RZUx8/DLXE5UMuaB99DvRhL
1cNi9OIlisLyDHWccWXM2bXnfEaaKwQsCYXeL9q30mM6kcjqvEnjcDwuLYexVNf6
NrSe2XgxfN9b48KmVpxCsRcedpZvG5diSn/EUlyAL8hoi6FJIwRKopCeG2HwEsGN
TNgOw3NRxPlgv4rfzMWg/+2b7sYK+CbIcUjh51o36Iz3L4xuWmOFj2M4ic7d9qZi
F/mj9NGsgP9Jkwgp+ebOErNuol7oK/64t3jyYdjhhoHZhU71xh8AyvY8EG0jNUBm
v/EpCby1pPUTjxgzDAe3t317s5J78qn71S++FHaRU31QhOmyfcZctgbOBEJTfjrf
PvKNb07srcZ4KEmSVQTVv1XLxTdnHz6pqIqCoX+41XFxcUMzMUVaLkQpL3gbjCqN
wp2OSCfRepKMg8mTo2tNq95Z8iV7/BpWlB/i36gdJEOL7l9QnKq+9YVhpweKMSH+
ylaOBkyT+7hdEsn+R2V8dfGPWnPzWEi2Y8fIBhWZjgL5fE08AxEHmWCc+k5QK6/D
fARcLI+rPhV2fR9KjE0tT5oeCI9NTpkd/5TXFXxGHxKrvVp61+WBot2W2076V/Ur
h4Vs9xIk99nZbnfRX0P3UXVPOEmZib0KNQyHFMiFtFp7DVe6Qjjf27NLB7dwNfxx
RCnffRehdQBjd8yU0cc/
=NVew
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
