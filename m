Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5271837418C;
	Mon, 30 Mar 2026 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885799; cv=none; b=fdTKgpgL9jjlFXNR/mw4BJrZSx6gow3WOgPGJzzviz72rJaoy1Zv9XWj3lpF4pa1ZouoUGyqBIAXYZTbAJTXtLEGuZGn03LsNvS+5ytxwo7iwQtbcFZU82ej0JOWGYIUpYjRwIlP6yBxGokgiKAzrV3fSPby/K4pUEee96gRXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885799; c=relaxed/simple;
	bh=jFzutPKmwR4H7YIu8Qn5NsraS/tWHjU6p8juKpQbHZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz+fhIuYOqkaoKJv+wZhrFh0pUPwf2+D6bvBtacpoMu5K4jsSD6T7T5s6Io3/RaAn5zxBuvzB3jY2uWc38VY1krMaM50T5ATvZgcd3gA3U222xaB4UlnKEixNB3G4Z0glKtVQy2Odp1cMrCcQWs53QVOR9csidRq9Qnnwiak5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vHrrryRj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vHrrryRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CF4C4CEF7;
	Mon, 30 Mar 2026 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774885798;
	bh=jFzutPKmwR4H7YIu8Qn5NsraS/tWHjU6p8juKpQbHZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHrrryRjA0bM6gE02Hgk52j7rXL80DitBIPY+THNyHjotnOi8l9UBC+i7qGIvh3tc
	 gkBXQRES2o8DmFVTIC3xJ8Tiuc36211g4JD0rfXpJnLwf/YwrO7KIDq4e/vf9n1Cb4
	 sMarwVgy4FoGVbkEESJaf1iVubPh6WsCLy6M2t4k=
Date: Mon, 30 Mar 2026 17:49:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?H=FCseyin?= Can Erdem <erdemhuseyincan09@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment formatting
Message-ID: <2026033037-dealt-handiness-a92e@gregkh>
References: <20260318170604.10254-1-erdemhuseyincan09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318170604.10254-1-erdemhuseyincan09@gmail.com>

On Wed, Mar 18, 2026 at 08:06:04PM +0300, Hüseyin Can Erdem wrote:
> The block comment in nvec_interrupt() does not follow the kernel
> coding style. Multi-line block comments should have a * at the
> beginning of each line, and the closing */ should be on its own
> separate line.
> 
> Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08..0e655f79e 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -660,7 +660,8 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
>  			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.47.3
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

- Your patch did not apply to any known trees that Greg is in control
  of.  Possibly this is because you made it against Linus's tree, not
  the linux-next tree, which is where all of the development for the
  next version of the kernel is at.  Please refresh your patch against
  the linux-next tree, or even better yet, the development tree
  specified in the MAINTAINERS file for the subsystem you are submitting
  a patch for, and resend it.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
