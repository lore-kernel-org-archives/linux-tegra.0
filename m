From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/8] Host1x IOMMU support + VIC support
Date: Mon, 5 Dec 2016 20:51:31 +0100
Message-ID: <20161205195131.GF22918@ulmo.ba.sec>
References: <20161110182345.31777-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1331541878=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20161110182345.31777-1-mperttunen@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1331541878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2016 at 08:23:37PM +0200, Mikko Perttunen wrote:
> This series adds IOMMU support to Host1x and TegraDRM
> and adds support for the VIC host1x client so that
> host1x can be tested on modern Tegra platforms.
> It depends on the previous fix series. The whole thing
> (modulo patch order) is available as a git repository at
> git://github.com/cyndis/linux.git; branch vic-v1.
>=20
> IO memory management is organized such that there are
> two domains: the host1x domain and the tegradrm domain.
> The host1x domain is used by the host1x engine and
> contains the host1x CDMA and pushbuffers for submitted
> jobs.
>=20
> The tegradrm domain is shared by all host1x units and
> contains GEM objects and memory allocated by the
> separate tegra_drm_alloc function. This function is
> currently used to allocate space for firmware blobs
> in the tegradrm domain.
>=20
> A userspace test case for VIC can be found at
> https://github.com/cyndis/drm/tree/work/tegra.
> The testcase is in tests/tegra and is called submit_vic.
> The in-kernel firewall is not implemented for VIC;
> therefore, IOMMU must be enabled for the test to pass.
>=20
> Tested with Jetson TX1 (T210). Probably works also
> with Jetson TK1 (T124). Note that due to hardware changes
> the testcase also needs to be changed to run properly
> on T124.

What's the scope of the changes required for Tegra124? If we add the
kernel bits for Tegra124 we should also have a userspace test program to
exercise it.

Thanks,
Thierry

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYRcVDAAoJEN0jrNd/PrOhStYP/Awx5tt3l1ASjGdYOqx8lFod
rhI3XcCOYq54Lpa3n8FHrKoXCQuJH/iLwajDUwrYLYOm8YuwfqOUccA7dhi+LE1m
6QYG/cw4Jn53641DreE8GaDHuOnGx+PxGMN2TOtFsJuFzqziKdgmrSKqNredj02z
OjwiDiANsO5mow6v3vyeLPYa2Y5IXTImCiv/qLiU+Ia48Ws+ApEJjlluNpwnQHnm
5oNwmjdlx7eVkAVyxn1AEK+N1/7rOSgtLknKTf+DqDDeCtDxZZHEFDUYE2HiF5dF
nZvF9mObxs6LhK05WdnLHvnL23e5fPYKaDzX2qGFOJphJbXpwdZIoppqMlSIxVSx
T/2X5pJ6cGowH//HdNy0G02A3vrBM8CjUOQFuaHd+xbv192BmkMsoKO+0S12vU6k
adPIk5LbEWvGFjxxaKamTSufU/4Zt6IT6KRj0fbSyKOW0pTTrFXnkIYx5yWPhvuf
Vw2RaWZZfuSs6yd58vV+lVszDSVgWj+qpwBjNS4LmP13XwcmFTWw7/RieitpXg9i
YdYzUzf7uzqmYDQJsN84Wpv1A1B6ayvi2SwKb5wN/qc5ugqk0e2meKTzQx8JZxrz
3cpvkHSCfP6+AHuvBwd639dgLLGCDOH4eLBvhC+DbK+J226N/gGSEDBCCHXAhSuH
OmI/G5/jddD+Wk2JCt+3
=7CgC
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--

--===============1331541878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1331541878==--
