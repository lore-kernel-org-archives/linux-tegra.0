Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B5C1AA7BF
	for <linux-tegra@vger.kernel.org>; Mon,  2 Feb 2026 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033909; cv=none; b=XSKyEpHrVdhSBC0lNZEilv9MtY0lpPxCxHkmK6N6hmCOil8ybo9MDDxBKBGtxgB42pAG7U7Mgjjdw/HSVjkfawEO69bZlJoCxkH1C36rBLDaw8CxzTYM8vJ4boi2EgcXx3mHk2OHTIC331AUdGzBVFWH9ObBLFDEjZz4cqQu9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033909; c=relaxed/simple;
	bh=ooVTj9mEoByboPWWE3IFgLha7oCBLZZINAKgYSkyhpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkaoNp0We0Hhmdrxmz5btfhSCuStVDrkVMScptfTOGNd5ie0Yt55zmXcoXdwCpVnbWLXtIiZHVzuFKGUtPHIal1L+2bAQZFIm8kf0FZqrMhJM2fDCZNS1ewCYGx045x0Bjbaly6x6j3HFznluCp8yW9acInqNs6iOrDnn95/Hvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkRJKF3o; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkRJKF3o"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dd490be5fso5597111e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770033906; x=1770638706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCU4lBi7Qj4qN74x1HXW9kHPnyicyi2w7qMxp171t3w=;
        b=QkRJKF3oJb/83lDSrR2pW/th8VcBC6T9Qpsp0bHI71yhP6IfY6gSc/8qvwNfQPdIpU
         zwIzClOZEfzrQbPmfjwynxuWfbMcIKxxybqvxKANguDECr1V7L6Ct+9W2fPhUGHdTwbD
         VNM/udcKsgWv0YD1YdzGaJZIlbA/qTTwgM55CKQDdLoAuK4vVUZZhWlfunDMQA0y/wmJ
         Fof9GwtM2VK/ssrAs0izUQ745LX1DfyfEs5UwPgUku4ujiCAQ791vLpXhYrcdnZiB0t5
         Ozh3qUK2quzcEbwXG5pNFzUv42OgBQFvZeCtjVRgLGygxbpDyHG4cylYXJGCVCHG0ea9
         cdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770033906; x=1770638706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCU4lBi7Qj4qN74x1HXW9kHPnyicyi2w7qMxp171t3w=;
        b=Ihz7OD8oL0ashf6uJNypvuRLjxSf7vPG8urQo/lD5Z5v43Fo8fLURmad3ryeVfWYtE
         5IrlnM7vRGppIl+X2Cx61kM+bhCjd2R4jo3m7a5cxQLRTcm54n7DJBveQFgjQUZIA1Ji
         o8vVhnE6cAI18JD5WhMAt6oqo3Ub4uHHpfjiH6vilVJDyOmCJGFbYbh/e0ZT1K/EfIVK
         7dbK+vGj6w6dLNFgPLoSRf2AFithsjK2lF+96WyRvGpQ++KMjeoc3K7r++A/y62nQV4v
         /L/PQPBQot8BzSGLXzliQW8GCfwvzTr3+7pHpGspFi9aRRvuAITj0t3UgbC4IoRK0tIy
         DsKA==
X-Forwarded-Encrypted: i=1; AJvYcCXLidr13nUR9yR35kWhn9A1+YmGjhWweBDu/ySHO9UitHfBN9pFhvtXAdZgm5Zh9zeOUs80mkSFgLbPRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGai5EDOIzbPsuiO87BubxdlbtCB3uN6+12b5Sguw7KbLI9IKq
	BfNK0kdTtlxivqvZUY+iL8i0BDQLLIMgpCrEfPkuQaCaJIA5hyZyt9Ve2U5UeQ==
X-Gm-Gg: AZuq6aI4n75Y/Bi2VQXkdYMDTGYDcV0dvi7dq+mGnH6NIVEK/s8faNnMvfxWlWrK300
	+3W/V5QSX+YOkSOcDHnNDrUO18r6fqCkXFWNs45RQhYfeCPhuKNyvLef6S0Dtn0V65JnyIXXgr/
	pN8pYJlFq0BaXdxEgjt6FKGCQLDybzVHjxE05qnKr4RZibOBeXYKEdS2L4cC23xjGFKRHxlH1lE
	Km0rGJwIcrNHUZjA+sfp+VZdKfEhd1z14R4EQBqvHiRdXi9RsGnwDhGs4ai+ohYH5mCUwKzMq59
	as8AlarMrZVF8yum+8Xbov9NbkvFFpT5HupyGYOel6AYQgmpAl8GDSSsyZFf7vjcLAHgSNhSoaO
	VTTrBWCqSPevvjkCSFcrHWxJ0+9Ydwk+Qm1Bxp5522t/JgsDJd34MpqtPeyYj+veGhjQ4n8rTX5
	gfc0eZ5AxeNW92N+rX0vz5A1JACrCYbHK4oNZ/YtIJNoGFv0p4sTcYm6ZIuhMla/xJbdOMOw==
X-Received: by 2002:a05:6512:3f1f:b0:59d:cda0:8b74 with SMTP id 2adb3069b0e04-59e1642ac69mr3838142e87.35.1770033905594;
        Mon, 02 Feb 2026 04:05:05 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe? ([2a00:1fa0:4246:14fa:feaa:638c:335c:bdbe])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b70c8sm3469810e87.75.2026.02.02.04.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:05:04 -0800 (PST)
Message-ID: <74268def-31fd-4015-8be6-faebd6676667@gmail.com>
Date: Mon, 2 Feb 2026 15:05:03 +0300
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] usb: phy: tegra: return error value from
 utmi_wait_register
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260202080526.23487-1-clamor95@gmail.com>
 <20260202080526.23487-3-clamor95@gmail.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260202080526.23487-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/26 11:05 AM, Svyatoslav Ryhel wrote:

> Return exact error value from utmi_wait_register during HSIC power on.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
> index 3a7a74f01d1c..6173b240c3ea 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -891,6 +891,7 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>  	struct tegra_utmip_config *config = phy->config;
>  	void __iomem *base = phy->regs;
>  	u32 val;
> +	int err = 0;

   This initialization seems pointless -- the newly added variable gets overwritten
by you later...

[...]
> @@ -984,12 +985,14 @@ static int uhsic_phy_power_on(struct tegra_usb_phy *phy)
>  	val |= UHSIC_TX_RTUNE(phy->soc_config->uhsic_tx_rtune);
>  	tegra_hsic_writel(phy, UHSIC_PADS_CFG0, val);
>  
> -	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> -			       USB_PHY_CLK_VALID))
> +	err = utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> +				 USB_PHY_CLK_VALID);
> +
> +	if (err)
>  		dev_err(phy->u_phy.dev,
>  			"Timeout waiting for PHY to stabilize on enable (HSIC)\n");
>  
> -	return 0;
> +	return err;
>  }
>  
>  static int uhsic_phy_power_off(struct tegra_usb_phy *phy)

MBR, Sergey

