From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 25/38] dt-bindings: gpio: tegra: Convert to json-schema
Date: Wed, 17 Jun 2020 18:50:08 +0200
Message-ID: <20200617165008.GB3547875@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-26-thierry.reding@gmail.com>
 <186ceadd-317c-a7b2-d4ab-32473f857545@gmail.com>
 <20200617141706.GC3536291@ulmo>
 <c0cfa39b-054c-8e88-7e5a-233c24f5d5e9@gmail.com>
 <a14c2791-83af-1cd0-1d15-0544a4bf490b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a14c2791-83af-1cd0-1d15-0544a4bf490b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 05:33:00PM +0300, Dmitry Osipenko wrote:
> 17.06.2020 17:24, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 17.06.2020 17:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Wed, Jun 17, 2020 at 07:24:16AM +0300, Dmitry Osipenko wrote:
> >>> 12.06.2020 17:18, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> ...
> >>>> +patternProperties:
> >>>> +  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
> >>>> +  "^gpios(-[a-zA-Z0-9-]+)?$":
> >>>> +    type: object
> >>>> +    required:
> >>>> +      - gpio-hog
> >>>
> >>> There are two problems here:
> >>>
> >>> 1. This naming limitation didn't exist before this patch, so it's not=
 a
> >>> part of the conversion.
> >>>
> >>> 2. GPIO core uses the node's name for the hog's name. Hence by imposi=
ng
> >>> the "gpios-" prefix, you're forcing all hogs to be named as gpios-xxx,
> >>> which doesn't make much sense to me.
> >>>
> >>> Please explain the rationale of this change.
> >>
> >> We could probably do without this if we didn't enforce additional or
> >> unevaluated properties. Because if we don't match on a pattern here th=
en
> >> all of those GPIO hog nodes would show up as "extra" properties and th=
ey
> >> are currently not allowed. If we do allow them, then we can drop this,
> >> but we then have no way to fail validation for whatever else somebody
> >> might want to put into these device tree nodes.
> >>
> >> That said, I think additionalProperties can be a schema in itself, so
> >> maybe there's a way to only allow additional properties if they are of
> >> type object and have a gpio-hog property. I'll look into that.
> >=20
> > Isn't it possible to validate the additional properties by checking what
> > properties they have?
> >=20
> > For example, if sub-node has a gpio-hog property then this sub-node is
> > okay, otherwise fail.
> >=20
>=20
> Ah, I haven't finished reading yours last sentence before started to
> type :) Yes, it will be nice if we could avoid the naming limitation, or
> at least change it to something like xxx-hog.

So according to the json-schema specification, both additionalProperties
and unevaluatedProperties must be a valid JSON schema, which means they
can be objects rather than just booleans. Unfortunately, dt-schema tools
don't allow these to be objects, so the below currently fails with these
tools at the moment.

I can make it work with the following patch against dt-schema.git:

--- >8 ---
diff --git a/meta-schemas/keywords.yaml b/meta-schemas/keywords.yaml
index ed543235d7e7..aa88f726ea3b 100644
--- a/meta-schemas/keywords.yaml
+++ b/meta-schemas/keywords.yaml
@@ -79,7 +79,11 @@ properties:
   additionalItems:
     type: boolean
   additionalProperties:
-    type: boolean
+    oneOf:
+      - type: object
+        allOf:
+          - $ref: "#/definitions/sub-schemas"
+      - type: boolean
   allOf:
     items:
       $ref: "#/definitions/sub-schemas"
@@ -140,7 +144,11 @@ properties:
   type: true
   typeSize: true
   unevaluatedProperties:
-    type: boolean
+    oneOf:
+      - type: object
+        allOf:
+          - $ref: "#/definitions/sub-schemas"
+      - type: boolean
   uniqueItems:
     type: boolean
=20
--- >8 ---

With that applied, I can make validation of gpio-hog nodes work without
requiring the names to change, which incidentally will allow me to drop
one of the fixup patches from the ARM/arm64 DTS series.

Here's a hunk that applies on top of this patch and makes this work.
I'll squash it in for the next version.

--- >8 ---
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yam=
l b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
index b2debdb0caff..3f8a9c988305 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
@@ -57,13 +57,6 @@ properties:
   interrupt-controller:
     description: Marks the device node as an interrupt controller.
=20
-patternProperties:
-  # GPIO hogs; /schemas/gpio/gpio-hog.yaml will match
-  "^gpios(-[a-zA-Z0-9-]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 allOf:
   - if:
       properties:
@@ -90,7 +83,10 @@ required:
   - "#interrupt-cells"
   - interrupt-controller
=20
-unevaluatedProperties: false
+unevaluatedProperties:
+  type: object
+  required:
+    - gpio-hog
=20
 examples:
   - |
--- >8 ---

Thierry

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qSb4ACgkQ3SOs138+
s6Ekxw/8DLU6wY2K1DVoyseL1/Tq/iXKNwGwYgGdx07CD4XCE0ftCo7cJcBVuV8V
flsWVDV/bLpxcXkquG9pi5IhePGTj88GJD4xx6/MWEQqdRKndbsSXpGEFwQu08zC
LNcYVrNAlQsSNTDy78kaT+uqgQ6pmAF0dyluj3klY8Q8q0U98djr7UUKnmhSH8cs
aL2PEk0Vc73mKCh+cUUdLXhT55+0gFhtaZnlT+IGKSgBBMwCEEBgfLF5Hf4eMux6
H/C8UvqILSGSxppYTBKnS1IRiVeSBtiOpTx4SE9pqk3mZOCo6SiIa6Ox0asbv6Es
NejkXLK9Vp25BB8nXnNdYTKlbD5lZO1IyBLaDHO8jRTkrxzNWD7DOy5VvdRjCcGO
/7cbJfNSndB0puLeszUZB+/XTXg3f4twLwTUK4uyhk9VeOHKd+PCsjtS1+yBdASe
DD6Ao8aitGhJv2BKpEmmt0/P5MyI1ioljw8Rs3HfdwE8P1rNfzDSb4OLbq+K+fRP
1vbM0RFdYe2vZ0FckxuQzGZg3snamnb9vOWF6pYuxMOYRK8hx8hPV0yOtrqTmEvd
xMECqcpfHGpa6+QnA1CFwKCYt632e2/CB1GecyhJbHflqz6/STxEEjEzH7LbRVAL
vThVHRu/2ZmoalasCpUZ9z+rNgD1hYwlBwDZF5jlQsLJznjtaTQ=
=dpDf
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
