Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD020ADD9;
	Fri, 11 Oct 2024 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728636295; cv=none; b=qWBPvriOuPp+ltpP4e4wQEnt/BgcvV9MywpnwsY0uA9PJub+A1ylnbvAxBXniGdTh/nxCG2UC4n7fBRDbMS+Ex7H+9Yh+QHV9r+TVAZ73w1VlkuDRgLpRQal4BtSFsGf47RGt2HTpwWY0NZq3LR8GunKsPtOXa9lIpAJ9J3EoHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728636295; c=relaxed/simple;
	bh=hFymCx3wT8runicksTAPyLBdJ2o/39gbd6pg3UWLQMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpuQEBJ6xbMFzJWR6P7Z2NlgAZSqKJEXjUbl+uhtfwrmlcsJu52l3F0uyTJd9oZi5CA8fQtyuIKDOycRISBwlvsO8MwGKHSQVSqvF3xWQYbIfctbIngq+aSk9HovMKkPEMRFw+sQx0+AyXPi8mmmmFZ5By821mEfif7mAdJdGOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uSo2ZORq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uSo2ZORq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD996C4CECC;
	Fri, 11 Oct 2024 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728636295;
	bh=hFymCx3wT8runicksTAPyLBdJ2o/39gbd6pg3UWLQMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSo2ZORqf19Kw1ouIm4QDwUBiFbu7b6CqqNbJ0ZmeR9Nk6E7TL0pNuIcXnHFwpbt/
	 iKUVbNVEIRJhbRxmk1zLik3Q5stb4coGPrq2F7nLfj+N/WhxinmnsNIlr9uWJWDz2t
	 qB6ACf8T6gc3WlkobgnQ7AlEvlpsCBP0cHQrCPQk=
Date: Fri, 11 Oct 2024 10:44:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Henry Lin <henryl@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xhci: tegra: fix checked USB2 port number
Message-ID: <2024101134-generic-print-7244@gregkh>
References: <20241011072240.42978-1-henryl@nvidia.com>
 <2024101116-popper-grid-1e58@gregkh>
 <CH0PR12MB5089B286379ADB50E3C05C14AC792@CH0PR12MB5089.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR12MB5089B286379ADB50E3C05C14AC792@CH0PR12MB5089.namprd12.prod.outlook.com>

On Fri, Oct 11, 2024 at 08:32:27AM +0000, Henry Lin wrote:
> >> What commit id does this fix?  Should it be backported?
> Below change is fixed. It needs to be backported.
> a30951d31b25 ("xhci: tegra: USB2 pad power controls") 

Great, can you resend with the proper Fixes: tag and the needed cc:
stable line as well?

thanks,

greg k-h
