From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 0/5] Add support for PCIe endpoint mode in Tegra194
Date: Wed, 11 Mar 2020 15:30:53 +0100
Message-ID: <20200311143053.GB494173@ulmo>
References: <20200303181052.16134-1-vidyas@nvidia.com>
 <20200311105141.GA30083@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200311105141.GA30083-LhTu/34fCX3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 10:52:00AM +0000, Lorenzo Pieralisi wrote:
> On Tue, Mar 03, 2020 at 11:40:47PM +0530, Vidya Sagar wrote:
> > Tegra194 has three (C0, C4 & C5) dual mode PCIe controllers that can op=
erate
> > either in root port mode or in end point mode but only in one mode at a=
 time.
> > Platform P2972-0000 supports enabling endpoint mode for C5 controller. =
This
> > patch series adds support for PCIe endpoint mode in both the driver as =
well as
> > in DT.
> > This patch series depends on the changes made for Synopsys DesignWare e=
ndpoint
> > mode subsystem that are recently accepted.
> > @ https://patchwork.kernel.org/project/linux-pci/list/?series=3D202211
> > which in turn depends on the patch made by Kishon
> > @ https://patchwork.kernel.org/patch/10975123/
> > which is also under review.
> >=20
> > V5:
> > * Rebased patch-2 on top of Lorenzo's pci/endpoint branch
> > * Removed unwanted header files inclusion in patch-5
>=20
> Applied patches 1,2,5 to pci/endpoint for v5.7, please let me know
> if something is missing.

Great, thanks! I've picked up patches 3 and 4 into the Tegra tree for
v5.7.

Thierry

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5o9hkACgkQ3SOs138+
s6EhXg//cjYE1EBraQovAb9Meb89XpZgwlbTBz4wVpX5gGBnmOdMVLAJdqSbXdVQ
AxZT3EVQOzy24ZqGwb118iN3a28CNYU9FLUdZM/UoPnA4NHC0Dk62cIeWUly7FU7
geukEaBFNJSl/6EPuAo0Qobgow0Yn5anvPjKgpZ+0BKK/e/+aUYZNzFs0vpde9xq
9PPsB1rGj0KrrDSnAFS1hxrL85yL8B5Hz2X//Zm/WFgC3C7X2lSSCL9z4RWyeT1F
pNc41o45blCOmcA2wZi7WbaMCYkyBvQyjEmBPBTnF/6P3R+J3XWtyWcTJOSwgjby
MHLshrbG0T4HNxFtbZ38G14Q//mCu5kYuGWLW/P3187nejD2XF1wNGYSqmwE9Eny
zcOH7tqEofowLvCjLa3BZtHiSiAxRdwuLY4Q6nh1tEydpQqo5bKp3A52B6vjdqoo
7GBhLvJ6tIal+dZUxI7nMz7wPdb53TrMws6rhQ4/bcb1oprZwXQzL8DGoNij6aBl
kYU0OvWb1Wh9t+EbLa3BKdupY/OuBVK1zu6/mH1+MYTD/FZviyj+EXH8rPLbzki5
THwdnIDEs0dvf3nEfIjXnyVfr+QrVOsrsKOpyfjHq3N0yGeOXavt1Su/XHZ8mBDX
r2nBg9NWA2vPlngiW49ndo080lFoiG3mGmRwgk21+1HJIDdPcys=
=QA1n
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
