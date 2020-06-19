From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 28/38] dt-bindings: phy: tegra-xusb: Convert to
 json-schema
Date: Fri, 19 Jun 2020 08:47:21 +0200
Message-ID: <20200619064721.GC3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-29-thierry.reding@gmail.com>
 <20200618023826.GB3343853@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UPT3ojh+0CqEDtpF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200618023826.GB3343853@bogus>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UPT3ojh+0CqEDtpF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 08:38:26PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:18:53PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Convert the Tegra XUSB pad controller bindings from free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../phy/nvidia,tegra124-xusb-padctl.txt       |  778 -----
> >  .../phy/nvidia,tegra124-xusb-padctl.yaml      | 2800 +++++++++++++++++
> >  2 files changed, 2800 insertions(+), 778 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra1=
24-xusb-padctl.txt
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra1=
24-xusb-padctl.yaml
>=20
> This one I definitely think should be split up into multiple schema=20
> files. There's very little shared.

Okay, I think I can do that. It's going to be a little annoying because
then there's going to be at least four bindings to check, but I don't
think it'll be all that bad. Once the bindings are merged I think I'll
end up mostly running dtbs_check anyway, in which case the number of
files doesn't really matter.

Thierry

--UPT3ojh+0CqEDtpF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7sX3kACgkQ3SOs138+
s6Egew/9EzD8qcEWgHXg7fK3vbgWMrGJF0FD7ME0KjVm246lue0ANPyN/msSik3s
5Go0h5B1Ett33kf7SVCOU5qGzn7rbNu96Mws1W6dC/pSYOxZF2ngapcOwwHmpeTa
qx9QZLwRHSFOb2JwRkrdEJ2aPBJ8LiBwM/N0gfB9FqTfRDKWbhxyB8bj4hp3VXlL
Etru8tiNZuNT7MyakGP4eaKpMW/+gQfO/CPON7VCyYSn+BXPMlifPbZqr+47Ycve
zktBi3NLQv8MjmTdE2FO9b7rpL+n+vuEifHDMMncoMsn3arNz5u7tYB0TdgBAKST
w9hbQvUyeZJYVax6w9VRQOSU/xBOGTHTjZyL11ie8DylOHfPAQJJm59l50Klq+iq
JO6xksk0X3Lyh1DHV4yM4amyEQYq7zv3vUkiWfdWlb1uaj/DqRZwTPgug2iMxr1w
qRySdQHZvoqh+Dugo9a9NQCOgXXvjQ1gl+LDx1cA463gs8kZ/iN5ZTPQuh2HlW8k
VJsF6E8rVnzxCZKV0YEqSortSIPq+7eVLB3RuhKvO/FgklhFyYpwTGg9dDSrbUhw
im0YWx5lVNjf49LqacvD5wZ+lwO5eREyFwrDK/EWfvSuX8I8UVWmCHZDZcaYzlTe
ad7J6gC8W3mZWj8HudXnhlKpH9pMGXuDVu/akaowuIF0VCpYng4=
=iqzA
-----END PGP SIGNATURE-----

--UPT3ojh+0CqEDtpF--
