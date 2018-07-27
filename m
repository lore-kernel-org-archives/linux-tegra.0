From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] mfd: as3722: disable auto power on when AC OK
Date: Fri, 27 Jul 2018 08:15:44 +0100
Message-ID: <20180727071544.GD4628@dell>
References: <20180703150411.29709-1-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703150411.29709-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 03 Jul 2018, Marcel Ziswiler wrote:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> On ams AS3722, power on when AC OK is enabled by default.
> Making this option as disable by default and enable only
> when platform need this explicitly.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Bibek Basu <bbasu@nvidia.com>
> Tested-by: Bibek Basu <bbasu@nvidia.com>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v2:
> - Document device tree property as suggested by Stefan.
> - Rename SEQ1 to SEQU1 as per datasheet as suggested by Stefan.
> - Drop reference to downstream commit as suggested by Lee.
> 
>  Documentation/devicetree/bindings/mfd/as3722.txt |  2 ++
>  drivers/mfd/as3722.c                             | 12 ++++++++++++
>  include/linux/mfd/as3722.h                       |  3 +++
>  3 files changed, 17 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
