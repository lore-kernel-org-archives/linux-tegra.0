From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/2] Make Tegra cpuidle driver PSCI compatible
Date: Fri,  8 May 2015 07:55:25 +0200
Message-ID: <cover.1431064527.git.jan.kiszka@siemens.com>
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
To: Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Two small patches so that we can keep the Tegra cpuidle driver enabled
even in the presence of PSCI which takes over some duties (U-Boot is
about to gain such support for Tegra124).

Jan

Jan Kiszka (2):
  ARM: Availability of psci_smp_available depends on CONFIG_SMP
  ARM: tegra: Disable cpuidle driver if PSCI is present

 arch/arm/include/asm/psci.h | 6 +++++-
 arch/arm/mach-tegra/Kconfig | 1 +
 arch/arm/mach-tegra/tegra.c | 4 +++-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.1.4
