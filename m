Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E4381DA
	for <linux-tegra@vger.kernel.org>; Tue, 16 Apr 2024 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242369; cv=none; b=geA8EzT51fnDyN9wD/FTSdal9kDI/VHgH6KJDkVivj+ACG5Gsh6Jl9xbvqQRK4RPdXTYzxPEXiU92XbRWwRsxT8QTHrmij6Wtvdo+rLKIiCiiGjVhFGpaAg3Q8FXYPllwR0sYkOV9ae3j02+o9qLFxYNf1bZzctvUqo5YbUfFeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242369; c=relaxed/simple;
	bh=5PbOnqT31q7bJvtyCBHwTsPiD0wb0iv6/vtz4oxAlr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPm6pcysZQcejI/Ju1zLckNv5HISC2ujvTobP2gJH/0pm6foX8hN3AI3YepA8C4oxSd2bB/QSJ43ARiIMCu7ORC5gQwcVdZiPqKSPkTeR9r+2wsBfN5hMVOSxc2fZMv/DpkgG9iCir0jTnIu82Sr9LRILd4BYeKniFt83CsTqWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cuePyVKv; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cuePyVKv"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ea2436de79so2660490a34.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242367; x=1713847167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
        b=cuePyVKv3DGJ/nFLG5QvC8sL/8WdTgU3tN86JAmS+BbM6GTJL+xezvrAsWBOz/FuQd
         0GBe+QYEyRgxZldi4iMrKxhsB8TBfrKP+3JkeOAErxyDJh0nfEMwq06aW8R6V2klvRgb
         Ro3PkrUva+VL5EFN6RRyVcCyCZxWLx1jnYW3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242367; x=1713847167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
        b=P4ERswyxDWjvtETcNH+q9zAHjcTtHzZY09SgFR/dONIvSoRLKw8eCJ/gfDiDaZRAhE
         fn1Jl+EJ5U8xvFtRBN/Ig2pZD4sdZGEe7pk3Tp/Fsh7XDJe/Krw5NleNvNi7VOGOrmwG
         6q9OlMPwATYc+SK9JAon3ygQNy+L4oKhEgI1Itf7TRPKhO3hpS3hh2VpyX+zQMfJ/hB7
         W0RpbQoW+QKCoTEOyhroGf7Iy+zrXq/ZODp9uUXB7cEsN3x2t1K4PZ4RjnbqNg6pcJ0f
         pFEQWnZLnSErfmYupn/7n2wd1/8wvokH1KgaHP4HkUOqQGzxibRsG46W6w0AhDu1OTrv
         1BPg==
X-Forwarded-Encrypted: i=1; AJvYcCVGDUNcWs0h+KRrEO/BDVRwewCfCTgz+5ui/Q/+MwgvmeC2syKqxxU6F9kb+br3RjNJlgawBDkp7EdGI/vxD/m4h8VLx25brOwCO2o=
X-Gm-Message-State: AOJu0YyYjC/dw+weL3hTIAA1wuLClG+CiaE9S1Jsf7ji+CosbJJgFi4d
	vNwIxoKJAiL7oHaibQRE1Vw16ggon4CUWWtGW/DY1cLQQ0OHxg/8mywuRmOZ1g==
X-Google-Smtp-Source: AGHT+IG0ppjZwpHlNVZUS9DrO9z9Zt+G6PVBJT/QRsW763QY2rUFepRZ7LeeiLPVtOHJ43Afq2vK7g==
X-Received: by 2002:a9d:7f8a:0:b0:6ea:23af:2bcb with SMTP id t10-20020a9d7f8a000000b006ea23af2bcbmr12688528otp.32.1713242366850;
        Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id b65-20020a633444000000b005dccf48e2a5sm7898637pga.54.2024.04.15.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:39:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Message-ID: <20240416043916.GA14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>

On (24/04/15 19:34), Ricardo Ribalda wrote:
[..]
> @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> -	struct uvc_entity *entity;
> +	struct uvc_entity *entity, *iter;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	bool found;

Is `found` still used?

> @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	/* Find the extension unit. */
> -	found = false;
> -	list_for_each_entry(entity, &chain->entities, chain) {
> -		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
> -		    entity->id == xqry->unit) {
> -			found = true;
> +	entity = NULL;
> +	list_for_each_entry(iter, &chain->entities, chain) {
> +		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
> +		    iter->id == xqry->unit) {
> +			entity = iter;
>  			break;
>  		}
>  	}
>  
> -	if (!found) {
> +	if (!entity) {
>  		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
>  			xqry->unit);
>  		return -ENOENT;
