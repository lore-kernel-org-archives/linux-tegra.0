From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: fix NULL deref in debugfs/iova
Date: Thu, 17 Aug 2017 17:34:29 +0200
Message-ID: <20170817153429.GG30664@ulmo>
References: <7ca7b47df4aa1c164b7313172564923a2639dcc1.1502747460.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7ca7b47df4aa1c164b7313172564923a2639dcc1.1502747460.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2017 at 11:53:45PM +0200, Micha=C5=82 Miros=C5=82aw wrote:
> When IOMMU is off, ->mm_lock is not initialized and ->mm is NULL.
>=20
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied, thanks!

Thierry

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVt4UACgkQ3SOs138+
s6EK5BAAwqLbtFTp1wdym1y3pBDvFpIVts37nt1VgN/IwUPk7/JLdIjOVi3BiHtc
ggCDODEe562P0FpLrje2Guekts+RulyUWiRwO1GsPTJVQu05UVTrQt4zW3Te1gIW
iOVEY1UXE+qTNyYrNd9RRCOSATieXbxrpDhUXfuNocLgbmXBgu9AihCL42NLJ+Hp
vksX9FZ0V4QD11wxsUAYpvGtyXEicx39n5a57oP+YEEFIrdikzgid8tMg7QAFVjU
Ejp1bu3UZ9TQQKPVmvz69gXx1Vzb0YLmLsgmBpxxhe28KxBacDLolD0PJepTkEzO
ZZ2C4LOCbUxA+bIXZ+S+RIGZAbp+J6AqoivX6LVBzSZHUq4NaO4ScHi046rZaMte
eHJ9bMMB4qV5IBckBACsNDY/S8mNBFS2keqt33yajHnCsWVILfESxjOKBiEp/W8s
1FWmRPFTN9I5LOJlC6mVmLsnnwnCrCj/r/pd6xCSA2rVYudGy851pQFS8mfsgVEc
T+H4D1MBru6oysEHRtlRBzeIaPzmNF0qh7NldeZv/55zUxgALSvaP4nK4nxND/Gq
LfTCLKzeAKMQuf3OO//8bG+yf5a83g0jKf0PSxZC9mHcNzUKVVN0YwFTP2+XffMH
3uUBf3u9BATea6owPOoJPPF+OF1qVrUTsyqsztAaLHx/WCG//VY=
=PJT+
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
