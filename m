Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5594A3E;
	Mon, 14 Oct 2024 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728912527; cv=none; b=RZl/+++YPtK9i1Gyzfg7XQ77iKAi6xoqf7pqcQM9aym+VtUTJYm1jLn7NWxBe6U+jq/BgmvwSaBYfouTeVmHcVDOVVM+tn2t3F5eWkTOa/zZEgzM8Ntk6S+SQ/Cpy+pGU3f13OisaVJOftGsuN1fuB93jTkgadVPDHTgpfhrRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728912527; c=relaxed/simple;
	bh=IJC/r/I8ibvGLVsU2Qx09C27Zj6TxnkngFFKIcYbnnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxvA4r+zHUmuKopXz6dKm8rj7mRJO0TdOLojoMmEmb9qhZVipa2SQhPiYd5vcRBmBQM4WuW2c5BVqdNB2GUSIkFF4zMoeLR89ZBXBLvJnpZPFLQbPSiMF1F30py9YunOOUOVtZksi1t+T+xm70r36+r4e5zgjYHle5JWeSxhsRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vENYb/E2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vENYb/E2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4855DC4CEC3;
	Mon, 14 Oct 2024 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728912526;
	bh=IJC/r/I8ibvGLVsU2Qx09C27Zj6TxnkngFFKIcYbnnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vENYb/E2rDJtJ21mQgAB845FLopbOAlQDyBka97Azx/VEzDHK1e4IcGlX/URWDbqh
	 OIOsbNXlYR7Rc8Jtn/y7nAuOV/aOblvGeDNzVUqJEPVwszkA5PFF2eHBLB5RD7mDB8
	 k4Kga91MJoC9VHwO4bf3vjvZFD59FKDfTDEiwis4qLu6xJq8wZYQtc55dtGCSErw5w
	 tSPEXgHV8jJeM1HwYkpLQ7ChqBJUZpszOlR2vI/h7q6jyea7+97bNkCpDiBAw+/cas
	 DnQvFsJYFfNF2Yd0IEu8Sdgx/PJ8aKsEFnWZ9Q+D/Lrw56aDowVYxO9ofPnQ32UJ35
	 gFkZR19klhbQA==
Date: Mon, 14 Oct 2024 14:28:41 +0100
From: Will Deacon <will@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: suzuki.poulose@arm.com, robin.murphy@arm.com, catalin.marinas@arm.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
	rwiley@nvidia.com, rknight@nvidia.com
Subject: Re: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port
 filtering
Message-ID: <20241014132839.GC17353@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-4-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918215846.1424282-4-bwicaksono@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 18, 2024 at 09:58:46PM +0000, Besar Wicaksono wrote:
> Enable NVLINK-C2C port filtering to distinguish traffic from
> different GPUs connected to NVLINK-C2C.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  Documentation/admin-guide/perf/nvidia-pmu.rst | 32 +++++++++++++++++++
>  drivers/perf/arm_cspmu/nvidia_cspmu.c         |  7 ++--
>  2 files changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-pmu.rst
> index 2e0d47cfe7ea..6d1d3206b4ad 100644
> --- a/Documentation/admin-guide/perf/nvidia-pmu.rst
> +++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
> @@ -86,6 +86,22 @@ Example usage:
>  
>     perf stat -a -e nvidia_nvlink_c2c0_pmu_3/event=0x0/
>  
> +The NVLink-C2C has two ports that can be connected to one GPU (occupying both
> +ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
> +parameter to select the port(s) to monitor. Each bit represents the port number,
> +e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1. The
> +PMU will monitor both ports by default if not specified.
> +
> +Example for port filtering:
> +
> +* Count event id 0x0 from the GPU connected with socket 0 on port 0::
> +
> +   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=0x0,port=0x1/
> +
> +* Count event id 0x0 from the GPUs connected with socket 0 on port 0 and port 1::
> +
> +   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=0x0,port=0x3/
> +
>  NVLink-C2C1 PMU
>  -------------------
>  
> @@ -116,6 +132,22 @@ Example usage:
>  
>     perf stat -a -e nvidia_nvlink_c2c1_pmu_3/event=0x0/
>  
> +The NVLink-C2C has two ports that can be connected to one GPU (occupying both
> +ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
> +parameter to select the port(s) to monitor. Each bit represents the port number,
> +e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1. The
> +PMU will monitor both ports by default if not specified.
> +
> +Example for port filtering:
> +
> +* Count event id 0x0 from the GPU connected with socket 0 on port 0::
> +
> +   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=0x0,port=0x1/
> +
> +* Count event id 0x0 from the GPUs connected with socket 0 on port 0 and port 1::
> +
> +   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=0x0,port=0x3/
> +
>  CNVLink PMU
>  ---------------
>  
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index d1cd9975e71a..cd51177347e5 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -149,6 +149,7 @@ static struct attribute *pcie_pmu_format_attrs[] = {
>  
>  static struct attribute *nvlink_c2c_pmu_format_attrs[] = {
>  	ARM_CSPMU_FORMAT_EVENT_ATTR,
> +	ARM_CSPMU_FORMAT_ATTR(port, "config1:0-1"),
>  	NULL,
>  };
>  
> @@ -193,7 +194,7 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
>  	const struct nv_cspmu_ctx *ctx =
>  		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
>  
> -	if (ctx->filter_mask == 0)
> +	if (ctx->filter_mask == 0 || event->attr.config1 == 0)
>  		return ctx->filter_default_val;

Isn't this a bit too broad? It looks like this filter function is used
beyond the C2C PMU (i.e. the PCIe PMU) and you're also checking the whole
of config1 rather than just the port field.

Will
