From: Jisheng Zhang <jszhang@marvell.com>
Subject: [RFC PATCH 0/3] PCI: generate proper configuration access cycles
Date: Mon, 26 Oct 2015 19:02:11 +0800
Message-ID: <1445857334-6936-1-git-send-email-jszhang@marvell.com>
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
To: bhelgaas@google.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, gnurou@gmail.com, tinamdar@apm.com, rjui@broadcom.com, sbranden@broadcom.com, linux@arm.linux.org.uk
Cc: Jisheng Zhang <jszhang@marvell.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Inspired by Russell King's patch[1], I found some pci hosts also have the
same issue of "reading 32-bits from the command register, modifying the
command register, and then writing it back has the effect of clearing
any status bits that were indicating at that time" as pointed out by
Russell. Fix them by using the pci_generic_config_write.

Another problem is do we need to use proper readb/readw for config read?

Jisheng Zhang (3):
  PCI: iproc: generate proper configuration access cycles
  PCI: tegra: generate proper configuration access cycles
  PCI: xgene: generate proper configuration access cycles

 drivers/pci/host/pci-tegra.c  | 2 +-
 drivers/pci/host/pci-xgene.c  | 2 +-
 drivers/pci/host/pcie-iproc.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.6.2
