Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712F6345736;
	Mon, 21 Sep 2026 04:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966337; cv=none; b=GCUtsxJePlVdq9ICHfcrK4Gg/lgBAgYvRy8R6IInOSzECbGOZsm64vzj1Jn+mTAjHXVj3UC+ocu1BiAiDCUxsseSHCY6uQ1V2i6pXQSkCnEd5LjjOEuq13YLoSxE8DE+2kM/0OpDTjppRG0HCPdHNwRr2S+l3APQpdrTzDCoZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966337; c=relaxed/simple;
	bh=8kMF8rBimaKR13vElBQ7E2iTbUTLoPrvjEkzyOHFPes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzCOq9xifbgXVEJ0Y1SQUBRy0vBtP/Rg+BW0l6dC73LlLTSnsFVwammiHdrp6GjVIR8r47ZPZcu5hm+NSBAJJ7usDZ1rdH4reaPjXdlFFkufW4LbEevpeVQXCt4BhgZCT5lwE76XOK/v+5JGQ8LF/oFRAuv9Q89rPoGJ8322Ado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJB1IWcr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJB1IWcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789966337; x=1821502337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8kMF8rBimaKR13vElBQ7E2iTbUTLoPrvjEkzyOHFPes=;
  b=SJB1IWcr8sJ3TOr4etRE6dAwX7/WL5EeDG1jpXgSxtZTYSYKhi7z+olY
   WPYOsJb0sQPPvjkfZgM5zzoA9Rl4+lWvuTydAS0QJJNQ0iGe2YeDWkt0w
   0XuTq39b9+kHxFH1n+dVTqmF88xIZ7jEsODRfq8kolfn3372ssM1yw/sQ
   Ea6/ouSllSRay6Ttaco4b9Hn6hDbKL4D7BOD0ly66pUcbpzCqIt4dUr/Y
   kZJGuk1I9PL5/ywkqX8oWCAHiDFyUiQACE6n9/u5+oT9MV6yrD+17sDKG
   /8/gCgdzdPCoE9N7ATjzIQ1BBp9iiEyt/MZnIeCvs0gHTL6LOsaC/judd
   A==;
X-CSE-ConnectionGUID: 0W+kaXJ/QByLB+rc/R8UxQ==
X-CSE-MsgGUID: YWDwZCN6SgSTSXyMkl/rvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101051116"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101051116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 21:52:16 -0700
X-CSE-ConnectionGUID: MItRL1SEQU+PADvh8ZG6qg==
X-CSE-MsgGUID: Ps6tTfHOTIKYy6/HtaSfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271036526"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2026 21:52:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 020F299; Mon, 21 Sep 2026 06:51:55 +0200 (CEST)
Date: Mon, 21 Sep 2026 06:51:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Elie Morisse <syniurge@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Devyn Liu <liudingyuan@h-partners.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Hu <hanshu@zhaoxin.com>, George Cherian <gcherian@marvell.com>,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: busses: use named initializers for
 acpi_device_id
Message-ID: <20260921045155.GL106095@black.igk.intel.com>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-2-caf4bea4886c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-2-caf4bea4886c@thegoodpenguin.co.uk>

On Fri, Sep 18, 2026 at 02:01:51PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Unify list item alignment to have a single space padding between the
> brackets.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/i2c/busses/i2c-amd-asf-plat.c       |  2 +-
>  drivers/i2c/busses/i2c-amd-mp2-plat.c       |  2 +-
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  2 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c | 42 ++++++++++++++---------------

For i2c-dw:

Acked-by: Mika Westerberg <westeri@kernel.org>
