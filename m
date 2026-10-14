Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074C4A0136
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968446; cv=pass; b=SEzm0NuDkAjYvSih0k4XeT/wjjYhjK0JoQLYcNUu88r6m74kbhMQjYjrA57L3gi7QYJgn3d9N7dG1h1R9c0XrBGfKu0NAjZkIicb+qeMzhoW73ysj5fPAserz/2eP0/A6JTPS2o4pZMB2nSG5xMU+7hYQNoy5LD2QdAgHB08yxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968446; c=relaxed/simple;
	bh=tLFxslh9baVvXmIpYm9o+POl3faCnXysDmFb2JzF7bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LG/gTRE+vqL6fS4+HC+ZibIqmOo5DtXiC1cZqEGc8U+EWn9cPYYaintjzpROTUa1oXRcez5kGify7DnqC8wGiUZOVRxlZ8RaFbT5WgxI3YYtlc4coiVxb0XOu6ccW7qlgZJcyr4t5xP10zSP4RbjWgaK3KWRwE2W3VidKdFbUu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn4pgo0x; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn4pgo0x"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-141395927feso7304197c88.0
        for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 02:00:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791968443; cv=none;
        d=google.com; s=arc-20260327;
        b=OkWVUXtsj4zaA5JpEsTIS9BKS0V5ANHXEpq49hR9X3TAQSbQtufyv4Aroe4qvBmhV4
         mledmjKtfIUD7u0BJNjeLB+VMN1/wNJNty0DZFUNVAQkjiruwsuj20hRYA9V4+fpSka9
         nuI03jvWYGy+c98ZJ0EAba61nd+xTddbRu3def3P51IHlE0x3WtD0N4h8u8Mgf4ILDsZ
         6y/MhwyBCqW5KiV7Z8RJ58HXfs+dSNjXzWRgZAPLgtrisAgXnPHJF5vSJ5BKgfqoO1h8
         5aovXs0ZGKOh8k9HPAFLg2MNCcIbOgsy7K+MVY7ULACR5qWKrJTjclawvTixnSbJgVH8
         p+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        fh=CkE0+/cU29lX8FZz4kfPmSEh03yKVeqEGxZ2K2Yjx8U=;
        b=ARnLCZVpd2VHn+tPDDL0HrKPATz9R1+aYC3UAPpOev4G0ZsN80+VJGSaCT9gk5CUFD
         ZYZuKnJJG/YAIrLoPnU50qxfYFGqckK8I8boqk6tEF5esDQlaDE6a237ZOjS9IH5e+i2
         LigFv19Tqm4hLW5h+UnlPWC4VphrgakKjn0nCTCE3ufg1Db0+129hgSb2n9vHWv7G3y7
         EJ9MXTe5ylL5Kv1HRJffWwfHRETUMfA109icCwcl+a6Ry2iNT53X/rWAxvzjGXqum3XQ
         7IuZd4xt0m2J0BYszI6QFEX7OcJFJUD0EwxiIW0yOO0m9fffI3uaIMqBuN3bjFwdhZxJ
         ohAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968443; x=1792573243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=dn4pgo0xHtSUKgUFKsL31ZRID9HudJwxvdKau/+p/4ayiXhPQ5paiDSZP6t/9jjHmc
         d/omFrVGUKCMKwvlIRp+nZ9mCceUM5c+IEu/cwSf0bU68i4yYHzZWIoP1xyFsz4G6oTV
         0R26qzCL3fJZk1t+lYLX1uvBMP7iiOfhd7pbPP0/sBBWh1onTAtNtf3tEUoz+xYImUwQ
         15R179ZvljmfPR77ebjef1Ll3pd9j+RR4Q7oa7GNfl3aBBAWWCpI4V7H8CBn6KtGEX/O
         hvM/MRYJkOIL1rHYPV/0Fd4sUJBDm9c8AFWYrkbAenpJM4AhFqRIybzKVnCN4yi+3MKH
         FLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968443; x=1792573243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9xyJKsfUBa0FGUnDXa5xLRJ8YothmB2dBHIAfXej6w=;
        b=dvx8Lm9Crt8Z8HT13mZnJoIF77RP5gFGpesfCRIgPD25MDkLtFrw2EYvLWH+diuxlg
         I3LlAzjob1jZ2jMu164CR5ebbRakDdj4n55QhKBemvsVZyz7GlcXtF0HzRyuixFa79vE
         KBkm0v+tx65WlmTdllnliNTNE/dasUJHA1mjE1e7cjAdQ8g/liDyMfCFH4w4tdOY707K
         Y+qWPncP/AwhJ5Rd8bZCoD9rPgY5fSOKn6QtjOHf+98dy/xfqcNrp6vTOPpoqKVYSBvy
         U/UWl6QZdAvAUljrUbKUfeew320O8yeNdkUt8dwmdEZH426rswuNJpBM64k6mfRC7L5n
         XY0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBFuBzSMYnYypBmKBTuS34wtBwkwAw1vkdXeN+slRVygz7Ze/S2thT4zLM81/mc2AQcTwSfg7c6/acMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ48ceBYlUMLRpbJsiHyWco8x6HLbFF+rqTGYRCyIqu26sELa1X
	WVgeR2cPy63RZMpY6n6Uz7MJAA8ObjtVW75M5AotA3T0RGyB+W8YqBJgIteKB5bpPf5hMSCV8rG
	40oCEZpCzNeF5a8lTCX7w99RFpnp8RXwJCpqO
