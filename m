Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06233B640;
	Wed, 18 Mar 2026 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847950; cv=none; b=prq/owUDx8DGIMLE86ZoJNqGiCijkTUdKlG/fYyJ7/ugDW6rYKhmn59b6+OhLrEc2voHSGqojiWVoscB3SrkYFMsf/9dp2foTxCLlacZJahh8xhCnMJdlKaNW2BKrm1NKnq6dgJ+4Akep//FS27qAb009mBeONISkQT5PDbnnNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847950; c=relaxed/simple;
	bh=+kVcKjfhnrW3a/zeW2x/m3CLhZI8PWe9eMZ/TpeITNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RThxNrnFYo6EtpfcSE6FcVBVNCrEu8hu1G8GmxH0Waz+wLX0gYfMqo0wiu7ih+IKQOo9o1YVULQtIywG20ErTTbfqpCKfsTsdV4uJa5HL8jeFmS9rIypsOHsxYvcqwcK8PA5cZsCIJ4RKTpjoHlpieExm/oRl9xp/Ap6YpiL5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VXTDdunJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VXTDdunJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6840DC19421;
	Wed, 18 Mar 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773847949;
	bh=+kVcKjfhnrW3a/zeW2x/m3CLhZI8PWe9eMZ/TpeITNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VXTDdunJQJRROcl7XV01ltBN7iL8GWxgH5UjQkplraztE0SQByy0VpKNpTl4L5dhE
	 Rzt9Ayp3BvhbhF6ExqRwMcKjeBjiXXgDBAAcrkYplH7PL9YkbrJQ8oj5DZ49Zu6EnX
	 f2YenC0EVFZRkeOCar5Pic2vX8+Gr3ai69EyWjZg=
Date: Wed, 18 Mar 2026 16:32:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin Bojorquez <dihed1973@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style in nvec.c
Message-ID: <2026031807-distill-itinerary-9038@gregkh>
References: <20260317120114.39057-1-dihed1973@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317120114.39057-1-dihed1973@gmail.com>

On Tue, Mar 17, 2026 at 05:01:14AM -0700, Martin Bojorquez wrote:
> Block comments should use * on subsequent lines and a trailing */
> on a separate line, as required by the kernel coding style.
> 
> Signed-off-by: Martin Bojorquez <dihed1973@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..0e655f79ea4a 100644
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
> 2.53.0
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
