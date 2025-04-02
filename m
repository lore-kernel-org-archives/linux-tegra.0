Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6672235BF3;
	Wed,  2 Apr 2025 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598219; cv=none; b=NWduInd+kNOeI5BDW8nDn9WXAo/7RPwhWcD31gzIQa1bQq4MwFodzPYT1/4EjLQkGy/l8lTjBpSb/XnrNv3UF8pGXOna/O5wj7vbnxHuvVJ0Bxc/IDom9gxkE9SC135q6F68rbLxIgNgu9g6FgOMoNLBSJpI9keEtK4Cs1EER30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598219; c=relaxed/simple;
	bh=seEcfsTx/2axYLwPT5YXHyXv+dAslO1ezGacxvR5VHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVI3cieQx4DRKfhnjlDbpNfpsXsc9wOe7p5FVuz0psg5+AiYCQP7RR2/MpWV1yxL41qKa6jBz45w6x2N2ACk7wTkXMEWwUlXH9UHQNq5Dl/84154nNGfDNH5mwN8GbHY5sonIZdGImm8JlPdP0Z3c0rxLNprGJBwLw9OKfF57M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p+NQD2PD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p+NQD2PD"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FA8163B;
	Wed,  2 Apr 2025 14:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743598102;
	bh=seEcfsTx/2axYLwPT5YXHyXv+dAslO1ezGacxvR5VHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+NQD2PD8PiA3RJhi7tyR7HaK5qJrm5RVlw6DEqp4nPt/pn08/DJEkLOqExnzuto+
	 RUQSRPX6PgKd+D/v1ASa1EVrzqEn7FWNPxNG3tMPIIqWhkqmRSkJkw6Mnj62Hzl+H5
	 n3SZJFRMETsYmMR2QNreddDMFnLLwc3ypynaMvOk=
Date: Wed, 2 Apr 2025 15:49:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: shao.mingyin@zte.com.cn
Cc: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
	simona@ffwll.ch, jonathanh@nvidia.com,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, zhang.enpei@zte.com.cn
Subject: Re: [PATCH linux-next 2/2] gpu: drm: xlnx: zynqmp_dp: Use
 dev_err_probe()
Message-ID: <20250402124951.GA13762@pendragon.ideasonboard.com>
References: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
 <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>

On Wed, Apr 02, 2025 at 07:38:52PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index a6a4a871f197..28efa4c7ec8e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2466,10 +2466,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> 
>  	dp->reset = devm_reset_control_get(dp->dev, NULL);
>  	if (IS_ERR(dp->reset)) {
> -		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
> -			dev_err(dp->dev, "failed to get reset: %ld\n",
> -				PTR_ERR(dp->reset));
> -		ret = PTR_ERR(dp->reset);
> +		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
> +				    "failed to get reset\n");
>  		goto err_free;
>  	}
> 

-- 
Regards,

Laurent Pinchart
