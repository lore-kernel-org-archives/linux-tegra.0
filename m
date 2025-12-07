Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA78A221FCF;
	Sun,  7 Dec 2025 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765103872; cv=none; b=Cj1hY/cAou1E4HpDqjrTEkiPXd8qkJa294cic84bx5SluHCu6MrRLoqct9Cud3Me0WjUvFz9LUTrZbkQJFT6zO9TJxMmrTe+b9pQTTYLOgS6gsSFLX2l4WL1dqe4bD8mMJ/D9Et5Va9e4qQl/Ef4vSdAw4hyKokFB6wfYQaD2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765103872; c=relaxed/simple;
	bh=f58tmviWW8wB6CDXyLDjtKl6eAJO2Th8XtawvDxeRq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZpfnU294/nqweY+4vjdFlZ4pfqFaR6DGRgoc/y5qLrxTYd7S7LDM2ukQxgQ/yYaNdas07lXlBNspoHS8Z+Xu3tPALKTzblVm0ZBFIRaTJxVOhkoaA7h94rl1VsRE5YuGNARm+uYteMEFx60IoFf98OD504GaSC76CGRqw1lRx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=Txdp2IUY; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Txdp2IUY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0BC766000860;
	Sun,  7 Dec 2025 10:37:41 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 1B9Dpx7YnSAb; Sun,  7 Dec 2025 10:37:38 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 43A16600086B;
	Sun,  7 Dec 2025 10:37:37 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1765103858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJWxtI4gCfBR7mMObe5wer/KxRtyUAzfWw+A7UhxlwM=;
	b=Txdp2IUYBZ08pj1l70+nHFNe697eFIh3dJ7NihA/rJ90d6Z/FKx0OrmByop4yJRGPz+4dW
	fHOvLeg7pV6+bEumOJ9UoAOYyvTBUcFBt2iDJDz04MkrwWt1EprKQWK6bMymYc55KLrSNg
	X1kyPaWDvJP6JcAiNbUtuKmuHynQ2eQV2om+6/jAEkIZz7a1wxrZWSFuoJnQgJsjM/Udw9
	ldui40CscTkQu63KIi2IRaWlm1tPmj/MfuofutDUh2txBukCq59xl0bLfONfMUuH07iPUv
	KfWGP20rwQgizWBBptMZKEGAqbxkB2K49q7SZd71eV0OpiteDFj2h4O4MqllDg==
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id C3D18360105;
	Sun,  7 Dec 2025 10:37:35 +0000 (WET)
Message-ID: <b03b9b3e-14b3-42e3-96e5-7ca48d91be94@tecnico.ulisboa.pt>
Date: Sun, 7 Dec 2025 10:37:31 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] usb: host: tegra: Remove redundant
 pm_runtime_mark_last_busy() call
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
 <20251204-diogo-tegra_phy-v1-1-51a2016d0be8@tecnico.ulisboa.pt>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20251204-diogo-tegra_phy-v1-1-51a2016d0be8@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch as this has already been addressed in a patch
in this merge window; sorry for the extra noise.

On 12/4/25 21:27, Diogo Ivo wrote:
> As pm_runtime_put_autosuspend() called at the end of tegra_xhci_id_work()
> already calls pm_runtime_mark_last_busy() remove the prior redundant call.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   drivers/usb/host/xhci-tegra.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 5255b1002893..9c69fccdc6e8 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1399,8 +1399,6 @@ static void tegra_xhci_id_work(struct work_struct *work)
>   		}
>   
>   		tegra_xhci_set_port_power(tegra, true, true);
> -		pm_runtime_mark_last_busy(tegra->dev);
> -
>   	} else {
>   		if (tegra->otg_usb3_port >= 0)
>   			tegra_xhci_set_port_power(tegra, false, false);
> 
