Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D04361968;
	Mon,  7 Sep 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791193; cv=none; b=lGB2yjJcPqAECw86lQsM/ESC4Dpzll0DI8d0N2CHFF/WgaHhfiyPr9Ns2il+gRBuUu/UbvbbnZj/lCwkygpT0wuAu9YpZBuQd8tudIJ9+8rGEk5VXnTNFz4PDv4JEF09+QN3jPtt1PEt7BMG3bGPDPYBhUErMWoio+s4vfizV7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791193; c=relaxed/simple;
	bh=+Nw08RCyNAO5Js4QuDLxBTy7DTubznyegLZ4vplhyPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy01gEo5bSyWVdz0Q82NzHQjZC+VrCsI8qOrNOe6HXGodeHNG03olOsiAhPF4wSWnTtmu/iiLNDviPLIWw2ZTH/3urB4Z77mhoNvh6hfkxaup1c/PsTUIdzzV4cV5Rv6PUzHRUDPyPb+LCwGeUc7TagSGvnkhXSX5y8AG+bh1iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jWaofOmh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jWaofOmh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1E91F00AC4;
	Mon,  7 Sep 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788791191;
	bh=0xgscTFS0Z4Bhkp8cBMAZYmvwrWeGqci3Tjs2vNc4UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWaofOmhad+/6eho+TVseXrmBqVZqgp1W2c83MHW/mJsnmFV9F7iElcwBPWhk3e1N
	 bB6AAJHq3GJ2GMLQs/UHzKt1GKFquiU+a4m/ucJUD+HnNyDhjEmVgd6WJ5derCEexj
	 z3YOIhFdlsJn0uy24oOiRgN64i/1ZpbV58jNe3GI=
Date: Mon, 7 Sep 2026 16:24:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hank Yang <s950343@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: nvec: fix race between power-off callback and
 driver removal
Message-ID: <2026090714-trade-dealt-54b2@gregkh>
References: <20260906131529.11422-1-s950343@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906131529.11422-1-s950343@gmail.com>

On Sun, Sep 06, 2026 at 09:15:29PM +0800, Hank Yang wrote:
> tegra_nvec_remove() checks pm_power_off against nvec_power_off and
> then clears it in two separate steps:
> 
> 	if (pm_power_off == nvec_power_off)
> 		pm_power_off = NULL;
> 
> If a shutdown is triggered between the check and the clear, the
> system's power-off path can call nvec_power_off() while
> tegra_nvec_remove() is concurrently tearing down the device (freeing
> resources via mfd_remove_devices(), cancel_work_sync(), etc.),
> leading to a use-after-free on nvec_power_handle.
> 
> Use cmpxchg() to make the check-and-clear atomic, closing this race
> window.
> 
> Compile-tested (ARM, tegra_defconfig) only; I don't have access to
> Tegra Paz00 hardware to test this at runtime.
> 
> Assisted-by: Claude:claude-sonnet-5

Please read:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

sorry,

greg k-h
