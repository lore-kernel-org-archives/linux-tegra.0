From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: max77620: Do not allocate IRQs upfront
Date: Fri, 4 Oct 2019 15:36:07 +0100
Message-ID: <20191004143607.GL18429@dell>
References: <20191002144318.140365-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002144318.140365-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, 02 Oct 2019, Thierry Reding wrote:

> From: Thierry Reding <treding@nvidia.com>
> 
> regmap_add_irq_chip() will try to allocate all of the IRQ descriptors
> upfront if passed a non-zero irq_base parameter. However, the intention
> is to allocate IRQ descriptors on an as-needed basis if possible. Pass 0
> instead of -1 to fix that use-case.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/mfd/max77620.c       | 5 ++---
>  include/linux/mfd/max77620.h | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
