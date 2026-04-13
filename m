Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885C226863
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 05:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776057712; cv=none; b=jcTa3YNUN20aHRiwj5oErxFxEqWLvfpBs9rRThpIiXS+LoFPpDnf7k/mtSCccNeYVGE9cboSK/yfoxN4ZA8lV2pS+wO8Oit7Q4BmMF+rS68JqfDn8kOQepeseHgV5j0tZJ7rRXDsxV26qVYSFJwBC1uPrSvkthcsx886nL8y8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776057712; c=relaxed/simple;
	bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=F7BR3iAzouxsKRKvNy2s+sFa+melYtwxmQfvxkneDE/u/RtF0OYAQE7txZDbQC0OYGANRm7VzYqDoonBZwSu2YxhdCaz3y8x9+VlYSukESy7d+hJzUq8v5+zq4idAk0FkNlYMXppGNag0QRhMJcFByY0oVTu8xvRgKAcOkep/oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vzf3yRKl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vzf3yRKl"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b97f9587e6eso524407166b.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 22:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776057709; x=1776662509; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
        b=Vzf3yRKl1dNH2SWpkE4OxEpXLzCNo3Gs+xohtuS0xBNFb2344mFHKG4rSdrHOVFFfu
         CoQnsw6CGroWOh12xaOfmf3y5NXEIAZuIsiGQ5N7ckJf3E2MRxygQF/VOjcdcpjlJGcs
         MxQT3NsFkL9ZBKEvRrKky563KOJ2K7FGydWX69RVKmaIjt+5y82kfyLHy+pQs5aFZLmp
         zDaxGbXW2iIq3G3fIBE36/FBJ86enmNPcLunFJ80I04lerh97E+rdGH3otuUxoyJXrEi
         /i5zO+aoaVJlgBZ5fJsPeWTt73A1BIaalrZXsMbvFgFZUjL/sOY2N1sAcpW87kIbbcF5
         wNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776057709; x=1776662509;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbcdWUz+LzlC5UIGJNd7kkF95ZZIl4IOCm0ByFtZut8=;
        b=CEF4IWa+eij4+SbiqqwEtUn7sC2ht/i4FTF/k0k0aFIbXrGi+QtfQe/lq++b9A1AxQ
         HVe5VyEJdqHsUHS4kTurYNGgQZOOkPSSAGJBNFn+XByn7biHfhm+p/gV8Q6R1jFWq4AQ
         D+8HXRoqTtRmhQavzDUYgBL+zeoIvAFPs6VP8B55tNLkjWl1WLwersW2i+W4OHYid96o
         XXkzAyIEZ48l3jCHJaRxPRgM7slnCW07nEK6612LkyXE3JuqyBjq0fBzst72bhhSEVA0
         /pFstrrLLicHXsN03PUNhmX2jg2BG2Nb1BCBQJW2I0Xk7/deFDYwjbhluwqeC1yMvko6
         Z6ww==
X-Forwarded-Encrypted: i=1; AFNElJ+PulsUs6KhfR06lm3ycPugdsgP3M/cISjmH/pTrtfdKU7DCrcAK7jGIBvSsjhOCuzFqSBfOyk18+uuHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyclBsv1ukEpGJUXvbVVTewy8xxUnw0eliDy+zpvJSnRZavzMKI
	zEuohO+J6lWIKWzBvG7q3pMG1tweCs/UkmohthmB1naYHKxsnbqA4Jg2
X-Gm-Gg: AeBDieugeKoo+Z6bspzFDhb3vnJqAhyEVxayuYd6uiKCipCPgFdaY+YU7TDL5dNACIY
	QbPHo8+VoKQrboMRSyJ+kh4G50t0o04ymJzarav1aHyk0RWHdPJWpOSxblvuA3m9vmxvRw0HdDV
	oKrIT3VTA+jw6gJ0qd0DG3bMXBwBMVOXDuoKok6fPVIUtKD82yHf0UDHcrkxg4RG8Eg3gEMHpZq
	jMShq6YASjQbnJQG9q8FOqs2XdyOlHnjwCh4ixi/IumgrQflw2qEIjc+NLTyxEp14q1QrM4AXIT
	sK7N/Dzcnv2mq8yL6jAQOu7xxNhivch1Cl9PbtH58Yl7tqtx+kAwBUKMI1G5kHIH2FyR5kmVLB/
	6tSybrRYn/oD/c9uqyORXw9zxMNCq5mt8pB7Zm5+xShaaFT2knv+kANiK/owUET4YjOIVrpZiI8
	XSLsv5Hf7RT3wT7dxtT2Smv25YjWsdxpuURzF21of6BybtV/geGCe04YCBAnrNh9tMsyegFBH+y
	6+SB++7/W+uCRalWeprK5SoGEvqYrDvnutvVsnoh6Dz3GVlZxP0ztlEzLL4IQ==
X-Received: by 2002:a17:907:7251:b0:b9d:eeb9:b992 with SMTP id a640c23a62f3a-b9deeb9b9eemr68012066b.23.1776057709077;
        Sun, 12 Apr 2026 22:21:49 -0700 (PDT)
Received: from ahossu.localdomain ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671505caa61sm629377a12.14.2026.04.12.22.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:21:47 -0700 (PDT)
Message-ID: <69dc7d6b.a70a0220.2403d.c1ad@mx.google.com>
Date: Sun, 12 Apr 2026 22:21:47 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] staging: media: tegra-video: add NULL checks for of_device_get_match_data()
In-Reply-To: <20260412205057.386856-1-hossu.alexandru@gmail.com>
References: <20260412205057.386856-1-hossu.alexandru@gmail.com>

On Mon, Apr 13, 2026 at 05:07 AM, Mikko Perttunen wrote:
> These devices are only probed through device tree, so we know the
> returned pointer is always non-NULL. Typically we don't check in such
> cases.

Thanks for the explanation, will drop this patch.

Alexandru
