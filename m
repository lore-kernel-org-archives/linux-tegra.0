From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/38] dt-bindings: display: tegra: Document interconnect
 paths
Date: Tue, 16 Jun 2020 16:47:53 +0200
Message-ID: <20200616144753.GC3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-9-thierry.reding@gmail.com>
 <82888e53-c539-7d61-666d-bd6dbc494bfe@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <82888e53-c539-7d61-666d-bd6dbc494bfe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 06:52:44PM +0300, Dmitry Osipenko wrote:
> Hello Thierry,
>=20
> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Commit description is missing, checkpatch should warn about it.
>=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 52 ++++++++++++++++---
> >  1 file changed, 46 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-host1x.yaml
> > index 3347e1b3c8f0..684fe25641f1 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ho=
st1x.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-ho=
st1x.yaml
> > @@ -97,8 +97,17 @@ properties:
> >    iommus:
> >      $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
> > =20
> > -  memory-controllers:
> > -    $ref: /schemas/types.yaml#/definitions/phandle-array
>=20
> Why memory-controllers property is removed?

Because it was accidentally added in patch 7. This is leftover from an
earlier set of patches.

> > +  interconnects:
> > +    description: Description of the interconnect paths for the host1x
> > +      controller; see ../interconnect/interconnect.txt for details.
> > +    items:
> > +      - description: memory read client for host1x
> > +
> > +  interconnect-names:
> > +    description: A list of names identifying each entry listed in the
> > +      "interconnects" property.
> > +    items:
> > +      - const: dma-mem # read
>=20
> Please notice that Host1x has two memory clients: one for DMA engine and
> second I don't know what's for, maybe for indirect memory accesses. Why
> you skipped the second path?

I'm primarily targetting Tegra186 and Tegra194 with these patches
because we need the interconnects properties on those platforms in order
to correctly set the DMA masks at a global scope. For Tegra186 and
Tegra194 I can only see a single memory client for host1x.

Looking at the register documentation, the host1xw and host1xr clients
do exist on Tegra210 and earlier and they are used for indirect writes
and reads, respectively.

I don't think we use indirect reads/writes, so we can probably do
without the corresponding memory clients. Alternatively we could
conditionally add them on Tegra210 and earlier.

Thierry

> >  required:
> >    - compatible
> > @@ -489,6 +498,26 @@ allOf:
> >              iommus:
> >                $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > =20
> > +            #interconnects:
> > +            #  items:
> > +            #    - description: memory read client for window A
> > +            #    - description: memory read client for window B
> > +            #    - description: memory read client for window C
> > +            #    - description: memory read client for cursor
> > +            #    # disp only
> > +            #    - description: memory read client for window T
> > +            #    - description: memory read client for window D
> > +
> > +            #interconnect-names:
> > +            #  items:
> > +            #    - const: wina
> > +            #    - const: winb
> > +            #    - const: winc
> > +            #    - const: cursor
> > +            #    # disp only
> > +            #    - const: wint
> > +            #    - const: wind
>=20
> Is this really intended to be commented out? Looks like this is an
> unfinished patch.

I started adding this after finishing Tegra186 and Tegra194, but then I
ran into various other issues and wanted to do this step by step, so I
plan to go back to Tegra210 and earlier later on and stub them out.

However, since I had already done the research I wanted to leave these
in here for later reference, so I didn't have to go back and look this
up again.

> In the patch [1] I used memory client names for the interconnect paths.
> I like yours variant of the naming, it is more intuitive.

I only noticed after posting this series that you had sent out the
series for interconnects and that it conflicted in the bindings.

But yeah, I do also like the contextual names better because they are
more intuitive.

> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20200609131404.175=
23-23-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/
>=20
> I'll rebase my series on top of yours patches once you'll get them into
> linux-next. Looking forward to v2!

There's quite a bit to review here, but I also have a couple of patches
that depend on these, so yeah, it'd be great if this could go in sooner
rather than later.

Thierry

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o25YACgkQ3SOs138+
s6Eo/hAAwozV0hE0VB+QuRcHIfq8OEujXsQXxA+kDVCgbCwCF+2ymfSu4uzUhWnD
73/a1MoHrnmEIHDsrTO9jSHlqVYWrD6GOK+ITW14Eckj3Z/T+rJWdflwrqMko9Z9
gkaBmZ88cGIYQJiHalVXHIEAvAoNS7V8E4c27CQbjTq9QTdGaeMRAYDrWWLzd23P
q3ibmsJZ2bhAzPXo9XSe8hmoNVhbmZI0q3+7y7e28q9UmimhyF48nY/rT4XTg4aY
5N++oqAnDgWAV1NIXEdbS+KpFlzOxAN9oL6LAUILO0u9ANW8dDwq/Deb5N4HMmeg
YPo/H0GcRnqESIkfOPJEX9DxPjpUElXhZTNzPAbiawvNFuy2gqrWw4mGrtwRTQDw
mtvUvfXSo3sn3M99veGm/7Tl/L09mYJOzUl76+SmzVZDVoAaZaPRFm6ZJ+mmrrtW
XuKzRyCz6Go2a9Of1uH98VDm+nm/38nFwlAeRvBnBaLEpP+Udt0Dkmmpx0gHZxbO
x5OF2/v7UJ2yCw9av0q1sA5HTKVsOer31yDieCM9UlbrpavGWWbAP701zeuXHqbM
w6/ZSMddU6hoPHWQWMwD5pCL+g9JkItudDir3cAVaRtYAGaPAFdduyZq0CQNrWXP
OS2lKiOH2Imx0YaeCtQ0wunpnxPtimTtrjNnikQqlgHpmWyaECg=
=bQCD
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
