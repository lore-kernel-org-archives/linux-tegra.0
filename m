From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 4/6] mfd: max77620: Support Maxim 77663
Date: Wed, 8 May 2019 12:47:47 +0100
Message-ID: <20190508114747.GK31645@dell>
References: <20190505154325.30026-1-digetx@gmail.com>
 <20190505154325.30026-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190505154325.30026-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sun, 05 May 2019, Dmitry Osipenko wrote:

> Add support for Maxim 77663 using the Max77620 driver. The hardware
> is very similar to Max77663/20024, although there are couple minor
> differences.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mfd/max77620.c       | 69 +++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/max77620.h |  1 +
>  2 files changed, 69 insertions(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
