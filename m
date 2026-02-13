Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62CB34F275;
	Fri, 13 Feb 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770978290; cv=none; b=SRa1ntFV2qdf7YQriOfL7bxr0OHTDJEUC9P4Bno+0YriC+CAJzOSxRyWu9/q1sgxrWoOiq1JL36dC5/e5veddGngXEyByaqhhuEOhjXffGGwI67U//Ni9ILsijEh4BWJxs2Nq7aexXGPqlMoB4LhEOU+o/VQcOfNOWBEIp1xpZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770978290; c=relaxed/simple;
	bh=DX40/Yqtzx/4qH/2xU1UzBbDHriHTuIX98B7+l1j9tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XS4tMx7ddZCFlrux3C4ENcwDxT2GipxekHPZuA9bWCM2vYIZxvd3aNMtSxwjOiTRWJTDKFXbBW83Fj377laSLjkCv0tpeRCljfunOK+19ExDk/qmsGWsJx72hLd3O6kotXoY/rtrwmP3srPKw4/kAh9tFPAP095ng4WhALqmHBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIJdEkZp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIJdEkZp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182D3C116C6;
	Fri, 13 Feb 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770978290;
	bh=DX40/Yqtzx/4qH/2xU1UzBbDHriHTuIX98B7+l1j9tk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pIJdEkZpFApgvNwM2sjDTzfIUE+lyRyGY0e/iaZOIF/sbx4Ycu/ATAJ+6vWFbZL/S
	 P1DWl8FfQI4ryf8iGz34t4jT7L91JkZHvxr2eeUoVtm29DQDbwgiVwifOLhFjJB1gd
	 7oW2fLRUWNdp/nozly0A7gMwZWWf58nRrQZl0RldufwIy6SDb1JL1zgZIP/ez6XZWn
	 8658JPn6pNV++Mbl9szgUNtrVTCYi7EbAWesdgQ97pRp9HWPfbLWPsLz/bWliq0PMX
	 xlUoYx9EQ22u1pW4LyGiHTVWlK9Dx8indXAB/us6J6GQeNYvyno2G+FCGgeYBKJbJE
	 mGAg0PO97QMhA==
Message-ID: <2891e25d-33d0-42eb-8da0-b57d50651c2b@kernel.org>
Date: Fri, 13 Feb 2026 11:24:47 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: Deduplicate rate request management code
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260206-memory-refactor-v1-1-4385d439558a@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260206-memory-refactor-v1-1-4385d439558a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/02/2026 03:54, Mikko Perttunen wrote:
> As is, the EMC drivers for each 32-bit platform contain almost
> identical duplicated code for aggregating rate requests. Move this
> code out to a shared tegra-emc-common file to reduce duplication.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> This patch is on top of 'memory: tegra: Add Tegra114 EMC driver'

If that patch is not merged, then this should be reversed. First you
remove duplication then you add smaller new patch. Not vice versa, where
you add duplicated code just to remove it.

> ---
>  drivers/memory/tegra/Kconfig            |   7 ++
>  drivers/memory/tegra/Makefile           |   1 +
>  drivers/memory/tegra/tegra-emc-common.c |  96 ++++++++++++++++++++++++++++
>  drivers/memory/tegra/tegra-emc-common.h |  38 +++++++++++
>  drivers/memory/tegra/tegra114-emc.c     | 107 ++-----------------------------
>  drivers/memory/tegra/tegra124-emc.c     | 107 ++-----------------------------
>  drivers/memory/tegra/tegra20-emc.c      | 110 ++------------------------------
>  drivers/memory/tegra/tegra30-emc.c      | 107 ++-----------------------------
>  8 files changed, 167 insertions(+), 406 deletions(-)
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 11e7cc357d39..aeda7f104d34 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -17,6 +17,7 @@ config TEGRA20_EMC
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	select PM_DEVFREQ
>  	select DDR
> +	select TEGRA_EMC_COMMON
>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
>  	  Tegra20 chips. The EMC controls the external DRAM on the board.
> @@ -29,6 +30,7 @@ config TEGRA30_EMC
>  	depends on ARCH_TEGRA_3x_SOC || COMPILE_TEST
>  	select PM_OPP
>  	select DDR
> +	select TEGRA_EMC_COMMON
>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
>  	  Tegra30 chips. The EMC controls the external DRAM on the board.
> @@ -41,6 +43,7 @@ config TEGRA114_EMC
>  	depends on ARCH_TEGRA_114_SOC || COMPILE_TEST
>  	select TEGRA124_CLK_EMC if ARCH_TEGRA
>  	select PM_OPP
> +	select TEGRA_EMC_COMMON
>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
>  	  Tegra114 chips. The EMC controls the external DRAM on the board.
> @@ -53,6 +56,7 @@ config TEGRA124_EMC
>  	depends on ARCH_TEGRA_124_SOC || COMPILE_TEST
>  	select TEGRA124_CLK_EMC if ARCH_TEGRA
>  	select PM_OPP
> +	select TEGRA_EMC_COMMON
>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
>  	  Tegra124 chips. The EMC controls the external DRAM on the board.
> @@ -73,4 +77,7 @@ config TEGRA210_EMC
>  	  This driver is required to change memory timings / clock rate for
>  	  external memory.
>  
> +config TEGRA_EMC_COMMON
> +	tristate
> +
>  endif
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 6b9156de4b66..28f22c957a34 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -14,6 +14,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
>  
>  obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>  
> +obj-$(CONFIG_TEGRA_EMC_COMMON) += tegra-emc-common.o
>  obj-$(CONFIG_TEGRA20_EMC)  += tegra20-emc.o
>  obj-$(CONFIG_TEGRA30_EMC)  += tegra30-emc.o
>  obj-$(CONFIG_TEGRA114_EMC) += tegra114-emc.o
> diff --git a/drivers/memory/tegra/tegra-emc-common.c b/drivers/memory/tegra/tegra-emc-common.c
> new file mode 100644
> index 000000000000..9292472a5890
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra-emc-common.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: GPL-2.0


... and that's why we ask for consistent license. Code in tegra30-emc
has difference license, so I assume here you copied the one matching
license above. Explain in the commit msg which code you copied or on
which existing code you based this.

> +
> +#include <linux/device.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_opp.h>
> +
> +#include "tegra-emc-common.h"
> +

All exported functions need kerneldoc.

> +void tegra_emc_rate_requests_init(struct tegra_emc_rate_requests *reqs,
> +				  struct device *dev)
> +{
> +	unsigned int i;
> +
> +	mutex_init(&reqs->rate_lock);
> +	reqs->dev = dev;
> +
> +	for (i = 0; i < TEGRA_EMC_RATE_TYPE_MAX; i++) {
> +		reqs->requested_rate[i].min_rate = 0;
> +		reqs->requested_rate[i].max_rate = ULONG_MAX;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(tegra_emc_rate_requests_init);
> +

Best regards,
Krzysztof
