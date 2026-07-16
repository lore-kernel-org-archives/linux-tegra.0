Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC60372ED6;
	Thu, 16 Jul 2026 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223683; cv=none; b=JfFN6Acp6tNRG0yukcQ0WnRHLZhDhaYD2CWuq5tEnkxeoq1uGlwGkzKQ2OZHU4kXMETIbVNLlJphAvxoQrip6TsAm4WZ2Sf5vk0C4hN0BDxexm38MLEcoRao0pMljfebd3hI8tUY99irkGqJpnLINtCddQ6tJw2MDMy0S9mg57M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223683; c=relaxed/simple;
	bh=AhcgpeIxBz6bShne9XdLh65vxC/ELRu5M6D77TKILvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOa81Tbu19Puq5rZpm81FW1XGShAXiakMgqqUrhqM7xkpBDbG+UZmlvFwg+I0QiMo+WjNeSuLp14jJEuB2kw1Daf/TpqDDcsENWpAEK7Gs3IljxG/qCmeCpcPm6Eu2/EM0fjo0zi2/4rCe/wMRvEY8Vo36jOnRtjejn6+ln00CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlmY+0F9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlmY+0F9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784223681; x=1815759681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AhcgpeIxBz6bShne9XdLh65vxC/ELRu5M6D77TKILvQ=;
  b=FlmY+0F9jLyXBJI2q2TZnink8g5uW+mfFtNSj1M7JnGXpF2+maj9fWlG
   c8FEDACkKjhWg2Em9wh9KNXA2/ADXrxBLq6GcTs+DMVUUr/XlIJZMjCoO
   fYXDt0dSeExdxOeHCieagcw1I5HrpnH168Kc+EsodxwCgHUnzOCqOYeBc
   /QOkH0QTRG1Zz7ayxGhHtqtp1MpqkfCY4exFxkFOyPXX5q3Q905qxcOU3
   lEhYcmAz3lJDDLssc+mUqpPIdn/cUps7wzdPGtFOXDDdDIJBUAHaEvMGp
   9ma7OsNv3w88chgN0Xwhe5mb/YZ04IWKOVdwEri592x90bcBKC2mla3Ur
   w==;
X-CSE-ConnectionGUID: ik/jQD+ZQHaRXaRwCbHLxg==
X-CSE-MsgGUID: s4NFuV7qRvyQ94qfoPZBGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84852773"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84852773"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:41:21 -0700
X-CSE-ConnectionGUID: 5nnamH3ISFm155IdQLTEfg==
X-CSE-MsgGUID: w9pg/V9uQo+6he2yjtW8+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255412480"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:41:17 -0700
Date: Thu, 16 Jul 2026 20:41:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 16/21] gpio: Unify style of acpi_device_id arrays
Message-ID: <alkXuxYdLKn14rKZ@ashevche-desk.local>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
 <bf617dc2c662e80833406bd3a3f23cecdde071e4.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf617dc2c662e80833406bd3a3f23cecdde071e4.1784133987.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 06:55:21PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Update the various acpi_device_id arrays to conform to the most used and
> generally recommended coding style. That is:

...

>  static const struct acpi_device_id dwapb_acpi_match[] = {
> -	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
>  	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
>  	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
>  	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
> +	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
>  	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
>  	{ }

Why this churn? It simply should be folded to the previous patch.

-- 
With Best Regards,
Andy Shevchenko


