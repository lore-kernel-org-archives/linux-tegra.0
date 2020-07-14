From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] serial: tegra: fix CREAD handling for PIO
Date: Tue, 14 Jul 2020 17:52:00 +0200
Message-ID: <20200714155200.GB251696@ulmo>
References: <20200710135947.2737-1-johan@kernel.org>
 <20200710135947.2737-2-johan@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200710135947.2737-2-johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 03:59:46PM +0200, Johan Hovold wrote:
> Commit 33ae787b74fc ("serial: tegra: add support to ignore read") added
> support for dropping input in case CREAD isn't set, but for PIO the
> ignore_status_mask wasn't checked until after the character had been
> put in the receive buffer.
>=20
> Note that the NULL tty-port test is bogus and will be removed by a
> follow-on patch.
>=20
> Fixes: 33ae787b74fc ("serial: tegra: add support to ignore read")
> Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>     # 5.4
> Cc: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Krishna Yarlagadda <kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  drivers/tty/serial/serial-tegra.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Looks good to me:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N1KAACgkQ3SOs138+
s6E5wxAAh7iJ8sJY9GOfgRgH+TfVpaOx9vthw1a+YaDJkl8WT7Y7pz9YaEru4OIJ
eBLvyt+pMPkx7Tl495j7EbFwUmZGy7F+4pse9vx686+bAwsc9+SgYRgnQzMvwsY1
UX6Kfaj+pfWcGvYz/Gq5zQEi23ZH6QrIkEZGWm408gXMz+NzRKxABTDJx5+FRdtu
uB2b6BNnrQ/em1dY2NTtFoNbKZpoHRm5aDXiAb/9NO4sgmJHaKB4UpNdtMBe2mHA
uCkPzhytPCl6gzyl+EMLsrkPZQpPRDEcCoeHj/Gv01F5FRXILUUb8dhCIvhQpXZ/
vKiHVCN7o7IfMp+CVRDSwRrcLZ4D1hQl/wDw+k4ZSAhE5InotN6nDrpJIR4kDxII
KWEkyWkrf8buSpdCFCY6XBPtC7FAHn/W28RaD4LDE9fpXFJWawxe0ebtH+M/bRxk
CVbjYU6NxjpdbK0YCKNUzPNQJwBU1HWErGkMU7cnPdc+04t/jVx7023JrYaRzYak
6+2O96GdpQEa97PthXw6xVamIwWjA3383/+inuztYSXduWajpx3A1RA38ihcU04I
stG3Ft3FHvDjEu/iE8i/8k5nvs0S/s+lJYKkdyVaJcvUAwQt2kO24x8WPkV4tdvz
w1AIMxx54zoT9n4CHdVhc3EINKoWirt8QgAfw37VSSa2vboL4yg=
=0eYi
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
