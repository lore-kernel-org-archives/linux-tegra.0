Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05323ABAA
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 22:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774392698; cv=pass; b=cco6kolck3CZxpY7o6K8/KzV3dDkXqZIGAHtk3Ht8DhmOg2ZiKQjO8zWgRYHLhxAykaQoMDmca5zmIhzJD0RIhhvtcwiWdt9nrZr2LDAW8UFyR0n3vs8BO8bk/6WoYRuXeNJg1jUhM9gG8tWiyeu0O1srMJjnOvQ0sGc7YL38N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774392698; c=relaxed/simple;
	bh=+qXP9sVKYUOKuJIDu7AMgVkUE6R3DEV9njuXFICjCso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LiwgYO2uuP0l0rrlD7JdyWnyqd7/OBLx++xoHfRsIq9hbVFxJcWULp32Ucp3aBqmWZH7mmcL8qSncS+rfAjHsBser44TEXgZGfR2znCMpa7I8QhBGilIWxa1yLniIrEpuWcEDq/V6TY3fXDcyLrI55wJXxaCn8udu+Ucakgu/Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwFHLGZC; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwFHLGZC"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b979d16dd0cso875628866b.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 15:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774392695; cv=none;
        d=google.com; s=arc-20240605;
        b=TOC+CDNxB6xRAYWBUKqt64FMJlrAEHsH4/Wsl6FVcByEDKtUSWVebm2zjghvf1lWIR
         2Www7zw7cCpBnl4jea5zsSJr4/4IcTjMyMr+f0V1fUn/G4wq+ZzQqe6UwL6PdaR95f2t
         7aEea3blzfJ/94AKAS0O60fRfu2YkhXrtrHtFw6oopDMluJPQ+ezxjvqLBKoDzYqDtB2
         71azEjTjT+TXhlPaEhzSI/w3FjRi7MKJ9P4stJaKRZihv53VJ4WIXohlYC6LLQ9dw2dD
         3FP5Ac9qGA8NO2p8U1qYFPGpbMnUwoAzYG8+ff8FqxOhMBdW/BggjqDHZ2ROPQBT/1ms
         a8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WctkEVUbtVnkK6Q8WGc9tEDZcZ0w4yuEbEhi4SlKtQ8=;
        fh=bqbCqXOjbznW543dNw6xPwfojb9MXY2vqfJFyFLUhPM=;
        b=Cm6/c5nr0r330OKyavXQn4QaJkOujkGccDS1UKSy9YjPTmm/KyQSL+7IjGW2hckwOS
         qWHP48Mj85rRqMLpVY/MarSZvEmHiqJruiTr+Ugn/G7G6wwuB2yy3+i7QuyYtZGr8J0v
         yLCWIgccPN+qAKVD3JOjvcYPhJXC1VblHgPslAvGMTBOsqFVWMNNwad3u/fKFK+Oe0gf
         dhGCuh+/qcPUOlXUkWoEcp2Yi3bp8DL+7L+ZdAtAwfvRHcWUEZrtVSscnnfRYCLNuVR1
         whfbxpcc/kSwsXEm/PJrfQvKEJD6bKzME/qy7d4bn5tR1ciJZxVzx5lTPEqFO2CdnHI8
         RiaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774392695; x=1774997495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WctkEVUbtVnkK6Q8WGc9tEDZcZ0w4yuEbEhi4SlKtQ8=;
        b=CwFHLGZCkJ1e03UPuiX5krsGaPLFQL7sxz4MEAMJgj0iehiDXizYP8ozliqrsuNn/T
         5guAt015LPCwQ9a2NVs3YloEX4mMEYor/XhcTXvOWZYJOPaDeDUydu71sri/uvlbv/cO
         Iq22vNQ/0ycpJwkmZdyMMb6Ss18k4vv41QXEDTcKxTlsSd+RRIW63vxAYbgcJfkKIR1Q
         Dzx3sa97fTCcRgEZhZD4/Y5jWJ0UcG3tWdqFz9NPPwGirVVvbf8im4A1EULwutNcRpdP
         mcEDSxHeq0Qnh+bxD79k0VIfqjceVhNHxCVXEr8DTkSIV8SrPa4kQX82UaQhhmQBudCV
         oMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774392695; x=1774997495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WctkEVUbtVnkK6Q8WGc9tEDZcZ0w4yuEbEhi4SlKtQ8=;
        b=PgbranHjRAjA3bqOQij9p1+YsKQR8MPkBtdGBiR5ou75SoZS93YK4yzuOn/xc0uubp
         Rh4F3vbrYriuyPmuS6KX6DmBGI1YZ0CLMe44DHZIamq2PCrJoMApWZEhyLxVmqHSpJIq
         t5gU+34uuivOtBeevyf+r26ZjYTd/eo0fwQ2Lo8d6NbvWCB1KxTNc9WTAyDF/8Hx9Z72
         F6k8P27w36Em26PqRuym8EDOS+Ez+gAl3e0SPb2pdLV/A9rWH43uo1hUdmwMVYkJuJri
         Xvat0Pc5NUnEPCMAssRdUOxpxtlVufiPom2WrYh5NNFcne3raZmr8TVBi1qtd2emSz1v
         d5/w==
