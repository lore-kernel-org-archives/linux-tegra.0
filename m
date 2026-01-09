Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD533A712;
	Fri,  9 Jan 2026 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963180; cv=none; b=PIMOQ82b8wNc0OrIgRjBKx5m4hwAf3f6qrFGi8/ggJ/6u9CezRCQtVZGrtQ+NnQIb+LuQjE3LD/nnEosmgSoC34STjD5nLk3aG6FVcUlbJ2bJetno+MgozrjF8hicHTDuQRQxI4wGgBcNU5+9fQVVceHnprgx5wnGWbQasZ0PJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963180; c=relaxed/simple;
	bh=3J7Eg1jXWEJtsQ+djr7bGYkudA6kqW1yj5d2bXsUCek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cTkZLzBAo0ot2JmOm8TvvbvkuKq6c9xwA6gk3qo+9RA4KbkF1MxkLxE3u5MZL1Miy5WWmFL9vjBFeTBVj+PdjFz+sgAWPZHLa5gAM+Mu9L+Om9ZDB/MKgQc0zKqFxBwNWuRM9cKOqu2E6JhM952/jMsHlKRMFwAjSwFcFfQYfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdWomjGR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdWomjGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767963178; x=1799499178;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=3J7Eg1jXWEJtsQ+djr7bGYkudA6kqW1yj5d2bXsUCek=;
  b=jdWomjGRrW1qo/TBhk6PJFltOY1SPaxKSAkDjq6JOvSRAoh+DNIql1vV
   CJkPpHBao0veko6REYOSUQ3SD01ph1mQ0LPeOD/94YbFh5Q83l8lJGsRE
   pHe4BI8HgCT7KqPEUzqMQDe4JZmmoDtawpYmgJ1TpqT5guamQJNtgJovD
   bCHNHzmepwZrt0cr8S7SdSHGxAU7wLNQs2Or5AdZaYJcba4dLBXcDMxUL
   lTTlsZzadus7Iqncc0SYdNNW9D0GNXORZGvhw9igtDsug+a1wag2OEkmH
   Ik/dWTvMyAMl+i+TY/dWNtAqBIA9yTLTZtpRANwz+zEI5l3awq497Gg0x
   g==;
X-CSE-ConnectionGUID: sshPAgr4QA2drfss8hZiEg==
X-CSE-MsgGUID: UAzUw/zVSiOafDr4d701Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69257595"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69257595"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:52:57 -0800
X-CSE-ConnectionGUID: MKw1cOY6QlOjJCozqAZ1ow==
X-CSE-MsgGUID: uRrwHiMpTsCtwJGX73FNDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207945009"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.143])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 04:52:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] gpu: host1x: fix missing 'host1x_context_device_bus_type'
In-Reply-To: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
Date: Fri, 09 Jan 2026 14:52:51 +0200
Message-ID: <48679d960d98c3134e5a3fcc6c6238c66f0b61af@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 09 Jan 2026, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> The drivers/gpu/host1x/context_bus.c does not include
> any declaration of host1x_context_device_bus_type, and
> after including "context.h" it also showed that there
> are two definitons in the kernel, so fix those two
>
> Change context.h to include the correct definiton of
> host1x_context_device_bus_type by including
> <linux/host1x_context_bus.h> in context.h
>
> Fixes the following sparse warning:
> drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?
>
> Fixes: 3d70eb8e60c6d009c988 ("gpu: host1x: Make host1x_context_device_bus_type constant")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/gpu/host1x/context.h     | 3 +--
>  drivers/gpu/host1x/context_bus.c | 2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
> index 3e03bc1d3bac..5215922905ed 100644
> --- a/drivers/gpu/host1x/context.h
> +++ b/drivers/gpu/host1x/context.h
> @@ -10,11 +10,10 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/refcount.h>
> +#include <linux/host1x_context_bus.h>
>  
>  struct host1x;
>  
> -extern struct bus_type host1x_context_device_bus_type;
> -
>  struct host1x_memory_context_list {
>  	struct mutex lock;
>  	struct host1x_memory_context *devs;
> diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
> index 7cd0e1a5edd1..89f61b1f7d33 100644
> --- a/drivers/gpu/host1x/context_bus.c
> +++ b/drivers/gpu/host1x/context_bus.c
> @@ -6,6 +6,8 @@
>  #include <linux/device.h>
>  #include <linux/of.h>
>  
> +#include "context.h"

Shouldn't this and context.c just include <linux/host1x_context_bus.h>?
context_bus.c doesn't need anything from context.h, and context.h
doesn't really need <linux/host1x_context_bus.h> either.

BR,
Jani.

> +
>  const struct bus_type host1x_context_device_bus_type = {
>  	.name = "host1x-context",
>  };

-- 
Jani Nikula, Intel
