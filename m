From: =?UTF-8?q?Arto=20Meril=C3=A4inen?= <amerilainen@nvidia.com>
Subject: [RFC,libdrm 0/3] NVIDIA Tegra support
Date: Thu, 13 Dec 2012 16:01:05 +0200
Message-ID: <1355407268-32381-1-git-send-email-amerilainen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: thierry.reding@avionic-design.de, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc: fhart@nvidia.com, tbergstrom@nvidia.com
List-Id: linux-tegra@vger.kernel.org

From: Arto Merilainen <amerilainen@nvidia.com>

This patch series adds application level support for 2d hardware
acceleration on Tegra SoCs.

The patch series consists of three patches: Host1x stream library, 2d
library and a test application for the 2d library. The first patch
introduces stream library that is used for doing buffer management,
synchronization and command stream management. The second patch adds
support for doing simple 2d operations (fill, copy, stretch). The
third patch adds a test application for the 2d functions.

Currently, both stream and 2d libraries are placed under libdrm.
The current goal is to introduce the code and move it later into its
own library (or merge it to Tegra DDX).

Memory management code is not compatible with the patches Thierry
sent previously. However, synchronizing the code should not be
hard as they both add the same functionality.

Arto Merilainen (1):
  tegra: Add stream library

Francis Hart (2):
  tegra: Add 2d library
  tests: tegra: Add 2d tests

 Makefile.am                    |    6 +-
 configure.ac                   |   14 +
 tegra/2d/hw_gr2d.h             | 2614 ++++++++++++++++++++++++++++++++++++++++
 tegra/2d/tegra_2d_api.c        |  235 ++++
 tegra/2d/tegra_2d_color.c      |  412 +++++++
 tegra/2d/tegra_2d_color.h      |   51 +
 tegra/2d/tegra_2d_context.c    |  140 +++
 tegra/2d/tegra_2d_context.h    |   67 +
 tegra/2d/tegra_2d_copy.c       |  209 ++++
 tegra/2d/tegra_2d_copy.h       |   38 +
 tegra/2d/tegra_2d_fill.c       |  136 +++
 tegra/2d/tegra_2d_fill.h       |   36 +
 tegra/2d/tegra_2d_frcopy.c     |  274 +++++
 tegra/2d/tegra_2d_frcopy.h     |   85 ++
 tegra/2d/tegra_2d_g2copy.c     |  272 +++++
 tegra/2d/tegra_2d_g2copy.h     |   88 ++
 tegra/2d/tegra_2d_g2fill.c     |  192 +++
 tegra/2d/tegra_2d_g2fill.h     |   80 ++
 tegra/2d/tegra_2d_reg_g2sb.h   |   89 ++
 tegra/2d/tegra_2d_reg_host.h   |  119 ++
 tegra/2d/tegra_2d_sbcopy.c     |  388 ++++++
 tegra/2d/tegra_2d_sbcopy.h     |   94 ++
 tegra/2d/tegra_2d_surface.c    |  280 +++++
 tegra/2d/tegra_2d_surface.h    |   57 +
 tegra/2d/tegra_2d_util.c       |  145 +++
 tegra/2d/tegra_2d_util.h       |   89 ++
 tegra/Makefile.am              |   36 +
 tegra/class_ids.h              |   35 +
 tegra/host1x01_hardware.h      |  122 ++
 tegra/hw_host1x01_uclass.h     |  143 +++
 tegra/libdrm_tegra.pc.in       |   10 +
 tegra/tegra_2d.h               |  223 ++++
 tegra/tegra_drm.c              |  876 ++++++++++++++
 tegra/tegra_drm.h              |  142 +++
 tegra/tegra_drmif.h            |  107 ++
 tests/tegra/2d/Makefile.am     |   13 +
 tests/tegra/2d/tegra_2d_test.c |  413 +++++++
 37 files changed, 8329 insertions(+), 1 deletion(-)
 create mode 100644 tegra/2d/hw_gr2d.h
 create mode 100644 tegra/2d/tegra_2d_api.c
 create mode 100644 tegra/2d/tegra_2d_color.c
 create mode 100644 tegra/2d/tegra_2d_color.h
 create mode 100644 tegra/2d/tegra_2d_context.c
 create mode 100644 tegra/2d/tegra_2d_context.h
 create mode 100644 tegra/2d/tegra_2d_copy.c
 create mode 100644 tegra/2d/tegra_2d_copy.h
 create mode 100644 tegra/2d/tegra_2d_fill.c
 create mode 100644 tegra/2d/tegra_2d_fill.h
 create mode 100644 tegra/2d/tegra_2d_frcopy.c
 create mode 100644 tegra/2d/tegra_2d_frcopy.h
 create mode 100644 tegra/2d/tegra_2d_g2copy.c
 create mode 100644 tegra/2d/tegra_2d_g2copy.h
 create mode 100644 tegra/2d/tegra_2d_g2fill.c
 create mode 100644 tegra/2d/tegra_2d_g2fill.h
 create mode 100644 tegra/2d/tegra_2d_reg_g2sb.h
 create mode 100644 tegra/2d/tegra_2d_reg_host.h
 create mode 100644 tegra/2d/tegra_2d_sbcopy.c
 create mode 100644 tegra/2d/tegra_2d_sbcopy.h
 create mode 100644 tegra/2d/tegra_2d_surface.c
 create mode 100644 tegra/2d/tegra_2d_surface.h
 create mode 100644 tegra/2d/tegra_2d_util.c
 create mode 100644 tegra/2d/tegra_2d_util.h
 create mode 100644 tegra/Makefile.am
 create mode 100644 tegra/class_ids.h
 create mode 100644 tegra/host1x01_hardware.h
 create mode 100644 tegra/hw_host1x01_uclass.h
 create mode 100644 tegra/libdrm_tegra.pc.in
 create mode 100644 tegra/tegra_2d.h
 create mode 100644 tegra/tegra_drm.c
 create mode 100644 tegra/tegra_drm.h
 create mode 100644 tegra/tegra_drmif.h
 create mode 100644 tests/tegra/2d/Makefile.am
 create mode 100644 tests/tegra/2d/tegra_2d_test.c

-- 
1.7.9.5
