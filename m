From: Dmitry Osipenko <digetx@gmail.com>
Subject: [RFC PATCH v2 0/2] Implement standard color keying properties for DRM planes
Date: Sat, 26 May 2018 18:56:21 +0300
Message-ID: <20180526155623.12610-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Alexandru Gheorghe <Alexandru_Gheorghe@mentor.com>, Russell King <linux@armlinux.org.uk>, Ben Skeggs <bskeggs@redhat.com>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hello, DRM maintainers!

Laurent Pinchart kindly agreed to allow me to pick up his work on
the generic colorkey DRM plane property [0]. I've reworked the original
patch a tad, hopefully making it flexible enough to cover various HW
capabilities.

Changes I've made:

	- Some code clean up and reshuffle.

	- Took into account some the Ville's Syrjälä review comments to [0].

	- The number of common DRM colorkey properties grows from 4 to 9.
	  New properties:
		- colorkey.mask
		- colorkey.format
		- colorkey.inverted-match
		- colorkey.replacement-mask
		- colorkey.replacement-format

	  Renamed properties:
		- colorkey.value -> colorkey.replacement-value

	- colorkey.mode userspace-property ENUM's got a bit more explicit
	  names, like "src" -> "src-match-src-replace".

	- No driver-specific modes / properties allowed, all unsupported
	  features are simply rejected by the drivers.

This patchset includes initial colorkey property implementation for the
older NVIDIA Tegra's.

Please review, thanks.

[0] https://lists.freedesktop.org/archives/dri-devel/2017-December/160510.html

Dmitry Osipenko (2):
  drm: Add generic colorkey properties
  drm/tegra: plane: Implement generic colorkey property for older
    Tegra's

 drivers/gpu/drm/drm_atomic.c  |  36 ++++++
 drivers/gpu/drm/drm_blend.c   | 229 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c    |  31 +++++
 drivers/gpu/drm/tegra/dc.h    |   7 ++
 drivers/gpu/drm/tegra/plane.c | 147 ++++++++++++++++++++++
 drivers/gpu/drm/tegra/plane.h |   1 +
 include/drm/drm_blend.h       |   3 +
 include/drm/drm_plane.h       |  77 ++++++++++++
 8 files changed, 531 insertions(+)

-- 
2.17.0
