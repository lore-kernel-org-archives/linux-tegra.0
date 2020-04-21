From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v8 5/9] dt-binding: tegra: Add VI and CSI bindings
Date: Tue, 21 Apr 2020 22:46:46 +0200
Message-ID: <20200421204646.GA3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <1587427874-3291-6-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1587427874-3291-6-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:11:10PM -0700, Sowjanya Komatineni wrote:
> Tegra contains VI controller which can support up to 6 MIPI CSI
> camera sensors.
>=20
> Each Tegra CSI port from CSI unit can be one-to-one mapper to
> VI channel and can capture from an external camera sensor or
> from built-in test pattern generator.
>=20
> This patch adds dt-bindings for Tegra VI and CSI.
>=20
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++=
++----
>  1 file changed, 60 insertions(+), 13 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fW7MACgkQ3SOs138+
s6GcPQ/9FNBtMbNYeZe7HR8tmPr1TQ7xTJ21ncNt7vGdlFWn0F7TXycPiWu86+V6
Zc2pIGZjSk2uhHKbvYUvA9IXkAY0mxtzZrJeXIU+vAADOjAc6+rYYKcf0zuRr28g
AAgcnaAZPIsxWCdIM/G4l+Bir8kw82HGIpK45J2m4aWmgBF9c1vMVO4yzj5FALzj
F7nqa2Iiufghax5P7n/9yKWLeQroDPqsrWCWqVh9ILOn52l/qIDfRPAsEjuoCy3s
FaDQQQRRSoyYTRg8iNLF6t2H8yI89Suyia4ZcN+YzuhwtEc/DlSvIWFW9BVgyXxH
N6AdkZzFID0me3ij0xAGJWD2bmUlhQVPMPAJZq52t6vdH+0k9WReRUuBp1D0P7nC
FYuwttry5BJiXXceFOR29KKAe2qO3IMl3/cpLvcDVPSbMi38Zyd3VvhNbvFD+fn+
hTa3S+5xLhbQxLZsSDnaPA1Phl4EGGNSWo08Nn5mwU+H/oCO11i/Luy4+usaYgor
lfa9//chWihgxUnpa0fN4nUdgmaRWxymLiJL3bY8twgvEWlzn7cbtf6EacXY5Yzt
jUE+kPSEAYy0jjuWANsQJUe2BQiLHIRJEEQSt6EsSgLmV2P+5utoIuAjUQWAiF1V
fE8pGGlhXJza9q7fbW62lHW/c7agPohXsRsq59UytdnjJtnzTz0=
=FTJX
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
