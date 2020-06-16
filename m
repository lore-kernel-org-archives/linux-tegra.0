From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 30/38] dt-bindings: panel: Allow reg property for DSI
 panels
Date: Tue, 16 Jun 2020 16:35:24 +0200
Message-ID: <20200616143524.GB3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-31-thierry.reding@gmail.com>
 <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 08:29:35AM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > For DSI panels the "reg" property is needed to represent the virtual
> > channel of the given panel.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/display/panel/panel-simple.yaml        | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simp=
le.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index d6cca1479633..34fe3d42b829 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -267,6 +267,9 @@ properties:
> >          # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
> >        - winstar,wf35ltiacd
> >
> > +  reg:
> > +    description: virtual channel for DSI panels
> > +
>=20
> panel-simple-dsi.yaml?

Heh... I had completely missed that. I've now replaced this patch with
one that moves the lg,lh500wx1-sd03 compatible string to the DSI schema.

Thierry

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o2KwACgkQ3SOs138+
s6HG9g/+PX0Xjkon9vFxMTkYjjJ7yg1KDrHTwi6omDpt7goanb39WXqanIC8rrDi
VxB3rcws6TcsgLzMkjY/mxtEu2eG/71ERDkiLKmGbbzQ6/sE80iqc5FUD9EGjeyU
u37A1yWgeby3wyDdCmi9aGO+IXBGMF6MtX7Fjl5MG67HLJL6+NeN7uPOybNS1ege
x/YuaQCX4DkL+GTTCXyqwoPA3kbK3o+JBDdwoHt29ECWk9FeMWKiBQJnDP4TA3zN
SKj/zhlEfckOHyTqBR52bI3j9gUznzFXHC7ToOZy7kxjxIkYLEXdYDo4/OKs2GkE
7eJ9xZs5PSEP6jjmItKlMAkhE4kivZPJGhTWquVPOkGA6Trq5m98ZY0XgVGqywLo
zuHZV45GWkJNjw8ULu0grhszYjSGEMNp3rfoeW1CVcwzwa9641PQ1ljW3Kl2tOSh
syRskBn8vRDjvt91wficpHNa+tv+5XGs2FtE/axID0LNGm/Z9x1MgvI86KMhL4eV
GzraTWwYks5itO9iLE3f9LaROy2NvGzS7Z0pMp/XF7dVx3Lx+8O9Ebaz3SZn3Pzc
zcceED4jzTOgfCPR+uHOY3aqcRmqVPe6CDd/2xDRs+gOxbLpQa0Y4huKidlklVYc
zy9IRXmJGKdQEBA1vyIKIrZCDO61EpAM9sax/aTF1QdjyRzDGYE=
=2xCw
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
