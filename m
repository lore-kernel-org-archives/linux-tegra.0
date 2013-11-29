From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 27/31] USB: EHCI: tegra: use reset framework
Date: Fri, 29 Nov 2013 15:51:31 +0100
Message-ID: <20131129145131.GG9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-28-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fCcDWlUEdh43YKr8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-28-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--fCcDWlUEdh43YKr8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:22PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/usb/host/ehci-tegra.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--fCcDWlUEdh43YKr8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKnzAAoJEN0jrNd/PrOhh1oP/Ryufg7Kl9kMLB8xf8F8qMY1
uOSI2VrPgTLoLcnmJUK9sksGtXD7YKvi3SCeXv8zFtNp8KM3UqOIXSFiDXbj+g+r
Er5FNUPlZNi8xWYO79HasxxOWTgC7ghx5FBQ6fIvIdCh5wqCvpn4w5g/VmgF3Ctc
apllDFk6veVaiCxOnCEQE00KGOZ3qSaLuu88twvPr6jlll3cvbL8FBF1MSOSHbNE
h6J93fZitlzlDI38oV1O7rA0oI8W8q6uFuYwWEyfWqwUE5HC27D/x2smSJtJfcva
rZQpyO3VmuOlvbBCbrO/oa3BctJxUIEpcLtpGuRQZk/MFN1zVGG8PVwovA+eayxL
Y9iQbrQAUO2AYuPSihawhwWQfN1+S3ZQYFddSmpWtOQPlrh30/42PeDrBa3X5ozV
7l7KU7SkGZioUf0tLmegggYvoaDWiWfdWwcFqdrAdNCm0eXvqaQfuVL35p83LCJ5
13gW32x4/ZZRhyVAvfOvypfmfsJSBgyArvG1a3CfdDmFvZ1ePCQdVwhIVxtei+Z5
Sa7HNoNZtJc+NbuoHIcFPaeKEgkuhyfy2I0H0nzH2MYoI6REOa1t/c4VSdYoZVHu
EG/H8j5Od9L3Lm9W1Mh5xinSt8G/Hz8wnRwAX4c80ugiUX5s0BvhZHTKFpbLnC3X
Eb3Z7WJvdIzywz89yOJ3
=rvmz
-----END PGP SIGNATURE-----

--fCcDWlUEdh43YKr8--
