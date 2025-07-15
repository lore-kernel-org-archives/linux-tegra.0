Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D2D2E49A2
	for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752586421; cv=none; b=E65CizQxBdOv6MYB2zyVKC3uQM+2/hJMP9oaZuZ9+X/Fw+2iM7RfS4334PtQAeNHSRIZeEp/lXLOxBQwPcbLjQjQiCHOTt2Xwh7RJ3PPYWAcnPcFm2ZR0JaMVH7Yhxltit2/Th/TIS7jyTI2v2KNdYBl9xdFsEDHicr7eyWngE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752586421; c=relaxed/simple;
	bh=rzsle0lYd4q3WFkhEa4uKuNyg+mZnvPoF11bTF7RytI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=apbQb6sJR/hxur31M61ZGZF74U/eDHLzSGicPzhVkoPbcmxg4jZ+zAr7L95b/8CFVcXQYghJi0HPwhBL8xAkXSAuoI9z2yRtnxkzCoIqe2+2jatqWg0NCLBFB7jOqniBp9vHZv8TyLwkmpRTycTtuYvzjoLYDpPLsLkNNxQJBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WYThkK26; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WYThkK26"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4560d176f97so29121865e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752586418; x=1753191218; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+O2OICZ/PuWhWK3KhlIFVSdYJvPOM1EVW/PgJZfT+M=;
        b=WYThkK26Z7Ql11GhNHA5izeyQuY5s7b6yi7lhD7yjRlPbvptZHkgeNewrwPcS+pYVw
         1l1BkwnX00vGRAHEjAovJeF8otaJMtVvU9BZw4/8htpxshpNf1o6zLtJHBvnxOFkW/kU
         IEMmuSNhu1vsXhTCVi8yXzGGMfDoosNrVZHb4s/K6CjmLsma/rhqmrBBwPw3ElsDaDUB
         Ud7XP6E2Wh3j88qZKLEgtwfWjNWhyqP8xb+cF2QxPzwcMjywc1lYD/4rDfyzTCJAwk/r
         zer7cd/bykVGOFHOsxCc66QExUyhYNIJdO3ZhDqAbrhPZDH+cV5c5IHpI7pHLTvDbf+y
         MOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752586418; x=1753191218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z+O2OICZ/PuWhWK3KhlIFVSdYJvPOM1EVW/PgJZfT+M=;
        b=Kfcm9/09qpD2x3XrS6DhA/CIiVqHc8R9nYDFtGuMPMvLWcnTiZ2td6t1thK6uNj27K
         rRry49XW7lqBR50QXld8OZ50/XySt2ODp4i8LiR9aI/EA659lN6iNnjNPmuUvUvhyhmO
         qHQIoonzW6uPr7NUnO8m8q0OSpGvEs3ECmXmln//bIyhjv2QbLUPGF8Xp6erGqeDTcIU
         HLYq/oEvICQKQ1YnO/+rMV3sAfjKo4QVJjLsaQxRVakI9941HBmhdk/rxuerMPzeR5MR
         KbDXjiJIvvGnNcacIXnYorKM/RbHCQoGGn+yAKtsso76Jj4W89prdYLoDaXBgAZEoIa6
         U0wg==
X-Forwarded-Encrypted: i=1; AJvYcCXVZxDG/krEjTBPOT6rjLreRhSwAS/pNowco4P5hysEAsfQv90naGMN5lZQafHU6Su5zxJECvty3wUD8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBL4uEyOQ8r0GM+kAggVCcbprbr6XNVbPzQQYUq4MGLUBrDQc
	z6hcP+L3Sbg5jO4LSVgwYeemabODrudmF1z+vaY15bm29sz3P9BDPTzoOYDAPl3DAVQ=
X-Gm-Gg: ASbGncsCEPe9zJ7EjofkbQUziZQqdtgaw5Py/NlA24cwXVaSIe/TGJ186FuCjwMVgf9
	ncWNXe81JLG0jgAh7q0UJ+X2M0VY0WsRobCX9aWKXCNcpBnofZrgHlQfiNh6PMDBqeKE/2ngQiM
	nRlP0gSk0rqKjYvn3K/sa69EwxLhWXnFf/Nyj64J/oXo06S85ZPjs5olcnbltlJWWd9w9pyeDhQ
	rorJv8AjSGybuqF7NhTtIEr7h9clNxDfhyemdnfZMjLg/XD945GFgkJ7vBoA+H1rSe+6rJ6PCqz
	pstCHUUeGOa85Lp5UxN80vizkOF+olv4larWR1PUn9B//yaztnmKHpNtuNogjHVOpnF5PgEKDLU
	r7ke7rgkyo/pjxh0pPg/imR3h6I9cvv9jO3vH2tG0eoT8CGjP3UZgRwPwJrdE
X-Google-Smtp-Source: AGHT+IENtk1fZji7615Bpw3kcLK5xTHsi34/FWdDqEiS6WLHvSySQx5nMasrQRvOYBkeNVG7ZeVurg==
X-Received: by 2002:a05:600c:4e51:b0:455:eda0:8a8e with SMTP id 5b1f17b1804b1-455eda08c8dmr128078735e9.27.1752586418167;
        Tue, 15 Jul 2025 06:33:38 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50ded8csm199491555e9.20.2025.07.15.06.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 06:33:37 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:33:35 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] thermal: Use dev_fwnode()
Message-ID: <aHZYrxabtU-7l2FB@mai.linaro.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-20-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611104348.192092-20-jirislaby@kernel.org>

On Wed, Jun 11, 2025 at 12:43:48PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Amit Kucheria <amitk@kernel.org>
> Cc: Thara Gopinath <thara.gopinath@gmail.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Lukasz Luba <lukasz.luba@arm.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> ---
> Cc: linux-pm@vger.kernel.org
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
