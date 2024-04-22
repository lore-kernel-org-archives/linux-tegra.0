Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED83FB09
	for <linux-tegra@vger.kernel.org>; Mon, 22 Apr 2024 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713768802; cv=none; b=fwhNdXHdlV/exKhyi0t83GYts1fbhdpRCod+qjw+ElMGdwr0f+t0azIOtMTLVtFe1RBN/cRDnyV0Z+UzqU9KkYpcVoyaHemN+soaOVbQy+AIbJfKo2osd30JKQlDRKrgCs7rqPbULjc9fqAcjIA34M/HBJWR5L+X0iLNMt6JQbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713768802; c=relaxed/simple;
	bh=WyWHeoU/Ff7umbOe8XQrl/qZdNdvHSjb9SSotewTso8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2Y2UgJSeQCMlk8B9SNYzaL+tLGLQXBYgTaM1VB3vsH0l2FYtRFqHTDFCaK1tA/h6FhQxMNjtB/X4gsDI6w8NI2Afg2I/VEfkIwYGIzHnlf1XhLT6DiMpDkvIcyvoaurV82hn5GsxXcOa+ky2J/KPCWL4nqFkvBsRysWns1J/I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A0zHsmmk; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A0zHsmmk"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ad28c0b85eso983296eaf.2
        for <linux-tegra@vger.kernel.org>; Sun, 21 Apr 2024 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713768800; x=1714373600; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=A0zHsmmkwq6pFHhxRR6ftxllj/fU0ka+pY3sDXM3QytCtw08Sk4ZbxHCptcqlIJJj0
         azG6CI3A74av7OBfFp9DpXDAttzhnZWCrKDk8CZodxGMDVyg0gtm+8T0S2s91oMzDRo2
         GrdQ2tlx78HK9RmBJtaAH4khTUwVZCYw3mu+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713768800; x=1714373600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dg+W9++cTuSKiuuJU3BmFvsGHmcNsDKvQ8sCokwEeZM=;
        b=s2OhiYCkCbdzB8f/2woTJkg4fUjPl7RSsLU7NZpCnbkLg8UyZmqJIy9/DggGSP5Ude
         DfhZA3hZyVEM5dn1DBBkA4H9/ykLsgjIBtxTN3GGkEHzfhG065j3DHHzXL5omfG7RiwG
         /bj4ydCU/N8mWsqxmfZvmO/cs0aihSOXw54kipSq13f3lYpXrsM7nnI+Sen0CgMmXj6l
         FIiS9OIk/QDsm737GpRCAm6DEYG5U7AftZoy2NQI+B1Lbai0/M6EZb6ZxEQCtxJ5SL92
         0lTUnNJWFQpBYJbzyphL1s1jEbHRFnogoAI8L3gO9n0vcyJ2cT6o0MxLPgRUjo+2m0DN
         3NeA==
X-Forwarded-Encrypted: i=1; AJvYcCWY8/bZ/NNwwtV5Y15Qj2n3fBDd20qdkp/76kl3RpZMN7b2g9uDPSWEpabfrcl2XPvFMHMNB8JWH2e/U3+LC0lG+2uEsYWhR5aUb9U=
X-Gm-Message-State: AOJu0YyxBYNQ3sECKUWduou+CDr/ExYBFBGcRA8kdx2pNzZO91kkdjNm
	o2vqqS191cpU5L1r/x5DyXkCvMsKqDI0ccWyXdF47EU6alIhYUx7+tt9Ue0Hi21W8lDwdYSZ7PK
	31w==
X-Google-Smtp-Source: AGHT+IGHl6Dpt4kP7QKyngey0ydpkMlC/zfi9DQfg/HYtffzY4mJyz7IDNCaex2O5Oel8lkVwIx+zg==
X-Received: by 2002:a05:6358:5bc1:b0:183:d2fa:ff5c with SMTP id i1-20020a0563585bc100b00183d2faff5cmr14367806rwf.12.1713768800328;
        Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id ix12-20020a056638878c00b004830f1a5aeesm2815909jab.29.2024.04.21.23.53.19
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 23:53:20 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7da37436e36so156918139f.0
        for <linux-tegra@vger.kernel.org>; Sun, 21 Apr 2024 23:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1gykTqP5LNKVTwddnL2ox7+MRS2/WqjtaoFAc9ukpdHlvoz4Mf1h/F8MIBo+v+MnXxa6Guczhe6vW0mr6QkHa8gU1gy2EvT8XnM0=
X-Received: by 2002:a0c:ec88:0:b0:69b:1aec:88fb with SMTP id
 u8-20020a0cec88000000b0069b1aec88fbmr9872064qvo.23.1713768779447; Sun, 21 Apr
 2024 23:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-6-2119e692309c@chromium.org> <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
In-Reply-To: <124e35b3-5b0d-4bd7-848a-5c848b339157@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Apr 2024 14:52:43 +0800
X-Gmail-Original-Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Message-ID: <CANiDSCt34D8-Ys+DbEQM0SyFdBF4WoV5_+xuuCjVbf22kT0xfw@mail.gmail.com>
Subject: Re: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

Thanks for your review

On Sun, 21 Apr 2024 at 07:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 19/04/2024 10:47, Ricardo Ribalda wrote:
> > -     if (irq <= 0) {
> <snip>
> > -             return irq ? irq : -ENXIO;
> > -     }
>
> You're dropping the original intent of the driver author there no ? when
> irq == 0 they want to return -ENXIO.

platform_get_irq() can never return 0.
https://lore.kernel.org/linux-media/cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain/

Let me add that to the commit message.

Thanks!

>
> ---
> bod



-- 
Ricardo Ribalda
