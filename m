Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769A433C7;
	Thu,  6 Jun 2024 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717699509; cv=none; b=ok1rsMWF14JcjIhwoRFVNuiPkkpQY1xGMrpsQhVeZnW4J3r4CHDjcqxWwLj0o6/U8TzkaUSBf7Eq5VaTvDFbMpQ526kS4btrowvg5IhMxkm3nlN9Vgj26/yyoVhzA49nXSvwDBuzHVpTRBsiw4FnmCJkbhGEGE8aIymRe+Jc/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717699509; c=relaxed/simple;
	bh=D9PPG3TL2MhZad8UHlZNb2rY4Un+VVMzGVPdGBphy08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5FTpXzTaCzDWvBZOtctn7Z1k9Anp3UFambkOhGwKNY1q6w5Io6ZBOZFPoDCAGbSvUTDTLoQ1cMM3BaBVbZqsJhp3jjezrDYWW3mC52o3EoioYZkHws7ub0XDz2ufYFbkR/VmtpXYTuVT/GfYD3BgGYHLe/PGOfMTIlGP1dccyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: noc9KeoDTKW6IP7/CNWXkA==
X-CSE-MsgGUID: xeN2SDtGSBuE1b0nW+qMzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25023465"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25023465"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:45:07 -0700
X-CSE-ConnectionGUID: 0wYlbXFhQG2/L17ed08ZhQ==
X-CSE-MsgGUID: 4O166ereS/KuAx73cRovBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="61271546"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:45:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1sFI6g-0000000EHbk-0qde;
	Thu, 06 Jun 2024 21:45:02 +0300
Date: Thu, 6 Jun 2024 21:45:01 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com,
	akpm@linux-foundation.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-tegra@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
Message-ID: <ZmIDreTe8qCk64LK@smile.fi.intel.com>
References: <20240606144608.97817-2-jean-philippe@linaro.org>
 <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
 <CAHp75Vc-ALE=VDJs9062y-z5JW9_=z9axx2DL6B5ZeWD7zo-qQ@mail.gmail.com>
 <202406061046.A2137C9@keescook>
 <CAHp75VfDjiOkvNxDXUkaptxmJNP18sfVKU-3H6p=08azzaD_Kw@mail.gmail.com>
 <202406061108.1D3E64882@keescook>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202406061108.1D3E64882@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 11:10:43AM -0700, Kees Cook wrote:
> On Thu, Jun 06, 2024 at 08:48:37PM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 6, 2024 at 8:46 PM Kees Cook <kees@kernel.org> wrote:
> > >
> > > On Thu, Jun 06, 2024 at 08:35:13PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Jun 6, 2024 at 6:56 PM Kees Cook <kees@kernel.org> wrote:
> > > > > On Thu, 06 Jun 2024 15:46:09 +0100, Jean-Philippe Brucker wrote:
> > > >
> > > > [...]
> > > >
> > > > > Applied to for-next/hardening, thanks!
> > > >
> > > > Btw, is it possible to get this for v6.10, so we may start enabling it
> > > > for others?
> > >
> > > Which others do you mean?
> > 
> > There are a lot of users of kmemdup(x*y) which I want to convert
> > sooner than later to kmemdup_array(x,y).
> 
> Ah-ha, I see what you mean. Well, I'm not sure we can do v6.10 for this
> because rc2 is behind us, and that's what most subsystems merge to. I
> can land the patch for rc3 so there will be no warnings in Linus's
> tree/-next, but conversions in subsystem trees will gain warnings, I
> think...

I see, but v6.10-rc3 is still better than v6.11-rc1. Some of the subsystems are
okay to merge rcX to their for-next if needed.

-- 
With Best Regards,
Andy Shevchenko


