Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5112367D5
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316708; cv=pass; b=lUtmal5SxAbcsfDIEmtaqVfWC7e705VEoAx708nhqqIayo8wAvjNajgg71O4K/iU5jAHKJ9igBaQdWeXJJwc93DHOLXeNSG7x5xArSuCD1ag+E/dEDhCyTT4O22ZwLqj/LfDijEz2gSwlHVIXUceQFi9XSohDl9RhpVKEzU6pTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316708; c=relaxed/simple;
	bh=R5yBcvxIrh+AganNsnz5aAt3GgBlzlqjXADG+Zo+KvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXqb5E2z3CW1aPKvl972pNfBYIotmyPOHO0tymwz5zGm14llGm5SgKSKwirHzcSCthlfqDwiW85MilYiQY2xLnPKyFEvSJSViqN8EelzDP5PZd17H9FxSSANNHvBEeIYNaoHCV8rSBtPOvLJHO/bm1Z7fZx5Tr70wAOf8KPy5Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApT5PcLO; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApT5PcLO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4807068eacbso30061235e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 00:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771316706; cv=none;
        d=google.com; s=arc-20240605;
        b=aatl4QYD5jkO3rmxn5lrAJlDMFZf8nB8Wd/f+cu1rG1ZMEQVfz3nBZ9/mleEkRD1/+
         6ABycuh0xjqjArmWpPNKNu1+28LrfE/dTZQtgeSb7FN/K4PEr3k4Ffqdd/qLzR53Hu4A
         ojwMml2A2cYIOxtGFZ0lZ0DwWyHgL2fo4Vya8PulhPRBH8lFToBCNUlbaOLwqzhy4VW3
         OzdArX1OiNHhsu3PZKqxr3PBgDQOODa1Tn0htAtw4kAXt4kP98KlJPj04n7IJpaEQOA7
         uYJjZuX8Sj1OrWXtO1bvipAXgykDigFrOltBOilke31ACH/aNlAfN7jvAZQ1Hy0pmnrN
         EVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cevn5ys0yghHtKfwsnvO75Auk5yCz7+jT5T4iN5tYpE=;
        fh=oW8T7ek320FcJ8n6UjRV6WsQKiUJkmVn5XgixQ8hg2o=;
        b=JFiykYnq8heWsRGluSyZdEizKz4FFF+VHVkp+93rHTZc/DrjrmhpJda7hAdI64BCRq
         /YIog9iD7ltksKb0z0wnQdPhUsJlBHMWE4K1GMH18vZlZKR/ggdn7r/aB8IrOFdmQVEM
         p5sRGfasFWVXN9nYg9TCltt2wbmG5TFEFFyj2RGOezBtelRVcQCICPlZmbndArbfJvdY
         IC87OflSu3xv013NAJMR6u8/EAGJUIvXi8jMMF4cwL5lFBjmIyFnVkVnQXK0F6T3nPE0
         38FLg7i99XDeCd5vOyqSM2l1aYYkT9Gq3IyVMd6KJfpj5qlbDhzn6jwCoXbVeIt+kF+J
         dKaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771316706; x=1771921506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cevn5ys0yghHtKfwsnvO75Auk5yCz7+jT5T4iN5tYpE=;
        b=ApT5PcLOY3hqMRWU42pJJbfgEDtoAQTB4YdpISld/LZBxV4eyVnf0ZIFc9ZT8hfrFZ
         /BCSbW8kN3H19g2uTqkh9tKInBy9ErpXLLXlxqNPIJcXt0O6gvfSy5ukw7Fhm6lcRa94
         r5XLSD7KogQVTO0pvL1c2XgK5TAj5lKNgFw52STx3und3Y+VQIqrMqrb5BbPLTGtRSvM
         UgC3MgCxvfR/AYg95ARMMz5i2RLt6zHGepHp5CIVIaGU4DPPETjfhL9WXpX9LIghKpgz
         5Cdr9KwHzRks/zoiIYSdp5mcKa06KclMS845gUMw6fCpAlFP2weNCfcACdRXls8+eTd9
         uDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771316706; x=1771921506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cevn5ys0yghHtKfwsnvO75Auk5yCz7+jT5T4iN5tYpE=;
        b=OIIXW6tGvCGvbgIvZkh2ZqqsGK1Q+D4ozbYWvEjXArajuRm0O9r35BDMinz++xyOBA
         N8Ee7NSsL3IipuYjpQ9E0uq8CwdVULsbTPoIKy1OPbN1ZX3Wjg+SbwzgbyGsIGojovXa
         zJkUZd3AyCXoQzQb1DszsA2aJUEhxTKILkxG9rI4d6JzemKhYt7gSiDK7Sm96ztwckr+
         2Ien0kpZUX9emNInptx4IUCRuTCRPTp+QMMWtluQeuqQLEbh4EHzYZymKn0meX28uYL3
         vprom+BdbYh6AEdxEwaHF1BChm4mgTwRTNrEGK5rd2bc1Kj6IY56y2Q0Oca3iQLXTDmQ
         68/g==
