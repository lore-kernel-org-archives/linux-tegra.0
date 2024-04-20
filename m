Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243524AEFD
	for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 23:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654716; cv=none; b=T3euFH9SVjJYiyTvbQd/ss2ricKohsLiJgZ8K5juHjeUhK6vz7mEu381OF8GGRhsEDmkmGMGueHYhS3/YWNUNLbc1M+/AoDZzUBNti6V0wT3KJi5f67eJWthhwOKm2mSe0qTBQdeS33kSbbptVeC/dhv1Vj7FWlUQbYfmFAzGQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654716; c=relaxed/simple;
	bh=RnTvMGDlpXWcw0TABozpeun32zm855Jpbto6yuwQGuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgDFpiObDgzLTfLkdP7BJt4M9WGGRwObabFc75J6YB9CydYqWrBuM5VZXd3nfGWzpmg2dzRcerYrvd5yHQExG4ePddQU4eAxFr5Ku/OJGa6jL8FJcFkQyCmYbYl4cyIr72J9VfWmjwidAfSBdOb3skpLWstg7zDBmSvuJmcfxAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CAtHCgq2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CAtHCgq2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41a24251123so1552225e9.2
        for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654713; x=1714259513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r4SJobPXiJZTeUtb9I6Mhq3OcgAMqPAgBwxUvUsXgSw=;
        b=CAtHCgq2oWO8AS++mRbgnAy+mCXYwt8azot2+lGUddGndWUGQsgoc+kio8S8Few0sI
         XJ7sUPF8RlNvgDWHb70zSweUbT8hrfWLtRi4HQuhEzANalvqD7gOTCVo+fXcEqisCGT7
         o1w62cDXU2PsbHFbhSu5PP4SjcQlA09y/II2wIKhUdkaUyrDcW+cGUG80azB625y8YQE
         NaePVgyStoLzxkI2Qq/k7YGUov4WNaGCFkqY95ldjCIIpv58bk2y4mGL/arxlIfVr/Do
         xDaUZfb3KpotxjEjs27/3ZeFFRCOXoomXdIGmKLg7zRjYPuuc7fgGR2fVI5ouRoQK9vg
         bP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654713; x=1714259513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4SJobPXiJZTeUtb9I6Mhq3OcgAMqPAgBwxUvUsXgSw=;
        b=NZuovmvK4/k+teGue+0mtc8QwLozwbpYrI+FX2W4IqMIMrmzR4l99qdTW/HPh+k2ly
         KRX841qYNnxJzyc98Au95fmDzFxjgpHk2+u5QQmn9UA3pylGl/DL2erKrbrByC/o8n4d
         5IBsWWhQIkB3QSxt8OhNyx5+B87FynCEuClFo3DaDpKbpXF3YwZtyC1MLcANnAyUQ9q2
         zbQntdFa9xG6eQoLZXNy4M+y8RbDQKXTdiYE/SrqBhHtvjG+aoOV+qMguV2EtKiGdFik
         5I62uEOuX5fLodCXYuv0bAYnZvZPTUGOqo8s2p7VJ4OYPN6mLixdDLpoqSxv7mV92+xK
         n51A==
X-Forwarded-Encrypted: i=1; AJvYcCXnyI6kqENZOHNsmzf8/molJZeqVqeTwk23XtIb6UWBl8H8LdI+x2jB1lEhKF1r9IU4QSH1hvCyeIAqtHQnonmNWZQ0fRUe65BMLow=
X-Gm-Message-State: AOJu0YxFTfsvm7ZDsLlul+YCMiFkxiurESQXnJQ2JWMK8bt5QYcwj5l9
	JkVgHisT1tBysYLWyfpU47Wcn1qFgYV3g4Hi9PdFyxxmc0XXS2UQ6RQ8o1s9VL4=
X-Google-Smtp-Source: AGHT+IHhrXMbVyPQ3xu0BxAvDr/qwuPP5+bQspGoLom9YV5UOhqLd7IShzLKZACYdNB5R60XxGZpSg==
X-Received: by 2002:a05:600c:1d0a:b0:418:7c58:d592 with SMTP id l10-20020a05600c1d0a00b004187c58d592mr5521241wms.28.1713654713122;
        Sat, 20 Apr 2024 16:11:53 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id f8-20020adff8c8000000b0033e7b05edf3sm7827624wrq.44.2024.04.20.16.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:11:52 -0700 (PDT)
Message-ID: <b288c62b-6a9f-4c6d-8e70-de04b6fa5fa6@linaro.org>
Date: Sun, 21 Apr 2024 00:11:51 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/26] media: go7007: Use min and max macros
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
 <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> It makes the code simpler and cocci happier:
> 
> drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
> drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/usb/go7007/go7007-fw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
> index 018019ba47d4..86ce593e0c54 100644
> --- a/drivers/media/usb/go7007/go7007-fw.c
> +++ b/drivers/media/usb/go7007/go7007-fw.c
> @@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
>   		0xbf99,		(u16)((-adjratio) >> 16),
>   		0xbf92,		0,
>   		0xbf93,		0,
> -		0xbff4,		f1 > f2 ? f1 : f2,
> -		0xbff5,		f1 < f2 ? f1 : f2,
> +		0xbff4,		max(f1, f2),
> +		0xbff5,		min(f1, f2),
>   		0xbff6,		f1 < f2 ? ratio : ratio + 1,
>   		0xbff7,		f1 > f2 ? ratio : ratio + 1,
>   		0xbff8,		0,
> 

Code is correct, but the commit log could use some expansion.

Suggest:

"Replace ternary inline selection of f1 and f2 min max values with min() 
and max() helper functions for the sake of readability and to make 
coccinelle happier"

You can take the RB either way though

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
