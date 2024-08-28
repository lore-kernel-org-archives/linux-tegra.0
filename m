Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AD7176228
	for <linux-tegra@vger.kernel.org>; Wed, 28 Aug 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849215; cv=none; b=KOxYFIz+K3ElO0h2dvnNoZRkfTXDXqFh5VvVvBYIo9aSGyyNERkSYSElPQJH0+/nMRTjkgWBaR2DVQfE0zY5BsmVDc/lI8a7BRY57awzwrooYcJBinJuDX0GEgXGucpbJHzC5T5cZALo5Wfc1g7lO+EbfwdHTMa4Y54ZUD3KB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849215; c=relaxed/simple;
	bh=pCZT8GGiGT46dq3x7b1//KPf/UaQ5dWp2LeeG3QteWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOMbSQRtjHFJLbcqDzwJ9rd/oO8H89AMzthg4RxU9lvVsiZAh2iT2o4UeoJlW9cRHeM3QLWvhaHUshXoLH6pUH3hJD2LdBhVMSavQOilvvlkoPWKrh0OrHmbyFbhn+l85wZZEI6SO0lpsUu+MGmzjRr8Vdl7+uDeB1qI7waBEJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Mux+pBGS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Mux+pBGS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428163f7635so57543815e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 28 Aug 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1724849212; x=1725454012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCKUfCxdP4MKeenzWS0OMigepVfsXKGfVEcSb+4JFCU=;
        b=Mux+pBGSw5BboZ9TYkvm13Z6uYQ+EMNA4/SH6Bd2EKpg4CiADxy6TpofvXCGH+COlz
         D4nP03cMM1cgDgQfp2yn9BK7B+lBOfMAl7QadBeurKhWhazEImfGzr+uQ6sYwy9Sv54N
         G+B0fybwNQ0ITHXs+fDV3gF7fMk7mUCGbvFL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849212; x=1725454012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCKUfCxdP4MKeenzWS0OMigepVfsXKGfVEcSb+4JFCU=;
        b=hjMZ9yBTvuYfLWUtfhme0oxXIJ5TncQTAk4sNnMvqhdzomnRnkxS4zQV6YCylNkc88
         h6doBq9xR3iIZDyX+fOKz6/OPmxIKsXUDOortyEwI0zp/aFQpJ0fgCOQbtliXPVYZStm
         YvSqxe+6kolnkFfSNqpl7F8UWJPmzj9LGCh1enNPhkJF4vdgV6/lSzvRPUtO1h/B/Qhp
         xgHJlFsWWfsmw8vmdq3YlxDwDdAHI0Y582i7OzkTyFkiMW3vD368XpDfRFt0qgtUN9aj
         HDU17NLK3lX5bxuYfLGWCVAdcBPvtIfZUfNfwAU/dZULaB09ZpEX3NJgo13XYdp2upPb
         ncjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9PwdtpYhFQL3gEKxlRLXuT8XG+d6Y7+iCaAxVF/4MxTg5LHlSz6v5iDQTJkJ+sK3bqMEJoiL4mW7DOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziH6MKZSTbier3+S75zZWHoVIk6qwbAS6KHHQmBjrqH4O8uuxh
	11a6C4LyiARVxOyabzeqQXqtGm09yGF9hDYZuf9vMHX032gPv78rckXjE9ewhmQ=
X-Google-Smtp-Source: AGHT+IEme/NvDEwaIsmdsaghdQUIdj9mcmi4fC5Q5iTXRkC9Kk2qvrAxmk0wwPZtl6O4mKao5Ms1RQ==
X-Received: by 2002:a05:600c:310e:b0:426:6353:4b7c with SMTP id 5b1f17b1804b1-42acc8d4a11mr121210565e9.8.1724849211908;
        Wed, 28 Aug 2024 05:46:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bac862326sm6344815e9.17.2024.08.28.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:46:51 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:46:49 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/tegra: convert to struct drm_edid
Message-ID: <Zs8cOVli_dYQO5v4@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Thu, Aug 22, 2024 at 08:42:50PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

This time a slightly less blind ...

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

:-)

> 
> ---
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 682011166a8f..2f3781e04b0a 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -133,7 +133,7 @@ struct tegra_output {
>  	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	struct i2c_adapter *ddc;
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	struct cec_notifier *cec;
>  	unsigned int hpd_irq;
>  	struct gpio_desc *hpd_gpio;
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index 4da3c3d1abbc..e6b5863fec71 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -21,7 +21,7 @@
>  int tegra_output_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct tegra_output *output = connector_to_output(connector);
> -	struct edid *edid = NULL;
> +	const struct drm_edid *drm_edid;
>  	int err = 0;
>  
>  	/*
> @@ -34,18 +34,17 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
>  			return err;
>  	}
>  
> -	if (output->edid)
> -		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
> +	if (output->drm_edid)
> +		drm_edid = drm_edid_dup(output->drm_edid);
>  	else if (output->ddc)
> -		edid = drm_get_edid(connector, output->ddc);
> +		drm_edid = drm_edid_read_ddc(connector, output->ddc);
>  
> -	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
> -	drm_connector_update_edid_property(connector, edid);
> +	drm_edid_connector_update(connector, drm_edid);
> +	cec_notifier_set_phys_addr(output->cec,
> +				   connector->display_info.source_physical_address);
>  
> -	if (edid) {
> -		err = drm_add_edid_modes(connector, edid);
> -		kfree(edid);
> -	}
> +	err = drm_edid_connector_add_modes(connector);
> +	drm_edid_free(drm_edid);
>  
>  	return err;
>  }
> @@ -98,6 +97,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
>  int tegra_output_probe(struct tegra_output *output)
>  {
>  	struct device_node *ddc, *panel;
> +	const void *edid;
>  	unsigned long flags;
>  	int err, size;
>  
> @@ -124,8 +124,6 @@ int tegra_output_probe(struct tegra_output *output)
>  			return PTR_ERR(output->panel);
>  	}
>  
> -	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
> -
>  	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
>  	if (ddc) {
>  		output->ddc = of_get_i2c_adapter_by_node(ddc);
> @@ -137,6 +135,9 @@ int tegra_output_probe(struct tegra_output *output)
>  		}
>  	}
>  
> +	edid = of_get_property(output->of_node, "nvidia,edid", &size);
> +	output->drm_edid = drm_edid_alloc(edid, size);
> +
>  	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
>  					of_fwnode_handle(output->of_node),
>  					"nvidia,hpd",
> @@ -187,6 +188,8 @@ int tegra_output_probe(struct tegra_output *output)
>  	if (output->ddc)
>  		i2c_put_adapter(output->ddc);
>  
> +	drm_edid_free(output->drm_edid);
> +
>  	return err;
>  }
>  
> @@ -197,6 +200,8 @@ void tegra_output_remove(struct tegra_output *output)
>  
>  	if (output->ddc)
>  		i2c_put_adapter(output->ddc);
> +
> +	drm_edid_free(output->drm_edid);
>  }
>  
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
