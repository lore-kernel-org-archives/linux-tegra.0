Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACC41760
	for <linux-tegra@vger.kernel.org>; Sat, 27 Apr 2024 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714199932; cv=none; b=TMaFMfrukVgA7WRtn5K7TY6nzywaCu00DF8JD6Lku4Qh9AQyu8QZORYgi/dqp1ACn2R3IDFNJy3vkiOOCWVn77w8OU5FBR8q3u+FfBydeqsTIIFPLU5xmAqYXPMnMscA6RPkkvCjPgXOlY+QZ54fbPIvy4VLGG1qTw45VMw9WUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714199932; c=relaxed/simple;
	bh=rMhrAE8YXNfqvYLpIvyBbY1dUGHNrT55DGekIZ7UUJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyrfKU6ERtBi3DxPEqUowS7dyxxfp9fz9r/RoPuchlEknmpwVM8fbQIptgxYMc7tE1+W6rbqw4SVBpiZONQus7rpGmsIqa3tiwGFTN0/lRWG/hYhQX80jEsh8sZtph8VCb/AXOVp7BbCqG4dbkJaH3MBSaOPh5qVKyvokP6+6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOzp9565; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOzp9565"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6effe9c852eso2613775b3a.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714199930; x=1714804730; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5BZd/9PlqkZZUs68lDdFcJ5CEc1B68syvKugYGnzVE=;
        b=DOzp95659UO3eerx0uYq6o4KMA0dECAzYmjddVHLYj7Z5e6hAp6+UDXVLcvXzs5Tih
         MdkvtNE37QraCX+BFD8AIZ7965H9tjNwYyyWPwFkgbdrOebpweGOpkSDR3iXjDG0mded
         Om4rLQk5GokgLLnCh25+LFFjcX6oG5hZeQjb6k/wlivh/lU2f9CS45i9XWZgUT6fs8FP
         T79T96J+kNvfDM6IOUN0b5KJoFA7mnsvq6e4XXOO9KWH9W6zQVQiVc19aiXBzM+lE0Lf
         JaFn7fci/jHQ+NfRjiBQ45w8pYp1e7hQMtnJstwWrCw3t0I/mCkRPRzd3bvmgtQxVSqh
         /SUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714199930; x=1714804730;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5BZd/9PlqkZZUs68lDdFcJ5CEc1B68syvKugYGnzVE=;
        b=Yf3iTaKSlJ8LABmZSkAmmpkXeU7X3l4tH8W4c/DiBBdCOFH5b/O0sHYSgAcP2SYH8e
         Tj4Rw082gxEHGsP/sDuvrKoBGb4JMPt9K/YlKB3pECfUTGvLaGNXVRsjYcB4/v+OmQJj
         GpwpGJYSLIAEHBPrHQsGIFQ1ou4bJt+dj4kISAKO10be0/vdyqhBsc7JI/rUGHsD8coG
         0D7r+VatCeicRU7cURIopO2+LFjmniD8nPfuiUr38oBIumQ6dq3AOVD6eHcMZgWMYQZC
         VQEIF2VVVzTriJ8F5BizpD85aqz3GabSeIq2KMBmChavlgCQH91ieDj6f7OtBU7CxM8G
         bi1A==
X-Forwarded-Encrypted: i=1; AJvYcCVWvjTfYHcQC6kvy15czotR+Jyht2wxllP1C28UgUuv3/WbIEn9z1PmUDnbPXoZ6aGBl00WJNHEGmSNxpIq6LqUL3ev1ml+7tQJBg0=
X-Gm-Message-State: AOJu0YwZTZAP0mr6ScFgzJVPZJkvIZdjkvIdfw/pV5+k1a+zWxgQXW3s
	wNquEgBeZYrtvYg9QM+RrR5LMGge9//pe64I6561vRVVV/tFwX7lGH5124oXSA==
X-Google-Smtp-Source: AGHT+IFOTwYBRJQ6hpSLIlWNvowiugvVRk7RGAo5g37wQTTmlbJt9WKRQxSRhuQmeF2kLwvwvDKZ0g==
X-Received: by 2002:a05:6a20:f394:b0:1a3:55d2:1489 with SMTP id qr20-20020a056a20f39400b001a355d21489mr4790412pzb.7.1714199930233;
        Fri, 26 Apr 2024 23:38:50 -0700 (PDT)
Received: from thinkpad ([120.60.53.237])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79892000000b006ed0c9751d0sm16232311pfl.98.2024.04.26.23.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 23:38:49 -0700 (PDT)
Date: Sat, 27 Apr 2024 12:08:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 1/4] PCI: aardvark: Remove unused of_gpio.h
Message-ID: <20240427063832.GA1981@thinkpad>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423172208.2723892-2-andriy.shevchenko@linux.intel.com>

On Tue, Apr 23, 2024 at 08:19:04PM +0300, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pci-aardvark.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index 71ecd7ddcc8a..8b3e1a079cf3 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -23,7 +23,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/msi.h>
>  #include <linux/of_address.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_pci.h>
>  
>  #include "../pci.h"
> -- 
> 2.43.0.rc1.1336.g36b5255a03ac
> 

-- 
மணிவண்ணன் சதாசிவம்
