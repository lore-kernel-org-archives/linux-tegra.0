Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF10179950;
	Thu, 27 Jun 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495681; cv=none; b=tcpNdUUTaqc7mHDN3R1RhDSGenmW6uhPoJdx6zKZ33Gu3h2Tsv7xThk/eFtL/tYrbffqrI1V/MipYgNARvaTUOqa8UfGaa/E6OC3435+kQ4H2V6rOW1Fd5Y2GdctdGwrsR2j26q0nWGIjv/LhYpinVW7dTGiHgeJdoDkW9ZSoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495681; c=relaxed/simple;
	bh=Dwy2s0y95mzx1iEnVA/PRbR0NHTx0TmBwaZcUK5Vojo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKrW8g8o1fB9u+RHrA6zenEJ9yfIKOplaC+vJs4ztOO69Vo+lNQNCFL2HnlLfqRJVn2NiJkzAm55EDIVcfwyAVUw8SbVMKBO0rurysKbho2/pRkBOIuIjKzvaCR6n4I80Xrd0qXGl91BvrMHoTgYmLanN6Wi5rG2BbSu9OqUZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rsQLz/Wp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rsQLz/Wp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92D1C2BBFC;
	Thu, 27 Jun 2024 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719495680;
	bh=Dwy2s0y95mzx1iEnVA/PRbR0NHTx0TmBwaZcUK5Vojo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsQLz/Wp4vpMICXPYzxUdOxkuShwlOa7QStlklxv+m/SD4Deq73RMkSbJQ9zTnhwp
	 kRQMrYteatU/wL9HGblx+ps7PHafwuDuyAwIy25O+keNRupa6OqCbbxVdsnagb0hcB
	 qiZqprEMqibtSxXL7ZITDhTlyqYfdcPc/x+64rRs=
Date: Thu, 27 Jun 2024 15:41:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Mounet <tommounet@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: nvec: Use x instead of x != NULL to improve
 readability.
Message-ID: <2024062752-jockey-wife-7017@gregkh>
References: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <667c8a0c.050a0220.9e3d5.3b80@mx.google.com>

On Wed, Jun 26, 2024 at 11:37:14PM +0200, Tom Mounet wrote:
> Issue identified by checkpatch.
> 
> Signed-off-by: Tom Mounet <tommounet@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e5ca78e57..814eb121c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -300,7 +300,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>  {
>  	mutex_lock(&nvec->sync_write_mutex);
>  
> -	if (msg != NULL)
> +	if (msg)
>  		*msg = NULL;
>  
>  	nvec->sync_write_pending = (data[1] << 8) + data[0];
> @@ -322,7 +322,7 @@ int nvec_write_sync(struct nvec_chip *nvec,
>  
>  	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");
>  
> -	if (msg != NULL)
> +	if (msg)
>  		*msg = nvec->last_sync_msg;
>  	else
>  		nvec_msg_free(nvec, nvec->last_sync_msg);
> -- 
> 2.39.2
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
