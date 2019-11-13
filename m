From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 0/4] i2c: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:22:31 +0200
Message-ID: <20191113092235.30440-1-peter.ujfalusi@ti.com>
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
To: ludovic.desroches@microchip.com, agross@kernel.org, wsa+renesas@sang-engineering.com, ldewangan@nvidia.com
Cc: alexandre.belloni@bootlin.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vkoul@kernel.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, digetx@gmail.com, bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I'm going through the tree to remove dma_request_slave_channel_reason() as it
is just:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Regards,
Peter
---
Peter Ujfalusi (4):
  i2c: at91: Use dma_request_chan() directly for channel request
  i2c: qup: Use dma_request_chan() directly for channel request
  i2c: sh_mobile: Use dma_request_chan() directly for channel request
  i2c: tegra: Use dma_request_chan() directly for channel request

 drivers/i2c/busses/i2c-at91-master.c | 4 ++--
 drivers/i2c/busses/i2c-qup.c         | 4 ++--
 drivers/i2c/busses/i2c-sh_mobile.c   | 2 +-
 drivers/i2c/busses/i2c-tegra.c       | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
