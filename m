From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] ARM: tegra: Add resets & has-utmi-pad-registers
 flag to all USB PHYs
Date: Mon, 14 Jul 2014 11:51:06 +0200
Message-ID: <20140714095105.GA9870@ulmo>
References: <1404436179-10745-1-git-send-email-ttynkkynen@nvidia.com>
 <1404436179-10745-3-git-send-email-ttynkkynen@nvidia.com>
 <53BEAD70.5010504@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53BEAD70.5010504-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 06:12:48PM +0300, Tuomas Tynkkynen wrote:
> Thierry,
>=20
> Since Stephen's on a vacation, I'd like to double-check with you that the=
 DT
> changes looks good. Greg has applied these to the USB tree today.

Yes, looks sane to me. Not sure how much people will like to see the DTS
changes go in through the USB tree, but I don't see a lot of potential
for conflicts, so chances are nobody will notice anyway.

Thierry

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTw6gJAAoJEN0jrNd/PrOhGZYQAIWAWjQKLY6zmitSDSIQ3YFr
CEdHCnI1/VVaVNLRLtUM7e/qRvY34W9mrY4wIi3u8SbwbiVKURjuZpbsc+bc0TC5
ykdTgi9/AnLbddqVVupzrZrYbi7+T1r/F++J3eGLHnPAl1ckwO0gc8DJ4NInMlEM
4+jCpvMCFxeL58HOqhDfTmocQojJpUz0IvRv2SmjStehgMIIDBEQuL4Mqbzp00eV
jPPQ+TN7GmiCIHjm6KJxy9C4brP5YBYwdmXXIgqmkQN7AmXCVCGHG8Ebh55x3Tbg
5vQ0KljngDRjXm9OWmX1hgZYTZ+eYZl5ceMw2/pCVr30PHjYxDtM7Yg6ZhYsOQ6F
8vPxYe73um8uXAs+7HNWQRce9GZc+FwegW+NizBqszUqfkL12ZAtB7Szds6mVa56
LXyAsKYJ30y1aico6CUlcm1P/UDpY2IA2Qg/BVattfdmKtaGR8FAaSljppKCFCOk
DuynaPLtFkwlnBklXVgK9xxIPZ2E+QCBASKpHCfaVdRidDpa6Ca/0NKBmT98NfrM
bNqGF6ALhIWwZUSXS++MUyL/C6aeu286f7SwM3pz3iaJtsc9EvoSc/FHNV7cOpY1
i3PFyCLMlis73MjlnHGXeCIzux5X34vPvusqNboFDE4yyox0w4iBRYnFXEbLAkmS
bCzBIuyIcRVCPHbPn4O3
=WvrZ
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
