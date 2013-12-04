From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 01/31] ARM: tegra: add missing clock documentation to DT
 bindings
Date: Wed, 4 Dec 2013 09:49:56 +0100
Message-ID: <20131204084956.GG19943@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-2-git-send-email-swarren@wwwdotorg.org>
 <20131129114900.GN22771@ulmo.nvidia.com>
 <529E24A3.3080804@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64j1qyTOoGvYcHb1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529E24A3.3080804-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--64j1qyTOoGvYcHb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2013 at 11:36:19AM -0700, Stephen Warren wrote:
> On 11/29/2013 04:49 AM, Thierry Reding wrote:
> > On Fri, Nov 15, 2013 at 01:53:56PM -0700, Stephen Warren wrote:
> ...
> >> +  - clock-names : Must include the following entries:
> >=20
> > One other thing I noticed here is that you use a space between the=20
> > property name and the :. None of the other properties have that, so
> > it looks somewhat out of place. The same is true for other
> > bindings, but there seem to be inconsistencies in some places
> > anyway, so perhaps we don't care? Well, I do care, don't know about
> > you. =3D)
>=20
> I've fixed those up locally. I assume you don't want a repost for such
> a trivial change? I'll double-check the "resets" patch for the same issue.

No need for a repost. I'll trust you on that one. But I'll urge you to
consider what I said about the "disp" clock entry for the display
controllers before merging this.

Thierry

--64j1qyTOoGvYcHb1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnuy0AAoJEN0jrNd/PrOheMQP/Rp6OnWoVRnn6gMZ2Dhvpc3U
9uI/9MzB2BbpkJMyyN+KSG7cLmyodglJ9it1tOUIDArN+mtY43BDjMAx54jfNIgf
UXOzWcdwdr/NGj8j0N5jzvm0jnE9Gayw2dXJ+XypSy44YemoWh5kaGFtrYi8hnRf
+Ek5UaX8tap5WMxFtWuJ0wYEQ3YhlH2ts96DWSMA/xQrstpEOgCpy/s9+pkVN2uC
1Zc1DHXxkCLKnA8m8wNwJuUvWUOd10O2nr04VxAlZea5c374jlb3A8Z2jKi0yHqN
CyVVSo1yhGP6vJAQfIAECcpSA96TXYDOvlYycxcSEFjm4u1wKT9bsXFxkvj2fRaH
WzEyiDb5+QltmjOdaqOfvHwkrQQ4ydYTubuzPvAOVOx9eON+fkt66VGQYsbye+tQ
ufTrqB1NDqtJ8FVTCbckJmifmdb371lmRq6p6pfNmAkSl5oe1IISdMWieTcqEn33
tin1LpDR8vyFYSJWBUc3S7302t/eohTjvYbcpSzTsY5IUi7QejeCSqpJJ7IbjV+a
fypWibEpTWv43Wmxkz5cWzh77Y/7eE4cpT4MFLlqXRK7ZhNXIxHygrdsWBrRwTN9
xhJfItfHn/iu8D2f2x86f5lzzoo16fUhtP7PlhSLPuP6y8F8NPy0eqy3D0FzxxMJ
OupjF9q8PK6jBWNW6DQD
=NvbB
-----END PGP SIGNATURE-----

--64j1qyTOoGvYcHb1--
