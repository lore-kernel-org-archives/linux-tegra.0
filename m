Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DACF1CDA31;
	Fri, 11 Oct 2024 08:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728633821; cv=none; b=SjUi7hBPy6vU5QETkl0HttY5COPB6woNtGiQ+rxVeMJwFCHq3/ry88aafFkgp8MOPH1+I0nluASpJAjCYKffW3bdz6dL6GdpAfSsNiLbWP9pDFOO2C9+eRGWDcUmgxCUBehP7Ix9Zc9LjkNwao7J+2RH43Mdlbprh8FVAKHh+sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728633821; c=relaxed/simple;
	bh=bgy0oiDTzSa+xr4BkqTWeI5y+7kFjrteTQv+r7qnQtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjtyIxCb5GQ/9a4HGnmCjIttC/+nD7OwRhVihxwHuw6ilxG40O94Noka2/k1PF0jTlJVtqkk/yAVhakLAaGmjAxrSIJSPt/RkXHGC6oR1W+gmJbCItXNRII1/FrE0dfVCNepKXBzyOtUbH4p+lPel7cipHMw4C5usczzeryCNx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xNaEKfsj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xNaEKfsj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C6CC4CEC3;
	Fri, 11 Oct 2024 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728633820;
	bh=bgy0oiDTzSa+xr4BkqTWeI5y+7kFjrteTQv+r7qnQtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xNaEKfsjdIaQKYwfgv6W09W5aX/K5fFeFmQCFCpQFCu1Z41hFe9n83OgV10wbDPVr
	 7v1iX6Rb5NNTGTW666dMKMnidI3PRV7OuJ+ZVr8TKrlIppvtRkXU2sx4GXOn8StQle
	 MWqs5GmRcugpxJGvGsnDyjvXPOBquZ9Nt4FKf8qg=
Date: Fri, 11 Oct 2024 10:03:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: henryl <henryl@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xhci: tegra: fix checked USB2 port number
Message-ID: <2024101116-popper-grid-1e58@gregkh>
References: <20241011072240.42978-1-henryl@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011072240.42978-1-henryl@nvidia.com>

On Fri, Oct 11, 2024 at 03:22:40PM +0800, henryl wrote:
> From: Henry Lin <henryl@nvidia.com>
> 
> USB2 root hub in VF may contain less port number than supported USB2
> phy number. Checking all USB2 phy number here would cause invalid
> memory access.
> 
> [  116.923438] Unable to handle kernel paging request at virtual address 006c622f7665642f
> ...
> [  117.213640] Call trace:
> [  117.216783]  tegra_xusb_enter_elpg+0x23c/0x658
> [  117.222021]  tegra_xusb_runtime_suspend+0x40/0x68
> [  117.227260]  pm_generic_runtime_suspend+0x30/0x50
> [  117.232847]  __rpm_callback+0x84/0x3c0
> [  117.237038]  rpm_suspend+0x2dc/0x740
> [  117.241229] pm_runtime_work+0xa0/0xb8
> [  117.245769]  process_scheduled_works+0x24c/0x478
> [  117.251007]  worker_thread+0x23c/0x328
> [  117.255547]  kthread+0x104/0x1b0
> [  117.259389]  ret_from_fork+0x10/0x20
> [  117.263582] Code: 54000222 f9461ae8 f8747908 b4ffff48 (f9400100)
> 
> Signed-off-by: Henry Lin <henryl@nvidia.com>

What commit id does this fix?  Should it be backported?

thanks,

greg k-h
