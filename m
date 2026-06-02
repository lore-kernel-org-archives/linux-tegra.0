Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870BF359A6F
	for <linux-tegra@vger.kernel.org>; Tue,  2 Jun 2026 07:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384946; cv=none; b=QOgvFk/tk3Nc5M/BqOhi47O4VYB+D84DDQ1ra/w0ijA4Grry9Y42yKbpDJv+UiYztv6z5LigNcjED49pUOGXdv38U9uN12cbJbf7ulycs/io5J8vF7xjYki86513ZHUWHU52e8jwOc7JujpfcA+Mhw0yq25YGsFzFMLZV9Wxpo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384946; c=relaxed/simple;
	bh=UdFKq0jJwpC5HiXF0TsLmr7S67fksAYnPOVmTGM3AnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emqX3aT7HkDcsPLMHfS20Prwndp9xyXc2HdidZUYqnKyRtKpez23dVjRqN3sqG9tPD77/cF82dMRb9PNzbTotzMKev3A+Cn0AdDXuAwCVf6Og8xW19o3XbE8IIeWDL25CxPRgyuB3i674BA4sUfPkRSvdjODCUVXw683wFQ42A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBrM60xe; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBrM60xe"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so4886486a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jun 2026 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780384944; x=1780989744; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKlzxyRZsNwu1bVTzVMl6RjBPzzPEUmsZSWq3mEyRRk=;
        b=HBrM60xeNypEsPNkqQv93OnZdFh4XEq+3oNlNgeY9fjvF/4ha3rb9VnJJCEjAbEwaO
         L4EXZkY9Z8ly0cIDDx7idXnnmHwmGvcpysaEcE50hNivCyiyHk9GFEMv8D6Ma5sy8tos
         EBxhn5rN30MTY1Sk5xYYt6KyBarUrVuAjbHaWJEHKtRMfDJGY1B/7MGwedVmD0c5Atc2
         dn2pR9NCgGDgtlqFFgZv98CCNrCISaagGlz12qYYOByCBn29yO/jCN42JMBzpKoL5rwv
         8FXDbBT2XdE6qXL1dMUOWvriD3+1Sx2MFNP2BwZdAmF48DB8vEdhuu2ZRO5WiwZp066o
         tVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384944; x=1780989744;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKlzxyRZsNwu1bVTzVMl6RjBPzzPEUmsZSWq3mEyRRk=;
        b=DTcCHpNGMZocgLQHuI9pe3mABSjwl0+558uF69Y2d1yIu5AQQQvz16MupzxtyW2vG6
         Mdozr4Q0EgDz3AiHvYMzMKG0mmN+datu4+WTFbVEIoy62fG7XkVLMpSxHniFSH04EYd9
         zGrnasO1qAcKwWcXV7qpZ40GKHF9EEKo3otLwI+7na5hghQIqj2NGAyHVtxR9wLCb8H7
         +ypbjsw9q0YHBPq1mSQGMFX4He7GG3sTOh6tpqe8pfE0hJJKQaw/rUT6MA2A4pFOITtu
         RVoK9TfjLtSFYH5+RcO8T92K7SQU2sQOzmjYAcmi6d1B/BjTjrdRCFt8+U4xD5ybnbq7
         pxRw==
X-Gm-Message-State: AOJu0YwpIvZlEEC9uvbwjQvopO68VCsKJqsw6ei6jvYMNDsPHLQ7XJ3s
	BBJtFg8+eWyleFV/z6KkUzCqDBptk7D4xwmmcWAo0v0Zek4ldu3fE8iu
X-Gm-Gg: Acq92OE7w2dBEHE1j7RGogXJoAG59+t1QQmAKsWKhqkxAUibarfmcpM/wwuoM9AGOl7
	JEQQ/JYOIajvfiEtnhjOA9XlU6FzJp9IlriFpTFwRs2zdYEGF5ZtfRfuGyUZnXx+12RqKzdW48n
	Rb1NSLPgit+lE4UndJOoATZJpggMqmWqWeb4XrPzKWrBHaeF1OAepfbq8q6ic311XHNvZUey+w5
	4jrJTVc9IhuM//l6qHtU2k4c/EzPIaXXMm6Kt3l4W6t0LFl4pxsUhv/h++SK2fK/mVbzDHtt0f0
	g+fe+FXQPIj//L65utQybRHKE1dvtamTm+lA9MyUciq9PLdiNrqHKUpDglcgX8gAlLaRGg/3olg
	PK9Gxsn/ndO/+0KgK1N/d7ExT2J8Lg37uB/AhYA75i9o23SV/t5okwR/eds2llGNTTWINaUkis/
	aVSd96c9eJSVxgXmV4czHFmu6GdsWP1A==
X-Received: by 2002:a05:6402:5c6:b0:678:edab:6f40 with SMTP id 4fb4d7f45d1cf-68c8a371fd9mr5468509a12.4.1780384943690;
        Tue, 02 Jun 2026 00:22:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb8448d5sm2848139a12.16.2026.06.02.00.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:22:23 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:22:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Subject: [bug report] gpu: host1x: Allow entries in BO caches to be freed
Message-ID: <ah6ErK6f4kVudVIA@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mikko Perttunen,

Commit 3cbf5e3c46e6 ("gpu: host1x: Allow entries in BO caches to be
freed") from May 15, 2026 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/host1x/bus.c:1018 host1x_bo_clear_cached_mappings()
	warn: 'mapping' was already freed. (line 1017)

drivers/gpu/host1x/bus.c
    1008         struct host1x_bo_cache *cache;
    1009 
    1010         list_for_each_entry_safe(mapping, tmp, &bo->mappings, list) {
                                    ^^^^^
We have to use _safe() here because mapping is freed.

    1011                 cache = mapping->cache;
    1012                 if (WARN_ON(!cache))
    1013                         continue;
    1014 
    1015                 mutex_lock(&mapping->cache->lock);
    1016                 WARN_ON(kref_read(&mapping->ref) != 1);
    1017                 __host1x_bo_unpin(&mapping->ref);
                                           ^^^^^^^^^^^^^
This frees mapping.


--> 1018                 mutex_unlock(&mapping->cache->lock);
                                       ^^^^^^^
Use after free.

    1019         }
    1020 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
