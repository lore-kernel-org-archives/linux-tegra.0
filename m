From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] drm/tegra: Changes for v4.16-rc1
Date: Mon, 8 Jan 2018 16:47:38 +0100
Message-ID: <20180108154738.GA3324@ulmo>
References: <20180105141726.29713-1-thierry.reding@gmail.com>
 <558f572b-8174-c8ee-3ff8-79e591c0648d@gmail.com>
 <20180108074250.GA10590@ulmo>
 <a3ee43a4-8c7a-9c6f-b5fa-ea66657c4ab8@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1883007802=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <a3ee43a4-8c7a-9c6f-b5fa-ea66657c4ab8@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1883007802==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 08, 2018 at 04:47:32PM +0300, Dmitry Osipenko wrote:
> On 08.01.2018 10:42, Thierry Reding wrote:
> > On Fri, Jan 05, 2018 at 05:58:17PM +0300, Dmitry Osipenko wrote:
> >> On 05.01.2018 17:17, Thierry Reding wrote:
> >>> Hi Dave,
> >>>
> >>> The following changes since commit 9428088c90b6f7d5edd2a1b0d742c75339=
b36f6e:
> >>>
> >>>   drm/qxl: reapply cursor after resetting primary (2017-12-08 13:37:0=
2 +1000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://anongit.freedesktop.org/tegra/linux tags/drm/tegra/for-4.16-r=
c1
> >>>
> >>> for you to fetch changes up to ebae8d07435ae91314f4a28d69b530d09c6258=
15:
> >>>
> >>>   drm/tegra: dc: Implement legacy blending (2017-12-21 14:55:55 +0100)
> >>>
> >>> Thanks,
> >>> Thierry
> >>>
> >>> ----------------------------------------------------------------
> >>> drm/tegra: Changes for v4.16-rc1
> >>>
> >>> The bulk of these changes are preparation work and addition of support
> >>> for Tegra186. Currently only HDMI output (the primary output on Jetson
> >>> TX2) is supported, but the hardware is also capable of doing DSI and
> >>> DisplayPort.
> >>>
> >>> Tegra DRM now also uses the atomic commit helpers instead of the open-
> >>> coded variant that was only doing half its job. As a bit of a byprodu=
ct
> >>> of the Tegra186 support the driver also gained HDMI 2.0 as well as zp=
os
> >>> property support.
> >>>
> >>> Along the way there are also a few patches to clean up a few things a=
nd
> >>> fix minor issues.
> >>>
> >>> ----------------------------------------------------------------
> >>> Arnd Bergmann (2):
> >>>       drm/tegra: Mark Tegra186 display hub PM functions __maybe_unused
> >>>       drm/tegra: Fix non-debugfs builds
> >>>
> >>> Dmitry Osipenko (3):
> >>>       drm/tegra: dc: Link DC1 to DC0 on Tegra20
> >>>       drm/tegra: gem: Correct iommu_map_sg() error checking
> >>>       drm/tegra: Correct timeout in tegra_syncpt_wait
> >>>
> >>> Thierry Reding (43):
> >>>       drm/fourcc: Fix fourcc_mod_code() definition
> >>>       drm/tegra: Sanitize format modifiers
> >>>       gpu: host1x: Rewrite conditional for better readability
> >>>       gpu: host1x: Cleanup on initialization failure
> >>>       dt-bindings: display: tegra: Update SOR for Tegra186
> >>>       drm/tegra: dc: Move register definitions into a table
> >>>       drm/tegra: dsi: Move register definitions into a table
> >>>       drm/tegra: hdmi: Move register definitions into a table
> >>>       drm/tegra: sor: Move register definitions into a table
> >>>       drm/tegra: dc: Reshuffle some code
> >>>       drm/tegra: dc: Register debugfs in ->late_register()
> >>>       drm/tegra: dsi: Register debugfs in ->late_register()
> >>>       drm/tegra: hdmi: Register debugfs in ->late_register()
> >>>       drm/tegra: sor: Root debugfs files at the connector
> >>>       drm/tegra: sor: Register debugfs in ->late_register()
> >>>       drm/tegra: Do not wrap lines unnecessarily
> >>>       drm/tegra: vic: Properly align arguments
> >>>       drm/tegra: dc: Support background color
> >>>       drm/tegra: Use atomic commit helpers
> >>>       drm/tegra: Remove custom page-flip handler
> >>>       drm/tegra: dc: Remove tegra_primary_plane_destroy()
> >>>       drm/tegra: dc: Remove duplicate plane funcs
> >>>       drm/tegra: dc: Remove tegra_overlay_plane_destroy()
> >>>       drm/tegra: dc: Remove duplicate plane funcs
> >>>       drm/tegra: dc: Move state definition to header
> >>>       drm/tegra: Move common plane code to separate file
> >>>       drm/tegra: Add Tegra186 display hub support
> >>>       drm/tegra: dc: Add Tegra186 support
> >>>       drm/tegra: Support ARGB and ABGR formats
> >>>       drm/tegra: sor: Parameterize register offsets
> >>>       drm/tegra: sor: Add Tegra186 support
> >>>       drm/tegra: sor: Support HDMI 2.0 modes
> >>>       drm/tegra: dpaux: Implement runtime PM
> >>>       drm/tegra: dpaux: Add Tegra186 support
> >>>       drm/tegra: fb: Force alpha formats
> >>>       drm/tegra: dc: Support more formats
> >>>       drm/tegra: dc: Use direct offset to plane registers
> >>>       drm/tegra: dc: Remove redundant spinlock
> >>>       drm/tegra: Implement zpos property
> >>>       gpu: host1x: Use IOMMU groups
> >>>       drm/tegra: Use IOMMU groups
> >>>       drm/tegra: dpaux: Keep reset defaults for hybrid pad parameters
> >>
> >>
> >>>       drm/tegra: dc: Implement legacy blending
> >>
> >> Please hold on this patch. First of all it doesn't work correctly, see=
 my last
> >> reply to the patch. Secondly, it introduces bug that breaks YUV plane.
> >=20
> > I thought we had already concluded that this version doesn't cause any
> > regressions. And since this is new functionality I'm not too worried if
> > it doesn't work in all cases, we've got plenty of time to fix those up.
>=20
> My expectation was that you'll update the patch. I'm not sure why you'd w=
ant to
> go with something half-working while there is already a version of the pa=
tch
> that works correctly (or at least better), but of course it's up to you t=
o decide.

The patch that you had proposed had some rough corners that I wasn't
happy about, though I don't think I ever properly reviewed it. The
bottom line is that I wanted to avoid writing window registers in the
->atomic_flush() callback and the patch was encoding the plane Z-order
in a very fixed way. Granted, that's still true for the variant included
in this pull request, but in my opinion it paves the way to add proper
zpos property support.

Also, I seem to remember getting different test results than you, so,
again, I think we need to nail this down using proper test cases to make
sure we're testing the same things (and with the added bonus that we can
use them for regression testing). I'll set aside some time over the next
few days to write up these tests.

