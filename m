From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/4] Update TPS65910 to boot using devicetree
Date: Tue, 17 Apr 2012 18:00:25 -0700
Message-ID: <1334710829-22777-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch set updates the tps65910 driver to boot using devicetree.

One thing that is unfavorable is the addition of the use_dt_for_init_data
flag. I added this as I wanted to split the parsing of the of nodes between
the tps65910-regulator code and the main tps65910 code. This split was to
maintain the list of regulator names solely inside the tps65910-regulator
code as it already was.

Rhyland Klein (4):
  regulator: tps65910: update type for regmap
  regulator: tps65910: Add device tree bindings
  mfd: tps65910: Add device-tree support
  ARM: Tegra: Add support for TPS65910 PMIC

 Documentation/devicetree/bindings/mfd/tps65910.txt |  132 ++++++++++++++++++++
 arch/arm/boot/dts/tegra-cardhu.dts                 |   92 ++++++++++++++
 drivers/gpio/gpio-tps65910.c                       |   39 ++++++-
 drivers/mfd/tps65910-irq.c                         |   21 +++-
 drivers/mfd/tps65910.c                             |   78 ++++++++++++-
 drivers/regulator/tps65910-regulator.c             |   86 +++++++++++++-
 include/linux/mfd/tps65910.h                       |    3 +-
 7 files changed, 439 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/tps65910.txt
