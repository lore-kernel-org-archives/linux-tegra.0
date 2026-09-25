Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C046AA80;
	Fri, 25 Sep 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336808; cv=none; b=Zjm0SZF53u2/bfbiDm5BvT2rIONwwof5wWSPq6WRkQ7FThxUtdDrmjAPNZmOxUgmTcQnzlG6TzjnJvYzFw0uQWAqvAzicsC3dc3pm1jINulAKuwFcxw3SS11uGpFmuJmdKa1Bbv+BPO0aUOOMhOSAp0NQn2ZT7f+N4lzrebGQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336808; c=relaxed/simple;
	bh=MzxytXur9WLf3A2pht3GHrIFSKif0MmfcShH+hRjUuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEDFjs5E6sReWmRVMjjDzn+HRJdRjpXUy0JbmqRAGYeZSMg51hKtGyvKBp6fT7RcKv0F9Q1SHIAXhfIhuSejL+NzyKUCp0RBAImSCAoEwwiBeSSUAUopONnf9mJjum40PNYMmxFRoDmu2ZGiiyIu8nZ0tDS9r93tCNPtNM434Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XqzLrXCA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XqzLrXCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790336807; x=1821872807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MzxytXur9WLf3A2pht3GHrIFSKif0MmfcShH+hRjUuo=;
  b=XqzLrXCAAd880vftDKmAaAb2a6r7BzqPqVy1tGe5kh9rAt3n5q8E/9n5
   hsPfhbgTaZYDd44gkHfgLcbg7tWuiy88KXi0DUlXIxK2bSsHjAeCsD5u1
   ipYxAIBX9EJWregbjpGPylaAG/5Hs8dgIck6NOzbORi36OpsvCUJeJKWZ
   AwdMXHwyu6BLiVukcrYuIlVXJp0M5hCGbUAfz2YMS8oJnj85vb5KD81OB
   uA+4JG6qoxmXrFKCL3vOdddxlxHfv2ytQQC9IGD/13Sf7jWLq/9F+q1Fn
   q2CfYFaW8X0mFt9gMQk8T15mDPi9+jBceqaVDrDU9lGkdw+dJr273+Vpy
   g==;
X-CSE-ConnectionGUID: 7gr18xpzTiyRReCw9VZNOQ==
X-CSE-MsgGUID: Az0R9uT7T1eW5uqQpVymHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101294078"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101294078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:46:46 -0700
X-CSE-ConnectionGUID: zsABext2RMS632XbvRUi2Q==
X-CSE-MsgGUID: biDbQJztS8CW1MOilcY0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274485235"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:46:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28C66121182;
	Fri, 25 Sep 2026 14:46:37 +0300 (EEST)
Date: Fri, 25 Sep 2026 14:46:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>, Jimmy Su <jimmy.su@intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	David Heidelberg <david@ixit.cz>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
Message-ID: <arZfHdZS8U6MltVz@kekkonen.localdomain>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
 <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
 <20260921073538.GA1466037@killaraus.ideasonboard.com>
 <arEVs0FDleyHeeLj@orome>
 <178999124332.1723501.13535584681937232110@ping.linuxembedded.co.uk>
 <arEeG06MiZ_97uzH@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arEeG06MiZ_97uzH@orome>

Hi folks,

On Mon, Sep 21, 2026 at 02:10:17PM +0200, Thierry Reding wrote:
> > > If all platform maintainers Ack this series, they could go through the
> > > media tree where the shared include was already merged. Alternatively
> > > the media maintainers could provide a shared branch for everyone to pull
> > > into their platform trees.
> > > 
> > > But given that this is simply replacing a literal with a preprocessor
> > > macro, maybe not worth the extra hassle.
> > 
> > Indeed, I'm not personally worried here. I thought that because Sakari
> > had accepted the main patches these could go in now, so I refreshed the
> > series.
> > 
> > I don't really care which route they go, or when. I'd rather not have to
> > re-re-rebase again in two months ... but I can cope whatever :D There's
> > certainly no urgency here.
> 
> You already have my Acked-by and I'm fine with anyone picking up the
> Tegra DT changes. I don't think there's going to be any conflict with
> any other work in the Tegra tree. If they don't get applied, I'll pick
> it up for the next release.

The patches seem to apply nicely to the media tree so I'll just merge them.

-- 
Regards,

Sakari Ailus
