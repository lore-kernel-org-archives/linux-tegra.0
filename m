From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration DT bindings
Date: Mon, 2 Dec 2013 22:17:43 +0100
Message-ID: <20131202211741.GB19644@ulmo.nvidia.com>
References: <1385990934-20809-1-git-send-email-treding@nvidia.com>
 <3F910C9B-7205-4FC3-A75E-269277ACB513@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3F910C9B-7205-4FC3-A75E-269277ACB513-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2013 at 11:38:59AM -0600, Kumar Gala wrote:
>=20
> On Dec 2, 2013, at 7:28 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
>=20
> > Introduce device tree bindings for the MIPI pad calibration controller
> > found on Tegra SoCs. The controller can be used to perform calibration
> > of pads used for DSI and CSI peripherals.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > .../bindings/misc/nvidia,tegra114-mipi.txt         | 37 +++++++++++++++=
+++++++
>=20
> Should this just be nvidia,tegra-mipi.txt (as you have it supported
> for tegra<chip>)?

Tegra114 is the first chip to support it. Subsequent chips should be
backwards-compatible. But it's probably safer to change the compatible
property documentation to only include nvidia,tegra114-mipi for now.
Newer SoC generations can always be added when support for them is
added.

> > 1 file changed, 37 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra1=
14-mipi.txt
>=20
> Is this really pad control or pin?  I ask as its rare to see pad control.

It's not really control at all. Rather it is a hardware block that
performs calibration to obtain the optimal parameters for a given set of
pads.

Since you mention it, is there a better location for this file? I
couldn't find anything that matched, so I just put it here. I suppose I
could add it to Documentation/devicetree/bindings/gpu where the rest of
the bindings reside for the Tegra GPU, but this block is also used by
CSI, which is a capture interface and not really related to the GPU at
all.

> > diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mip=
i.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> > new file mode 100644
> > index 000000000000..beb75ec7f6fc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
> > @@ -0,0 +1,37 @@
> > +NVIDIA Tegra MIPI pad calibration controller
> > +
> > +Required properties:
> > +- compatible: "nvidia,tegra<chip>-mipi"
> > +- reg: Physical base address and length of the controller's registers.
> > +- clocks: The clock consumed by the controller.
> > +- #nvidia,mipi-calibrate-cells: Should be 1. The cell is a bitmask of =
the pads
> > +  that need to be calibrated for a given device.
>=20
> Is there a case that this would not be set to 1?  If so, why bother
> with the property right now?  One would assume for a non-1 case a new
> compatible will be required anyways.

There is no such case now, and I'm not aware of a future chip that has
more than 32 pads and would therefore require this to be anything other
than 1.

However having this property allows the DT to be parsed without specific
knowledge about the hardware block. If this was implied by the value of
the compatible property, a generic parser wouldn't know how to interpret
the data.

A schema validator wouldn't be able to check that the content was
correct either.

Thierry

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnPj1AAoJEN0jrNd/PrOhn5UP/0SM7IcSK+pnvuah6zj5cB1E
M9QCrhdMSFDNOBefsXO8SzqP7UcXpOxL8Oe3kSN1veXHiDeEdELdl9inQPQPowFv
yvs78gBYoj+k7xpBpa12z40b8wDGZi9S8aC5ZEhrKd3L6WvJTO7e4AkHkmmqx9eS
vY1x/6jnxMPEnjutcu4vsRd+Jdx50xgU0pAOYRD5/i+i6TOjojrispycUTjMKw7Z
RP1c2H9+//pcL5TrJABXYKuxZxEiZ1MEKYFMSGXce8oqA+pkHVsUUoexckRSrofY
7cyyCRyiKCjGWfQeA0IByVaDmNeqz9nh7sAwBFoRu0MnFD00nvXGm8u7yeYyjF6A
9XSRiM/zgScMvMx7xq/XTWN6FnSmAFUHjRuns+pd5EZj6lw+970me6y0hjhQL72G
iQ3mCWV4V2lodUOPj8D+gXNN6s2u3mrny0vOuPhkItCHT7S72PJ8FynS4fjP21P2
/zMK0bO/Vx6uC+NDSC8+X6wygcEseEZh4xJiY/bbVw/xire2VZ/vKvIi8Y3Agpyv
Mp3z8fvcXm7owQyLW3EL+zMYJPhJ1BeLkRKEdxqmNOJXI5HNTzs9aFTkEdkc3rhg
w5Y8j8A5ha5utKQzU8vuQvnqB93X9bDR7eB73tB5xntYwpCOY5TT9TpRDF791j6R
/TAfH4LVMDRp8e/cmpDa
=HbP9
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
