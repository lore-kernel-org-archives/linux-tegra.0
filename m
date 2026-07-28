Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BC2949E0;
	Tue, 28 Jul 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222602; cv=none; b=shXLVexrWT8hc0wxns+x6MKuYN+4vGfn/aab1bwHNvxaMpfeN4lRZKc8fh1vb+JHL9Wxt3rKUbg6Snekm4NYtGKjGOsJBEqL9ayqTlmJlOG6kPp6JxWZTf/Cvk7bMaQDDL1IfqTp5/tVUGNWb4Y/RI2aZoSzqZWmW1dZxtqNt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222602; c=relaxed/simple;
	bh=vSCUb1r/Ckx4KsjNTxIbOkTqBD+6saJBdJZiGySr8q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OumQX8fNQena53kN2eMfwAdH+rnFEYeHuFwbngQu2OckXTkjVIuQXxY7dlFnHhVx/2JezX8ZkAZ0QKd7uTAR94KseTPPz1YZUz+1YY9hK/mL8gRUTmT74arEMZV7BLy4Huaf/0ajpytfMVFHnJ7dhRpYdhWakcW03CU1sDSNEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nYgxC1VQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nYgxC1VQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CD91F000E9;
	Tue, 28 Jul 2026 07:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785222601;
	bh=vNiX/EZ7lt9UbNHfBvZWAh4cfxlwEUAKfBkZsw/ijl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYgxC1VQXysGzl9+C9MT+vD3nEnnsnzJjwmykVljP6QMRsd98eQlR8zdMsCZv7/28
	 ykyXAMnK7QOUlzcrGzrRSeyqA7o83ktO5E9Qh8FUiwVUVqRwM54dpQ/cjqrzhKqdoU
	 6Ij85gG5gQ8NtOVjgvcrF6MGOvVKiYoFajs5Mgao=
Date: Tue, 28 Jul 2026 09:09:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Aayush7352 <aayushdixit924@gmail.com>
Cc: linux-staging@lists.linux.dev, Marc Dietrich <marvin24@gmx.de>,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] staging: nvec: fix power-off path to not depend on
 workqueue
Message-ID: <2026072834-childlike-folic-52ca@gregkh>
References: <20260721095646.80663-1-aayushdixit924@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721095646.80663-1-aayushdixit924@gmail.com>

On Tue, Jul 21, 2026 at 03:26:46PM +0530, Aayush7352 wrote:
> From: Aayush Dixit <aayushdixit924@gmail.com>
> 
> nvec_power_off() uses nvec_write_async() which queues work via
> schedule_work().  During system shutdown or reboot, workqueues may be
> frozen, so the AP_PWR_DOWN message never reaches the embedded
> controller and the system hangs instead of powering off.
> 
> Fix by calling nvec_request_master() directly after queuing the
> power-off messages, processing the TX queue synchronously in the
> power-off context.  Also add a NULL guard for nvec_power_handle.
> 
> This addresses the TODO item "add atomic ops in order to fix
> shutoff/reboot problems" in drivers/staging/nvec/TODO.
> 
> Signed-off-by: Aayush Dixit <aayushdixit924@gmail.com>
> ---
> This patch has not been tested.  Compile-tested and checkpatch-clean only.
> 
>  drivers/staging/nvec/nvec.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 88c416ee0..938ea8f34 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -774,10 +774,23 @@ static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>  
>  static void nvec_power_off(void)
>  {
> +	struct nvec_chip *nvec = nvec_power_handle;
>  	char ap_pwr_down[] = { NVEC_SLEEP, AP_PWR_DOWN };
>  
> -	nvec_toggle_global_events(nvec_power_handle, false);
> -	nvec_write_async(nvec_power_handle, ap_pwr_down, 2);
> +	if (!nvec)
> +		return;
> +
> +	nvec_toggle_global_events(nvec, false);
> +	nvec_write_async(nvec, ap_pwr_down, 2);
> +
> +	/*
> +	 * Process the TX queue directly instead of relying on the
> +	 * workqueue.  Workqueues may be frozen during the power-off
> +	 * sequence, so schedule_work() from nvec_write_async() may
> +	 * not execute, leaving the AP_PWR_DOWN message unsent and
> +	 * the system unable to power off.
> +	 */
> +	nvec_request_master(&nvec->tx_work);
>  }
>  
>  static int tegra_nvec_probe(struct platform_device *pdev)
> -- 
> 2.55.0
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
