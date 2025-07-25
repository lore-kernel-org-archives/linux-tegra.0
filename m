Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA51C242D9F;
	Fri, 25 Jul 2025 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753436666; cv=none; b=Lj0xK34LLrMXGaxV8hdcIKfqfnolyyTxX+pRwCcQSQQ1nfThS4qRrvfw4mBERc8WaeNjmOPPMrOnL+r59cB1kp/FGRp8UyNeQBGoLIDCYMZGfWhz2L+k3Xm1AMY3kEo6pHeKO+tnmH9XDUIIIhuwUQtBV3wd9PBhJe+G4GSSstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753436666; c=relaxed/simple;
	bh=LIqDlDVavLMaiRA3G6hgN19ixsjwuYx8keyApXoqouw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2D4ml6bHqR9PJbK5qOspqmFoEph+PtDydex3ormJnUdzbwtDjUfyuaEE2Dkug6njEvWmocPpzk2RW7k20Z64bC+DetGZIyM8jPsFpofFG1JzTyt4JS/Xn58jf4SJQbwl83BKvCbon7xfNEsPQYy3chPvZ4414Bh/ZbKLlviANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l1EcN4F0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l1EcN4F0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34DDC4CEF4;
	Fri, 25 Jul 2025 09:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753436666;
	bh=LIqDlDVavLMaiRA3G6hgN19ixsjwuYx8keyApXoqouw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l1EcN4F08vXdo4F8TqlKVCenzoq5+xsDpu9tKy6qNrjZ3Sl8N5Vw383LYx34TK52x
	 c/q6/kvVhsfkAca9R9tXArl4j0LTBWJDNkkMNiYL6QHaGsdSzyz7C996Ou8fONIvkF
	 BkdcCeLJ/ErRBSk5Q30VMbm2yYAildRW1lkw+8oo=
Date: Fri, 25 Jul 2025 11:44:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wayne Chang <waynec@nvidia.com>,
	Felipe Balbi <felipe.balbi@linux.intel.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: Fix trb_virt_to_phys() error value
Message-ID: <2025072515-dugout-chevy-ccea@gregkh>
References: <20250725090540.51958-1-fourier.thomas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725090540.51958-1-fourier.thomas@gmail.com>

On Fri, Jul 25, 2025 at 11:05:33AM +0200, Thomas Fourier wrote:
> 0 is a valid DMA address, so returning DMA_MAPPING_ERROR in
> trb_virt_to_phys().  Also, dma_mapping_error() wouldn't
> flag 0 as an error address.
> Checking the return value directly because the dma_addr
> does not come directly from dma_map().
> 
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index 2957316fd3d0..5dd3452bddbc 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -900,7 +900,7 @@ static dma_addr_t trb_virt_to_phys(struct tegra_xudc_ep *ep,
>  	index = trb - ep->transfer_ring;
>  
>  	if (WARN_ON(index >= XUDC_TRANSFER_RING_SIZE))
> -		return 0;
> +		return DMA_MAPPING_ERROR;
>  
>  	return (ep->transfer_ring_phys + index * sizeof(*trb));
>  }
> @@ -1480,7 +1480,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
>  			deq_ptr = trb_virt_to_phys(ep,
>  					&ep->transfer_ring[ep->enq_ptr]);
>  
> -			if (dma_mapping_error(xudc->dev, deq_ptr)) {
> +			if (deq_ptr == DMA_MAPPING_ERROR) {
>  				ret = -EINVAL;
>  			} else {
>  				ep_ctx_write_deq_ptr(ep->context, deq_ptr);
> @@ -2836,7 +2836,7 @@ static void tegra_xudc_reset(struct tegra_xudc *xudc)
>  
>  	deq_ptr = trb_virt_to_phys(ep0, &ep0->transfer_ring[ep0->deq_ptr]);
>  
> -	if (!dma_mapping_error(xudc->dev, deq_ptr)) {
> +	if (deq_ptr != DMA_MAPPING_ERROR) {
>  		ep_ctx_write_deq_ptr(ep0->context, deq_ptr);
>  		ep_ctx_write_dcs(ep0->context, ep0->pcs);
>  	}
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
