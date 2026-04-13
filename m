Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F73932CE
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065234; cv=none; b=tVUnxV3I4eppF8pKUGIqQKiq+7nMKpwweH3Og4/AkFANqAGPnI7pzCHQ5jU1F0Sl7D23Qs/YhOZoR7P5pqU2fzKh585RC5jPbXVLHMYlYZ2poqAIVGgGUrEmM0oT+V2qWIaYkpqtGFhJmCioAhAu5I5xTilWVy8c1yEuBiJSnrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065234; c=relaxed/simple;
	bh=TMX0GVYUcC/4pa4IA0Xg1yJG8EYpQyDgj0o91746WJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTlxUKP42mS9WBRtpMog9Dfn3lR4Cr+0oiE4mxFyFqgZ521NW2cVqEPO9L+entsr7KRyFIPD2xz730//mr0yEdO8jUX4c9NfQUAPutjEWOAia321JUU5LchKFQu3uXl+MZdVSCiH/Gy/nrYkXhzRIAr1RfZsGPVZKSZcZCzdm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odHyLPlB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odHyLPlB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a041eae5so29029275e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065231; x=1776670031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vB8fTOutsfZIie2qCEI929IdjXgTwcdUZphinUXaVGs=;
        b=odHyLPlBEcIBHkOx3uUBySRtigfT6eq5C7VXwuAGaxfu78t173EIFl2Z3QocvwqGDA
         i+H3UFgRmGexfz6KhKj+r6Xf4N0Cx3oVnCtY1T0OqDk5foPObshX36kAwtdco/b35PiR
         BJYDgR7Zfz+rZRV6kQYpe/nH+RUa7fgVnUybgys3QOgz+3Q4WOo7mJKM19Kfoh1T2Dxt
         ohHux8bSWp6G+vgkuXE1P/+oqxJnfLsWOu4BcfKdxKKL06Du3t+mkc/+sfyXAOKOFQT/
         RRFImocuKQA4fEgqiVCviIV5rVR8EKNyQLDO8yMRoBLP6qT2UnbgwD4MTHLVYSQk6oL/
         +6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065231; x=1776670031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB8fTOutsfZIie2qCEI929IdjXgTwcdUZphinUXaVGs=;
        b=REsW1nnAixbVKrbPU5cPktLKNyoVshbUjc+LWqVMURvBJ2FXWdE0c5I2PEqHGoPfDw
         VxZrBZcXzmZiLcoHeCUC3LLkFg4qG/97LLtrWiXM7q5DXj1ReXznJH843yYvMKjQiWwl
         aD+RalfrzfTYSw3eblKlU1eO4sbgP7gk1YDiDYY7JUEUzLU4hPOaolxjfuVXJKHiwzZO
         Hglkt6Hz5UsQKT1RZ0Nb+vJPnvTkKBKV11W2KeVpxgh8pLM31/nerMq4DeZQVroOVPHw
         OhrdTEDkdBpPbbCPVtNshUtBsdTBv9CE7eQLZBSmjsjEIPTwxphuIaxvoS/jHNZwMtSy
         S5ng==
X-Forwarded-Encrypted: i=1; AFNElJ+hDglbzUHFCcmBCO0R28sQ/Vz2+pf4kUIB0fyl6r0jhMHYHw1ExnTVxNEoTF0kqLTSUGzoGUTXpFzX2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7T3Sn8ZIlKmUtyX+4NSI0HJT/TNKbTOTmPGU5MJKO2cocXo6
	Idj2Pto2Wg3IPWtndgpYiITAoR2LOUZzLW4UrOCf17XyGeIxLvOfj/ex
X-Gm-Gg: AeBDietIFLk3LUpdNOtZKQLORNxLAcbTSHfF/WqEJZ6PgQ46epZOXC3/9XZb3Zd1TZy
	hwK6tZbf4HGXaAWAQbmHiQefqLdJM05+6jCLx7B6Fs/q13iqQ0lV4j6iF7tFJbQT1Hxr2kaJJH3
	5BX7PVAenTK7dlsCysWuCKSUye2WobzutVQQvxF8Ikaj7hdtTQz0CSLAkC5qaSRtpk0Ia1qB5PK
	WRa3ODXiU41Hi041sNzF7xjteqeEZ13dJuZHtGdndxgM+OkPYq1/7kMkkoP34V4xNwAeVf9Tcos
	QYM/2vPDMBfVnZt/gbmNgy765p0gqoCN9YT5d1M1RKI7ZWtPhh1PkGBG4LMupKLMQnFOBb83H+Q
	1A6xKXJ7TdxthBTAF5UrmAr8NYHPbzZT6WCxHGlCeAYp3+IdpvS9XrTwONQmiOMHAzREAw/c3+k
	ngSNFaPmc1MmomOW0fnnQ=
X-Received: by 2002:a05:6000:1447:b0:43c:fdd9:1890 with SMTP id ffacd0b85a97d-43d642c999dmr16766155f8f.51.1776065231364;
        Mon, 13 Apr 2026 00:27:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm12208844f8f.25.2026.04.13.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:27:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:27:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: tegra-video: fix wrong return type
 in tegra_get_format_fourcc_by_idx()
Message-ID: <adyaymJVZV63WzQ3@stanley.mountain>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>

On Sat, Apr 11, 2026 at 11:10:04PM +0200, Alexandru Hossu wrote:
> The function is declared to return u32, but returns -EINVAL on the error
> path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
> which is an invalid V4L2 pixel format value.
> 
> The caller tegra_channel_enum_format() assigns this garbage value directly
> to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
> giving applications a silently wrong format descriptor instead of an error.
> 
> Fix this by changing the return type to int and propagating the error
> correctly in the caller.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

Do you think you could analyse this to see if it's a real bug or not.
If it is then give it a Fixes tag.

regards,
dan carpenter

