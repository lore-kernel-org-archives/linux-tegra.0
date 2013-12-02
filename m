From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/31] ARM: tegra: document use of standard DMA DT
 bindings
Date: Mon, 2 Dec 2013 10:05:27 +0100
Message-ID: <20131202090526.GC17834@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-4-git-send-email-swarren@wwwdotorg.org>
 <20131129122907.GP22771@ulmo.nvidia.com>
 <529B897F.1010101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529B897F.1010101-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 12:09:51PM -0700, Stephen Warren wrote:
> On 11/29/2013 05:29 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:53:58PM -0700, Stephen Warren wrote:=20
> > [...]
> >> diff --git
> >> a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
> >> b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
> >>
> >>=20
> index 2b6817f6e40e..eaf00102d92c 100644
> >> ---
> >> a/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
> >>
> >>=20
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-ac97.txt
> >> @@ -4,14 +4,17 @@ Required properties: - compatible :
> >> "nvidia,tegra20-ac97" - reg : Should contain AC97 controller
> >> registers location and length - interrupts : Should contain AC97
> >> interrupt -- clocks : Must contain one entry, for the module
> >> clock. -  See ../clocks/clock-bindings.txt for details. - resets
> >> : Must contain an entry for each entry in reset-names. See
> >> ../reset/reset.txt for details. - reset-names : Must include the
> >> following entries: - ac97 -- nvidia,dma-request-selector : The
> >> Tegra DMA controller's phandle and -  request selector for the
> >> AC97 controller +- dmas : Must contain an entry for each entry in
> >> clock-names. +  See ../dma/dma.txt for details. +- dma-names :
> >> Must include the following entries: +  - rx +  - tx +- clocks :
> >> Must contain one entry, for the module clock. +  See
> >> ../clocks/clock-bindings.txt for details.
> >=20
> > Was this unintentionally moved?
>=20
> IIRC, at the end of the series, each binding describes reg,
> interrupts, clocks, reset, dmas in that order, for consistency.

Okay, that's fine then. I was just making sure this hadn't slipped
through the cracks.

> >> diff --git
> >> a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
> >> b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
> >>
> >>=20
> index e144f144717f..bdf08e6dec9b 100644
> >> ---
> >> a/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
> >>
> >>=20
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra20-sflash.txt
> >> @@ -4,14 +4,17 @@ Required properties: - compatible : should be
> >> "nvidia,tegra20-sflash". - reg: Should contain SFLASH registers
> >> location and length. - interrupts: Should contain SFLASH
> >> interrupts. -- nvidia,dma-request-selector : The Tegra DMA
> >> controller's phandle and -  request selector for this SFLASH
> >> controller. - clocks : Must contain one entry, for the module
> >> clock.
> >=20
> > But then this doesn't move it... perhaps it really is accidental
> > in other places. =3D)
>=20
> The patch to that file does move the docs for the dmas property...

My point was that the clocks and clock-names properties didn't move like
they did for other hunks. But if all those changes end up making the
bindings documentation more consistent, then I'm all for it.

Thierry

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnE1WAAoJEN0jrNd/PrOhcjAQAKfxRJ1dBbq4GUoR4Ily+HPT
og+Y3KoPOCF1WSms+2VVUnxXqj+7Vx+tmSVkjzUF1lzmNgIUuHedZ1jc6NKPAJAm
E4eFdwBlkJSyc9WO6nwJ00y5KKypiBOHE7tNxIAnkquWDm8P6HsIBHpFqB1YjcVQ
nLud/LhwTz8PL4qTKj/XE5ca2tNfkdDb5bcjlVbMAY/w1I8UAltvEETCjd+bNACM
ghmfGeam5RWRskuecMzp7fZEO0JacJ/AhROpxnyvS+doL/965QOBpvA8uAN4bKS6
oFSS7aKFb6aJ4ez7kXhWoVAdQcBv61l0JgrobpNATtChST8QH8Lbb7j1wXMwqmvB
SNwfjbAVn6daB5JYlwYWnpZ/RD+J+YZDmX0MI3jUA5xqyHSuPCIQ4DJkGmbDtOQ6
s3js8pOUBHKeNls4LTQYin3t8TXwiVPTGy6n+Elz5/taewfVFr49sAsci605YoDS
PZtylM6y5N5JWMm1LXqcKJOfjBBwxTQ9XfSMTgj+uksPF+KVHX4WlXYAL218vR6w
MzKNpVpwgS6Vl2UsgoNO9Q1fGT1FF3fO8bmFHkxFnBbDnyC7ml+wGO9Sxy6kSku2
e2AIF2+qu25izRfhmPzMxQY3Zlle/v9IaVNeMQ9gm9c68R6DpZyTs4ioWtIrivyH
g9pBVDRbiYeoNZgw+zLy
=WSTQ
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
