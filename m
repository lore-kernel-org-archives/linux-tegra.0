Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3F54767
	for <linux-tegra@vger.kernel.org>; Tue, 27 Aug 2024 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776720; cv=none; b=kAiKByrx5zhp+R1Vi8ih9GN8V9/1j9k2xgbdLkUrP0+zkiDUoS4z/nTU9Hz3Lx4XII0GBgK2kWzZs8nJr2X+5l3yo0XizoNbRHEeHLEWPFP+KOVtUQwbf5dz+DDPIyOV6sgrSlSWpuDhrpF39BJZ1yZraPTIiPD+a+SPlC/HtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776720; c=relaxed/simple;
	bh=ICSjzXjhdgNw8dn8YWJvtEzZ3LHLw6pCOXRFB6F/up0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq0yXJIYO7xkC1amPeMPmWJ1vvC37AZxdONkM0MG9D+nSIpVN+j0XMdWSGeP3gYnpeHWrjEH/nCzgMk//csf8aWttoYoYhP1soe+Qv1YpAZadA5wNKFyTfv9FQauyH/hPPv4O7MgtiaiGnrZgEQTwbKjkKNiGX1/uGe9dEYKmE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=MUYBoHT4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MUYBoHT4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42816ca782dso50351875e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 27 Aug 2024 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1724776717; x=1725381517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLPFmpK2D4+O/PF6n8ylKIrdd7bPSYGZqLr5/mcky7Q=;
        b=MUYBoHT4/yYlqKcP2Tj3xYUP9g9tsScuB6ZPWLb4CwyVMHx8yAN5o8PG6frqNValOf
         zK00kBnD0OL2BX1n/gkT91hXYJsFfcPk1vLZOPbH5E8lX2R2mVvi5TX8YmMISk3qcwZe
         6e/lZKGl9GC2B+kRT9q2Gc5uyktlRyQetM1ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724776717; x=1725381517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLPFmpK2D4+O/PF6n8ylKIrdd7bPSYGZqLr5/mcky7Q=;
        b=KaaGFpnMjXM02YDrF6RfC/yfsw3QKHzwJr0X2s2fLcFE3ruIiSiN+Ev7oi18n7cxC4
         IQFcaMA4xzmx6s3LeGug/Jq7UMnfT8HQ+M6TrqsjQlrpX/PUWuB++RAqo4F4uGWf6H33
         VR0ZN1cQAZF5d4sGKkqfxeVkEQVq8Ae98381fOev8lHZveyLoqEIPJZEKUmC4BaQNsyu
         2YoLkA42xgwDlNKkTCUmjcp06vkrhGnJzUb8hUFoYHSt4zjHGznnMvL9W6plNe5p/dL9
         Hptn82ymSIu2mOyUNSBcUDi8awTRVVsJN15TSVlFrghGIbJhSJ/td8JXgekvs3UjKs/g
         m5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWjSGRzhv/f3JQehiszdrYeJB99wNle+tyIySNhQwhWaDzwL5tKur0ylu2RkGa0mqUMF1qYvDkBNl9cyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrLeCWX7DLuOoGLB+tKnXxzSQjCh+a7iX1dUcIxUKLUsm6uvlm
	q5TMiqn/+MdV7T4GXX/B9yDBd4zk6D+HfYtWiuUdOZ1EpARMeIFu6AqJC/WqD1E=
X-Google-Smtp-Source: AGHT+IHXjOGQpGcQsCzcrlLSYbbpKFc9HMtgkeMMWxN2K9/FD5RLBpr0nc/Ljg7l2Vu/bZCv/Et1VQ==
X-Received: by 2002:a05:600c:45c8:b0:428:1694:bd8c with SMTP id 5b1f17b1804b1-42acc9fe242mr79581345e9.37.1724776716897;
        Tue, 27 Aug 2024 09:38:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5159564sm190397475e9.19.2024.08.27.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:38:36 -0700 (PDT)
Date: Tue, 27 Aug 2024 18:38:34 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/11] drm/tegra: convert to struct drm_edid
Message-ID: <Zs4BCunYzAMapfvX@phenom.ffwll.local>
References: <cover.1715691257.git.jani.nikula@intel.com>
 <e037667dfc325925bdeabff539df1e708d7c3c64.1715691257.git.jani.nikula@intel.com>
 <Znk8bwXush7mcOhE@phenom.ffwll.local>
 <87y14o34ds.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y14o34ds.fsf@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Thu, Aug 22, 2024 at 07:32:15PM +0300, Jani Nikula wrote:
