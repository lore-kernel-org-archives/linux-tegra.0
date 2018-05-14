From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/tegra: Acquire a reference to the IOVA cache
Date: Mon, 14 May 2018 11:02:10 +0200
Message-ID: <20180514090210.GD18312@ulmo>
References: <20180423065745.26102-1-thierry.reding@gmail.com>
 <20180423065745.26102-2-thierry.reding@gmail.com>
 <98ffd7c2-1184-a667-39e5-68d011e516a4@gmail.com>
 <ae552ade-e4e7-669c-ee85-820a92490871@gmail.com>
 <c07b8a6a-3509-74d0-17a1-f7ace40f532b@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1784913769=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <c07b8a6a-3509-74d0-17a1-f7ace40f532b@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1784913769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IMjqdzrDRly81ofr"
Content-Disposition: inline


--IMjqdzrDRly81ofr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 23, 2018 at 11:43:16AM +0300, Dmitry Osipenko wrote:
> On 23.04.2018 11:41, Dmitry Osipenko wrote:
> > On 23.04.2018 11:34, Dmitry Osipenko wrote:
> >> On 23.04.2018 09:57, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> The IOVA API uses a memory cache to allocate IOVA nodes from. To make
> >>> sure that this cache is available, obtain a reference to it and relea=
se
> >>> the reference when the cache is no longer needed.
> >>>
> >>> On 64-bit ARM this is hidden by the fact that the DMA mapping API gets
> >>> that reference and never releases it. On 32-bit ARM, however, the DMA
> >>> mapping API doesn't do that, so allocation of IOVA nodes fails.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>
> >> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> >> Tested-by: Dmitry Osipenko <digetx@gmail.com>
> >>
> >> CONFIG_TEGRA_IOMMU_SMMU is enabled in the default kernel configs and h=
ence DRM
> >> should fail to probe on t124 since 4.11. What about to add stable tag =
for v4.11+
> >> here to unbreak stable kernels as well?
> >=20
> > IOMMU node for host1x was added to t124 DT in kernel v4.14, so s/4.11/4=
=2E14/.
>=20
> On the other hand nothing stops to use newer DT with older kernel.

I've applied this and added:

	Fixes: ad92601521ea ("drm/tegra: Add Tegra DRM allocation API")

Since that's the commit that introduced the iova API usage. It seems
like we also need a fix in drivers/gpu/host1x to grab a reference to
this IOVA cache because the host1x driver also makes use of that. It
looks as if this patch currently papers over that bug, and there's
very little chance that anyone will use the host1x driver without the
Tegra DRM driver. However, it's probably best to still fix it to avoid
future exposure.

I'll go type that patch up now.

Thierry

--IMjqdzrDRly81ofr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr5UJIACgkQ3SOs138+
s6ERCRAAnnQGEcsfvaXbqfleFVdaQFeFusI5ej7Z+wjfS5+b+isT4939MEV+XRYa
Ex2xK3wlcEv0MPWew0r1YKX+YCVJLlkWu3/pCsesIbtNYE400YO6sdHKSNqsGna2
r+RvpCDIeo1eVqvsq0hOwWU6oLB/Tre9o3AsqLWgTcZOeKDt9e2x84FMjKWrRRcL
YxotakhrGgfECuyEExynOHR4z0HROuz4l4arM18DpEcaMS6KkXKjHoBurj03yCbT
xmX/jeHoQSS6ADqu8CcVR0I/gXLf70LwjNc1mgPWeowLfJ1F4Cx5GgB/docXz9Hu
o7mDIE+LH/4aLCX0zQLmOZ3S9h8Tv2fyd0/uHShHHTFh31z5hyrOWtH0eTV+bYSC
P6dm9tDrE8m8GsD52jdxKG/MrmD5C2YqhocX5wGtMTWQ0PguckCJKu1Y2tzQ7L3O
aHfTOXW9EzZbecoavj2gMKXqk9XM2kN2BbQrquWhkKBegsgP7fX8hBYN8Y2/2avH
CWi3shTOQuM9W85Isx+KScODWtMvoiZtBhTB9bAlK08RpuzDQZYnhlNhxvwWFj5K
TET9xxs85GOQPagI4cNo5FkXBbOr9PcDpwID2uVCOonONdU+CXHTFJxRn/YjmpqN
Ch8rrtKoBJk1Tqd/Becn8RN0muZHilun6qd7BTAMAtwXIrt/w/g=
=scxj
-----END PGP SIGNATURE-----

--IMjqdzrDRly81ofr--

--===============1784913769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1784913769==--
