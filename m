Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FA515573A
	for <linux-tegra@vger.kernel.org>; Fri, 15 Nov 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731691034; cv=none; b=Jc4DJKp3OjJ/99B8EAcl4nOiyLnfhg32GUaJv8O7a5P87zc79zakjd3pL76mUe7YIjIcM3CiSj6k765CQ+bpohM988AQMXdKTHwSVn6+BBZseEJ9P6G/nzytaIwXVB9oNQCJw3WNzrnPET6Cd6eGVnyEy2QBZG2myzoiMjRi4KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731691034; c=relaxed/simple;
	bh=r3jBVnZGxSxtvhjYTBv4hEUufJwtB4WYBde+FGZT5Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjD2ZbdgrlRVqDdgzhtivebHNrt8Hk49RKsWd953EOX8eTCWwrVwhPxfGAcZAzyYi+9gRFdj6GTr3e9wbv0fPKVY375Iox2wb65QUKyxV6k/L4brfXtAJz62u0q1UiuCkmN+8ZFHayHnprUh3DDJyCN7isXWn68NlA/hZkemFI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxrymZ8F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxrymZ8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731691032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=;
	b=ZxrymZ8FHrcZbdfPiw7mDqS58bk2+NjctsEAcu53vllQbaeF7ANlGb7abWXlt//zO2vKZQ
	d5XG3GK1UbJwUWOsfNIkqItdnh4Ix6LP9z4c9r6HEhxS4dBtXpfXfNIXl992nKBn6BLatp
	4wJ/VVDI5/Uj9fiQkg5/vRlsBf70WXQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-j7-ZPePkN5SLfeJcYXwyKA-1; Fri, 15 Nov 2024 12:17:10 -0500
X-MC-Unique: j7-ZPePkN5SLfeJcYXwyKA-1
X-Mimecast-MFC-AGG-ID: j7-ZPePkN5SLfeJcYXwyKA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d5606250aso1033994f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 15 Nov 2024 09:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731691029; x=1732295829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=;
        b=WpZhwkuzw2iRVrBWXELJYf1oPwpPh5u+OZaeqBW5NQCHP2IUnHwVlI4oJruEvcombs
         0X08hJXK9zKPBg5W/LLhknUrN/nn9/XzOi9V4KoNen1ctt9ETv0tWhe4pJlpZgB4WbHl
         HD/1uAi1ZM0TByKmFfB/qb8HQO1SLZTzpYiBkbItZzzNJpySSkvsQAFv2w/1fMhuvKlg
         mJD9sBf5DvyaRAx3QJRjpntBO48yONR0dtTsfNWWukLic6yICk3+WPrOSrr2289WCq01
         bitj/KRJXJjraqJhaqf6aAmjGzp2G9bBNjfz0zbefPqZW87RGKpKrZa5NdPzhPNzmFY5
         T2PA==
X-Forwarded-Encrypted: i=1; AJvYcCWLAsZcd/65xSwzdFU8v1QuaghL8TJ9WATPKxR6ucmZ4MPIIrvXUpjbfe23PGoH0FRV8fzP8uZFdNDpnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxpI16kDeJ2ZuQL2NrJUoc9/S+WJmdeIlCpIOghuRwWGCsux9O
	lsKLXE6NGA0gUOW+7qouCbgOjC0YwxEks1gGKpo3iq5RRvau8WqYINGuQDDnuOIenkXYpWKgcTa
	tZFzF7HCz6/xiSwd8rch7NO+cvHl21ywFZEhBbnXIoHjPUfyMZddyv+svWLxG
X-Received: by 2002:a05:6000:1541:b0:382:2976:c26c with SMTP id ffacd0b85a97d-3822976c427mr1615831f8f.31.1731691029630;
        Fri, 15 Nov 2024 09:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqsGWeYmupRnbdYRzMnGla3oGhpbGMYhra1dRBEvJ2Cnd/70uqsVI1qXDSJV35YPP52UmDlQ==
X-Received: by 2002:a05:6000:1541:b0:382:2976:c26c with SMTP id ffacd0b85a97d-3822976c427mr1615812f8f.31.1731691029280;
        Fri, 15 Nov 2024 09:17:09 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2a8bsm4868047f8f.17.2024.11.15.09.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 09:17:08 -0800 (PST)
Message-ID: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
Date: Fri, 15 Nov 2024 18:17:07 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
To: Parker Newman <parker@finest.io>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Parker Newman <pnewman@connecttech.com>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/24 17:31, Parker Newman wrote:
> From: Parker Newman <pnewman@connecttech.com>
> 
> Read the iommu stream id from device tree rather than hard coding to mgbe0.
> Fixes kernel panics when using mgbe controllers other than mgbe0.

It's better to include the full Oops backtrace, possibly decoded.

> Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.

Since this looks like a fix, you should include a suitable 'Fixes' tag
here, and specify the 'net' target tree in the subj prefix.

> @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
>  	if (IS_ERR(mgbe->xpcs))
>  		return PTR_ERR(mgbe->xpcs);
> 
> +	/* get controller's stream id from iommu property in device tree */
> +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> +		return -EINVAL;
> +	}

I *think* it would be better to fallback (possibly with a warning or
notice) to the previous default value when the device tree property is
not available, to avoid regressions.

Thanks,

Paolo

