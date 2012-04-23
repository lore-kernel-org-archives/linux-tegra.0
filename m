From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/4] ARM: tegra: enable ALS and proximity sensors
Date: Mon, 23 Apr 2012 17:41:32 +0530
Message-ID: <1335183097-21104-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra based platform are using the Intersil's ALS and proximity sensor
ISL29018 and ISL29028.
Enabling this sensor in Tegra based platform through device tree. Following
changes are done:
- Add vendor prefix for Intersil Corporation in document.
- Change the vendor prefix in driver to reflect as per document.
- Enable the instance of the sensor in Tegra platform ventana, seaboard and
  cardhu.

Changes from V1:
- Change the vendor prefix for Intersil to "isil".
- Added irq numbers when enabling driver in dts file.

Laxman Dewangan (4):
  devicetree: Document Intersil Corporation vendor prefix
  staging: iio: light: of: Fix vendor prefix of isl29018/isl29028
  ARM: dt: tegra: enable als and proximity sensor
  ARM: tegra: defconfig: add ISL29028

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 arch/arm/boot/dts/tegra-cardhu.dts                 |    8 ++++++++
 arch/arm/boot/dts/tegra-seaboard.dts               |    8 ++++++++
 arch/arm/boot/dts/tegra-ventana.dts                |    8 ++++++++
 arch/arm/configs/tegra_defconfig                   |    1 +
 drivers/staging/iio/light/isl29018.c               |    2 +-
 drivers/staging/iio/light/isl29028.c               |    2 +-
 7 files changed, 28 insertions(+), 2 deletions(-)
