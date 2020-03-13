From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 10/10] phy: tegra: Changes for v5.7-rc1
Date: Fri, 13 Mar 2020 17:58:48 +0100
Message-ID: <20200313165848.2915133-10-thierry.reding@gmail.com>
References: <20200313165848.2915133-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200313165848.2915133-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-phy

for you to fetch changes up to 04c929223d1db6ad4ba8e4c23122e1052f670c2e:

  phy: tegra: xusb: Don't warn on probe defer (2020-03-13 09:17:50 +0100)

This is a dependency for the USB changes that are also part of this
series of pull requests, so it was deemed easier to take this all
through the ARM SoC tree. The patches have all been acked by Kishon.

Thanks,
Thierry

----------------------------------------------------------------
phy: tegra: Changes for v5.7-rc1

This set of patches adds role switching support for the XUSB pad
controller, which will be used by USB host and device drivers to
switch between peripheral and host modes.

----------------------------------------------------------------
JC Kuo (2):
      phy: tegra: xusb: Protect Tegra186 soc with config
      phy: tegra: xusb: Add Tegra194 support

Jon Hunter (1):
      phy: tegra: xusb: Don't warn on probe defer

Nagarjuna Kristam (5):
      phy: tegra: xusb: Add usb-role-switch support
      phy: tegra: xusb: Add usb-phy support
      phy: tegra: xusb: Add support to get companion USB 3 port
      phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
      phy: tegra: xusb: Add set_mode support for UTMI phy on Tegra186

 drivers/phy/tegra/Kconfig         |   1 +
 drivers/phy/tegra/Makefile        |   1 +
 drivers/phy/tegra/xusb-tegra186.c | 261 +++++++++++++++++++++++++++++---------
 drivers/phy/tegra/xusb-tegra210.c | 131 +++++++++++++++----
 drivers/phy/tegra/xusb.c          | 189 +++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          |  10 ++
 include/linux/phy/tegra/xusb.h    |   2 +
 7 files changed, 511 insertions(+), 84 deletions(-)
