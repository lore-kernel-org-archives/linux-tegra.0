From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] PCI: Make the struct pci_dev * argument of
 pci_fixup_irqs const.
Date: Sat, 11 Jun 2011 16:01:19 -0700 (PDT)
Message-ID: <20110611.160119.176399204911265689.davem@davemloft.net>
References: <20110610143021.GA26043@linux-mips.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20110610143021.GA26043@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ralf@linux-mips.org
Cc: jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, avorontsov@mvista.com, cmetcalf@tilera.com, ccross@android.com, eric.y.miao@gmail.com, konkers@android.com, gxt@mprc.pku.edu.cn, hpa@zytor.com, kaloz@openwrt.org, mingo@redhat.com, ink@jurassic.park.msu.ru, khc@pm.waw.pl, kernel@wantstofly.org, mattst88@gmail.com, nico@fluxnic.net, olof@lixom.net, lethal@linux-sh.org, rth@twiddle.net, linux@arm.linux.org.uk, tglx@linutronix.de, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, linux-tegra@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Ralf Baechle <ralf@linux-mips.org>
Date: Fri, 10 Jun 2011 15:30:21 +0100

> Aside of the usual motivation for constification,  this function has a
> history of being abused a hook for interrupt and other fixups so I turned
> this function const ages ago in the MIPS code but it should be done
> treewide.
> 
> Due to function pointer passing in varous places a few other functions
> had to be constified as well.
> 
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

Acked-by: David S. Miller <davem@davemloft.net>