X-Gm-Gg: AYBFou3uLRoqQhxFgy7Z0jiib2MlEfvESDCUk9pkSKf83eU1ix5lapD5t5bet9rxvJh
	C1EbqXWXeUcF1ac1Sx4bd/psrxZbRvEzGJEnh8tEamfd1UhSSh1BkQiTWPl9a4ZRhKFck5cAaOH
	Lp3tQRIftFHc7PBidcYVpvbqJL2NTBbOkbDi0SMgd/ODN73aAxrDKGQRD684oRc8oQJF1QB2cuL
	QnNkhBE3FHN2yLFGb83f5SkT7isf3OyxQRhTOp03S+zdYTsMKfGQdJdALA+bKqsEFm8/Wzg2NVV
	yCKXUlIY7mYSPzKbu2RzeHp48PEa+I9GAtbIhi+FTu7ucI9qND9ewsTRHlUi3cNEp3pjXC/5sC7
	+fiiAqK/M7iBR
X-Received: by 2002:a05:693c:8819:10b0:35e:7bfd:4613 with SMTP id
 5a478bee46e88-35e7bfd4881mr73051eec.40.1791968443288; Wed, 14 Oct 2026
 02:00:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk> <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
 <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
In-Reply-To: <86a4957f-cb8f-4126-83a4-d525ef7b1dd6@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:00:31 +0300
X-Gm-Features: AclHuK_kokY8VK1sVn_A_0bMv0Bn9Zibgf0bMX5rADMwX9GRUM7_tx62sAWh914
Message-ID: <CAPVz0n2L_4ik6nS_eQY-tQqtdLqgHofumZUU7wJjzbLGVft8kQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Support WM8994 by machine driver
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:56:03PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:52 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Please make the entire comment a C++ one so things look more intentional.
>

May you please be more specific how the title comment should look?
Just to be sure we are on the same page here.

>
> > > > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > > > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > > > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > > > +};
>
> > > There's no Line Out or FM Radio widgets, you should get errors during
> > > probe.
>
> > These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
> > used by LG Optimus 2X P990 (star) for FM Radio.
>
> Those are reasons why someone might want to create Line Out or FM Radio
> for a system, but the fact remains that the machine driver uses those
> widgets without creating them.

Ohh, you are right. There is a missing asoc_machine fragment that adds

SND_SOC_DAPM_LINE("Line Out", NULL),
SND_SOC_DAPM_INPUT("FM Radio"),

If these are all required changes and you are ok with picking this
patch, may I reload it without delays?
