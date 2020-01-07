From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 9/9] i2c: tegra: Check DMA completion status in
 addition to left time
Date: Tue, 7 Jan 2020 12:39:22 +0000
Message-ID: <72761d8598d248fbab872ad844b14aab@HQMAIL105.nvidia.com>
References: <20200106010423.5890-10-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-10-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:23 +0300, Dmitry Osipenko wrote:
> It is more robust to check completion status in addition to the left time
> in a case of DMA transfer because transfer's completion happens in two
> phases [one is ISR, other is tasklet] and thus it is possible that DMA is
> completed while I2C completion awaiting times out because of the deferred
> notification done by the DMA driver. The DMA completion status becomes
> 100% actual after DMA synchronization. This fixes spurious DMA timeouts
> when system is under load.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Thierry Reding <treding@nvidia.com>
