Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF41E7C34
	for <linux-tegra@vger.kernel.org>; Mon, 21 Oct 2024 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515547; cv=none; b=t6B+hG3rsEMrw5sefJJHTtEfmIdLpF+QjoSki7Pia3zbCaelu5KFzfxz5WVBqYLf3pewiZFIV7I2M/xCYcn6sO7SUx0zYLCOTFGoIZnQ7Roms1pq1JNqUzk68B6NFy3HAK61X9N46rHfbeKI0yErIKi8vtCBWq2/59oODQxFD/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515547; c=relaxed/simple;
	bh=Ful+eYGSLEJiuKl15RuxYnSWt8hA3Fq+MazMe/0ofsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WTEjrPNxra4Wqv7Ir8Grmkj+UcRKRok73eKFec9GwNUwrYsYbaBYLMiNshL37WwifN2Fssa2iuo0tUgzsCl/F5zNQ0KZPB5J5K2LZ3CiVgnXAJpOrEP2e9POeKsL3vLgcO7HX+iE0SFsTzkRXi9ub+aGEwVqtKTM1Zij7V0OAPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gOuO+jG0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOuO+jG0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315abed18aso41010905e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 21 Oct 2024 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729515544; x=1730120344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cd7/pLYdEIk02a5YA0EypwGvSVgaUSYxbjpovDPFTI8=;
        b=gOuO+jG0BSFqvaYmXPWi7HB9Ni4OqCyGw+VtBlt7M7O6keNaCMdaPqQjfJI6uSDkV7
         yENg8VX4yDm7xWoXojDiwe8MKYcakxRXqIL0Xq79mYlEvj0KKLmjQo2FDOGZ5pbuTsRg
         PW3gZWSWKTF7iGbREFp8bnXixsFkM2whtPjmlPJ0/1/vU/jm70O2UtSBlF8XgG/3CO+e
         ybMtuI7f03InL76T5i53nbQLcY5lzhUEpwpz1vcfMjQZij1cyOco7SZ3nHmwnAejvzVh
         ZSSF8MSLTL/wwlL0w79b4tOQgQWDm67YHU3/5iKs73QGJhQ9yYDpaXDNfEcfbk4W1GZc
         5q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515544; x=1730120344;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cd7/pLYdEIk02a5YA0EypwGvSVgaUSYxbjpovDPFTI8=;
        b=Kq4r5i4Y9wT0hZewr5aOMzNV+rZAbKHZHKEuWxluRvC+smW3eEfsrB4/DdiqeJFZJc
         jdLY54MZOPBgRsnWHGuQx+X2mAMaNyLBWidQQMhdaHUNBMEMVc1CmlG0RSwu2pKu6RS1
         vLmCW4FuCLcI8W6uHkl3Eqhfp16XCfD026mCzCcSe2JC61gTm7mmiEI6ntyN+LAJ8qpS
         xGWG49tuatgCtSrxn6NbrZv73C/udrEhMWQMPpbVk06D9boFnTFv3xOglubtUILi+af3
         rmWqbc+HZyMMVtIcWYJO5Thnr2CinQYxQqT4J4WpED8vKaYpSrfoVnxTZtDn1ssqgN8B
         vk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvP/lBCjcCl/EUSdcvnAATbIk3leANo3ZSQycyqOH4j5moOeeXWP4eRHP7sBbWEsmnsMVEbjkUxT8TYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZbKx/3fGUfygP0p6o+jE9FHhPNr6NAaRIogOlrLbY3Q+yaF6
	Gf+ngO7WEZnjiooH0+KK5YHE0s4ki0rJGz14lJSoECnW1+y6dCVj59zP8dhSAhM=
X-Google-Smtp-Source: AGHT+IF/OA0ZsLmf5IvgnydhzYx42zQz0S9kryQZSwGJzTd/oVTKmRf3DpJkNqtQaRd1P6fFtU6Sgw==
X-Received: by 2002:a05:600c:3849:b0:431:52a3:d9ea with SMTP id 5b1f17b1804b1-431615b9cb1mr89143965e9.0.1729515543677;
        Mon, 21 Oct 2024 05:59:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:59:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Liao Chen <liaochen4@huawei.com>
Cc: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
 linus.walleij@linaro.org, thierry.reding@gmail.com, mperttunen@nvidia.com, 
 jonathanh@nvidia.com, Simona Vetter <simona.vetter@ffwll.ch>
In-Reply-To: <20240902113320.903147-1-liaochen4@huawei.com>
References: <20240902113320.903147-1-liaochen4@huawei.com>
Subject: Re: (subset) [PATCH -next 0/3] drm: Enable module autoloading
Message-Id: <172951554268.1240386.11009989976782146121.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 02 Sep 2024 11:33:17 +0000, Liao Chen wrote:
> This patch enables the autoloading feature of drm module. By registering
> MDT, the kernel is allowed to automatically bind modules to devices that
> match the specified compatible strings.
> 
> 
> Liao Chen (3):
>   drm/bridge: it6505: Enable module autoloading
>   drm/tegra: Enable module autoloading
>   drm/mcde: Enable module autoloading
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/bridge: it6505: Enable module autoloading
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d9c12481f980bdad9cf6fdb742e49c5b50622795

-- 
Neil

