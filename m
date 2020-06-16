From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 31/38] dt-bindings: panel: simple: Use
 unevaluatedProperties
Date: Tue, 16 Jun 2020 16:33:59 +0200
Message-ID: <20200616143359.GA3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-32-thierry.reding@gmail.com>
 <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKHkW8Q-prwEP_tkyWHUU5YuQHOipzjZ9MWa9M+uMoCkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 08:28:13AM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > Using "additionalProperties: false" results in rejecting any of the
> > properties defined in panel-common.yaml, whereas the intent is to
> > inherit the common properties defined in that file.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simp=
le.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 34fe3d42b829..c58bc90ffd43 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -275,7 +275,7 @@ properties:
> >    port: true
> >    power-supply: true
> >
> > -additionalProperties: false
> > +unevaluatedProperties: false
>=20
> But we've listed the properties we use here. Some of the common ones
> may not be applicable. Maybe they are and if so, then you should drop
> all the ones listed with 'true' with this change.

Looks like the only one I need this for is ddc-i2c-bus, which is already
contained in panel-common.yaml. unevaluatedProperties: false is able to
look into that and hence doesn't flag this as extra.

However, I can also work around that by adding a "ddc-i2c-bus: true" to
panel-simple.yaml, which seems like it's the currently preferred way to
do this. Is it expected that once jsonschema/dt-schema support the
unevaluatedProperties keyword that we'd move towards using that instead?

Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o2FQACgkQ3SOs138+
s6ExBw/9EB6cRu6J3S8O3Qku+EHrCFgikSr6SIclBZ6Rh/OQBVAWBUenyvEtBKRX
R9wCmfiqtZZ07Zkjt5vrchKnnmkwKHnRb61Kf3STUxOKi4v7AwgUCu6KA/nUze0+
pF5VpZU0EbsYHPdUn2Ho0YNXo6J6CnE7aCUerstpAnHaCbAFquGgVzQW4irPFYP6
GYGf23qpN8JvCKokLC/Va+7vOw+ajh8Be6N8QG/V9nS+AJa+IcLcNvJUo9ZuU65q
w4+4foKq2bJVe175RLAvWM8Nmu0Djdq6R/FUQAQSg6hXUCcxMLPmve6dUd5+B1i5
Mo5PvG3hAr/pDZdgrlDmMG7pqOoJBxmOnFmp65GAIt8chH9/tHqp6QcajPMQdvl4
VVrNiAeZ8Swm9momu+w0O1Fx9IsOCUCCU1pE1RjX3Swgm3BD2S9TI182bUFetC+N
R0mJ/U9kkWV9cu/KbKrUBPxdcglGliXIhVgb7MUA3BMzY1/+jOUT89XjBlXeazGc
WwtfG8Yb4LwgbpdXLNvJA4XOuT/F6DGGRbbncEAuBUpHxxjcVxjMegjB/p1xm7zC
eCDSqVXewA8Gz9PP2XLi+Hp020w+seHaLYeC44P4wX1Bho5v38KOTL0hNcrFfwdu
l85dl+MXcfhOK4NEd6jOg3JWDMdyIjhl52H/j0m7K1yH7bPV2AU=
=hcVb
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
