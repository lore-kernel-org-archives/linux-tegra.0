Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BCB1DF725;
	Thu,  8 May 2025 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704301; cv=none; b=r3HTR4EYlq2wJzanSHEzn9KuCpoeF9pQskSCZUhaG1izxkLz40usEzwleBkLylWjmq14Ur0M/NpYl4zq7hX1JN9rCh9J4CcBPNNRb9viznsuYYqBi2osKRdcviRhGwYssdBIqmS7mq+TswxxfQlPz4I5UNgddnhB+aedcTUUMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704301; c=relaxed/simple;
	bh=uuHO2oRBCQSuQMjs5OfmNWlTjsqum78D6J+5cQCoj2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkwEGuDV++Mwi0XJFdKxLI6u1Ab7pARixFj4eAEuKdYPm+w20bC60MTcufNJSJ+HhprdHOw2C5UeLYTD/QdhYzGZZjbkuGmTM3GIAS2Aa4dMLUxpCa0vkdTLreeDROg4o6joFxpkQTS1tW1Y9IpH+im6ttREYofTWjjpCn121hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEYaSFgM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEYaSFgM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac25d2b2354so146004766b.1;
        Thu, 08 May 2025 04:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746704298; x=1747309098; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoX1p7NNio7No+XgFcOQe29Y1CHCAlfDMy6GWzlAkJg=;
        b=IEYaSFgMCfUmluOuzLyI+vxXDs36TKMsGKFpcUoumsKNJc19gxnnigA7tQLFwH0apv
         MjMcNjdRVU7qica2lae4KneYGqnqqbghCKVficHL1R7VEWTUu3CI8A5GhVQBTsgUCWgV
         TVU+vzZmCl1hIqkBSZr3OaMeBR3uarmeBwe2sSU9zbjxgJOSSOdzvSb9ZwY69yLLy1gR
         ExC44WToLN9IgMqQntslOm34Nx45I38DGSEp6I8o8FqvQ6+Mph85A7vXb/QFVSnTj9zv
         reTNaZ1+2j5my4IPpd2i3Z5OUj6ed6ccvifmA4HywnXMJuqODZ5I6QF9aQ57GNKz3YTq
         8B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704298; x=1747309098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoX1p7NNio7No+XgFcOQe29Y1CHCAlfDMy6GWzlAkJg=;
        b=EkqMPscgjMwDQoCzwRG8u8ColrY1BgHVJpZLKu0+GUXaiG+M1jao4W9glalb6+9kZ1
         HtRR+Gf1DKJ6tyVHF04XHGwqShxq1PTTZcrtkh1CxoiCB79cM1V2Tiem5283+/jVP7de
         gq+xNriQnQ+0lkEbba9i7QB1tizOMG9q2XWGngWZ9Bsbag3UnSJNht2U/6OTFdKV6lhN
         ZUR5dMwHAaU7/fxR4ig+UI3xAYQikufpASyhmSvbMDxfjXu+N76OOR2joEaERU+cFCq2
         jkmxyNWWoGunDtYJ3Eze64857c2rSmLiU16otxDyyq8rWWeixsAWnTE8Bofer6QuQAYh
         IaAg==
X-Forwarded-Encrypted: i=1; AJvYcCU3qeJSpPb9NtwOr+eiSCYvwfK+zHG2wzuhqMUIR2arLd96t8plgKTlpYcbLlaq3/yLKutiX4wG7G0TlRdf@vger.kernel.org, AJvYcCVMJRIhBO1jBZ/yn3bc2RuRwTcllCA/WVlJ+FJc16jsbZHkSQfTckbPBdliAxfgNNjtTARK74aa1/yQMW4=@vger.kernel.org, AJvYcCXnzJaMvF5vAnVSIilNngCbfJocmRY3dOjTg5958UXVlWMd9rl4JilExxfymMspN9ChVTaVdSNJDOhE@vger.kernel.org
X-Gm-Message-State: AOJu0YyMY/T+WBQdSCueO3cUZ4QA/W+vFQcSUKV9OfP9O45stvUvjS75
	ncOT4bLb6bwJ37Gd1e8+2b/4bXKnDzCbrzZ3O60pCrfez/3t3TGPaBOnaQyaIJHQpCWOQCsMBZn
	SHs4zzZaRNODAnWFRtazLXhIRwjNlNf3UzypFjQ==
