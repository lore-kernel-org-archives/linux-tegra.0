Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988FF74BE8
	for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 13:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711461324; cv=none; b=cllUFKtxwQa7/FWT4auBKcmFmDHYMlwBEeewjaayTauYUGdIdPyps0HeUYk/xHpA3qStHH+Z8x1x7wPyEHcxzXqliujYoyZKK+dHCzoVedtfOHX+gGpnZm02DTGW9sDB0WQ34xIbyubK9Wb29u+iADuqc1pjpYh/azmhFcO3hNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711461324; c=relaxed/simple;
	bh=g5rSC54oRDFG3++0xhSBEsvKtp7+DPDEaeW7Lwz7adU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDULjdw+nPZREF/uS8h13z6vceFhdGieFgd3M/88X7oQo7GiKuS/R3GcitEb+2DkcMiM99NiMCKsMZlRSKWLTLimheYP8J55P/u7W6POTiLr5ZX6hblCtzbLNZVT+5TN3LW2bAbZYg+oVMUTZj3PRBmKYf3ICVobBM83bxiZcUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUu4VDnr; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUu4VDnr"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0025ef1efso34997905ad.1
        for <linux-tegra@vger.kernel.org>; Tue, 26 Mar 2024 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711461322; x=1712066122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b1M0Y1XkDNHVcLc0TZz7shYAMA8ewv5L9mN1HcUgUKI=;
        b=sUu4VDnrSwxRC3gNcm/nSsPWzWDG6gi4nkSoSyZKBT4i0bo1riIQhZ/E9xvjDMg372
         fMGvRNssPASKjSM7xrhrIa4usa0ZpkdZohfFIbrp3clfQeJEhXTJCUyiJysDWGIfx3Jd
         L5gHQkTZJ8n3CiM/jdkSd4ub1HKaJJdSU4FF1j4DoZv++egH7uLMhDOh++eC1GjFK5LP
         ehSMKqe/6n4l5uPHILheH9qMhMTcKPq2FhxO8FyrzKTU/H6Y8+l2ZH9prl0PPr1kbVbZ
         3XNZZbiiqL361fRW+Iyk1Y12BSNa6SPq/9RGcj+MDyFY/VlsBcHMu8AAODEVOThZr9J/
         FrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711461322; x=1712066122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b1M0Y1XkDNHVcLc0TZz7shYAMA8ewv5L9mN1HcUgUKI=;
        b=J6wqrPa+ZTR5tJv6q6X8DpAfs5JAUuMPGqiwY0H5J4aYQjGSDSEFllAtoUGDQ6ZPr0
         B0WCEoQ/Eg1Efve2KdRtONZQipE63QnV83S3HPcerFFHbsT4A4dt1V3kn3E9QWTIty+E
         QAI2kBZv4bcwgAkxkdGUg+aUHwPai12PZtVCiEKiFQN/3YCPQBLnXVzkeiJpKKxJVOCM
         CJDacYDex6CH4W4GJQqXBbS05xUjGcN9qruoI7cP0nXoeyE/xegF77dIEmMFa3LOukwQ
         DcVvsVT1RA0hG2R8DOZXrl0nX3jL1R/rSefakGGwHwyyUoefLHktk0iit2Q/UbBHgaLE
         Zc2g==
X-Forwarded-Encrypted: i=1; AJvYcCWciZiVayGN4rkPlLuVe+cCo4X0J9mUuukG/0BWBpH4KGnGJU1+gRoXstpPOwSeH04vDSTqnKL2O9w+9Y9u6RdNdOb2uGkz+aoFp7k=
X-Gm-Message-State: AOJu0YyIv6WZhI6CD3yhB8gKHdjHBcMfCpw2qmqWnSuTUc8V+MLeQGrd
	ay+hJVVxwk8iMbuocMUyvqObA87q2fagVWBiwmW1N+WqGhu9sS0t7LznK80DzA==
