From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 6/8] phy: tegra: xusb: Add support for charger detect
Date: Thu, 4 Jun 2020 15:56:06 +0200
Message-ID: <20200604135606.GC1138399@ulmo>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
 <1589437363-16727-7-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1589437363-16727-7-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 11:52:41AM +0530, Nagarjuna Kristam wrote:
> Perform charger-detect operation if corresponding dt property is enabled.
> Update usb-phy with the detected charger state and max current values.
> Register charger-detect API's of usb-phy to provide needed functionalitie=
s.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
>  - Allighed functions and its arguments.
>  - replaced spaced by tabs for MACRO definition allignments.
>  - Unified primary and secondary charger detect API's.
>  - Used readl_poll_timeout instead of while loop condition check for regi=
ster.
>  - Fixed other comments as per inputs from Thierry.
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/Makefile |   2 +-
>  drivers/phy/tegra/cd.c     | 283 +++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c   |  80 +++++++++++++
>  drivers/phy/tegra/xusb.h   |   7 ++
>  4 files changed, 371 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/phy/tegra/cd.c

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7Y/XYACgkQ3SOs138+
s6F9wA//c1AJ3FHM0Hd0rv+zsl52J25fXL900vW2xXJen+Y78K4WsUeU0DrOVWLL
Jb1uuFoKiiGvOfRKIPK986xWqECWMz9E/dz7GTgsngBiu5db3Ndc3gPBYDu2FfNu
B4ZV5yY11shrWHNxahITTivyGfJLOtCFQh18BjhJOjJ5vLwlj/FWdvWVMY7s+rbU
0mURwNp7bHTajE+mKN58eY3AxY6RZ8+083I3hWXW3TreGxCMvVVNFRB1D8+Mk+X1
nvwWziAugYRnlLMt5L2vvEeiPDiQjbzGqfP6vxgRXZrEL/TLoQK2MC3c6v3ZQYsY
9ms7ZmQUTAHh4omhYJPaldWPYTQ95Dqw5lAHEaers7MkqPSGOedfLBsINCtBt6f1
iwJY6YOkAG9q8adHZN8RWTtdirqOhLH2o29RUCqD5vv9Oqg9zhrF+bJHQmwOJix8
+Rs8KwndDSwuEuR8KF646FgLJH5LOODFMSLl7cB0/N+MRLehAfn/ItuwtujDXGln
EIwpS3rd45U5rslitfsr3J491GFJyF8dEeUTnNFJjRUoOR8vSKYo0ckDLwLY5xHc
yl/ufE2sFqLcAuU/9T8yxTGElnyQ1B18Og5QwZYUtE5BnzF22r3jbWc3TkmOXtTI
yCKcLMH0fWkTb0tA3JLq6ps09ATBjQbv3koCi6hmcLfnh04NvFY=
=+q6H
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