X-Gm-Gg: ASbGncv4q7Ab3eDM9NQuP47dWfwLqJRwpcNuV0fM0lh/LvPqVWJHSUcSX1/Ze/i5tev
	+T5NHg4JM7euHUsz3U21aIgRrwj9Ne5up7/Lre5qE5F4yF2ex5wFMTo31v0r1osrZIMfh5NiCpV
	fDFwFOuv7h8O9ce5GOoNEknII=
X-Google-Smtp-Source: AGHT+IHL6kf3GwkuPcdXHItn/riFASOsqpAVss26lgHk4t3WWUdpstvnWi6KUy0ubDmJmH/ncB78AeZjoDiLHBvoyNI=
X-Received: by 2002:a05:6512:b9e:b0:54c:a49:d3de with SMTP id
 2adb3069b0e04-54fbfbe931emr1043825e87.10.1746704287025; Thu, 08 May 2025
 04:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com> <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
In-Reply-To: <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 8 May 2025 06:37:53 -0500
X-Gm-Features: ATxdqUFbPXQRfWn-AGLFquqSFysXpZ6dFC-963DIl71_DojWIckzVUVv9i9dN2w
Message-ID: <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC Tables
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:41=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, May 08, 2025 at 01:07:37AM -0500, Aaron Kling via B4 Relay wrote:
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Changes in v2:
> > - Add patch to describe the emc table bindings
> > - Add patch to allow a fallback compatible on the tegra210 emc device t=
o
> >   match firmware expectations
> > - Add a patch to include the baseline emc tables on p2180
> > - Link to v1: https://lore.kernel.org/r/20250430-tegra210-emc-dt-v1-1-9=
9896fa69341@gmail.com
> >
> > ---
> > Aaron Kling (4):
> >       dt-bindings: memory-controllers: Describe Tegra210 EMC Tables
> >       dt-bindings: memory-controllers: tegra210: Allow fallback compati=
ble
> >       arm64: tegra: Add EMC timings to P2180
> >       memory: tegra210-emc: Support Device Tree EMC Tables
> >
> >  .../nvidia,tegra21-emc-table.yaml                  |  1692 +
> >  .../memory-controllers/nvidia,tegra210-emc.yaml    |    44 +-
> >  arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi | 49749 +++++++++++=
++++++++
> >  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |     1 +
> >  drivers/memory/tegra/tegra210-emc-core.c           |   246 +-
> >  5 files changed, 51721 insertions(+), 11 deletions(-)
>
> We've had discussions about this in the past, and I don't think this is
> going to go anywhere. Device tree maintainers have repeatedly said that
> they won't accept this kind of binding, which is, admittedly, a bit non-
> sensical. 50,000 lines of DT for EMC tables is just crazy.
>
> The existing binary table bindings were created to avoid the need for
> this. I don't know how easy this is to achieve for all bootloaders, but
> the expectation was that these tables should be passed in their native
> format.

Mmm, this would definitely be an issue with my long term end goal of
supporting the SHIELD t210 devices on mainline. The bootloader on
those devices cannot be replaced due to secure boot and that variant
of the bootloader only supports this dt table for emc. And support
without emc reclocking would be rather unusable as a consumer media
device. Unless the devices could get a bootloader update switching to
the reserved memory tables before they go eol, but I don't see that as
likely.

So I guess the question goes to Krzysztof. I didn't have the bindings
or a copy of the tables in v1 of this series, mostly due to a
misunderstanding, and was fairly asked to add them. That's this
revision. Would you consider accepting this after any fixes? Or is
this concept entirely dead in the water?

Sincerely,
Aaron
