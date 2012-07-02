From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Conflicts between Tegra PWM tree and common clock patches
Date: Mon, 2 Jul 2012 21:24:54 +0200
Message-ID: <20120702192454.GA1299@avionic-0098.mockup.avionic-design.de>
References: <4FF1DBC8.2000406@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF1DBC8.2000406-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2012 at 11:35:04AM -0600, Stephen Warren wrote:
> Thierry,
>=20
> The following commits in your PWM tree conflict with some Tegra clock
> driver re-structuring that's part of the common clock conversion on Tegra.
>=20
> df6da47 ARM: tegra: Provide clock for only one PWM controller
> 65e7385 ARM: tegra: Fix PWM clock programming
>=20
> To alleviate this, could we either:
>=20
> a) Remove those two commits from your tree and into the Tegra tree. I
> think this won't cause any runtime issues, since Tegra PWM is a feature
> we aren't using yet, so it's OK if the branch it's made to work in is
> not the PWM branch.
>=20
> b) If your branch is stable, I can merge it into the Tegra tree in order
> to resolve the conflicts there. However, for this to work, you need to
> 100% guarantee that the branch won't be rebased between now and when you
> send Linus a pull request for 3.6.

I'd very much prefer a). Both patches touch only Tegra code anyway so
there's no harm to take them through the Tegra tree. Both patches are
also not dependent on the PWM framework in any way.

> Note that I'm out on Wednesday this week for 4th July holiday, and then
> leaving on vacation for 2 weeks on July 8th, so we need to resolve this
> quickly if we are to merge the Tegra common clock conversion before I
> leave. Also, once we do (a) or (b) above, Prashant needs to rebase his
> patches on the result, and he's in India, so there's a big time-zone
> delay there too.
>=20
> Sorry, when I ack'd the Tegra clock patches for the PWM tree, I don't
> believe the common clock conversion was on the horizon.

Nowhere near the horizon. =3D) Anyway I think a) above should be the
easiest and fastest so we should be able to get it resolved before
Wednesday. I can drop them from the PWM tree right away.

Thierry

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP8fWGAAoJEN0jrNd/PrOha3wQAIURiV8YR4lLB4F2CwZUs0wx
MSuG12Jv+lC3mBQPIdTpr6yibNEYv/Rhb/IZXnAv2GjnN3HDwcAC4BeQgD5Pinn5
ws+3hiRJUHWDnJLLt6xC1w1jX+A7hYxkRjAzKQpy67Aw9aq9oqPuluF4cntlocVv
sC4wElh9ljdzXThABfkrIeTwZicBL1L8uHTas1W0cHexJXb6KkGQgkOSbeDYNMZV
TmzTjcl+YptNrmK+1hClTO3cw9pJ2bNOUhlfqfeH1ZxdJXFOAi0IhIdxQuy/s1Ru
RCFMEvGKOWNJYUEoseQrv8D3gqvVnjgW2ETVj2tRPOb4x1q1NZ30Aw/QAEWtVGUM
zo248wMZ79W87cn9oVCT5viA4+x/cwXJVnlEeOtNv05AKngPsvbsMi3fg+aCQjWz
jYE6GjlYYGqALH/mDGMZdIrWKwAEhoZYapcGrjQfcgHxg7ulPW673LXTVuRQBKGX
3Uw07n2zmKB/9/lVWJEremrIVjSkkoROGgW+T1POMGtmAlRO+v3VmlNPr3qRn0rG
IIWcsRuaFkUePYyuqnvgg1ufOqkFSWiV65DFnAEdFwbVdWICSDq2cTQa4A4PmM+D
6lfijKdX5yYXJpDbakW4bHBL30Oi7dqh7PrIdw7r+Zgfr1812Nyfd2F0BGpLOrwl
3KY1DnT/IgFUQIFR9dsJ
=wZ+8
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
