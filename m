Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559891474A5
	for <linux-tegra@vger.kernel.org>; Wed,  4 Sep 2024 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725434975; cv=none; b=X2L01xB4dTwsnNyrt66yqeqpj6IxewcUfdQBAIxQzX/FOZ/NrSWd4u+FlkVT0kbEDm52W3UD7NfwRmK1HoMHbpl2wb7+L9l+B8RR30j0otCumb9S8/NkIS+y5o0naiin7qYpSkcu5f1GRGIYlq1YeI0umzeINFN6ekY0nWhpFMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725434975; c=relaxed/simple;
	bh=pRN7+oax/Nx7fvJN49hPQ3AHM2UQgGliWcqGdCj8pt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezs3MTc83+iDzv+JSZ91EW0DACI86r9CfgXqrsngqFrmbQc+dqKFzomZ2+XIy94qr17276wz1xlpUecPK7wxsFTcDOY5gVPHEAdWXYeOc0Rn2sLDxAQaCEtXy7JyelhP6LuKNUQxXJ5hihJotPri+qGTH3OmDu4aNHBznhzIbiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S5TfISEq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S5TfISEq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3780c8d689aso42795f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Sep 2024 00:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725434972; x=1726039772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxPvC9OW9Ktpk2Avz/xTd0h7tOPJO4rWjfU5sl7IhvM=;
        b=S5TfISEqmL7e+Kidok+UpsJv+8AjsBtWRMKk4n79cFCOtpredeOVZ4z3Oh0Aug4sRD
         EYgyAZLqOA6M9o1Zxsz6OWFs2Cof21XI22GxlQ0fhlgCeCzI37/JwtjZ22BfOxf1yJmV
         b0OarpznTLFi6CKd/CuUtkDO18gDMVuAyCVi3+IQime4thcIFW+vL8Iye4QtCzPTbx9C
         AewB5SmfV7Aie7qZog15WGHyUwuG7Xl8x9awPzN2tVRrcbjCkZ+R9XcyHtWotXcemIc8
         jz/gYHnqsMBsX+l807PSYNOykKJDD7p97kTN3oD3sKSnWRGpZySuA6c1E79BdS6oIPz4
         nWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725434972; x=1726039772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxPvC9OW9Ktpk2Avz/xTd0h7tOPJO4rWjfU5sl7IhvM=;
        b=ngtlQ5K4Bvq0L1DkuFo0msolbHfonM7Wdc9GYkB0cxwzmX7yXlwrNxObdy+LOSTMeV
         mCMM2O5a3+Ol3REOji6t6WTK2qKG6UpHTr60QnjJ2ykXJBY9VsCSsE/WVnsX0DSMSWVf
         nbjWZSrDxH6MMkfPk4HAsuqFoRlUaNLuYopDMV0FSUZ5t88MdzjLWlejnWU96uzhcBUO
         3GbLR4XN7FaJyY8AHYJk2LuDjeVq6cn/I3fXLwVGkvTRWG3LTe5c142iFPeZUhDPUjdB
         NpN3EsTueY0WrTQBzgkbNyNebUYqF//XNG8jrCBNlk3UBxfLQ20ttVFqTsFXZHK2qwvD
         tLOA==
X-Forwarded-Encrypted: i=1; AJvYcCW6vfGZvnH0AYm/QUKlH4Bv5ds01HghJxT33UNr8kJUrEhpBUcw+lPVmQH/r0CKyA8rQKmCf2nX224r2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4Z5zTgpE4zU1Hr7GWrVfsVHnmkp/wSwUWghFmR2UyEHlvOqE
	SC+CIkXCBhFOTRavH14J8VoZcdnHKyFFUUSZ8UdG7/VX7o7yttzmPcn0PMv8l6s=
X-Google-Smtp-Source: AGHT+IHS2N4DM93OxlN4GCTiko29IiTesLd3W6cV51JphfgkdKeiGc8BCj/MKUEwKpW7mkvvyUK9wA==
X-Received: by 2002:a5d:514c:0:b0:374:bdd7:f848 with SMTP id ffacd0b85a97d-376df0055acmr2155949f8f.59.1725434971515;
        Wed, 04 Sep 2024 00:29:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639671dsm232317455e9.5.2024.09.04.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 00:29:31 -0700 (PDT)
Date: Wed, 4 Sep 2024 10:29:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@nvidia.com,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v14 08/10] iommu/arm-smmu-v3: Add in-kernel support for
 NVIDIA Tegra241 (Grace) CMDQV
Message-ID: <38b6ed33-886f-4ec7-9196-1728f1d8c1b3@stanley.mountain>
References: <cover.1724970714.git.nicolinc@nvidia.com>
 <dce50490b2c10b7254fb36aa73ed7ffd812b283a.1724970714.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dce50490b2c10b7254fb36aa73ed7ffd812b283a.1724970714.git.nicolinc@nvidia.com>

I was reviewing Smatch warnings:

    drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c:616 tegra241_cmdqv_init_vintf()
    error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

The problem is that we're calling ida_alloc_max() where max is always zero.

> +static int tegra241_cmdqv_init_vintf(struct tegra241_cmdqv *cmdqv, u16 max_idx,
> +				     struct tegra241_vintf *vintf)
> +{
> +
> +	u16 idx;
> +	int ret;
> +
> +	ret = ida_alloc_max(&cmdqv->vintf_ids, max_idx, GFP_KERNEL);
> +	if (ret < 0)
> +		return ret;
> +	idx = ret;

max_idx is always zero so idx is always zero.

> +
> +	vintf->idx = idx;
> +	vintf->cmdqv = cmdqv;
> +	vintf->base = cmdqv->base + TEGRA241_VINTF(idx);
> +
> +	vintf->lvcmdqs = kcalloc(cmdqv->num_lvcmdqs_per_vintf,
> +				 sizeof(*vintf->lvcmdqs), GFP_KERNEL);
> +	if (!vintf->lvcmdqs) {
> +		ida_free(&cmdqv->vintf_ids, idx);
> +		return -ENOMEM;
> +	}
> +
> +	cmdqv->vintfs[idx] = vintf;

We only use the first element of this array.

> +	return ret;
> +}

We could get rid of the ida_ stuff and change the cmdqv->vintfs[] array to a
pointer.  It would simplify the code.

regards,
dan carpenter

