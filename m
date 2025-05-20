Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB708265CAA
	for <linux-tegra@vger.kernel.org>; Tue, 20 May 2025 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735343; cv=none; b=IgLKGv7krH9tmmD4DFoy5sUwvj27ta4WbCD5pSMk6rW+s5hcO7opO3TpnzYotqXcrkZNuS809lfKbh+hTW0S5geE1YwwFVWRKj+4V+VCKEdBz/H1tYIV39k1sCr/+uNlj24OlkGUglkom+8FxmqmJOdsQjm7xWhsk28wwN0aAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735343; c=relaxed/simple;
	bh=cpleCobDeLKaqgA6zL5cBaz+fCb+6V2rXvW3k7vttKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ae0ukj4/dgQhRzIXnLlpzFkjVvGahvg4H7KzW65o7dsLfyoYY+NLeHen80NYOKuGttpXJAHQ42ha0DDYpvBBMYVTuu4cFAFnjm0Lvfu86jzs2ivkJGRztZq55ZztKldJHUq9JHVCWFJzZCovL4YBGHDTxWRkCOl1e/yi0/pNa84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCbUI30W; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCbUI30W"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399838db7fso5134051b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 20 May 2025 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747735341; x=1748340141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kr6JF7XrotEM2/SEZ5be+jiHVe4v5HArwpyJHi7vH64=;
        b=GCbUI30WL7/7vH4h2EjsXTSxGwJ0wdVq7PUNAv7iwIWfZu9T/07TmgeXnSBfqEhUHU
         Ek9hntVrA4jFPRkBmM+fEHw05qIHQxG+B4rl6newN6CAc9/BtPM7fVBY9tVfRzEcAM/H
         bb9ou2ir+P2ebS4iAUbl0wZDBBGrjHW53x2ZiuytHmtJWlMEizOsy04y6AYbFG+P24r5
         T5TZmsdmEj7YYTNX4XhWbxBqmUqoIdl1DyOm8ydEytsCtx7C3ZKuITshWMggZwa1HW4e
         CCLOMsbfSkFwou/YJ53kUqzC/IdXpIGawS6I/pVvbVNOUc1LFoffuEKIcmIBN68eXLxE
         oSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747735341; x=1748340141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr6JF7XrotEM2/SEZ5be+jiHVe4v5HArwpyJHi7vH64=;
        b=gjUfiDoB3sb5sxyeKo0OVLu2es7ixnI3Nc1TlpjLl5wMNVPoLDbt4VRpk8+IXlfYN2
         ykAXn7OAp44iiI0xUgdrO3JczzPhX+dsb3ku1FM/zBuosirmk75ceoQ8id0J/YxUCrvh
         J5lT3lYYFN65qf7LLDXfYY7dG5+3TbQqYWW4nwtU6uLXGDhAu6a8fgjsdRZNFi446cjG
         BMG6OzQlS0GGVivv/cJlt4VNIEWMPZmxhyXWnWGv5d2+Jb3FtkbJ4SlQdXOQu8x9zFNm
         vjJ9NoFw5CzlIpqOseVxiE0PmMXOj4edGTvOmAQBXvs4ObtvNOcW3b6D4W5TvvsmhH4f
         7x6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXF+SOo+lu+4Jn9LZsQjaAtCIxBB7sGmhNRxpAb4/9hQOGGG0iM2i6u2+VRWYUGrCTBWF2PEurFrogHGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUm49yRrnaduHxkuEnLmNs2MVvgrSeEEuaQnnj/wv3ecsFCMNz
	ATOxmj24cOs5n7IENSoHHH3kVDmpwU7HueojmkYFZMjHsaVTw2AIFGKpFb3N1s7e/H0=
X-Gm-Gg: ASbGncui0iT2LIRVOZSZ0ahScEdJXNv9EWLWmmsSRbhVV209EC8orfjv1luYKNQdHW1
	/lZ5upF+0Sf/euv9JboAGklK7+iHA7e4ujJMCeyaMo3tRejIxmphVXh0GODoueN+xJB3dXQiQS1
	fE2ZysfvJYPtoq9o8tLHR7bGRYpYdWgtHca2EargpBn65gA9du4TYgr9MvCl8IKcKYqLQGGLp3t
	s3GRkPUMyMeAnqIszZNadcLE1RPsgJV5Xp+8BAQ3Pr0cfR/3wWXQOFJLB+zjd0Mu4FO7Y9vBgJd
	8ZSvcIcq2uN9sLHYB+FQAe3pURuCiNUuj3qScbgU7FkkzvGYC/3S
X-Google-Smtp-Source: AGHT+IF0esyS9ugdbmGc1FhKmyTboh9eFi6YCDr0MoaBcpn+g9RbMn53LMqSF8VQXCrc4CoxEddIXA==
X-Received: by 2002:a05:6a20:43a5:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-2165f84b78cmr22939286637.15.1747735341143;
        Tue, 20 May 2025 03:02:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98770eesm7520797b3a.154.2025.05.20.03.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:02:20 -0700 (PDT)
Date: Tue, 20 May 2025 15:32:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: webgeek1234@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250520100218.te5i5ltrx43zjsq6@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
 <20250519101725.k644wzizjwygtwa7@vireshk-i7>
 <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>

On 20-05-25, 10:53, Jon Hunter wrote:
> I understand, but this seems odd. It would be odd that the device may just
> disappear after resuming from suspend if it fails to resume. I have not seen
> this done for other drivers that fail to resume. Presumably this is not the
> only CPU Freq driver that could fail to resume either?
> 
> It makes the code messy because now we have more than one place where the
> device could be unregistered.

Fair enough.

This driver, along with other cpufreq drivers, can fail at multiple
places during suspend/resume (and other operations). If something goes
wrong, we print an error to inform the user. Should we avoid doing
anything else (like everyone else) ? i.e. Just remove the call to
disable_cpufreq(), as all later calls will fail anyway.

This is the only driver that behaves differently on failures.

-- 
viresh
