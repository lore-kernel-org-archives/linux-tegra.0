Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B126FA4C;
	Fri,  9 May 2025 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773921; cv=none; b=eZWBU9tEJDgtJLGA9tKC9MVwWwWklArwvr3GR/M14xADHmgBoeQp2jZ4vFXSt02ypSf7hnH3+azjMroISutb5jXTK757cprDOrGKEQXggrgf9BRFvYyExGt8XzwYkASfoLMtV0iCEYZpslrvkYTfO82PXUKBQ0oFehDz1fW3uYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773921; c=relaxed/simple;
	bh=5xXFVsrgQHhLFsrXs0QGB/94Blht7KD5MUtoxXtoe4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbF/Uyay5itQDuTgxgqgvF7TSmeVOSohyDkvfn5O0IzAhj8sCxRV9MVOSWVcOG3f3HzpcXZANgxqNEslaV5mIGW4eXHjGKRjJp41xivuPq/KlV0wbmYvUWXfG+RqBX3J9ewZ71bM/PcrdotT86SxZBG+juWAqkiumaduORYKU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyyKIVwM; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyyKIVwM"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-31062172698so18507441fa.0;
        Thu, 08 May 2025 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773918; x=1747378718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y3dF2KjkF8I69XwSeXBIQJdbc3JZnPELejErYLXvDU=;
        b=jyyKIVwMS13ND2wMrulEPQo76g8KmbLWq3Rp0x7vNyT/JUqytanJhzismSaVqX8mGW
         DNPFjL3+T6ht69bgRvbnDzzaU87rPN4qRJLfp45SaApZ3TJohiUv8WIBl7M9cNVmE0vl
         ywff3U7AafJ5G8T5ADfPflpTOOYDo8wO46GGYQRiHu8ulxfd0EJ+/H4Nf+4tYOxT1I0f
         0Lv0YYpZJ3J3whhg8FUIIZLU0rayYR7eSZW9sqmN84i4E9HnXHwiZ7X0+s1ELeJ35bVd
         EmmMk+ZVjQNAcHhxqncuJ0fEL1ClOfvLhb5HOGvlZffPSTfd0Gjjey4+Pq8nlannIAsA
         Z5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773918; x=1747378718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y3dF2KjkF8I69XwSeXBIQJdbc3JZnPELejErYLXvDU=;
        b=Fj16RkvQ9EBV7XbqNRqBUUnSInHrfsVVvwsKDWsVkyXc86GmdtZr6jnAM+JhSiii/p
         aCFLF84h9jTu1CMuGgssilQjYyOZXG8IDyQso/CgdNBDYl8b0bZ9mVB8agnTP3lCS90S
         AbGaASR2aA7Ex29KNrfkqpeQn6rgt0mK6HqO9fD73jo1lhUX+CdjGvMf0x+tR0U8FdKq
         o0TkZZ8mq03loIfsk6AlGplv9Y/iEfGW3H+2uxV42L9pfPDBHxCGS0XO17UIS/uehLSu
         O5FqH8RsB6Gs7UI2X+eeHZbC70DYwL89xdssLN69M8326M935TQ40I1chSn25SKqMUyU
         mFlg==
X-Forwarded-Encrypted: i=1; AJvYcCUDRdDz3+OFnP4tBr6HWKVZzaK1b/xe7UZOg13erv6fC3E6dphfaoE7ipQOOzOalEopdqSOh4Abx9RRdiM=@vger.kernel.org, AJvYcCX7Qnet+RrEFrDh919DfbCGOa93//5e+yHMmYVAr8fECeVs29UQsCcYx6MLsqGaR+J5xuYoqAfKIYYu9NE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE5dWVuIznDPzuFcM4zEFM3fZk3K84V4wQcmjEiHfe30V5uZuz
	hYTdwMAxs9mrut1XJ9fnFbjPs9Mem32DlUWl4USMrr3061RpkKFULLX5LJqYd5DxEP8TXNehTJw
	mAT03UDxSubZj2YEmM/vvlhIgj5x/PmrFjsdIgS4f
