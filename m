Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B03140E3C;
	Thu, 11 Apr 2024 12:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712836811; cv=none; b=cjv9Ke7+S355jCdpRM6u3ooTi1MXSBGu6aZ5p1O1PTrCo64H7j2Rgom3S4Wg3Rwxnyco56PkccrEW8vPhG78DfpY0hW0OCcl88JMCuT+IDF70CaAhBSB7CaFLe1NJlw4AZvC6P00pAZYCC+A6cyllo7HpUzmKs1a5216NQiyAQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712836811; c=relaxed/simple;
	bh=4qHw9PeMb74t/+NErXIxFc+9EeavhtL59hqszWN1wz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWX4AOBDjx8bcRGfACKuVNzlC6+18GNulIL5V76m51GK5iofFsNzY7F4ekgXe1YGifJVjYW7bRUT++RyZhlRViSHaxbn+O4LaVmIyLAU8kZBgfCmYzLIhamyJM/eIsYhm+gBxSGlSc5Arc3PV9hfJhZBb3HapsJqfgr8iVi6hoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lCprXEEY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lCprXEEY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E396FC433C7;
	Thu, 11 Apr 2024 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712836811;
	bh=4qHw9PeMb74t/+NErXIxFc+9EeavhtL59hqszWN1wz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCprXEEY87W85K+ZgY8YFkuJXfkFbF4518BLD9MjQfnrwfuxSDK1tD60D2D0/++ZO
	 Fo13jddcELgJcMpGMYEgJKolsufwLZBT1vSm5O+LkUvXOQ62pJ7khKczDgytx00uxj
	 QNIy3tPQs9JW6ASUiy0EJQCQ+RJif2N0FcQpmmFU=
Date: Thu, 11 Apr 2024 14:00:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
	thierry.reding@gmail.com, dan.carpenter@linaro.org
Subject: Re: [PATCH 4/5] staging: nvec: make i2c controller register writes
 robust
Message-ID: <2024041156-renderer-shrunk-6da7@gregkh>
References: <20240406123123.37148-1-marvin24@gmx.de>
 <20240406123123.37148-5-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406123123.37148-5-marvin24@gmx.de>

On Sat, Apr 06, 2024 at 02:31:22PM +0200, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 17 deletions(-)

This change did not apply to the tree, can you rebase it and resend?

thanks,
greg k-h
