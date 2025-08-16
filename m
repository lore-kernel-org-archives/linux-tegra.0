Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B162DEA7D;
	Sat, 16 Aug 2025 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755355025; cv=none; b=gH7w7OcwHjf7TIzNcI1vyxw2Bs0G0xQh2otqXYdHfYhVIEshr5tA5Y6zrq2zO32f3RrIJLETHPu5FTH0GbbQa8NJ8K1pV1w5XTo3MHDOflWu6LPBW1rNfTRWJuZu0Rad3zoamtcaQJF29pIdmIF9CXTamJ/C9Xwv6k/q2Z/hYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755355025; c=relaxed/simple;
	bh=RjN4QVjquicEAYrAUjr8pIPXz+RTQcjkbloqRD42w70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I3BJOIukFVa0nAXq4SKU2jvvf2SHDfqqiF68ClbeiGeYvdto0sqOhzYhOmWdN47wtCOrBRjeJe2z/Pdx2iFtFzw/uhmEX83hugDzjj+0ak4lSE5rOc5nvRtE5tPwfbdOCABCufDwQCzXy0TkDjiMm9l87o+yzYLtIs9yAJmLr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mD6Pjsqm; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mD6Pjsqm"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-333f92a69d4so21207991fa.2;
        Sat, 16 Aug 2025 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755355022; x=1755959822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcnY7bKyH0HRgtUBQ1xnHjEnIRmtANVbkGy9/T4atBM=;
        b=mD6Pjsqme+qxEL2tVPk/cayr0e0nN33yDSEEHqfNHVmJB0PODEhEeMb2+l9Uz2Ysif
         K4TFEyDYFe0p7VOc0pX/C9U9+xUcBVdTBR7LLLjl24x7IE5kTDs9LdJcDegvza9OBCdx
         38lpT3hMtU+XrZsKbq8t8LA+wXNSI2JsXGwJdNAROjQjw6cT/T7As67CdOub7yK79gZ8
         EjsQpPHw41vcQF/Tv7wqla7xGfEkxJxKoDIMhPCVmNGbB20pfr3lAIwobLsHXzRs9FTi
         uDM4UolzJKYgt0lbf4ql7jtdM3z2NNuWnb7IkBuroi9b2GyeaUlPRCQotqic1PClsqLC
         9ZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755355022; x=1755959822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcnY7bKyH0HRgtUBQ1xnHjEnIRmtANVbkGy9/T4atBM=;
        b=IDPlRryzpNF/w/s+FYCQpx0enXloQ19Ftz9wY2VAvTuratFpBayfHPiw99K2/zw5gU
         nHhDZdrITgbd/ErRp+5xqvPuxa4NzsfbkR2muwiuDAIgxP+6S3ixFMpSKZo3I2sGOg7d
         DOivXrbW2oHXtWDgnfgNQB8Gd1e6hGAyZTMcrEq1S5dwf1BkvGoSwPi0/Qs1e79Mp1Co
         p7ZXPNG/Kc0NX+1ZMEHmEWkQZfTHHfnCDS0bKQdHeiZomR+yT7pArMdCZ5xPHNA3uTl8
         tVU4SJuax9FRZYqFOGA8cjYbS4k+TS59HqdXirHmcaNlUk+Yj8KL8VaIjcTRR4JpThoo
         3C3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4kk8YhsoMolrhtExHVIkIEXtIfMhSwRhniUCWPFVJDByTUZoY1/RU5xwETQ1wcB/YNBNrvrZoD3qXib2P@vger.kernel.org, AJvYcCUGxT3JXdb2Kwv+xAAEC8NS6R1J1wJHr8aHFiohZz7vExC2yksyxRgwpqE5Jwe51rCwS8GufqLmI4Dv@vger.kernel.org, AJvYcCUIlY5z7jd7BUaUrLiw9fiB1v5oPKt0Ru/FPFVwReB7b9vta7j2ublwdWLC6WBNjQOIcZn8bee12PSk7MM=@vger.kernel.org, AJvYcCUm7z/G9bvoN0zcTc70SowfeARi+ppBBsegwLwevGMAAcNg1jHXIAzUTvq9lvnkpmt7dT/Du2oMiZfZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzz/KTuY0zcxenzDMs4L79wQ5huLUpPtjsI97zBvGe2tG/x9HP
	c1DRogvZkqT9ZdPG10OUCetc0bzPv/eCnVBwR+vyQox+O6k6LuUpTa7T
X-Gm-Gg: ASbGncsb+tfukcLTNyar4s5XEkU92xDYiUXKSC1ZcbOniCHuRkSO60Q4ksdG2Msb3a0
	OFQaYIirQ22Am84tZVGFcNlxPAAXwetlbIAUCyGL3LbR+aC2DR1zoQgz1/1uuexHW2YGtyaXOyc
	wFsbxpMGe3mgUIKn9kBNP9c6cHfa6KiOvjW/EdwVb81hCV8+8fMwciC31qwtC9879op36i9Fesu
	A6twFbI/2PDPJsyPrWoS47CApD/IF+U3nIVcUqnuIjS08tgdNF6xTNK0qqmBIP3Hzu1HGgrcy5f
	eBV/kgFnqwX+oFf0NPQTeNH3XuzexZjg+LcC07zNKv5uA2y5mNVGV7kG7RoAzrM/MVALKQxwb/P
	8oFaKrtL8bT1Bz/e4eYK9jmEP0aEwab2vqTPAlLrr14UgcoKFipUKNEGqdQKAYw==
X-Google-Smtp-Source: AGHT+IE4k/iMe+Rm9RA0iN191EI9xn/ofj5LgLs+Sdk7/lrkrwQ3CSU1gIuS9Ybyz5OPre4cVGIQ4Q==
X-Received: by 2002:a2e:a588:0:b0:332:51ee:237d with SMTP id 38308e7fff4ca-33409841f80mr13479911fa.12.1755355021589;
        Sat, 16 Aug 2025 07:37:01 -0700 (PDT)
Received: from [192.168.2.19] (109-252-159-193.dynamic.spd-mgts.ru. [109.252.159.193])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3340a604c1dsm10279661fa.43.2025.08.16.07.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 07:37:01 -0700 (PDT)
Message-ID: <83755868-09b3-4bd1-8b40-0a4b9f497d2f@gmail.com>
Date: Sat, 16 Aug 2025 17:36:58 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-4-clamor95@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20250717142139.57621-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

17.07.2025 17:21, Svyatoslav Ryhel пишет:
> @@ -525,6 +599,14 @@ static int tegra_mipi_probe(struct platform_device *pdev)
>  		return PTR_ERR(mipi->clk);
>  	}
>  
> +	if (mipi->soc->dsi_v0) {
> +		mipi->csi_clk = devm_clk_get_prepared(&pdev->dev, "csi");
> +		if (IS_ERR(mipi->csi_clk)) {

Doesn't look like the clock needs to be prepared. Normally, you would
need to have clock prepared if clock is enabled/disabled from a context
that can't sleep, like under spinlock or in IRQ handler. AFAICT, this
not the case here.

