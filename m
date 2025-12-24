Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543613164BF;
	Wed, 24 Dec 2025 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766577774; cv=none; b=bWBKNAHKV76fpHRyrufU9wJK71dCIA/WN5Gt/iBfm/3cetNGQjT63RLG9Onc9DG5cGU0zy43H5g8XXF2qJwT39rGfbq9/wlHi/7oX546jyice//UOMxsQ1vLYdZKzcViTql1zYKgtbjEpzkspE03RcoZ0IDAZPabykP9046GlIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766577774; c=relaxed/simple;
	bh=aihrPXkhFmox8dfNiNRbnrxOIaKKWlfMiFZ/19Ticos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wo7C/EtOHkU+lY0V3T2SH+nqiARjAd/gM5kvJsJcZtc5h5V8GTRWa6M9QCw8QWpXbjMwTeZ9IJW0QK1kNrwBZ+HGS9/lLmyBcwhx/3GKpn7en5iNeH7w63/+ThQjv4ft6tAWo66zGDnmKugDWKF1xrRB+CbEnubfJCBPFp+Ll2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Pgcr16ko; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Pgcr16ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0214C4CEFB;
	Wed, 24 Dec 2025 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766577774;
	bh=aihrPXkhFmox8dfNiNRbnrxOIaKKWlfMiFZ/19Ticos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pgcr16koCFQ7mJLaLjA9sri2/LimIeGu7UwCVGQc0HZ+uJJQ+cyWNFaR/hUdIKWdO
	 Rq9CZJxhjwaVpMgJec1Tmw90FcGnd+TSdwO7WksB4MlTvw0jbXvS1uKq75U+HOm1Jr
	 nsBl+B9CLYeVx5iLIvWZxsoqXUu+ngbtol+DuCmE=
Date: Wed, 24 Dec 2025 13:02:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: ShadowMonkee <sshadowmonkeyy@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace udelay with usleep_range
Message-ID: <2025122414-sedation-hazard-598b@gregkh>
References: <20251224111651.217679-1-sshadowmonkeyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224111651.217679-1-sshadowmonkeyy@gmail.com>

On Wed, Dec 24, 2025 at 12:16:51PM +0100, ShadowMonkee wrote:
> udelay() was used for a short delay in the NVEC I2C receive path.
> Replace it with usleep_range(), which is preferred as it avoids
> busy-waiting and allows the scheduler to run other tasks.
> 
> Signed-off-by: ShadowMonkee <sshadowmonkeyy@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 263774e6a78c..dd92f186e0db 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(33, 34);
>  			if (nvec->rx->data[0] != 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");
> -- 
> 2.52.0
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

- You sent a patch that has been sent multiple times in the past and is
  identical to ones that has been recently rejected.  Please always look
  at the mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
