Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EFA39A06A
	for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066795; cv=none; b=Myp/+yeCOT3XSt2sI9ZYSDoXFVGBrX5DB7eGmZKd96HHyD56Pcq9jjo8ZtCeLgX0OrNf/4fHoBNxfvxlwExwwASg8bDIn3rBB8QQIbyLWXHQtQSaJVmQ3mVb5JNhHROQzgnki996Em9yPITf2nqkjE0bBEpyPhcEMmLeI0xSmHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066795; c=relaxed/simple;
	bh=qURxmoeHtBYQQZeErf/My6lgX3gSGhOBzfCSynLVIZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp0IjIDIcr1Nk8LhYHnL+J/NEugcoMfIrhV6IAzHdbTBpvkhApP2OAV+lBdR7ObbLsxFdAPrDkKzS5EgHfnecjvepcBn+RZ71Yb8KHkq+5nwG/d6N8o7Az6MkK8rkaEgnOsxqTA/I3WM6+EL0gHl6r6jKm7aJAgbZPZSsZnl5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIPnpE8v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIPnpE8v"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso38133905e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Apr 2026 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066792; x=1776671592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5p9ZJZXABKCmpzl6zl3MItAQjfacdhE/eXpBJaxRNq8=;
        b=gIPnpE8vbQ2exAGgrElXM9dU70STAef4BFQKq90nihInyVoyXpgKxCEw9mlrbFj/kb
         S7S2h29ltdHHG1qeJlNWHgChOWm4Y/rRWEHgQfr7mtHD28Gwn5JRKrUgLV23IdRmzjfh
         tH/sr/QfsRO6eB+jLU7niWKVOc4qQedHYsXeySRo8lNL/JvS0PFbu9kza7Kb9Q+Fcgt3
         5RqJTNbgeTkk9JUtJyiUQGmRAmW158HQhRcDcZvh3ZWAPQA+nkuG31bU7MWKeIPNVyOz
         00Pm/L89QHb1AycLywmnOIkay8/dEdX4WqzI71z0Oc6S6kpHojXywOsVeg+nNj899hpZ
         oKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066792; x=1776671592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p9ZJZXABKCmpzl6zl3MItAQjfacdhE/eXpBJaxRNq8=;
        b=JalueKgqPhUHtYpZnEfhFdM0IT8ode5CCx1MHtILEvZVcvlScdtbX+Kblo0HzeT7Nz
         1EvAFhNupzUmTUlmAoLz6jnb3ZLAtZbNZpdDiZdqlHZE4L4c+IpHXWel9LlTcO023iXx
         x8YI1srenBhvlkB2+HRLXbdcu2ZL+iSN+qO1GTkn0qfglPnZOui+Kvp9vL5JnXSSKJEu
         Qj4GpwjT4ftfVs7qx/Ca8hPpbz7o9QGi86dnhetpKPgZQEJcRLmnJ+5AKxySb+4UC1Kz
         VvTWvPH2MjPfn8HLc3Qohw4bPlTH19cZzwkRRhukzNZtydi91lh+gE3M0/LXku2vW0JJ
         6uMA==
X-Forwarded-Encrypted: i=1; AFNElJ9/6BgO7+0C7wZ7R/Kjc/nz5rJwd6y30bLgldTRrRFE4sSHkoOlZaQHXLnvH4H6iYVUIM8mUksv3KVA0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTYCpnbiAhAODbtDNcDI7Kp5qus/dEaWMtogUREjRCIM/iIkWT
	kquOQQ3eXdxlZWjx0zrOXoYOdJp7jZdIrvw0ZeDOqnrGJjgOqEnbhaIq
X-Gm-Gg: AeBDietMF3rliSf+gxexMUU1uicnPw8Sc1CY9GpZYPooMLDDwtf9hX7TvzN/jG8cCsf
	YWVi1ofCaLQbCXHu3fMVYc+87z5tzZNz8BcPdEDUAIk6w2uzRSVg6x4pQt3duSCeB6sZGQfEU/W
	KrZIsw0i0HNfpoKX7hwb/iwLWUs/Cfs8oS9eShy5V3KF7XIshQHfDphpl8pgeJQc+tRDE8FeOPK
	ipuJNRJtaDPs0JCk9O85/P0H9xa/RlNpv2HDSv/UjR8CKJ36tk9evzIHuoDkfdcd2J7ZEjqc05H
	PtpDvt+HvWRuxhoDHHVyenpUvYVh/DnLyr80k0xxrTrf0isBtAO9xr7GT79kV6pJYYus4kwd3YG
	SiRJdPr0b0vUfymGK9wSHXH5WrK7p+sZtw+jBz0ul+3bjV5kC6P4h7xRyX07jwz96nNtdAwONLj
	XA150Z49oRS+h+3MN5UJBhPYr2i9rN9g==
X-Received: by 2002:a05:600c:a11c:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-488d67fa40fmr115755205e9.8.1776066792070;
        Mon, 13 Apr 2026 00:53:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5934a6dsm303076735e9.11.2026.04.13.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:53:11 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:53:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: vi: validate format index before
 bitmap_set
Message-ID: <adyg5BpDpi5I97-s@stanley.mountain>
References: <20260412154843.29056-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412154843.29056-1-dennylin0707@gmail.com>

On Sun, Apr 12, 2026 at 03:48:43PM +0000, Hungyu Lin wrote:
> tegra_get_format_idx_by_code() returns -1 when no matching format
> is found. vi_tpg_fmts_bitmap_init() used the returned index directly
> in bitmap_set(), which may lead to an out-of-bounds access when the
> format is not present.
> 
> This can occur when TPG is enabled on SoCs whose video_formats[]
> table does not include the requested media bus formats.
> 
> Validate the index before calling bitmap_set().
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

This isn't a bug which can occur in real life since the index is
always found...  If there were really a bug, like say someone were
writing a new driver and messed up, then this would just paper over
the issue and make the bug harder to find, so in a way it makes the
code worse.

regards,
dan carpenter

