Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490649;
	b=bHj6X7FDsK4lsX0aTodeld5cHjPjKHZMPIK7YVKKRCA06SEd1+2OnRasWZyNn5MDLFGl
	 CLdblPwnkKK9l8pDEHpOJc+WDfuFaJcVKv8l3M6V1gq9GncDKkodEppJh1IHf8tJ53GPC
	 wmVZ0lFFRdNo7fRpEPaw5Ur4axaKVdxFDbCd11Ocj+wziXeGnr4EBE4qjxS/7Y2GR/p3a
	 dMjCIMfZxq1XRSKgZ7A4OSXMeHsHIVoX02Wa8Gqvi+KRxfZ2q4UTabPXr4SoAkG9ulYZJ
	 xHIsvjqrdEt4L1rLkCm8lGJoHXvOvt5549NHJFnvhW8O9znfP3ST++le1vhPdumeHRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
	b=5nVRU4Uq+HvdoSjaTD6O7N8CN2EKzvR3/C3AdW9aShRDhSvhgcbRYInmsfS3ywIAPG3d
	 OSZB57ndZgkipgERkYN4damjXnx7xuLuw+tsp453dhZ0LGDcydL/CzqLevsW/4RO567LJ
	 najQwp6wwqZdljZ47BtH6FKPaHbs4prBhi9pfKAifCIIqR9Yd77xDgxqihSp9A5cWoNZf
	 m4MdIREhYjZxTCMS2W7rrB+A360JmoatTj41Iy4Xg700LDlStQ5twLG77SAp8aJdLvtEo
	 Emvr/609Im1SNgVtyHDmftJPi2jcZLlkVLTgWggTKWsp9x42WdZMg3wgMW5cZFomfew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GV9EG0b9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD549606A323
	for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 13:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD549606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GV9EG0b9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso44125e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2026 05:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794490647; x=1795095447; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
        b=GV9EG0b9F1OZcJ7rSSqCBBGM15XzP9uyUYDi8GfT/IJQFo2PONhIEsW4ehbTAGmLul
         AfiSQRqok039LZipD3SXVB7bQnmWM1VNWHnNuIYUOg1xcoCpXoDgZk6MKhpKupNozhu1
         I6KasKDrU+5yLyLXdq34h2LC+ImowBeWbtbU1nl+VbL3o0lOkFFnrUjdh9Y1xgwqWgWv
         b9BsHs4/vjo1uDGsLzyu+BQigb78NFuJGx5WuPfy69QJcQW7lJZYQnxGSWp18iPj0zO4
         vNvfy506m8C6yMkOYgzvsomi1q0RJbg4NEqf4g+SfAX/vVd7MqsUy96iYoJjnqx5Fg5M
         fp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490647; x=1795095447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hq/MU/gK+BSgB5mQh8Y6JTJeHVaolVP6d47tb0fD0P8=;
        b=FXBF/S5+epSzdnYyft/4dZhhgp+BuwmWLG8T1cChxHHgNSR+5Vw83oxoyNZYD5vDfw
         gMQlLTqZDaPBJXdWoZHT+Zstt7Wc33BbJKulOc3KXoFvBBft0E67hH9MQpD3SbldUn7j
         qZx9C4U/t2r41cf4musgLq0i/uRgPBWabpNR0Lhs2cCORL1dQcsucLI4Gy2hkTKEpQLC
         smg8ZPhC26AOpP9I7olDbUuN9pA4UxmHoX3nhy5ZXKNoDMAxFXwsneGijbqgFivixOVo
         lHZDpbzP9gVGV7AFDnA6Y+EQkcb46kcG3LdN6//HcwfdmojGnk7gBCUN9pbQCT77s1xH
         t7ww==
X-Forwarded-Encrypted: i=1; AL+hErHFBMloFcH2DB3xH9UbF+W99juEJWbM1Shzf0oV+h4mNMnKAoYmwUD0UT6oSilG4VGApnVCiFOE58j9oA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+jUyKawCkHxsKEu7ahUD+j6VlXcR5bJL2uWIPQsZCuDDWNlDOI
	yiEBCNc7LA09zE2F6s5U4NjgB8GkABEUuDngAaqf5nle/5xo6PGAMY2xHQH9jGFFog==
