From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/12] soc/tegra: Add efuse driver for Tegra
Date: Mon, 10 Nov 2014 16:10:11 +0100
Message-ID: <20141110151009.GA13447@ulmo>
References: <1405080971-7609-1-git-send-email-thierry.reding@gmail.com>
 <1405080971-7609-6-git-send-email-thierry.reding@gmail.com>
 <20141019031241.GA18880@tiger>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141019031241.GA18880@tiger>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2014 at 11:12:45AM +0800, Shawn Guo wrote:
> On Fri, Jul 11, 2014 at 02:16:04PM +0200, Thierry Reding wrote:
> > diff --git a/drivers/misc/fuse/Makefile b/drivers/misc/fuse/Makefile
> > new file mode 100644
> > index 000000000000..0679c4febc89
> > --- /dev/null
> > +++ b/drivers/misc/fuse/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
>=20
> I just happened to notice this change on linux-next introduced by this
> patch?  It's a leftover from early version of the patch, I guess?

Indeed so. I've sent out a patch to fix this.

Thanks,
Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUYNVRAAoJEN0jrNd/PrOhK7UP/22Ui1YTJK7lK7+t0SrLcIAM
tTGEsub/0Wr2kbv+thQh+gjb4t6tIGepBoUHe7p6Pc0sFN00HD02SPQzJyIC2GuZ
dCqGXR1jzMB+UMGMcN9QAwh6uzsnES2Xow0iEyV2QnsrEMcPDyy9L635PUHpn7Ax
3t+w5tq814FQAw2/Lrv9dPi/BJJtGcic/DN99sGD4wcJeyubFXHNKqKvwVqCGsgM
yx69crKiBI6WtPJ+Gta2E1yd3r3ACXSlR+G9nKFOe8R7nQiUhdATKmZTkyGAp6lr
nqmsIBDIi8XxMutgHMhDdN0t3kWyA54bKMrTVoHs2/IbTKIkNI+/vHwXNVFb65oW
7xnpr4sHDyRq0DOETPb5JjyyXnvsKVpZSRgyxzmi7eiJ/CQDhpqgSFsH1mou6H+T
qRRsJU0Tzr823FZJgvBUYBKamhDLRDZFUiJZUc7d4bQ9tFZtkXGaSf9WdLryuvrP
1mYMWGrBPXpKxVOYimGxQXYVM5dxxdNCzRqpjnskDJjXGN3B+rjToelhvd1h9Bsw
JzVmD9nlLVYLcNgitgzKpkigSYlrcLsy8Om7Vs4/Twtdo9SdZ9sw35pTtWnlBpC5
wd4yCtJTA5HvYJtaQTPGJhXnELREySoqjtJ3eSdX/6FT2kCHoBD1dq+GLeWpnaL8
nmEuFfc5TEjcJuBVZoHf
=DElb
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
