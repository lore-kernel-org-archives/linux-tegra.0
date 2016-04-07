From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 8/9] usb: xhci: Add NVIDIA Tegra XUSB controller
 driver
Date: Thu, 7 Apr 2016 13:05:01 +0200
Message-ID: <20160407110501.GA10231@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-8-git-send-email-thierry.reding@gmail.com>
 <57063E91.1070202@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57063E91.1070202-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2016 at 02:03:45PM +0300, Mathias Nyman wrote:
> On 04.03.2016 18:19, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Add support for the on-chip XUSB controller present on Tegra SoCs. This
> > controller, when loaded with external firmware, exposes an interface
> > compliant with xHCI. This driver loads the firmware, starts the
> > controller, and is able to service host-specific messages sent by the
> > controller's firmware.
> >=20
> > The controller also supports USB device mode as well as powergating
> > of the SuperSpeed and host-controller logic when not in use, but
> > support for these is not yet implemented.
> >=20
> > Based on work by:
> >    Ajay Gupta <ajayg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >    Bharath Yadav <byadav-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >    Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >=20
> > Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> > Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
>=20
> ...
>=20
> > +static int tegra_xusb_remove(struct platform_device *pdev)
> > +{
> > +	struct tegra_xusb *tegra =3D platform_get_drvdata(pdev);
>  > +	struct usb_hcd *hcd =3D tegra->hcd;
> > +	struct xhci_hcd *xhci;
> > +
> > +	if (tegra->fw_loaded) {
> > +		xhci =3D hcd_to_xhci(hcd);
> > +		usb_remove_hcd(xhci->shared_hcd);
> > +		usb_put_hcd(xhci->shared_hcd);
> > +		usb_remove_hcd(hcd);
> > +		tegra_xusb_padctl_put(tegra->padctl);
> > +		usb_put_hcd(hcd);
> > +		kfree(xhci);
>=20
> Don't free xhci here, xhci is a part of hcd (hcd_priv) and hcd is already=
 freed in usb_put_hcd()

Ah, this was indeed reported to me about two weeks ago and fixed since
then in my local tree.

> Other than that I can't see any issues

Thanks. Does this count as an Acked-by provided the kfree() is removed?

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXBj7ZAAoJEN0jrNd/PrOh1kcP+wSuwz0z1JSq6XocFXb6zzdJ
cZX96nQdGb9ymLSOt590KKC5OMferBPxgu2rdyXjrL1gZwT9NNfkzk6FA+zxMlyw
M4uIFgxH7ODOJbPJMME6uGCA1CeR/UsStHqC9LkJKeL5/XxgvQmUnH9Jd9YkHfTj
FtXaVp0XuWWoI+1RT2fI9XghjGIDARYNZVC2G9ygWYr/fkhWhN5Kmki/LgcdmIHw
Yx9IS0sUInQ09GJ0Bq2ZnwgZn9shH4ktTtbiqHbJYcsOyycVVkug2qG9uSm8kzyn
TLgsg4zwY7quQ9jOgiDimXsQpiCKAmakbqiRLUch4Ubm+EVMQuAyH/QxOVzRs9qP
sfPk89FGCxynA3fSepIILhlE08zH6kHxFu0FDnRLCPGvRlwMp/vypPFI+EtDCgiN
CqrgdM2BDIHosef6DW7O0A4Wudd4yJpDqfod0fOA7OzUh2KYnhdPmQTI/89q4Xex
3nNkiHofc0k48uXya88KwWCNS2R4UBFNY6lSYXVjK7lzIn2F0l4dAI3kr6VYSQTE
JPSQy5/GiI7E6y3dcm5EAi2eD1xsGhnZYk3GU5a1lxKSyjyQklWF3X8kJCah3WYu
ErsYhUOeXhEiByH97o27OA8RKJ25HC3sJpegy0oHvEM/VW4fd+N+UIIQJ04Azbhb
6Sn9urJAqrsFnHJJKwM7
=QeRN
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
