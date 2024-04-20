Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EB64E1CE
	for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 22:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653260; cv=none; b=Mj+PMrVGaY/p+Y7I4I3gv1JOskfN+mheoQIaEFzWwZUkHrxmo2oko5EqTARlJq5hZXGdE2zrqsvs6SZNmDEsEjKYxsrGhgBFV56FKX1cMxmiVw7g2/9jflQrNSALEWioPiKq4zborwzXrVk420uuZCwvywamrcPT0kGjjWSbCJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653260; c=relaxed/simple;
	bh=7BKUeJX9aV7FK0wwM/ed4hU8pUFUg4zU4KPvLHQ6pXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btJoSJQtoOFa263am9myYReqx2l3X3CdyrROuGw8NmY2tJnDndzP/bGhN1qRqeJFDkk1wmleFJaKvQeQ/+8NbCR4pf+p+P15FTRS7EEEwEW7tsysFrjtJuOJ2DnvYiAx4+1ymSeDmg07Bzk1aE5DDmlGWDPy8kc0ELCq/zGAtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zn0DsYbE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zn0DsYbE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4199332c1dcso10464555e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713653255; x=1714258055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=Zn0DsYbEnTIwwESOgoO8bNl+kRk7ZIHTdFnQcbcfA9pC3SCAl9hSeCxZbKt7V1tpaS
         Fbw2Mq5+oPCuAkB4OYpcbQY0WFzQzenqO7M59554jHeY4cRFNojtogX94EvL1cOYAa3J
         Pc8ARaggrXzWsp6CK2fZLFQ5hdr+s72oCSL+Bo6R51Gmqrkh84BdS59hvxvS5uffj/XL
         DkOZyMNQj1pBCog+e3xt3D0ZvXPjFqp6lX+87sC6Bbe4HF5YVZWAKPiHBXE3kOzjaxxS
         vjhcNS5SszgYyNp87pSYWnI94Xt0JVWcFDmaegY7T6j8ekQ/WtPDEQ2/QtHzc8KCLhJt
         VaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653255; x=1714258055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYrt2gNTxAC2edJd/oDyZK1JqsoIcnAtCqFK2cT4K3E=;
        b=MIrnRRyrejLmDusVQhHvpD4ih6cOzAuuwXSkchHUpRRGqoJzmqmQVlDtxMfCA0g0Ez
         YbhmjrhktN7tWOmRt8n0fL93ImFtlND1Uu08yY0Ks25bAZ7zMNCTdYfXDH2tFsCUEBgq
         CZD3ND0jQBAgWzFvDO3INHJYycWS00HMX8g8BBWoJMvlFjiVOs9jaD/xpdIBtDJKcXDg
         DsPJPvZTo6hdXL7ApmMdNHLElOjrKhy6M8UDXAy6JX/4KJtARcNq85iAU4DZGYR0vApp
         iwGn9bKvUvH5tMPixXQw/s/+FGpOONwBnF6Poxv+0LGlXiyqVEvgQEJrjK6I/xDtvYFP
         21pw==
X-Forwarded-Encrypted: i=1; AJvYcCXs75fyADK6tHS6QPHbNgHhWbhgMbPdXDD4ZuEoAJhO7lmuhxAjx87RAwkJX1nmoEb6dZQt+Gnk++zFiPAwCpHZqNooGEclUdaARik=
X-Gm-Message-State: AOJu0YwKeLl1Roo76EmZ3xBx1T81JIxbE1UP7HQbjiYBTVmzM7yuNz4n
	yBu8Toi4hkmswd6iLU1leCP/xMOawgHLnmx7eNTZFJrgWAS2TK43VtBpZO2V4DA=
X-Google-Smtp-Source: AGHT+IFbaKQ0tPQEJ9I/RpZX+4qvxduHp5ktCxUofqd2WifblrkCYfYKIpU2lWpeintNmr/h6rZQlQ==
X-Received: by 2002:a05:600c:4e88:b0:419:87ab:f6da with SMTP id f8-20020a05600c4e8800b0041987abf6damr3268421wmq.3.1713653255313;
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c458d00b00417f65f148esm15283322wmo.31.2024.04.20.15.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:47:35 -0700 (PDT)
Message-ID: <6b1627ff-5135-4685-be35-adf74a456469@linaro.org>
Date: Sat, 20 Apr 2024 23:47:33 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] media: venus: venc: Make explicit the range of
 us_per_frame
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-24-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:48, Ricardo Ribalda wrote:
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
> 
> Found with cocci:
> drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..f87e33a34610 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_outputparm *out = &a->parm.output;
>   	struct v4l2_fract *timeperframe = &out->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
> -	inst->fps = fps;
>   
>   	return 0;
>   }
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
