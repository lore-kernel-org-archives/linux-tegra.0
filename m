Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6D838F226;
	Tue, 24 Mar 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341823; cv=none; b=FQbaUjtoAi1Y8/3WiFzg5jcDgxRD4lnip2V0JyRF65L3vYeTCKTMfjPG45kOMZQFkhFf4bmK0TpgSvsQ/woE4TjY7mj0XgEVD+gZcCUYvhtZ4Gut4/sg7F/y/8lVQF3w6znsOfvb/lJ12Mgq6qKcKxel0gpI+AdgYjaWGKYCthw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341823; c=relaxed/simple;
	bh=TkqOxaoWpSzVTVoCMszA0Z+kvtZQX3PFy9HQxdGNGjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VViBdtoQrbseko90BIIlT3bFqClUPpZoj1rPkGqiDtUNgml+pvgIms8J9HoxanEFzjkhsdo6i1uDcBhKdNYGY3upiASBh/Qi/A3tPe/88U8zLNJnn1Chh37xNyFASvW6cSHQTPdxlxIOmt48iOSwhUC+sIdMVveG7dawi1UFT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JsLYqNY9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JsLYqNY9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C09C4E427C5;
	Tue, 24 Mar 2026 08:43:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 599636011D;
	Tue, 24 Mar 2026 08:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CFEA10451140;
	Tue, 24 Mar 2026 09:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774341813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=a9GmSnOTg+L9j9fwcn1JleBKmOTNp8HFvZV0TGPixu4=;
	b=JsLYqNY9kShjsTuKaZPhbGfT/ICR9oWxikllMZR0RInparBYg3NQ2sboF2yhX3pe43WwOu
	dL4caO17TkYCPjOhBTTCIRO2JZUTdc6DyNyAmptComizfOv/DLOTI8U82IO0B7DxUxaa9I
	/QE/odf0Rv/mppW9R9tDfNN/LUmR8+CiVN2XTWfAA0kGTdDIDdqqHCwmWzWgu1darvYymZ
	FJFhW47MVOmDV+38vtQp8GoouEg8ozHw2onhk5vPTuhxK1yIcSZhS9R+svIVgGv+1QfCHc
	/It3k71XZMPjWZvCE1GqE5hvv+l5gLIOQsZ5GTgfbLURRMXytAgl+fvAyUJuVg==
Date: Tue, 24 Mar 2026 09:43:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: lkp@intel.com, Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	ebiggers@kernel.org, fredrik.markstrom@est.tech,
	jonathanh@nvidia.com, krzk@kernel.org, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@roeck-us.net,
	llvm@lists.linux.dev, miquel.raynal@bootlin.com,
	oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	rafael@kernel.org, robert.moore@intel.com, robh@kernel.org,
	smangipudi@nvidia.com, thierry.reding@kernel.org
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Message-ID: <202603240843279c9e8b90@mail.local>
References: <202603230124.VFt6CPBe-lkp@intel.com>
 <20260323184207.68515-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323184207.68515-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On 24/03/2026 00:12:07+0530, Akhil R wrote:
> On Mon, 23 Mar 2026 01:47:20 +0800, kernel test robot wrote:
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on next-20260320]
> > [also build test ERROR on linus/master v7.0-rc4]
> > [cannot apply to i3c/i3c/next rafael-pm/linux-next rafael-pm/bleeding-edge groeck-staging/hwmon-next v7.0-rc4 v7.0-rc3 v7.0-rc2]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-i3c-Add-mipi-i3c-static-method-to-support-SETAASA/20260322-174037
> > base:   next-20260320
> > patch link:    https://lore.kernel.org/r/20260318172820.13771-5-akhilrajeev%40nvidia.com
> > patch subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
> > config: sparc-randconfig-002-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/config)
> > compiler: sparc-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603230007.WOMwklQ6-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    drivers/i3c/master.c: In function 'i3c_master_add_i2c_boardinfo':
> >>> drivers/i3c/master.c:2449:23: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Wimplicit-function-declaration]
> >     2449 |                 ret = acpi_dev_get_resources(adev, &resources,
> >          |                       ^~~~~~~~~~~~~~~~~~~~~~
> >          |                       acpi_get_event_resources
> >>> drivers/i3c/master.c:2455:17: error: implicit declaration of function 'acpi_dev_free_resource_list' [-Wimplicit-function-declaration]
> >     2455 |                 acpi_dev_free_resource_list(&resources);
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/i3c/master.c: In function 'i3c_master_add_acpi_dev':
> >>> drivers/i3c/master.c:2556:9: error: unknown type name 'acpi_bus_address'; did you mean 'acpi_io_address'?
> >     2556 |         acpi_bus_address adr;
> >          |         ^~~~~~~~~~~~~~~~
> >          |         acpi_io_address
> >>> drivers/i3c/master.c:2563:14: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Wimplicit-function-declaration]
> >     2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
> >          |              ^~~~~~~~~~~~~~~
> >          |              acpi_has_watchdog
> >>> drivers/i3c/master.c:2563:34: error: invalid use of undefined type 'struct acpi_device'
> >     2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
> >          |                                  ^~
> >>> drivers/i3c/master.c:2566:15: error: implicit declaration of function 'acpi_device_adr'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
> >     2566 |         adr = acpi_device_adr(adev);
> >          |               ^~~~~~~~~~~~~~~
> >          |               acpi_device_handle
> 
> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
> are present in acpi.h. I think the bot checked this patch individually,
> or did I miss something?
> 


#include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
is not.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
