From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Date: Wed, 17 Jun 2020 16:17:06 +0200
Message-ID: <20200617141706.GC3536291@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <186ceadd-317c-a7b2-d4ab-32473f857545-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +patternProperties:
> > +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> > +  "^gpios(-[a-zA-Z0-9-]+)?$":
> > +    type: object
> > +    required:
> > +      - gpio-hog
>=20
> There are two problems here:
>=20
> 1. This naming limitation didn't exist before this patch, so it's not a
> part of the conversion.
>=20
> 2. GPIO core uses the node's name for the hog's name. Hence by imposing
> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
> which doesn't make much sense to me.
>=20
> Please explain the rationale of this change.

We could probably do without this if we didn't enforce additional or
unevaluated properties. Because if we don't match on a pattern here then
all of those GPIO hog nodes would show up as "extra" properties and they
are currently not allowed. If we do allow them, then we can drop this,
but we then have no way to fail validation for whatever else somebody
might want to put into these device tree nodes.

That said, I think additionalProperties can be a schema in itself, so
maybe there's a way to only allow additional properties if they are of
type object and have a gpio-hog property. I'll look into that.

Thierry

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJeIACgkQ3SOs138+
s6GJrA/+Izbidb/DwVp99EqfGaOmDTMzV5gJN0QHu61EurvpUzDSGK2xJWrojuvU
tnhkNPZjEzlDTqDvILh1NBBMikSdxo5PzK/7RRHaqZSsMM1txiQaOpTwZ77+NFS9
/xL6kyKeTeaSbX3dtKJf+oxkJBlqfZjYCQdjvI0Vtn7P44b8kNjl7Kcxu0y13gNq
Z5eSuy+SFBC35not1IwhZEpwHFALtRPKthc5m+VJwybvLUI7hr7KXU2XvZECW9f3
AcFE5mmO6tWxCaXaaovjTPzGj55hfSpHAa1IIUxPr255z+Jici80P/zJpqPxqmnj
gYxcouACMqABwjN90ZZymF5uOl3RtMMOK9HwjPPTsn+qE84C5ZLK7vx6+WaRL8v1
GresAhtOXlY+PQ9lAYGwpoWdpaehASh2jC7Thid1uVCCSp5nqoenhg6BoqbF1VLg
ze5A49NgAEX6XEsVixy0AvlqFxBatRK8XbGiOzMlQV3DESQM0OdKdjCYcG6LHcxg
e+ghWhjCwV7obcIi433OnY73aoPBvaJHdmWU9VEfWTbNVkwkh6PDcA78HkxBIZ7L
VE+YI548k9zPG3qwQZMWezL8wIpUzDEDd/hpazAzSoaofUtQQGZlmk0kZL+LSfFv
OvPEpI4LW65arvMkLW5np5qQaoDrsl+MQPOHOBeNDw5F/QxiXbo=
=X4Kg
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
