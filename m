Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C682F744F;
	Sat, 20 Dec 2025 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224188; cv=none; b=hWki7hen0KPUwVCFCuZvp9gxR0ep3e9sdoaJEUDJy6BRkp5xgLKF8tO6PrPnhxaSvno+zD4ekL9PkDPdrv1RlOl0//KSj9iY6IL6Y8g9I+9cTmU5YHg0d7r+bhYaUGceYsaOPZmukVfG8m+bp/T6NtK0Yi09yly4fJ0sStw2m7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224188; c=relaxed/simple;
	bh=MMWFhp6UjQrrvkq+sdlvanrao7RCPLjOum5PkZi0J2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYeOTFJpjHIhl5g6fFQR0cwnDxzNrNyUZ9Po/3sIfGjt2a4rg+wZzDTbQbjKUzZPHqFFsFAM27kbsIy2/oBLiEKSRmz5tSBqgRpxWK2LkTf49EexOUm8m7NUe/LUkNkrlf5frHPA6I19A43ETADZX0IYDVYxg52U3P/fZrk5MCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TPMphdW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TPMphdW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FCEC16AAE;
	Sat, 20 Dec 2025 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766224186;
	bh=MMWFhp6UjQrrvkq+sdlvanrao7RCPLjOum5PkZi0J2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPMphdW64VYUkWkvPSnyUSpdf9IWuwOYtlFne/VoGM4gmKKJBTgrl1O9ihdmJwIdf
	 n8Ou2gAA42cgAIAIiOebrwdsPk5DgShw+FBfHQXHyGFcbUwUdOOhhB7R5yosDbKCne
	 92/VI0Fw0lTQfC1dCNDIVRvBbfwFI5ZarGxE7wHM=
Date: Sat, 20 Dec 2025 10:49:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Preyas <preyas17@zohomail.in>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace short udelay with usleep_range
Message-ID: <2025122012-paradox-spout-d45e@gregkh>
References: <20251220092229.16606-1-preyas17@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220092229.16606-1-preyas17@zohomail.in>

On Sat, Dec 20, 2025 at 09:22:29AM +0000, Preyas wrote:
> From: Preyas Sharma <preyas17@zohomail.in>
> 
> Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 263774e6a78c..6ffe5e8656d1 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(33, 66);
>  			if (nvec->rx->data[0] != 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");
> -- 
> 2.43.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
