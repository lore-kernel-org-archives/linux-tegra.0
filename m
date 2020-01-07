From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 8/9] i2c: tegra: Always terminate DMA transfer
Date: Tue, 7 Jan 2020 12:39:18 +0000
Message-ID: <da4ee98be8314ca296de364b79958b23@HQMAIL105.nvidia.com>
References: <20200106010423.5890-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:22 +0300, Dmitry Osipenko wrote:
> It is possible that I2C could error out in the middle of DMA transfer and
> in this case DMA channel needs to be reset, otherwise a follow up transfer
> will fail because DMA channel stays blocked.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
