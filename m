From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv8 15/21] iommu/tegra124: smmu: add support platform data
Date: Wed, 4 Jun 2014 23:37:25 +0200
Message-ID: <20140604213724.GC18780@mithrandir>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
 <1401448834-32659-16-git-send-email-hdoyu@nvidia.com>
 <5388B260.5000403@wwwdotorg.org>
 <87zjhzrzkq.fsf@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87zjhzrzkq.fsf-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2014 at 07:39:01PM +0300, Hiroshi Doyu wrote:
>=20
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>=20
> > On 05/30/2014 05:20 AM, Hiroshi Doyu wrote:
> >> The later Tegra SoC(>=3D T124) has more registers for
> >> MC_SMMU_TRANSLATION_ENABLE_*. Now those info is provided as platfrom
> >> data. If those varies a lot on SoCs in the future, we can consider
> >> putting them into DT later.
> >
> >> diff --git a/Documentation/devicetree/bindings/iommu/nvidia,tegra30-sm=
mu.txt b/Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.txt
> >
> >>  Required properties:
> >> -- compatible : "nvidia,tegra30-smmu"
> >> -- reg : Should contain 3 register banks(address and length) for each
> >> +- compatible : "nvidia,tegra124-smmu", "nvidia,tegra30-smmu"
> >> +- reg : Can contain multiple register banks(address and length) for e=
ach
> >>    of the SMMU register blocks.
> >
> > How many is "multiple"? This seems like rather a weak definition of how
> > many entries are expected. What are the different register banks?
>=20
> SMMU registers are part of MC registers. SMMU registeres are interleaved
> by MC(non-SMMU) registeres, most likely it's about ~10 banks.
>=20
> We concluded to not have SMMU as a child of MC since their features are
> so independent long time ago. This interleaved register locations are
> not so good. I requested H/W team to have them completely separated, but
> itt was too late to change.

This situation is really messy. In my opinion we should break DT
compatibility and expose this through a single memory-controller driver
rather than split it up into different subdevices.

That reflects the hardware more accurately and gets rid of a number of
quirks currently required just to make things work.

Thierry

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTj5GUAAoJEN0jrNd/PrOh2mMP/3DOz5DR5tTA5s1as+t3V1Bs
b+/V/sIY28MxEtRT6R2W1y0OxcwHKe69LE48nq+l3sHvR/qJ8La8LvAp9eoC69hF
/nplCs3u2+trAg8CFI954hP1YQ4vlafUYIkEsoUbgbuVT3iS4hloOhBYDpgW2NCl
Ul+i2WqrTpOSr9aG74NI3tvZgAKNx+H7t3r1caCE2mu+LaoDturrrGQstNXdMKqm
3HNZK+qRUKPrgODSZWgp4Kz57kEXoFqA73Yje2PU5bR5i8Qq+lYgGcLRYStHlhKN
uSpra39u+NgdRou7pDysJlEiKk5HCdvCbavHjQ7N5hn5wltqZLCu/Z7R7355Qe1t
V57dfjMy7WqbVKOrRLkykd9+7Kt/kJmY8h9EtgNKY/NFZbYaLWuwiaw8dUjyc5Og
gQfiRhzlLZlyV+iJKGQ7lxqj2QBjtGvDAXjl5Sl4h8GzB7B1zVJRkkMkvhGOBOlt
S6Rs2i7SEvuqPMoZRUiwWDdTVl8ahVFXN0iKrj8+IcuXobyPPJaCQnm8mz8j54ek
kAcwKP0QT5SyE8+tpFlfipiSA0/5tujulpnHWA7sqjRl3xNHTg1FWXCmZThpw3zl
bO9Ks8ynnJmOYpRmqzTa0n2dlyYkab+B0DtaQS89U9PQUf8AyKir5UKHd984EmVB
7JS06pvQnVOKahh0vScc
=I9An
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--
