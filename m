From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 2/5] ARM: tegra: create headers for clock bindings
Date: Fri, 14 Jun 2013 10:37:15 -0600
Message-ID: <1371227838-18764-3-git-send-email-swarren@wwwdotorg.org>
References: <1371227838-18764-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371227838-18764-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

(Note that I don't believe that the drivers/clk changes that rely on this
branch were actually sent for this cycle, so this branch was probably
never pulled into the clk tree.)

This branch creates header files that define the clock IDs used by
Tegra's DT clock binding, and update the DT binding documentation to
refer to those files.

These changes are needed in both the Tegra tree, in order to update DT
files to use the new headers, and the clock tree, in order to update the
clock drivers to use the headers rather than defining their own enum for
the same purpose.

This branch is included in later pull request tegra-for-3.11-dt.

----------------------------------------------------------------

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

  Linux 3.10-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.11-deps-for-clk

for you to fetch changes up to 992bb598f690542a2f539fd12a42b960b7692025:

  ARM: tegra114: create a DT header defining CLK IDs

----------------------------------------------------------------

Hiroshi Doyu (3):
      ARM: tegra20: create a DT header defining CLK IDs
      ARM: tegra30: create a DT header defining CLK IDs
      ARM: tegra114: create a DT header defining CLK IDs

 .../bindings/clock/nvidia,tegra114-car.txt      | 252 +-------------
 .../bindings/clock/nvidia,tegra20-car.txt       | 154 +--------
 .../bindings/clock/nvidia,tegra30-car.txt       | 211 +-----------
 include/dt-bindings/clock/tegra114-car.h        | 342 +++++++++++++++++++
 include/dt-bindings/clock/tegra20-car.h         | 158 +++++++++
 include/dt-bindings/clock/tegra30-car.h         | 265 ++++++++++++++
 6 files changed, 777 insertions(+), 605 deletions(-)
 create mode 100644 include/dt-bindings/clock/tegra114-car.h
 create mode 100644 include/dt-bindings/clock/tegra20-car.h
 create mode 100644 include/dt-bindings/clock/tegra30-car.h
