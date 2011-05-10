From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 0/2] Tegra Harmony: Device Tree Initial Steps
Date: Tue, 10 May 2011 13:14:06 -0700
Message-ID: <20110510201108.22693.50319.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

These patches are the first steps towards getting the board specific devices on the Tegra
Harmony board to be discovered and initialized using only a device tree -
rather than platform specific code. In particular, this patch set is getting ready to
initialize i2c devices based solely on a device tree.

This patch series is presented at this time only for review and comments.

---

John Bonesio (2):
      ARM: Tegra: Device Tree Support: Update how sdhci devices are initialized
      ARM: Tegra: Device Tree Support: Add i2c devices


 arch/arm/boot/dts/tegra250.dtsi |   33 +++++++++++
 arch/arm/mach-tegra/Makefile    |    1 
 arch/arm/mach-tegra/board-dt.c  |  120 ++++++++++++++++-----------------------
 drivers/i2c/busses/i2c-tegra.c  |    4 +
 4 files changed, 87 insertions(+), 71 deletions(-)

-- 
- John
