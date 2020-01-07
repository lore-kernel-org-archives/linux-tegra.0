From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 6/9] i2c: tegra: Use relaxed versions of readl/writel
Date: Tue, 7 Jan 2020 12:39:11 +0000
Message-ID: <41ab5d2ace574878a8cb3ec35dbd0a30@HQMAIL105.nvidia.com>
References: <20200106010423.5890-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:20 +0300, Dmitry Osipenko wrote:
> There is nothing to synchronize in regards to memory accesses for PIO
> transfers and for DMA transfers the DMA API takes care of the syncing.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
