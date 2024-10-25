Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E7B641
	for <linux-tegra@vger.kernel.org>; Fri, 25 Oct 2024 00:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815740; cv=none; b=TEI4KX3ut7vRf0HQX4yQ321ycXWu4MKhJKqE0iL5YmfS7U3KzdzAfYnNpBwc6jpSCNjQTNDHg/K4BFh6eVjtV6yK3MYHyaCNGpk43g3EJrwxwHWoW+7sPm0dYY1vXvndsOyBLUjae4eLZbRYDcXPy0GbOK26wgfxONBOPBN1iIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815740; c=relaxed/simple;
	bh=t179xpjE+Y8BfVZf2kDDN6v2eJPd57xr+hMX9hglcg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvtfoPE3qQGbs3CZWu9WHSuB83z0jbTxfofMmtUl59fboM60EOghd9Du7LPekswHrk8wUla6mXD3R0A6wSfabEsBpCEql7ztClAT61y3qneiEktEgK5hUnD7XgWrvy8xLPVGFsIKdPlvSkNblqkn6M54j/43Wl6C/B2zMa9LTog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EiWxIlMj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EiWxIlMj"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so1915365e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 24 Oct 2024 17:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815736; x=1730420536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=;
        b=EiWxIlMjpdrv+QImvg/c5oayAG1NKwwv9FRGE0N8O7aGoIIxsxqHX6P9KSdcxJgqPh
         L4DI0GroEUVfsw8zKpIQpOzAqUauYm8s9PI7fYSH8H4QkwxSltA/ZvVb+GU1rwpnvF/5
         IQmI7IG/lRYxAzb3nEx6FAlUn1+u5zGWrcyqyuR/Lucenk+v8aEwJQcurma3JzXRsVGj
         RKNTaL1ch1NUuy1/RteerPvJU5y3AIDYEMb0hbktxz1NQnL8H2X4vCXbfx7KSDU6GWXm
         hGladPehANWq/c6jRqa8eqJ7r3NfMULsQG5K7+b6n2yw3treYCnUYfj48lGZJTREwBHt
         QBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815736; x=1730420536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5EDM7WCg2HOqPHWF0Z+QG+aYFeqPcDdQtBhvkydGgw=;
        b=H7jFv/JX70xZPfv59z5DkSakIOIwQO7caZlMj3tAn3k/Yg+nFFOpsK27p3/MV00/Cb
         YwOnd/INz/yIE+TyvoFp1R5i2X36o23xXp1emNqRAY61ecWrbXjsw1nQUIYZA+BHWmmt
         oI9h+u7hUj+qiwkCVeWThD4zQjnrQofmRw1vv9x7R8M474Fw0jL/Jmby+Oku2+DiFSMq
         fVTpxyCNkH0kkhAPay/Kj4+avnj/NLsI5VTGHA0SDfAJTpGTYbyj4moLDdRE7WI18bjj
         cLqh069AxmgDlJ+Wov6KpUWvJrjd037YTrt+2IIATUuvlQ5dRgweUtJYlp28mgaG33X9
         YwLg==
X-Forwarded-Encrypted: i=1; AJvYcCVaJjoIgumpYkAYFXH6lhpfNLeUMjD96CeJObqbfZqQoRxkPWZs5zEWFBsQRtzQY1FT7EkTQqF18sxTBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2btAIJwIOb1I10jKB0jTksZrwFWwTVbZGYU++IWdRiXVJe/4B
	XfeOzNgM8gKzHeaypMsBQrVLRI678+CkAyjlrwvaWGA2ZTt/p4EzlMbYuMoOL/M=
X-Google-Smtp-Source: AGHT+IEwuZSNpMSc/jRW5N16zJFZH30TVd1uv/g/woovx2Ntbz3yvr/09wQ54BLmhll7f9heX5zoUg==
X-Received: by 2002:a05:6512:10c5:b0:535:699b:b076 with SMTP id 2adb3069b0e04-53b1a31f1d6mr4467181e87.16.1729815736306;
        Thu, 24 Oct 2024 17:22:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1afe39sm6621e87.140.2024.10.24.17.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:22:15 -0700 (PDT)
Date: Fri, 25 Oct 2024 03:22:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, JC Kuo <jckuo@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
Message-ID: <dz2tfpufzgmvxls2stxagz73x3krbammkc2zdycqsiy62tnlog@ztg4yujvyeob>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-2-saravanak@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024061347.1771063-2-saravanak@google.com>

On Wed, Oct 23, 2024 at 11:13:42PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
> 
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0
> 
> Reported-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
> Tested-by: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