X-Forwarded-Encrypted: i=1; AJvYcCWkkwpd8pZlLJUlwl7FStUiEd1hlNffPpS9VKzcRKL44mKOQizKtgJmHgYetdl07dYZbl09Rg2406axGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzckYCnaW99SfQO60UsAuPbNK6joSiiMObbBOBhTTzfmqN9BHV
	aHHdoOEyb1oPL/HLe5MztS5hwBHRkLFXhiTQ/0zoDBH/DcFvoIdcKj8lY0bOLxHgBsaDWDP5GAU
	q1VKJEFFY9EzS0SCw95SyExlpdr/9Bto=
X-Gm-Gg: AZuq6aJKy9S8S0fIFzxNATdAMJteBp41NDymQb09cfajUmeOpZin5xVfEg4spPELDmF
	nSiLurkif50n3sXYwLb1pa11kBHyaxX8mz483TqYQqqOMhyIpca8msBq2pjcC6anCtjkQVq1POm
	muYZrnUE24+QmkNLU5BciK2F4RGtwxsq4cvUsbGlPDLOWsueNE8KwYcahnKkuuAQXGIl4DtmBqe
	r4IyDGL9egY2131/9tkxW2gWYFJRvs+WnYT5v2/G4UzkfvO25Q8myPXBLg688GwA8Ag0TVWsVdR
	OvZzcqUm
X-Received: by 2002:a05:600c:4704:b0:483:3380:ca11 with SMTP id
 5b1f17b1804b1-48373a74dccmr223433515e9.33.1771316705738; Tue, 17 Feb 2026
 00:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126190755.78475-1-clamor95@gmail.com> <20260126190755.78475-4-clamor95@gmail.com>
 <54043284-141e-421a-a54d-a018c884b324@kernel.org> <CAPVz0n3OEN2M=wj7cq_-qrYi5VkMUP4RcUB7=sQxnLaGGivKVQ@mail.gmail.com>
 <b7de1799-d113-402d-82ab-06492216ebd8@kernel.org>
In-Reply-To: <b7de1799-d113-402d-82ab-06492216ebd8@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 17 Feb 2026 10:24:54 +0200
X-Gm-Features: AaiRm53FZaqGUOY_PWvCB8PtV2UhbTkwgvj_a_drtkP5x53M8MQ3fjtQjWUpUuE
Message-ID: <CAPVz0n2qNebbfoq4tnpH42gjiV-XQTQQ5hiXmXddepxMs9F0+A@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: memory: Add Tegra114 memory client IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10:15 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 17/02/2026 09:02, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 17 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 09:22 =
Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On 26/01/2026 20:07, Svyatoslav Ryhel wrote:
> >>> Each memory client has unique hardware ID, add these IDs.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> >>> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> >>> ---
> >>>  include/dt-bindings/memory/tegra114-mc.h | 67 ++++++++++++++++++++++=
++
> >>
> >> This is never a separate commit. Squash with the binding.
> >>
> >
> > Always was and now it suddenly is not? Maybe you should consider
>
> It never was, by the rules. I give this review all the time.
>

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
include/dt-bindings/memory?h=3Dnext-20260216&id=3D96b0239bbd6153b70c14c8066=
4ebb43cd2ddacd9
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
include/dt-bindings/memory?h=3Dnext-20260216&id=3D825c7f4aa2866b77c0238855e=
2f58d56d2f13eae
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
include/dt-bindings/memory?h=3Dnext-20260216&id=3Df25696bce9604dbfd8d956da6=
023d18a05ec8ed3
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
include/dt-bindings/memory?h=3Dnext-20260216&id=3D24a7eaea0a941c9e5e243ffb4=
0073dcafecd3c11

I don't see any of these are squashed with any binding, but ok, whatever.

> > fixing checkpatch since it complains that binding and header must be 2
> > separate commits.
>
> I considered, I guess many considered... but the problem is:
>
> IT DOES NOT SAY THAT. There is no checkpatch warning, at least on recent
> tree.
>

Interesting, it is not now, but it definitely was. Acknowledged.

> Best regards,
> Krzysztof
