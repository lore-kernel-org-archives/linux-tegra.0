From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFCv2,libdrm 0/2] NVIDIA Tegra support
Date: Fri, 12 Apr 2013 13:41:58 +0300
Message-ID: <1365763320-31360-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch series adds application level support for host1x hardware
on Tegra SoCs. This set of patches can be used in combination with
host1x kernel patches. The most recent version of the kernel patch
series is available at [0].

An example of using 2d hardware acceleration with this library is
available at [1].

Changes in version 2:
- Instead of using assertations, the library now returns error codes
- Added a minimal set of tests to test common use cases
- The size of a stream buffer pool can be set runtime
- The library keeps track of syncpoint increments
- Added reference counting to buffer management
- Removed 2d related patches from the series
- Rebased to latest libdrm
- Updated ioctl interface
- Fixed stylish issues

[0]: http://gitorious.org/linux-host1x/linux-host1x
[1]: http://gitorious.org/linux-host1x/libdrm-host1x/commits/2d

Arto Merilainen (2):
  tegra: Add stream library
  tests: tegra: Add stream library test

 Makefile.am                            |    6 +-
 configure.ac                           |   14 +
 tegra/Makefile.am                      |   25 +
 tegra/class_ids.h                      |   36 ++
 tegra/host1x01_hardware.h              |  125 ++++
 tegra/hw_host1x01_uclass.h             |  155 +++++
 tegra/libdrm_tegra.pc.in               |   10 +
 tegra/tegra_drm.c                      |  998 ++++++++++++++++++++++++++++++++
 tegra/tegra_drm.h                      |  136 +++++
 tegra/tegra_drmif.h                    |  110 ++++
 tests/tegra/host1x/Makefile.am         |   12 +
 tests/tegra/host1x/tegra_host1x_test.c |  893 ++++++++++++++++++++++++++++
 12 files changed, 2519 insertions(+), 1 deletion(-)
 create mode 100644 tegra/Makefile.am
 create mode 100644 tegra/class_ids.h
 create mode 100644 tegra/host1x01_hardware.h
 create mode 100644 tegra/hw_host1x01_uclass.h
 create mode 100644 tegra/libdrm_tegra.pc.in
 create mode 100644 tegra/tegra_drm.c
 create mode 100644 tegra/tegra_drm.h
 create mode 100644 tegra/tegra_drmif.h
 create mode 100644 tests/tegra/host1x/Makefile.am
 create mode 100644 tests/tegra/host1x/tegra_host1x_test.c

-- 
1.7.9.5
