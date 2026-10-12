Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C4E2DECA3
	for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798108; cv=pass; b=gxfg/rbHpuuUl1F9od3FH+soxVcFwyYF+xar7Ql3wCXPVgeIkUOjayD576nn6+zckexqe12akLMBX5dBRGYSi7rhhBn2HT+Olxr7Sx0uhPM+Tpe6/EDgy6yDXmSdFmIQ78kjotTk4lyAzlaLdPrpzzuPM97CaiRVGzLjUZGvaaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798108; c=relaxed/simple;
	bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUWZOe4s/6/FlQWEzFA/EW+O2fW9OgdrYBVfVrTYT56OFpXC4pvGARPf35n0RsFg46+mXRIQ+qJIeIKI+CwmiRt8L+Nz5Y2AMGqWug4gH4BVoTF/Pl8r2UShQRR4W4Orl+FC+t69+NPdwlz4Bd3lVMvI4ue/4u1mXiaisHfOVx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuKKuUMK; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuKKuUMK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd76b1361dso9661125ad.1
        for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 02:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791798107; cv=none;
        d=google.com; s=arc-20260327;
        b=S57FukoSNNP9QpjzZ/nl54CDZGs2Cq5K4S8M0GOe43NG4ysacbhbW/bKxULjJhntZk
         6mSdK6D/Xrw8eE9wx9o+hfrHYR99wIzSvK7Ray2nDHTHDkhpww3PjiyDzWCmmQKVDW3Y
         4rzI0B2B+O+yfSXgr88ZIsW9KnvAaTxOw9phRUsA83SgSM6LoFdaSbUNYPj5pVjM134/
         dpLPWk7ryfv72nQNXjqWlq13wLwilcbJcVKbwc+i/8y3vZXiySrI9zkLcnDeW7JYWDXM
         uGAOvLeeu4TNrXgOKkfdfGx6rqa71qslpPPL+wOUYLVkLXQxsBx6eZEl6FS9bQX46vyZ
         NXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
        fh=KO6kM2njqQykiljXumOnMIqWxsJz3rdxhQ4Rnjw/fb4=;
        b=K20wFgcEAXNRpYNT4jNO4ELkRy/+wd+4txz8F5z7YkVAVNUvuUuQiNSP5LlwZlcN/H
         QHi0saUazoih/foOlvkpPKggqfvRDGhnx5Rp/zuLS7h48c504ZdJCJscL9bD2OjOjgGA
         /HYWKJFTZ4nu38GIMS74DXLqbgmXl13nNeG5SItIIaKIRg6m+WB06bkXLmaSdD5odU62
         BHDEdJMqpqxuEUMtJhx+8G87/59/Zz0jVwC+osRjCkQt4IHn9cUc5x3kW1Zg6KHDUPd/
         JN/hi21F54PfQF9b4sGGxQrrED4bszhBVoQjoK2p3sPjOcLyoVzXFA7qn/r0cuPlyiiu
         WqlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798107; x=1792402907; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
        b=PuKKuUMK7FCJUAqsNN/uQwQCgRErWKIhsMxoKp882vmKUQTdu3xdKt36TnJZsiHhOS
         cJKJRAEqgILInj2M2mXOQoB+SCen3fdSti0NwTTIH2ISuBcZcLSsAp+yFpSSpAc/+zvT
         y6wvcoe7OQi/KmcSJ4MATVjHHidXPMIU6TTiFT+m7aL5YqWWMAFqZ2cDgk+AuTgChUm0
         rAgbdsAN8tc/BIctNRK6Of8M2zROy+/LfhJfZTzthlYFgIWfk4PQ+oHzHtCC/YiCF9v9
         EGnkhgvEmlz95jpsmsiU20OUfMXocVsGtKmFE51uAUT5A8HA3j5anP8bpRA3KuqsAsk7
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798107; x=1792402907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xEje11MauacCyql/+a8TCVSQ59zjM7UA50aHu0/0fM0=;
        b=I1mj1E5fFNWxm+QI11KzvcjtjW9eqcNBK4nU3SMpfxRxzpHCTpcyv1UAaCGp+eXcoE
         sUl5/TRljE9rELpP5Jfqp77HLGO1XtZVu8RNpApQHdvdglT22cUwSpwlfm5D5YCGAiQn
         Inli3ff1k6Ag36giRZ9SVCW6igjyUQANRJyuRyTV3iwDjmEDFwrSDHv1qJjB52SuUltR
         WZ7ts59Q0RmL0wRqnUdAZbovxy1bmEOAhD1AV210p6ufOLCpH9CauYobBW43LfYsZ9IE
         jyIEuexvSobV/W/cLBbvOO6etrzTuOII0ZOv2GqSFcjt17ij3WPYeyQbgrjLKaKrLrEd
         expw==
