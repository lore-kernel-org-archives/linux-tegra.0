From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/6] ARM: tegra: nyan-blaze: Include compatible
 revisions for proper detection
Date: Wed, 25 Jan 2017 12:04:13 +0100
Message-ID: <20170125110413.GE9344@ulmo.ba.sec>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-4-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170122154753.31942-4-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 22, 2017 at 04:47:51PM +0100, Paul Kocialkowski wrote:
> Depthcharge (the payload used with cros devices) will attempt to detect
> boards using their revision. This includes all the known revisions for
> the nyan-blaze board so that the dtb can be selected preferably.
>=20
> Defining compatibly revisions allows depthcharge to select the kernel
> via the revision it detects instead of using the default kernel. This
> allows having a FIT image with multiple kernels for multiple devices.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124-nyan-blaze.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, with the same padding adjustments as 3/6.

Thanks,
Thierry

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliIhi0ACgkQ3SOs138+
s6Ey3w/+L3MYoX8i+6sbo6Akm53AAzfq2XuEKyMU4Bpq2vJKc1cuN9LC7Yo1/kch
7uteRcgF/wHvY5VlpKnZXbKgXp2rupWLXhuyC0cKVn6FWBjRmq2X3PENkyA2rLaK
zxv58kTdpOiqLIP6zGnlt+RrVbUOrrN/gMB3T3wGl/kA5EbxIOJQLKNVvh+wI892
dR9wTxA9r7OOtLUeO02EB8B6qwRVirX3bD77+lAap6JGLqdX+c0nXq76zxj0xn+T
irdVCHg0XMdqlg0oYRIYlJtzeRcm+ZhLq3D29Ygg00QBN1bvW1s5obg3H+LU9v9K
OY1Dm5z27RjKSXP1plIINnrYq40U07gvHHTCN3kNAJ2YHMi+Fkot4R2VB41+3VqK
G5EKMYT6Pyfc10M6ORPpuz34JIfaXO/ZyIJTEnxFkkUeWuW3dkGmNWxBrfUQ++CH
P0kQZRV3pvC/5FJWSwAO8XUzjT9HMGq5ZyUgiz8xVEJlUFNkx2eK16S9Df1J5ekJ
dQv1RQe+4uzORTEICubArWU8+6pf2dR0Nrtz+jF/APZcgTyqOyZx+P1KX0fQdSPm
yjuU7OdzxF1TGzCK4XC7pSF3X3zIMbxTigwKLStXjpZcEW6vq9D7GvM5JsCRNL/h
5jHM4MY1OtNgmWrI2DoSuPpP4Cw1flWQqbkdpxXMWiqVKHBhZQY=
=23vW
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
