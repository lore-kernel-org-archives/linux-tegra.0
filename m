Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A57537188B;
	Mon, 27 Apr 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261829; cv=none; b=jSeZSX4FhqkcwngWikgTtJa2LJHpWKq/LKtQkn0KgoxBbPdNDAaOcdZiHMYCu1ao1q9cbH2eOL6EZuCwtpfNfUdHO/hEE8dCHDmZijSjSpWeSGfPDGdiR41Pv2JgGphoo2AgBhSFQFC35Iq+WiyT3WSq/7CMaVIeo3SSMq6LbRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261829; c=relaxed/simple;
	bh=SNKExMtP0mF6P9s24J9Raxbs30ghElwvYVrehrWh/Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibye+x9Fm2oDt6t1zXnN1aIiPU7UGOcBdKx/S2d2JKY9APT2XJGfGwukDadsdaSidcH8Yb7axz4E17/rBGDYilc9btUcpRu5HIDvcc5Vl0XMqaJm+NKcVDjLlRnOn585vb70lGnCdBGiGEX0K3Ubu3X8lsZRYQ7ZlRQpAO7+ac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p3+GdMzx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p3+GdMzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48A3C19425;
	Mon, 27 Apr 2026 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261829;
	bh=SNKExMtP0mF6P9s24J9Raxbs30ghElwvYVrehrWh/Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p3+GdMzx9N6mXknwy7mv7s5xay+h/Nk0EWHeb8hFR4ie57at4fzHtp30qPnkz7XwQ
	 F9VgO8h/qg6krHw+ciwAeTuGfrFrOqNdePrvkaJ0L13CgR37fGQUJaf7Zdatu1poFR
	 5UGzpEpj3Bf+AkVknsLBuBbmGvbawxoWMeqg23Ds=
Date: Sun, 26 Apr 2026 21:01:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: marvin24@gmx.de, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: nvec: Fix block comment formatting
Message-ID: <2026042651-unlit-botanical-9aaf@gregkh>
References: <20260411144326.3366-2-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411144326.3366-2-shyamsunderreddypadira@gmail.com>

On Sat, Apr 11, 2026 at 08:01:12PM +0530, Shyam Sunder Reddy Padira wrote:
> Place the closing */ of block comments on a separate line
> to follow the coding style.
> 
> No functional changes.
> 
> changes in v2:
> -Fixed trailing whitespaces issues.
> 
> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..4799510d2d12 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -659,8 +659,10 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec_tx_set(nvec);
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
> -			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			/*
> +			 * delay ACK due to AP20 HW Bug
> +			 * do not replace by usleep_range.
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
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
