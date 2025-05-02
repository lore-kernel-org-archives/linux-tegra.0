Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31842586EF
	for <linux-tegra@vger.kernel.org>; Fri,  2 May 2025 15:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200033; cv=none; b=jP1tQGMt06TPyiJYQH9emmcBlYw2N1RmIVwlkKB+LACyls0IuG13pncmoC7fZ7hFAtRLc0v+rYHJBXv08V9NQwJwydV8LowH5Cv9aemPhHD74A+BCR3T1hvgUPA2ImqwgReCrGF2xbWSBF6cubC+k9kl1xpT23Lq30Qn6UiCBUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200033; c=relaxed/simple;
	bh=5rFlY49Gy7MqAan8qMT69245dWRNC9TAb+2SwDWa/eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyqvBE+vQBqDDEcT3U4iVJzyEJ7hBNtk2XUZ6JNXsdPgA78s5rUchcZf1culG6afn2J9Jrwfl0adFFHoQ0D+Cp/EuqfsUg0kT6dAzURH59vb7CBMgtPI9iCvv9lK1RwRyWl8PiiXhJrSuOaDgcvp4TcUvM/PW4N4LsjYr7e2Oxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mB9rHwOF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mB9rHwOF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-308702998fbso2182257a91.1
        for <linux-tegra@vger.kernel.org>; Fri, 02 May 2025 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746200031; x=1746804831; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=taWo/oLDWVZbyDjSNAZehyOATbpReUCldO8JJfOFkWs=;
        b=mB9rHwOFyLtV9SjomCRXMN92o9rWkn/Tj+B2gcOWoLEptMMG/H12fZ+C4/MZzhisJH
         VccXx9Q0Pwi8H5O9wYEl17du9RSaiGkLBE8HBgn9vY6EBPeMwlzhm/CUjHnhpQmy+pXX
         aHTbGbsMaz/MXEdLy/cb9/+xIi/Dv9AAGHQBiKO5IjckCwk9HNw8G03V/oKrUWaYD4k3
         pQ/BzUu/TiJTPUbiW7KydBt/NKldOyxx0rFDLCYu+NcnSEQ0SSjm4BpUntM4BphfGeYO
         00CAHfezzlXSK/Xo/jxbx52dJFqz8/UD0yAeqK2PSOjUtJEdYhlAsDoNLpqG/yZ1+y92
         N5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200031; x=1746804831;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=taWo/oLDWVZbyDjSNAZehyOATbpReUCldO8JJfOFkWs=;
        b=l2y8sD+dnSaBnykNAOe65pUCwfIlpiPFwluMTwH7PYL8tUWNRLZU8ydD1zNO7yzutN
         cZ6WtWktVsCdrBemZDia7WQF858sFR+aXNQ2JcgRUp9eLRLuMksOofpgub8qf2j7+9ap
         Y1r/6n2hdIDigk41scv1wcLlOA9B7S7dRzWfso7lwzHENAzGxHfbW0yvP5uCktfFOOUR
         mwKndi/2lnfydYzOPrczFE7n3cNEg9RAaE3FcMdSV07JceEFweQhTX/FGIFc/H3q7Fqv
         yOfmCbVuOoJsznWicvp8wKV1AqzLm0yzAXi7yEM8xJj5lUU6iopBpHNMsmW5ihn+FIRS
         G0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU52OYg4bi/1+GIsI0GJq76QdyWCRzP1HBYxb9l/1nD7UVpafh2gxEI6EEKA0FK5rUBqGPn0c8R/lQqdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4Da/uBu2H+bfsAWVhGfEgVIy8tHd/swr5Ytjp1c5wcwZdPvs
	WfVurPYwzddIi9hA7emPj3ut7J+Nk+z+xANxyA+A3SFw5sNaXFRkOk6EgH+JuA==
X-Gm-Gg: ASbGncurbJHUMOW5kZpsl7Itz7C7C/Sd+d8UHttJm/UJG0FZiNEfh8o1TmkiFaKbpHg
	MQhnTkn9QZUbVfDLOdh85Dta91pKMlKt8EhrkLSgSTDbEysfNhZ4L06AjBKXKMMzhhnCSCCFVFs
	wNiUxe336AzDnRhuk7ZjakkmJHU5DqsanRONuo5lWmuMilgIIZJxJLkZVW00LtQ0+o0QnRBIap3
	MhLJrcruPQehrGP/PaEx7zKNpD1VrFGuguun/7ageRaRzXS18CeQHsArcTs3h2ROE8FuDaX1095
	qTCerP78ExasSYM98GrvhnPGmoaAj1Le9V9slaxRuROYrn0ee8w9lw==
X-Google-Smtp-Source: AGHT+IHLXisD3c2J54ZWFDiygB6xrYnjRSUfVuj5VJsMbLrYQomvw2y4f37h/jQnsxHbfb2LtmC93g==
X-Received: by 2002:a17:90b:4fc3:b0:309:ebe3:1ef9 with SMTP id 98e67ed59e1d1-30a4e5ae182mr6519708a91.12.1746200030960;
        Fri, 02 May 2025 08:33:50 -0700 (PDT)
Received: from thinkpad ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f0aasm6496034a91.35.2025.05.02.08.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:33:50 -0700 (PDT)
Date: Fri, 2 May 2025 21:03:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: webgeek1234@gmail.com
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] PCI: tegra: Allow building as a module
Message-ID: <skblez3ros5kdix42prwjn4hethckxtfw2dmqvgdirczg5tz7r@pxti3m23mfix>
References: <20250428-pci-tegra-module-v2-0-c11a4b912446@gmail.com>
 <20250428-pci-tegra-module-v2-3-c11a4b912446@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428-pci-tegra-module-v2-3-c11a4b912446@gmail.com>

On Mon, Apr 28, 2025 at 08:05:48PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This changes the module macro back to builtin, which does not define an
> exit function. This will prevent the module from being unloaded. There
> are concerns with modules not cleaning up IRQs on unload, thus this
> needs specifically disallowed.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/pci/controller/Kconfig     | 2 +-
>  drivers/pci/controller/pci-tegra.c | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 9800b768105402d6dd1ba4b134c2ec23da6e4201..a9164dd2eccaead5ae9348c24a5ad75fcb40f507 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -224,7 +224,7 @@ config PCI_HYPERV_INTERFACE
>  	  driver.
>  
>  config PCI_TEGRA
> -	bool "NVIDIA Tegra PCIe controller"
> +	tristate "NVIDIA Tegra PCIe controller"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	depends on PCI_MSI
>  	help
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index b3cdbc5927de3742161310610dc5dcb836f5dd69..1539d172d708c11c3d085721ab9416be3dea6b12 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2802,4 +2802,7 @@ static struct platform_driver tegra_pcie_driver = {
>  	.probe = tegra_pcie_probe,
>  	.remove = tegra_pcie_remove,

Please drop the .remove() callback also which becomes unused.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
