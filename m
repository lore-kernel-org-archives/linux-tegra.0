Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 551C3B9;
	Thu, 23 Nov 2023 06:01:03 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE811063;
	Thu, 23 Nov 2023 06:01:49 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B64253F6C4;
	Thu, 23 Nov 2023 06:01:00 -0800 (PST)
Date: Thu, 23 Nov 2023 14:00:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: <rafael@kernel.org>, <rui.zhang@intel.com>, <lenb@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, <lpieralisi@kernel.org>,
	<guohanjun@huawei.com>, <linux-acpi@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <bbasu@nvidia.com>, <sanjayc@nvidia.com>,
	<ksitaraman@nvidia.com>, <srikars@nvidia.com>, <jbrasen@nvidia.com>
Subject: Re: [Patch v7] ACPI: processor: reduce CPUFREQ thermal reduction
 pctg for Tegra241
Message-ID: <ZV9bGtUsjF1v1oIW@bogus>
References: <20231123121433.12089-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123121433.12089-1-sumitg@nvidia.com>

On Thu, Nov 23, 2023 at 05:44:33PM +0530, Sumit Gupta wrote:
> From: Srikar Srimath Tirumala <srikars@nvidia.com>
> 
> Current implementation of processor_thermal performs software throttling
> in fixed steps of "20%" which can be too coarse for some platforms.
> We observed some performance gain after reducing the throttle percentage.
> Change the CPUFREQ thermal reduction percentage and maximum thermal steps
> to be configurable. Also, update the default values of both for Nvidia
> Tegra241 (Grace) SoC. The thermal reduction percentage is reduced to "5%"
> and accordingly the maximum number of thermal steps are increased as they
> are derived from the reduction percentage.
> 
> Signed-off-by: Srikar Srimath Tirumala <srikars@nvidia.com>
> Co-developed-by: Sumit Gupta <sumitg@nvidia.com>
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
> 
> Sending this patch separately as the other patch in the series is
> applied by Rafael in v6[1]. Revision history before this version is
> in the cover letter of v6[1].
> 
> Please review and provide ACK if looks fine.
>

For arm64 specific changes(a minor nit below though),

Acked-by: Sudeep Holla <sudeep.holla@arm.com>


[...]

> diff --git a/drivers/acpi/arm64/thermal_cpufreq.c b/drivers/acpi/arm64/thermal_cpufreq.c
> new file mode 100644
> index 000000000000..d524f2cd6044
> --- /dev/null
> +++ b/drivers/acpi/arm64/thermal_cpufreq.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/acpi.h>
> +
> +#include "../internal.h"
> +
> +#define SMCCC_SOC_ID_T241      0x036b0241
> +

[nit] We really need to find better place to define this globally and not
locally at each usage site like this. We already have it in GICv3 driver.
But that can come as a cleanup later if it causes issue for merging this
change.

-- 
Regards,
Sudeep