X-Forwarded-Encrypted: i=1; AKwUvByFCq+N+/NR7Y/eFWVjmC1T6P+ToW1Z056ww3Ewhdm5WyUIkydF7UatWGymN5vjcNQgatj5wKAhy/0+4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/U/Z40zcBDNtNlU0ZYW3ZMwMksH6DWOmxCSYH+KmpUBmQfA1W
	rY0PeqYw/USBKLY0TeDjDfuqZW7re0jQlwnoGmgNKICgzTRyYNqTn6lcw6G3AgB1ogAuoxYguDX
	wb5XmRLymWp8/FczoygBx+zZvNlzlOyA=
X-Gm-Gg: AYBFou1WlaV3DgRw1ux++X5DOJOEYAeerBFYGyOEzDudvb0Fkqd7s8Xikc6JdJb3imj
	gfTxoyNZ20hZEdsVgvJoddRq8SSqnjmM1g63DbWsDXpqZwyNy7MjDadVJ4QBgPJV1h/Z87HnCgh
	iF7qv+KGWoF/U7MDDivX4IbKWCjWBAsGDcXuHQrK6cZ79K/x5uYPQZ8LMQGZVrHwtj9LqP+3gNg
	tSHx7pBbdeKnnLQmoFBkvRNgRk7LQ+VocjgGs5FbwEgsFxuW6y/qdsuXgg4atFXoI5/crzE5I1O
	lRlGmJ4hq9Zqrd7dA2p8hJu3H+27151eyUipXjDIe5V3SNEIeX8Gtd50U3XsC5C0oL7wDQyTZNi
	bg4t6sJkykDni7HLdSMrp+q4gcgOEw5Q2/Oy1DPhbpYwAlTk9YS91xlPXU8v5D70oOeE=
X-Received: by 2002:a17:902:d2c8:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2e842ab812bmr74647105ad.11.1791798106721; Mon, 12 Oct 2026
 02:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104847.507776-1-phucduc.bui@gmail.com>
 <20261007104847.507776-2-phucduc.bui@gmail.com> <923d7875-69f7-4c87-869a-fc66727c70a8@nvidia.com>
In-Reply-To: <923d7875-69f7-4c87-869a-fc66727c70a8@nvidia.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 16:41:35 +0700
X-Gm-Features: AclHuK--qfWr1I67rnpFbrjIRtXfOWVmS6fI1rNM14DuFuibSj-EIqraNUcYF84
Message-ID: <CAABR9nEk0dm4Lghcp8-ej=-0jAUFqvi0dYBBEYg3uY+6YdEZ0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] PCI: tegra194: propagate REFCLK select GPIO errors
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

Thanks for pointing this out. I wasn't aware that you had already
posted a similar patch.

> I published similar patch
> https://patchwork.kernel.org/project/linux-pci/patch/20260923072237.1139013-2-mmaddireddy@nvidia.com/
>
> I am OK if this patch is merged, I will drop from my series.
>
> With the subject line capitalization style fix,
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>

I'll update the subject line capitalization and send v2 shortly.
Thanks for the review.

Best regards,
Phuc
