Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE05913AF2;
	Wed, 24 Dec 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766561245; cv=none; b=qYTkjPKbiNC1SwV7JGfdbgeEIl57cnTq/hfpepWPLJL90ku3OyPUDVwl1iLQHuW5UMHjy+shA+eoF0z6TirKWTNSEmplutcTVvmomKOg9hU5wFZUbMOenkwRrsgpWOPgN+cLqjeci1YCOdbSWnSgmO/7XxL+5lHpvcSjhi7OKpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766561245; c=relaxed/simple;
	bh=JY2lcXxoeMbJufbIaJQJRdhuPVac3qiyPS8DddeWjJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyCbDvWL667xqKJO8MnYnangLtD3oKDLs8c4C8pVXulYyCHW/uKPAIheb53LfuJM93bd3VmlmYt8ha16aynM6LF2wx4PjfPRIpPy4CXyeebL/2eBKEXKao34TkE7w0IWE8BSOQuK8//dnYe3+79qVuKpVQGoRaKGub9reLBiIhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cktWmzZ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cktWmzZ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727DFC116B1;
	Wed, 24 Dec 2025 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766561245;
	bh=JY2lcXxoeMbJufbIaJQJRdhuPVac3qiyPS8DddeWjJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cktWmzZ1FFP566/R2jDRETYoEABvEMR5YTW0m/eh+bZHMdgFnSfabSHT9Z5txNB53
	 J85BjTbYEAiCEErtcCwrKTVaYG+KoabiDIE0MatbzFIALlWSwEIrNCyurMR6oUz93Q
	 Qvby/ZC+GYWK3T3BJE88JuCJTgEEzx1vMolQraCV9fNE4sqOj7SV/4ZhycpMlvNeG+
	 FOW8ZFTOY3njimbxo4vPfXSJw65Z5J0Tnk7DCxY3O+MHT2G/mbP7spbesZDUk9nn8J
	 zI3prJ2FpmSFrpQ17R+ZbGFv4mgDHizGI1UctY+2bM+4+3qlaqsEsGGOEl6WPGzLSQ
	 3pLl5kVNvanvQ==
Date: Wed, 24 Dec 2025 12:57:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] phy: tegra: xusb: Fix USB2 port regulator disable
 logic
Message-ID: <aUuV2ZYKmM_aYgTv@vaman>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204-diogo-tegra_phy-v1-2-51a2016d0be8@tecnico.ulisboa.pt>

On 04-12-25, 21:27, Diogo Ivo wrote:
> The USB2 PHY mode handling on Tegra210 incorrectly relied on
> regulator_is_enabled() when determining whether the VBUS supply should
> be disabled during role changes. This is because regulator_is_enabled()
> reports exactly what is states and not if there is an unbalanced number
> of calls between regulator_enable() and regulator_disable(). For
> example, regulator_is_enabled() always reports true on a fixed-regulator
> with no enable gpio, which is the case on the Pixel C.
> 
> This then leads to the PHY driver wrongfully calling regulator_disable()
> when transitioning from USB_ROLE_DEVICE to USB_ROLE_NONE since the driver
> did not previously call the corresponding regulator_enable().
> 
> Fix this by keeping track of the current role and updating the logic to
> disable the regulator only when the previous role was USB_ROLE_HOST.
> 
> While at it fix a small typo in a comment.

Never mix a patch with something else please. More imp if it is fix
which will go to rcX. Please send a different patch for typo

> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 5 +++--
>  drivers/phy/tegra/xusb.h          | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 3409924498e9..63ad57d95514 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -1934,9 +1934,9 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
>  			/*
>  			 * When port is peripheral only or role transitions to
>  			 * USB_ROLE_NONE from USB_ROLE_DEVICE, regulator is not
> -			 * be enabled.
> +			 * enabled.
>  			 */
> -			if (regulator_is_enabled(port->supply))
> +			if (port->role == USB_ROLE_HOST)
>  				regulator_disable(port->supply);
>  
>  			tegra210_xusb_padctl_id_override(padctl, false);
> @@ -1944,6 +1944,7 @@ static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
>  		}
>  	}
>  
> +	port->role = submode;
>  	mutex_unlock(&padctl->lock);
>  
>  	return err;
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index d2b5f9565132..273af147dfd3 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -317,6 +317,7 @@ struct tegra_xusb_usb2_port {
>  	enum usb_dr_mode mode;
>  	bool internal;
>  	int usb3_port_fake;
> +	enum usb_role role;
>  };

Jonathan can we get some t-b for these two patches

-- 
~Vinod
