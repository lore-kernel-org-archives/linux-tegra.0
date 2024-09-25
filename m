Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAE1A702;
	Wed, 25 Sep 2024 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278107; cv=none; b=IvMztmrZBYWM0YA5GN9fttBiBwc4uZqHkvqi6bVUh9jXBKr8n2LgAdYlMYqFX8lxG1nuA66i7wOkSUHyzWQIUMAe7x7OuHvGa+fAWHgTvLLOCwTMgAPG0RoS3hSPVQ5D2c1nEcW3NZCJfoSNUtTAv1sfWdQ5FCKO0zKmJlEGs6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278107; c=relaxed/simple;
	bh=jo1D9Vg9uM2d90sao+PuSuV5IgRK4XoFWpGG9r5MCsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5zdj/o9CZ3Bfz9Z//Y7abCrMRi+AgUcqHWfbNJc4Gd1rBrcXVyJiGVu34ohPl06LGCTzhDG518zqvNVvXLpF+GUrohlLEqor+zgrrs8he66rfXobL9J7ywJMztxqyjVbsdtETrMsvM4AQYEQWWb51xTZfOxZ8+UeZPUCxFDEkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x5dD3BJ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x5dD3BJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78672C4CEC3;
	Wed, 25 Sep 2024 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727278106;
	bh=jo1D9Vg9uM2d90sao+PuSuV5IgRK4XoFWpGG9r5MCsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x5dD3BJ1bDZVY1N+M6A0tpLAGdFkz2RkpPbRxJ0arGxdy35byNdy1VYok7snzQwLE
	 IbaCCLKqfebYikrUulWTDIh3tO8lftkEw6VSazesFnzthOXk0AmCpjCFsOXL8gjF4y
	 aapdCPG2cv+x1AdTmfaDQxJbOe62zUMrTv+6k8vM=
Date: Wed, 25 Sep 2024 11:28:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, 
	helpdesk@kernel.org
Subject: Re: Bouncing maintainer: Peter De Schrijver
Message-ID: <20240925-jackal-of-flawless-freedom-58a6fa@lemur>
References: <20240924-dachshund-of-optimal-politeness-840d3f@lemur>
 <dee3wpp255qhhb7znfuqyarshhv6nueq6nsls2gikbzfscsmgc@6nrvnhgbvw44>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dee3wpp255qhhb7znfuqyarshhv6nueq6nsls2gikbzfscsmgc@6nrvnhgbvw44>

On Wed, Sep 25, 2024 at 05:26:21PM GMT, Thierry Reding wrote:
> Prashant doesn't work on the clock driver anymore, so Jon and myself (as
> the Tegra architecture maintainers) would be the fallback maintainers.
> We have a regex that should catch this in the main Tegra entry, so one
> option would be to drop the Tegra clock driver one.
> 
> Otherwise I can also send a patch replacing Prashant and Peter with Jon
> and myself.
> 
> Do you have a preference?

Your call, but I think removing the subsystem entry if there is a more generic
match is the cleaner way to go.

-K
