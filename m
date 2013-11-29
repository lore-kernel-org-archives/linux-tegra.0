From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 21/31] staging: nvec: use reset framework
Date: Fri, 29 Nov 2013 15:47:30 +0100
Message-ID: <20131129144730.GC9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-22-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-22-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:16PM -0700, Stephen Warren wrote:
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
> Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
> Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> Cc: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/staging/nvec/nvec.c | 11 ++++++++---
>  drivers/staging/nvec/nvec.h |  5 ++++-
>  2 files changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKkBAAoJEN0jrNd/PrOhDMMP/i4+nlAWwqqpdMBN0gfrzaI9
q75rTxoZlww9bVlYXR0cljfQwH0CucT6S586F3ZDmSQvrdGSRtBzFNRsLIKhHTUV
23Rrr3iuTOFH+oadPApIBdbvcasFMtDj3rVTxXISpjxTBOlDaASVBwdnGsPWlpdh
hj3IHGCyU19ta9VHnP6DmKVUkQ2k06qusZmfmsnviXwasMu4S6PAhzw34iKdBJgp
Kqvpp56zAHp/8zYlA/19EZVcG+sIGrctqIxkEkztMYvs2NCE8TS+X/Og0LBHf6BI
7+/EWtLVeb4HhWVhw8wGQTIFuavuMMtbcYred/qLGkoFz2OyEJDoCbQEIHetgBUX
7Gv4E0LmghdzCGOfsn3OvocfmkBPO45T9u+4qNKYWZGezbEnBY68kfjDIN+8yelh
LZk+mVTGRT4DZaw5Soc4d7i42EMymgxd/kYE2OQjBWvdM+LUTYTeH2oMCzWcjohX
L5U6Lr1xzujWhENXL4AS2ex27sBAUdAbox04oUFbjYmC42exrdu3eklO4EbHCKvt
RgFxw9pfN2Tnc7C6/yzSWMwZjmSKgMWtaYiR/w53W1ZzOsl/oJfnX66u2GM48FrE
cSDI6D7jVcHLbnaouV8U2qvfco5uT3q+WQRFA6vP/iopPnQNxktfYE8KqT61Jd8a
6ZpLd9f68wvoOlQFpKHg
=Qhni
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
