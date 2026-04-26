Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD6A36F418;
	Mon, 27 Apr 2026 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261827; cv=none; b=CAsq5F1khq9nbDKxldh8pq7AAuBN8eU+1Cj6h3BPpjHEo5odDW28uyUrpvhthzhO7sCC6gL7wDJlpycOCCHjZ5GYs4jaTPVNhVYce9o0/1fprvs1fLhPcOkc4PnIBpQ/VKGOjWU+IUWYPgkBqTUDdsq/VpknrXwd970JoTt60cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261827; c=relaxed/simple;
	bh=zuJsPqy3O31z0XMoNbFx0hOzOOhy5k3SsT2z1HvMEf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TN90dQS0Bq31N7duNqu4wX/v9hbwLQAgbLt9mt/PGH+IYpo5U1Fm3wsdCDNynMsj8OtLAWKK6zEHsa+SotnYJ3EByGVg6WszoDH54k33A0ZT3IPhNevhRVvShl//YaLdwJjgeWGpeU30rbJYQtg7IPduusk8452YugGbf2I7wIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xaaj7Sj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xaaj7Sj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E4CC19425;
	Mon, 27 Apr 2026 03:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261827;
	bh=zuJsPqy3O31z0XMoNbFx0hOzOOhy5k3SsT2z1HvMEf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xaaj7Sj3pljLJ8ChyIGOidw1GHE/SR5CDwbTv0YrseVnK/AdxxcStqd0lsoBYQVnS
	 eC6UKVr4NcedlR43AQXw8zZ07y8AhZHlQOkZ5e3RM2zAju4YCdlRm6ZtDDjP6csH7T
	 AI3knFd3VuM29hneFtZUaJbAXO0ors9D2JFFyWxA=
Date: Sun, 26 Apr 2026 21:01:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: marvin24@gmx.de, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: Fix block comment formatting
Message-ID: <2026042644-charm-cane-aeb9@gregkh>
References: <20260411140038.5041-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411140038.5041-1-shyamsunderreddypadira@gmail.com>

On Sat, Apr 11, 2026 at 07:27:42PM +0530, Shyam Sunder Reddy Padira wrote:
> PLace the closing */ of block comments on a separate line
> to follow the coding style.
> 
> No functional changes.
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
