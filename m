From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Free the IOMMU domain when there is no
 device to attach
Date: Thu, 27 Jul 2017 18:45:41 +0200
Message-ID: <20170727164541.GA25081@ulmo>
References: <20170710193305.5987-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710193305.5987-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 09:33:05PM +0200, Paul Kocialkowski wrote:
> When there is no device to attach to the IOMMU domain, as may be the
> case when the device-tree does not contain the proper iommu node, it is
> best to keep going without IOMMU support rather than failing.
> This allows the driver to probe and function instead of taking down
> all of the tegra drm driver, leading to missing display support.
>=20
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to drm-misc-fixes, thanks.

Oh, just noticed now that this didn't actually go to the DRM mailing
list (dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org). Might be a good idea to do that
next time to get more visibility.

Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll6GLEACgkQ3SOs138+
s6Fq7w/9E754kLNAR4xec9kYv7ivnzz3gOSj2B9S/dKVpbn5+hnun72/ruyslh0Q
r3M6uW2iGbch7XTfeX+hUQIfcd1tl0ZK3h4kHdE5ZQhpj3Gy5yzJTK5OeoDdUGX1
1oJOVN4CD3UCtoRm6OzvB4viyXftKmR80TB/fg6jLpTfrZZT/nIn7MbI+uHU2q4g
r6A77qLT1pvirVsg2ctYXjQjHmI284dYbsIqncneyAw7SfPwsFe3lQ+jNWpHh/1U
8xXPBvqH+FZGex3Gu4EOHaiSuquf0kbLb/xx2uVWQFnhSY6KHoju0HFVPeyHJcNC
+hjunkQjA/EvA0HftFsrbDjx0ETQGP9/5pxaiw2QXczR8hIBTjgfd1qQQfQB8V33
53fKWimUS6uAAfiWZxC5bmvOwyno5aReA+b9H1GRdXz+CMg9kty0uyYTqwJBSTqD
EPRL8cVamlQoITXvs2SSIozfP8esy+ExgtTJev+3nhP7QWDJqWsBIT2PyD/Pcg9F
q48sP0m6+yPQ8lXJ6YxLGqF6P7Rmg5epHtuyGHHFd/2/O/tkG5VxvAP+sKT2FWzr
aBRwM1g2PoIzkbYcNJfxmDIajS+o+USzFliT4lVHWgd3eiVEtR6cj5tmLdaimjNU
i1ZQ1LDWXuswLuvRAkmk8hc/EQEpyE5UmATVal/DcSeKqvgsyC8=
=OdqX
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