> On Mon, 24 Jun 2024, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, May 14, 2024 at 03:55:15PM +0300, Jani Nikula wrote:
> >> Prefer the struct drm_edid based functions for reading the EDID and
> >> updating the connector.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> 
> >> ---
> >> 
> >> Cc: Thierry Reding <thierry.reding@gmail.com>
> >> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> >> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> >> Cc: linux-tegra@vger.kernel.org
> >> ---
> >>  drivers/gpu/drm/tegra/drm.h    |  2 +-
> >>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
> >>  2 files changed, 18 insertions(+), 13 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> >> index 682011166a8f..2f3781e04b0a 100644
> >> --- a/drivers/gpu/drm/tegra/drm.h
> >> +++ b/drivers/gpu/drm/tegra/drm.h
> >> @@ -133,7 +133,7 @@ struct tegra_output {
> >>  	struct drm_bridge *bridge;
> >>  	struct drm_panel *panel;
> >>  	struct i2c_adapter *ddc;
> >> -	const struct edid *edid;
> >> +	const struct drm_edid *drm_edid;
> 
> I keep reviving old stuff, sorry.
> 
> Please take note here, removing the edid member.
> 
> >>  	struct cec_notifier *cec;
> >>  	unsigned int hpd_irq;
> >>  	struct gpio_desc *hpd_gpio;
> >> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> >> index 4da3c3d1abbc..e6b5863fec71 100644
> >> --- a/drivers/gpu/drm/tegra/output.c
> >> +++ b/drivers/gpu/drm/tegra/output.c
> >> @@ -21,7 +21,7 @@
> >>  int tegra_output_connector_get_modes(struct drm_connector *connector)
> >>  {
> >>  	struct tegra_output *output = connector_to_output(connector);
> >> -	struct edid *edid = NULL;
> >> +	const struct drm_edid *drm_edid;
> >>  	int err = 0;
> >>  
> >>  	/*
> >> @@ -34,18 +34,17 @@ int tegra_output_connector_get_modes(struct drm_connector *connector)
> >>  			return err;
> >>  	}
> >>  
> >> -	if (output->edid)
> >> -		edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
> >> +	if (output->drm_edid)
> >> +		drm_edid = drm_edid_dup(output->drm_edid);
> >>  	else if (output->ddc)
> >> -		edid = drm_get_edid(connector, output->ddc);
> >> +		drm_edid = drm_edid_read_ddc(connector, output->ddc);
> >
> > Annoyingly the dsi output is the only one not using
> > drm_connector_init_with_ddc() despite that I think it could, so we can't
> > yet use drm_edid_read here ...
> >
> >>  
> >> -	cec_notifier_set_phys_addr_from_edid(output->cec, edid);
> >> -	drm_connector_update_edid_property(connector, edid);
> >> +	drm_edid_connector_update(connector, drm_edid);
> >> +	cec_notifier_set_phys_addr(output->cec,
> >> +				   connector->display_info.source_physical_address);
> >>  
> >> -	if (edid) {
> >> -		err = drm_add_edid_modes(connector, edid);
> >> -		kfree(edid);
> >> -	}
> >> +	err = drm_edid_connector_add_modes(connector);
> >> +	drm_edid_free(drm_edid);
> >>  
> >>  	return err;
> >>  }
> >> @@ -98,6 +97,7 @@ static irqreturn_t hpd_irq(int irq, void *data)
> >>  int tegra_output_probe(struct tegra_output *output)
> >>  {
> >>  	struct device_node *ddc, *panel;
> >> +	const void *edid;
> >>  	unsigned long flags;
> >>  	int err, size;
> >>  
> >> @@ -124,8 +124,6 @@ int tegra_output_probe(struct tegra_output *output)
> >>  			return PTR_ERR(output->panel);
> >>  	}
> >>  
> >> -	output->edid = of_get_property(output->of_node, "nvidia,edid", &size);
> >> -
> >
> > I think you can/should also delete tegra_output.edid completely, since not
> > doing that freaked me out a bit until I checked everything :-) At least if
> > I didn't git grep the wrong regex.
> 
> I thought I am removing tegra_output.edid. What am I missing?

I'm sometimes just blind. rb without bikeshed applies, sorry for the
confusion.
-Sima

> 
> >
> > With that bikeshed addressed:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks,
> Jani.
> 
> 
> >
> >>  	ddc = of_parse_phandle(output->of_node, "nvidia,ddc-i2c-bus", 0);
> >>  	if (ddc) {
> >>  		output->ddc = of_get_i2c_adapter_by_node(ddc);
> >> @@ -137,6 +135,9 @@ int tegra_output_probe(struct tegra_output *output)
> >>  		}
> >>  	}
> >>  
> >> +	edid = of_get_property(output->of_node, "nvidia,edid", &size);
> >> +	output->drm_edid = drm_edid_alloc(edid, size);
> >> +
> >>  	output->hpd_gpio = devm_fwnode_gpiod_get(output->dev,
> >>  					of_fwnode_handle(output->of_node),
> >>  					"nvidia,hpd",
> >> @@ -187,6 +188,8 @@ int tegra_output_probe(struct tegra_output *output)
> >>  	if (output->ddc)
> >>  		i2c_put_adapter(output->ddc);
> >>  
> >> +	drm_edid_free(output->drm_edid);
> >> +
> >>  	return err;
> >>  }
> >>  
> >> @@ -197,6 +200,8 @@ void tegra_output_remove(struct tegra_output *output)
> >>  
> >>  	if (output->ddc)
> >>  		i2c_put_adapter(output->ddc);
> >> +
> >> +	drm_edid_free(output->drm_edid);
> >>  }
> >>  
> >>  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
> >> -- 
> >> 2.39.2
> >> 
> 
> -- 
> Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
