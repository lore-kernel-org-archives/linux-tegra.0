From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/31] ARM: tegra: document use of standard DMA DT
 bindings
Date: Wed, 4 Dec 2013 09:56:41 +0100
Message-ID: <20131204085640.GI19943@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-4-git-send-email-swarren@wwwdotorg.org>
 <20131129122907.GP22771@ulmo.nvidia.com>
 <529E2867.6090209@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nO3oAMapP4dBpMZi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E2867.6090209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nO3oAMapP4dBpMZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:52:23AM -0700, Stephen Warren wrote:
> On 11/29/2013 05:29 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:53:58PM -0700, Stephen Warren wrote:
>=20
> >> diff --git
> >> a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
> >> b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
>=20
> >>
> >>=20
> - ranges : The bus address mapping for the configlink register bus.
> >> +- dmas : Must contain an entry for each entry in clock-names. +
> >> See ../dma/dma.txt for details. +- dma-names : Must include the
> >> following entries: +  - rx0 .. rx<n> +  - tx0 .. tx<n> +  ...
> >> where n is: +  Tegra30: 3 +  Tegra114, Tegra124: 9 Can be empty
> >> since the mapping is 1:1.
> >=20
> > I think this line belongs to the description of the "ranges"
> > property.
>=20
> Yes, I've fixed that up locally simply by moving the inserted lines 1
> line lower. I assume you don't want a repost for that?

No need for a repost.

Thierry

--nO3oAMapP4dBpMZi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnu5IAAoJEN0jrNd/PrOh9hIP/2X3RQifLJ+sjMwIECwsm6yY
ZWCi4UqWt7MTkKsQaQNzJZvgsQ7lLWsS3P7fSGmyF2E9KaQqUP7VpKF5YwuQUMh+
jU/rf2nS+rV1GSMO+//yZCuG/I3WvKo61lmehANiedQgwTTXI9bfRmYD+QlNxwOn
f80tMIWjPnEP+lhj/yWZsoTN0Nwl3cvF7F/9S/r4zrZP9RyC+yAhMul4Eu9HDN4s
MiyBBFjdFxareBBwEdJTOoTb6dtnn9uUzTo30Syy2OF7bxbuySlRhGg+SygyUJK8
PYdhOOegQHX+widBk3hkG/+CCfBi4HTr/exL9v2jqTDC46wedf4bheeSxJ3O9o/M
3QAlNj30Ptfu5mMzp/pIAVnzFE8q/iuOKFLK9NrP/lYjcp5np5js1PV1XOPaQX4h
rKMiEnylcThGshaDZL5H2JfNUtuazjleL5jaBiW8OBLMS9RewBcYjw74FAorAgsW
7vqUmiSvJzS6zEfZUGa0rAYzZpwULO2r1MLnnmGrUQvXb76OsaEHdCnsRXg+U/ZA
ozEhBDVEJY0Bs83gWXxyVRzRggddNwN2V0aVgm46Yy8g3V2CENXRLuIov5Pz9iUj
fx+3i/VI/j2lzBJAhjF8UQh4Uq1+S+T+b42s7YYqSBLCh1KU6sc/gFE0mf1gZ97U
Ndp3IY0MYcO2DnMXboQx
=Jsn+
-----END PGP SIGNATURE-----

--nO3oAMapP4dBpMZi--
