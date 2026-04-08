Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B955344DA2
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683210; cv=pass; b=UtQNM2FO5fmvuTUkBXltAQCCoPImkWnVwl2g2roOU0EPnJ6drE1wCMG8gsF8k81JmEQyMGLPywzM1DwK9Dqx0uJ9794/eDnIgt4MgY7nrSar7lS/vvgFa+s/C0XVF5xI7uwfNErjn1eyQh/BG8uQ6IYlE0bpzQxqNM0gzRzoAKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683210; c=relaxed/simple;
	bh=w6HuGbAt29hunfsVixF+Oz6nMbU+6+kA8Wt8FyAQRNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHNUT+qlYx8AnYfJU86fgfk9wBXadTjZz9bOlA5WcgXCa7L5l113yya6OF1fuLi/K3WjTMMtqpNA3JakOK9RX162qvfuLsvAKGbXuPBTqo1jt0R2MhxzeDyBvyoSVfJ2f1xI+KeElT3v7ZJasg9htRaX610hsgfWQKtRcuqmx1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8KQW8Bm; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8KQW8Bm"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38dd575bcf3so2020131fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2026 14:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775683207; cv=none;
        d=google.com; s=arc-20240605;
        b=gj4pb+xSqdFp6mIT6Bg4IBLfmfAvde5TAXghVkTanodsgSx7/y2IPo9zlp1LNMkoc3
         xwqxK4Bg8iIs5PNuqVVzM66VqdbAnMgo0K1FIoC0+dJo8knUF3O+XW4suFeQDGCJjcra
         FFDVfm+Bb8XHvIL0LEieqafrPCMnnKxx7EQcAopUKyzgrePL55E5s1j+jwBWU9r+mVxo
         YeTZMcOafbpMzofJH2ypTj/oQLdZ8uNpIrRgpwOSjoa17prBe32jVcKFWyqDHIGYWigG
         vIbyIshN18IM9XGdjRfH95gsQPLhqOaDE3IpCNAnbHzD3jLryNr4qPOklxUSm3e3XGwb
         qCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EMCMLECo02eXBhSDMm1eRN49LeGDrS1E5IJtLpRBGmI=;
        fh=XNTFctSEdg/Je4Mw9KBMpJYsrIHfJCVjMNrFUNAVOXI=;
        b=l1svLdmv6WcbgH7SgFl8hPHHuariOk+Qnoao81DBUJ7tIO5TnY4tEwf64+GPQaVeOo
         QSe76xQGsMWTyamPDSFylE7ihQMOKev1u89u7N9A0/4pTZcv4j8WhZ0XYOvgvfhMxtrX
         zZHLQpLETEGZZP3pA/m80Q4saqFrBaxLnl8e2YMn30S+5f+UxQvK0J7bBZZbO3IiBGJB
         ScL7fOSYyIih+BJBI+9dQzNzo8Fvg1IH0uh1xMlZyslsHOTEPp827SbV1GZ4tEuxlJ4n
         TPVCDP3mpYvcnU5anDnq9SQdTqqY321Vxvucq36phdqvR5yTvmuHrZG3GeKaHCg+w+P1
         3l3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775683207; x=1776288007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMCMLECo02eXBhSDMm1eRN49LeGDrS1E5IJtLpRBGmI=;
        b=F8KQW8Bmb+MA6qkyODQLh88/V+GlS6du8nqcNK0ASAtXN7yk703km0+VX0zuqqRPgq
         9pZprFTZxJdpbZayjTOwMqoqICtQ2iEs8Kzr5tloju6knt70LvX+E312hZVoDjGLfrLG
         Cy8Kjn3anaSUyDbElFtmGMlIcemT+dK6BZ2hWLQV+sm7tevlcwyHfLLvhVbeWb1MSDs6
         mxFqmRPDSkB05JPwUkYUpdaem1w4Uy4d7DIhEwLAJDN6/boGCPf94UbIMrixm5vObQfz
         SmrORHqWgQ8tGFEaVcdy2QM2WS2sILWS04pytik1YJo0NtKTgZkTd5I6SFG1/KYnSVnf
         w7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775683207; x=1776288007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EMCMLECo02eXBhSDMm1eRN49LeGDrS1E5IJtLpRBGmI=;
        b=ikqvvWCM0k7SWB187txczCXs0CLytf6+JX2FHO8lnCV7Tck75EPd1xby/v/+yaj245
         oo3L487TjqM8BhQkipPkP+1oqXVeTTuRx8LbB7omiQOVG8jk9bIr1yV7SfTqr6B+npUa
         YQJfEnVVv040pdO5LstEQgbEmH/Y0ZD5+lbUDe8Bt9EvSEObbGYoECDM/aa03FpoNiRL
         v58Q2Af4XXkUNOGIlSM9tYDME3k27qIZt9SJjhi6FQPzzrpR1h8iJBBuQ2DRcQ8gW8D6
         hlo3bq6XyQ/He9EkYr0CrHcrbYNMc2cLsd3d7ICNHBwzpZKMcAcDv9C1yw6yJEDsRCiN
         Qb+A==
X-Forwarded-Encrypted: i=1; AJvYcCWL4BHrILjsM6rROLBwWbVYmQWn0E2eUJEdHUt+Jt2DFH2qmMt+sgyx0LeENmtKrWqO2H/ejM3OVN2BhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCVUwNRCy/BNQheX1wnsjlAqCP/NJ1so/Dtuq20n8U8HouaPK
	5DZJ2FHFwxkdvWbl9zXulIK3gZsub0RmDOAW+O9BPMDkkytDA6FWApRgY5BphA4zyP+vl3vgAOj
	YKLwIfJO0zCyCXC+dst/gWi/XEym1dTg=
