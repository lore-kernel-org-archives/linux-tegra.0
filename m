Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639FC2045B9
	for <linux-tegra@vger.kernel.org>; Wed, 12 Feb 2025 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345600; cv=none; b=te7Ucejl5ZN60ySY6aqLcs1mqomzoT+CW8iXE+C9oqQX7cBVtKlBsBLkPo1WLJDqdeFTgA5Pen5RJ9W4vudZaYw+xYV8eFiSdgLl0o+UM84hcCDyIBDxoRo444GK2gRtOamZIKMWACAyiK2Fmxxv9gsxXfnRM/bUNZFNjP9mcSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345600; c=relaxed/simple;
	bh=hYJSw/8vcXikwAiQGAZCaAebtEtzVdMa9zLS/tqsQfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdeZjkn/SPSS6fL62McfcEFUhuBLE61W+i3ezbggQskOGdhrGuguQtXGzTthK7fx2tcQ2Xu6Mi60kHNXEW2n+tRdYSBIFwHlMqBLo4vaezN0S0OnZKG1T3ZLUq/L2Ob92uEPtT8wAn7GMkl/jwlgITlcLeF7zWOeT6AaDC8KSng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QXAWa6We; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QXAWa6We"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaedd529ba1so788211466b.1
        for <linux-tegra@vger.kernel.org>; Tue, 11 Feb 2025 23:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739345597; x=1739950397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iRzoLQjUR383Rec3XjmkK4huVUopwWO1GBDIhR8udRI=;
        b=QXAWa6WemliXrUizHp6nxKvvlG2yg6kzem78UvjtzxmwwrgiozK2kA5oYDLDbFZvF9
         QXmtLyns0Z9cEDOuMwS/v2HtquZz3oD64KC2h4rdH/5qcPFyuuwGq/aheP4IgjcGgemV
         iYqgHlH8eIdfFmS1r+BNt7Oq2/NHjLgVOFDV3rwkzoWTfstf390fr8mXowIoRtg4XTW4
         bwR8SafpH2xAEQrzS4gSD3LPlrroQtCYVEnbpQyviXgJIXQMNvZLCPSe5Jvq8ltMefOQ
         byzDs51DpeaXvTFBus7gOPxCvwuVcpyQ954drYeSjWLKND2AbuE6dQ3CbymC7awSXfwN
         lozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345597; x=1739950397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRzoLQjUR383Rec3XjmkK4huVUopwWO1GBDIhR8udRI=;
        b=W/HSkqbYV1BnqYymHRup2gbAbG0wF8AFKgsI/tuyPLOAfK+2wt8+NjxfiLsVEDghQO
         gnLWvreMszUkUBuHBCgC4JF6LMgsQiteHIs3+j/s9miJmiCfg1AT3ESW6hGszdXuVtHS
         QEuHLiK8zKjpS9vOmv/aKY3/9niH1t3R70QL1VNzTTmiBki/1LjUq6GnXUeaq0bz8Asm
         3GSA6rBmzxOgTkdfgzjoKfF8gewZlstSj2T1gUd+VLin01wkZQxkB6DAcBCpXbbmaVY+
         FIAsEyjiQCd3bFu+gAnfW4/4VQrXN34tK9DSNcM4d4k2bstVoGlYAbVSQBPb9KTNYbdj
         j7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVjIbFXgFchNgtMkjoRBox18t1b2LkL12LhqXEUumS5P1jklgIygsWe+RitQqap1geX7Ike/3FcnDX/TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqE7RsNZB5I6jgFYkZByjxIwEDJEwVkaBtrbVyVKfG8KZ1XkJf
	K08Zd4kzVfjHxaWxEn8EUk+iz4dz0qMnzBXqFxgGHwWP5RNROB9Oh9yvP8N4YQk=
X-Gm-Gg: ASbGncu5g1H2vhB97SMKY0dzF2/qnAAWEqG+o02Hv/S8IVvdg3uOuFVgO2ttbXYUNXB
	U1aFlmYfXnVIB8Dd3DUJc/yWfbKaoH1VwPycCykz0eQYC3RzUawRJNmEG8D0aEi2cFjnqPQu2gG
	lBZyGA/zpNk/6IlsQp+EoL1A4MLQz+MdUF4iCLxnpNeZmzRBj/DZ/ua6cn73S12L3G79NomWgJ7
	/iBwsoRklg0I2xrk9w7B0zTD5c/SEEK28vwh6qSYLOwPJKORO/7Uy1BK32P6HJWeq1xIz9eae5i
	XftHfkcq93L8Nrbikda9
X-Google-Smtp-Source: AGHT+IHEkyu5VJUntgvHMtsslwDLby1dwnGZEm2O9JyjbaJVp2KAlFWei0TrRWLwCNwYOoR6u4aUbQ==
X-Received: by 2002:a05:6402:5250:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5deadd9cd42mr5209426a12.15.1739345596558;
        Tue, 11 Feb 2025 23:33:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b30aeb7bsm696331266b.131.2025.02.11.23.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:33:16 -0800 (PST)
Date: Wed, 12 Feb 2025 10:33:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dima Volkovsk <s0ldw3ll@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: nvec: Fix pm_power_off reset condition in
 tegra_nvec_remove
Message-ID: <429e6aa2-b195-4624-a609-e1445dcbd150@stanley.mountain>
References: <20250209201752.66313-1-s0ldw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209201752.66313-1-s0ldw3ll@gmail.com>

On Sun, Feb 09, 2025 at 09:16:48PM +0100, Dima Volkovsk wrote:
> In the current implementation of tegra_nvec_remove, the pm_power_off handler
> is set to NULL without checking if it is actually set to nvec_power_off. This
> change ensures that pm_power_off is only reset if it was previously set to
> nvec_power_off, preventing unintended side effects when removing the device.
> 
> Signed-off-by: Dima Volkovsk <s0ldw3ll@gmail.com>

What everyone else said and also you forgot to add a Fixes tag.

regards,
dan carpenter

