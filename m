From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 06/11] media: tegra: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:06 +0200
Message-ID: <20200515145311.1580134-7-thierry.reding@gmail.com>
References: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200515145311.1580134-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-media

for you to fetch changes up to ba8f6682bcb3312645c6cb77499ceaa66cc950a6:

  media: tegra-video: Do not enable COMPILE_TEST (2020-05-12 23:09:33 +0200)

Thanks,
Thierry

----------------------------------------------------------------
media: tegra: Changes for v5.8-rc1

This contains a V4L2 video capture driver for Tegra210.

----------------------------------------------------------------
Dmitry Osipenko (1):
      dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30

Joseph Lo (1):
      dt-bindings: memory: tegra: Add external memory controller binding for Tegra210

Lukas Bulwahn (1):
      MAINTAINERS: correct path in TEGRA VIDEO DRIVER

Samuel Zou (1):
      media: tegra-video: Make tegra210_video_formats static

Sowjanya Komatineni (5):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      dt-bindings: clock: tegra: Remove PMC clock IDs
      dt-bindings: tegra: Add VI and CSI bindings
      media: tegra-video: Add Tegra210 Video input driver
      MAINTAINERS: Add Tegra Video driver section

Thierry Reding (3):
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C
      Merge branch 'for-5.8/dt-bindings' into for-5.8/media
      media: tegra-video: Do not enable COMPILE_TEST

 .../bindings/cpufreq/nvidia,tegra20-cpufreq.txt    |   56 +
 .../display/tegra/nvidia,tegra20-host1x.txt        |   73 +-
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |    6 +
 .../memory-controllers/nvidia,tegra210-emc.yaml    |   82 ++
 MAINTAINERS                                        |   10 +
 drivers/staging/media/Kconfig                      |    2 +
 drivers/staging/media/Makefile                     |    1 +
 drivers/staging/media/tegra-video/Kconfig          |   12 +
 drivers/staging/media/tegra-video/Makefile         |    8 +
 drivers/staging/media/tegra-video/TODO             |   11 +
 drivers/staging/media/tegra-video/csi.c            |  539 ++++++++++
 drivers/staging/media/tegra-video/csi.h            |  147 +++
 drivers/staging/media/tegra-video/tegra210.c       |  978 ++++++++++++++++++
 drivers/staging/media/tegra-video/vi.c             | 1074 ++++++++++++++++++++
 drivers/staging/media/tegra-video/vi.h             |  257 +++++
 drivers/staging/media/tegra-video/video.c          |  155 +++
 drivers/staging/media/tegra-video/video.h          |   29 +
 include/dt-bindings/clock/tegra114-car.h           |   14 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   14 +-
 include/dt-bindings/clock/tegra20-car.h            |    2 +-
 include/dt-bindings/clock/tegra210-car.h           |   16 +-
 include/dt-bindings/clock/tegra30-car.h            |   14 +-
 22 files changed, 3457 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
 create mode 100644 drivers/staging/media/tegra-video/Kconfig
 create mode 100644 drivers/staging/media/tegra-video/Makefile
 create mode 100644 drivers/staging/media/tegra-video/TODO
 create mode 100644 drivers/staging/media/tegra-video/csi.c
 create mode 100644 drivers/staging/media/tegra-video/csi.h
 create mode 100644 drivers/staging/media/tegra-video/tegra210.c
 create mode 100644 drivers/staging/media/tegra-video/vi.c
 create mode 100644 drivers/staging/media/tegra-video/vi.h
 create mode 100644 drivers/staging/media/tegra-video/video.c
 create mode 100644 drivers/staging/media/tegra-video/video.h
