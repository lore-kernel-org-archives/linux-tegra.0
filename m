Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58666233722;
	Mon, 23 Feb 2026 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857563; cv=none; b=DDDfmsT0Ex60SPFHPU0GFy8xFen2urt7DroDa+dyrnO8SbmLocDYkWthkyZ9DHmC5GcrTQOBE7x2W1e+gHf/3uzVhWZHDQ3sg9MhxUf3mLn6Qgk5Vt8butHbWxIdHrDDAK8gZ/QcXZxdPxhBysluMnnklO+4fiSF3vH2R9rJTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857563; c=relaxed/simple;
	bh=UEl3OryBxR5zNBiFXmI3LfY+v2w2+T2vuAY32vrlqrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE6Pvy5Yj8OSS8EXvJFUH0gEPe8QiGwFkO2EwCDhXPfyQimD34ltf2x+zf4tx4XV9q1sWLnvKaGXkLa+FE0fzJP0CeCzR2lC7PbcOYROZ73SU3NhxIqt4hQRp9dlrsuv/Zc9M7YMdROTAd1Pq/662H7p3W+5rbpTk/upq/T8Xlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MlEyoXNv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MlEyoXNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F44C116C6;
	Mon, 23 Feb 2026 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771857563;
	bh=UEl3OryBxR5zNBiFXmI3LfY+v2w2+T2vuAY32vrlqrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlEyoXNvidEOIWLqb/c21B0Qqt+lHc0i0CqRYb2y8w5fTQZ969q1JQLevlpUdwKf7
	 JvUgprfbbiEuTdzdLOSfHHZdIbDXXRWleVbS3jw4AGWHRrLM2vAaJwSlWxLjuZyaeS
	 kj183G4o4Ar/901ryUeSoimtOmk1h+kdjUNgHK8w=
Date: Mon, 23 Feb 2026 15:39:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: yykkibbb <psykibaek@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style in
 nvec_interrupt()
Message-ID: <2026022350-emphases-crewmate-5cc4@gregkh>
References: <20260223143101.76552-1-psykibaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143101.76552-1-psykibaek@gmail.com>

On Mon, Feb 23, 2026 at 11:31:01PM +0900, yykkibbb wrote:
> Fix multi-line block comment to use the preferred kernel comment style
> with leading asterisks on each line and a trailing */ on a separate
> line, as reported by checkpatch.pl.
> 
> Signed-off-by: yykkibbb <psykibaek@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08..62013019a 100644
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
> +			 * do not replace by usleep_range
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.50.1 (Apple Git-155)
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

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
