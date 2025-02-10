Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A26192580;
	Mon, 10 Feb 2025 06:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167804; cv=none; b=Xrbb1ZlOyLwrC66zmc+yhbUjoKjj66kOwWx+z6FWzwOxJAngyCBrr+szJ8UtvFcgqQ9jGYseGu2sB2J9xwTc77HLEFr4O+/mXEvBnZvnOk/tRcdBtJitv2QtnhVV0JpGuVNqyByvhtHivYaFyHQ4oj7PClgPado9nMIxfyrNpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167804; c=relaxed/simple;
	bh=kYs9lNprfcuE12yd4NnGn6lx2tHlJj/u2z9plkD1Zjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBWGWIJha8Fh43SAxzVPJDJPJb9Xq1nfVLhFzvxMxDGgatZ8C0aH5IiVyBly51XUibJbqvpjVaqJMtQtmUF95zKoRaU8nL/rOp2Ts4m0RQCFSe12C5qndLVhnjZh4PhvKOyt67OHMK2jNr3ApwGgxwW9KHzujkgYMLrp/iWiF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=l8Owp1R4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="l8Owp1R4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DD4C4CED1;
	Mon, 10 Feb 2025 06:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739167803;
	bh=kYs9lNprfcuE12yd4NnGn6lx2tHlJj/u2z9plkD1Zjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8Owp1R4gHmWFTM9ny0NqsbTOCb4lLz8UYUR9VVuVK3AD359loTe1OnWZZTO7GxqG
	 /nzah1fBOEQGltCHv6MOKJsz4ItUCiEl+hLekCGMPGQyFnVdk9IfAZKXtBJzz91LSI
	 0lR3N2DUHop7glUE9tAAVKXWcBoZmCWZncWitiZo=
Date: Mon, 10 Feb 2025 07:10:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dima Volkovsk <s0ldw3ll@gmail.com>
Cc: marvin24@gmx.de, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: nvec: Fix pm_power_off reset condition in
 tegra_nvec_remove
Message-ID: <2025021048-mop-punctual-1fed@gregkh>
References: <20250209201752.66313-1-s0ldw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209201752.66313-1-s0ldw3ll@gmail.com>

On Sun, Feb 09, 2025 at 09:16:48PM +0100, Dima Volkovsk wrote:
> In the current implementation of tegra_nvec_remove, the pm_power_off handler
> is set to NULL without checking if it is actually set to nvec_power_off. This
> change ensures that pm_power_off is only reset if it was previously set to
> nvec_power_off, preventing unintended side effects when removing the device.
> 
> Signed-off-by: Dima Volkovsk <s0ldw3ll@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 263774e6a78c..9057f061e927 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -903,8 +903,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
>  	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
>  	cancel_work_sync(&nvec->rx_work);
>  	cancel_work_sync(&nvec->tx_work);
> -	/* FIXME: needs check whether nvec is responsible for power off */
> -	pm_power_off = NULL;
> +
> +	/* only reset pm_power_off if it's our handler */
> +	if (pm_power_off = nvec_power_off)

I don't think you tested this :(

