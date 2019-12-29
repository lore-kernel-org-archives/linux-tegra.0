From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V2 03/18] phy: tegra: xusb: Add usb-role-switch support
Date: Sun, 29 Dec 2019 10:36:43 +0100
Message-ID: <20191229093643.GA47966@mithrandir>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
 <1576660591-10383-4-git-send-email-nkristam@nvidia.com>
 <20191219132650.GJ1440537@ulmo>
 <74d94004-2022-3b04-6cd9-d6b1e9eca230@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74d94004-2022-3b04-6cd9-d6b1e9eca230@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 12:09:22PM +0530, Nagarjuna Kristam wrote:
> On 19-12-2019 18:56, Thierry Reding wrote:
> > On Wed, Dec 18, 2019 at 02:46:16PM +0530, Nagarjuna Kristam wrote:
[...]
> > > @@ -551,11 +556,42 @@ static const char *const modes[] =3D {
> > >   	[USB_DR_MODE_OTG] =3D "otg",
> > >   };
> > > +static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role =
role)
> > > +{
> > > +	dev_dbg(dev, "%s calling notifier for role is %d\n", __func__, role=
);
> > I don't understand what "for role is %d" means here. I think perhaps you
> > meant to simply say "for role %d"? Also, perhaps add parentheses after
> > the "%s" to clarify that you're referring to a function.
> >=20
> Yes, intention is to print role, Will update as mentioned "for role %d"

It might be better to print the name of the role here because I suspect
very few people know the value of the role defines without looking them
up. I thought there was already a function to return the role name for
a given enum usb_role, but it seems like we only have name -> enum
conversion. Might be worth adding that, but doesn't have to be as part
of this series.

Thierry

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4Ic6YACgkQ3SOs138+
s6F9Qg//diLO90kPs0EI/W6HXy+wcF1k8DI9KuspMV5DRFTRcqtt6dBJ+2wK3uQh
57OWWgV/+4Fu+QLNp20OSSm1s9GM//iV43ZfoT0J/flkuRLVQNu3rjLmHJG79oQb
pozYgHxEfEqv2uB6ZZmtIN2ev+MEjHWbl9hJ/qwuNdPQTulsDjLk9TIodV/LRGyt
QzAUcyhLfJuEqrVXEYUuvov5Vmf8qm/nQKKoRdcnLGz7pw2o9GlnhIgpXKupD08g
6Z6FWMM3agKXcWB8dVb3UzSbbUrVP9lx9+bOfnVy1QzvjWaRXJFeh0AmNxqdtbJX
NpFR3eZZUkrD2N4mtOqaaiVSoa8wQq5PLOOtIE6QvBBPxk003BmntrlKi3nuxScR
k7YpBrWwxszHiGLEpuPGS9weGV0m7nbkp0x+YEc5JuGyj/HGmyl9P2CbFoHOdBll
YsA90b4DXW2W9k3HV/tAYcQPjRqZ9vf6goHibQWjOgCqTVMwnJHo2i9ThNr2PPUT
/lieJb5M837w/n67TCbwDLad/xX6DnpYts2yFSttElJALSxrPooChhN7Ky8p1hrd
6sans1bQHa9itH4JQOK3ZmQtZEiBhAfXa1VXMiKjmmRUIhhRymediKJSfMucjqkZ
3s+MXSWnzU+ZOqrPu+yf4jceuMDf3rM3Ngb6439HS6iWyOmEd0U=
=tuXa
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
