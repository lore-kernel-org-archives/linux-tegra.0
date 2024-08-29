Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3711318CBED
	for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 09:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922889; cv=none; b=cHbqSnofevqiIV9LnS9DeYQ12s21PlwMOy4+LMG2t2SYQ78v/4dDD6ptQWfSs8o3Q+3lMFDrmvJrtz/FxXcPAfkpqcy63L3L9ywed9ijtZ7A9VhAWYCt2jqdFsvuIqLXAW+S5ID5rhfP+oTcDARQNceJ+9fDzB10BTyzbROgKLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922889; c=relaxed/simple;
	bh=8x8g1e5x/vlcO20rV1E4Hnvc0w1vqyXS46cdQ7b4SyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqn0kGF4c39ev0j5v/b1bQO+yrigBs7ifyYgPGJwnQg7T+NMWmmqytkoCOW/rE8LSywepndO+q/4Dr0W/Se+kBq19jqR3cTPG+EYCeEvKvIQjtITScQWb98/NdWFSC9jl5GDaxwiqeZp9IC+aGSG1IKULFfEilpY6KC8fur1zSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kbGJ7y83; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kbGJ7y83"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3719896b7c8so231934f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 02:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724922886; x=1725527686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Km23SekStR6cqhQyfp1JKUgaAiDVZuA409pMvIc/U=;
        b=kbGJ7y83gS6BzwroIpDOnz4hDdUthgdzD9yMiSJr3SwyJqMgMlcABdeda9MXLm+73u
         G12+ZKoqvrQ3w1VMsTstIptot8RyFKjf4bgeApH3rGubUgtzrHy9YhBgX76Fnpd4FfFa
         qLpbNr+ZXQOnOHIUj2JgMjCi6e3cWk4EgY8sBUfqJjXZoW5zDT1+iUg1/qjjCOUGKxA6
         jv3XtmFhLT0Rof/4ge9zL97lNP452EK+Y8qaUi8R5k1vXS/OfjfWr69rQdaVIgQgp9DX
         jXLmXWXnKwt8qbsb/t9QtC7ZwxXvVERtKSJyRnRLg+GQaSbgE1neupL3CVKxQxwHZCul
         gX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922886; x=1725527686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6Km23SekStR6cqhQyfp1JKUgaAiDVZuA409pMvIc/U=;
        b=JluwkAnBlVnBHpXsR022Abq8orsPNvvoRoO9+SiTffYkVG45f/itdROzxDwulo9Mgl
         HScyVqWK1L0XeihN/Wduwj/ohVmJ5DRmbHiFUsFCwvG6qHZYpeIEc5Uxo1R54VNLJAqZ
         N1VYumqGj/r17JwTbwbRX8F5nYgl1qTvGJyT7DFMPuZyP5sMJJiUCYGhk/qnvclRr0gI
         yEgHsLcwYcun0zLOmc+dO1vtLQWsqtIG7u/RB8ksGttUh79O52hUEXF1t1dEiHJnsdWx
         GtPNowFXR8pmzucj/dfW2EowUVtLH0MbyVGczn5ckiYOFIgn1I1JR7uhEZDk3P5S/A9u
         TRcw==
X-Forwarded-Encrypted: i=1; AJvYcCXLjFW7esr18pp1vSlGDNpOBNSvlWMDqTptBdgqPHzOYNgsimXCuI8xgALzLvPW9aPm4rvqBsciQAxbJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynSbsIW5JhzUCjjMjX9RZ63oAlxlr/n+qWNcx79N7V5PM2lfbI
	bPPE8HsoiiD/qo8OC/3ONlbD6jFWxZZW1gMs6tBirEsUWcdZ7saoB16OV5Io6Uw=
X-Google-Smtp-Source: AGHT+IFs5vufPyvUpn6eMaWbjuz60f0gm2UsD8ZCjTHIvs2WILqyr59d1WjjUYCqBNLm5s2UJUeBYw==
X-Received: by 2002:adf:fe8b:0:b0:371:9426:d534 with SMTP id ffacd0b85a97d-3749b549687mr1435576f8f.18.1724922886387;
        Thu, 29 Aug 2024 02:14:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba639d440sm44969225e9.13.2024.08.29.02.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:14:45 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:14:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	kernel test robot <lkp@intel.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Replace divide operator with
 comparison
Message-ID: <feb9dcf0-0249-41b9-bad0-c988ad2e45db@stanley.mountain>
References: <20240813094035.974317-1-quic_skakitap@quicinc.com>
 <4d314b61-7483-4ceb-ac72-10dbd7e4522a@linaro.org>
 <7733a4ca-330b-4127-af12-33f376fbbc47@nvidia.com>
 <kh4diauo5u63mldchmd66pbnqxwnbqfoqcpxsw6wwocbadygvz@3diccu2xt4kj>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kh4diauo5u63mldchmd66pbnqxwnbqfoqcpxsw6wwocbadygvz@3diccu2xt4kj>

On Wed, Aug 28, 2024 at 11:44:20PM +0300, Dmitry Baryshkov wrote:
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/
> 
> this Closes tag must come after lkp's Reported-by. Please also add
> Closes with the link to Dan's report.
> 

No, this one is okay.  What happens is with some Smatch warnings, the bot
sends the email to me, I look it over and either discard or forward it on so
we get two Reported-bys for one email.

> > 
> > There is also the above smatch warning that was reported.
> 
> And the Smatch warning too should be a part of the commit message.
> 
> Last, but not least, as it is a fix, there should be a Fixes: tag and
> optionally a cc:stable.
> 

To be fair, at the time no one thought this was a Fix, just a cleanup.

regards,
dan carpenter

