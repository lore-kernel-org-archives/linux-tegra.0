From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/38] dt-bindings: display: tegra: Convert to json-schema
Date: Tue, 16 Jun 2020 16:51:08 +0200
Message-ID: <20200616145108.GD3000485@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-8-thierry.reding@gmail.com>
 <b20cede8-a9ee-c70d-913d-d0a05d7826b0@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b20cede8-a9ee-c70d-913d-d0a05d7826b0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2020 at 06:54:45PM +0300, Dmitry Osipenko wrote:
> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Convert the Tegra host1x controller bindings from the free-form text
> > format to json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> ...
> > +  memory-controllers:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - interrupt-names
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - ranges
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
>=20
> This memory-controllers property didn't exist before the conversion. So
> this is not a pure conversion, which makes it a bit difficult to review
> the changes. Could you please factor out the addition of new properties
> into a separate patch?

The memory-controllers property was from an earlier draft of this series
and is no longer needed. I'll remove it.

In my opinion, these schema conversion patches are difficult to review
in general, especially the likes of this one for host1x because they are
fairly complex to begin with. All existing Tegra-based device trees do
pass validation (although there's a small patch needed to support the
unevaluatedProperties keyword that's new in json-schema draft-08), which
gives me some confidence that they are at least correct from a content
point of view.

Thierry

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7o3FsACgkQ3SOs138+
s6E+Fg/7B2Mg67amrSqKm2vNSvOzWyYs2Z/D6ReeV771HsvqioHA9WtYx/jGyuTd
SZkOLaMO2Rx7S+LbR/Vybq930SGzX4syeMvB9ZQvQPBLxiYeHsbuMRjAxIfoX9F3
fN5vD+0h0ateIPUPB7KnoBxZOkPLoaILXAd5TG9dRRjoyq3hoQonprlF5NbcSP6Z
HkP5qo+4ImX7cCknNpAiIkYtIlbECmK2R8z0euX9p8qbIYJ3WmlNQZnB8csHdSLI
PDKSICspFkZUuzS1bL2Q7W8qtXOGa+goFa5In8ncI1JONL8U/mAgSmdRTe5JWaN4
xMFs2Yy1lJVcAbcMzH25hzaFulm1/s55JMDeIthE+/ucB5YrSDTUUfTPkknJT9oG
RKz+HyKHnel8o6kPupt/B5sVCrVdUMyGxZUUv0gjZdq2VfqAjIUtjre2G4kV45jN
HWzH51XPVefxocdcBUjp8xlHC9HSYr8CcGZAhd/kdTC6zgsEUBWYe+HS98vsjqf0
gkdwVDe3dPkydvCM16cY5ZHYf0em7nR02vb4kVA4F5JHg2pctiMxxXvM6MgJU3Ae
RnSYXLjmZtU00qOWP+GwF3Na+1N/6DN44c/uZk9As9sen+ipNeFmmmNQwjsiSi+m
mmEATY3V1PXPCN5aYqOyhdgct0rXa3d3iGlYE9gDgcLJljJ+Ci8=
=BqQz
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
