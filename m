From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] pwm: tegra: assume CONFIG_OF
Date: Fri, 15 Feb 2013 23:28:58 +0100
Message-ID: <20130215222858.GA14441@avionic-0098.mockup.avionic-design.de>
References: <1360965742-19744-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360965742-19744-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2013 at 03:02:22PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra only supports, and always enables, device tree. Remove all ifdefs
> for DT support from the driver.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pwm/pwm-tegra.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRHraqAAoJEN0jrNd/PrOhbGwP/Rq5azRbDk0dKiZzp6Cf/Gbr
V/qhhRsHNDmK0+ffmvqIulKmBrUNsU5u0RANnU580CfD4vEespm23mFOQx2RjriE
lfkpE8pxCBvIDxjZWFyrV/ZCARuX5YbWkKw2hFqZi8eB7RC83GIXUYXP+dxseBcN
yNKYBuWoNYHHjmqjdLX9+9pVGN7um821XFRb7Z8sbPH0D+O/1aG51D6j4Vkrukav
LxFZubyqQrxj5x9Shr9PKT+r6pbUe/NJbMvy2v2qSkMiOd2FS/gDXwyhLurqn1Vh
288lvMwpsdYpq27vMEeIez2af/cdi4ZAy7VK8uaLUYDeccOkX7SR8fqFoRyq30Zh
NdlFCsbiyznNPS9LCRO+weNxNUkmeu/O2OFixoVqT9PEYVeE6Hi5cM06a4GcXDB4
VkLAbCy7FYkdONj0Jv+CoB4tKtVeMKgJ+yyT1+L/EQLHBDvT6nUyp9rVF7oe6Idj
zmHc57nEKL4aD/bvXHFNvoEz5REoIyCsG7gCNFtMwaifJbtnXH8WX6VMbOpdn0HG
hjvaUcNkS5HOPkyIRM1d1jE6r7jAJQ5LRAvLHrFIeXUYFf0wdo3c1UKQbbEc0mVR
ScvlucIdsoDslLe3Ui51i/3nDSy5u9fH2wAjafSaG03jGwOEG0iq7hjtW4Dx1l2B
GhybQaoHEyHmaupTiJ9V
=01kc
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
