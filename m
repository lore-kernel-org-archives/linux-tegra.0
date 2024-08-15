Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B6517ADE3
	for <linux-tegra@vger.kernel.org>; Thu, 15 Aug 2024 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706556; cv=none; b=bIdAhgae/MCLSvzUWG+reDiYME3p+PU3cAE+f7LGjY4zeoMQBES2Lh/xxE7oZcgAszaG0sVp3A1eRoq7do12qVPqnbrxZoc13AUSv2XmFSmvJI45pfczSiNlre8CM3dV/pddZFzjy6XNO1EchZX760K1PEFfRlqx+kIcP4C8OWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706556; c=relaxed/simple;
	bh=J0JnP5sTSbfqtp9rSEsTZC/IZ9oSMYmaRLemBLu7fF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsiYWUgxfHhAH8aHaBtO4pX6Od7um3+V6nGpXrDIPNsiNKk2LnXInN4ScFdkTSUDjBCwg1qjnIVM/EuJpeDsVIKctNuBFaCTJgW3sD4fZBoUeazcLFaMszGhS/Hqx4dVO6CoYyS0txpjYaR5uitDAk+d+5AMH0K3UU81vWCBJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hsaF2IFw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hsaF2IFw"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7c1f480593bso548366a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 15 Aug 2024 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723706555; x=1724311355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPQgXt+/K8hdVrtKvDp/K2jbzvYRDCrHGMGcHAQLofc=;
        b=hsaF2IFwbkorPvGQU47jiZOx4jj1zHMvOl5OovEuS0a5vDneqigM0igNKCZRv7kPxS
         U/sd0FonMmLaUMAyOYHdD4JgyM7mOerHyGtsLHc2BKkJhul2bHiAUnDoIkUf9R/eg6T1
         JyZnC72FD3cG1woTR49VJpelWLO2eP5JYSmBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706555; x=1724311355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPQgXt+/K8hdVrtKvDp/K2jbzvYRDCrHGMGcHAQLofc=;
        b=S4lXZBGPo+BEnmf882Wfi0TXlDM0HvX8TxOEDwqBW0fGV4NNOXh/d8g0WqXbEUJgpv
         6b+XDfJ1Hf+R3iD8tN5jjsxCRyTys6ELXnkiNKfQcfYmBeiRBpr9uybFoB6ZBqw03W3e
         V4QEMZG6RgXW48hJsTs9U77CkUA3kipFx473VIqtkezod36oSdAZH2agttBjhfzjMWm3
         BXPOh6P5ghqEjkXcshZR0RVQtKEpxs1vl6eRKe2nqHsdQNJJepABkzGO3kzmkRM4j+Ir
         WUIrQb2ZuOQorS3OaKCcesDNTNNCyyTrMdOjo0cex01APhSH53F+PssNoLgtzNPJ637G
         yZPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDCVpWk/+NvLC4WCztaHbVh74oYCFhN/0+GToxtdo8WkG1xc7o4XS4rkVw3uwburFkluZEqztYwv1sxLQR7sd+Yu71y5yYoJZDVow=
X-Gm-Message-State: AOJu0YzNy5NbnT+FT/V3LNpU/WomQCJZ5XKQfTF7YMk3xJwP2WUba2hk
	MrvnKhrKenJdb9UwSZA2t7vOC3MahdtbdNMVUmgc8QLN/XZruqSLYtsCBvsxr50WMZtPY/1s5kY
	=
X-Google-Smtp-Source: AGHT+IF/aGc6hHkocmjJlKEUqA+vIlBn3QfPHZ/jI+SDNYKCem3sbWEWjaXISqMqkijXU5e/Tig7ew==
X-Received: by 2002:a17:90a:b392:b0:2c9:359c:b0c with SMTP id 98e67ed59e1d1-2d3aab60a01mr5682803a91.28.1723706554713;
        Thu, 15 Aug 2024 00:22:34 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7dd457sm2930469a91.21.2024.08.15.00.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:22:34 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:22:29 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/7] thermal: of: Simplify
 thermal_of_for_each_cooling_maps() with scoped for each OF child loop
Message-ID: <20240815072229.GD350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-4-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-4-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:50PM +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/thermal/thermal_of.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index fb5472d6ffea..d277165746d5 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -375,7 +375,7 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
>  					    int (*action)(struct device_node *, int, int,
>  							  struct thermal_zone_device *, struct thermal_cooling_device *))
>  {
> -	struct device_node *tz_np, *cm_np, *child;
> +	struct device_node *tz_np, *cm_np;

Looks like the remaining two pointers are also candidates for cleanup?

>  	int ret = 0;
>  
>  	tz_np = thermal_of_zone_get_by_name(tz);
> @@ -388,12 +388,10 @@ static int thermal_of_for_each_cooling_maps(struct thermal_zone_device *tz,
>  	if (!cm_np)
>  		goto out;
>  
> -	for_each_child_of_node(cm_np, child) {
> +	for_each_child_of_node_scoped(cm_np, child) {
>  		ret = thermal_of_for_each_cooling_device(tz_np, child, tz, cdev, action);
> -		if (ret) {
> -			of_node_put(child);
> +		if (ret)
>  			break;
> -		}
>  	}
>  
>  	of_node_put(cm_np);
> 
> -- 
> 2.43.0
> 
