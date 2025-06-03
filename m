Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078FA19C554
	for <linux-tegra@vger.kernel.org>; Tue,  3 Jun 2025 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973429; cv=none; b=dFyHa58OKUdbzPyCT+Pjx2A/2VG9d3ubZ2l3iXTmCBnG7NXn8xJTH/VglMhmfklokjjpnFBUHL+3gAxUyCAZ1oI3Zla2/Hpxa2p7PY+2VWmn5d4m1S1wrj+xII6SNOUZ5arnRKNJYslQmIM2NXilRXi4kVi6sDjPwbUmDwJcH3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973429; c=relaxed/simple;
	bh=QN5rbcRHWNYvmqhVhRD9FgtoDgxlmTfU7H2bsy6rsYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rampH6zwRqWOIo8qhlglGdjZZnPEX5MydmQLnLY/u7R1PEj47B+w/yRq5v9dtMWlQNDmUsE5XlMy0eYI/T0TVVinbKFBqCAgA+yGtx9g9zlg2eRo8XYZH5rrle9UGUcd3bw2Wxl4Li3czXC9+5nQweuMSOqwiNscaaXq9H+xcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgmYLCFu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgmYLCFu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73c17c770a7so6516612b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973426; x=1749578226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=XgmYLCFu/k7G5+IOwdFliJRnYqVS/ouWbx8HfJzDg0uA627UihR1+lWwNA9Tw6pkRa
         K8qTKwy0FmppnROfGPd7miSxvPZeT2Eg3uqpjd6Vjz07T0kapGvNX8CfOEz1AS+Gs/BX
         T8C3th5akxqIJbnwBLQ8iKCwEfpS0LeZiLDC0RdzZb9yLGJjN4+Kh0fzRGFoNSyW1sD+
         NDxSCDtDwnw/IbVnbfF+Kc2SdVTuRyruVblL2RuYJ2d4lA9jnWNeRqoTxalJjRAprFh2
         Scom6IJ8bmo9p2HO4H7eK+3YX3Xvi4IAyQYykaW7Jo/xBIKGxCYOLNiWNwkk2C1h01cT
         F/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973426; x=1749578226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=s4qyFDgeBqgvpuVvsBqV1FFOCuy+4hKbkJ0we6DGsw7ohwCrIIqv9FcDwhKvtOq1mP
         sej3xiNHO9vTLJ4oHz6cT4qRrMp9TMjWS1hnIl6UPXGGwKdeIYFmSVUJSNKABERTf8B9
         lbH1y4VP3h4a/lb0KI9MuVMpuk/jMaRZKIZyuvf5kQNh2sQ2nYfBpMyB87ENbOf+FEfW
         lh8i+CwLOChYmUCYlfmztPbhgjP0KTtyvHyHLRfV0jJxgkZWGEZrI1Xzz/1cdP8QJ0A1
         AJzizju6bN9UCTs63YagbyWt4v4dh9uMlsQWLJWT+/Mrh6GhdYDKNvVkwK1HfVIuLoWS
         m41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxzGxKQccAx9vbeVLilr5YxHBsPG1BgOQIvZCIOwDXfTK9kftppfzHSrDn2P9oUwGObuu7FzlF9tjWIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzebTUL4R1VioIVAlDYg7TLnpmZVW4J89jZENcYeTaauAwVSK8c
	p3n7wFJE8j8g27orGHygz/S7jAx1LDdSdNUWU79dayqUhTIWtJL92a5CqlYbT0B08g==
X-Gm-Gg: ASbGncsKAWyeFvP/hGe7sFgkBuUWMw1bY4lHUEL+ZuqMT879MdU0uAbTcJXs2lHGtXk
	rmQkkKPVR5A6aCoYNqIPbZeplmjwPZpb5lV9ZPqnAmq1FEvdcl/hKcky/d/jxVsTd7RXvVGDuwy
	zo+ytLW8fmhGkQcKO6aBGaLVsMDD1dd6OsZokEsOYO576Gs8gJl2G3mgNUgJZ0gM7aHos3TLK6E
	f7QkN6av/9bf3sOkp9qsk20gxOeXompHncqLMyfvw6zBZmXMQ59vk02GBkMnzgQNf6yBAgYcyYB
	BVJdTH0OsJ9Sq50Mrn9gyOyDOXbnehwd9fLENAAfSfS3sdDIlqOJTmiyAs3TITyfux+vbIqEJ++
	AnsVhTlfP+xc0WjFPxKxsNr9s8jI=
X-Google-Smtp-Source: AGHT+IFJjRiNTfrHUGA38dJeGT2+lFGgu3T7p+sKAbadh5LPG+wdrTfumVyLbKsTRptWC4Rroj128g==
X-Received: by 2002:a05:6a00:3d12:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7480b1f3b1amr53928b3a.5.1748973426129;
        Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab4acsm9633273b3a.43.2025.06.03.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:57:05 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:57:01 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Message-ID: <aD83bbyEPKSDXv_T@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-5-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-5-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-tegra186.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..56a5342bcf78 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
>  	tegra->tsc.read = tegra186_timer_tsc_read;
>  	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
>  	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->tsc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->tsc, 31250000);
>  }
> @@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
>  	tegra->osc.read = tegra186_timer_osc_read;
>  	tegra->osc.mask = CLOCKSOURCE_MASK(32);
>  	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->osc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->osc, 38400000);
>  }
> @@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
>  	tegra->usec.read = tegra186_timer_usec_read;
>  	tegra->usec.mask = CLOCKSOURCE_MASK(32);
>  	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->usec.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
>  }
> -- 
> 2.43.0
> 
