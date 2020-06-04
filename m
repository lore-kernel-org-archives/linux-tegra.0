From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/8] usb: gadget: tegra-xudc: Add vbus_draw support
Date: Thu, 4 Jun 2020 15:54:09 +0200
Message-ID: <20200604135409.GA1138399@ulmo>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
 <1589437363-16727-3-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1589437363-16727-3-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 11:52:37AM +0530, Nagarjuna Kristam wrote:
> Register vbus_draw to gadget ops and update corresponding vbus
> draw current to usb_phy.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
>  - Propogated usb_phy->set_power error to vbus_draw caller.
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7Y/P0ACgkQ3SOs138+
s6FGuBAAh726xRnA8AgpFzFY6CK2cnfLe1wgMCL1lGWrqaJVAlJXxLvRFu27AwyJ
E24tlump5oS44vr63gxbJeCb6cxL46GS5w76IviVfMsQaCNFvzVKLa8xzZe8G01y
XCRzmMitVXO6oQEkTtI2cd6mzXYC9UHTcGQBSf1ZrA2HiiEWjphbV4i4A3xCLijJ
hxa4Ft3nnXUcDkJRpwPZgDBXWCkNA0jxtnImIIFJ72qQa3/Xphunoe8R+pH9C96+
GqeIZxULrEEwsa+EdjTpa2zgcICxEHf+9bPqGKdN4Swg2fm+oCXerJVjbJz+KyD3
qutHM6kSZEjCWH4TAgB29eUsjoQYBJZTkYDFHr89ZlD4zqYLYXvNpy2S+A56m4wC
Q/fRVE09PNweckEasggSi5t6Lt53ffsIH8PtTGITf3C4iKG/0BYbCUYDaU569rkO
gWs5RvNFHSXK9p38k593Eq9Xb4eyGnLc10D/Sa/IXb37BLB76TnzBqMqABMctXul
j5sFYkYzJZuD22eUmReer+wvt78u2gDaew6kx7Vz5Bceoe9Mz3lqjj9djNORzdY2
8nSGxGDuNxZOwRLd0iv3lg/8VqlVfz5iRZXVKNBqFOPk7QLgkp6M4+JebNMaolHy
TB41eCaCzhkjN+UBHrhHTxKJ8RHPcvuiJ2xEfzSYbmumZo/q2MU=
=Zn9i
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
