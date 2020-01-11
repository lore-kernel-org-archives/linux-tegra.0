From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 1/8] dt-bindings: Changes for v5.6-rc1
Date: Sat, 11 Jan 2020 01:35:46 +0100
Message-ID: <20200111003553.2411874-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.6-dt-bindings

for you to fetch changes up to 720ad00eade9d08aabaf7b130fed1817252badf5:

  dt-bindings: memory: Add Tegra186 memory subsystem (2020-01-09 19:11:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.6-rc1

This contains a conversion of the Tegra124 EMC bindings to json-schema
as well as the addition of the bindings for the memory subsystem found
on Tegra186 and Tegra194.

----------------------------------------------------------------
Thierry Reding (4):
      dt-bindings: memory-controller: Convert Tegra124 EMC to json-schema
      dt-bindings: memory: Add Tegra186 memory client IDs
      dt-bindings: memory: Add Tegra194 memory controller header
      dt-bindings: memory: Add Tegra186 memory subsystem

 .../memory-controllers/nvidia,tegra124-emc.txt     | 374 ---------------
 .../memory-controllers/nvidia,tegra124-emc.yaml    | 528 +++++++++++++++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     | 130 +++++
 include/dt-bindings/memory/tegra186-mc.h           | 139 ++++++
 include/dt-bindings/memory/tegra194-mc.h           | 410 ++++++++++++++++
 5 files changed, 1207 insertions(+), 374 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
 create mode 100644 include/dt-bindings/memory/tegra194-mc.h
