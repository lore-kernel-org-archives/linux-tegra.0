From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Fix idle suspend/resume
Date: Wed, 6 May 2020 19:13:49 +0200
Message-ID: <20200506171349.GF2723987@ulmo>
References: <20200417170537.2540914-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200417170537.2540914-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 07:05:37PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> When the XUDC device is idle (i.e. powergated), care must be taken not
> to access any registers because that would lead to a crash.
>=20
> Move the call to tegra_xudc_device_mode_off() into the same conditional
> as the tegra_xudc_powergate() call to make sure we only force device
> mode off if the XUDC is actually powered up.
>=20
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device m=
ode controller")
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Hi Felipe, Greg,

can you guys pick this up for v5.7, please?

Thanks,
Thierry

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6y8E0ACgkQ3SOs138+
s6EAIQ/9Hu7iv4+5FnG2vFRCAbaCleabiFAWeWUg7kxxWd8ya0y/UvD/3YOsNqLA
M7y32t2KlQYcrVGIpryz4dyEtQtyCcibtd1uMbm2gLQWEbjU6KvxlX6siKyIk3dI
rxneQDTjUMToGhdIEuLAuJ5En1c9qs5X5STZ2kW6OdzQMoZ/oMPmItTBHwxMJ+FR
+jyiCA9sDwEwzSWYQsFqOlwEaZ2SoboTfcnSobx2nhvvJh4+MBl6rDG7iMmGt8iA
fNMl483j+2tpNDbkd+YJHlINeemTyJvuCAV6eGGlpcjPFd6yabVLY9tqyEE+X/6b
JjHoRA66q7FiyXeB7qg8ia0zJcVjKgP/Xc/YgZ+R81UdTld6f9OAkVvWqXX/MCSX
Lgq9MFEv+anqrplOyZc3TEx2108yxoxTEuAhoHu7uIZC8dMACgSlZeh/fvxJqlLy
GSciiTnnhl3McdwsWvDbCxwO4s83GsdndBTSBuPEY9P81yfqt7u2+/LWjHO0/6WH
s5LIirh8cLlomRymzszh9j64wVvaMHMxBDtUaJFg9jV13pPoWto50es9iKMJ6+Sk
uFkEMERPPWBV+6h2EpXjy9rzDgAYJ39h2iHUAgAPpsns9j+zhnXXOLlwNq9wJQ44
DzA3RptRzkZiOCXJDI8bNkAm1kQoFiO5tkmaQyzSdV1ynEl/+p4=
=qWY6
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--
