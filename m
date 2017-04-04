From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: Add documentation for GP10B GPU
Date: Tue, 4 Apr 2017 15:21:57 +0200
Message-ID: <20170404132157.GA843@ulmo.ba.sec>
References: <20170330091831.18322-2-acourbot@nvidia.com>
 <20170330092644.11890-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170330092644.11890-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2017 at 06:26:44PM +0900, Alexandre Courbot wrote:
> GP10B's definition is mostly similar to GK20A's and GM20B's. The only
> noticeable difference is the use of power domains instead of a regulator
> for power supply.
>=20
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v1:
> - It's much better when it compiles.
>=20
>  .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 25 ++++++++++++++++=
+++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)

Applied to for-4.12/arm64/dt, thanks.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjnfIACgkQ3SOs138+
s6Hj3w//SFx+cptfvaQjO18yatBc4RRhRVvaMBL7p3451NYBxf2lLeCcSsx+3epV
V+2C7w2Qb8ACSor77EvJ/vDfaSGfXNa2eM3b8Y1CQOoBQemZnCBHbZRAU4c8Gg5b
XVFNZkmrlp8udz5V9fadokmhC22yjfN0MfIV4C5bDgdxS1aR0W1fAg+yPVcehiRT
vP7bl3sfV5B3bbonReSqvqgzm3tEBdquF6l6ZkO3FUQZ0A7qI9VNMs/Dlcj0cCAL
9IWFWip4paaVUsmxx06AJsuHV8giV0PobWFldzTYgfLMT+cQCWDRj/um35iPAAuE
I93nidoBApjHJa3gND37ZgXfry9q88JHL11/ahvYycGLzg5317Tvrnz/gKSWdB+T
rkv8qmeSkqXshXfle8L0DCSaqBk/UEYODUHbel1mljTup//p6FEhDgobjg9KDyhK
+hW+T1nozYLPeXG6D8wzvViP/ezQ3fCYY4sXEJGGiVmJruZEUv9+GzzXzyrhk71p
C2+zQcRijiDdf9AAUHQvV1CdKZ8TwI0VKYrQq121dA1sE3xBtKEGxCrdIubtB13Y
3BuPnQvmAaU5GXce0c94JKtz7jsb7ukosvn8FCB7jAkgfrjejUDFW2NT0T5FKMCm
LQW255o9g9/Z7iOh2jV+En348e+1KnMevlc50AAU18YKXpvjj8s=
=KqNX
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
