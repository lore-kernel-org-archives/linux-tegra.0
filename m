From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/10] of: Add Tegra124 EMC bindings
Date: Tue, 14 Oct 2014 15:46:09 +0200
Message-ID: <20141014134604.GB2217@ulmo>
References: <1412945262-6068-1-git-send-email-tomeu.vizoso@collabora.com>
 <1412945262-6068-5-git-send-email-tomeu.vizoso@collabora.com>
 <20141010131417.GA6004@leverpostej>
 <543D26ED.6040201@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <543D26ED.6040201-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2014 at 04:36:45PM +0300, Mikko Perttunen wrote:
> On 10/10/2014 04:14 PM, Mark Rutland wrote:
> >On Fri, Oct 10, 2014 at 01:46:55PM +0100, Tomeu Vizoso wrote:
> >>From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >>Add binding documentation for the nvidia,tegra124-emc device tree node.
> >>
> >>Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >>---
> >>  .../bindings/memory-controllers/tegra-emc.txt      | 41 +++++++++++++=
+++++++++
> >>  1 file changed, 41 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/memory-controlle=
rs/tegra-emc.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra=
-emc.txt b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.t=
xt
> >>new file mode 100644
> >>index 0000000..6282c6b
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
> >>@@ -0,0 +1,41 @@
> >>+Tegra124 SoC EMC controller
> >>+
> >>+Required properties :
> >>+- compatible : "nvidia,tegra124-emc".
> >>+- reg : Should contain 1 entry:
> >>+  - EMC register set
> >>+
> >>+The node should contain a "timings@i" subnode for each supported RAM t=
ype
> >>+  (see field RAM_CODE in register PMC_STRAPPING_OPT_A)
> >>+Required properties for "timings@i" nodes :
> >>+- nvidia,ram-code : Should contain the value of RAM_CODE this timing s=
et
> >>+  is used for.
> >>+
> >>+Each "timings@i" node should contain "timing@j" subnodes. One "timing@=
j"
> >>+  node should exist for each supported EMC clock rate.
> >
> >What do the i and j correspond to?
>=20
> Arbitrary integers, preferably starting from 0 and increasing, similar as
> with regulator@i etc. Each set of `j's is independent. (Actually, these
> values are never used anywhere for anything).

Perhaps they should be used, then? Typically the unit-address matches
the (first) value of the reg property. Perhaps in this case it would
make sense to make it match the value in clock-frequency for j, and i
could correspond to the value of the nvidia,ram-code property.

Thierry

--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUPSkcAAoJEN0jrNd/PrOhchUP/0GRScxnQVDlu+awFc+UP35C
zSVTvjO0LfvE+k5gZsP5sJH98wCIEgAV/4G+pvnkoBuXnh3dqsZSHs8P/5wUwdS0
C3xeQvEgfwUTuwMwl+ln+TzQvfvfEzhNhEvcowkY6KpRDETxDWQ50ZKpuJtarOK6
8NeQmheTTjtsFYk57eteYGL3ENOrD8ey8LT3RBajipJ+5dffXppSXtEFcd/M2kFu
JYVs/8HBGVLFWfmtwaqzD7O2iOEXgNAxJMrtAtW5kG5I9beGMqkC81ZYAG0yIq/j
y9noS5dvFv/ZCP0D/9v1AenHuEso1on+VBvfl5vjJsAozv1HYv9NDRnI6B0vtawn
nWyXd8n3ltiuBPoaLBenz4VyzRgNkmZSFP6FR61yqGrhTh5wLB/lVwcALnOvj1ty
i4xcLSl3gOSL7KvnEUTJMu5i4traqwynJhdR/POToEMu14pa9CSnOfprhlZarVBW
8z9vYN75RQzapMtRQYhalpK1I63JIcpFr/KRGkEO351Qfs+neHqQk9MHXGom9q4P
fonhBj86I/i99N6Ju0VR7uWlqyCNKQ4HtOH5QYQOKM1z5cDriaYfjxdZ3WbiZXbq
tiyJBceIQPtZEH7xBPVdLPrL8Izj4SuPahNfh/QQWR3d8GW1fL+nYcQohFbkT92h
MXlyhdbUuEyxCTNN0srh
=puy9
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
