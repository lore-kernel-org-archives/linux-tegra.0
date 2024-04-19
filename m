Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F2762F7
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713518799; cv=none; b=DsE0uf5aWtuxzzxe+e/8zLDj0TdqclQ4czPZ1fsIWPWobOuA4KqFioNjEZ6oMuvR9ZxRi2XJ6859gAm/353bCQ4NHMys32cEZqQO35uWqLbKh89lmVPz8zILsErBTRc4cvTT22kMieyJCks/bHPOJgxCCNs+6lF92ftQgvbYcMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713518799; c=relaxed/simple;
	bh=nEQE1bgcahfGAeEROm4nIOqoBwmVPoodJbRFX+eJFiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5dL08F+gydH1B0I6sS5mWSvw0l+QvBzFE8EcSm8QmgHMolHoYNQBkuef0yES6dBrCkCpZu+PMR6lHcVCE95N8pZT3kgKW3E6J/gotYjnCTIG8GZoiEZHVi6PcjE/eiFnkvxxHIxdn9/Mzr8tAUmiVEj/FA5b8LsIDXX/ldXFWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zGUF9Kg+; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zGUF9Kg+"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ea2f95ec67so898127a34.2
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713518796; x=1714123596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f2k6wBjEwpSJIIcZ8MPn1YroTKsxMSXWDSsv1Yc3sRE=;
        b=zGUF9Kg+YfIg5reVeeXUQSnLyDkpUGj4ulcrTG/5U9jobWew3+UbDq2OCWNOICgrin
         7hq+3cPPix++lBy9F14RWm5Kz62j93bljrW2wyIbZfSBeV6hVlDONbm0khRSoONFcdlX
         m41WZ3vCnL/HRQCbm9Qj5cOGZ83h+9xNVYIElD3ISyaC3qoGA2OXFv93nWqtkEmGcRmf
         xia1REZQMbnyGTtMXEg7PqQug4haRsaTWrvhTunIto3xjfTmbDau0evVRjD2xId5dtLs
         XrYMSEZPOuvjnznpUiRiIb5UH5FkSK+75423udCleJnPXJH82URJBsBFXKV9Z6T+oSqn
         DmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518796; x=1714123596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f2k6wBjEwpSJIIcZ8MPn1YroTKsxMSXWDSsv1Yc3sRE=;
        b=NULXyVhLLBnCDw9yQOWX8xQXSOvcrIidXTbjmZpso4OKicD+rP6ci//bteBYQPR38K
         Tl4Fn15lZcvrU9CUC3rKvvuenXRgZCjl1BL6dzUY9IsfTwjyicuXlk2emedUKM5/5eyp
         CVrv92+G1HgR+C1AOJ5AGPDlfc8XHLAWG2tWMwQAlDsekWqujpm/nfOxIXVFwlPIEEiw
         FL99J3xS8V6B6wMnjhX2MJKdXtsJPt4Hkdm/BqBNeaLuDBmnNhmANt5l7yZMIA1JgNZs
         7BQEFDTpxnJOjvcQ9Qs3QUdxxMNGfcr/p3lZtQL5DP94wyKM0OpJoSdTw9z9VxzS7fHz
         XVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtyC8fLXXnaPAyY0GUt2Z8jldZdiTkIGWfhZ4TXrD8bYzROAGUghnD5IaxjZ4lgJ/dVEpUt5K0krTXcpugJmii2IWt0zWLAsqCVCw=
X-Gm-Message-State: AOJu0YzAp5Qr3zcB4LcAn6q8/y5/UG+/twDyXkKM+5aVdYRBrxqT+/Aj
	DuZa+4AzRU0UXyinRr8EhomYjXJhBHFswVLUDa+HJgOoK4Q1jMkiS/wvArNoUQ==
X-Google-Smtp-Source: AGHT+IGPIPPIitXX4Yw0hrulDjF2tnglO0Qdegfb3hKjRqYEF4E5wtIteUhkJR61YJc1aF7VAjq+9A==
X-Received: by 2002:a05:6870:12d9:b0:22e:c37c:453d with SMTP id 25-20020a05687012d900b0022ec37c453dmr1625314oam.30.1713518796449;
        Fri, 19 Apr 2024 02:26:36 -0700 (PDT)
Received: from thinkpad ([220.158.156.51])
        by smtp.gmail.com with ESMTPSA id z17-20020a634c11000000b005f0793db2ebsm2715872pga.74.2024.04.19.02.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:26:35 -0700 (PDT)
Date: Fri, 19 Apr 2024 14:56:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v3 3/9] PCI: endpoint: Rename BME to Bus Master Enable
Message-ID: <20240419092629.GA3636@thinkpad>
References: <20240418-pci-epf-rework-v3-0-222a5d1ed2e5@linaro.org>
 <20240418-pci-epf-rework-v3-3-222a5d1ed2e5@linaro.org>
 <ZiEy4EVcVpUry9qn@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZiEy4EVcVpUry9qn@ryzen>

On Thu, Apr 18, 2024 at 04:49:04PM +0200, Niklas Cassel wrote:
> On Thu, Apr 18, 2024 at 05:28:31PM +0530, Manivannan Sadhasivam wrote:
> > BME which stands for 'Bus Master Enable' is not defined in the PCIe base
> > spec even though it is commonly referred in many places (vendor docs). But
> > to align with the spec, let's rename it to its expansion 'Bus Master
> > Enable'.
> > 
> > Suggested-by: Damien Le Moal <dlemoal@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 
> 
> Outside the scope of this patch/series:
> Do we perhaps want to add a bus_master_enable() callback also for the
> pci-epf-test driver?
> 

Makes sense to me.

> In my opinion, the test driver should be "the driver" that tests that
> all the EPF features/callbacks work, at least a basic test "does it
> work at all". Other EPF drivers can implement the callbacks, and do
> more intelligent things, i.e. more than just seeing that "it works".
> 

Agree. Feel free to send a patch :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்
