Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3852E5B2D
	for <linux-tegra@vger.kernel.org>; Tue,  2 Sep 2025 07:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797126; cv=none; b=p/4quJKI6c2QkS4ed97Om1Al/Nh2BnTZp/8UIZa9Rdm4zXRNAoaN7yQiSsxynBoNkVecY/KRrOjNskZ0/yKipL5mOGBjuNlW5Jci9yCOHUb3aANidVT5wN5KpHtEMs3UZi3Ek8xUiV+8iqK8wASh641L/WrSYY94Xb+pggUstN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797126; c=relaxed/simple;
	bh=4Dj8wHzcKZ+KE+l9JlZw2/wgZaNm5SI7Vg6vhkZUvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzORWWlcaxnnNYDhMs2pCoruRF3SBlYfkF8cNjAiPmPyioNvX02qVBYgfos0ITLzZcND/udQeGGGuDqsIa+xm9MVQ6hsaqQNUBQqrDQLDqMmP/bWcPhmcOmz0Zsb+CKmJcUdXYJ5ObgidMLQIP3ppONEnAWXv2BUctufN8SLLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxPGfhMa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxPGfhMa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b883aa3c9so13891185e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 02 Sep 2025 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756797122; x=1757401922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=NxPGfhMalr0puieqZ0NjhnLO4k+g37416+742QxVCL39sCZ8MZ0jb++o2JkAxij8ZN
         vJn/GLrFHv4il+X4O+S9k0gc1m3dqqP0sPeNNzTjEIkm47mcjrtddBFWbt0r9Dl7xhtM
         n/Nt60RDPFxYA5LqefiznDa6Dwj1ALVZPuYSoeFC+Po/xGqv2pFlPxJBIAnAM1d4hNb6
         qcND8K1zagmtFFVrGGOii5GgbfTLWGMbqXAYTr3inpqcsYAWui9z0GxlN1GOzu8SK9Hi
         HqUdBxZrkWRxtoDJZRwKzQGI11wktL4skOeXqnTWj9NG88mpdOP4Xw2vAKnsK/vMicQ2
         dE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797122; x=1757401922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leRMEPgF8RUEvULChzHRAQuhgrQpyQ/k4NKGFx3/OIQ=;
        b=E+JxpTBO9m5WSZcVfDlXw0pphlvZ1d2n1CjJa1v2GKbo+/5S6CmzOZ+0dPt2+hC/lb
         FNNi5gBRlAF/5ku+z3mf7g9tOLjwjRNOz7rop99/n9WeD5UpnV1BizwdLqejQaH6X32f
         5Pv3Yg8NLJzy2lrTQsNun7mMDSBlhB6JDIr+szFHRifzYkPuEKEqZrvgA219DXP1D1/7
         akQ/6TH7ZV2kFLVgh2Z2WOodM50MSJ8uXRm9ADV2mKPorrgBAmrN/qqqe2Wc3e6VTa+T
         jMkZ1Cz26Z1aGxxEEPYqrAB/LlPtM4tboeDC1CD98syEktilJ8lBRWK78E4sLS2nJVzz
         vH0w==
X-Forwarded-Encrypted: i=1; AJvYcCUjXLW9qcKUqrCvDzq3j3OM1aPJuPh5yWGLqoAG06utriJ5cbd9oL3/GtjboBn4VRFGNLfUtBbxXVg23A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFEaYqy0vaZFLIeBvGv1V0fJLEWfBWm6WHGqHy5tANgdeY4SY3
	+sA6Pacv9ZcxwND4ltkwJWLgag+g1lXNpkl4gpCLknEh0EtEX/2x7WcrkEAxiGhbsjI=
X-Gm-Gg: ASbGncsMHKRPxzQUhKUDJGgbbFsN2ER4aDgf6XAyfWgLjt+CPjqSyczAHnYDsFFvlYG
	8mVtsDmBFF5OLwPD8RfJ1b2He467Ew+r04iYleySkhFDvnyJ+xj+PoYdZ8nKIHSrUdJwlAAd6qu
	XUD2/BjZNkngXQZajG1/g7HerqOXzgt+S1YLvuEjpcnT2QGFG+Y9yZ2QuM5jS6+uz7t7d+7I+m2
	Q+Jp9aEqholQhH/k7a/cd7I3adzGo746X7UJ1oeqRBb+jH2AC4CN/Ns5ynIouSnzaE78HZePcu1
	fuYPzm7biPOb9CSJZiqbI8+0y9OXUsRu/svA+6Hc4pDQct3Hx8l5Ttkp0StIS5nEnfmnetnPepH
	aGT4GPS+GYmkoYrlkDYu7Q1B+KD6HpDWIzU2/Bg==
X-Google-Smtp-Source: AGHT+IFYuCWJOgHXp+J/kYURbVc6VnwzlfI13ByiraVfMdlwIoA3Pz1WV9KjlyYQt58VCk3unM9JLQ==
X-Received: by 2002:a05:600c:4f8f:b0:456:43c:dcdc with SMTP id 5b1f17b1804b1-45b8558baefmr77527515e9.33.1756797122251;
        Tue, 02 Sep 2025 00:12:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f0c6dc1sm267152735e9.1.2025.09.02.00.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:12:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mikko Perttunen <mperttunen@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <aLaYvsh1sCF7uF6Z@stanley.mountain>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-20-clamor95@gmail.com>
 <3643424.irdbgypaU6@senjougahara>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3643424.irdbgypaU6@senjougahara>

On Tue, Sep 02, 2025 at 11:38:18AM +0900, Mikko Perttunen wrote:
> > @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, bool on)
> >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
> >  {
> >  	struct tegra_vi *vi = chan->vi;
> > -	struct host1x_syncpt *out_sp;
> > +	struct host1x_syncpt *out_sp, *fs_sp;
> >  
> >  	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
> >  	if (!out_sp)
> > -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
> > +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncpoint\n");
> 
> Existing issue, but dev_err_probe doesn't print anything when the error is
> -ENOMEM, since "there is already enough output". But that's not necessarily
> the case with failing syncpoint allocation. Maybe we should be using a
> different error code like EBUSY?
> 

I'm not sure I love the rule that -ENOMEM doesn't print a message.
Deleting error messages is fine because it makes the code simpler and
saves a little memory.  But with dev_err_probe() the message is still
there in the memory, we just don't print it.  Printing the error message
doesn't hurt anything.

But if we go down that road, we should make it make it a checkpatch
warning to pass a hard coded -ENOMEM to dev_err_probe().

regards,
dan carpenter
