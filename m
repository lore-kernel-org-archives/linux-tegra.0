From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Please pull tegra cleanups for 3.2
Date: Thu, 13 Oct 2011 17:16:17 +0200
Message-ID: <201110131716.18358.arnd@arndb.de>
References: <CAOesGMjVAJK2ArOdpYNmKa11vqCfppi8Ofc0qGn4WxuMxLvd_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOesGMjVAJK2ArOdpYNmKa11vqCfppi8Ofc0qGn4WxuMxLvd_Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>
Cc: linux-tegra@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On Thursday 13 October 2011, Olof Johansson wrote:
> Hi Arnd,
> 
> Please pull the below branch of cleanups for the 3.2 merge window.
> They have been included in linux-next for a couple of days already.

I saw Russell had a comment on the macro name should be addressed.
I've put your series plus an additional commit to fix this up
into the tegra/cleanup branch. When you ack this patch, I'll include
this branch into next/cleanup and the for-next branch.

Thanks,

	Arnd

---

ARM: tegra renamed __IOVADDR to IOMEM
    
This matches how other platforms name the same macro, as pointed
out by Russell King.
    
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/arch/arm/mach-tegra/include/mach/io.h b/arch/arm/mach-tegra/include/mach/io.h
index 971be4b..35a011f 100644
--- a/arch/arm/mach-tegra/include/mach/io.h
+++ b/arch/arm/mach-tegra/include/mach/io.h
@@ -34,25 +34,25 @@
  */
 
 #ifdef __ASSEMBLY__
-#define __IOVADDR(x)   (x)
+#define IOMEM(x)       (x)
 #else
-#define __IOVADDR(x)   ((void __force __iomem *)(x))
+#define IOMEM(x)       ((void __force __iomem *)(x))
 #endif
 
 #define IO_IRAM_PHYS   0x40000000
-#define IO_IRAM_VIRT   __IOVADDR(0xFE400000)
+#define IO_IRAM_VIRT   IOMEM(0xFE400000)
 #define IO_IRAM_SIZE   SZ_256K
 
 #define IO_CPU_PHYS     0x50040000
-#define IO_CPU_VIRT     __IOVADDR(0xFE000000)
+#define IO_CPU_VIRT     IOMEM(0xFE000000)
 #define IO_CPU_SIZE    SZ_16K
 
 #define IO_PPSB_PHYS   0x60000000
-#define IO_PPSB_VIRT   __IOVADDR(0xFE200000)
+#define IO_PPSB_VIRT   IOMEM(0xFE200000)
 #define IO_PPSB_SIZE   SZ_1M
 
 #define IO_APB_PHYS    0x70000000
-#define IO_APB_VIRT    __IOVADDR(0xFE300000)
+#define IO_APB_VIRT    IOMEM(0xFE300000)
 #define IO_APB_SIZE    SZ_1M
 
 #define IO_TO_VIRT_BETWEEN(p, st, sz)  ((p) >= (st) && (p) < ((st) + (sz)))
