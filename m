Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF93D4116;
	Thu,  6 Aug 2026 07:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999803; cv=none; b=mYKnRe5gn7mhezdn4UwsHKs0k5+Us6Aq/Zurrnf23UgZkt0GjJHBfUVZfXGMXBoN6OCrjnjsG0h9ajj+jt9i+QSypPfkS+FxCOZ2+vAHa7H3QD14uhgPGNuaaHmJ5wyhrc2OQJs3mMLR/3M21wV1UhNRbugxKd7MHq8ojjcs6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999803; c=relaxed/simple;
	bh=48tnfKwV7NZXod3EJNi4YQ0rt/wzlofZI5ApZ4kY7cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ7vMFnbOEMMRmSmNqy/xmHffElbinJbiOHUm+hXsEqldR9COgLDoB5CnAFklYBFN6kw5gazcFvTuApLN6xDE1i/N3D4jxrgelrPmGIaGx2zyXK3gbk0w8FVLz462X0BnbgFIWWNSiDMeV/1KXcOwN3MNQiEMdiLZzqCUpcUsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g+K/XkTx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g+K/XkTx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BE41F000E9;
	Thu,  6 Aug 2026 07:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785999802;
	bh=FPxPGLBzcruAXuhhRYOBDz4X+yVK+jCdimS0zS+DXVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+K/XkTxQeb00Y7nrM1BmSVK1Mxtu7KqHpLo8UrUjsQGv/ik8geYTg/zBstZPFlUM
	 XZn3Czk9jNK0ChkhItkNNJIgzGsRZgnqEhhzaVrK3C431O0XuWO81zv01LpfyNMiYM
	 5ecNlTNeUH3AKUUsXjzR1FXQhBc+KUy438nMzJMI=
Date: Thu, 6 Aug 2026 09:03:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phucduc.bui@gmail.com
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: tegra: Propagate -EPROBE_DEFER from IRQ lookup
Message-ID: <2026080654-glass-swiftness-7068@gregkh>
References: <20260806063933.27331-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806063933.27331-1-phucduc.bui@gmail.com>

On Thu, Aug 06, 2026 at 01:39:33PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> re-probed when the interrupt resource becomes available instead of
> continuing probe without an IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index e7e6d569f1db..cb946eb7a65d 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1571,6 +1571,8 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
>  		struct irq_data *data;
>  
>  		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
> +		if (tegra->wake_irqs[i] == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
>  		if (tegra->wake_irqs[i] < 0)
>  			break;
>  
> -- 
> 2.43.0
> 
> 

As before, how was this found and tested?

thanks,

greg k-h
