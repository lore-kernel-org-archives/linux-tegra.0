From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PULL] drm/tegra: Fixes for v3.14-rc3
Date: Wed, 12 Feb 2014 08:06:58 +0100
Message-ID: <20140212070656.GA26778@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0016796742=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Dave Airlie <airlied@gmail.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0016796742==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:

  Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/for-3.14-rc3

for you to fetch changes up to b18915379071b31ea819a36ca67761620decba06:

  drm/tegra: Add guard to avoid double disable/enable of RGB outputs (2014-02-12 07:50:38 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v3.14-rc3

These patches contain a fix for a potential hang when the RGB output is
disabled twice, a typofix that prevents the framebuffer console from
being restored on ->lastclose() and an optimization to do as little work
as possible during host1x job submission.

----------------------------------------------------------------
Dmitry Osipenko (1):
      drm/tegra: Add guard to avoid double disable/enable of RGB outputs

Erik Faye-Lund (1):
      gpu: host1x: do not check previously handled gathers

Paul Bolle (1):
      drm/tegra: fix typo 'CONFIG_TEGRA_DRM_FBDEV'

 drivers/gpu/drm/tegra/drm.c |  2 +-
 drivers/gpu/drm/tegra/rgb.c | 11 +++++++++++
 drivers/gpu/host1x/job.c    |  2 +-
 3 files changed, 13 insertions(+), 2 deletions(-)

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+x2QAAoJEN0jrNd/PrOhrsEP/jqXfZd+4u8u272qDyQBHIQj
+pf4F2XGykoX4DyaiBmxozsP4Nyec/X0jddPH+GeEJh/qIumx8syDShxzA6Didqt
eN8aJBiuK17tZan72XmS+qepM55kzY388C6/jQhSnpg5cV/GCpNbLB6r/uMlOjwP
N2Y4QqtLCsv1GkrXr1UG42srydy5HrIt30Q5mOEkExuEbw6N+KStWmTun7Q4T9W5
n6vR7jzODTvjfECsjNSmecGwi6gU1a3aLBTJiqQbC9YjPbjb/VrYjd6OPyWNSX8X
JsM5vc6bQHuEFPOfTn7c7KtWQ0ds1Bf3FEPcZobVNJnj8tE0/LHTdDp9AHrErfsI
cOXx1ENbiGR99p2tVsYifbLlakT/WIufcpD2KzorNhx9L/w0IAiXLmkFOS8zpEVi
mhhHLOQ0wywaQhzm1z/A5K1Q0nOITbCcOh873PeNoEoKodEkKVPVwWYiiHmjbdFl
xQsxMnHx5M7a61yOlWLKyHhO4mwAmW1mfoZYw1uNX7M/L038c6r+rjrFaN18Wgtd
1leGN5ePKep8NKh6Kv4P14qRQguhmnbXwYOpHbdVZffBz6chzPES3bGtYrpLGq+E
ao1lmT7sAu1LlnOTwGb4gP+nM669FtbZajXi143nuJPxkSv9sO9lKITKX13zSZ4r
cqkuk6Pt5qOIecfn4kdX
=lsiB
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

--===============0016796742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0016796742==--
