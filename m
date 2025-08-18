Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC6E2749F0
	for <linux-tegra@vger.kernel.org>; Mon, 18 Aug 2025 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755498581; cv=none; b=MbtmzjopCu2N+crXywWzDPJudnsXfSCPoX/MjmZ9KqVQTwXNlUbGJPQhm6lNj4ZkoI32ZU57yLfNxsBb81VEz0k5/QW1LyDLt8wvwwTKhYVuvG5gW8C9S7+UwaYWIMS15QuHLKY4e4dAu+5oN0HvhehMuamh5zULN/5jwNJa6o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755498581; c=relaxed/simple;
	bh=5g0wbn6Ph17xvgAq5KvhX1KEiqUBS3GvRDxnv2BGP5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiwdIYrV+bkzB11CzyvC1tDN7I8Rv2aD/T/9795w/41csEJu/ytkX4r7o65SNivqYi4qoDqhj0YT06kdx9QtkJvOxJ0YICVvpOlNuVIsfIvYgAXAoF+i7GMYFo26vh18hDDlT0iuyJmeC6sxto5gMxXYUxPVSHDfQd7pkOnScrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3J54Pw7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3J54Pw7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9edf0e4efso2649701f8f.2
        for <linux-tegra@vger.kernel.org>; Sun, 17 Aug 2025 23:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755498577; x=1756103377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+3tkiOT20kGsUTSkgr+xHio85hrWrVQxIwikWx+eXEg=;
        b=R3J54Pw7HrnCY/NY9e6PD7naRXa0JR+V4Uel8So/kGUyRoSq/Jx+YFBNBzhusO555d
         e3bSJYtB71XIIwHCX0bVHpmD2gsnEFRwB2UYoIHOj0vDkiAnrt5NIPXQycxp/4RY2XgI
         FwvPpmPupamcLpzNL1p6Che5pJVhWbNlVzUCCP9EaTuzNtB9zrgxEigAwVp3OVVTCJEw
         GeBpmjEyVLsXNJvsA4HUQfNTUW9fNMcsAkBPU80h5aZDka5qg23E9xXLf1ZcWdgiSdlb
         /OOIE2LlGc2ETR1HcVrfejReMAuYw0fg0jBc2h57/t9qAM3Fdfxw/fUNtU4pDwtGd7A8
         OYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755498577; x=1756103377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3tkiOT20kGsUTSkgr+xHio85hrWrVQxIwikWx+eXEg=;
        b=sohaIs+AUSzAeb1XvsQGeTkT4PmQHf+OWyR2hbtXqPlXGHWjIR6aQw+7cSvZRRSI/p
         Bota3JIE8iDo+o3ONpqjXygf82kDQ/2PLZiFXeCUp3Xg5bxfvIhdXyTTykkpNH2D2VLQ
         QheJGMZ8OGdghB80rdREFWJMXpN7X9IWi2e7ZxRv4BjR008DvDGaxu0/D2gtQ/FP6vor
         VrzdyzUmqJRC/OoxNPZ/x9ZX82FEPJV2bTxB8AyIp6SSO1lPd02SVwcshVd1OtJ2xc8o
         Jipmx5RQIjEt4MvqfLaNBFzjgmM28SeU6UJUALNRR2jW5uo5mkTINsYEIaJPvXKUE0wt
         yEIA==
X-Forwarded-Encrypted: i=1; AJvYcCXjNex7ewwtFDaqNEtba3Gt0IMeUa/M3Vwf+ttIA3JHnKaecE1BBJXSYkvJD8gS9WaHsWOFSYDUNG4hug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDFlusDJClFz1/gBXehLMVN3GHMPxf/16+sa7CDHuNjDLRw1f
	xLMfPM05PdRTBh/tSNnnoGewQ9r45Bh3oaOZ3cfs/9UyNYwAq//gIq0uIQABjrOpAew=
X-Gm-Gg: ASbGncvkSsKD52gOyHLihpAXuSvN0j24x8wB6TgZjXZyrf7efekr0GK+pVgh667dfo3
	Kbs+RAaTUHmMkqutPiuji7WocALWyUgPnyQIYsdqrugG8FXyaeyeImaeodu2HQet6AXQ8RimV/4
	Lvck5oqpzkqNYWxUYRcusRFVv7Y/UEpJUg9rAPbgFe2icTAjSUJBk384P1mNTcHeCutilpYekPC
	7kugE+I0ZpB0iTDcaaZ8pHcc2QwGpDauTDS76Po30LEYqMDxXLVNzCOf5siIB9Ochgw0Jdwin9N
	jYR/68clAg+bMj5nCZGHwt6kjxMJA7qupNpNVU60zbsB11YwL+wbtp09NRSIPpNzIC7QeSboBkS
	5orT0/lZkxe/eBAMEWiOfwpzybbrsEh1Y259tgg==
X-Google-Smtp-Source: AGHT+IHndy6oVv4OJ+/MsKM5qa8MXzOeKQJV79th477YwHEuET0jW0JUWVhK0OGjN+EbNCIL5zw9Vg==
X-Received: by 2002:a5d:5f8f:0:b0:3b9:6e:5242 with SMTP id ffacd0b85a97d-3bb66567d13mr7922421f8f.4.1755498576770;
        Sun, 17 Aug 2025 23:29:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a223292d2sm123065385e9.21.2025.08.17.23.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:29:36 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:29:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammed Guermoud <mohammed.guermoud@gmail.com>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Silence unused argument warning in
 NVEC_PHD macro
Message-ID: <aKLITYYTOkMpNkQy@stanley.mountain>
References: <20250817192425.12983-1-mohammed.guermoud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817192425.12983-1-mohammed.guermoud@gmail.com>

On Sun, Aug 17, 2025 at 08:24:25PM +0100, Mohammed Guermoud wrote:
> The NVEC_PHD macro was defined with three arguments (str, buf, len)
> that were not used in its empty body, causing a compiler warning.
> 
> This patch silences the warning by explicitly casting the unused
> arguments to (void), making the intent clear without changing
> functionality.
> 
> Signed-off-by: Mohammed Guermoud <mohammed.guermoud@gmail.com>

What's the warning.  Does it break the build since we're using -Werror?

I feel like in the end, I'm going to say just ignore the compiler warning
since this is not a bug in the code but obviously if it breaks the build
then that's a different story.

regards,
dan carpenter

