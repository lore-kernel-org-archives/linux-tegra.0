From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/2] gpu: host1x: Set DMA mask
Date: Wed, 2 Mar 2016 18:08:23 +0100
Message-ID: <20160302170823.GA486@ulmo.nvidia.com>
References: <1456477613-24995-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456477613-24995-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 06:06:52PM +0900, Alexandre Courbot wrote:
> The default DMA mask covers a 32 bits address range, but host1x devices
> can address a larger range on TK1 and TX1. Set the DMA mask to the range
> addressable when we use the IOMMU to prevent the use of bounce buffers.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Change since v3:
> - Use the IOMMU-addressable range (when IOMMU is available) for each host=
1x
>   variation. This ensures that we can cover all physical memory while rem=
aining
>   conservative if IOMMU is not used.
> - Set the DMA range on the host1x device itself so all its childs inherit=
 from it
>=20
>  drivers/gpu/host1x/dev.c | 7 +++++++
>  drivers/gpu/host1x/dev.h | 1 +
>  2 files changed, 8 insertions(+)

I think this could still be better, but what I have in mind is much more
involved and this does fix the issue with a minimum amount of code, so I
have applied this for now.

Thierry

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1x4HAAoJEN0jrNd/PrOhQJIP+wb6ltHnL6UuZOJITiFt4YHf
1UY4JOct0gseJn9fNB/EHIKnmh2TeN3oR9KpylOAB9gWvg7gmEjNBg0au4TVZIKc
hxpWSo5ZUoUgECeuotLjfRBbrI5L3JudIe6q9Nzt2zs85lCgVPWHzB+li0X17r/e
KVAU7aYaUcX2knfBZnhBvmIf/ek1ppR6G1Wl1O2m5kGem3ZHpCvKznut8MhMxWuu
K+2dnRPB+APqFzrNQ1hrMpviV5NCUBAmIOzbA2FZnEzPVru01YSIxZQSiSS5Nux3
cJ+JHcugGGF+u6NMsMO2mayc+32TyQZYDsCe6msqC16sfh7ndolYPKoJ/xUKT85y
6mMrdi7qbZvjFOF4Tp8JrQq7qvTYIj+5I76EHTaxUDFGF4mpgHDLtGCgPoanPbXX
LWrqiq3LUXjyWCby5mXAlmqudbwdPxqbupZN3jZRTp+/IX9n6wuGgMYJ6WX51kl7
gMgpXuPvA5LKDrJ+FMxgDfGTh6FpwZSGFHzRMARiP7+7svDJUEDd1jWJCjPNftg1
3FCzt8BNZFLIHDiWdjSffk6bWgDkAWgKYxblHYMZLuFiotJtnyFsa3+FJ6VUaIAp
0Fk3xJhpwnu5Z48pZhbvUQI0cTJPu0pNbRbP2SC741i+8HEuzplU3odZT/0PFF86
PoiiL2efpmmCMZtJwwmj
=pRnj
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