X-Google-Smtp-Source: AGHT+IHNOqXq6qL+ejk+jw9dkVs1U9l/d19WyMAcSDikAR4pgbYIYUs/kI+YvP7/ptELAWipSgmUOA==
X-Received: by 2002:a17:902:f68a:b0:1e0:a678:5b55 with SMTP id l10-20020a170902f68a00b001e0a6785b55mr1175640plg.11.1711461321584;
        Tue, 26 Mar 2024 06:55:21 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001e0c91d448fsm3213867plc.112.2024.03.26.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 06:55:21 -0700 (PDT)
Date: Tue, 26 Mar 2024 19:25:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326135514.GB13849@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
 <20240326074429.GC9565@thinkpad>
 <ZgKiUogkgrMwV1uD@x1-carbon>
 <20240326111021.GA13849@thinkpad>
 <ZgLR8jWfBcZB8laa@ryzen>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgLR8jWfBcZB8laa@ryzen>

On Tue, Mar 26, 2024 at 02:47:30PM +0100, Niklas Cassel wrote:
> On Tue, Mar 26, 2024 at 04:40:21PM +0530, Manivannan Sadhasivam wrote:
> > 
> > I was planning to drop enable_resources() from Qcom driver once the DBI rework
> > series gets merged. Because, the resource enablement during probe is currently
> > done to avoid the crash that is bound to happen if registers are accessed during
> > probe.
> > 
> > But what your observation reveals is that it is possible to get PERST# assert
> > during the EP boot up itself which I was not accounting for. I always assumed
> > that the EP will receive PERST# deassert first. If that is not the case, then
> > this patch needs to be dropped.
> 
> From what I saw when having debug prints from my old email to you:
> https://lore.kernel.org/linux-pci/Zalu%2F%2FdNi5BhZlBU@x1-carbon/
> 
> 
> ## RC side:
> # reboot
> 
> ## EP side
> [  845.606810] pci: PERST asserted by host!
> [  852.483985] pci: PERST de-asserted by host!
> [  852.503041] pci: PERST asserted by host!
> [  852.522375] pci: link up! (LTSSM_STATUS: 0x230011)
> [  852.610318] pci: PERST de-asserted by host!
> 
> 
> 
> So in my case, I assume that the RC asserts PERST during a SoC reset.
> 
> This is obviously from the RC driver asserting PERST + sleep 100 ms +
> PERST deassert:
> [  852.503041] pci: PERST asserted by host!
> [  852.610318] pci: PERST de-asserted by host!
> 
> The two before that:
> [  852.483985] pci: PERST de-asserted by host!
> [  852.503041] pci: PERST asserted by host!
> 
> appears to be because the RC I am using, incorrectly sets the PERST gpio as
> ACTIVE HIGH:
> https://github.com/torvalds/linux/blob/v6.9-rc1/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts#L300
> 
> Well, at least they are bug compatible and sets the output to:
> https://github.com/torvalds/linux/blob/v6.9-rc1/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L170-L184
> 
> 0 and the 1, which, since the DT binding is incorrect, will actually
> do the right thing and assert and the deassert PERST.
> 
> The problem seems to be that the initial flags:
> https://github.com/torvalds/linux/blob/v6.9-rc1/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L242-L243
> is: GPIOD_OUT_HIGH
> 
> which explains why I get the extra:
> [  852.483985] pci: PERST de-asserted by host!
> before
> [  852.503041] pci: PERST asserted by host!
> 
> with basically no time between them..
> 
> 
> I guess I should send a patch to set the initial value to
> GPIOD_OUT_LOW, so that the RC driver does not trigger a
> "spurious" PERST deassertion when requesting the IRQ.
> 
> 
> So I think this patch should be fine if the RC is not buggy,
> but as we can see, in reality there are at least one platform
> in mainline that does manage to get this wrong.
> 

I've validated with x86 and Qcom RCs so far and didn't see this behavior. So I
guess I'll just keep the patch for now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
