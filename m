From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 0/3] tty: serial: Use dma_request_chan() directly for channel request
Date: Wed, 13 Nov 2019 11:46:15 +0200
Message-ID: <20191113094618.1725-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, linux@armlinux.org.uk, agross@kernel.org, bjorn.andersson@linaro.org, ldewangan@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: vkoul@kernel.org, jslaby@suse.com, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

I'm going through the tree to remove dma_request_slave_channel_reason() as it
is just:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Regards,
Peter
---
Peter Ujfalusi (3):
  tty: serial: amba-pl011: Use dma_request_chan() directly for channel
    request
  tty: serial: msm_serial: Use dma_request_chan() directly for channel
    request
  tty: serial: tegra: Use dma_request_chan() directly for channel
    request

 drivers/tty/serial/amba-pl011.c   | 2 +-
 drivers/tty/serial/msm_serial.c   | 4 ++--
 drivers/tty/serial/serial-tegra.c | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
