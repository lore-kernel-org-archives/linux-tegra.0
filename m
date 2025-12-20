Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E8239072;
	Sat, 20 Dec 2025 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766226782; cv=none; b=Lo7IB/7LUUGolv9n3CQunjQJee1gxZyM2d1VdqnAL29xC7qb8AX+y4htaWNSXydeerQWDZACpDmv4yPDa1RfgIQYnrnE3R4RlSBIPaRHSYlebpL3xcKybdD+W2jeAMP8W1z2EY1+VrCCsXllUkx39stBqePOIxPq1iT3djhGocw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766226782; c=relaxed/simple;
	bh=7OHWNjjGbbBHGjOSMAqawui9xLFReCGtrJ4OXllTMys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVmOVhkHISRSxDKkSG56q1pCL2po1+er9DHUfGCdS8CxI98vla0z9EH+sO0OOx6NUTd3WMMN+mTU2nC+P/s4cy8AZEwKqJA1a3N7hJQIzy8bf6qt2HzrgvYL1bppU+vZ0H7y6PQvhvLO4RKFbUTT+Ger0I6ACUUmcVGmoIiyTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=asULF/kA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="asULF/kA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAF2C4CEF5;
	Sat, 20 Dec 2025 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766226781;
	bh=7OHWNjjGbbBHGjOSMAqawui9xLFReCGtrJ4OXllTMys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asULF/kAhV7iI2chZ9H9AQ25Ts4jrx9agWlb8MtFbXvBgcUG6vDa/vFVG1atqQxk6
	 jeheRkfVqgxEGRQcFSJLjI1hxm9174DlXRn3N6a/Hy9L7qiVyAHiwzbSeecLyoj6Ok
	 vR7qiVN25C7uULBxhLhJS07bS0H0ulZ7TfwID6PU=
Date: Sat, 20 Dec 2025 11:32:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Preyas <preyas17@zohomail.in>
Cc: marvin24@gmx.de, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace short udelay with usleep_range
Message-ID: <2025122059-dipping-granola-74c5@gregkh>
References: <20251220100849.41214-1-preyas17@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220100849.41214-1-preyas17@zohomail.in>

On Sat, Dec 20, 2025 at 10:08:20AM +0000, Preyas wrote:
> From: Preyas Sharma <preyas17@zohomail.in>
> 
> Hi,

This isn't needed in a changelog, please read the documentation for how
to write a good changelog text.

> Replace udelay(33) with usleep_range(33, 66) in the nvec IRQ handler.
> 
> This avoids busy-waiting while preserving the required delay for the
> first byte after a command, and follows guidance for microsecond-range
> waits.

What guidance?  And why 66?  Do you have the hardware to test this with?
And if you sleep, doesn't this get messed up?

Attempting to fix this checkpatch warning is almost always not a good
idea unless you have access to the hardware and the specs for it to
verify that this is an ok thing to do.

Please read the email archives for the many other times this has come
up for more details.

thanks,

greg k-h
