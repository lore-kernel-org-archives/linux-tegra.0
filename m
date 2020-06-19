From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
Date: Fri, 19 Jun 2020 10:08:39 +0200
Message-ID: <20200619080839.GE3704347@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-8-thierry.reding@gmail.com>
 <20200617231326.GD2975260@bogus>
 <20200618141630.GB3663225@ulmo>
 <CAL_JsqLfpSgJxRMNTFdAsSEVOTU6a7bzD8v8Sg1LPXHdgEmdAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLfpSgJxRMNTFdAsSEVOTU6a7bzD8v8Sg1LPXHdgEmdAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 09:23:58AM -0600, Rob Herring wrote:
> On Thu, Jun 18, 2020 at 8:16 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> >
> > On Wed, Jun 17, 2020 at 05:13:26PM -0600, Rob Herring wrote:
> > > On Fri, Jun 12, 2020 at 04:18:32PM +0200, Thierry Reding wrote:
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >
> > > > Convert the Tegra host1x controller bindings from the free-form text
> > > > format to json-schema.
> > > >
> > > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-host1x.txt   |  516 ------
> > > >  .../display/tegra/nvidia,tegra20-host1x.yaml  | 1418 +++++++++++++=
++++
> > > >  2 files changed, 1418 insertions(+), 516 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-host1x.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-host1x.yaml
>=20
> [...]
>=20
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              - nvidia,tegra124-host1x
> > > > +              - nvidia,tegra210-host1x
> > > > +              - nvidia,tegra186-host1x
> > > > +              - nvidia,tegra194-host1x
> > > > +    then:
> > > > +      patternProperties:
> > > > +        "^sor@[0-9a-f]+$":
> > > > +          description: |
> > > > +            The Serial Output Resource (SOR) can be used to drive =
HDMI, LVDS,
> > > > +            eDP and DP outputs.
> > > > +
> > > > +            See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for in=
formation
> > > > +            regarding the DPAUX pad controller bindings.
> > > > +          type: object
> > > > +          properties:
> > > > +            # required
> > > > +            compatible:
> > > > +              oneOf:
> > > > +                - const: nvidia,tegra124-sor
> > > > +                - items:
> > > > +                    - const: nvidia,tegra132-sor
> > > > +                    - const: nvidia,tegra124-sor
> > > > +                - const: nvidia,tegra210-sor
> > > > +                - const: nvidia,tegra210-sor1
> > > > +                - const: nvidia,tegra186-sor
> > > > +                - const: nvidia,tegra186-sor1
> > > > +                - const: nvidia,tegra194-sor
> > > > +
> > > > +            reg:
> > > > +              maxItems: 1
> > > > +
> > > > +            interrupts:
> > > > +              maxItems: 1
> > > > +
> > > > +            resets:
> > > > +              items:
> > > > +                - description: module reset
> > > > +
> > > > +            reset-names:
> > > > +              items:
> > > > +                - const: sor
> > > > +
> > > > +            status:
> > > > +              $ref: "/schemas/dt-core.yaml#/properties/status"
> > >
> > > 'status' should never need to be listed.
> >
> > This seems to be needed at least when I try to validate against a single
> > binding, like so:
> >
> >         $ make DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/disp=
lay/tegra/nvidia,tegra20-host1x.yaml dtbs_check
> >
> > I assume that that somehow prevents the tooling from looking at any of
> > the other bindings, which in turn then causes status and other standard
> > properties to never be defined and then it flags them as extra and
> > causes a failure.
>=20
> I'm surprised using DT_SCHEMA_FILES makes a difference. I'm guessing
> that has your 'unevaluatedProperties' support. If so, that means
> there's an unintended side effect that any common schema property
> becomes always allowed. That's good for 'status' and 'phandle', but
> not so much for 'reg', '*-gpios, '*-names', etc.

I don't think that's an unintended side-effect. If the property
validates against a schema it counts as evaluated, doesn't it? In order
to avoid that we would somehow have to restrict which schemas contribute
to the evaluatedProperties annotation and I don't think there's a way to
do that because we don't know which out of all the schemas is relevant.