X-Gm-Gg: ASbGncu6ipgtS/4RbivjQTQqdcWCnc6SlOBKAgNuvWZpgOEgBajikcacxNdm4eZWIbb
	EDg2Qp9M4nNQqHBaAmb6c4V+cV6uhBLCKuw4XOMoEHcASTecY7hF1AzbdafaDT+rNOVm7Fq7w7g
	Zqr1IQm3ZcniXIq1nYxrbJ
X-Google-Smtp-Source: AGHT+IGvyzoLxHoXAt44/D90tn8W6yFmZox6nDhKf3bwsjjCnBSSSfJ5w3zyl8GGJNwhxwXXdpYDTTKYakIOs7Jc1O8=
X-Received: by 2002:a2e:b8c5:0:b0:30b:9813:b002 with SMTP id
 38308e7fff4ca-326c4624f9dmr8912061fa.30.1746773917805; Thu, 08 May 2025
 23:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402144115.45564-1-bsdhenrymartin@gmail.com> <s65c46x3a3jltt3nfnuop6oehsrduw6g6bdacbcugrbsy3fsdi@65xyv23uxuqd>
In-Reply-To: <s65c46x3a3jltt3nfnuop6oehsrduw6g6bdacbcugrbsy3fsdi@65xyv23uxuqd>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Fri, 9 May 2025 14:58:27 +0800
X-Gm-Features: AX0GCFvHfUAi083rlSFY4jP3uL9JsynRevhwQSMsqcx-YCpb7nSnxjFwSKzaWbo
Message-ID: <CAEnQdOo5GD6TKO4rQG9q1KPbmFhoPrfMmsA1g8dySr=VsaOSJg@mail.gmail.com>
Subject: Re: [PATCH v1] mailbox: tegra-hsp: Fix null-ptr-deref in tegra_hsp_doorbell_create()
To: Thierry Reding <thierry.reding@gmail.com>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thierry Reding <thierry.reding@gmail.com> =E4=BA=8E2025=E5=B9=B45=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=BA=94 05:54=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Apr 02, 2025 at 10:41:15PM +0800, Henry Martin wrote:
> > devm_kstrdup_const() returns NULL when memory allocation fails.
> > Currently, tegra_hsp_doorbell_create() does not check for this case,
> > which results in a NULL pointer dereference.
> >
> > Fixes: a54d03ed01b4 ("mailbox: tegra-hsp: use devm_kstrdup_const()")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >  drivers/mailbox/tegra-hsp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> > index ed9a0bb2bcd8..147406149fec 100644
> > --- a/drivers/mailbox/tegra-hsp.c
> > +++ b/drivers/mailbox/tegra-hsp.c
> > @@ -293,6 +293,8 @@ tegra_hsp_doorbell_create(struct tegra_hsp *hsp, co=
nst char *name,
> >       db->channel.hsp =3D hsp;
> >
> >       db->name =3D devm_kstrdup_const(hsp->dev, name, GFP_KERNEL);
> > +     if (!db->name)
> > +             return ERR_PTR(-ENOMEM);
>
> I don't think this is needed. First and foremost, db->name ends up not
> being used. It was meant to be used by debug code that never ended up
> being written, so at this point it's mostly here as a way to document
> what the doorbell mapping is (though even that's somewhat redundant
> since we already have macros that match the strings).
>
> Secondly, these strings always come from tegra186_hsp_db_map, which is
> rodata and so the allocation path should never be taken, and hence the
> allocation can never fail.
>
> So instead of trying to fix a non-existent problem we have two other
> options: one is to remove all traces of db->name (as well as the string
> in the mapping table), or we turn this into an assignment since we know
> that it's always rodata, so there's no need to copy it.
>
Agreed. Since the strings are always from rodata, changing to direct
assignment makes more sense.

Regards,
Henry
> Alternatively we could just leave this as-is. But then it's just a
> matter of time before someone else comes around to "fix" the same thing.
>
> Thierry
