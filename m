From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 2/8] usb: gadget: tegra-xudc: Add vbus_draw support
Date: Tue, 28 Apr 2020 11:59:56 +0200
Message-ID: <20200428095956.GB3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-3-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-3-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:02PM +0530, Nagarjuna Kristam wrote:
> Register vbus_draw to gadget ops and update corresponding vbus
> draw current to usb_phy.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc=
/tegra-xudc.c
> index 52a6add..9d3c109 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -492,6 +492,7 @@ struct tegra_xudc {
>  	bool powergated;
> =20
>  	struct usb_phy **usbphy;
> +	struct usb_phy *curr_usbphy;
>  	struct notifier_block vbus_nb;
> =20
>  	struct completion disconnect_complete;
> @@ -719,6 +720,7 @@ static int tegra_xudc_vbus_notify(struct notifier_blo=
ck *nb,
>  	if (!xudc->suspended && phy_index !=3D -1) {
>  		xudc->curr_utmi_phy =3D xudc->utmi_phy[phy_index];
>  		xudc->curr_usb3_phy =3D xudc->usb3_phy[phy_index];
> +		xudc->curr_usbphy =3D usbphy;
>  		schedule_work(&xudc->usb_role_sw_work);
>  	}
> =20
> @@ -2042,6 +2044,19 @@ static int tegra_xudc_gadget_stop(struct usb_gadge=
t *gadget)
>  	return 0;
>  }
> =20
> +static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
> +						unsigned int m_a)
> +{
> +	struct tegra_xudc *xudc =3D to_xudc(gadget);
> +
> +	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
> +
> +	if (xudc->curr_usbphy->chg_type =3D=3D SDP_TYPE)
> +		usb_phy_set_power(xudc->curr_usbphy, m_a);

Do we need to propagate the error code here in case the USB PHY for some
reason doesn't support the given current? Or is it guaranteed that we
always do support whatever is passed in here?

Regardless of whether we support it or not, it might still be useful to
add proper handling, if for nothing else but to set a good example.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6n/pwACgkQ3SOs138+
s6HV4w/+Kh8/1qiFfVfFtWh49TeX/icuvedDrV4bIynZR70lHjKGgcQtJWzsl8ni
iDKtOJjTncd4O2qdSRId28a8LkdnhcgzehP5k43Oaq/LZQWhvFUn37xn+Fe7ELsn
D/lFytyqrePe0fWrIZiYejVCilPO+m/xz5JhkSnWxOy7FjmBBLWKjG3x9W6aNbU1
gaVzP5p0OJmOB+JXofiJM8myD+vypiUZ6y/zbKbdFi6zgw0snfSu2l3xuQKSuME2
uS+FmMhY/c4fqvc2iqNemxGv6JWQuN7Li2u/nfhPeZG8asgumTuDBjeOYKtRbpo9
80xmG8VImnB+RY8uqw6+MUQoemTcyVdY80pUc/q4DdOp1vdH3GQmoUoE8ge8bYqD
U87hN5v5Grsjw5kvMCTfxO5DKjYlyozc4UvKXM4M6joKNQZCPHZwOdMhs59VjqhY
McZOfzR2HlepxmDJJwQnrGn1vGG1w1v/RtgFv2FDo68AzkqxjMs+HszqFkYGr9Sk
vZXUb+vEXZw99ghBZQW0eoORnvOffPpXKh4JMOdVauhXqHjYKuRKCod8Nh0T3GnV
2GJhBHz9rrdDqrm8kPGwPMDC7Axtz4PGhxjxFMDf6Vt47E7cjsG5xz6TOCsAndLF
mN9CD/UwVKMH7FXexoRl9rWrIO5HjuUOx3umGI4D/ZMhfe5Pg8w=
=Gwck
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
