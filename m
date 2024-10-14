Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B55611E;
	Mon, 14 Oct 2024 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911952; cv=none; b=kZjyfoHzT5qroXGDwgwC3OSiPRe/7wu3nNG3elzMOvQd7rtoWpfzITud7BjbsItIb3GpUnm0iHiXiSEhdyJW/uQdD8Jf4YsY606UoLx5Z3ypHEgVtQFPP4ZHmE+qgzlaoUqAI2C+EkMFOx053X90SolVNfqEpWwYv56UQ4heBv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911952; c=relaxed/simple;
	bh=JGKigdVvMLsH2/kU1hL1nsXpEbmGXTAgoSDJw55UxFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiWE5s32XntNQ2m4XC3uXWTcdnoMcemxXkaeXDulMVpj4yX4GVBD/9gEGC+42sD1Un0hBYdkhrkmdBr3oQjRjDaXDKeV+gWcCR3zVvfenvRkA5wN/CpnWoP5fgEV6TVaw4zPOEEoVaz8NYpMV+s3KYBGYauVaSCk9tDiR4amqNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/nqCKst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/nqCKst"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE49AC4CEC3;
	Mon, 14 Oct 2024 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728911952;
	bh=JGKigdVvMLsH2/kU1hL1nsXpEbmGXTAgoSDJw55UxFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T/nqCKst6pRIAcqnLe5hg1LCOMvlRlgtGoK2rWQ4Y66VzJxqxE0MfNlzlvHmf4Hgw
	 ZkBtQ62j/ZXvye5sipLr6CG2kOfxTBf85xCy6z9LkVCzVo72C3qxMtntZhgr2mff6A
	 EtUF+SoB4WqpSkdr24eYLBldbSYerikp3iDx3Jzf5BXA2SFq33j7ewyFogaKUo588s
	 UsWlFZFTCiYtjEFWQDwhRvdX7TFGOI6ddJ5rNOsUo6tqqrwiHyJZg45yS0nYMrVajO
	 mvG+oC/kI4F7gmDbE3mDLRa8Je+xz0uy+GeRfV4M2nCMLgsuS0q4tITOkCz9q47JgV
	 K4144lBtC8oUw==
Date: Mon, 14 Oct 2024 14:19:06 +0100
From: Will Deacon <will@kernel.org>
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: suzuki.poulose@arm.com, robin.murphy@arm.com, catalin.marinas@arm.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com,
	rwiley@nvidia.com, rknight@nvidia.com
Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Message-ID: <20241014131903.GB17353@willie-the-truck>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918215846.1424282-3-bwicaksono@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 18, 2024 at 09:58:45PM +0000, Besar Wicaksono wrote:
> Rename loc* and rem* events in CNVLINK PMU to cmem* and gmem* events.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> index ea2d44adfa7c..d1cd9975e71a 100644
> --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> @@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[] = {
>  	NULL,
>  };
>  
> +static struct attribute *mcf_cnvlink_pmu_event_attrs[] = {
> +	ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,			0x0),
> +	ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,			0x1),
> +	ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,			0x2),
> +	ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,			0x3),
> +	ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,			0x4),
> +	ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,			0x5),
> +	ARM_CSPMU_EVENT_ATTR(rd_req_cmem,			0x6),
> +	ARM_CSPMU_EVENT_ATTR(rd_req_gmem,			0x7),
> +	ARM_CSPMU_EVENT_ATTR(wr_req_cmem,			0x8),
> +	ARM_CSPMU_EVENT_ATTR(wr_req_gmem,			0x9),
> +	ARM_CSPMU_EVENT_ATTR(total_req_cmem,			0xa),
> +	ARM_CSPMU_EVENT_ATTR(total_req_gmem,			0xb),
> +	ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,			0xc),
> +	ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,			0xd),
> +	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
> +	NULL,
> +};
> +
>  static struct attribute *generic_pmu_event_attrs[] = {
>  	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
>  	NULL,
> @@ -234,7 +253,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
>  	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
>  	  .name_pattern = "nvidia_cnvlink_pmu_%u",
>  	  .name_fmt = NAME_FMT_SOCKET,
> -	  .event_attr = mcf_pmu_event_attrs,
> +	  .event_attr = mcf_cnvlink_pmu_event_attrs,
>  	  .format_attr = cnvlink_pmu_format_attrs
>  	},

Hmm. Isn't this a user-visible change? For example, will scripts driving
'perf' with the old event names continue to work after this patch?

Will
