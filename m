Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E01713A26F
	for <linux-tegra@vger.kernel.org>; Thu, 15 Aug 2024 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706147; cv=none; b=dSC5aBh7SJLpFod7pkIYCtjKACE2eFTGA+jRTaW+a3U1TY6+tmMGGFxDgGkeCs+9DNo6QqbVQHrvLHBR7ZOxtR9qTp5IBgi0TfBaNRhHcgIIOMFmvzeqBBVJzmrjWSspYb0xxQU/KHUP7RKnNzCBZsOD47zzxeuVWTZt6DgLt1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706147; c=relaxed/simple;
	bh=GiHqZmyxScam6mzZQKuZVjPKqh8K83cFLfgDpQE6uR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRNIqjFu+3d7zyeJGnSnyWPvSuNBCpgADnGg6LtfnkLR+Qylud8/votKPbRKR9xdQVZQ+hH3hm2ZonMfNaKiEFQXhTI/WRnd8x1r3cJKhlpaR+5JhwZIK/1LFviWtarV+QFlOHl8zXSyzXTAr/DNIaj5nwrSK8odoe9Q5/umLwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fPW+DK/z; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fPW+DK/z"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d3c098792bso493307a91.1
        for <linux-tegra@vger.kernel.org>; Thu, 15 Aug 2024 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723706144; x=1724310944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9JmgHsK2eXcLrFjeKXovclXcr+2gfKF6M2PZSpS0PY=;
        b=fPW+DK/zVU9Xc1UVAto7c1CMd3pxUGZ6I2xZITNJFy6Jntpq5LWymqrVkjyOMNkWtS
         RPWyTApTs3kwg5fjbWJLmSibPlBaMnKvd60jo1VUqqloPp8TM+kTrLIBYoYobYJTVQZA
         cMSSpcpWqv+PFOl8DKIozBK7Gp3+l9cQP5xVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706144; x=1724310944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9JmgHsK2eXcLrFjeKXovclXcr+2gfKF6M2PZSpS0PY=;
        b=SX4DqQaGXc1x+/vufrQ5vQ7zhK1SHCpcnkoytEJqHxTNpgAHwsrysixxDwAG8cSJMd
         tD1wDaewFXHRLEQRoc1WNcdPO2x+JwKGVvLdq7GFUtNsH+8adn9M03vR4lH8ztVyhGoG
         uW+urZJVBNqDEpGxuCytgfu0qejEuMw3mqyh09oglPtZFW2hv658pjK0oGz/SiFNtixs
         jpU1AcVp07vn92+MeMdLQrR/dtuyStwvKa6itt6Ipr2Lqrr+MDx/a9oT0y8V++15c+2S
         sCyiJ++ZtSkdMrp78xJFqJEIAOTKs5zWOaxZIWWfCJwf2mQa4qU2DBPlc8X5XP4YjRl2
         61Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU3/J58QQP3/jUZiv6u1cc2ldkthz7dZiIlaBT212Ct6XYnlpa8dPR4hxzWDfNejjdTS8ZRNRdYE+97WFTam2E2Pwz6HWkjSC8NfnE=
X-Gm-Message-State: AOJu0YzojQ6sD5pRZ9+H+5078xrWsLOyijJoB06OLOjrX+Sqr8slQ7Dc
	J5GcwjLF9PNVICPjAoz+LuYuXMvlmcMsM0N8Hj6DEe9aylFcTCk45+6ZQ3WChg==
X-Google-Smtp-Source: AGHT+IGNNH+hyCCACdJtYZXI0gh62w46gVKcCAEgz5OV9CHzEwQIVxs+/U2Ky/c7OF20qNjl/7/JGQ==
X-Received: by 2002:a17:90b:2dc8:b0:2d3:b976:e30e with SMTP id 98e67ed59e1d1-2d3b976e58emr4016575a91.37.1723706143698;
        Thu, 15 Aug 2024 00:15:43 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac845f55sm2898845a91.36.2024.08.15.00.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:15:43 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:15:38 +0800
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
Subject: Re: [PATCH 2/7] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
Message-ID: <20240815071538.GB350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-2-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-2-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:48PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/thermal/thermal_of.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index a2278d4ad886..c8ded4462bb8 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -117,10 +117,9 @@ static int thermal_of_populate_trip(struct device_node *np,
>  static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
>  {
>  	struct thermal_trip *tt;
> -	struct device_node *trips;
>  	int ret, count;
>  
> -	trips = of_get_child_by_name(np, "trips");
> +	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
>  	if (!trips) {
>  		pr_err("Failed to find 'trips' node\n");
>  		return ERR_PTR(-EINVAL);
> @@ -129,15 +128,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>  	count = of_get_child_count(trips);
>  	if (!count) {
>  		pr_err("No trip point defined\n");
> -		ret = -EINVAL;
> -		goto out_of_node_put;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
> -	if (!tt) {
> -		ret = -ENOMEM;
> -		goto out_of_node_put;
> -	}
> +	if (!tt)
> +		return ERR_PTR(-ENOMEM);
>  
>  	*ntrips = count;

Also drop the "of_node_put(trips);" in the successful path?

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

And I plan to send a patch on top of this making "tt" auto released,
thereby eliminating the error path.

>  
> @@ -155,8 +151,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>  out_kfree:
>  	kfree(tt);
>  	*ntrips = 0;
> -out_of_node_put:
> -	of_node_put(trips);
>  
>  	return ERR_PTR(ret);
>  }
> 
> -- 
> 2.43.0
> 
