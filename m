From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/9] of/irq: Introduce __of_irq_to_resource()
Date: Mon, 23 Sep 2013 22:50:39 +0200
Message-ID: <20130923205038.GD5216@ulmo>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <1379320326-13241-6-git-send-email-treding@nvidia.com>
 <5237782B.3030804@gmail.com>
 <CACRpkdadFct8iXSaRRQ3a2YQryfMjJwVaq+8wgWXS1Ymj3M_WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdadFct8iXSaRRQ3a2YQryfMjJwVaq+8wgWXS1Ymj3M_WA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2013 at 09:20:37PM +0200, Linus Walleij wrote:
> On Mon, Sep 16, 2013 at 11:29 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > On 09/16/2013 03:32 AM, Thierry Reding wrote:
> >> This is a version of of_irq_to_resource() that propagates the precise
> >> error code instead of returning 0 for all errors. It will be used in
> >> subsequent patches to allow further propagation of error codes.
> >>
> >> To avoid code duplication, implement of_irq_to_resource() as a wrapper
> >> around the new __of_irq_to_resource().
> >
> > I think the callers in this case are manageable to update as well.
> > Several cases could simply use irq_of_parse_and_map instead as they just
> > pass in a NULL resource.
>=20
> I second this comment.

That should be fixed in v2 of the series that I posted a few days ago.

Thierry

--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQKmeAAoJEN0jrNd/PrOhpsYP/2xzs3k69Qi+gWUntP1If6vS
9gqRbcx8LT4ESsT94HHYieEF/P821YGLviE3Hi3LRSCZwR8mEYmFXHdf24Y4Z6wC
zexH3VxggvAe6RtDx5I8+0vyia4UV8N5Hx3xBqPkBRsQYIdMkEf5mCjqfs71RntT
kQu4jCeaznIiMMn18YkqwpJqHuCeHn3u6HmuKn1xSEbxcf8etXEE5bANehkdPyNO
7E7NTSDrmCnXhwJRlALlAee1TmEaV8TmF7mYtVM3QmjP+PX7hkSk6rbJ08XuWUCS
DCOiOMTuGlyRkRVJZJiWQO/ajmZT5bWXMUoOzYuV5RzDsUzbQjw9oFEbzs6ww5zi
7CtHnlNS3r98BDMb+jk9+CJ55xm0+BIyhuq540Dmn8nGuV50LniQF0ViHTBc9JBQ
vQA+I5PtruaiJbDokA8KVn+Q7VbPStSMgvrUuPOQudVJICfUvsc3df81BVAgD4zW
kZzBOVtb+PZwNFyYC5u8Dnx9yJqjQebkOccYYKESI1RzJW9YSPtMGe/XXZmqNsVG
pHI196XlHrih3fbPKD6J1unERKfmDcXswYtcU2NJNMeMCjlBDq+PJZLsbc2mwL/l
aGhf2Wx13qqHid+cBo7P75/frWEQU/wpUKugLCGs7UeFYKk/D3Ofr4BeRDYMAr0K
Geb6Q+K8bx8LJGDUpDKG
=gApM
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