> > I think I've even seen this trigger on dt_binding_check if I happened to
> > have status in there. Now, you've mentioned elsewhere that we shouldn't
> > use "status" in examples, so that would work around this. However, I
> > think I've seen this happen as well in examples that referenced some
> > node via phandle, and then dt_binding_check would emit an error about
> > phandle being undefined.
> >
> > Perhaps this is a problem with the tooling? Should we instruct the
> > scripts to always include the core schema even if we're only testing a
> > single YAML file via DT_SCHEMA_FILES?
>=20
> The purpose of DT_SCHEMA_FILES is to see warnings just from that
> schema file. If the core schema was warning free, we could add that,
> but it's not. Plus that wouldn't solve the problem here. 'status' and
> 'phandle' are added to each schema by the tooling (along with other
> things), not by another schema file (well, they are in another schema
> file, but they are added to each schema so that 'additionalProperties:
> false' works).
>=20
> This is certainly a limitation in the tooling in that what you have is
> a bit different from the expected form. Generally it is expected that
> everything is defined under the top-level 'properties' and then any
> 'if/then' schema only add further constraints. However, you have the
> child nodes only defined under an if/then. We could fix that, but I'm
> not sure I want to. IMO, extensive use of if/then is a sign the schema
> should be split up. More on that below.

Okay, I see your point.

> > > > +            pinctrl-names: true
> > > > +            phandle:
> > > > +              $ref: "/schemas/types.yaml#/definitions/uint32"
> > >
> > > 'phandle' shouldn't need to be listed.
> > >
> > > > +
> > > > +          patternProperties:
> > > > +            "^pinctrl-[0-9]+$": true
> > >
> > > pinctrl properties are automatically added, but maybe not if under an
> > > 'if' schema. Really, I think probably either this should be split
> > > into multiple schema files or all of these child nodes should be
> > > described at the top-level. I'm not sure it's really important to def=
ine
> > > which set of child nodes belong or not for each chip.
> >
> > I'm not too worried about the set of child nodes for each chip, but I
> > think having this all in one file underlines the importance of the
> > hierarchy. If these were discrete bindings for each of the compatible
> > strings it'd be easy for someone to create them as standalone nodes in
> > device tree, but that's not something that would work. All of these
> > devices are children of host1x and they do depend on host1x for a lot
> > of the functionality, so the hierarchy must be respected.
>=20
> I'm not saying don't describe the hierarchy.
>=20
> The first option is 1 host1x schema file per SoC (roughly) and the
> 'host1x' parent node would be duplicated in each one. That doesn't
> worry me too much as it's all standard properties and not that many of
> them. Though you could have a common 'host1x-bus.yaml' just describing
> the parent node properties that each <soc>-host1x.yaml references.
>=20
> The 2nd option is keep this as a single file, but just move every
> child node definition under the top-level 'patternProperties'. This
> option has the limitation that you can't enforce which child nodes are
> valid per SoC.

Okay, I'll give the first option a try and see where I end up.

> > > I'm stopping there. I think the rest is more of the same comments.
> >
> > I've made a pass over the whole file and fixed the issues that you
> > pointed out above in other places.
> >
> > Sounds like the biggest remaining issue is with the duplicated standard
> > properties. I'm not a huge fan of giving up on doing the right thing
> > because the tooling can't deal with it. I think we should fix the
> > tooling to do the right thing. So if there's something in the core DT
> > schema then it should apply regardless of what mode we run in. Much of
> > the above issues should go away once that's fixed.
> >
> > Any thoughts on making some of the schema files "always included"? I
> > haven't looked at this side of the tooling at all yet, so I'm not sure
> > how difficult that would be, but if you're okay with it conceptually I
> > can take a closer look.
>=20
> Hopefully, it's clear why that doesn't help here. But don't worry,
> there's plenty of other work to do on the tooling. :)

Yes, I think I understand now.

Thierry

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7scoUACgkQ3SOs138+
s6H0Kg//ZHQi745W1fmIq8PKL13plA54Nuav4gYArM/r/LjWt9rKVBRvxolDDCTJ
Fyq8e1xGpanTFeaaLtvgoMA7CoFg1/7MXiI1sM+MiN+ttY0Cc2Kx8TP7NC/tvY3U
szb+zKlB01BqDcD7h+LY81h3VnB7oGiL+Fi04zuhcjWetCJbW0qzFET5LihM+3gv
HWHCxF/gkJz9EqWe7EKyVbswJ/k9pZRLPgVU9UInU1luIH9l8Rv0MTPaTanFzrjs
SFwCjMtjQX4huTLTRkwhzhhiF33KRKT7QsG69z++fhv0sLy+lohiIA7CZVeK5WsT
smlhr19idPQPsB3liSWd9pCJUHl94u1hEDKXzSitzMwYL0tb3Y89zt2FR1FIulS4
nQKD0JAhJX2H7VI46Gfw4qTNjEuBVlvoyJWAo9pLIRFLNSRxdrqsUP90POkGVRCf
/ldop8VIapx4ugeCCxPbBEC99+w7I0+QgSw0efF3VOSAyc/iZrK+Hw1hRsP2aI0A
s/93bdzMXfB6RrsLdCDAEn5b8OpxvbhjxDlce+slvvO47azuoLmXVGs7XpXg7o9T
WwZMPouMMEL0v81TcUpR/pMyKAQAjRrpO0b7Q7QLqLQxhJN1mFpIClI36MSSD+vV
BfrxG5azGwSHd3slBg7b3Q7nyY+DUFORoxonJPsODab8mduRDk4=
=u19W
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
