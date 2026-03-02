Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D602F12A5
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441404; cv=none; b=cC8XhnEJp5T9bltQDDJvzfBW94ZxEYoeFVHbBFzQ8ZIf7FnhNLkT0bdKscgtKXAd0EVTTVmc5cXNlt7LBRHRggGiVbySlRPAg/t/ckVEXVvNHMnF/kcdf3PflKwbPgZ1XAgq29x6yqb8OdIYjd0hUr4ZI/6yoiuMcMrPANrcbG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441404; c=relaxed/simple;
	bh=zEdHXsjY1+dI0EjoUWuYeK86LYd/AxJTBNI9Mj5cnhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijNGyOendpyHOtdvmjKLg10YzlovcXDeUONlKVb6KCuqxX6GYwm9Y+4f6aqUAxLx79UENjo0lUA1OlwpBF0XtBdaMuqSWXll7dk3nGlBOdUchJfMB7yGKWgydnBLd/afTFlY2VTkB88Zsngi3zzHVuddFMSuC8NU9zyIaAhTGDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUMwLYGL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUMwLYGL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so35435445e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Mar 2026 00:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772441401; x=1773046201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxhAp4H6cEz72xSxRHXwjPspMWvyGnSCMhnih33RDzU=;
        b=bUMwLYGLGJZYfA7yT/gQArt1nTRX09OaedkSUgqJHLKSTbmNQumcYMmw37zSHky78j
         oBq1tM96zxaKi/MSapRBrMEKQITqI6rOrKaTUqoAAUAUqKJqKHIGqw0AZWJuvRLJvyDV
         1WAVe9kFh1ELsC1sFhEl04harD57J1tRx2Vqcd5jGAuqBs+6dRQs0tE42kFt0EjZZ8Ci
         Jm+rCoZ/HPhWcpAPfnnYmLrSqWUSpIwPgA90CcEiYTS7Yf5/o2mc7BN+4PnLO7GwMOxX
         DvCzLaSfmd45eAiGB2OafoBkfximRgJeZhRmzhe6rTUrrr+SlLhENnlTWuEMxzYVTFxd
         z+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772441401; x=1773046201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxhAp4H6cEz72xSxRHXwjPspMWvyGnSCMhnih33RDzU=;
        b=gzFECNvrbJkVWdHnrlLPnkvlHq0asQqm8iL2OaarxJPCJN2KiqUHVrmK0mupeC5vxB
         pvX4ZZOskSujgUPxrJO8rYKHN2MQtyfLbNW/2VpGXnEylJEVoXx8xFjKPtH9/PznPAkC
         /t6GaTmrY1CqqtwIQbLwbBj9qoaboUUONuEXBcIvM9L8Srl9wsEjHw5n12HQfuQ12zZ+
         1XdMoW2wg6ylZ1surChdbfDqDW9div70OQQc9kWYBu1ohFFLPZKTtSGkAwIACiAqn460
         dUSuZYWW6YE2K4Tkt18OjFWrI5rYnI6g11KBtnpywXNjCG8WtXUw7npWooe3kXTldfiF
         glFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUUkAHhS0DC4YbjlxqsBijGtSyczq7aheyva27C/g32NLu/poQ2AaqPjZ9RJGiZArhIKb2TsxiFvR5/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx71pyrZFzPK+LJNmPqZwdzGANXNWqS6IPZJRaiJ51z9SLXKJBr
	yZMMmV1RPslgy4fuJ0GKKDFJqlVAiiKJs8RPReSS4XV9rxvwbFADsuCAgQCBi/0ZeZc=
X-Gm-Gg: ATEYQzzhkRKRT+iBXpF1amTVzqKnxIrDuhAuqD8EuwhXhnt4/NHOjLtpdPyRgISDGov
	TR75A98jMvQdO0ZW7yBCHEP9+3E47izGawgmCGpnSX2iPWruFeAzbeTElLsiluQe+jBWejCORAo
	BLzYiL7ytAEmtMIeXyDKg0iX8WIfOgzqECG3FyPNnIewgv1etKy+u2fXhYLQFvdEFPhxf/7B0TG
	JY5dsY8md3mcGNvbr4o5Q7UOa1mUvPkvrF2lE2u9cKo0SxTgiJgl9T5hSZseXYR8/I9D/2LvWho
	lSEVitMI3BAb8ThrdicwlC8GDh5kVsdohQu2xIfbjt5arGTH29dqBHTYahcsjhh/WMPp1j8vwBY
	FTxWOBpE3A9nDDY6PovVQL00sjmnriaJk+Kd2VezYzhmSUoWnGQZiig5wNzekQTO4+yPgtbeXyf
	zQaqSG01/TQZZls1ypTPrcZfG2uhSM
X-Received: by 2002:a05:600c:1f91:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-483c9ba3769mr194715375e9.5.1772441401183;
        Mon, 02 Mar 2026 00:50:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm205649805e9.7.2026.03.02.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 00:50:00 -0800 (PST)
Date: Mon, 2 Mar 2026 11:49:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Afkari Zergaw <afkarizergaw12@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: KVM: fix punctuation for e.g. and i.e.
Message-ID: <aaVPNNUL_IdbkX4a@stanley.mountain>
References: <20260302013610.3815-1-afkarizergaw12@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302013610.3815-1-afkarizergaw12@gmail.com>

On Mon, Mar 02, 2026 at 01:36:09AM +0000, Afkari Zergaw wrote:
> Add missing commas after "e.g." and "i.e." in the KVM API
> documentation to improve readability and follow standard
> punctuation usage.
> 
> Signed-off-by: Afkari Zergaw <afkarizergaw12@gmail.com>
> ---
>  Documentation/virt/kvm/api.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index fc5736839edd..c8500f0e913a 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6346,12 +6346,12 @@ A KVM_MEM_GUEST_MEMFD region _must_ have a valid guest_memfd (private memory) an
>  userspace_addr (shared memory).  However, "valid" for userspace_addr simply
>  means that the address itself must be a legal userspace address.  The backing
>  mapping for userspace_addr is not required to be valid/populated at the time of
> -KVM_SET_USER_MEMORY_REGION2, e.g. shared memory can be lazily mapped/allocated
> +KVM_SET_USER_MEMORY_REGION2, e.g., shared memory can be lazily mapped/allocated
>  on-demand.

Google says this is an America vs Britain thing.

regards,
dan carpenter

