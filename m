Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281CA19AD90;
	Tue, 12 May 2026 01:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548566; cv=none; b=uljwkQ56Tzu7+keQhDRfw7xlogyVBFG1vQoTWnmrAtqVMFC4ip1JWDrJsJR/4qzratN4CsfOXmsh0uf2L/Li8T5IyEw0nnUb2IILiq5gdQX5X+wEl9fYZLW8/2x7RWhH2vWZxUGX4pHZ6EWjdcWXjAjoI1sxHHxecjNIpK+if20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548566; c=relaxed/simple;
	bh=ACf9F8mIe11uR9zPEzpLlpeJBEkpXvF/E/hQaOiFhrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlkExy+gLpaqIcJm4OQqBOaEChTlhORMfMwQPEzpHtp69A9wVHv732tjBzi5YwBSdCIoD6P3vUt2TNztPsBW0NpeNgcfTOKP3RDjM5iHHlvPJaYYmP5LkhAmFGqqFXQVYUZGeNm+iZtmTmSQQw273+vzAN02NOJ/mOuun2hyaAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUfhKIfw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUfhKIfw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA50C2BCB0;
	Tue, 12 May 2026 01:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548565;
	bh=ACf9F8mIe11uR9zPEzpLlpeJBEkpXvF/E/hQaOiFhrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUfhKIfwzuH226iZczHaYhoQACRSH2B1xVSUZfwTCDcXqu92SoJTYAQJG1dAkvSES
	 ZAH9f7JH+WWSt/8oU9itsz8CkbQq3UvEf+kqcvyW618t3fSB2G8G4INL8vq43A9W25
	 bozKFqvXU4Ex5W+9HEkFOfo7uCUFZ2gzoPUe6mYCzlei1Cx9u2uX7ltZZB3M9hrP4D
	 m0/ISBGrpUlo7gTM4fE+cRTWgDzypCL6ZIyHLy0/KEwlJ2nS0t3sFReZ17FXkKFy8I
	 2rBD1NceY8pJzxAnrE9gtu8N5wUV4VFgV4ACZCYZm3Sfhs8hxdB8WV+GxxnFTIoZu/
	 lyuDz4wF/Fpig==
Date: Tue, 12 May 2026 09:15:59 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/6] usb: chipidea: tegra: Avoid controller/PHY init
 if bus is externally controlled
Message-ID: <agJ/T8nBGWEoblmd@nchen-desktop>
References: <20260511135703.62470-1-clamor95@gmail.com>
 <20260511135703.62470-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511135703.62470-3-clamor95@gmail.com>

On 26-05-11 16:56:57, Svyatoslav Ryhel wrote:
> If the USB controller and PHY are externally controlled, then the
> registration of the controller and the PHY initialization should be
> skipped, since these configurations must be done by the device that
> controls the bus to work correctly.
> 

I find you only control USB controller device add at PHY driver, most of USB drivers
has PHY control, for chipidea, it has PHY control at core.c, would please try to
adapt for it?

Peter

> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 36 +++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
> index 372788f0f970..593390a818d1 100644
> --- a/drivers/usb/chipidea/ci_hdrc_tegra.c
> +++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
> @@ -32,6 +32,7 @@ struct tegra_usb {
>  	struct clk *clk;
>  
>  	bool needs_double_reset;
> +	bool externally_controlled;
>  };
>  
>  struct tegra_usb_soc_info {
> @@ -312,20 +313,25 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
>  		usb->needs_double_reset = true;
>  
> +	if (device_property_present(&pdev->dev, "nvidia,external-control"))
> +		usb->externally_controlled = true;
> +
>  	err = tegra_usb_reset_controller(&pdev->dev);
>  	if (err) {
>  		dev_err_probe(&pdev->dev, err, "failed to reset controller");
>  		goto fail_power_off;
>  	}
>  
> -	/*
> -	 * USB controller registers shouldn't be touched before PHY is
> -	 * initialized, otherwise CPU will hang because clocks are gated.
> -	 * PHY driver controls gating of internal USB clocks on Tegra.
> -	 */
> -	err = usb_phy_init(usb->phy);
> -	if (err)
> -		goto fail_power_off;
> +	if (!usb->externally_controlled) {
> +		/*
> +		 * USB controller registers shouldn't be touched before PHY is
> +		 * initialized, otherwise CPU will hang because clocks are gated.
> +		 * PHY driver controls gating of internal USB clocks on Tegra.
> +		 */
> +		err = usb_phy_init(usb->phy);
> +		if (err)
> +			goto fail_power_off;
> +	}
>  
>  	/* setup and register ChipIdea HDRC device */
>  	usb->soc = soc;
> @@ -342,12 +348,14 @@ static int tegra_usb_probe(struct platform_device *pdev)
>  	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
>  		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
>  
> -	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> -				      pdev->num_resources, &usb->data);
> -	if (IS_ERR(usb->dev)) {
> -		err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> -				    "failed to add HDRC device");
> -		goto phy_shutdown;
> +	if (!usb->externally_controlled) {
> +		usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> +					      pdev->num_resources, &usb->data);
> +		if (IS_ERR(usb->dev)) {
> +			err = dev_err_probe(&pdev->dev, PTR_ERR(usb->dev),
> +					    "failed to add HDRC device");
> +			goto phy_shutdown;
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.51.0
> 

-- 

Best regards,
Peter
