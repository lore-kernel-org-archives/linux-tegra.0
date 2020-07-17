From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 1/7] dt-bindings: Changes for v5.9-rc1
Date: Fri, 17 Jul 2020 18:12:54 +0200
Message-ID: <20200717161300.1661002-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.9-dt-bindings

for you to fetch changes up to 9580a3532eee67d9d19de19f62c245655eabaca3:

  dt-bindings: fuse: tegra: Add missing compatible strings (2020-07-17 16:14:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.9-rc1

This adds compatible strings for some new devices as well as updates and
fixes existing bindings.

----------------------------------------------------------------
Dmitry Osipenko (3):
      dt-bindings: Add vendor prefix for Acer Inc.
      dt-bindings: ARM: tegra: Add Acer Iconia Tab A500
      dt-bindings: ARM: tegra: Add ASUS Google Nexus 7

Sowjanya Komatineni (1):
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and power-domains

Thierry Reding (3):
      dt-bindings: tegra: Document Jetson Xavier NX (and devkit)
      dt-bindings: Add documentation for GV11B GPU
      dt-bindings: fuse: tegra: Add missing compatible strings

 Documentation/devicetree/bindings/arm/tegra.yaml   | 18 ++++++++++++++++
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |  5 +++--
 .../devicetree/bindings/gpu/nvidia,gk20a.txt       | 25 ++++++++++++++++++++++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt | 19 ++++++++++------
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 ++
 5 files changed, 61 insertions(+), 8 deletions(-)
