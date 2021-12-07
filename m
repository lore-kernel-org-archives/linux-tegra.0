Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D637C433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 16:03:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239443AbhLGQHF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 11:07:05 -0500
Received: from foss.arm.com ([217.140.110.172]:35658 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239434AbhLGQHA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 7 Dec 2021 11:07:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E84711D4;
        Tue,  7 Dec 2021 08:03:29 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.67.24])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 590DF3F5A1;
        Tue,  7 Dec 2021 08:03:28 -0800 (PST)
Date:   Tue, 7 Dec 2021 16:03:25 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: perf: Support Denver and Carmel PMUs
Message-ID: <Ya+FzVuvQ3W8LOyl@FVFF77S0Q05N>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <20211207150746.444478-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207150746.444478-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Dec 07, 2021 at 04:07:45PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add support for the NVIDIA Denver and Carmel PMUs using the generic
> PMUv3 event map for now.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/kernel/perf_event.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
> index b4044469527e..8c8cf369c450 100644
> --- a/arch/arm64/kernel/perf_event.c
> +++ b/arch/arm64/kernel/perf_event.c
> @@ -1247,6 +1247,18 @@ static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
>  				       armv8_vulcan_map_event);
>  }
>  
> +static int armv8_denver_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_denver",
> +				       armv8_pmuv3_map_event);
> +}
> +
> +static int armv8_carmel_pmu_init(struct arm_pmu *cpu_pmu)
> +{
> +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_carmel",
> +				       armv8_pmuv3_map_event);
> +}
> +
>  static const struct of_device_id armv8_pmu_of_device_ids[] = {
>  	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
>  	{.compatible = "arm,cortex-a34-pmu",	.data = armv8_a34_pmu_init},
> @@ -1265,6 +1277,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
>  	{.compatible = "arm,neoverse-n1-pmu",	.data = armv8_n1_pmu_init},
>  	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
>  	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
> +	{.compatible = "nvidia,denver-pmu",	.data = armv8_denver_pmu_init},
> +	{.compatible = "nvidia,carmel-pmu",	.data = armv8_carmel_pmu_init},

Super trivial nit, but could we please organise this alphabetically (i.e. with carmel first?)

With that:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I see now that we messed up the order of "cavium,thunder-pmu" and
"brcm,vulcan-pmu", but otherwise this is ordered, and it's be nice to keep it
that way. I can fix the order of those two in a separate patch.

Thanks,
Mark.

>  	{},
>  };
>  
> -- 
> 2.33.1
> 
