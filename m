Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542E19F126;
	Wed, 11 Sep 2024 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065128; cv=none; b=DtyJ8NPEL7mshOc/9QaLj3KvfzEzqft03Of4oDWQima5u4z/jxIOzmDuRWjlI2xURtpMB6IB7tAeSBjDsyZFqr6ji1WneZYt/X0dRkKFMkXpFlNyNZFYyf36jdmcRV2RWo3Qo81ONmBdskV0qpT91DIsttcSXntC69U4MSPZNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065128; c=relaxed/simple;
	bh=47cG1Kvq+tZ47cFBkPMcztAi5ZZL6hiekOHUTISHWxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIYqdx87kbbHmbc54Fy71Q1QI2HuDrXdHaXRLvxWnk545Xm7qLk8hiP2WxFOy5LJkaiU4p/rG52MVCmctFTIX+X+3IprDiHKHtzJ0lIFRmBrrvyr+1Qi/K4NGX9EYYEzWBy9CkuSkMxo18x+E3ZGPdTcix5Mmsq3cmGYdVftd8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Anlhz+DL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Anlhz+DL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E22C4CEC0;
	Wed, 11 Sep 2024 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726065128;
	bh=47cG1Kvq+tZ47cFBkPMcztAi5ZZL6hiekOHUTISHWxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Anlhz+DLIzXvVqPPl+rOTh42G8dMs0X9xcnCcNh4ytGg+yBh1IXZodW+Blak+ta/w
	 iBdkl1y5mumQGWexvEGn9a9f/FlK+i1feAmRq5W6CUcI/XwnD8nl/o15TSxSBABuLw
	 qPJWl6DzilHuzDuTFA7ATzM7jl/42CSK6ike1SIg=
Date: Wed, 11 Sep 2024 16:32:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
Message-ID: <2024091152-impound-salt-c748@gregkh>
References: <20240910130019.35081-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910130019.35081-1-jonathanh@nvidia.com>

On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
> The following error messages are observed on boot with the Tegra234
> Jetson AGX Orin board ...
> 
>  tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>    with 1-0008
>  tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>    with 1-0008
>  tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180)
>    with 1-0008
> 
> In the above case, device_link_add() intentionally returns NULL because
> these are SYNC_STATE_ONLY links and the device is already probed.
> Therefore, the above messages are not actually errors. Fix this by
> replicating the test from device_link_add() in the function
> fw_devlink_create_devlink() and don't call device_link_add() if there
> are no links to create.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

What commit id does this fix?

thanks,

greg k-h
