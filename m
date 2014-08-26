From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] of: Add NVIDIA Tegra flow controller bindings
Date: Tue, 26 Aug 2014 08:00:27 +0200
Message-ID: <20140826060026.GA15573@ulmo>
References: <1403870848-1754-1-git-send-email-thierry.reding@gmail.com>
 <53ADE012.5080401@wwwdotorg.org>
 <53FB7324.9080109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FB7324.9080109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2014 at 11:32:20AM -0600, Stephen Warren wrote:
> On 06/27/2014 03:20 PM, Stephen Warren wrote:
> >On 06/27/2014 06:07 AM, Thierry Reding wrote:
> >>From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >>Add device tree bindings for the flow controller found on NVIDIA Tegra
> >>SoCs.
> >>
> >
> >>diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20=
-flowctrl.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-=
flowctrl.txt
> >
> >>+NVIDIA Tegra20 Flow Controller
> >>+
> >>+Required properties:
> >>+- compatible: "nvidia,tegra20-flowctrl"
> >>+- reg: Should contain one register range (address and length)
> >>+
> >>+Example:
> >>+
> >>+	flow-controller@60007000 {
> >>+		compatible =3D "nvidia,tegra20-flowctrl";
> >>+		reg =3D <0x60007000 0x1000>;
> >>+	};
> >
> >The bindings all have the same structure. Can we collapse them all into
> >this one file and just list all the valid compatible values and say pick
> >one?
>=20
> Thierry, did you post an updated version of this patch? If so, I seem to
> have lost it, so a repost would be good. Thanks.

I don't think I did. If my memory serves me well then I did address your
comments but never sent out the patches. I'll check what the status is.

Thierry

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT/CJ6AAoJEN0jrNd/PrOhfKIP/2//SBGuFiJGHOh428nNOoRm
kukVv9LgvkjNNWsDRnIWkH6mbMkaVNB7Ewb/TMG0sPZvLEZ7JxTYwC7KxQauM+Qd
pPvx8l8FOp8PPofrr0uxcmEh9MGARkpPn24d/TSndS7H8U6qDjbNHvRlXsjuz4iJ
AtuYSV0Ix6Fa2llVPgjl8LeEMcQbqkWAQKoLYOnOuG7wfGeBuuxzwP9OhksVyJga
dHN6TlkV4O2aZFt2RXBw6hGW58K79mgTVp75wolfsTHxdlvyxq1Q/URBORE79tqC
C61I8jilQ04ZQ2EslH/jJCons86VDVW/oaxdUbKbOXRHJEZHAv0SlQOiit6IHUpJ
lKSjc8AicV/wCGJ3a43YKg/yhcjpFxnpn9NfftQyc9qrR8efYkj6jYISDcHWwHka
t/BaW2h7LG3MtxBjfRVfiNi95NpX45ji9nWpA0Gk/F2I9Yfo53hkF10ZqixvzhLF
hb3iPN3w2fLniyI43q10n4zg1MxPjeTD+ny/mC0JGSfpCDCGVu2xkXIbo39PGY2U
IGc+pgkW1SkQDtGQ9DaWdsNaRei9pZlSZdlOkszUEOluxL/+NpneTZzLLrL9v0Ir
gne5FfnpeB6JzKjHk36STGcQ/VE1tmeQ75zFB3oFmUcof4yspQfFliQe1l/szcJc
VPnr3cPtHdw0TTh5WhQ5
=v8Ql
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
