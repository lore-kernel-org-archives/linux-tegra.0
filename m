Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C726716F903
	for <linux-tegra@vger.kernel.org>; Mon,  1 Jul 2024 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719864436; cv=none; b=rOxxoNYqDrCizU2zUilKgbhVl8qfYp4OMzdQYZvmn0U5qD62qP1bBZX5/eU1Y5TydxHJQk7lZeURgmhCSR52VRgsdQGVJHH6/RGYxz8btcER3AF8ntxaBg46pxwv9zYluH6irrUS+VpftMd6wMeiRVa2M6EtR4uNOYXHk9porio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719864436; c=relaxed/simple;
	bh=DTx0TnMXknMnU1py/GEV3TbUeQ0A4+c8OwKWSEIEY60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYTjkk7tmwpnYHaf8Hqgx21hAQgyeg/O7EdaV1d3vtbtOfVuRqPvUYXUgxcQbaJeEyFvs2QrhxXTOABuIB4cpL2KtUxqVd9TA11y4OX7DLiqXvGmY1uFYGl1bFYB7E9fstSIG8RA7VMatLntuREgTdvq5aPXC6b/RmL3h0fAoho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pV7iWmMn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pV7iWmMn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d119fddd9so10812a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 01 Jul 2024 13:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719864433; x=1720469233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HA1dU22m3UNj5lyj13MGSrb+8h3p7MYcfXDGMuEpnwo=;
        b=pV7iWmMnE4CLmq/TiV0X7tzonmq/wxD24BAM1cWI/CSi7jua2bZ+hR/8iqNnZvmmCD
         lqfrr8GMbU9DCJpVX3xmkkMZPAmd3kJImpE/q9WXkjnSZxlwd3WYd3Ay/r1od6cJWll7
         p6XX92skCQsVjeyAB6JEQuuBNPPtUGq4tvFpVRLtmHPgFxHr67+njCHPsasnMnCD6ji/
         T7D2HQ+O/ZRAozy5waDZoewOIK/hmXFu65GgxBVv9Wzsl/E99kKQGBQRWBExOBWRy6Xg
         GLhw2ySClsWGHZDTmrbVIkwm0r0/GcijvTusNEuaVAGv+zYb5MptAp3y9KMXp/IEwpsU
         0fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719864433; x=1720469233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HA1dU22m3UNj5lyj13MGSrb+8h3p7MYcfXDGMuEpnwo=;
        b=moZJZv5kyZ8zJgSjLftPgx9L7k0WXCJf0uRT38TtNNBKFRtfmsim9haZDZGHt2UoDw
         Na6NJPDQSLeAXURkHiZ3LnGawszmtWkLyFz9tENME94kfNcEHWH7k3R1NGEMe4K+0I3A
         XVnYcSqj2MEkiHh59EzSvrLvl581MLHxwm2PkdyjGge+JunquI2jctI9anqMF1SLMugU
         yzzXIWM20bcSOzpGzylK1bR7TbXRkt3qPkt/S4QESSoeuGpOna7CfnlAek06vxwDGwnb
         WtwftXjgHb2H6FIB9Ps4ikbQxlMKXTf0ADfBVOXyOe8E67Nng9/BaNdVmiO8MxSUQoS+
         WhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZKvTzAVwDIs5eaLlFBfJHQBQF/icLued9Eu1XXLjxhzWE/R9Hn1K7Q1N2frRlsOXHYyXQAo+ZaSWRxI+CJ/JW1x9QfaJ97R+eVbs=
X-Gm-Message-State: AOJu0YzvGwL0UOdy0GcNn1xvh2+oIZvW9wcGVAaIyVUlUFK1YSyDrENI
	tetq51d2A4WcKuEf1eLIlUIXpTYvTDS1PK7JRSXDMR0f8xES/HCVGhTLDfb3fxwMXh7TQ6hYqmQ
	jCNXNohQEAiSdTcylg5HCh4upxoctlvIn0bld
X-Google-Smtp-Source: AGHT+IH9YyeTHtOmKWNRjWDZNOFaOcyjCIO5hmhn2IbnyBQewSRB362+m++tv5m6fkb6HeoZ2TpHUYTYJYIbCgB85hk=
X-Received: by 2002:a50:d799:0:b0:58b:93:b624 with SMTP id 4fb4d7f45d1cf-58b0093b6fdmr89607a12.1.1719864432894;
 Mon, 01 Jul 2024 13:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701162025.375134-1-robdclark@gmail.com>
In-Reply-To: <20240701162025.375134-1-robdclark@gmail.com>
From: Pranjal Shrivastava <praan@google.com>
Date: Tue, 2 Jul 2024 01:37:00 +0530
Message-ID: <CAN6iL-TCsS1dxwZngJ77J1MJcBeRsZW22W9uNLG59Z-isy9J5w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu: Prettyify context fault messages
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	Stephen Boyd <swboyd@chromium.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Georgi Djakov <quic_c_gdjako@quicinc.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jerry Snitselaar <jsnitsel@redhat.com>, Joerg Roedel <jroedel@suse.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>, 
	"open list:TEGRA IOMMU DRIVERS" <linux-tegra@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 9:50=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> From: Rob Clark <robdclark@chromium.org>
>
> v3: Split out the reg bitfield renaming, rework
>     print_context_fault_info() helper
>
> Rob Clark (3):
>   iommu/arm-smmu: Add CB prefix to register bitfields
>   iommu/arm-smmu-qcom-debug: Do not print for handled faults
>   iommu/arm-smmu: Pretty-print context fault related regs
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c  |  2 +-
>  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 66 ++++++-----------
>  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 74 ++++++++++++++-----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 71 +++++++++++-------
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c       |  4 +-
>  5 files changed, 127 insertions(+), 90 deletions(-)
>
> --
> 2.45.2
>
For the series:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
