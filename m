Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B74D2FE582
	for <linux-tegra@vger.kernel.org>; Wed, 17 Sep 2025 18:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758133615; cv=none; b=igomT6sN4nKhk6+a2oR6huqKuJm1N7EG4ldV+r5Ab/x3X9S03BE3GzGJT+nRS35HvKa65HHiqyzTGF3jFuJGl9OClkDpPOeFgVHuuLdN/5mRtTEIGMopFj9dsHKhyrheRXI9nvi4bmi6ilNz7VAt3dhvw44anG0GqhG0ikNue+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758133615; c=relaxed/simple;
	bh=VOindL3lSQlV+EU8bzBVqCefJiskGRsvr4EyQUGkHpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pij5vlOR4V8aCR+LH/pwQY4ZULSm/Sqtlq/OazaIDXhFRrBntOJ3WgV7xPQx+P0mHPI6xdPQ9ppbz5JjrxWYRvI88+hZbDGDCHyjxqW1z9C1DwxxaOe69Oj5cGIu9vFp8/NoTx4MINEQyb+RZZYVhSEBhXEDd7A28/DC2j6tPb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+4sa/i/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+4sa/i/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62f261a128cso84165a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 17 Sep 2025 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758133613; x=1758738413; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KE5vzhXPDe/Jivh+qVVI2ieYJwT4ugymYXPAOJdscp4=;
        b=k+4sa/i/7kn93DZNGN4Qvx3feW/CX14EfRmaW1leB8pHlXkIofY3oxG18NfrdelQ6E
         jKxMmjgj/7XZJBfpqm2oBgMM9N2p7H4HOXdk4ursgjqZsiWSzKQpvIBPDnVMtcpFPwhL
         YYZw6CIW4Pwq5M2m7mSy8MTUfdGLc2MRUO56z0p0rTgIjeHgIik8c2qj7X1r3QXfrCdA
         v76RQwNv6ejZPNvUMrWuBu1nKGn33GjEKz+yS9Ai1sWhQ5v3n6lsYcbjsRsb+P2aYlLq
         B9P1omqeani/0S3TQH5ydUJDrnecwoDZU3D8Ngc1JMoJEcoPAYN8iblIKWBPmIlE7q0l
         wjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758133613; x=1758738413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KE5vzhXPDe/Jivh+qVVI2ieYJwT4ugymYXPAOJdscp4=;
        b=CJtDldZudzibCdeqRTqvKMGm+lR2kd87WZpa6UgeVFxZHkgtkOdqZOV4kfBT51opnc
         U3NVVZRT23ezfWKseU5WDOwOqwKL53pPete0L+mGu6X/P/3zTtRxQWlQ/tz88SY/wvUV
         0wZtIc30PjbMmY8g1zqP65mqMFJK+PPBN7Xc7zkjomuBa6L8c1rkNQui1oN0Td2EYh14
         VULSwvjzHwiNhckxscdF/H8yZobSUQke7DdP6wGey/Jr7m+W0k49GWC0MC6hYB86ihpr
         VyH/LE6L6W7cMlPaYpczPwBLTl9K2vYyKwL4enxeeYGypHAX2mFBHg9m0yq/ghTTXt6O
         ndAw==
X-Forwarded-Encrypted: i=1; AJvYcCXiuGp+tkDjetlj6CoOMOFiPvTykx46aqvJWYJt3DyRUEum28NN/QN7Qvq4rfVN0oRJ2UlHovHfTy2qcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjx4NUpSRGUHiB6BRG3OqopMMu7twW0/JAdki2mog0qUqTNPYA
	4NpDYV9XwJcS9FskoiQs9je9w4jGPj03RmXfCNelimtVStRy1liPV+iCGaGCRQKITE52Q2lZfLb
	UIHJ4tFp+T+tMYMt9p+hDYq9KI3b35uE=
X-Gm-Gg: ASbGncsOVcu923ZFGmOUCeWP1aIboXwf38z4uf7jkdFzbxC2h13RWkzk9dJ2aQBjpO4
	yw0F72JxKkmglfCH1AraD0icVmC9T/GgNhVYPLgFfm0RuJH2VdCh72ahJj2SD3mcyKiYlzPJ0QX
	3biU+xLZaY45fz3Z1YFAXHQFwAssjC0h4DfCKTJR8zaLBYqvkllmteWv9dhnzM/BINBcDDdWQBk
	fcOnEo12Z7v1784
X-Google-Smtp-Source: AGHT+IGEkC4e+jpdiaw/hjRvLoVCqkr7yflYqLNKY/nMRIxPb09k+z4AWhjNOjTproo2SENLd11XurMp8ldAQeOkPHM=
X-Received: by 2002:a05:6402:1ecb:b0:62f:897e:f10c with SMTP id
 4fb4d7f45d1cf-62f897ef2f1mr3046469a12.35.1758133612406; Wed, 17 Sep 2025
 11:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250831190055.7952-1-linux.amoon@gmail.com> <20250831190055.7952-2-linux.amoon@gmail.com>
 <a743fd19-d54b-450f-a4db-8efc21acf22a@nvidia.com>
In-Reply-To: <a743fd19-d54b-450f-a4db-8efc21acf22a@nvidia.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 17 Sep 2025 23:56:35 +0530
X-Gm-Features: AS18NWCdYdMNTArMBqsuADdCuXSmojDCTvOV6KkCt_TLO4kj7BWmpqiyqyTAfVE
Message-ID: <CANAwSgS-Oq7iXDtiWM0W8NZ2q=BcCGviJAUdscWJRvyxLsw0CQ@mail.gmail.com>
Subject: Re: [RFC v1 1/2] PCI: tegra: Simplify clock handling by using
 clk_bulk*() functions
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>, 
	"open list:PCI DRIVER FOR NVIDIA TEGRA" <linux-pci@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,

On Wed, 17 Sept 2025 at 19:14, Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 31/08/2025 20:00, Anand Moon wrote:
> > Currently, the driver acquires clocks and prepare/enable/disable/unprepare
> > the clocks individually thereby making the driver complex to read.
> >
> > The driver can be simplified by using the clk_bulk*() APIs.
> >
> > Use:
> >    - devm_clk_bulk_get_all() API to acquire all the clocks
> >    - clk_bulk_prepare_enable() to prepare/enable clocks
> >    - clk_bulk_disable_unprepare() APIs to disable/unprepare them in bulk
> >
> > As part of this cleanup, the legacy has_cml_clk flag and explicit handling
> > of individual clocks (pex, afi, pll_e, cml) are removed. Clock sequencing
> > is now implicitly determined by the order defined in the device tree,
> > eliminating hardcoded logic and improving maintainability.
>
> What platforms have you tested this change on?
>
I'm using a Jetson Nano 4GB model as my test platform.
> Thanks
> Jon
Thanks
-Anand