X-Forwarded-Encrypted: i=1; AJvYcCXUOUBmYA9i+OCsp6hw5kmiO1tUsIiJqAXR90vGFQ+ER1qOnVLPeuiFOx8HgHiPd2kG3+ozx3e1bPGg4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Q3A1ZKq+kZ3gBFj9nCVA75uqExP5mfoutCKW4ylN+GM8fmZ0
	zDITX85nOUlPhAWde4TScPdBQvNe+Pk2+KHo+yHqBKzal78PwXB6B7RoQzOFw84L65oSApalf/j
	NqNpd4lVg2+AZp548qZKjE87N7SLLlzo=
X-Gm-Gg: ATEYQzzlJZRDZwavB61N55Ip4/WhRx3+JpZlS84MT9S/gk/HWXtcXITzuWHXM8zoAMA
	PaSxGZGjhzcGlucxkW2jSrRqjV6EVaRvKPZSV96QYaZCpyAXGJrsX3x6m1B/7cl2wDlOMGeulu8
	Y6jekFDFCi1nD/CH3vSAq4tJe7dYWdWnLjKanUu4xFaDJ4RffAco/HlQEePPKr2cME5XXz90nkE
	4/56M8NEzpa+ofr1oAM8s4ZwuFgmy/M+p781P/rf4Lrim6gLfR90gSNzvwUpg1PlhuTynp6dKu+
	WoTWX6qhff5UTHoqYOmhYyh5bGcO0mF0+uFcWd50Or+djx4gc2UuWnCqAnK2if+BTzAnVkj1h9a
	rDsjdFg==
X-Received: by 2002:a17:907:1b1a:b0:b94:858:5807 with SMTP id
 a640c23a62f3a-b9a3f1bfacdmr71915366b.25.1774392694712; Tue, 24 Mar 2026
 15:51:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324211629.26924-1-rosenp@gmail.com> <a27f4314-f7dc-445d-ae24-909ac6b45b5e@kernel.org>
In-Reply-To: <a27f4314-f7dc-445d-ae24-909ac6b45b5e@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 24 Mar 2026 15:51:22 -0700
X-Gm-Features: AQROBzDG9HLcy6ZZFtAcMMsz4Ap-uzTwEmXmIP_QB0BxHWCJBnLwKSo3zzcgR9s
Message-ID: <CAKxU2N8XTYbWBnuYe336PfXvKEYhmz3VN8k8Z3=E4p9-rt5YwQ@mail.gmail.com>
Subject: Re: [PATCH] ata: ahci_tegra: remove kcalloc
To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-ide@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 3:10=E2=80=AFPM Damien Le Moal <dlemoal@kernel.org>=
 wrote:
>
> On 2026/03/24 14:16, Rosen Penev wrote:
> > Combine allocations into one by using a flexible array member.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/ata/ahci_tegra.c | 15 ++++++---------
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> > index 44584eed6374..5972fe04ff3f 100644
> > --- a/drivers/ata/ahci_tegra.c
> > +++ b/drivers/ata/ahci_tegra.c
> > @@ -175,8 +175,9 @@ struct tegra_ahci_priv {
> >       struct reset_control       *sata_cold_rst;
> >       /* Needs special handling, cannot use ahci_platform */
> >       struct clk                 *sata_clk;
> > -     struct regulator_bulk_data *supplies;
> >       const struct tegra_ahci_soc *soc;
> > +
> > +     struct regulator_bulk_data supplies[];
>
> I think this needs a __counted_by() annotation, but not sure if that is p=
ossible
> given that soc->num_supplies is not in this structure. Might need a copy =
of it.
Is it really worth it to make a copy?
>
> >  };
> >
> >  static void tegra_ahci_handle_quirks(struct ahci_host_priv *hpriv)
> > @@ -512,6 +513,7 @@ static const struct scsi_host_template ahci_platfor=
m_sht =3D {
> >
> >  static int tegra_ahci_probe(struct platform_device *pdev)
> >  {
> > +     const struct tegra_ahci_soc *soc;
> >       struct ahci_host_priv *hpriv;
> >       struct tegra_ahci_priv *tegra;
> >       struct resource *res;
> > @@ -521,14 +523,15 @@ static int tegra_ahci_probe(struct platform_devic=
e *pdev)
> >       if (IS_ERR(hpriv))
> >               return PTR_ERR(hpriv);
> >
> > -     tegra =3D devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
> > +     soc =3D of_device_get_match_data(&pdev->dev);
> > +     tegra =3D devm_kzalloc(&pdev->dev, struct_size(tegra, supplies, s=
oc->num_supplies), GFP_KERNEL);
> >       if (!tegra)
> >               return -ENOMEM;
> >
> >       hpriv->plat_data =3D tegra;
> >
> >       tegra->pdev =3D pdev;
> > -     tegra->soc =3D of_device_get_match_data(&pdev->dev);
> > +     tegra->soc =3D soc;
> >
> >       tegra->sata_regs =3D devm_platform_ioremap_resource(pdev, 1);
> >       if (IS_ERR(tegra->sata_regs))
> > @@ -571,12 +574,6 @@ static int tegra_ahci_probe(struct platform_device=
 *pdev)
> >               return PTR_ERR(tegra->sata_clk);
> >       }
> >
> > -     tegra->supplies =3D devm_kcalloc(&pdev->dev,
> > -                                    tegra->soc->num_supplies,
> > -                                    sizeof(*tegra->supplies), GFP_KERN=
EL);
> > -     if (!tegra->supplies)
> > -             return -ENOMEM;
> > -
> >       regulator_bulk_set_supply_names(tegra->supplies,
> >                                       tegra->soc->supply_names,
> >                                       tegra->soc->num_supplies);
>
>
> --
> Damien Le Moal
> Western Digital Research
