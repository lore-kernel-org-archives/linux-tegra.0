Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60EC4C62A
	for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713655394; cv=none; b=NzDY0ucXcVn8gHCjGASYg1RXoZ8bUIWqOa97UNc/TqzJCzp4YNkZ397iESPPvcUydCijTbCjafOPj/0SFbm7n5HAUumpIWNl0TVHLWDqO88xjNNCnKj1f34QPri3340Lt7h0U+j1vFHkDbwSXjkyFQ3ATb4Nj0UkFaob0YUmWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713655394; c=relaxed/simple;
	bh=bBNbxTaDfIJVcjkaQmgCFXE6pXweSy07pk6tkP8ChP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uo5/jCuzTshnxO4OUVPbVaA92Q78sJSdxPLtqPlaTpFtzNoFLB8oUqa5vq8NjE95HbKPZFn830br3+LIJDsAwy7gSQnu9KZdoMG1TR+84NV3j7CKdxqjl2KQqTvUS6a2svZhXoPZmwcI/5g+XEB0Tw+ZktVO0I9q5GO8jypJBQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UMNw0TfY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UMNw0TfY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a55ab922260so9397866b.3
        for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713655391; x=1714260191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=UMNw0TfYERYCM73Fq3Dfxfa5Nka7eEdWP9KeNxkaioU40XArRH47xzepKqoU2hhwCX
         b+dG1RBOcQs45R3gAJUzXUzZvZub3wnRBgTjWhpaPxZIptbWaphPb5nVDFAuUvJq4jI8
         UPZYhuWMAJSVqenLIVmJ4xR9TGXvnI1Iv92AdQHTkrW/3cOShxU+zzVaRt5aPHrMhMKi
         RCtHNsxaOmGUuc3q8TqcuMLa3mSmTJIxlnBkb0B5AQAM+scdAVilZ9EIuvJCLh4sdCeR
         cN3cnCp5Qks5PxR3rc7JWD825iRdublNaQcBKGnLfo+lcDRtKkH/12CqHAPTrnPJ2MjC
         Z7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713655391; x=1714260191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7j9WmKVfIxCtxmA5+g+ivZQajcRB8Ss1Yyb3DxCAfA=;
        b=m7bKPhavB6HPMG04gMHxL7vCh8dCncTAOnIsrNHMl5iGufrDrZUEoCckAu60Idv5Uw
         jzHZT3MLkcmYKMN+9UgVYPEtPVWj4PWzAtks5Utd01oBXSIhjpelQQw4+474ERhmgN9k
         Wl3UneVDO+N7FI+1YBi+HMigi7P6O70pMWB+eiXrguAmQ6AaFPDbPbB/i09fOwltCp/Y
         wtQtELWA+qzQIDHX2w/wj741rY9HbirdQ0sxEGe2icdWG8bIMo44Vh+G9LPfwPajuiTD
         HvtueeJegXa2oo854gk2TqN0zuRTGfZtlN5p+NNAko4cY7Vud0jnZdRJgmglYheyKBG3
         F6QA==
X-Forwarded-Encrypted: i=1; AJvYcCU+8/COzHBQCTKq5+tvcabZ2J3rIisppp2NLgwqskRUqCEBJ+7QMQoPKTQUWqo93BgIccVPvljl2iid+z4OqWA9Td3++PJT5aQjrU4=
X-Gm-Message-State: AOJu0Ywaw3aUk8hTUhHpGS8qZthWlfFH6Enwc3Ai0ZVAr/LQ7/EEaWvp
	UbZv2/57RLVXO+Qk3AQQ3tQk9DrGvU94vwb4fcKIz6UFy9Aw6dYcTVW05Suachk=
X-Google-Smtp-Source: AGHT+IHIgAHqaBHAo2tv0s9P7hAH/P161Q1ck8771gq2FLpa0nizkFWxKtOsbHWkZLUsCdT//bfy9g==
X-Received: by 2002:a17:906:c24d:b0:a4e:5137:9969 with SMTP id bl13-20020a170906c24d00b00a4e51379969mr4156927ejb.32.1713655391076;
        Sat, 20 Apr 2024 16:23:11 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906339800b00a521904b548sm3889268eja.166.2024.04.20.16.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:23:10 -0700 (PDT)
Message-ID: <27513574-3131-4704-9c3d-f699cc9edb9b@linaro.org>
Date: Sun, 21 Apr 2024 00:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
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
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> is not enabled.
> 
> This makes cocci happier:
> 
> drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/v4l2-core/v4l2-async.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 4bb073587817..915a9f3ea93c 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
>   static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   					     struct v4l2_subdev *sd)
>   {
> -	struct media_link *link = NULL;
> +	struct media_link *link;
>   
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> +	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> +		return 0;
>   
>   	if (sd->entity.function != MEDIA_ENT_F_LENS &&
>   	    sd->entity.function != MEDIA_ENT_F_FLASH)
> @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
>   
>   	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
>   
> -#endif
> -
>   	return IS_ERR(link) ? PTR_ERR(link) : 0;
>   }
>   
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
