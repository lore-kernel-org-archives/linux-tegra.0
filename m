Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A6332616
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777395020; cv=none; b=kD2jTAta7GY/v7Jkm/3PAQYTrLP3rU3QHfZzC3FjT3rwXOyDiphV8iXAccASvR4g9Ii1irZPeZ7hnK8FksGyeAAcORbmXzIEOk4LLVxmGjS6hU0nUh4vnLiikd7iYqbwF9fchbQzGLH03R6qRwjOFCwrrXwgjtWuIs13O9mmxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777395020; c=relaxed/simple;
	bh=uwCaXAikQcwcWv49E99orU1oLyDZe+ymr3yfkSGbxFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MttQ04vuYHjDmm0hiNHOIYoeDy7pppfESVmAuoipdMHpTFF0luPwCqN3swP01JiAYzmikIfEP7b/FR+bPeb4GMGKQzV+YTowasMf/2tDERX9KJdmmXPGsFxHg6ezZ40H+Q+RqKcaGtnh1VxS3ONNZTLZBBKDv61fd6GXY+08Yjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8wtr39j; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8wtr39j"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-446fea16729so599692f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395017; x=1777999817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0P4jgSiiU7B+JwVmDaMNH4bNWiyKiRU0eieadFucCgk=;
        b=U8wtr39jAnFGL7Y1BGwDF+6Rn7ijanX7xV5tDsa3rX++79fVLVtCgY4ajVAwpKk/7N
         oJ5sDrI8eZ0tnONjGafiumFVSE9mw0mDWY+ytpdIyvaEjstB0m9kZ1tk11kO25wVjkHN
         ESzkerozCTZ4s95970TJQRkOo944TLKVG1fPA05ljatkmXJvBfJ2mt/Jd/9wGlodio2V
         wPO2hiLEGI2MF1lOkLGUTV6ljWonEASwDZR2SHuu5y/eeGQlfkEoej89IkVGrJmCrZi6
         dpiL1aubT7KOjj6RbRKRqufEQ6WiqIcw5MqW6aMfuxjxRMpFZA/oeNdHOEDPLzIC+K/l
         TOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395017; x=1777999817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0P4jgSiiU7B+JwVmDaMNH4bNWiyKiRU0eieadFucCgk=;
        b=boGGS8fvvVUUmKKG4pRVFhkMFPIrO+vsirDCORCmtVW/JTxY6SBHjanlCbxmgU3xw+
         aS7flTMNpu+i03G/+LmKSLGpjOHDLzz0RleCNwVoovSys6nKIPouLm6hzOdy2T+hKoMc
         HxGmMU5i2c4QPmDJZaT7d2SWmFzxZTIiod45vWW5AsJ3JwEyAhxMk3mrT29Xh/gBOajQ
         X2aX81HqsUgQmZH1sv3z6E5dqdWftfM3bWwG9+gIDa1jLLgSPh10lFtySF8Y52rqDixe
         keuNxgbnSVgsGP7WuihioYXCuVG5wek9vP3oOzeBHoerQR5507/1BOWHhHk2dMe/+9g6
         1wSw==
X-Forwarded-Encrypted: i=1; AFNElJ9cy1Owqxqfwa+WgpkeokEsB30zmDbdcycjJVH7/ehZIVpZhCRunYrXgIwEyd+0eEEoi1F4dTnFZwFS+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xTkZciIFEnV8PevN5hpnEhbsg0hWLlxhR82Gm52J92+kS5mU
	dEFwLk5rXtw3EL12o+ar5SCUK5KerCIYvfRRRuXcy+yrXpetYw4s9QWc
X-Gm-Gg: AeBDiet4B3Q74bUBCmewxfkP1WHdO6x+hogh1kmO+zRYeUlLcH/lkluo4J7nNPtB7zZ
	5Ve1DwBrBNAznuoXkn6TG1vys7NuKXxpzAyUY0Go90x2cQDHI5qZhrYENaEvFTNS/Iw7IwrUjoj
	mN7t64BehdWbzA69AoRTm/YjsJkoY41ur7ktUlEjW66NHCyS59DqPDek3qx0eCPQlM/SeFs+NMY
	99lRfiminCbjDlNv/Rr8mBaQFS0OPjoesWizkE0tCHn8D6z9eeEyZWNEK2LhQzGt1/OQKRiFY8I
	royZ+4+KMuNBRGkY95Z/IqiMB2vFhq9lI+3cwB9EHiKq7FIFT4c5bwBm4lHXQkbmpRyC0iK/YwH
	c2IC/j+ipgvrq3eurYNbuFau/d+2olaflxLX6bIld2XdOaKxrD68ZcUuXuEghBG+pCNzdah5yt7
	8HGg7W7eBfFQph9p9sdZKdbWDt79Pf3A==
X-Received: by 2002:a5d:64e3:0:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-4464839c806mr6321421f8f.9.1777395017132;
        Tue, 28 Apr 2026 09:50:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59ebasm7590675f8f.8.2026.04.28.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:50:16 -0700 (PDT)
Date: Tue, 28 Apr 2026 19:50:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mhanna112-code <marchanna111@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@kernel.org, jonathanh@nvidia.com,
	skomatineni@nvidia.com, luca.ceresoli@bootlin.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: tegra-video: Fix function argument alignment
Message-ID: <afDlRSGwmZgjJadh@stanley.mountain>
References: <20260428154022.6997-1-marchanna111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428154022.6997-1-marchanna111@gmail.com>

On Tue, Apr 28, 2026 at 10:40:22AM -0500, Mhanna112-code wrote:
                                          ^^^^^^^^^^^^^^
Your from header needs to be fixed.

> Separate long function calls into multiple lines to comply with kernel formatting style.
> 
> This fixes the following checkpatch warnings:
> 
> CHECK: Alignment should match open parenthesis
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This isn't what the patch does.

> 
> Signed-off-by: Marc Hanna <marchanna111@gmail.com>

regards,
dan carpenter

