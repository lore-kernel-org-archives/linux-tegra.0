From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/31] ARM: tegra: document reset properties in DT
 bindings
Date: Mon, 2 Dec 2013 10:08:53 +0100
Message-ID: <20131202090852.GD17834@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-3-git-send-email-swarren@wwwdotorg.org>
 <20131129122348.GO22771@ulmo.nvidia.com>
 <529B88C9.60804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529B88C9.60804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 12:06:49PM -0700, Stephen Warren wrote:
> On 11/29/2013 05:23 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:53:57PM -0700, Stephen Warren wrote:=20
> > [...]
> >> diff --git
> >> a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> >> b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> >
> >>=20
> [...]
> >> +  - resets : Must contain an entry for each entry in
> >> reset-names. +    See ../reset/reset.txt for details. +  -
> >> reset-names : Must include the following entries: +    - dc
> >=20
> > For consistency with this, the clock-names entry for the first
> > clock in this node should then be "dc" as well.
>=20
> The dc driver gets the clock by name, so this isn't a requirement.

Right, but like I've said in another reply, I'd very much like for this
to be fixed up so we don't have to mess around with per-instance names
for clocks. So instead of naming the first clock in the display
controller node "disp", we could rename it to "dc" for consistency with
the reset bindings.

> >> diff --git
> >> a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
> >> b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
> >
> >>=20
> [...]
> >> -  - spdif_in +  - spdif
> >=20
> > Why is this renamed?
>=20
> There are two separate clocks for the SPDIF input and output modules,
> but just a single reset.

I also realized that when reviewing one of the subsequent patches.

Thierry

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnE4kAAoJEN0jrNd/PrOhiXkQAL5iRdTR7uO03WpWT+eTIuMm
rpJLisgAW8wtlJHbCK/ddIaJ6iGgdWWVJhTZsNy+QaMF2Ufo8OHCSvPRxRMBOuOB
iAdrcwQrktf52Z7nxdMPjrwi/tsjMa6CCclRsVu5yAPXiqQcELLaBUvoYQZlBAGH
I5jtWZbF+i1pDsrVN4eykeUBZVzAr19hC0Si3k4fOPF0jGTK6Z72M9qynsT2nGEm
mKpj/YVTgS4/S4U6d1WGa8q7EqaJ0AWwDJAwnuNFKpzyudJqawfsHx3662uOCfZ9
xzXm4VhAV8vl2sA4KNGztu7GYpPJ/5gDTPhdH16hnOFcoKUbA55Ek4sPUlGTun64
IREwEdymoYMsp7xb/xCMVQK3EwF2xa17j4IvkJaniJKB2PrZIm7tEv3nD9ee5p2K
mEqt9xBSSXwcS8CpdDrmno6fk4YA13owxWrfZEieKVDaPAYmCQ3Z/eEwMkotPlfZ
3S3CE/zcZ8DlXOoufQvei2IHNYRCIwjyvbqSy4PRQqVpnl/b8/iEoEcRbioCrqFU
VBohzZJmhSROb83AW7FLbOhnGU/3uRXhtya1CTkbrXle9m76/GgOBJ+4Bf4fFkuF
5XcPIMzY2EBszt2Jd64rL96zBf5D1IJhOZe3cKyjOaeuZIqOtxbwiwr902m5Ka94
D4YCxG79obWHh0EPBzDT
=oC7e
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
