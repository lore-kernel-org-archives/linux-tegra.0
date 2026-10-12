Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527823BCD2B
	for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797953; cv=pass; b=EDNffJR8bAH+5bOoavmvLqcR7U/WEci3IfqHFS3Qmob4N4bu7GyO5tssVjOBpBqyrczq50sLzrbBU41zfw6ermgp1InKN7ptKv4+B4bTwhEo20ZVxbc0qGNCsl01tXR38Jsp93TQxXzpMjyn32/62rSqrTfbudA2kUsc2fA09/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797953; c=relaxed/simple;
	bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzAu/AkSc/3TAIGwbz6NBj+xnLgLWGF5R7o0fnwhDiv+XrUB8QxAa71Fh5yfLrI0AUUVQpgOHSHYZNeALznkAvLTCI8NQcQV6qXY/GGiaPMnpp6iPXqIVTfIN9Whdb3VKX8f+64a0smonBj3i+AhNsr9kL6UcyzbiAHvhrppmFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDIELTuC; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDIELTuC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-85377c8bc96so622475b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 02:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797950; cv=none;
        d=google.com; s=arc-20260327;
        b=OPVTsWlM02UP9Gz3zhdcEodrKeFFkC7X0rcmFQMZEY3dEnuXCV5ItmGi77Qns3mleE
         CwSOmlkgSgI+mfrAKKpwmoHLSbVp2CxhUkwoqQCvC8UWZdyP5WpPF0rXp4IthchL+ijw
         hnliphs3jcOrFmVSCJn+RBi9ds7HtHJ5jc1O7pscWh/rAclWtcl/nRH4d4oIGwhjD3Xp
         023YtAOwjh1ymrY9E48sI/8Wxyg6IQrxrIV/TL+3TKANB9agwAjlRB4C1FLqhzLEis79
         o9EqcmcIa3DqHWuZrUxxRfU8O9pYAhwMpH2VjXk8y3KiH57nxygiOzNOxFQqQ1oCowpm
         570g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
        fh=Y1kusdTIxOqOFkctzTRLSyXBvei4EE5Vaq3k9aualC8=;
        b=mnaglb85sB6iEHcBIZsG3E0VeWoNGZSZdCLksC4/28QLKLMuKtVewzJxo9RH2LQ6gE
         pgVDrVB6PY2+VvZEfpCM6nzm1kntq6P6/2F6H1XRFJ9LDWnQ23TcXnuY92c8EOsb4Hxx
         iQ4MrSlqTq4NESFYEYv7qLQCASxtzTgjIQYTuHdvB8EpRti4lC9nDFR6hG8x9b4HC5NP
         mX60B4U/hDgm0KHesMKwNduhi3Ssbjwiokq5eAOooiAjYDh76NjItPsi+4CBK2jkk1Fw
         C4Bhcl2i/nwvn33AAfqmBcS90QDncNSeFzcBJLkxo9eg7/zezdYcfoYrG1wOV/9kyP71
         Dimw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797950; x=1792402750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
        b=QDIELTuC5xO9kvbzF8LipXyAjMFAA/thp46hctNbpAoIVySoJL1TautjHxBObhj9ZO
         dPl+oI3ABiYOTSeTtnC/JdPJWxY4QdUWSxGhj3WEuQxW+/84NFUr1AA1UuUuAAjFnSmC
         M/iH/Dg5eaaMBnsDQraXKFeJsRKokIi2QXFKgjtlqgnrHqG0945ijTqx0vK5twWN6Uu9
         Nk4107QhwT9SC1oi8/l924nXEZRm/Eewq3X7DHZ/c0r6oZWc+TEpffbUailJbmuwYwaU
         cOTD/h3RaujQSO6lcMp+G9QfyyGs9IHye0xDpMSY9amNNp+mzzaaSDhmpi90xtn/Apbu
         NCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797950; x=1792402750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p4eOAQSRydUrFhv9tfWYY8SfGm5O1qYqWKsd24mVNSU=;
        b=Zp2F7JWVQKwiKFLUKiGoNUdkDNBM6TleBirzcWgxPWwmz7UfIK+bnHzXLsdWA+ik+U
         SNzgl00mOnD6Tf/pZbmot+nMy01G6OAa9gWhtONYyLHa8HAvgGFUB5hdD4ZYKW6QURW+
         9bd6nq5xUee8uSppOayALBNxWU3XckhnIlkej1iYplmMruAswNR2SwuW7P++9WA7xmn8
         Gys87mxjXBrKE7O+0tZOKEbVoC6sOPuHzkgFzJ+qN/wkdThSzXvqzJ1kTIlzmt/QRa/H
         zrooN2rN14SI+OOG7TvLqh6LiwoDp/yrFixJPlMT+B7msXkdGgzIITRhLZ8GXQ0Fgg3f
         QYSw==
