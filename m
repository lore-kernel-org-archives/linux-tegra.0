From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [GIT PULL 1/5] ARM: tegra: DT-related fixes needed by the USB tree
Date: Fri, 14 Jun 2013 10:37:14 -0600
Message-ID: <1371227838-18764-2-git-send-email-swarren@wwwdotorg.org>
References: <1371227838-18764-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371227838-18764-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra USB bindings were in bad shape. The patches in this branch
fix the binding definitions, and make all the necessary additions to
the DT files. Stale nodes/properties will be removed early in 3.12
once the USB driver has been updated for the new binding.

These changes are needed in both the USB tree, to allow the driver to
be updated to handle them, and the Tegra tree, so that various tree-
wide DT changes (e.g. conversion of IRQ/GPIO/clock constants to defines)
can be applied on top of them.

This branch is included in later pull request tegra-for-3.11-dt.

----------------------------------------------------------------

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

  Linux 3.10-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.11-deps-for-usb

for you to fetch changes up to 4c94c8b5b3cc38b0d0b1ec79642f5710e19a3e01:

  ARM: tegra: update device trees for USB binding rework

----------------------------------------------------------------

Venu Byravarasu (3):
      ARM: tegra: finalize USB EHCI and PHY bindings
      ARM: tegra: modify ULPI reset GPIO properties
      ARM: tegra: update device trees for USB binding rework

 .../bindings/usb/nvidia,tegra20-ehci.txt        | 27 ++---------
 .../bindings/usb/nvidia,tegra20-usb-phy.txt     | 41 ++++++++++++++--
 arch/arm/boot/dts/tegra20-colibri-512.dtsi      |  6 ++-
 arch/arm/boot/dts/tegra20-harmony.dts           | 15 ++++--
 arch/arm/boot/dts/tegra20-iris-512.dts          |  9 +++-
 arch/arm/boot/dts/tegra20-paz00.dts             | 15 ++++--
 arch/arm/boot/dts/tegra20-seaboard.dts          | 26 +++++++++--
 arch/arm/boot/dts/tegra20-tamonten.dtsi         |  4 ++
 arch/arm/boot/dts/tegra20-trimslice.dts         | 25 ++++++++--
 arch/arm/boot/dts/tegra20-ventana.dts           | 15 ++++--
 arch/arm/boot/dts/tegra20-whistler.dts          | 28 +++++++++++
 arch/arm/boot/dts/tegra20.dtsi                  | 49 +++++++++++++++-----
 12 files changed, 206 insertions(+), 54 deletions(-)
