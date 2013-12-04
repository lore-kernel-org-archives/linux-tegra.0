From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration DT bindings
Date: Wed, 4 Dec 2013 10:42:19 +0100
Message-ID: <20131204094218.GP19943@ulmo.nvidia.com>
References: <1385990934-20809-1-git-send-email-treding@nvidia.com>
 <529E3C50.8000801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJ8inJ6ig7iY3YX9"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E3C50.8000801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rJ8inJ6ig7iY3YX9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 01:17:20PM -0700, Stephen Warren wrote:
> On 12/02/2013 06:28 AM, Thierry Reding wrote:
> > Introduce device tree bindings for the MIPI pad calibration controller
> > found on Tegra SoCs. The controller can be used to perform calibration
> > of pads used for DSI and CSI peripherals.
>=20
> > diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra114-mip=
i.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra114-mipi.txt
>=20
> > +Required properties:
> > +- compatible: "nvidia,tegra<chip>-mipi"
> > +- reg: Physical base address and length of the controller's registers.
> > +- clocks: The clock consumed by the controller.
>=20
> I'd prefer all our new drivers just use clock-names from the start, so
> we never have to specify that certain clocks must be at a certain index
> in the clocks property. How about:
>=20
> +  - clocks: Must contain an entry for each entry in clock-names.
> +    See ../clocks/clock-bindings.txt for details.
> +  - clock-names: Must include the following entries:
> +    - mipi
>=20
> (or "cal" or whatever makes sense there)

"mipi-cal" sounds like a good name. That's also what the clock is
called in the TRM.

I'll repost with this fixed up and I'll move this file into the mipi
subdirectory that I need for the MIPI DSI DT bindings anyway.

Thierry

--rJ8inJ6ig7iY3YX9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnvj6AAoJEN0jrNd/PrOhwhEP/0JyW+4bGZg/1djS4VJn8wjR
VQbZPa3hvlxVJGwmNY0304Twt/Zh9PoxMW+zWB98GiNahXNRUHaXCWR7R5lsaAnz
gAh+Wmzvi1jziPoWtck8YwQc+RTND0lUZkup0d6JEPZqfWkYRpQTJCYdr9nCoczV
/f1NdBg6Y/9GTgH+COTvlr5gJiAtC8N/PvG2Ih2PecIWe/ohkMe/sBw7aWZCvVWK
0enXX+mTeJoLx0BQ6kQhPmPECxoWmsoeUIJKTsH066z/sFvIeI+eBz/mgzafUH8h
Swg4Tzjrp6G14oRuPUhRrbPUsRiAEb6Ixa3ioEiGzOvlQza7ZfSBRmYWBgLVGDvZ
h8agupRakdi7qKyLDYyrgYbOAbsp5Ib1aNQba2/gNBKIVecOTdDXSzImNCs5LaDs
XLZVj3gl+r9OewpZEpS7qj8E5fsgdIWblHPBxjzSz6JdPPcyKfOLd0V4S2OoFLze
1jCIVXxnZSZTA4EA+YfnmB3NUqpHPHpOAd0mvfdNyHpm8Ko6zkwawbT/MikVUZa+
7QfuLcSpryIYe3n0A3JR6EvclHB2FEBqoYLDn7otWpp8ERajv9oRPgGfXbjBXizK
FSJIGIejSlWY2vI3l0qjMP9i3IZ7oAK8dJmhi0PBrQ9IS+LRUSdKRPX1nBBYwM55
LsWbuSV/9vEw5330HWby
=7uqm
-----END PGP SIGNATURE-----

--rJ8inJ6ig7iY3YX9--
