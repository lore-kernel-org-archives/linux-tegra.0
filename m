From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: Tegra freezes when touching ungated MMIO regions
Date: Thu, 1 Dec 2016 15:15:49 +0100
Message-ID: <1f501c0b-0a6a-39b4-208a-509a606ff3fe@oth-regensburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <jailhouse-dev+bncBAABBFXBQDBAKGQEMLV5XYI@googlegroups.com>
Sender: jailhouse-dev@googlegroups.com
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
To: linux-tegra@vger.kernel.org
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>, =?UTF-8?Q?Andreas_K=c3=b6lbl?= <andreas.koelbl@st.oth-regensburg.de>
List-Id: linux-tegra@vger.kernel.org

Hi,

I observed that touching MMIO regions of Tegra devices with its
corresponding clock gate deactivated immediately freezes the whole
system. No kernel panic, nothing.

I tested this behavior with a small kernel module, find it attached. A
few seconds after loading this module, the whole device freezes. Tested
this on a TK1 and TX1.

What is the actual expected behavior on ARM(64) when touching ungated
MMIO regions? Is it specified somewhere?

Why do I actually want to do that?
We're working on the Jailhouse hypervisor that partitions hardware to
isolated partitions, called cells. Devices (e.g. MMIO regions) are
assigned to those cells. A cell might do whatever it wants within its
scope. The hypervisor traps on access violations and will stop that cell.

Touching ungated MMIO regions isn't a violation, but it will hang up the
whole system.

Best
  Ralf

---
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <asm/io.h>

MODULE_DESCRIPTION("foobar");
MODULE_LICENSE("GPL");

static int __init mod_init(void)
{
        /* try 0x70006200 for UARTD
         * or  0x7000c000 for I2C-0.
	   Make sure those devices are 'disabled' in your DT.
	 */
        unsigned long phys = 0x70006200;

        volatile unsigned int *mmio = ioremap(phys, 0x40);

        *mmio = 0xdeadbeef;

        iounmap(mmio);

        return 0;
}

static void __exit mod_exit(void)
{
}

module_init(mod_init);
module_exit(mod_exit);
