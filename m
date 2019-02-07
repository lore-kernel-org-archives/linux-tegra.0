From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/4] Add max77620 charging & low battery support
Date: Thu, 7 Feb 2019 08:48:36 +0000
Message-ID: <20190207084836.GF4672@dell>
References: <20190129085531.32364-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129085531.32364-1-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: blaws05@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, 29 Jan 2019, Mark Zhang wrote:

> This patch set adds support for max77620 backup battery charging and
> low battery monitoring.
> 
> Changes in v2:
> - Add devicetree binding documentation
> 
> Mark Zhang (4):
>   mfd: max77620: Add backup battery charger support
>   mfd: max77620: add documentation for backup battery charging
>   mfd: max77620: Add low battery monitor support
>   mfd: max77620: add documentation for low battery monitoring
> 
>  .../devicetree/bindings/mfd/max77620.txt      |  34 +++++
>  drivers/mfd/max77620.c                        | 137 +++++++++++++++++-

All of this needs moving out to the correct subsystem.

drivers/power/supply/max77620-battery.c looks right.

>  2 files changed, 170 insertions(+), 1 deletion(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
