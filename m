From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 0/4] Move CEC drivers and menu to be out of MEDIA_SUPPORT
Date: Wed, 15 Apr 2020 11:49:23 +0200
Message-ID: <cover.1586944045.git.mchehab+huawei@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Ettore Chimenti <ek5.chimenti@gmail.com>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-tegra@vger.kernel.org

The CEC_CORE doesn't depend on MEDIA_SUPPORT. So, it doesn't make
much sense to keep it under its menu.

This series move it to be just after RC support. As a side effect, now
dependencies like PCI and USB are now selected, making easier to
enable CEC drivers.

Mauro Carvalho Chehab (4):
  media: cec: move the core to a separate directory
  media: place CEC menu before MEDIA_SUPPORT
  media: move CEC platform drivers to a separate directory
  media: move CEC USB drivers to a separate directory

 drivers/media/Kconfig                         |  30 +----
 drivers/media/cec/Kconfig                     |  25 ++++
 drivers/media/cec/Makefile                    |  16 +--
 drivers/media/cec/core/Makefile               |  16 +++
 drivers/media/cec/{ => core}/cec-adap.c       |   0
 drivers/media/cec/{ => core}/cec-api.c        |   0
 drivers/media/cec/{ => core}/cec-core.c       |   0
 drivers/media/cec/{ => core}/cec-notifier.c   |   0
 .../media/cec/{ => core}/cec-pin-error-inj.c  |   0
 drivers/media/cec/{ => core}/cec-pin-priv.h   |   0
 drivers/media/cec/{ => core}/cec-pin.c        |   0
 drivers/media/cec/{ => core}/cec-priv.h       |   0
 drivers/media/cec/platform/Kconfig            | 121 ++++++++++++++++++
 drivers/media/cec/platform/Makefile           |  11 ++
 .../{ => cec}/platform/cec-gpio/Makefile      |   0
 .../{ => cec}/platform/cec-gpio/cec-gpio.c    |   0
 .../s5p-cec => cec/platform/s5p}/Makefile     |   0
 .../platform/s5p}/exynos_hdmi_cec.h           |   0
 .../platform/s5p}/exynos_hdmi_cecctrl.c       |   0
 .../s5p-cec => cec/platform/s5p}/regs-cec.h   |   0
 .../s5p-cec => cec/platform/s5p}/s5p_cec.c    |   0
 .../s5p-cec => cec/platform/s5p}/s5p_cec.h    |   0
 .../seco-cec => cec/platform/seco}/Makefile   |   0
 .../seco-cec => cec/platform/seco}/seco-cec.c |   0
 .../seco-cec => cec/platform/seco}/seco-cec.h |   0
 .../sti/cec => cec/platform/sti}/Makefile     |   0
 .../sti/cec => cec/platform/sti}/stih-cec.c   |   0
 .../tegra-cec => cec/platform/tegra}/Makefile |   0
 .../platform/tegra}/tegra_cec.c               |   0
 .../platform/tegra}/tegra_cec.h               |   0
 drivers/media/cec/usb/Kconfig                 |   6 +
 drivers/media/cec/usb/Makefile                |   6 +
 .../pulse8-cec => cec/usb/pulse8}/Kconfig     |   3 +-
 .../pulse8-cec => cec/usb/pulse8}/Makefile    |   0
 .../usb/pulse8}/pulse8-cec.c                  |   0
 .../usb/rainshadow}/Kconfig                   |   3 +-
 .../usb/rainshadow}/Makefile                  |   0
 .../usb/rainshadow}/rainshadow-cec.c          |   0
 drivers/media/platform/Kconfig                | 121 ------------------
 drivers/media/platform/Makefile               |   8 --
 drivers/media/usb/Kconfig                     |   6 -
 drivers/media/usb/Makefile                    |   2 -
 42 files changed, 192 insertions(+), 182 deletions(-)
 create mode 100644 drivers/media/cec/core/Makefile
 rename drivers/media/cec/{ => core}/cec-adap.c (100%)
 rename drivers/media/cec/{ => core}/cec-api.c (100%)
 rename drivers/media/cec/{ => core}/cec-core.c (100%)
 rename drivers/media/cec/{ => core}/cec-notifier.c (100%)
 rename drivers/media/cec/{ => core}/cec-pin-error-inj.c (100%)
 rename drivers/media/cec/{ => core}/cec-pin-priv.h (100%)
 rename drivers/media/cec/{ => core}/cec-pin.c (100%)
 rename drivers/media/cec/{ => core}/cec-priv.h (100%)
 create mode 100644 drivers/media/cec/platform/Kconfig
 create mode 100644 drivers/media/cec/platform/Makefile
 rename drivers/media/{ => cec}/platform/cec-gpio/Makefile (100%)
 rename drivers/media/{ => cec}/platform/cec-gpio/cec-gpio.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/Makefile (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cec.h (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/exynos_hdmi_cecctrl.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/regs-cec.h (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.c (100%)
 rename drivers/media/{platform/s5p-cec => cec/platform/s5p}/s5p_cec.h (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/Makefile (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.c (100%)
 rename drivers/media/{platform/seco-cec => cec/platform/seco}/seco-cec.h (100%)
 rename drivers/media/{platform/sti/cec => cec/platform/sti}/Makefile (100%)
 rename drivers/media/{platform/sti/cec => cec/platform/sti}/stih-cec.c (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/Makefile (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.c (100%)
 rename drivers/media/{platform/tegra-cec => cec/platform/tegra}/tegra_cec.h (100%)
 create mode 100644 drivers/media/cec/usb/Kconfig
 create mode 100644 drivers/media/cec/usb/Makefile
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Kconfig (91%)
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/Makefile (100%)
 rename drivers/media/{usb/pulse8-cec => cec/usb/pulse8}/pulse8-cec.c (100%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Kconfig (92%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/Makefile (100%)
 rename drivers/media/{usb/rainshadow-cec => cec/usb/rainshadow}/rainshadow-cec.c (100%)

-- 
2.25.2