> If you'll decide to change your mind, feel free to cherry-pick and squash=
 the
> patch-fix [0] which also contains the fix for the YUV and adds missed ARG=
B4444
> format.

We can't easily support the ARGB4444 format in the same way as the
others because there is no equivalent opaque format. We could possible
do this if we converted between opaque and alpha formats via the DRM
formats rather than the Tegra native formats, but that would be a bit
too much churn at this point. Let's revisit that for v4.17.

> > As for the YUV plane bug, can you point me at a test case, or describe
> > what exactly you're trying to do so that I can reproduce and fix it?
>=20
> Video displaying with libvdpau-tegra is broken. Your fix for the YUV is c=
orrect.
>=20
> > I'd like to make forward progress on this rather than hold back on
> > patches out of fear that they may break existing functionality. In order
> > to do that we need tests that can be run to validate existing
> > functionality.
>=20
> Unfortunately there is another problem that this patch uncovered. The
> kms-planes-blend hangs my T30 which has a bit different display configura=
tion
> compared to T20 (it lacks HDMI). The fix [1] is quite simple, you may
> cherry-pick the patch and include it in the pull-request if it's fine to =
do so
> and if the patch looks okay, alternatively I can send the patch to the ML=
 a bit
> later today.

I've picked up some bits from the fix into two separate patches. I think
setting the possible_crtcs mask to 0 for primary and cursor planes is
not correct. It looks as if this might work now because of the leases
code, but I'd like to be explicit in the driver and specify the correct
mask from the start. Otherwise we start relying on the leases code to do
the right thing and errors may creep back in if that part of the code
ever changes.

I also picked up the plane cleanup fix from your patch, though I had to
modify it a little to make sure we don't create additional planes on
Tegra186 and later (essentially kept the tegra_dc_add_planes() function
but rolled in your fixes into that instead). Also I took care of the XXX
tegra_plane_destroy() TODO while at it.

I've uploaded all of the changes to the drm/tegra/for-next branch,
though I didn't squash anything in yet to leave the branch intact for
the pull request.

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlpTkpYACgkQ3SOs138+
s6F4NA/8DTqNuoiaYqGLdMo8XRstsiCgvzlEHva8zjGRHFI7obMVJ0j8QMOc3PCl
/nRYakLcs2vGRaKfYqj8MqySS9CNdOrLPwok6C+tLkUiC6tH1GbSEx7YdjJbzLul
JZtMi/IC3BXOiNqa7WFPPQiW+55/3rEm/EBIDoPDKsxMe9DC5OSRY0A2MJP1HF5y
6LO1rdoXnzFxA9vCoeiHqd3+uWQ+/NyuuXkMK4YYNB/kIv4+hPGcfYFRitwsV9Rd
fHK1SesJhwocRqaFvYqYrvpx9o72Ci7AKnK8YriUXD3zRLnG8X66mTT8lNxV0RiD
w/L95j5ZIYCd7ENGB0ZvmHt13ywi9Z4aTXUZye/D+Bhk8nlrPkRuXJ/egSPuyOID
IgC7mp6XMaIjnj+xI3NIeiXD0Zn3Tq4f04vC6v7kX3ZWnmmjA8/ZF5uOAT+H3rmU
+4LBaSpMgxOuFg2/wgaDSpD8QM0t0I2ToVxrhWAjNC4FjUJPfvv1fQsMnNoQx/yC
pdJfo9HYxrCjoHI3W0CivWojk4vNSYbJ0w9q5h2KAkhNa26uzIfN6aP83+0h5xWB
DZGW8lrwD16/2HePI0Sta7WOFma9xqtuFK7+v+HSvG8yyA1MVkl4xaKoKrbWDoFG
8eWTckGYpTceI0jUTFUE9xohxTmfia44mx/orvSfJM923bbncFQ=
=5hSu
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

--===============1883007802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1883007802==--