X-Forwarded-Encrypted: i=1; AKwUvByiLJwQerI/rhWpkecPdiJqd4aCsbegOyP9fnHM1bMiJD4sFPbfKsi2CW46w2ypqu6dTnwXLSfhV/j4ZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL0zZXwrdnb6HG04NAUurE1uNc+2rVBnnvPaJ3AtJeB/wMHD8CW
	nI6kLcStvel6F7rftPOVTydsShDPIj+tBcTCKNgCnCAOJqBRinoLFdYbLF+T+194bMrfoK0Ov+H
	GXI7VH1iVEi0+eSRgNtZfAEPz9tJvthY=
X-Gm-Gg: AYBFou13GNgqQjjPv02W6R8RZ88DivBa3A1brc3BJbLhYRzCAJd3MPFvgZjNGSfbEi9
	M+njUGmApfMXv1/9YiSxyJWIO7ebxKD+mTJWv9mBHjELeZ6O81wVgiu9/1xl5YoqZJVI4sbabT5
	yDV/9UTgOk5R6oHfU2PK6W/HRzhi7wgIO13kFwyacNgHvO0bntHrGbAQUewmad3xFqKOcaRY2qP
	dov18ibDiWAnD/JF+SJqyk1uKt2Inh3il750qJkUtiXa7kJT1+u+/pfMKaWMS3O4G9H+77bVoM2
	IP97oOoweelplbL/to4Asl32lnstmdXP4YK5uTN78LFxy3P6m4YV9IB/4o810J0OosRZNH4GO80
	oRXmxY7vN3aJ3J3nd/6xGJ8TkuBuAwrTIwgMUeslaB6hPg1fg1DTXjj9SkmlvSkK+qfl+I7XpQV
	swzw==
X-Received: by 2002:a05:6a00:1f06:b0:888:85a:6201 with SMTP id
 d2e1a72fcca58-897c653b01amr8233897b3a.13.1791797949637; Mon, 12 Oct 2026
 02:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104847.507776-1-phucduc.bui@gmail.com>
 <20261007204638.GA785135@bhelgaas> <CAABR9nGNoaO-CmTcRvXuMMmGbVSWybKZVBRRZmzQCab_N1EzZA@mail.gmail.com>
 <126200fa-49e0-449a-afac-cc08f4a9ecf3@nvidia.com>
In-Reply-To: <126200fa-49e0-449a-afac-cc08f4a9ecf3@nvidia.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 16:38:57 +0700
X-Gm-Features: AclHuK83I9LwnM2vO4kCLQ6Jq_5C8DsyXc8yQBXyQkkqIo_gLuZ6KKPGtYL1lwQ
Message-ID: <CAABR9nG0rXrtyMuuWOhK-zA0XNsMENuy73fXiq1RhH=GBapFkQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: tegra194: use dev_err_probe() for PERST GPIO
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kwilczynski@kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Niklas Cassel <cassel@kernel.org>, linux-pci@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

> With the subject line capitalization and "PERST#" style fixes,
> Reviewed-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>

Thanks for the review. I'll send v2 shortly.

Best regards,
Phuc
