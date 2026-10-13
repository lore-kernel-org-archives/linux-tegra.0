Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8FA538D96
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917777; cv=pass; b=tbsJOUWS2RbKg8bIk09G4sH5hkx3V4cuw+dfteh5YCqe723r8VTPubYOa0uNfUObHtAxxP+FaStDXSlQb2bs8PJQw9kHp3uDW1xQynxULP9vEb2Y6tb1stS9NWC+Ejpkt+tbZSRhYzCsLvT1VNo1HflgC14fbBxZZ4ObojwzdQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917777; c=relaxed/simple;
	bh=Npz6MJpL4OKnNkDARrkMIsl8yNRoSsqdy7nWQsZF4+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5h3/faFE56PVQcLQKYqFrOnUtOfzczFFUAqD/UeUaCzAIy/KuDaZz2gH3dk4448GRcEiRUmPTUaZwj19TgnhpoDok2/nZHUmmJrLrAQjxKs+eBxIdSC+nZfgNFbQblEFAhCRJApJhrO01z//sFkiQ3cKC8YQqHbhcWBy1pSl2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3lQaqLb; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3lQaqLb"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so273724eec.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 11:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917776; cv=none;
        d=google.com; s=arc-20260327;
        b=lCYiDs2B+3+Lx6H4WNL8uBFfuWQux2GkNu4+RXIPf8et5DpckWhXjau+jvGjqP++BS
         vrOVo3jS+hGQhCSE8UC6IdAuRDu/+4BIGem9GtG2I667V/nvj6JJNRwROWovxCFjK6Zr
         aV/qCGweS1UQsvdpsDWplRFNbC231dA4e8HolT1SNGk6gL2ruhq4ecniypCZh0ZLSee2
         /MzAGAq93rw19WPLp7PKgm9RgoxCcER/ADZHD71tfxx8VUOkkTqkT9oiUX6opgKWbn1V
         D4nn/9qCmUR5EGoqgElwm1+voHVgmKKJf6sL4JfH7OVdRFEOeBnH6r67d5GQdGU3De8j
         IRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        fh=z/q9SQJ7TzaE9ISZhReLuQUIzHUhzrv9Q0q3f+dy4JY=;
        b=FPiDzMx4lJhP745Y8yCZ5YYwkNLjNAqNLPmXhNoGLbTflpuh2mr+Ou9WE1QKZ/5XxC
         CU6hqMEKKRMVMYyoNfwwFXdpkC+ecT0hMUUK5hT4M0z3dP6roNQZDnFSpr0yiSoHtAuV
         fbue5PMFGoYJW5j6J1E1aXirsDSiagjl2SsheUwB/CLLOmI+ccljzJRG4V3JOuKMyaHv
         XnBqCk/U93AozgiRz1HBqvD3jbigOT3sQxRvKDeYnLTpsrveMjiO50X8G3p74UX+cGf6
         z1VfTEgDBGqoQsoO4x9KmAe2fybEA6pDfxz7Uv8UleEnW7Nj9dU3i7FWIpjAdqNcwrib
         hVnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917776; x=1792522576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=e3lQaqLb6B5aGi4qjkf7UDw3znnRWVPNZ/Xi+a/e49uRYul0g8nN3D+HFHfop7vbjL
         SUpnXHSx/ai8Clo9ZQZyGwK/BduRM55DGLUUFwuUfa7uKEmFbozcNJktf4WZYxBj9Wdp
         Sru/3KWrKuUurJ2O4T8SfucLWJvHrmhCf2J9BxbTGuR+e8KKU+5CjHCo/KoqWMLVosWz
         0ufpIlt4gYUzVkR7df1yx97L7SfuujTjvqhLZsw6akRiUJfRjO1e7Gkx+u2C1Yra2mvv
         FskhKDm1Oot32W6RsNRW0IgWfoKtIZT9g204eWHvYRquz7zcQD58g8vMh9V2Frh5QBTs
         5u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917776; x=1792522576;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAjbH1ILtBe08WoVw3eugZuZwwhY23ii0JyU7xvzgIk=;
        b=qJ/AVig6f6JYH/AaeBJfHa01xuAS7NwAfnxjAuENnAKs6bEZpIc/u2OkjRSq5gXlB3
         ujyildMsB+37kVuT6sLR9MTewxyF4DpIh34fBbyedJxl+v7PtZOnEsmoa5a9WfTNC6dw
         x2zHLC+sEYNikLKfz9HZLiBk1EMnVtnPVI6FJGvZ8ScMx9ROayhxmY0WXLFVaBKOfj07
         sRwxCVfCKIEtROosJ7ybxl0XO2F/RdeMOTVXolCv44/1gcU9AhvSn5gJdqsIlLm2A34K
         WWn1CvIJQbPKpXpUjnn99Hd7T+sWFMF7rajEQla8AynMcezfMJ0lJdvJ6bRpQzH6YtCn
         EW4g==
