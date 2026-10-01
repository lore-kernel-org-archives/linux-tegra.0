Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F693FCB2C
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852168; cv=none; b=q/hWuUbr/l+yw+cpt+pvqJxkwtPUzd6s8XSay5MC+fmCVP8veo97Y5AVBhM1Xc6eydRC8MILuLygGXysY8Q25mrfddUeYrBwkSvc+ZIW5eQ0sm+7YvwKBNfmVkH7k35dq4MhvFM4ivJoZp3NLlMeOhSmA1zUOmr9tFk5Teu4M3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852168; c=relaxed/simple;
	bh=5lz9a2eR7DX2zBjwG63Iv0aXfgNn41kdLdOuaCzbroI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/eAHO9c8Bev8rDWwk7ovzIrtw6Zcfdn+9rzWUsLhf6Sxf33VtXbtxzQupzqVnbibZ6XL0ztScpVewZ3XD1m0iCdPujRw0BdQXvk2lvxWkNZbb3GRCS/sUyUBOGtIzIjJ/0P/zZ95nNqSAdhK48EA1SQy+ZLFXxizN4bw71boXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMDyAjgb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMDyAjgb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48870973bddso212886f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 01 Oct 2026 03:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790852165; x=1791456965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5iTgZ1YN02O/klBS6DhkVQTUmyd0nDZjkXixmV+qwqo=;
        b=fMDyAjgb3p/3ypjPCYxB41N1Ua0ctAOIoJrOtrJm4p701o5VX+jITqYo3zyJ05D5Ji
         IQ8eKIqfpxftBkpy6pBIPGVGof60rU+HuuVKQAgT2jHJIkbFXPaWoxHZ7zc2fwiYtTKv
         1Xq5/KyNc3HlbDa18hqkykADKxV7t8SVbqFgF6EuPOAxzze+3SmADvAMbNd+Ub2nVuAm
         s9oJySKdv52idit1rhAqqbDPGJiJh6SKM9XmbUX1JFTzlAwCsm8ZofxdOgzqqsJ5SoTX
         tIONRipWZHNtEvJYxoixbomIIHEOyeTXGrLQfOma7v5o7hqFgvGSDa8s8gG7k4uwOQ9z
         bNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852165; x=1791456965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5iTgZ1YN02O/klBS6DhkVQTUmyd0nDZjkXixmV+qwqo=;
        b=Yg+qKD+vBFPWB58LWvJAxUSSzl57SWKp/gNvphSnUtg1KM1WKBTBvkTvxZjetdfsxt
         MSkN2eKC9xJUtsuHicKs1S4gTCKZvEm30bd5MTXw7L1ezMYYJOnmWiYkPb1RuPBAVV61
         KsoR6peQplRoBJ26TrZ/uq4S8FqrHwPD4qAnWH+E9uDm1TM/Sh5lgQnv375Hhnqx8yXO
         noQkZ0BWYHy4IBi6t61QAKQJmLB2U76HPYsMwcLGd0UBsqlKnwIBJ5F+CrVbzDCtOarB
         tOc7p9lA1wkTP++ZVongDz97/eTcOfRVdc3vcI0r+BKWDKZuXoBoAtXIbSmyGMDwhyxz
         xBZA==
X-Forwarded-Encrypted: i=1; AKwUvBxgjfqGiLD4M9N7QNQKjiCI2ZXobo5W7MfmfEoaIvyvBJ7yQflYXXJus1I0GnFcZU1MQGrFcbUH2V5lZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLJefIDydESeRpxbF1QPvaOP4mdL2TwRqR43BBFImcVzPjd0Ff1
	VG8zd5WP1SZ7KrAxiPayZE+NME0/WS43/TKTHuWPVdIIz43akXwZxoU4
X-Gm-Gg: AYBFou2ngrnDPcwPm8UfQJotQkCbJMiYyc2gsmji+s1WnyJHllSKKcY6KtbpVs6cIAO
	IFEk0HxsGqiLYHvDOtdTrobIyP4r+v3xF703pFCYf21MftObJ7vLzJb6XFVHrh9HJXZdDuTaV6E
	8KAfPJTGo0vADFdNRkBNGLk6sXgxhOkDJUMW9AQjDVR0yAbTvjrz8ZkP/bwHUDuudwPNxsoJx1j
	zZTPLcydE0dz8XAROkYag1FOi/33Df9MlKZ5OU3CQQk2ey5zwKyvAjMe/AZO1XB0nN8+2FhFHud
	aTV2uRV3ZcmiMQEsAwCatC08vj1wd8cAgdqpcqYw06KYFpbkSUhbCM9024gy5SL2bVniJR8Aawf
	WpXJ9ny1iIQTIUHWY+W4NPa4PkTpMC0RVOR1QZPUHnL53ZkPSPXjDKxBhzE+M64W9PgOyp/BPlB
	8OXyYCXf7MPvBg7RGhOJp7BHFXdpw0YxjYOgB+X8t6snQdt3APdMHjQbXDNsKtApwkjk73
X-Received: by 2002:a05:6000:61e:b0:48b:f1f:8b12 with SMTP id ffacd0b85a97d-48b0f1f8dcbmr2108965f8f.9.1790852164632;
        Thu, 01 Oct 2026 03:56:04 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690c47dsm5579889f8f.15.2026.10.01.03.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:56:03 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:56:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ginger <ginger.jzllee@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
Message-ID: <ar48QGIJ76kQmG--@stanley.mountain>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com>
 <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
 <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>

On Wed, Sep 30, 2026 at 01:57:11PM +0200, Ginger wrote:
> > >>> Were any more of your contributions supported by advanced source code analysis tools?
> > >
> > > If you meant AI tools, then at this stage, no. For this patch, I have
> > > used AI tools to help phrase
> > > the patch better, but I did not use them for code analysis.
> > Will this information trigger further collateral evolution?
> >
> 
> The collateral evolution will only affect the experimental analyzer.
> It does not affect the submitted patch.

Please, don't use AI to write emails for you.  Our inboxes are already
full enough.

staticthinking.wordpress.com/2026/01/27/no-ai-slop/

regards,
dan carpenter
