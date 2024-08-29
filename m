Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF451A01CA;
	Thu, 29 Aug 2024 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946244; cv=none; b=FR3YO2jQ/nkH0Po7xjSZRvGhNuIqlAdPeVUf/rhUO/kWEfkavUFn/oyyXXZc8F26BLubBBSDyBUMG8zFHRl7XLLo5bfdrJ6EakZaIQgFVrgny9Y7HINXbDYfVssQhIQ9dBRMRvdusliCyvYKNgDuB/l95nc7M0VWppcLebcxH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946244; c=relaxed/simple;
	bh=zJMcWE6m2aVp27jVSzAWAxoAmkOiXF9cPAf/sW+wsII=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Npct9cmz6aknepMHKW0Wx1IcFJZxIl9/5FtzZCmrYlFAgu0Mp5ryPnF30IStExHCxg8GYpByMYLaYYlbZF6xsexwt3VUYCieZRinw+MqBJd4tDUxh8H73iY0YYlaoFSRlRvHea1D9XuxPZFyg9jjlyCmibHRX2d7LHAs7A7IK+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaQ+0t27; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaQ+0t27"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428101fa30aso7613455e9.3;
        Thu, 29 Aug 2024 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946242; x=1725551042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cICNfAYxuHlGoBLMmySe2jZdtkeuZEM13jDTfWpAGak=;
        b=CaQ+0t27FuT1tZ0SrihrmVNpF0SJYN8zE0pQk3KT9RoRLJIBba7CpxFeIU4wb5RQuL
         I7Lw5iRcRyriof1hwNtzltuSneW/FREfHTtpfCsGhNDlItHFba0dwP/+9KumdE++/99c
         xl17IQn4eCosc31SJ+4oKDFN6ReVxiwCFGAGoVZwlE78QXYsziuZSJdbo27dAcbqRJle
         F9+i1tepsewh4/0GHeuCj345zmb1tmifhCA6myGjguf8W/697WBEEGWywcTbGvqok0df
         yJKAQLMC2iso7zzvs78QlhfgJmStQrZsC3mOk0TDRZzpzkKad+Sfmc2edRCrjPFHKe6x
         YhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946242; x=1725551042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cICNfAYxuHlGoBLMmySe2jZdtkeuZEM13jDTfWpAGak=;
        b=ryXbV1vMOhgq9IPFK2jajtpFGIWUzmsD6ziKA7RH23IgzDeu3ZDo6Tpytqq/ctqlpg
         su3RORW+J7fSdUHV0csOjo/3ybbKQN39sZ/cebn29OzlMe3ihL4u+9VXCiu3f0Rrfacu
         cANGBQ0QOTqL9XdjlcAoOQ8ah4zUuOZUohmKQeIFu4iyE2l2hNXqZUZxNpudrDhd/TVG
         YTm1Rz/VoqsOPnwcNuTywmStSjE1Qi6KKbPs0XpLytdYiZWmXiqCWbLSzESaxCRvYi5f
         KcvhR6WL52w9t5I31qwcz6zTs4ECUualuYQ/ArbHDELVO8LhmIu4r3adden9aW0EEPuq
         4MNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH9SLrUEfMo5gocta1yv3EzRbUflFRje91f/3ZvPax/px/ypgVAWVLwdCuXZccqaIeG7XDCbSqXV9UB9k=@vger.kernel.org, AJvYcCVOY0TN7yCgdM2dY24tnkm95Ndrb5QTVgOhkqkpxB90gPEOHGVCMD+CvDEu4+dwweRz+/HmpBfGK2hm6hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN86/AJLNV1oM6Ifrn89mVYTwtlQ4ILa08PIg7Ir0vaPQzgqeT
	OuqCO/PSo3hYg7gxDDGprvHsoQuDE5FAJKEIkWodFwzMZS+i0xvT
X-Google-Smtp-Source: AGHT+IGcAdGlG49gRrkCbVOqaBayd5DteBon3uD6YJo6Kzq7DSTeVYyMPSJNW2iUjczaglkr/owaTw==
X-Received: by 2002:adf:fb4f:0:b0:368:7f4f:9ead with SMTP id ffacd0b85a97d-3749b531648mr2529192f8f.7.1724946241199;
        Thu, 29 Aug 2024 08:44:01 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4d391sm1728239f8f.3.2024.08.29.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:44:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: andrew@lunn.ch,
	sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com,
	herve.codina@bootlin.com,
	qiang.zhao@nxp.com,
	christophe.leroy@csgroup.eu,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	nm@ti.com,
	ssantosh@kernel.org,
	petlozup@nvidia.com,
	pshete@nvidia.com,
	christophe.jaillet@wanadoo.fr,
	ulf.hansson@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	krzk@kernel.org,
	jic23@kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH -next 0/8] soc: Simplify with scoped for each OF child loop and dev_err_probe()
Date: Thu, 29 Aug 2024 17:43:59 +0200
Message-ID: <172494623252.1306218.1886935295305888202.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 27 Aug 2024 19:45:59 +0800, Jinjie Ruan wrote:
> Use for_each_child_of_node_scoped() to simplify code.
> 
> Jinjie Ruan (8):
>   soc: fsl: cpm1: Simplify with scoped for each OF child loop
>   soc: fsl: cpm1: Simplify with dev_err_probe()
>   soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
>   soc: fsl: cpm1: qmc: Simplify with dev_err_probe()
>   soc/tegra: pmc: Simplify with scoped for each OF child loop
>   soc: dove: Simplify with scoped for each OF child loop
>   soc: ti: knav_dma: Simplify with scoped for each OF child loop
>   soc: ti: knav_qmss_queue: Simplify with scoped for each OF child loop
> 
> [...]

Applied, thanks!

[5/8] soc/tegra: pmc: Simplify with scoped for each OF child loop
      commit: 4d57a840560c3ff04fed07a06b3aec7cbac4bff0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
