Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D362D8796;
	Mon, 21 Sep 2026 04:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966210; cv=none; b=bJWyv7ZKj6kgHjaPQG4e/0bCxV1b9liDI8HlXy0WokORDqE97QH6CO1hybR7sfzymsuDp7G79GaOxs7B8G+ajiycRFiyXd1fRKnc0AGs9WGs8TK0tT4npEfw0EweOtjdDXz3vBlj9FhHTiGIe0w09NACM8u31oqBfs8Kvtmbzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966210; c=relaxed/simple;
	bh=j/KDQ7bOWT0f2Mzsl08+HcCJ5z+z/Gk9uDtBHhO1UuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsjMIQ/7GpeYE0yu5YaYmsNcwy3XQ/M7ggRwY2KqiXvIjBcKxf2Kze9LTusKetvd2gbh9f2w06c4ViHR58NcpnC7bYj2YNnqDWOQKXNHBmLoosnNOZ1LE06u1KLC7z1eSspo41lLhgOAXV114g3HeY0uyj2WqNSb+wdI3hHng+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZKNbYm6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZKNbYm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789966208; x=1821502208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j/KDQ7bOWT0f2Mzsl08+HcCJ5z+z/Gk9uDtBHhO1UuM=;
  b=nZKNbYm67lgUsURa+sjuqmANXOmNcLnxVFqnY/2NC7r/XM8axTZL1RNi
   LaqYlksd5ZqS2Myf9hTgMUDjFGI9EXAGThN9QnrCby/+MFVL2pP7WCPCO
   dmwku9Xq5mo42PHfMX+j05Z18jAFYQX2OnL6wyG2ztfs7WSsHouYkcWgp
   hASecek6mEg7x6d+Vv+zEsC38lQvH03UmeFayLfENbri4EvrRTG2f4FQs
   5i3YNXPqPntTq1PyGrLXXTSXIwg6krCcwbKWLXcBA3TW+u2dPReXB610J
   z8lcfpz8c9uhCWY9xmEPgZM+l63PLmRiquu2sRTpmo9dKWKu4Jy+1OFCk
   Q==;
X-CSE-ConnectionGUID: QNbBArkxQ3qaXBEVgtxlow==
X-CSE-MsgGUID: giq4nzOpQca4F0vr8ka8TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="101804484"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="101804484"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 21:50:04 -0700
X-CSE-ConnectionGUID: PqLy8kP3Tn2HzljFuWvJTw==
X-CSE-MsgGUID: voYTxHdSSH+0L+7g4NUM9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271633218"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 20 Sep 2026 21:49:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 791E599; Mon, 21 Sep 2026 06:49:55 +0200 (CEST)
Date: Mon, 21 Sep 2026 06:49:55 +0200
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
Subject: Re: [PATCH 1/2] i2c: i2c-core-acpi: use named initializers for
 acpi_device_id
Message-ID: <20260921044955.GK106095@black.igk.intel.com>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
 <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-1-caf4bea4886c@thegoodpenguin.co.uk>

On Fri, Sep 18, 2026 at 02:01:50PM +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Acked-by: Mika Westerberg <westeri@kernel.org>
