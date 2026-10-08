Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010C392C46
	for <linux-tegra@vger.kernel.org>; Thu,  8 Oct 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457715; cv=pass; b=QyOiubkRt03rJzUcdsWDdQ9Y/0GS2djH8hBGoHjgtG8sf2ZxaNBPG+l0nQoYEqMVZDkXpsCUL8Nid3vrHQbWlVffejDStHUtdLkUKMZN1CUMG5u6KrcSyqLeyq7uu5m16r4GNQ+9NE1wxo8kkrpoGAbQeXWjf8SUHQwIw9Imc5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457715; c=relaxed/simple;
	bh=tS8GOr7rQWkYMwitY30VlxqC6IwwevxTL76E8/wWKyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhtuU6+X8dPUl+MQP/chyRIlVNNp5MW3oKFMbVfSqeBN++UqRJDmLuu8Rs/9TnsKFtIaEOLxUesPbX6dELeOlZVZToDdxD28KtJzqHxj/WSv+vw3cour9kW9lx3d0ua/dAtsnzHLVJ/Hk/G8fpVi4zhFB08LqxjI5pKryC/bR28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CK0aaaSS; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CK0aaaSS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a5aad413so3741265a91.3
        for <linux-tegra@vger.kernel.org>; Thu, 08 Oct 2026 04:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457713; cv=none;
        d=google.com; s=arc-20260327;
        b=dA51O456P6hqA65FUMG2JYYu92zU4TM6pZpAbqQAxRJW5D1gZyPuFj45grklSikU1f
         fdXamc6rt5txJegz2D9iog5Y58FfbrDHCOkl+DwCXgjaSOd7S6snS6XT9mGWHD2KnZyo
         4l10bgA3qU/90AiOjsKtvQnP4M/azxMt/fScAitCO775dkd9v51JkUXA7V/hYWW/tG4G
         0dn8YyTD2Rf+dLHLBthbOVM1qd92GLzwzpm2yFSorTqfodhd/miQE/3alVde2wHDbjWB
         rpcO8/8+7qYjq0U+5Q9ZhKCpL3Q84LrbVCwkSqF2IhN1x/oq2ncQR4zCGoYSic+cF+tR
         Z7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B38Tn5bOZ4ypk6OTVOr1ifEvTd0RxYUIpSKcn2uioac=;
        fh=WWgFTHRWH87c2+llWEy8do476d9vb2lvkimqnogqcrg=;
        b=i2duvvPUnICiAGEKtctLtrtatUgrpbIb/l3qVJpFk4aTitgbeBqnWXwUPL1/7s3eRT
         UgKHUYV2YuqLGPmjwDbYgSASY0ZqIpo3FmKaq5GlDP9imJotlc/vjeRavdDCz7dPL/+5
         pAflhhpDr+Cg8vIxohfHbXDlzsKuIYe7F+ZwGW1R2jUMqchoeP09Ythe9iXUII6BfQt2
         TZRbNZl0eDMl+qRo+xUZanhXlJFkXBI+EneQIESPeSDifKN0WMUJNSCLW/+1gjPpHt0X
         tcIPlwEXGGbe7tLyx3UBw8WsGaYg03K8spIZugEHN21FIGqLMDMyk/f61vRYtEDR84MY
         8JSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457713; x=1792062513; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B38Tn5bOZ4ypk6OTVOr1ifEvTd0RxYUIpSKcn2uioac=;
        b=CK0aaaSS95cFam8fOvFIAL03LolLwH9M92v2paGpuvzZWVLGifDh5pelUa4fX8M2Vl
         EmGlcUcUI1xtwYtUxU+4W+dLbIOPmIPePnpWkSJ1wNgmStzopQa+Zserq9TXeh+bXQya
         1Urn/ymmiMSIPXlC97tJvP3LRbZKcEaaJd5kAPa/aM6MhnDkLcGqjD4mWiRXH5tPbpr/
         22vNHaBvvj0TNMecngRyslMw2fymouAe9cR7ddFAqSM84UflBxTS9UiRZlmjz1uIugUS
         R2IFl9nzG9sgz6i6fey9cFbklIdM2vLeZ7QpHzyig2iJcAbESUF7gaZMhGS4txGD9IJo
         8+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457713; x=1792062513;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B38Tn5bOZ4ypk6OTVOr1ifEvTd0RxYUIpSKcn2uioac=;
        b=yW43KAJ11jZKHT+DC+8Ec5Kytx58fKjtrCn94HxhOW6ei6LLjq2XLNlt9yfhyhGmtO
         DI1DE0WT0jzGQ1kJSaC2DujyZNfOH3X8TSN73saYY4T5qtJBvvivL58hAJXi0pouAQIb
         24Vs/UNlY5rNgM1NwgR2hbR1YiQbRwLDzUjZ2RCddYSeMZCE7MIiXdEw3nYaRIy8/hPc
         +JrywKPS2OKaC8kg6E+uzif/pT26mr2qmaEpdhVVGdtQ+ooGfUHHIfaHDBAcUlV32NN5
         wEF3hpdmKBOBB1pkPhxrmbPPAN8CNV+gMyt723YCxQB7/jk5H8WDHuwhkipkeZPdoCIH
         YzbA==
