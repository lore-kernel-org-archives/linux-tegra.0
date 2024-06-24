Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BEC130E4B
	for <linux-tegra@vger.kernel.org>; Mon, 24 Jun 2024 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719221365; cv=none; b=s4sfyAj0PoHBcQtLITxQdlAvH1pzfMhSapQvtQiOoc1PyWQZWaDPCdHEJGvkQf7oaqmrlF5PvIg/6oSlE8QEn2vCJMCSkXir1QsjR9dQyoje7tAt+0vw4upzCYVaCsbt3WJRbLDlbbGkYcTzlf4QsDrVVDdq4/R7JAG5I1o6S50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719221365; c=relaxed/simple;
	bh=sNZLxntlGGu/fSuwziarcMXUcuQOp5W0xnTM6E+2GS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfYB141Y6vzQjqwqolVBm+gl/XvHlzhR0WxE9QX2DoirnOzFURL6nufKATffB5kAhyO4zRtnoqRNgdkcHe3upETMXSG1Ybi/M8id1g3lgviPoC81xHB55DFqrMcmn3C4iDibZA0o0oxRU5RaeZf7cf5vWv+GnjDy9igQTM9YusQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=WkGsDlbY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="WkGsDlbY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4247ae93738so5961045e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 24 Jun 2024 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719221362; x=1719826162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIGheYit1liNLTPyXs4RImnY3ll7E0/UrQM2T550eiM=;
        b=WkGsDlbYkgsO2xH5p0y57Cn44mJYF0000tM7PqOIXbQIMpIPr9GICZ49eKxK5vCGQb
         b5FpgcCdHNwqtdfbkLkFEIsOowr+GmvbAzE0o2SLyVYNgOwCTWOe6jKewwLkxEANMqL7
         MWCHNXuCprPRzhq9t+tXqFbcfUYGxtuplb+kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221362; x=1719826162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIGheYit1liNLTPyXs4RImnY3ll7E0/UrQM2T550eiM=;
        b=wxfmTcGuQSGh+TqXHglITovReEk7PpWIp367+2LsWD5JHEYIRbOl/+3PWS5WVKGB1Q
         vB9GlqqWmd3Un7aS+azzvMRNhWlCxnBhaMj/Q3Djt51gGmF0e1qdmQFD57X9CwC2qgVO
         gCp73SR1fx/ox1boLsnnPVoJpX8iwDz3P4jqub+8RTz5+lzIS+m94bY7hRTqyXzupxN+
         vjceze/IV3dsFc37XMztapwEdU9WIBpj6cMafcre7npb1JbJz36kH4iqeOhq2MjmT+bq
         BVTg9qKhETTVMTBL6/sKufF/4BNg+kC4ZYPtf8pp6FwPRVG5Ny43z19a+i1GcPOFxHXZ
         A1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpLKVmhdnojk5JjEolzCmBRNO9IbrS2bTkNr7Gynyjj7Ug2/mfhrWn5+8N9TO5txo3Ku0Get/IB3F+PwLviDz2mIMM/obF5Q+8UQc=
X-Gm-Message-State: AOJu0YwmTBtE5fzUeGrmyPXeId+7ClYpmiEJhomuSE14ZhC65KS/9+gL
	6c6jOmrXIZoZ4ZtFz12JwR1VKiGzpkjgyd0BG7lGZkAb6sh5Dl7cpJ7mcXx57Ik=
X-Google-Smtp-Source: AGHT+IHi7Bn3w4Rx13I/VMV/kvqFvHmoGh50ukN3/pWHslWlCUaKxrXdvXSsMufkvnF2pPQSYdq+MA==
X-Received: by 2002:a05:6000:1842:b0:366:e60f:7216 with SMTP id ffacd0b85a97d-366e60f7fd6mr3589131f8f.2.1719221361813;
        Mon, 24 Jun 2024 02:29:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366388c401asm9527949f8f.45.2024.06.24.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:29:21 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:29:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/11] drm/tegra: convert to struct drm_edid
Message-ID: <Znk8bwXush7mcOhE@phenom.ffwll.local>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <e037667dfc325925bdeabff539df1e708d7c3c64.1715691257.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e037667dfc325925bdeabff539df1e708d7c3c64.1715691257.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Tue, May 14, 2024 at 03:55:15PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

Annoyingly the dsi output is the only one not using
drm_connector_init_with_ddc() despite that I think it could, so we can't
yet use drm_edid_read here ...

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

I think you can/should also delete tegra_output.edid completely, since not
doing that freaked me out a bit until I checked everything :-) At least if
I didn't git grep the wrong regex.

With that bikeshed addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