X-Gm-Gg: AeBDietncwcanuTFYosqt4QP/VzP+fuxKEh6Vgn0GWswOyUf3SU82mH2F/XkQ6MTqFq
	84JuKlF40kM/ZqtkCm136zEu8atpkYLCcSZD/NBAQSkLqE/FGaAyjkTTq+NV4ZA8cLyoQjt+V+x
	W9+SBFyc+f9/WJl8EgdXNFVG3B/XOBzV9XICxtCPoDF8jyjFBhV8tKPBCVdoDy7Sv0snn0oz9bm
	xguwqy/e1TV6QeuodvZqAWjL+O4ajMTdtNFPeS8qtDXzpnKvOT0hD9BRkGslSvkFyxucg0sidQr
	PH493sk+xeAxAKpZI6RstjZA9ti14ELRo8Xo/M0=
X-Received: by 2002:a05:6512:3e0e:b0:5a3:c690:b4a6 with SMTP id
 2adb3069b0e04-5a3e7a16b15mr368920e87.7.1775683207122; Wed, 08 Apr 2026
 14:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com> <20260408170818.70322-2-piyushpatle228@gmail.com>
 <f837da45-2b31-4788-a957-085d3f0570d0@nvidia.com>
In-Reply-To: <f837da45-2b31-4788-a957-085d3f0570d0@nvidia.com>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Thu, 9 Apr 2026 02:49:26 +0530
X-Gm-Features: AQROBzBUy-it-vv-kjO6ebLVhc04dn2olvWf_81zN6zTyAHrTx2NmaM7LrDNOQo
Message-ID: <CAMB+xkaQAaJSZ6nJ_LN9zyRHxFAEMoydbb-BZc3t1qfr71Sd4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Sheetal <sheetal@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 11:09=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 08/04/2026 18:08, Piyush Patle wrote:
> > The byte-map controls ("Byte Map N") already expose a value range of
> > [0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the
> > "disabled" sentinel. The driver stored this state as a byte-packed
> > u32 map[] array plus a separate byte_mask[] bitmap tracking which
> > slots were enabled, because 256 does not fit in a byte. As a result
> > get_byte_map() had to consult byte_mask[] to decide whether to
> > report the stored byte or 256, and put_byte_map() had to keep the
> > two arrays in sync on every write.
> >
> > Store each slot as a u16 holding the control value directly
> > (0..255 enabled, 256 disabled). This is the native representation
> > for what userspace already sees, so get_byte_map() becomes a direct
> > return and put_byte_map() becomes a compare-and-store. The
> > hardware-facing packed RAM word and the IN_BYTE_EN mask are now
> > derived on the fly inside tegra210_adx_write_map_ram() from the
> > slot array, which is the only place that needs to know about the
> > hardware layout.
> >
> > The byte_mask scratch buffer is allocated dynamically using
> > kcalloc() based on soc_data->byte_mask_size, removing dependency
> > on SoC-specific constants. The byte_mask field is dropped from
> > struct tegra210_adx.
>
> So this was already the case. However ...
>
>
> > -static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> > +static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> >   {
> > +     const unsigned int bits_per_mask =3D BITS_PER_TYPE(*adx->map) * B=
ITS_PER_BYTE;
> > +     unsigned int *byte_mask;
> >       int i;
> >
> > +     byte_mask =3D kcalloc(adx->soc_data->byte_mask_size, sizeof(*byte=
_mask),
> > +                         GFP_KERNEL);
> > +     if (!byte_mask)
> > +             return -ENOMEM;
> > +
>
> Now you are allocating this everytime this function is called (which
> happens on RPM resume) instead of ...

You're right, I was wrong here. I read Sheetal's v1comment as
"allocate it dynamically" and over-corrected by moving the
allocation into write_map_ram() itself.

>
> > @@ -700,16 +706,15 @@ static int tegra210_adx_platform_probe(struct pla=
tform_device *pdev)
> >
> >       regcache_cache_only(adx->regmap, true);
> >
> > -     adx->map =3D devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx-=
>map),
> > -                             GFP_KERNEL);
> > +     adx->map =3D devm_kcalloc(dev,
> > +                             soc_data->ram_depth * TEGRA_ADX_SLOTS_PER=
_WORD,
> > +                             sizeof(*adx->map), GFP_KERNEL);
> >       if (!adx->map)
> >               return -ENOMEM;
> >
> > -     adx->byte_mask =3D devm_kzalloc(dev,
> > -                                   soc_data->byte_mask_size * sizeof(*=
adx->byte_mask),
> > -                                   GFP_KERNEL);
> > -     if (!adx->byte_mask)
> > -             return -ENOMEM;
>
> ... here in the probe function, which makes more sense. IOW I am not
> sure why you have changed this.
>
>
The intent was only to drop the dependency on
the SoC-specific TEGRA264_*_BYTE_MASK_COUNT
constant; the lifetime should still be probe-scoped

For v3 I'll keep byte_mask as a member of struct tegra210_adx and
allocate it once in probe() with:

  adx->byte_mask =3D devm_kcalloc(dev, soc_data->byte_mask_size,
                               sizeof(*adx->byte_mask),
                               GFP_KERNEL);

That keeps Sheetal's "no chip-specific constant" requirement (size
is still soc_data->byte_mask_size) while avoiding the per-RPM-resume
allocation.
I think that would be better, Right?

Same change in tegra210_amx.c.