X-Gm-Gg: AYBFou3uneuDXqwUwkIGPEurK7MvN3eq6XmAuuE0S7NYddl5rcKA2CTmGqlTxxbWoj4
	mDWyEBBIGb8WbKngfPJ/yoKCCSynndMj44t9s7bkCH98pCP9THl9RHCY/a7e0t2yGVAT0CpXVCB
	/iHcttusj9XbRiEZdffizQSTF0dRHxQ+dvLnsHcpqhyx7jFil8crK637dnir3TcOQ+VfKSAna4e
	ltR4k5ncFaZzuZMWJnh6rfbqYTXffDj3JFXgkbYHLE6O+5w2QlvmJP3A8N8DG5Nhm1KfOGm0O1h
	CwAF1hKIzbjQ7qpKdp3+M8NwDlC560QT3/dM/WEjXYj6++GIQ0m1lfnw0WsmFg5e2MeDCnp3fv8
	ks2vSdvb5yGyc0ObJstUPAdIjJhiPxlyIwNB3s8c/AiFwppzx/oKlzeY+PfgCyNRESfqwWmBL7N
	4xBmsbnO9djTfMI5gtaxjwFk7QoiAbyKExL00BMCxK8tC2i51hZyEPnSvy9eEoGYoNpsVd1zgS4
	e4f7ze2zPqQxBjf6hnREYdaxjquqk/08nkGVM8pP/KsmQYrShraj/27d5P5MWIXr4tL0h7v7Uqi
	d6+DI3QWAtjRnf1qA+6BPupljsjxMibUnsCsLgp1rfraU8Sd/pTbx1jnthAP/RA/3aGKaas=
X-Received: by 2002:a05:600c:a115:b0:4b6:c939:3bfe with SMTP id 5b1f17b1804b1-4bb4ff4ad18mr798825e9.8.1794490646742;
        Thu, 12 Nov 2026 05:37:26 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm16911221f8f.46.2026.11.12.05.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:37:25 -0800 (PST)
Date: Thu, 12 Nov 2026 13:37:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Ashish Mhetre <amhetre@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad
 #iommu-cells
Message-ID: <avXBEbkBJ1ZMZ00B@google.com>
References: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>

On Thu, Nov 12, 2026 at 08:20:19AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> arm_smmu_device_dt_probe() only logs a missing or invalid #iommu-cells
> and carries on with ret = -EINVAL. For "nvidia,tegra264-smmu" it then
> calls tegra_cmdqv_dt_probe(), which takes a reference on the CMDQV
> platform device in smmu->impl_dev, and returns the error. That reference
> is only dropped by tegra241_cmdqv_probe() via arm_smmu_impl_probe(),
> which is never reached, so every failed probe leaks it.
> 
> Return the error as soon as #iommu-cells is found to be wrong, before

This is one of the things I came across a while ago when I passed
the whole driver to Sashiko [1] and IMHO, it shouldn’t be worth it
to fix as the FW can do many other harmful stuff to the kernel
leading to panics or memory corruption and the binding for the driver
is quite clear.

Thanks,
Mostafa

[1] https://lore.kernel.org/all/20260924085616.300650-1-smostafa@google.com/

> anything takes a reference.
> 
> Fixes: ea69dc4e207b ("iommu/arm-smmu-v3: Add device-tree support for CMDQV driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-206486@kernel.org/
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> The Sashiko AI review found this leak while reviewing my series
> "iommu/arm-smmu-v3: Keep the clock of the RK3588 PCIe SMMU running"
> [1]. It is not related to that series, so it is sent on its own.
> 
> Only compile-tested (arm64 allmodconfig, W=1): I have no Tegra264
> hardware.
> 
> This patch was developed with Claude (Anthropic) as a coding assistant:
> it wrote the code and the commit message, and I reviewed it.
> 
> [1] https://lore.kernel.org/r/20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47308..f685ed0c01b3 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5661,14 +5661,15 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  {
>  	struct device *dev = &pdev->dev;
>  	u32 cells;
> -	int ret = -EINVAL;
>  
> -	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
> +	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells)) {
>  		dev_err(dev, "missing #iommu-cells property\n");
> -	else if (cells != 1)
> +		return -EINVAL;
> +	}
> +	if (cells != 1) {
>  		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
> -	else
> -		ret = 0;
> +		return -EINVAL;
> +	}
>  
>  	parse_driver_options(smmu);
>  
> @@ -5680,7 +5681,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)
> 
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261112-smmu-cmdqv-leak-003f273b5e59
> 
> Best regards,
> --  
> Arun Iyengar <aiyengar1990@gmail.com>
> 
> 
