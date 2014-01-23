From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: drm/tegra: Changes for v3.14-rc1 (update)
Date: Thu, 23 Jan 2014 16:35:04 +0100
Message-ID: <20140123153502.GA30818@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

The following changes since commit 81239c6f7972d4909a6862d08ed1d2943983ffd4:

  drm/tegra: fix compile w/ CONFIG_DYNAMIC_DEBUG (2013-12-20 15:56:33 +0100)

are available in the git repository at:

  git://anongit.freedesktop.org/tegra/linux tags/drm/for-3.14-rc1-20140123

for you to fetch changes up to 13411ddd319057ae334a4084ebcf2c741b317f34:

  drm/tegra: Obtain head number from DT (2014-01-23 15:51:32 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Changes for v3.14-rc1 (update)

These patches fix some issues caused by the DRM panel support from the
previous pull request and add two more panels (for the Toshiba AC100 as
well as the Seaboard and Ventana).

----------------------------------------------------------------
Marc Dietrich (1):
      drm/panel: Add support for Samsung LTN101NT05 panel

Russell King (1):
      drm: provide a helper for the encoder possible_crtcs mask

Stephen Warren (2):
      drm/panel: Add support for Chunghwa CLAA101WA01A panel
      drm/panel: update EDID BLOB in panel_simple_get_modes()

Thierry Reding (7):
      drm: Move drm_encoder_crtc_ok() to core
      drm/i915: Use drm_encoder_crtc_ok()
      drm/tegra: Fix possible CRTC mask for RGB outputs
      drm/tegra: Clarify how panel modes override others
      drm/tegra: Use proper data type
      gpu: host1x: Remove unnecessary include
      drm/tegra: Obtain head number from DT

Wolfram Sang (1):
      drm/tegra: Don't check resource with devm_ioremap_resource()

 .../bindings/gpu/nvidia,tegra20-host1x.txt         |  3 ++
 .../bindings/panel/chunghwa,claa101wa01a.txt       |  7 +++
 .../bindings/panel/samsung,ltn101nt05.txt          |  7 +++
 drivers/gpu/drm/drm_crtc.c                         | 23 ++++++++++
 drivers/gpu/drm/drm_crtc_helper.c                  | 29 ------------
 drivers/gpu/drm/i915/intel_display.c               | 26 +----------
 drivers/gpu/drm/panel/panel-simple.c               | 51 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                         | 41 ++++++++++++++++-
 drivers/gpu/drm/tegra/hdmi.c                       |  3 --
 drivers/gpu/drm/tegra/output.c                     |  7 ++-
 drivers/gpu/drm/tegra/rgb.c                        |  2 +-
 drivers/gpu/host1x/hw/intr_hw.c                    |  1 -
 include/drm/drm_crtc.h                             | 26 +++++++++++
 13 files changed, 164 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/chunghwa,claa101wa01a.txt
 create mode 100644 Documentation/devicetree/bindings/panel/samsung,ltn101nt05.txt

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS4TamAAoJEN0jrNd/PrOhlfUP/2S+Z0mIEDdh/bGeWwRQBUMK
rd82wiAWO1IG/yD+BM86oJD3RsQPWTkAHpNN+rd3JR4sJDKCJlyPrLzxEtEoJM/m
E6DPPrjMF8UvXs2E1iqJuN28QQjasbBJxiLSGq1lNtEu8ylmJgBFQmvHXeu3kDLb
wM4pqQdVKRAOZ49J3nr0QOJ6ea5izA0CjM8Paefs+py0mPoJYVDBTQrkKE031v96
YTkgNrY718cRfzn4WtYHeF3LNWXwDFDNbhbFcQ0VJqMHyD7lY43klu6J+MPlN0IU
8j80LC9hzOU2IT30Rqpw1AHXJwJ+slLsGBQu9Cfo9IAF/MQSSeCWMPSB3a/awgcr
bjjI7R0M1+8FI/ymuxfl0ccDxsltP4oEDm2yQyPIj1iK0GI5evOv8xcwnI0s93qZ
Qze/f3L5UBcNgiRgIzD/zWaQ1HRlbk1PdINHG5eL8767HUb5IApsVvcUPmW/eM1B
rsBcNADmuOFT9v99Adi0R0jaHfKnhkhShRP5NAUvhhuVxbqYWqnHQVeyhdgzu3kj
HKGlhUQMYCCPtDGxTD6rcYgTD8JywS7obC2/DlQRKMGBgerNYCLY7AkOAk1g0dh0
Myld9EiVmJsPGpc9ChB7hFgUX+FBSuXSS0B4PZneybxKpglJXZY7H4550WI5fxz4
COTULdDbtjoIbrr6I90U
=6kCi
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
