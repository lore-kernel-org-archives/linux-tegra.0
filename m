From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v7 0/5] ARM: support for Trusted Foundations secure monito
Date: Fri, 4 Oct 2013 09:37:10 -0700
Message-ID: <1380904635-18113-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Dave Martin <Dave.Martin@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>
Cc: gnurou@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hopefully final version of this patchset. If I'm not mistaken the last thing
that prevents Stephen from merging it is Russel's Ack. Russel, could you check
it?

Trusted Foundations is an ARM secure monitor that is used by many Tegra-based
retail devices (like SHIELD). Adding support to it allows these devices to boot
on a purely upstream kernel.

Public documentation about Trusted Foundations is scarce, but over the various
versions of this patch it has been established that it does not follow the ARM
SMC convention and also has no connection whatsoever with PSCI. As such, it
requires an implementation of its own and the firmware interface introduced by
Tomasz provides an adequate framework for it.

Changes since v6:
- Improved and simplified header conditionals when TF support is compiled in
  or not as advised by Stephen.

Alexandre Courbot (5):
  ARM: add basic support for Trusted Foundations
  ARM: tegra: add support for Trusted Foundations
  ARM: tegra: split setting of CPU reset handler
  ARM: tegra: set CPU reset handler with firmware op
  ARM: tegra: support Trusted Foundations by default

 .../arm/firmware/tl,trusted-foundations.txt        | 17 +++++
 Documentation/devicetree/bindings/arm/tegra.txt    |  5 ++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 arch/arm/Kconfig                                   |  2 +
 arch/arm/Makefile                                  |  1 +
 arch/arm/configs/tegra_defconfig                   |  1 +
 arch/arm/firmware/Kconfig                          | 28 ++++++++
 arch/arm/firmware/Makefile                         |  1 +
 arch/arm/firmware/trusted_foundations.c            | 77 ++++++++++++++++++++++
 arch/arm/include/asm/trusted_foundations.h         | 64 ++++++++++++++++++
 arch/arm/mach-tegra/Kconfig                        |  1 +
 arch/arm/mach-tegra/common.c                       |  2 +
 arch/arm/mach-tegra/reset.c                        | 40 +++++++----
 13 files changed, 229 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/firmware/tl,trusted-foundations.txt
 create mode 100644 arch/arm/firmware/Kconfig
 create mode 100644 arch/arm/firmware/Makefile
 create mode 100644 arch/arm/firmware/trusted_foundations.c
 create mode 100644 arch/arm/include/asm/trusted_foundations.h

-- 
1.8.4
