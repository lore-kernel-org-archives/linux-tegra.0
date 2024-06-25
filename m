Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752DA53370
	for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2024 10:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312872; cv=none; b=Ug80Mlz1DG8SisMUZhIIz+qRkF3WFTJFxpEo2o7FW3oXwWeMZGWsDiVhNAWmExOyNeaFcO1qW//oAogksBZha5hpkVA9QDjD3TOnLYVcO6mD8SCpba9PkKJUPO4bxjBe/hB+sOpctUGT8xGoYJcx7LaCIWFjag7V3YhvqDg+VUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312872; c=relaxed/simple;
	bh=iqAJT77/5nQtnfkRkQeaCSfi25BV9kRWodYrzB/wJ/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXKbmJRR/MlEWBjD7dCPe0YGRB6dDzXBDJ08y7OYfCtZpwdv2bAJYo4PpzmJn9yIvyGDDYqyWp+lNzMLFSBhaRwg4deCGYcd17SvcBFc7aHrsu9VSDo9w/KaGEP9EuWSKdVgaeCaltRvSoplhN5nULRC9vjppwe1kAE/IYdp1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DFuY1y9T; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DFuY1y9T"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25cc6962c24so2358757fac.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jun 2024 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719312868; x=1719917668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+cZWGB+2jcFhszdKI8ASmXDRJENXojOKhli/2LXpnM=;
        b=DFuY1y9Tq8fED3wRUMOGD4eTRf1o0jrMFlwtxpiL2iMmHy8CKOUbe8Qnvt/FVzdOuC
         /UY4vRozN64fI3hpRBVU6OpbIGVayayzwICgA0p8Sl92dN0NQ85D1gbzz3tj44dP31hv
         Gmq/u3ms+w+bEaTzeKMmnz//UExcYTEUYCi7TKEGv9wLOqD60ci18GQ7QVqcyr6HUNFs
         eufgq46+NswKdfCJyTUdnM/8Rdihk+AhrONHkuCVDtm1V6e86YLvf+L0nBEVr33g+3Fw
         RrZ2ztisfaRy6xnbCXE/aN1d24ACInoAtEWCljK11GYepZo8MtttV4XbhoVfeFBw98+8
         PtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312868; x=1719917668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+cZWGB+2jcFhszdKI8ASmXDRJENXojOKhli/2LXpnM=;
        b=rnHx/Ca8ljD23N2rM6rLuqxD+fMsTiVHE8EtqxCSx4lEt3kO9or0DoOu17Hf1UR3iY
         8mAZX/ru6Gq9xTTKekCfPoXUK67nJeI8Rq5cqnbmiXPJ+fmGrlVct7tB77r0LFDy3wrg
         rWff2vS3hBeJMHTck3aM7J2d3AWDmA3ZHR+eUATGvMKR5isSMIQDqPIK8FphJNIqK/ji
         O5TSmHRA7txThfUV3fScow33PLCV6GRn/+rlHMFe0wQ0X3HY5VBkO4vjkfOTYhOgTj3m
         h3OK5HDAH+tm+CBh2uVfJyjhMtnREPf7Ukt0/r8rCWoHSFhIxMtZZZgFH85YU1I2kmW2
         3pyg==
X-Forwarded-Encrypted: i=1; AJvYcCWn3CsVNC7Fo6n9vikkkwng57PAk0RN5lJyKI99D/LmRjuL0D05fMjAGUa+NxhveRh+AFjUcbvq7RdFKQEHOUYPYLdosgjLpcWD84I=
X-Gm-Message-State: AOJu0YzQgu1reC8OWBsnSTI6OfQQjmfHNlD3jkIYIFSwxyehKGuayPWn
	Lu5wzfkHhM7sgGLQ1svNhdG9+rFGUNNXZ5n9MUpzcA4EVwqGLkvPI8xVQ2AzfDs=
X-Google-Smtp-Source: AGHT+IHkmTwzgMVZ85oOIGg7bkGQn9jD0qlRj9ZqyfrOw1uen/yda4dypNC/fa/tx1p5pHhoPulz0A==
X-Received: by 2002:a05:6870:9720:b0:24c:afec:f1c with SMTP id 586e51a60fabf-25d06eb4fddmr6882648fac.48.1719312868320;
        Tue, 25 Jun 2024 03:54:28 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7067f2b97dcsm3924658b3a.129.2024.06.25.03.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:54:27 -0700 (PDT)
Date: Tue, 25 Jun 2024 16:24:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Nikunj Kela <nkela@quicinc.com>,
	Prasad Sodagudi <psodagud@quicinc.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] OPP: Fix support for required OPPs for multiple PM
 domains
Message-ID: <20240625105425.pkociumt4biv4j36@vireshk-i7>
References: <20240618155013.323322-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618155013.323322-1-ulf.hansson@linaro.org>

On 18-06-24, 17:50, Ulf Hansson wrote:
> In _set_opp() we are normally bailing out when trying to set an OPP that is
> the current one. This make perfect sense, but becomes a problem when
> _set_required_opps() calls it recursively.
> 
> More precisely, when a required OPP is being shared by multiple PM domains,
> we end up skipping to request the corresponding performance-state for all
> of the PM domains, but the first one. Let's fix the problem, by calling
> _set_opp_level() from _set_required_opps() instead.
> 
> Fixes: e37440e7e2c2 ("OPP: Call dev_pm_opp_set_opp() for required OPPs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/opp/core.c | 47 +++++++++++++++++++++++-----------------------
>  1 file changed, 24 insertions(+), 23 deletions(-)
 
>  /* This is only called for PM domain for now */
>  static int _set_required_opps(struct device *dev, struct opp_table *opp_table,
>  			      struct dev_pm_opp *opp, bool up)
> @@ -1091,7 +1113,8 @@ static int _set_required_opps(struct device *dev, struct opp_table *opp_table,
>  		if (devs[index]) {
>  			required_opp = opp ? opp->required_opps[index] : NULL;
>  
> -			ret = dev_pm_opp_set_opp(devs[index], required_opp);
> +			ret = _set_opp_level(devs[index], opp_table,
> +					     required_opp);

No, we won't be doing this I guess. Its like going back instead of
moving forward :)

The required OPPs is not just a performance domain thing, but
specially with devs[] here, it can be used to set OPP for any device
type and so dev_pm_opp_set_opp() is the right call here.

Coming back to the problem you are pointing to, I am not very clear of
the whole picture here. Can you please help me get some details on
that ?

From what I understand, you have a device which has multiple power
domains. Now all these power domains share the same OPP table in the
device tree (i.e. to avoid duplication of tables only). Is that right
?

Even if in DT we have the same OPP table for all the domains, the OPP
core will have separate OPP tables structures (as the domains aren't
connected). And these OPP tables will have their own `current_opp`
fields and so we shouldn't really bail out earlier.

Maybe there is a bug somewhere that is causing it. Maybe I can look at
the DT to find the issue ? (Hint: The OPP table shouldn't have the
`shared` flag set).

Maybe I completely misunderstood the whole thing :)

-- 
viresh
