From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch V3 12/18] usb: gadget: tegra-xudc: support multiple
 device modes
Date: Wed, 29 Jan 2020 10:27:28 +0100
Message-ID: <20200129092728.GB2479935@ulmo>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-13-git-send-email-nkristam@nvidia.com>
 <20200128181020.GJ2293590@ulmo>
 <7478f53a-c236-5442-8abb-7531edb89b29@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7478f53a-c236-5442-8abb-7531edb89b29-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 12:20:09PM +0530, Nagarjuna Kristam wrote:
>=20
>=20
> On 28-01-2020 23:40, Thierry Reding wrote:
> > >   	struct tegra_xudc_save_regs saved_regs;
> > >   	bool suspended;
> > >   	bool powergated;
> > > -	struct usb_phy *usbphy;
> > > +	struct usb_phy **usbphy;
> > > +	int current_phy_index;
> > Can be unsigned int. It's also very long. It might be better to choose a
> > shorter name so that when you use it, the lines don't get excessively
> > long. Alternatively you could keep this field name and instead declare
> > local variables to reference the current PHY to make lines shorter.
> >=20
> > Actually, looking at this a bit more, I don't see current_phy_index ever
> > used by itself (other than the assignment and one check to see if a PHY
> > has been selected). So why not just store a pointer to the current PHY
> > and avoid all the dereferencing?
> >=20
> > Thierry
>=20
> current_phy_index main purpose is to quickly get which index for USB 2 an=
d 3
> phy's to be used. This is used at mulitple functions. Based on your comme=
nt
> above, I believe its good to use 2 pointers for UTMI and USB 3 phy's, whi=
ch
> are points to current phy index. This ensures to keep line length as less=
 as
> possible.

Yes, I think in general it's preferable to use the objects directly
rather than an index into an array to find the objects.

Thierry

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xUAAACgkQ3SOs138+
s6Hu5g/8C6/Ok0YQVG4K+SUpBeDRFOEhJdFXvbx8GY1l2VGOb2zwbXpyBvoBIlg5
208voSlRwDaYhJAeIYL8czDUJlPuxe24896v5zmuxBNDauiMzTMJF8wkrjFupf3w
TobSBAJTsPPhdTxxz2AmOPVUi4AVn9oyymZG1KEQrzxFdoktA3SPm6lqrGh5CxoO
c3nTfgPGqqiZrhP5xxquYqdVrod0x0KDyrtYwyt9AO+5291H2JxyFb9e9sJvQ4Tx
qesj5dLAfet2CfgZUYn7bwtDmo8bMEFvKOO6Qh2T+mZpFuK05hPvSSbT2JZTTGmK
VCXSmauItknL/WUjwUS2ugEMCccGiyzAD3XMX7DhWF+du3iXdeQAyEaL98YLMbXH
mWEMjNMx8fMWX9Z9nsRfaIEP22ZGsfxPt1IcNWlGI+D0r4VY7EX9rKqSAEmLfCIZ
RZXv2oqah0T2DJNed0wjStwXDo03uzoFS0NwGkUyf5/erFZSykXkSRMySj1QJvCT
YG5Eyo92i+XB3ibLCVW0wdK0Fkx2XzbutPtGW2MIA4R3agSi8AWl9axdOlPyQIOu
wFHUB5bSQr/2h3CdnMfh5DQ6auZUTAmSSr+bY5oi7Zmkezkm17Jp6PxbBv0e1Q//
gaaDwV1HF2pyFyMlqkYBsyLyTGz0r2xjp7+M+iRd5WYeOB6SdF0=
=QD3x
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
