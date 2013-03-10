From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 4/5] rtc: tegra: set irq name as device name
Date: Sun, 10 Mar 2013 23:34:50 +0100
Message-ID: <20130310223450.GD4743@avionic-0098.mockup.avionic-design.de>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com>
 <1362852588-13362-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362852588-13362-5-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 11:39:48PM +0530, Laxman Dewangan wrote:
> When watching the irq name of tegra rtc, it shows as "rtc alarm"
> which actually does not reflect the name related to driver.
>=20
> Passing the device name to have the irq names with driver name.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/rtc/rtc-tegra.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Reviewed-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPQqKAAoJEN0jrNd/PrOhCuEQALz4iobtxdV3YLjx6TzcaUnL
ajWmK/D4m4QzKLJO1uvdfHmFVVfiZiWaYOdtZ24Y2P97r3QRzRhaQub9eq/S3uIw
gHRo3Y1S6HqOlnWZkqNbx8FdhUMyIBb6vx4hEd2NRWE5bkqEJGI50x7NRqLZZ2in
pjxRQy/3LYG9MnuepP9xbl5yppCEXLBu1qIfpd53rKl1CvV+g6Izlaf8aXoFz9eT
3FqBKsyraruIunF28xw8JUCnezdlTs5ttFzQ9xh/0EWuHeJCw7JT0F3C4go24PU/
sNcp0Rs1yv06+E/yn4quDJ4vCoKwIEiIgDZOwBkqENgDqIb3n1TucV1AziRvtjMn
gNhiBborob6HWo7NOkUefkap4vkwZi0c76rdz0MHWsimTwSmNUC54NEmckTSKT0B
MZlAco9igY3hpSmW3pYtlqQ1Jvrrd/KC6YD+zLI6/ekveTBe2/7J0gRMbFc5AxtV
Z4eFrXNMEZYVOGnY5mWQl9FEsms6RbMUWVYfutb6CWfVQqYxEhg8Tw6pXlhwCVDG
T9AhnmYmbEVCJcdOZTOhUt377bxkfkH2AnGRVCToUwVxDZSZU5bImACncrAbo9tr
4CNeLRrsVC21ugNPPcsf5wyQhYf4jPoS+5Tx6iEOkjVsiDGJpP3TGgbnVh3Ik0U+
Ha6Su7S46LPz2lniOjOg
=IeHx
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
