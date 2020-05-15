From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 03/11] dt-bindings: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:03 +0200
Message-ID: <20200515145311.1580134-4-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.8-dt-bindings

for you to fetch changes up to 4e79691d050e6d06ee7fa09002c52dd1ce9ac6e6:

  dt-bindings: i2c: tegra: Document Tegra210 VI I2C (2020-05-12 22:47:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.8-rc1

This adds bindings for the CSI TPG clock on Tegra210, moves various
clocks from the clock and reset controller to the PMC where their
controls really are, adds bindings for the external memory controller
and video capture controller on Tegra210, as well as CPU frequency
scaling on Tegra20 and Tegra30.

----------------------------------------------------------------
Dmitry Osipenko (1):
      dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30

Joseph Lo (1):
      dt-bindings: memory: tegra: Add external memory controller binding for Tegra210

Sowjanya Komatineni (3):
      dt-bindings: clock: tegra: Add clock ID for CSI TPG clock
      dt-bindings: clock: tegra: Remove PMC clock IDs
      dt-bindings: tegra: Add VI and CSI bindings

Thierry Reding (1):
      dt-bindings: i2c: tegra: Document Tegra210 VI I2C

 .../bindings/cpufreq/nvidia,tegra20-cpufreq.txt    | 56 +++++++++++++++
 .../display/tegra/nvidia,tegra20-host1x.txt        | 73 +++++++++++++++----
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt |  6 ++
 .../memory-controllers/nvidia,tegra210-emc.yaml    | 82 ++++++++++++++++++++++
 include/dt-bindings/clock/tegra114-car.h           | 14 ++--
 include/dt-bindings/clock/tegra124-car-common.h    | 14 ++--
 include/dt-bindings/clock/tegra20-car.h            |  2 +-
 include/dt-bindings/clock/tegra210-car.h           | 16 ++---
 include/dt-bindings/clock/tegra30-car.h            | 14 ++--
 9 files changed, 234 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cpufreq/nvidia,tegra20-cpufreq.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
