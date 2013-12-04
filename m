From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 02/31] ARM: tegra: document reset properties in DT
 bindings
Date: Wed, 4 Dec 2013 09:56:05 +0100
Message-ID: <20131204085605.GH19943@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-3-git-send-email-swarren@wwwdotorg.org>
 <20131129122348.GO22771@ulmo.nvidia.com>
 <529B88C9.60804@wwwdotorg.org>
 <20131202090852.GD17834@ulmo.nvidia.com>
 <529E2781.5020504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E2781.5020504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:48:33AM -0700, Stephen Warren wrote:
> On 12/02/2013 02:08 AM, Thierry Reding wrote:
> > On Sun, Dec 01, 2013 at 12:06:49PM -0700, Stephen Warren wrote:
> >> On 11/29/2013 05:23 AM, Thierry Reding wrote:
> >>> On Fri, Nov 15, 2013 at 01:53:57PM -0700, Stephen Warren wrote:
> >>>  [...]
> >>>> diff --git=20
> >>>> a/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> >>>>
> >>>>=20
> b/Documentation/devicetree/bindings/gpu/nvidia,tegra20-host1x.txt
> >>>=20
> >>>>=20
> >> [...]
> >>>> +  - resets : Must contain an entry for each entry in=20
> >>>> reset-names. +    See ../reset/reset.txt for details. +  -=20
> >>>> reset-names : Must include the following entries: +    - dc
> >>>=20
> >>> For consistency with this, the clock-names entry for the first=20
> >>> clock in this node should then be "dc" as well.
> >>=20
> >> The dc driver gets the clock by name, so this isn't a
> >> requirement.
> >=20
> > Right, but like I've said in another reply, I'd very much like for
> > this to be fixed up so we don't have to mess around with
> > per-instance names for clocks. So instead of naming the first clock
> > in the display controller node "disp", we could rename it to "dc"
> > for consistency with the reset bindings.
>=20
> I assume you're now OK with not changing the clock names, given my
> explanation?

No. Rather I hope that I was able to clarify what I was aiming for. To
illustrate with another example: if we were to mirror the naming of the
clocks for the resets, the nodes would look like this:

	dc@54200000 {
		...
		clock-names =3D "disp1", "parent";
		...
		reset-names =3D "dc1";
	};

	dc@54240000 {
		...
		clock-names =3D "disp2", "parent";
		...
		reset-names =3D "dc2";
	};

Rather than what I proposed, which would be either:

	dc@54200000 {
		...
		clock-names =3D "disp", "parent";
		...
		reset-names =3D "dc";
	};

	dc@54240000 {
		...
		clock-names =3D "disp", "parent";
		...
		reset-names =3D "dc";
	};

Or this:

	dc@54200000 {
		...
		clock-names =3D "disp", "parent";
		...
		reset-names =3D "disp";
	};

	dc@54240000 {
		...
		clock-names =3D "disp", "parent";
		...
		reset-names =3D "disp";
	};

Or even this:

	dc@54200000 {
		...
		clock-names =3D "dc", "parent";
		...
		reset-names =3D "dc";
	};

	dc@54240000 {
		...
		clock-names =3D "dc", "parent";
		...
		reset-names =3D "dc";
	};

The display controller driver doesn't request the first clock by name,
so it doesn't really matter what it's called, but "disp1" and "disp2"
are just wrong in my opinion.

Thierry

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnu4lAAoJEN0jrNd/PrOhnhcP/1sw44vM/ekEdU+76+ECg7ou
7s5LsYXhX3taL4CquoFosDvml2Q7NxmoDfnIk3u662tL6fFp5K+KCt0C/WfNbolM
veqFWdUHyLdmCbee9448h1w14r3ZIib4XR23XPLdhw9MghCv+iQC4ohRVuoTCsRw
fInBPf2rPAbzpVde3l2fAFfhjuNpmSanSxkqXc8gduDDRbDVSh4SaSVtPayPMFC4
8hwiD/7CtaON8pIrquH6yRt/oNnj9KvUCMzm4WpBBQIa+wEcXAYXni7m1lSkCGpu
CykMB6Fgk2BWsMBnt+JzM82uIWFfjpzlmLKMuSxRmPRy98lbu4sfN8UxB1qEDPp6
PFK/wxoLKPnmnKMLpng2jpym78jUoJsQzA9nG0rX0f+fIqJUyp4SZfELs6piplem
o+KT+S8reIEvG8FrNuIKp6ew0i7m3T2VdSbeHJYeLb32pW2MbahQ/0phWNUE9wBq
E/P36StJLFVJxYzFluBJEhMEkC/K6ft/J98SrNPSd7A1F2h2I32mFb98yM4IxkhW
gHPqeJurt1uAd2HFbk2bFB2wS6p7rEAfwsOoZIY+lsxETl6D5bZAGgEJjute9BUS
Fb28yStz/JeD8d6I97NsK6ACdWUNQSY0928RStw9pOHIjd+XfKdNAGdr9+pjj4Ah
o5lMaisdGu/6rRiaLx/d
=icaE
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
