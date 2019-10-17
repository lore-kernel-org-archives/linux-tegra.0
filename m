From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 00/30] pinctrl: use devm_platform_ioremap_resource() to
 simplify code
Date: Thu, 17 Oct 2019 20:26:10 +0800
Message-ID: <20191017122640.22976-1-yuehaibing@huawei.com>
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
To: linus.walleij@linaro.org, manivannan.sadhasivam@linaro.org, afaerber@suse.de, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, jesper.nilsson@axis.com, lars.persson@axis.com, ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, baruch@tkos.co.il
Cc: jonathanh@nvidia.com, geert+renesas@glider.be, narmstrong@baylibre.com, haojian.zhuang@gmail.com, linux-arm-msm@vger.kernel.org, agross@kernel.org, YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, vz@mleia.com, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, wens@csie.org, thierry.reding@gmail.com, daniel@zonque.org, linux-tegra@vger.kernel.org, linux-oxnas@groups.io, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (30):
  pinctrl: pxa25x: use devm_platform_ioremap_resource() to simplify code
  pinctrl: pxa27x: use devm_platform_ioremap_resource() to simplify code
  pinctrl: cygnus-mux: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: pic32: use devm_platform_ioremap_resource() to simplify code
  pinctrl: nsp-gpio: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: nsp: use devm_platform_ioremap_resource() to simplify code
  pinctrl: ns2: use devm_platform_ioremap_resource() to simplify code
  pinctrl: bcm281xx: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: sunxi: use devm_platform_ioremap_resource() to simplify code
  pinctrl: tegra: use devm_platform_ioremap_resource() to simplify code
  pinctrl: msm: use devm_platform_ioremap_resource() to simplify code
  pinctrl: spear: use devm_platform_ioremap_resource() to simplify code
  pinctrl: zte: use devm_platform_ioremap_resource() to simplify code
  pinctrl: at91: use devm_platform_ioremap_resource() to simplify code
  pinctrl: oxnas: use devm_platform_ioremap_resource() to simplify code
  pinctrl: pistachio: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: lpc18xx: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: da850-pupd: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: tb10x: use devm_platform_ioremap_resource() to simplify code
  pinctrl: u300: use devm_platform_ioremap_resource() to simplify code
  pinctrl: vt8500: use devm_platform_ioremap_resource() to simplify code
  pinctrl: xway: use devm_platform_ioremap_resource() to simplify code
  pinctrl: rza2: use devm_platform_ioremap_resource() to simplify code
  pinctrl: digicolor: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: coh901: use devm_platform_ioremap_resource() to simplify code
  pinctrl: bm1880: use devm_platform_ioremap_resource() to simplify code
  pinctrl: artpec6: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: actions: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: at91-pio4: use devm_platform_ioremap_resource() to simplify
    code
  pinctrl: iproc: use devm_platform_ioremap_resource() to simplify code

 drivers/pinctrl/actions/pinctrl-owl.c      |  4 +---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c     |  4 +---
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c   |  7 ++-----
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c   |  3 +--
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c      |  6 ++----
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c     |  7 ++-----
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c      |  6 ++----
 drivers/pinctrl/pinctrl-artpec6.c          |  4 +---
 drivers/pinctrl/pinctrl-at91-pio4.c        |  3 +--
 drivers/pinctrl/pinctrl-at91.c             |  4 +---
 drivers/pinctrl/pinctrl-bm1880.c           |  4 +---
 drivers/pinctrl/pinctrl-coh901.c           |  4 +---
 drivers/pinctrl/pinctrl-da850-pupd.c       |  4 +---
 drivers/pinctrl/pinctrl-digicolor.c        |  4 +---
 drivers/pinctrl/pinctrl-lpc18xx.c          |  4 +---
 drivers/pinctrl/pinctrl-oxnas.c            |  4 +---
 drivers/pinctrl/pinctrl-pic32.c            |  4 +---
 drivers/pinctrl/pinctrl-pistachio.c        |  4 +---
 drivers/pinctrl/pinctrl-rza2.c             |  4 +---
 drivers/pinctrl/pinctrl-tb10x.c            |  4 +---
 drivers/pinctrl/pinctrl-u300.c             |  4 +---
 drivers/pinctrl/pinctrl-xway.c             |  4 +---
 drivers/pinctrl/pxa/pinctrl-pxa25x.c       | 13 ++++---------
 drivers/pinctrl/pxa/pinctrl-pxa27x.c       | 13 ++++---------
 drivers/pinctrl/qcom/pinctrl-msm.c         |  3 +--
 drivers/pinctrl/spear/pinctrl-plgpio.c     |  4 +---
 drivers/pinctrl/spear/pinctrl-spear.c      |  4 +---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c      |  4 +---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c |  4 +---
 drivers/pinctrl/tegra/pinctrl-tegra.c      |  3 +--
 drivers/pinctrl/vt8500/pinctrl-wmt.c       |  4 +---
 drivers/pinctrl/zte/pinctrl-zx.c           |  4 +---
 32 files changed, 42 insertions(+), 110 deletions(-)

-- 
2.7.4
