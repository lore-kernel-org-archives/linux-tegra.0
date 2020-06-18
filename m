From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Date: Thu, 18 Jun 2020 16:18:37 +0200
Message-ID: <20200618141837.GC3663225@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-27-thierry.reding@gmail.com>
 <20200618023457.GA3343853@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200618023457.GA3343853@bogus>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rQ2U398070+RC21q
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

Of course, will rearrange the patches.

Thierry

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7rd70ACgkQ3SOs138+
s6E/Bg//RRvzule+iB5OmSwtBkbTLAFMGY0VImkZFaBaLIn6krNmYE5NLg4naT7i
9TYu5tpBj/FyPHA/CtkoZ2yAIZNzYrB3UoBaK1eTJNWpVAmwvxzDTCRcl+moDunX
CZ3braHx0qlTNTMw7xMpJRqHaahmGF/IVmb58XIKhDZWo3d8W66BNK+4dm3xL4cH
/PEaA080/3EkKtNURgFABJ0ygpDIFkho0WghFBQ8qlLv+y9DUv8BkdIpybawN6QI
v2cFKs8LZJlm5SO0KdSr/3epqBnGtSpqoprP/3zQ/B5hplm/G2cEfm/mlMu3U7YD
3+vVjlVnjH6MPJmucr15MyiKjN7jzQcs5fXMyHR51efSgSJGFU3B5Gcrt/0ldK9V
064nbvpUCiOpdTAbADvrkm+hM47Dp5SXiZM1R2MkdcacTD3s2V8Wx8xQXs+zE3Nm
vx5od4iKb4rSQ5DhE5LQWRBuJHcpJ/VB7+f9Xwr319bMfFo0Oz+gFquDgdrdnE/z
5UGlqo1rHt+haYUTFUzMJzHaOWxe0PW1gR3d/yN8YKr/A+MKaaOApblIraVmqj2S
RXyAeNLLtN504MBbB0HygQ1LCEE+DhaGq3S4MqfE1jBvnuJVzcaSpu/H12++4Oze
0M1Rr6PVfr81kbpcpyGA+bvoSCuA9dSVLDBrVD5VJM+c67wn6IY=
=hFVF
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