X-Forwarded-Encrypted: i=1; AKwUvBy6IKvPba60Ro8w4ulpjFV16X/7H1vzUkIDY6zyaumtmrYm1witrt5t/JaUGK2v92w4xpU0Bs7vbTZCVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKk9RblvMl5tpCG9REfrVHKuGkfIDWge2rctesdMXixMb32EJms
	XvM+JU+N3NyCZmzLSnKNNCQFy+WLUAsTK2UImuxk/7ZnAZhcm4fHTFkmEcWum6YiKsVEkR1nsWL
	ApjPVIn3BTJTL1b6gDp7RKldJSr9lQCw=
X-Gm-Gg: AYBFou38q9DFMuOO3fyHNFeKdMiDCgRy/kx+k4oi4+abPjSJEHHO1F8HRIqaVNnJ34P
	AK5eZ2zh6jll958N0KKV6hQj/ei2cL8BJz+F0s7cdZqsv8RhFyt4EK0jlHZEOmFkp63fDYuTBMT
	SN8RMD6llWGNDv+xLGsLCIt+mqvdts8Qp3Mp0XB7EbT6YM9Jnu1u0rpbZ7KRh8JRmB5cLS2yYMN
	UFQ+tnxXIp1cjatdrEgdtk/AQhDs5qYQBXZJaNm4UpG5RRXgqx69uiBto+7jmRSH2m3E32g6IHL
	zuxQwnG6cXo68AN5iQO5099gBEzKpqTbg2TYaCMpHe12ytFvF+7grJsILHMFlYCgviS6MEUV8jA
	cT85hngVIQGofYtkTRf68XNs3eVL2/KnuWgK2XnUAKxxv5om9QKDW2HNmkWv/NFLalXw=
X-Received: by 2002:a17:90a:282:b0:3a0:d651:3957 with SMTP id
 98e67ed59e1d1-3a8a1c7201dmr2864732a91.35.1791457713546; Thu, 08 Oct 2026
 04:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104847.507776-1-phucduc.bui@gmail.com> <20261007204638.GA785135@bhelgaas>
In-Reply-To: <20261007204638.GA785135@bhelgaas>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 18:08:22 +0700
X-Gm-Features: AclHuK8M_me3PRP7AsYK3GSu3gkXR1O-K2dV5c57zcLYGodZRRQeb5VUpUwH-0g
Message-ID: <CAABR9nGNoaO-CmTcRvXuMMmGbVSWybKZVBRRZmzQCab_N1EzZA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: tegra194: use dev_err_probe() for PERST GPIO
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Manikanta Maddireddy <mmaddireddy@nvidia.com>, 
	Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

>
> For future posts, please match the subject line capitalization style:
>
>   PCI: tegra194: Use ...
>
> And style as "PERST#" in the subject, commit log, and dmesg text to
> match spec usage.
>
> No need to repost just for this; we can tweak these when applying.
>

Thanks for the review and for pointing this out.
I'll keep these style details in mind for future posts.

Best regards,
Phuc
