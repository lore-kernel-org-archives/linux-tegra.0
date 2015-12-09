From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/6] drivers/dma: drop modular code from non modular drivers
Date: Wed, 9 Dec 2015 18:21:56 -0500
Message-ID: <1449703322-17762-1-git-send-email-paul.gortmaker@windriver.com>
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
To: linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Vinod Koul <vinod.koul@intel.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
List-Id: linux-tegra@vger.kernel.org

This series of commits is a slice of a larger project to ensure
people don't have dead code for module removal in non-modular
drivers.  Overall there is roughly 5k lines of dead code in the
kernel due to this.

There is a quasi-separate theme, in that some of the drivers were
allowing an unbind implicitly since it is enabled by default.  But
for core DMA infrastructure drivers, this doesn't seem useful -- so
we also disable that here which allows us to delete any ".remove"
functions from the drivers that would otherwise be called during the
(impossible to trigger) module removal.

Since ARM covers these files the best of all architectures, each
file was build tested for allmodconfig on ARM, which at the same
time confirms that the files are not built with "CC [M]" -- hence
genuinely non-modular.

My testing and the larger patch series in general has been done
against the latest linux-next tree.

Paul.
---

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vinod Koul <vinod.koul@intel.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org


Paul Gortmaker (6):
  drivers/dma: make edma.c explicitly non-modular
  drivers/dma: make mmp_pdma.c explicitly non-modular
  drivers/dma: make mmp_tdma.c explicitly non-modular
  drivers/dma: make pxa_dma.c explicitly non-modular
  drivers/dma: make sh/shdma-*.c explicitly non-modular
  drivers/dma: make tegra20-apb-dma.c explicitly non-modular

 drivers/dma/edma.c            | 37 ++++++-------------------------------
 drivers/dma/mmp_pdma.c        | 21 ++++-----------------
 drivers/dma/mmp_tdma.c        | 22 +++-------------------
 drivers/dma/pxa_dma.c         | 38 +++-----------------------------------
 drivers/dma/sh/shdma-base.c   | 14 ++------------
 drivers/dma/sh/shdma-of.c     | 11 +++--------
 drivers/dma/tegra20-apb-dma.c | 35 ++++-------------------------------
 7 files changed, 25 insertions(+), 153 deletions(-)

-- 
2.6.1


Paul Gortmaker (6):
  drivers/dma: make edma.c explicitly non-modular
  drivers/dma: make mmp_pdma.c explicitly non-modular
  drivers/dma: make mmp_tdma.c explicitly non-modular
  drivers/dma: make pxa_dma.c explicitly non-modular
  drivers/dma: make sh/shdma-*.c explicitly non-modular
  drivers/dma: make tegra20-apb-dma.c explicitly non-modular

 drivers/dma/edma.c            | 37 ++++++-------------------------------
 drivers/dma/mmp_pdma.c        | 21 ++++-----------------
 drivers/dma/mmp_tdma.c        | 22 +++-------------------
 drivers/dma/pxa_dma.c         | 38 +++-----------------------------------
 drivers/dma/sh/shdma-base.c   | 14 ++------------
 drivers/dma/sh/shdma-of.c     | 11 +++--------
 drivers/dma/tegra20-apb-dma.c | 35 ++++-------------------------------
 7 files changed, 25 insertions(+), 153 deletions(-)

-- 
2.6.1
