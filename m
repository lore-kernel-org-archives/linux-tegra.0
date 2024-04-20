Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97010788
	for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713654960; cv=none; b=JxMRfONKwqo6GLQmerRUL9O85X8yKX8tGdjLbFxCce7q/GNxUOBhiRVxEoGMPfgQ7WslDpddmhotOCaZ1ygCELrC7LwkzeuVC0VVsDQKwUIMsGFfe1Z4A4fWqFmmX5124SLgI0nm5rw/nOZzwUjgcDt5tevZPy0/RTU8Py5SE28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713654960; c=relaxed/simple;
	bh=NUrvewJBcU9hHyp8pm+RCmXt1n//pDwbkcHy0aq0J3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RToEJGL84eCsgxc6Q3gOgphlrYrGE3KdN8nmB4PEdG6JEvCW5iNaMlhW8PNMdBwzrJJzLM1U4zDCGbNK4fRiWPQHlaktkfAIo4cb6r/gnqdpAwMS8GyoNq5sYcOLkZLI5U8z4vPNnvuMZQFZa9ckuLq5YG31M5drOGecI+MGquk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6+3JRzm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6+3JRzm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-419c8236b34so14354085e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 20 Apr 2024 16:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713654957; x=1714259757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
        b=v6+3JRzmtZlF+fMxn4yPWdPkxe9+IDYvgKjQsqCMLIqLJTN0zNjmgfIW4f7uTgO2mg
         pKKX3wYdzXHmJvwqOoGVxwkQsCV5eNprtZAPwZrONK6v3vYsBeVqQLIwX7DmaMDLO5R4
         p9JENYQ9nTmaPsgPWd1nNpVsAjl8hQvH3+nOqzjx6ZHaT5qamlOkIjMAM65wtTFzCNBo
         CaoQPhPG9+BmB9gYZbMdsbIhhY/afD8YvGVwzvyb5RjegAqY/8MEsFjK0Yk2+lSICIE0
         MkmsUPXSJ1Kex6Qc+Mu/IsTyi1tzkED8FyZFfhKRWnpD0YseWwkyyU8PCmD2ZfnzR8T3
         7DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713654957; x=1714259757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQknuL+r9cbmTtmVlTx7T5fh7q9KKWBimZWASaRekHw=;
        b=LFMO7c6b44Iw4DgYkUfJPi+25ilVj37aScZe+5b6P0AZHjHxUhc0g1o+vjyiGHOmky
         WD8ARpGSHtnagjw+fqayjvBDw2Ump42t/r61TAqLravntWh2OFgH0wjqCijxWdkT7kd6
         ykpiCPsjwgAGgpjw3zVt72VkRn6fHiWHrv8ID21ssCeTu/6qQyCXqz0sFw2MNml1/qk3
         PMgGcr4Fv2XvhFe1Q2nNKnCYJrUFPlE6OW/ZEtqXhuLy0tRQQelxZPWIDJDTs7IM5kd8
         GMAm1Wsg9hykIDIVXxaigYPZOmhxaTpD4uOLIcxsf1WepU0vHrxwWX462En8RsuKOgXh
         CpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmXY74LACa0De3mHRauSYDVbXM9Qoh6uGsFwaEMO7sGqE4+wl2OUdEvDNObnqQXJxUR6pLplHc0LlwqBoLUyR8iVi02DDNKts2Cyc=
X-Gm-Message-State: AOJu0YztoUPRHrOsJNeovK0J6A4UFl6b6ELrADLu4V2yE6vMIcHbWRFY
	HYC+1KTZ+eTi3vHaA4BHfoJuwoW7yZDC/F/ES8V1s49z4Ako0hrgmHBdmOc0L0k=
X-Google-Smtp-Source: AGHT+IEJ0pmo+Vbh8mjcD98mOO7pRnAuIGNTQ6Q1qc2nTTg8q3KESPbMSdkxwInYUTYo3kcHGC3OsQ==
X-Received: by 2002:a05:600c:5486:b0:419:f497:632f with SMTP id iv6-20020a05600c548600b00419f497632fmr1710464wmb.29.1713654957220;
        Sat, 20 Apr 2024 16:15:57 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b00349d8717feasm7913040wrc.56.2024.04.20.16.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:15:56 -0700 (PDT)
Message-ID: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
Date: Sun, 21 Apr 2024 00:15:55 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
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
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:47, Ricardo Ribalda wrote:
> -	if (irq <= 0) {
<snip>
> -		return irq ? irq : -ENXIO;
> -	}

You're dropping the original intent of the driver author there no ? when 
irq == 0 they want to return -ENXIO.

---
bod
