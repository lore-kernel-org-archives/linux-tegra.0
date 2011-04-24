From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] Fix Tegra devicetree support
Date: Sat, 23 Apr 2011 22:30:01 -0600
Message-ID: <1303619404-27604-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I tried out:

git://git.secretlab.ca/git/linux-2.6.git devicetree/test

plus the following commits from jk's dtbimage branch:

  4c2eddb89542f73fe626813e3cdafc789f931aec
  arm: dtbImage support

  4cb80ac96489220554d28f6fde527aeef83e628b
  arm/dtbimage: copy dtb blob to offset from image base

  A local patch to modify the Tegra devicetree support to support
  Seaboard instead of Harmony.

... on an NVIDIA Tegra Seaboard board.

This patch series includes fixes to that branch to get Tegra booting to
user-space.

Note that soon after user-space starts, the system still crashes with:

  Unhandled prefetch abort: debug event (0x002) at 0x40e97714

However, this happens with or without actually providing a devicetree
image to the kernel (I modified jk's dtbimage wrapper just to jump
straight to the regular kernel startup, thus not providing a devicetree
at all). So, I suspect it's some unrelated issue. I'll try to follow up
and solve that too.

Stephen Warren (3):
  ARM: Tegra: dt: Compile fix; tegra_common_init removed
  ARM: Tegra: dt: Fix machine desc to match other boards.
  ARM: Tegra: Move Harmony .dts file to correct place

 arch/arm/boot/dts/tegra-harmony.dts   |  110 +++++++++++++++++++++++++++++++-
 arch/arm/mach-tegra/board-dt.c        |   13 ++--
 arch/arm/mach-tegra/board-harmony.dts |  113 ---------------------------------
 3 files changed, 114 insertions(+), 122 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/board-harmony.dts
