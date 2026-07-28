Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E653C7692;
	Tue, 28 Jul 2026 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222579; cv=none; b=BGIke+MPV/hkKvQFQ5zy2Zw/iTamBlZENTtROaO3505fd1O0tc2TUZ4L2FwtxuSEqDFaCVmW/CeCEqHctvhYCs2grzVaI0vhwN+CVmHHPbW0bzCpuBucVOI9yKFbQarU6fu2Xk6UFwpyOfITzLnM9ZiCER0mGJAvlKhrX65vYZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222579; c=relaxed/simple;
	bh=ieFXZUrBOtarApu69Y3w/r0J2dVLqEncmLzYBqysX8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsX0ZSN/qLXDH4tNPGc1XqN3GNOJNoMQI4l97BFx/BlT7UGUXSV0naJTmJpKaPyK1LhevgSmGi6Io2HFcAZGqBV4xLE5z7M7FWntZgs7+7Z5dv5TdJFJiM3koZvpnoQU4O1ge9cd3BeOjOB1yFUj4Xfw4FoUzez2UjZmKmaS8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2Fw/kPGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2Fw/kPGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F3E1F000E9;
	Tue, 28 Jul 2026 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785222576;
	bh=tcvUulu5WSYpMR1B2W0gE4DEu2H7iz1v2vYAMm79+LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=2Fw/kPGk40is4ohXW/B4t7D3QjVAzCTy0kqLcIPx+kZN9sCAqHALrD9FQ0n5um7L3
	 32MeB6JY5Pdf2gnLcjjaJKM6hliDFuyU4E84WjAKwHV0SXciHxiI3rDgkN7mK3gpAT
	 5LotZoRT5HMfty9a2PSqtjhqwL+q+aFtcdHTOOz8=
Date: Tue, 28 Jul 2026 09:09:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: linux-staging@lists.linux.dev, marvin24@gmx.de,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
Message-ID: <2026072836-swerve-splotchy-bf8d@gregkh>
References: <20260723161823.23921-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723161823.23921-1-iprintercanon@gmail.com>

On Thu, Jul 23, 2026 at 07:18:23PM +0300, Artem Lytkin wrote:
> Replace strncmp() with a hardcoded length of 30 with strcmp().

I thought we were trying to get rid of strcmp() usage?  Why add it
back?

thanks,

greg k-h