X-Forwarded-Encrypted: i=1; AKwUvBwHlLIdj9vIcDPWVztuNGWMhYObOnwLwjiNbVMJIAyUShwscbfYmj6NyxuVPjACtbdARid8K0GXboBchA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGltcEpibSEUqIeoK6MjRzwczWbtSlmu57F+1KN+5MqdUr2f4U
	4Ts2u+bh/l9ocSKrHntgLd+kqLWKhY8OSX0thAtjWfKICImjDzBNyoqGP5Y7IE7th2zlAB2fP6W
	HG4t2XE4AysHgBFzM97b/2LHKTB1lKXg=
X-Gm-Gg: AYBFou08L0sOhdwpF9JHH/GhdwYgUXB0g2/DrH1sorSm3t3ToXEabJoMwZFf9bhtQet
	iNnhiwRLBikcuQ0Fw/87UtyVwm51XQELdXfTMpgFY5/uLO9s+tJuSGwhtZN+s13EQ+q4Z2xXWp3
	vJYLFcTX8NFgBu5TO21zYJHjQYbl5sPHaCr9EIQp7bUMlWh4RCwYbXIyRg2FFrwnJsfEfrB25Ph
	hGQI7TfFLHsRz/khxFIFlqpGErJbv9n2z0pX91nmOw0l2nt7gTpXwTMZ0if71cHyeFTo8HoGfGi
	UIuoULKx278E6xqEmKz+4IRu30pgJYy+QBROWjlSFdmNlfp1TCfxarEgk4bAio0H0DLN/uyN7cJ
	2dCBzZ0USGEfz
X-Received: by 2002:a05:7301:4714:b0:359:d728:ea39 with SMTP id
 5a478bee46e88-359d728ec5amr11295040eec.25.1791917775546; Tue, 13 Oct 2026
 11:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013183226.513658-1-clamor95@gmail.com> <20261013183226.513658-3-clamor95@gmail.com>
 <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
In-Reply-To: <10dca96b-78b2-4f46-bf4f-de67d25c916e@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:03 +0300
X-Gm-Features: AclHuK_OtQxv-lLSRNaI0a5fKQ3a0f0GrZurL_z_b4XMUDM8898Nfx1Ak8Ju-Do
Message-ID: <CAPVz0n0X58xfwhQo=V_5UQBc_cLfG8CqFPuoG4FqN9MM8MFisw@mail.gmail.com>
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

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
2 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:32:26PM +0300, Svyatoslav Ryhel wrote:
> > Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
> > machine driver. The WM8994 codec is found on devices like LG Optimus 2X
> > (P990/star) and Samsung Captivate Glide (SGH-i927).
>
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * tegra_wm8994.c - Tegra machine ASoC driver for boards using WM8994 =
codec.
>
> Please make the entire comment a C++ one so things look more
> intentional.
>
> > +static const struct snd_kcontrol_new tegra_wm8994_controls[] =3D {
> > +     SOC_DAPM_PIN_SWITCH("Int Spk"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
> > +     SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
> > +     SOC_DAPM_PIN_SWITCH("Mic Jack"),
> > +     SOC_DAPM_PIN_SWITCH("Line Out"),
> > +     SOC_DAPM_PIN_SWITCH("FM Radio"),
> > +};
>
> There's no Line Out or FM Radio widgets, you should get errors during
> probe.

These codec targets. LINEOUT(1P/1N/2P/2N) to Line Out and IN1LP/RP are
used by LG Optimus 2X P990 (star) for FM Radio.
