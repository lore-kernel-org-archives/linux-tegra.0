Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6003ECBFD;
	Fri, 17 Jul 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284038; cv=none; b=hj577NR6+ztPNYtWb7WvqOGhqhISP6Lot/TaMrCAaDYe6XVu+/2//rj1VygrLLrejsiTXSE4mI7ZLZ6E+JpKcxeGqptB73jn89uFSQi0ZmpUf1rIgA6hAOAjbh1ShQxhMzbPsaTu3ZWBUlrVkxPcJ8403hMrMrekBDNT/YDSQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284038; c=relaxed/simple;
	bh=e98jGVcKfe4SBMdmyfk5VxFxdqm+I7YE8oAlNYCBeV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rklMujtNqAimKAufrjwG1Mp3wGapm/THV88iBS+qwMQ5RBEVOWZ4TVrfEY0ujxVFjHVlHb+tmmnTlbmIPhnv8oK1s7HRDLL/4J2AXKovB4vPVXR9csvpGYC8o4swHXTa9AGiLm5kkN9OCNj+naxOF1BM8eL6cHytwFPN0WYniL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLivIlI7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLivIlI7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784284034; x=1815820034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=e98jGVcKfe4SBMdmyfk5VxFxdqm+I7YE8oAlNYCBeV4=;
  b=gLivIlI7qAwWHH43dzYIouBjUD4kkquuuR6UQZGe/wj5FAosWsOwGIBI
   287QXCjojNicPzD+OQ/A7KoQjQ6g3TKQx/r//oaVRIT/BGrZE/jPt1AgI
   OsY6LI3De5razvV1yu3+XyGxQ+u+pSvneKyJEp8OU3eQq3o3d+/ggr3M6
   vXmEXax2bZ7wLCjq2BSjp+KDYfoXwfOMMWdOgqaAXEOKUu0z3I66C649U
   sIonDr/ybw4+heIpxOd7Put8iqaK+zaWWeHHX2CPSnXC6twV4dXwozFDu
   dMQ1wOppemW67bNFHwtYlldoOAWdVOIxsHCXyb6n4srfz6seXV0tJmF+f
   Q==;
X-CSE-ConnectionGUID: ry3Kf8hlQOmOYkLyPDe4BQ==
X-CSE-MsgGUID: ONrSD/BRQPySH1B0xd4Wcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84981448"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="84981448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:27:10 -0700
X-CSE-ConnectionGUID: 4WNYOIPfQAiUTnjs0x9Nwg==
X-CSE-MsgGUID: x2Dh9FeiSx2LN12oFHpQaw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.143])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 03:27:07 -0700
Date: Fri, 17 Jul 2026 13:27:05 +0300
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
Message-ID: <aloDeQoP5pg-xmNy@ashevche-desk.local>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
 <bf617dc2c662e80833406bd3a3f23cecdde071e4.1784133987.git.u.kleine-koenig@baylibre.com>
 <alkXuxYdLKn14rKZ@ashevche-desk.local>
 <alnjVo8v-3qHKfg8@monoceros>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alnjVo8v-3qHKfg8@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 17, 2026 at 10:31:36AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Thu, Jul 16, 2026 at 08:41:15PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 15, 2026 at 06:55:21PM +0200, Uwe Kleine-König (The Capable Hub) wrote:

...

> > >  static const struct acpi_device_id dwapb_acpi_match[] = {
> > > -	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
> > >  	{ .id = "APMC0D07", .driver_data = GPIO_REG_OFFSET_V1 },
> > >  	{ .id = "APMC0D81", .driver_data = GPIO_REG_OFFSET_V2 },
> > >  	{ .id = "FUJI200A", .driver_data = GPIO_REG_OFFSET_V1 },
> > > +	{ .id = "HISI0181", .driver_data = GPIO_REG_OFFSET_V1 },
> > >  	{ .id = "LECA0001", .driver_data = GPIO_REG_OFFSET_V1 },
> > >  	{ }
> > 
> > Why this churn? It simply should be folded to the previous patch.
> 
> I guess with "previous patch" you mean "[PATCH v2 12/21] gpio: Use named
> initializers for acpi_device_id array"?

> I didn't fold the reordering
> into that, because reordering isn't about using named initializers and
> mixing in other changes makes reviewing harder.

I have, obviously, the opposite opinion. This makes an additional unneeded
churn while reordering does naturally fit the other patch.

> And given that there is
> a "churn" patch anyhow (which is "needed" because not all arrays that
> use unusual styling have an earlier change) fixing the ordering in the
> "unify style" patch IMHO fits better.
> 
> But note that for removing trailing , and spacing in the lines that I
> touch in patch #12, I agree to do that there. So we're talking about
> grey and subjective areas. But note that reordering breaks the promise
> of patch #12 "This patch doesn't modify the compiled arrays", which was
> the relevant reason for my choice when considering where to implement
> your sort request.
> 
> Also note that folding cleanups into patches that touch the same code
> area also makes it harder to keep commit logs up-to-date, which you
> already noticed I didn't master even with only doing one thing per
> patch.

Sometimes being too pedantic is not a good thing. You can tell it towards my
review as well, but my point here is to bend a rule very slightly to avoid
unneeded churn. Having stuck with "one patch — one logical change" makes a lot
of noise in such a conversion.

-- 
With Best Regards,
Andy Shevchenko


