From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 0/4] i2c: Use dma_request_chan() directly for channel
 request
Date: Thu, 14 Nov 2019 10:04:04 +0530
Message-ID: <20191114043404.GG952516@vkoul-mobl>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191113092235.30440-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: ludovic.desroches@microchip.com, agross@kernel.org, wsa+renesas@sang-engineering.com, ldewangan@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, digetx@gmail.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, bjorn.andersson@linaro.org
List-Id: linux-tegra@vger.kernel.org

On 13-11-19, 11:22, Peter Ujfalusi wrote:
> Hi,
> 
> I'm going through the tree to remove dma_request_slave_channel_reason() as it
> is just:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
