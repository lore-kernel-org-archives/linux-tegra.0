From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Date: Fri, 19 Jun 2020 08:45:48 +0200
Message-ID: <20200619064548.GB3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-27-thierry.reding@gmail.com>
 <20200618023457.GA3343853@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200618023457.GA3343853@bogus>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 08:34:57PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:18:51PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Convert the PCI IOMMU device tree bindings from free-form text format to
> > json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/pci/pci-iommu.txt     | 171 ------------------
> >  .../devicetree/bindings/pci/pci-iommu.yaml    | 168 +++++++++++++++++
> >  2 files changed, 168 insertions(+), 171 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
> >  create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml
>=20
> This needs to come before you use it.

Good point, I'll reorder it.

Thierry

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7sXxwACgkQ3SOs138+
s6E2QhAAhmMVuu7UBgGoT0iLKZpZr7XBF43fJFTpH8OD9A9cHbiHatTNkoLvaXxy
U+TNMBNF1lWTH/939YvPEaVv4uH7Y7YspcUnTqaSDGGMJgySh9+3uPAauXsZUUow
Xcelnw41elrHbj+kEJTocUjT4WjvcO2YlHHsMX29nVYzi2FylR7BqJa90zbleJaV
K3bQge5K0Q7Xgjnn8dEUwHlo6wlYRwBAQmLx3bVmXwKp9nVIz8LXPIJSTMz4HlmQ
87kpEKDt5GCVjhRbcFlDZ0aZhKtim7t+xPGC9CqqS7R+chXvu6IsCIPNr6GJOcFk
dPHfwq3ftGQTytp/fLW+eN85ooKrEVqoQ9bSJqD+L5IPIYumnItYmOTImt90Yrm2
eE6MIpL1hgZeYOz/QlTAxCl/bbjY+tFX/RN3sN4cJZivKBaD8FveH5TPMP7CdzEW
K6gx/yoRmw4PYw1+L1VLIjJFqI97IZwD+jYiJXhUOMcWVt55jtppT/agalacI8+Y
E7+upZwgooxkedU2yKNj0g6gFMqT41UhY3VgptgSHNpGX8BZuJO4QzjAZxU7+SvX
6kdnrSiLyuDz+BY1COVjWji3hjYhCYgJ1jeq1HY6UiVLsCk7cKMt5J6Y/oYfyN49
OkoryNOt/kaQKPpLvF++n2H4EsPMMX/xNhiw6vSQ9aeny7doZzw=
=3bjo
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
