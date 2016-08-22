From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 02/12] mailbox: Add Tegra HSP driver
Date: Mon, 22 Aug 2016 16:17:28 +0200
Message-ID: <20160822141728.GF17367@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-3-thierry.reding@gmail.com>
 <13954058.6YHDe1jCOJ@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GV0iVqYguTV4Q9ER"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <13954058.6YHDe1jCOJ@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GV0iVqYguTV4Q9ER
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 03:43:23PM +0200, Arnd Bergmann wrote:
> On Friday, August 19, 2016 7:32:23 PM CEST Thierry Reding wrote:
> > +static int tegra_hsp_doorbell_send_data(struct tegra_hsp_channel *chan=
nel,
> > +                                       void *data)
> > +{
> > +       tegra_hsp_channel_writel(channel, 1, HSP_DB_TRIGGER);
> > +
> > +       return 0;
> > +}
> >=20
>=20
> It seems very odd that you don't write the data at all but just trigger
> the communication here. My interpretation is that you bypass
> the mailbox infrastructure for the actual message, and instead reimplement
> it on top of the mailbox infrastructure as part of the bpmp driver.
>=20
> Why not expose the bpmp itself as the mailbox here?

My understanding is that doorbell doesn't provide any means to transfer
data. It merely signals the availability of data. It is up to a use-case
specific implementation to arrange for the transport of data.

BPMP implements a shmem-based protocol and uses the doorbell merely as a
mechanism for the BPMP and CPU to signal each other when data is ready.

Exposing the BPMP as the mailbox could possibly be done, but it would
implement a fairly large software layer in the mailbox system which is
targetted primarily at simple mailbox hardware that exchanges small
amounts of data (usually fitting into 32 bits). mailbox-sti is another
driver that uses the framework only to signal, so this doesn't seem to
be a mechanism exclusive to Tegra.

Thierry

--GV0iVqYguTV4Q9ER
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXuwl2AAoJEN0jrNd/PrOhg4QP/iVS/bv0evzHoyRg4O2I103i
yZSbp/Gje05xg98m/At8IFrkkjuIbDJpkxnew95QNi4RF552d+flN0jdF0PZla7O
yq+PJKAG4Tym5ACyP6ALIzXZefIY6OUfQmRl+pG90Ur+09TLulpUv/i4Hn23hygt
E06eYvEmaqsyFivNxmYFpr+e4IOSAHisiQPHUxxBc5uRCi4RaL8oU5XeKaKmZTT6
ERNFdRDoueD17oUKu/Gg6jqnj6O7b5/Jzyx3MdZmKhBWIzuN8vw7quOn9eghsnBB
IipeUKzjYneqIRNAFNGkD6zjG9S9gtkJ9UNCLo1kbryLPgPp6iyzAzVYgF40T2vL
6xb6YVX1F+irqOO7NtUpJ6S/gGJD5tG+ylUwfigbJ4nEVUhSneBkQdFP6Jiy176E
q9837lxftzt/D72ZRXQKytn3XIAoKxU7MvtOy8cefFl2LyNv8IlCFhWtg03lbh+H
UCRjWnXZAomOK24iZ30jxnenBFoZ4iA0L3ovCO3HcJFuQw9TTG53sLuvh9S/p8kS
pWU3o/y6bT9sQjcWIPuifXG7No34h3MTcwGJ4MJ8PIM3aW4R4hoEL+8FesjOKw/Z
YqC64+tsQqovKxDVjjzn4Vsn1Dc+DkcAg1/Wok07lxSt8cgjLLKu99KiVr3Y3yvJ
aE5yd5RlXJ2zb+3+Ubhb
=G79S
-----END PGP SIGNATURE-----

--GV0iVqYguTV4Q9ER--
