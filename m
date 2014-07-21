From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: tegra: Convert PMC to a driver
Date: Mon, 21 Jul 2014 15:39:43 +0200
Message-ID: <20140721133942.GK15238@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <111661024.qGiugVUugr@wuerfel>
 <20140717110652.GA18383@ulmo>
 <6373493.kzO00ziuYq@wuerfel>
 <20140721131233.GG15238@ulmo>
 <20140721131619.GE12921@htj.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uuKVzAmB+c+zQlhu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140721131619.GE12921-Gd/HAXX7CRxy/B6EtB590w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--uuKVzAmB+c+zQlhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 21, 2014 at 09:16:19AM -0400, Tejun Heo wrote:
> On Mon, Jul 21, 2014 at 03:12:34PM +0200, Thierry Reding wrote:
> > Adding Tejun, since he took this into his tree on Friday I think, just a
> > few hours after I sent out pull requests for this.
> >=20
> > I hadn't considered this build dependency. We could resolve this in two
> > ways I think:
> >=20
> > 	- merge the for-3.17/fuse-move branch from the Tegra tree into
> > 	  the libata tree and apply Arnd's patch to the libata tree
>=20
> I can pull the tegra tree into the libata if the tegra maintainer is
> okay with it.

It's fine with me, but maybe give Stephen, Arnd and Olof an opportunity
to object.

If you plan to go ahead with merging it in, this would be the right
signed tag to use:

	https://git.kernel.org/cgit/linux/kernel/git/tegra/linux.git/tag/?id=3Dteg=
ra-for-3.17-soc

And then you simply need to replace #include <linux/tegra-powergate.h>
with #include <soc/tegra/pmc.h> as Arnd showed.

Thierry

--uuKVzAmB+c+zQlhu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTzRgeAAoJEN0jrNd/PrOh+pAQAKHFiRiORAb6IAdn/2V75ozq
5dxNSAzFpEGFo73sRvWUuwzYFhdahNWNlafYy7ySmemWxo6gGsDsfjNcU8tzGCKY
bahsFTJB4BI3+ATS7JFbLj7jERN2S3RpjMr1LSkF4ykYl5fHBijAn9Q97SYQBnDK
2Y5K9h/Ap48b0GfSBkXWGaUbEPhK1oLiiP7kmIF1uxeIDNiBS+pu051IPejJTX04
8PSHdsVi3IBbpOWOg3Ib3CeZkHGak6TmoqvIcZ7cKwc/b5SmyvBukDx/mj4AsNW8
lbMtmw3NnUPivqNeivYfMmKT3XaLUGg1nAgMrw4uM0cKdJW0TQPpwm87uZN13A2X
vgWPl/TXvITK3H453U8IQyA9VBeru+kIR5ErP9mIgsorenv/ZsSsIRT4KfXNBMnG
gwUTUwV20OE3YMpVhROanK3jfrV8UHxvvja3r1wO0nf2uzf7TVIV5OsDEefI7Z4P
6WDrXVa4PooxcIvZRHgy21MHFVJSQ0wj2tIyqFso56QNfBKkD/HLI/GeXo2bnHug
bXjyUdUpQW6BSQvTFwVFv5WsG5Nlbt0eAlMSyjmbPIDPS9nuHhImrRnLrYHDn5AC
Ww8V8JRQS+cJ4ulHPc+P3jlnkTRyMpqW39Jij7gp41ZX5Yg2g6baR5oJ+H1aEwU+
TzjBUVpPpWtoKmqnDtEu
=bg0y
-----END PGP SIGNATURE-----

--uuKVzAmB+c+zQlhu--
