From: Dave Martin <dave.martin@linaro.org>
Subject: [PATCH] ARM: tegra: Remove redundant change to the CPSR in headsmp.S
Date: Wed,  7 Sep 2011 17:00:53 +0100
Message-ID: <1315411253-17559-1-git-send-email-dave.martin@linaro.org>
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
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, patches@linaro.org
List-Id: linux-tegra@vger.kernel.org

At secondary_startup, the MSR CPSR_cxsf, #0xd3 is not compatible
with Thumb-2 and also unmasks asynchronous aborts (CPSR.A bit
forced to zero -- this is probably unintentional).

Any remotely sane bootloader should be putting each secondary CPU
in the appropriate state _before_ entering the kernel anyway.
Otherwise, disabling interrupts on entry to the kernel isn't going
to fix it.

Therefore this patch just removes the MSR instruction.

Signed-off-by: Dave Martin <dave.martin@linaro.org>
---

I make assumptions about the bootloader in this patch.  If someone with
Tegra knowledge can please comment and/or test, that would be much
appreciated, thanks.

 arch/arm/mach-tegra/headsmp.S |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/headsmp.S
index b5349b2..6ec4790 100644
--- a/arch/arm/mach-tegra/headsmp.S
+++ b/arch/arm/mach-tegra/headsmp.S
@@ -48,7 +48,6 @@ ENTRY(v7_invalidate_l1)
 ENDPROC(v7_invalidate_l1)
 
 ENTRY(tegra_secondary_startup)
-	msr	cpsr_fsxc, #0xd3
         bl      v7_invalidate_l1
 	mrc	p15, 0, r0, c0, c0, 5
         and	r0, r0, #15
-- 
1.7.4.1
