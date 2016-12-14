From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/7] Host1x IOMMU support + VIC support
Date: Wed, 14 Dec 2016 15:18:55 +0100
Message-ID: <20161214141855.GA30076@ulmo.ba.sec>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
 <20161214123004.urnvlqarcnp5rp4a@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161214123004.urnvlqarcnp5rp4a-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2016 at 01:30:04PM +0100, Daniel Vetter wrote:
> On Wed, Dec 14, 2016 at 01:16:10PM +0200, Mikko Perttunen wrote:
> > This series adds IOMMU support to Host1x and TegraDRM
> > and adds support for the VIC (Video Image Compositor)
> > host1x client. The series is available as a git repository at
> > git://github.com/cyndis/linux.git; branch vic-2.
> >=20
> > A userspace test case for VIC can be found at
> > https://github.com/cyndis/drm/tree/work/tegra.
> > The testcase is in tests/tegra and is called submit_vic.
> > The testcase/TRM include full headers and documentation
> > to program the unit. The unit by itself, however, does not
> > readily map to existing userspace library interfaces, so
> > implementations for those are not provided.
>=20
> Afaik libva has an entire pile of post-processing support. Pretty sure
> other video transcode libraries have similar interfaces, so should all be
> possible to implement this.
>=20
> Until that exists I really think that the VIC part (and only that, since
> tk1/tx1 in general seems to work with nouveau and all that) should stay
> out of tree.

I think the VIC is somewhat special with regard to userspace ABI. I
understand and completely agree with the requirements the community
has established. However, as Mikko already said, there's no use for
standalone VIC at all. There aren't any APIs that map to what the
hardware does (except maybe parts of X or perhaps pixman, neither
of which are likely to see implementations using VIC). I'm also not
aware of any of the proprietary driver stack using only VIC for any
use cases.

The primary reason that I want VIC support upstream is because it
makes it easier to test host1x support. Currently the only units that we
can test against are gr2d and gr3d on Tegra20 through Tegra114. With
Tegra124 gr2d and gr3d went away and got replaced by the gk20a GPU which
doesn't use the host1x infrastructure. So on Tegra124 and later we
currently have no way of exercising that code. Now, Tegra124 and
Tegra210 are by far the most popular generations at this point and there
are very few people running Tegra20 or Tegra30 with an upstream kernel
(there are some still, and I think they're all awesome) so the host1x
infrastructure is effectively untested and therefore I get very nervous
whenever I have to apply patches against it because we can only validate
on very old chips.

Tegra124 is also somewhat of a special case. While it has a GPU that's
driven by Nouveau, it doesn't yet have NVDEC and NVENC support that the
newer Tegra210 has. The video encoding, if I remember correctly, is a
precursor to NVENC (MSENC?) but video decoding is the "legacy" hardware
that we had on earlier chips. That involved a fairly complicated setup
with firmware that needs to be loaded to a fixed address in system
memory (or mapped using the IOMMU). The bottom line is that it's
unlikely that we'll ever see an open-source implementation for video
decoding on Tegra124 (unless somebody reverse-engineers it), and hence
we'd essentially be left without any way of testisc host1x support on
TK1.

All of that said, I could carry these patches out of tree and use them
for testing until we've got a complete userspace ready. It's just
something that I had hoped I could avoid.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhRVMwACgkQ3SOs138+
s6HYNA//fXABvyPT8JFV8qrxXm/w5pBQFSrRmSxuyncyFGhEPal7NGYxOPc4XQ7h
T+dRkxse1BdH7YzQT8yPdFoh1L9mPMn1fxp4PWcOjd6OE4i31xiLRyqjms9ELuvE
Mmnj7Hw6pUGWTxddx/PdQPpazidECnVt1T/2XEk+ORnqdsS4jyL5uFaDDFav66DL
dNnTI2UM6hpuC6wwo4ito9dzG0S194O7njIDE50LFahK04UymWrtg7jeQH0nruQD
Ggl/43WNEflut6JfkopTjhnYV4/iV1LaogfCVfCbDZzQZ104rVxcGSZNTu1Q3As6
fyAlrhbgkgv1cvsfTu92eePGeAVrWEHp0TPnYkaD0WlfqarsQT2es1CZUEZq1IpS
coFGB8c35Nzr9JkVZLHJTIfo/NhhEyvafl9JftcY6bbwLVAWocsie8eXKn5SDCAp
8umqNn47Ix6S9j4jdKhNy9h9U9SE78eHGUQuzweJvHwBpnYM7mlkZonrKId4ghX8
J5S0CxIPHd+Rjtk9r0TVWBDRAie5YTkweSylYzEepzG4jFBYou2x3V45vtpqKmYt
V6AXuLQWcFl6HjwBnvsrFfU/T+E+0SNfi2nCZodERorQZym8lUbcpbk3Qat90izE
q1O1JPgAv/3z6FFZHTH283XwsnMpGTy448tQYKQ29zQGeXsi7KU=
=MGJy
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
