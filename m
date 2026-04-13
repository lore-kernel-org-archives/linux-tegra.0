Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57077344040
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776059496; cv=none; b=Iipt9BtfKhg8L6rIcQXXp/6D/RXgAs1YpBgD4guqjvYzF8cIwB63KwJNynBAmGKOUBZfxXIvYJDZ2ZEfktYV70kms2yszIITJf9tjvlqjarE214mlS4hlvYPqBAyhA5V+Y7xFTB0SMbozWnB5Zmsw+iQquG+kIjmQGU8Q1L64jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776059496; c=relaxed/simple;
	bh=eAlm22D/FTYm2yDyKa3B/r3DUVpjjOkJvimiyG+ILkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIZtML+buiP82uyrGGUPuFMlZfIwXvtSoL8hxKGTZTD0ii5ambWxjRo1z39rQeg1sVLXsnggGnMZ681ALLOxXdjCx+fDC6YPfbLrMOD4rn7uLibktA/CTUb0Vrz4tcqH+5BkuDVpQ+jbjiUpR6DnLXIkQVXr293LaOkf2Z//V0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2/ATdxf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2/ATdxf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b299b3c739so16655075ad.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776059495; x=1776664295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AeQDQeBvQZOlrZs1SM9OmJqEmhvxKZeUuqXZlJxsEYw=;
        b=b2/ATdxfxnnctyZAtdXJr037npcixLdJKbCeelJqjw62NYja4Iz5C+hMZ316rT2e8e
         vkDdH0J+BRUVDqiC2nxq3YxYBj5/E46fAqGY6Um28IbrlIStDzgLJ5Ro86WvNjxv8bgT
         k6GF/aUdou0rsX2EZbsTFXotC8XmcGZBWNJyUt19GTNxJhokk7tLqK1e5UP4BL0dyBAv
         5DQUXwbisI/KbvOrltH3KoE3n4ujpwRzgH/M6noCjaq7rPbvt7LViXrmvMVkNHaeFMRM
         15RSkx/T7KqWPctcXdzV6FIlsrRmthd4ZUGGLp5s9C14RH7dtHfOewXVYU1OdiK2JzPW
         nXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776059495; x=1776664295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeQDQeBvQZOlrZs1SM9OmJqEmhvxKZeUuqXZlJxsEYw=;
        b=d+n/yqrpy+EO1yNLxKuQ67Hgx783Kx1QoiUz4CiE/jlKLJ+Jaui3QCur/aGOqLVLfW
         ZzGfAnr0CJMsWFh8OSwgXaQwYXBZdmOWIoLX+j1658/hySTh0xTjQqFmKyMpPxdVbmG2
         c2YpDNTmbYCxNmO937Y7PeDIYmP1wGy7b01/55HbPB9ZshZKxPOi6i+gLqTI5LlBpPnk
         ZZUAmSjtaLPqOQ5RssOU+zmI60Kb58Nr6sLkDiwNXhcuJwz3eqCGc9xhTjq8eNcILqfN
         gP8cGVI4Nzqt/grZ9pps4dmhcfEgFxJ9IH7GqjhfY78HHQ/72Pto4+bt+ZMq4ZFuEDor
         Ie4g==
X-Forwarded-Encrypted: i=1; AFNElJ+8WnR0azQwlBvkLiP7LMQm7G1j3sdZ3uVh8AYhWkOXReJbpuzmBUX5ZaEppTj37LcPd3au3LOgNPtEfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE74U8gJ2vfHmfeotnDM4FK+qrTjH8wNo6J8v/RNFHJpEXxBAY
	ni4MCE6Gw+MY1FJO2avRA48ICd2TAd56bGpt6vrIvVzg2RCRZX7nhCiW1zdpsr+XgeA=
X-Gm-Gg: AeBDiesJZ/TZCm+A6/xK/Vd+U4nzPu7CqEYomZa2tRnI++XRUrrHDnS7RCKOSijAeau
	UCHXV0KZefGLBwZjH9hYsDhBp9HoAbfAa4dSWaTGwJGd+NC0Brn/OpJuT09BOaVfmFMh3BZQHEe
	/ib1gJ3mMzMikLrj3dcwQOeoWDh6tTuWZiIr8yOusnpCtT0P6omLx+zZGtXmknb9lGdGKWIp/FV
	lPvNfk11KW53S0uguBINNmzzfs75mL46ESNE8+l8QIFVY/jTjA+u5XYDFNtw42Ex4eIPW7p6CT1
	HIF9ZuZ5HSvSlAwrQyTXqgOhVhjMU+/yduNn4uHIRQ3ReCVF4ZsHMzW2ZacZ2mdP578Ww77gmXa
	FdfnkZDJnhDxaSDKjuWwdaXcyeQZe733zLAkjtnVnjPZyPxdLnQEVZQ+t6ZuzHWtxfjZKQ+ySJT
	tRluXN4NKvcxO3cq9e5dNeBlbr
X-Received: by 2002:a17:902:cf4b:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2b45b82b920mr33230225ad.24.1776059494437;
        Sun, 12 Apr 2026 22:51:34 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f2ec20sm108579865ad.66.2026.04.12.22.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 22:51:33 -0700 (PDT)
Date: Mon, 13 Apr 2026 11:21:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Sumit Gupta <sumitg@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, zhenglifeng1@huawei.com, 
	treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, ionela.voinescu@arm.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, zhanjie9@hisilicon.com, corbet@lwn.net, 
	mochs@nvidia.com, skhan@linuxfoundation.org, bbasu@nvidia.com, 
	rdunlap@infradead.org, linux-pm@vger.kernel.org, mario.limonciello@amd.com, 
	rafael@kernel.org
Subject: Re: [PATCH] cpufreq: CPPC: add autonomous mode boot parameter support
Message-ID: <zfoorh6tza4taswyr5zhxqn4rhcqzq4rtvz46eigoy25muxfls@tlbuypuwocvm>
References: <20260317151053.2361475-1-sumitg@nvidia.com>
 <4b1f100b-e699-43c1-a06b-5545056d174c@arm.com>
 <b8debb30-67a5-4d2b-8c08-8fd287f7258e@nvidia.com>
 <208360b1-36a5-419d-80f4-431914407f61@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <208360b1-36a5-419d-80f4-431914407f61@arm.com>

On 10-04-26, 15:47, Pierre Gondois wrote:
> I need to ping Viresh to check if this is still relevant.

I think its okay to clear the min/max state in the kernel once and for all if
you think it is not done nicely. As discussed earlier, try that in a fresh
series which only does that part.

-- 
viresh
