Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3754A02
	for <linux-tegra@vger.kernel.org>; Tue,  9 Jul 2024 00:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720484668; cv=none; b=Guo0iRpsbxwkbuvxLnyzD5cDYL34lyVd4UwZuJKnMWHqf8DHUtw3pexHyO1JJsWZtWe7V/wGtDuwlGQYt4MXSka7hjwMeMuw5LarhglTiMrjI3SeIxK9gIi70d523VE7zOZeCnNhEObqwW3KobA9VN7JHEWm++MV4QgFu75HLOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720484668; c=relaxed/simple;
	bh=OXijfxSktD32jVhvGlHifwLx3aNVOhgOTQl728nchT0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GqSoB3bw7y6hDQ6pKCwtQ/XPKF011sDNQSIxLMRd+fHILccltm+/4x4aqT27CzxgZ4GvpnDPafEJgYRf81LHl8LdU6IoBCg2KjvVPg/Ps01bg94LPe7RaW1YZc3r1NpfeRUMQJCGs02q7+heeAap4Z9dFW1uvHJlZhDUs35DiaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fb1c918860so36745745ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 Jul 2024 17:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720484666; x=1721089466;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlo3UWV9lkDtVHiC3tnceLIBeIIjDfMxY69ysONeH1A=;
        b=mLYJgwMkA3wcs2fhWw/RRqEMf0dabh33Ud6NxaIEhnyQqKYeWAJETUwpwjc8vb348b
         kKTo1WsQQgN89tY4UaQs4SK12nMAO0B++3WmIu6HdkHmqbTsq6a+y0wTgykAPJRodYKB
         Bn84BWRglsnRh2NzqOCovun3Qu1IfQaiWT1uME5H0BY5OxCqF+VjduSFbsuvCBDrbMFH
         JeL1qTCiNtLHx3XEhdmAIgwOes8QASAi4LNcpyQ//n47vdNLKiLVZ8kBBeeuPoCUfpqf
         dswSjWHeqDmV3mchgTF6SA9x36EZNn0oyQxYQDf+fMXe+KODpevxTj3HIheIGy94deci
         UZlg==
X-Forwarded-Encrypted: i=1; AJvYcCWE8ka8JNjhGS/iPSUO8cUEdV/b3rw6rqPfPeJc+ZB4JFH1v3mSA3OTi68cCz8AG19vpSbtk3E+AKILh6UMxYxRoBerjUV62mteLDU=
X-Gm-Message-State: AOJu0YzwHBFFAV6VuaVcSQkczomETpJPGVe0GQMHorroXB0xlFCp+o8z
	ipM5XDRdgtXli4JOTiUwlfiW2vG+xRxbOKmjDv1xnO5Plkz8J3+cEM7lXXcyBME=
X-Google-Smtp-Source: AGHT+IFdw3EaveRM2ZTHoRq8dYxA8E7q05nixOcYOGorj2dRL4w7J12n220WAjIf2IctJiJkVfxTEw==
X-Received: by 2002:a17:902:db0e:b0:1f4:a04e:8713 with SMTP id d9443c01a7336-1fbb804725emr12528595ad.28.1720484666359;
        Mon, 08 Jul 2024 17:24:26 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab7d2dsm4321415ad.180.2024.07.08.17.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:24:25 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui
 <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Lizhe <sensor1010@163.com>, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: Make cpufreq_driver->exit() return void
In-Reply-To: <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
References: <cover.1720075640.git.viresh.kumar@linaro.org>
 <3f73fda736818128558b61ad5fe2bed5dce3ddc4.1720075640.git.viresh.kumar@linaro.org>
Date: Mon, 08 Jul 2024 17:24:25 -0700
Message-ID: <7hplrn76py.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Viresh Kumar <viresh.kumar@linaro.org> writes:

> From: Lizhe <sensor1010@163.com>
>
> The cpufreq core doesn't check the return type of the exit() callback
> and there is not much the core can do on failures at that point. Just
> drop the returned value and make it return void.
>
> Signed-off-by: Lizhe <sensor1010@163.com>
> [ Viresh: Reworked the patches to fix all missing changes together. ]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

[...]

>  drivers/cpufreq/omap-cpufreq.c         |  3 +--

For OMAP:

Acked-by: Kevin Hilman <khilman@baylibre.com>
