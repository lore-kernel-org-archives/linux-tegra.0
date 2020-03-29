From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V1 0/8] Tegra XUSB charger detect support
Date: Sun, 29 Mar 2020 13:40:20 +0300
Message-ID: <87pncve963.fsf@kernel.org>
References: <1584527467-8058-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1584527467-8058-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:

> This patch series adds charger detect support on XUSB hardware used in
> Tegra210 and Tegra186 SoCs.
>
> This patchset is composed with :
>  - dt bindings of XUSB Pad Controller
>  - Tegra XUSB device mode driver to add vbus_draw support=20
>  - Tegra PHY driver for charger detect support
>
> Tests done:
>  - Connect USB cable from ubuntu host to micro-B port of DUT to detect
>    SDP_TYPE charger
>  - Connect USB cable from external powered USB hub(which inturn connects
>    to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
>  - Connect USB cable from USB charger to micro-B port of DUT to detect
>    DCP_TYPE charger.
> DUT: Jetson-tx1, Jetson tx2.
>
> Nagarjuna Kristam (8):
>   dt-bindings: phy: tegra-xusb: Add charger-detect property
>   usb: gadget: tegra-xudc: Add vbus_draw support
>   phy: tegra: xusb: Add support for UTMI pad power control
>   phy: tegra: xusb: Add USB2 pad power control support for Tegra210
>   phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
>   phy: tegra: xusb: Add support for charger detect
>   phy: tegra: xusb: Enable charger detect for Tegra186
>   phy: tegra: xusb: Enable charger detect for Tegra210

this doesn't apply cleanly. Could you resend after -rc1 is tagged?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl6AexQACgkQzL64meEa
mQb9iBAAxsX46m3Wb6n/G0SmCS87nlApHiAUph+Y4vsHrBEEbBreJ6oaRfetkkXi
WR/jDBxFbY6ZlmTVsS30bLx6m/X1wIhcd2oHrH5D17c5uRP/vPAQx+3hYBu5jHmi
V3Qi2CnULKp3RzKZnBO53PSMosIJvHWyycl9bX8D4NQ6bggDkKtAqverxld1aNOo
9UcxkeJc+xujlpLB64L8JRAPFbde3ZpI8pwT9H5ZYqaT1Zv/wVvj2MEBhUxYTppl
xP9A0mJlNXxv2ASJ7rXtDu/tqpXSHGK7YxiTi/NhiWOl0sWeHhHJPQkpK/AfUN9W
EB5/1o4T0Z5RrmmYLqvTPfO8pZjI8JWiClRA5ZEi4GdNCIotGdMybmOiCVV70Elt
OqhudkdhWM/XjK9vk1xrPrYjfF3EMqZVF+HFxOGCJEbQoBjV2TAwBBAIZBLDC7zV
E5DUTkhZq9P22nq2s3b4lvRq72Ubr6w4v5yCTCvVJcGbjJUVP77QJthDkmR2Drnk
f/rQoTribuTT1WqaOyw0y2GTwe1meO900OJ8tSmx4Ydiia7qhErQms6eyDnPZkaC
SGiZM8uGVUPI8HE3bgxKb4sMfqTfN5JEFxMKLxmrB++CP7gMASVZZhUVA1S/abfY
f/wDWgw9fNu96pxC5FBlAiN6juqXspYbTDGZguBgnzg2fnpFJzA=
=9c+2
-----END PGP SIGNATURE-----
--=-=-=--
