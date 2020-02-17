From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V5 12/21] usb: gadget: tegra-xudc: support multiple
 device modes
Date: Mon, 17 Feb 2020 09:42:04 +0100
Message-ID: <20200217084204.GI1339021@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <1581322307-11140-13-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4BlIp4fARb6QCoOq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1581322307-11140-13-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--4BlIp4fARb6QCoOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 01:41:38PM +0530, Nagarjuna Kristam wrote:
> This change supports limited multiple device modes by:
> - At most 4 ports contains OTG/Device capability.
> - One port run as device mode at a time.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V5:
>  - No changes.
> ---
> V4:
>  - Replaced current_phy_index usage with curr_*phy pointers.
>  - Used unsigned int instead of int wherever needed.
> ---
> V3:
>  - No changes in this version
> ---
> V2:
>  - Updated err variable on failure to get usbphy.
>  - Corrected identation after tegra_xudc_phy_get API call in tegra_xudc_p=
robe.
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 217 ++++++++++++++++++++++++++----=
------
>  1 file changed, 160 insertions(+), 57 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--4BlIp4fARb6QCoOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KUdwACgkQ3SOs138+
s6FBTA/+OuSS68PjmW2Sn16CEA8GKImQt3M9/ZedBYhHI270QC4KXSO2Piz2+TMG
gX6/mSb8T492DXnHvpH7f4QV9BbSptNXWb6tNLfTf/AYWi++vG19RtswQQaZT1z+
OfWyHZJh/BwEolaYJ295QjD6ovpWRhXtg7di/fdyCIoYFrZN7lAw5ongGvFsa3bB
mC2kZ1NKMNHFJJ0/n3/M7OVQffMUJh/18fXC0gaGgwYBoL71VpCSY0ICH4OxQopx
D3J9uCiDc6/NOu/52TLWQh+tUPMW1784C2orAWqMn8fWT5DGOph2NPVm5H3rw+Rq
ub0gAyDRQGs+A4e2bieY5Pd36vtempIkZilZfeH3OmFFeB1ieOfrqxxy2eafxRhy
QdUro9WP9dhFxVZoxjNCtkWP8whnuGC5wx0FC7vTTBllxBYaxGDrrZyRTtM/H4uh
0V+KWu5hPjH1qsV2OAlqHMlIm0nPcUp794oq24ggLPvwg8YYOtnvd5VyHmmYzUpG
QzoByNWJgop9VdmTm7dXm6rpbEoHoeq70lxY1tVxbdUzwmqtKte2FiGNf2VkY4jQ
nUkSGU4C8yQGHdg+pumAz96wVJOALHPj/iCQBsSbWbnflwAzl0nAX59HLN/mbFg5
9PY+8EZs1cQL5JobE8GHUcesdF7tYUQ2dy8sJqJPqIDy/fTVh6Y=
=hIOY
-----END PGP SIGNATURE-----

--4BlIp4fARb6QCoOq--
