Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ADFA2D;
	Mon, 20 May 2024 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716195173; cv=none; b=qZumnMpNXwWxzv7Mkv+2tgAqEK+MENFYPrD8/DKobAUwekmIkiawtz+A405HtZggCnCwS+3FT8FpMbfHwUA/gkYfvyeWPkIEMT9qi1oQaCudjFtTomM5Uxnff4uzp3dSwiMqP2CLOaW3O4fOwzBtDCpS2Vdt5abGNWJhDZze388=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716195173; c=relaxed/simple;
	bh=kB21gXzDUVU1T60RrVglQWhc3cVdGIqTogbho9uTI8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLCxQd0VpYcUFNjqTrGn6wXwS/b4mxp4aVnDDuxhEby37niRTCplOTKi2Th+mGyhE3RXQwsHenmcwugVOmfUcRzhvlN0fs3C2plcijLz7LFIHRbhYQzbjOaKIh3peO1pvFxY4IH7qOmqRxVXhBVTKSdCGv49qLesd+VUxr5NzuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qwXyibGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qwXyibGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 424AAC2BD10;
	Mon, 20 May 2024 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716195172;
	bh=kB21gXzDUVU1T60RrVglQWhc3cVdGIqTogbho9uTI8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwXyibGQM5g7lNX4OkG1tLxO+ebJ6UktqOQ9R96pkM4bE4oj17z3VRRGxMCA14Mur
	 SMdjXog4oVaPyLMJKaXW72IGSI41yIH52zi1x0EqftiLUXWtjA6ynXFd4PIrLLN6kx
	 M3ZZfaklVX4+6drlPmw/TVTOSP1+LRA/CBbtC1bY=
Date: Mon, 20 May 2024 10:52:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes robust
Message-ID: <2024052033-decibel-clapping-aa9a@gregkh>
References: <20240421104642.25417-1-marvin24@gmx.de>
 <334d0a42-9dda-a21b-2650-d33187525eb9@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <334d0a42-9dda-a21b-2650-d33187525eb9@gmx.de>

On Mon, May 20, 2024 at 10:11:20AM +0200, Marc Dietrich wrote:
> Hello Greg,
> 
> On Sun, 21 Apr 2024, Marc Dietrich wrote:
> 
> > The i2c controller needs to read back the data written to its registers.
> > This way we can avoid the long delay in the interrupt handler.
> > 
> > Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> > ---
> > drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
> > 1 file changed, 24 insertions(+), 17 deletions(-)
> 
> I think I answered all remaining comments. Are there any other
> objections?

It's the middle of the merge window, sorry, will look into this after
that closes.

greg k-h
