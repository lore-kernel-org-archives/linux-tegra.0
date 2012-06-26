From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: Tegra DRM device tree bindings
Date: Tue, 26 Jun 2012 21:31:45 +0200
Message-ID: <20120626193145.GB5247@avionic-0098.adnet.avionic-design.de>
References: <20120626105513.GA9552@avionic-0098.mockup.avionic-design.de>
 <4FE9B291.2020305@nvidia.com>
 <20120626134122.GA1115@avionic-0098.mockup.avionic-design.de>
 <4FE9F4CA.10907@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE9F4CA.10907-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2012 at 11:43:38AM -0600, Stephen Warren wrote:
> On 06/26/2012 07:41 AM, Thierry Reding wrote:
> > On Tue, Jun 26, 2012 at 04:01:05PM +0300, Terje Bergstr=C3=B6m wrote:
> >> On 26.06.2012 13:55, Thierry Reding wrote:
> ...
> >>> status =3D "disabled";
> >>>=20
> >>> gart =3D <&gart>;
> >>>=20
> >>> /* video-encoding/decoding */ mpe { reg =3D <0x54040000
> >>> 0x00040000>; interrupts =3D <0 68 0x04>; status =3D "disabled"; };
> >>=20
> >>=20
> >> The client device interrupts are not very interesting, so they
> >> could be left out, too. Display controller related are probably
> >> an exception to this.
> >=20
> > If the interrupts aren't used at all we should drop them.
>=20
> I disagree here; "used" is most likely something specific to a
> particular OS's drivers. The HW always has the interrupts, and hence
> they should be described in DT.

Okay, I see. Does the same apply to the COP interrupts of the host1x
node in your opinion? I don't know if it makes sense to describe
something that's not reachable from the CPU. Yet it is defined in the
GIC.

Thierry

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP6g4hAAoJEN0jrNd/PrOhv3kQALuGSZG57HasyAPLjFXufm4A
DJumKor8TTAZSFUfnolpiCk+gBCyvFRzzyU3Kb+fzKbtm7z/4joLNY6slS/fGnhK
IxmW4lltQbQpZ/yeTw3+/2tH37Q0GwIwdQqGVwgsGkJNj7n53B2KfsxRqTE5A2gl
xxq3+RYjAzzaP0KEeTqzS8ynCk+ZO4gHfzdj2k/BHz5/efxi6C5cxjRBQk/7C6Cg
Dsvh+tiyF2BK6PC3j2Mtb0MNld+G9FKJCLi0J/CQ50/yqUz/VrhZcG/i7jZVh9Sl
Kqpq7E7IRE+wZerYvJUssb4Zd0868kOa0+BfFHQ4Q+NMgJE1Da0J4SHmxc787V/w
lfsfn9hr8tC+e6Sd6o4I2fa/bHXyXjHQmEdbs3ZtQ5mloNkfNVIL/MWPS2jlc9KH
xGCLLvMm807FMdcztXQ7i3dVhiFzzDnIgR20vgcgRxxCTUHh/IdPVeDz1ShvjBvS
2tvzJBq0Duq1olcwBQJjXE/irwJU4x43lknnZOLbQYo0mw/n+dmYyB0jKYIPC7ru
GowM3gx2tv/TQr1NsTGrkQCxp5TUKSalgiziRlxeG5lWoFeG8cJVgppRJ01Mkem1
0jJBM3WKWK6MTvye7cQUPMnDO7xSKqN0diBaMF3e5UHnhMNo1OxXzBzyXZVgAY/n
kNKi8L+mM+SxdjfGkDuI
=qTKP
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
