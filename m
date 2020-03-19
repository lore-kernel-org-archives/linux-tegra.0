From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/9] pinctrl: tegra: Support SFIO/GPIO programming
Date: Thu, 19 Mar 2020 13:27:28 +0100
Message-ID: <20200319122737.3063291-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi,

NVIDIA Tegra186 and later have a bit in the pin controller that defines
whether a pin is used in special function (SFIO) mode or in general
purpose (GPIO) mode. On early Tegra SoC generations, this bit was part
of the GPIO controller.

The pin configuration on Tegra186 and later (and partially on Tegra210)
is typically static, so there is little need to reconfigure these pins.
However, there's a special case on Tegra194 where the PCIe CLKREQ and
RST pins for controller 5 may need to be reprogrammed in the kernel,
depending on whether the controller runs in endpoint mode or in root
port mode.

This series of patches establishes the mapping of these two pins to
their GPIO equivalents and implements the code necessary to switch
between SFIO and GPIO modes when the kernel requests or releases the
GPIOs, respectively.

Thierry

Thierry Reding (9):
  gpio: Support GPIO controllers without pin-ranges
  gpio: tegra186: Add support for pin ranges
  gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
  pinctrl: tegra: Fix whitespace issues for improved readability
  pinctrl: tegra: Fix "Scmitt" -> "Schmitt" typo
  pinctrl: tegra: Pass struct tegra_pmx for pin range check
  pinctrl: tegra: Do not add default pin range on Tegra194
  pinctrl: tegra: Renumber the GG.0 and GG.1 pins
  pinctrl: tegra: Add SFIO/GPIO programming on Tegra194

 drivers/gpio/gpio-tegra186.c             | 64 ++++++++++++++++++++++++
 drivers/gpio/gpiolib.c                   |  5 +-
 drivers/pinctrl/tegra/pinctrl-tegra.c    | 52 +++++++++++++++++--
 drivers/pinctrl/tegra/pinctrl-tegra.h    |  5 +-
 drivers/pinctrl/tegra/pinctrl-tegra194.c | 47 +++++++++--------
 5 files changed, 144 insertions(+), 29 deletions(-)

-- 
2.24.1
