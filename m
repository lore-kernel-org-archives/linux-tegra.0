From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 5/9] i2c: tegra: Rename I2C_PIO_MODE_MAX_LEN to
 I2C_PIO_MODE_PREFERRED_LEN
Date: Tue, 7 Jan 2020 12:39:08 +0000
Message-ID: <524a6623612e42638c198e64ba7afb8c@HQMAIL105.nvidia.com>
References: <20200106010423.5890-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106010423.5890-6-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>, Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 06 Jan 2020 04:04:19 +0300, Dmitry Osipenko wrote:
> DMA is preferred for a larger transfers, while PIO is preferred for a
> smaller transfers to avoid unnecessary DMA overhead. There is no strict
> size limitations for the PIO-mode transfers, so let's rename the constant
> for clarity.
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Tested-by: Thierry Reding <treding@nvidia.com>
