Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A53FAE1A;
	Tue, 14 Jul 2026 08:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017590; cv=none; b=ChMk9+gHN+88Wh9L9mXkTioQRQWK6YqV4/YYASoSCvqsOvMJxtBSyj+NaiLpO76hu+OOotpdpKMYPxyp9oUNdA29GFw475eOdSvh1JoEc9Xs8A8bVxfRCHGiud7cHysR7M6fH07TOvMhovx5xuqJ02m9jCHqlt4T+AgkK+jo+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017590; c=relaxed/simple;
	bh=uNWes4dUao9fV1ruiRimqrA7yioGjvWyy+l8u/+iRLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYcOSQqAm1yjO14NOlyoRSeOewEdItLlZHOv/qvbax30dZcwZc18xDDVYa8eJNmZxNiihTijbTamOsGOKGlIHXNyYJzasR8l7+Fswjf45yyRB5tl8KLUip2QWnqc7FhrK6aehGcgsh7s/ORcg+6lTFaqDaKg5yF1YtiPStuRl6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzUlB9xr; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzUlB9xr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784017585; x=1815553585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uNWes4dUao9fV1ruiRimqrA7yioGjvWyy+l8u/+iRLk=;
  b=kzUlB9xrF81vR9Mg7qf7TxPthAikDF+uQCerycWJTQ5mWCtTrtrguqTM
   fAOnJkgUJvA9mQ75eo1G3vd/UAR/HQQkMBI4TtT/H2XMfynWrCBU6hg/5
   cdnxb7H3MKPiADc2PPh7SmA6SgtNpxa4Lp0NtJUdtQlg/6n/xE5J5jH8C
   h3jrl2arLY7pffROY1bvHnOdwrnXKK4PpYS+9T6+L/s5wEFnqJFwgx3kB
   HvuyQCdKmQNsnUevLqN2tXCSXAo0RWlP+3ntpry2s9jSSlQMNMk37tG5U
   BQE4pjjsCQYCLMoEn1UqaWmtQD+8ciZfNlnizKYtI3DAbSWWAyXtDhjXu
   Q==;
X-CSE-ConnectionGUID: /i07BETcSkinhuV2f7m/5A==
X-CSE-MsgGUID: N9WRHvtiRBSreN/W1oUa3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95781710"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95781710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:26:22 -0700
X-CSE-ConnectionGUID: PYVxmL+xT3S2Tfu1I0CO/g==
X-CSE-MsgGUID: shx7Gl8TRu+4Tw9fp6f3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="256445870"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.189])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 01:26:20 -0700
Date: Tue, 14 Jul 2026 11:26:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Yang Shen <shenyang39@huawei.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 15/20] gpio: Unify style of acpi_device_id arrays
Message-ID: <alXyqSFyIUFpXnNm@ashevche-desk.local>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <0b30d3cd699a41fb066903b1b9a6c231bfe49305.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b30d3cd699a41fb066903b1b9a6c231bfe49305.1784013063.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 14, 2026 at 09:24:16AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Update the various acpi_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
> 
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
> 
> Adapt the few offenders accordingly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


