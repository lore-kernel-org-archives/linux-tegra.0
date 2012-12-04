From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC libdrm] Add NVIDIA Tegra support
Date: Tue,  4 Dec 2012 16:13:51 +0100
Message-ID: <1354634032-9986-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I mentioned in a reply to Terje's patch series for 2D acceleration that
I had prototyped some libdrm support a few weeks back. I've spent a bit
of time cleaning it up and decided to post it for early review.

There's really not much interesting code here. A basic API is provided
along with two IOCTLs that can be used to create Tegra-specific GEM, as
opposed to dumb buffer objects. Given the various comments on Terje's
proposed IOCTLs I wanted to make sure that these will be safe. I've seen
that other chips use 64-bit fields for the size and offset of buffer
objects and I wonder if those are really necessary.

Linux kernel patches for the IOCTLs are also in the works and I hope to
get around to posting them this week. Obviously there will be some
overlap between this and what Terje posted in his series, but it should
be easy to synchronize.

Thierry

Thierry Reding (1):
  libdrm: Add NVIDIA Tegra support

 Makefile.am               |   6 +-
 configure.ac              |  15 ++-
 include/drm/Makefile.am   |   1 +
 include/drm/tegra_drm.h   |  48 ++++++++++
 tegra/Makefile.am         |  17 ++++
 tegra/libdrm_tegra.pc.in  |  11 +++
 tegra/tegra.c             | 227 ++++++++++++++++++++++++++++++++++++++++++++++
 tegra/tegra.h             |  51 +++++++++++
 tests/modetest/modetest.c |   2 +-
 tests/vbltest/vbltest.c   |   2 +-
 10 files changed, 376 insertions(+), 4 deletions(-)
 create mode 100644 include/drm/tegra_drm.h
 create mode 100644 tegra/Makefile.am
 create mode 100644 tegra/libdrm_tegra.pc.in
 create mode 100644 tegra/tegra.c
 create mode 100644 tegra/tegra.h

-- 
1.8.0.1
