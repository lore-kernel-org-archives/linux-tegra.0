From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/4] mfd: max77620: Add backup battery charger support
Date: Tue, 12 Feb 2019 08:06:11 +0000
Message-ID: <20190212080611.GM20638@dell>
References: <20190212064353.7451-1-markz@nvidia.com>
 <20190212064353.7451-2-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212064353.7451-2-markz@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <markz@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, 12 Feb 2019, Mark Zhang wrote:

> Add PMIC configurations for backup battery charger, which
> is a constant voltage and constant current style charger
> with a series output resistance.
> 
> The max77620 register CNFGBBC(addr: 0x04) defines the
> parameters of backup battery charger. This patch adds
> support for it.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> Signed-off-by: Mark Zhang <markz@nvidia.com>
> ---
>  drivers/mfd/max77620.c | 80 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)

My previous review comments still apply.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
