Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792430967;
	b=dUPggG8e+If1x0MKfgnkcC4qTTDZHfImOLO4OotWftus4PRuSJi34I7H5MCMkDz6FU87
	 CZ0CrxomwwoQDgVlqfbiVbplSi9lR4Nx5XFccgStGKkZTpyDo3ZVvSdFvnw5y5LSHurh4
	 kLtccz42FNzlYrxNWMG9xDqFw8bnQpjUYiggFyR8u5hvtTdAwHveUZIB6rwK203MFzFHL
	 4IIJbwAU9Ezy6Fc7BEEEsBfPYYzSIyOKGpSjx/2Jd2njlRHjrfcUr49xuyrbPBjdArhLi
	 pHKsKvD5Upo1sQcwsCb19YFss+lCkWuPM/sQce8/9X3TVlv1uLCoTj4DBqD0PIdgX6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
	b=uJ4TDjGu3Nks12eM12ZuVmEgvgXnHU0ufYsC6Rw2XVh/ZZGqnJf7IuN84EzE9lVxQ9hb
	 vfAdIzYwupX3HfV1KchNz5rLSX5+InYYgEUAR6y3FslwnP4uhyEg2bx35B98dqVxFP4rP
	 K7AYximZqBS9sVdSbI7xoU63baj+VBVrXZR+3VV3Ey6nQZS5ZfHjMGL71hJQyoGBX/ciX
	 zkCcaCE0ZORYbnJiBbmluCXHaLneXo6L0133QNrPpF+fmweSS6rdugIXLQntDn7XxpOu8
	 AKmHJcrX6CJIY8dDKY49mJICXEgVOFVciYs2qwo8M3XCn/ph/yikcCnnoY4hAxtw5yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fX+Gl0W7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1371D606A319
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 17:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1371D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fX+Gl0W7
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so31241101fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792430965; cv=none;
        d=google.com; s=arc-20260327;
        b=hHT4K7Umhki8WILgWGslelKuIQv8j0RU7gTpabxkF4E/t77Omsm4BmPwoOYpHFI74y
         DPV15W9NIMryQcJ5uL64eMHMOkMFpUtdXHvCChlwkhkjuh+oqoAukUhBeWxe2iTSQbvs
         97AiptozbQ3tDK0rTUa81hFu9NA9B8TNqaBNcMFHiaipwmM8pbiFyfX0G6WaIg6lxpSm
         lhhB12uQLbBpg6f2Qsu8GYQsd324dQE8nwl6xDr5coFor9cV5pgJjM2L+aNEHyh3oZRp
         Flfh4s4FGEtGI3FmflhCRwykdA+p5aT+ob4WFYekFN+8WeaFUSOl+t88mLLvKqr7gt3L
         Z15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        fh=8mq4GmwSSSkISJsHNUFvEskrQALHRAfVZGi+hXJwka0=;
        b=EwlGYSvp1YCIPhZYKEIhFR6kCCfoB0qLfTPDzcJyTE4i5gkOYoSOpDuTl9czpEmc3r
         KMF1Nz4lAHMfFiFGSuIHxeeN13c3t+uaagoyPQ1YPt6SCYUptrtt/u2fTJoRHlkavcpX
         zcl09XUcvghAPhsULfYY1sKGxw8ifQwAGp2qIVM1DffiYrBvZ6qPxAA0EHw3ACFwVsYt
         aY0lLuePoCF6qR54bBQg3KMcXxlAGvOVZ5qwl5yrM1M1dgEH/MkWwfKTcTJamy+9nAkG
         kaFwjjmFRsUJMTHUIL15NAHJJcpltNR6sn4O18fIfNwbMnM3pfujZyy/261jZJbI9Fd9
         TjAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792430965; x=1793035765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        b=fX+Gl0W76Ub+1zWUQnlSEBDXLvC6MZJZ62Jua1HcNIT7N2rVI1gkW+dx7RVVwUl/DZ
         MiyB5pJdAo+SZrSVIuaoBuFgJUwBh0eJ9GzFYPimn5DocFuxfzywVhiw9Gh2Iqk22WzO
         mV7hXaFEfodmTSnyb7RoQkYED71RVo3Ms1slJJLXNMvPaIbl+2+ReKDfaOZalneFwJHn
         egJkEcZ5IqK6hDzccfESLFP7eZYAYk6ih5UE55A1s63jWfpAlcIurfw4sEZsARvKKkvN
         dN9rR0Waa2NHfwYYQmk1dT5Sc4AcnGEfN/tzbz4vI0o7mqEN1bZPk2shPZeJnpty19k5
         jNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792430965; x=1793035765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np41dxbwmZn+Bkqvil7UYopNErqC82u/VqNlpFNRLtk=;
        b=gKJwaAv9zCO4eLF7QUHTNbKMoFDJOOxbxVGDTnR3/l8au5nQS7jh+2s4Qi+S4vAd2U
         XqToB18tk8wvycCpTjpC81kCy/QKcCpXqEA4v+FdgLk51HYI4CAeJpdbYrD1uDweYnRr
         SQHSyBfJqiel5bor9CdlZAa8dNUWMQo+30hrm3GE32et2DfQtWG+KVwKpnJJGfVwcidQ
         pG+I/9hdcAZ1OmMmj4jRTDN53EYADcoz0MsnrUZub6/szHFr1zYSVC7Snq2vS3xMNlCc
         NBs9O35ZD7Mw2lgHBfpVkPtVKwPgYLvlU42AqFTI8jdYP+aRwOjOICZPhyTZqletSy/Y
         0JNw==
X-Forwarded-Encrypted: i=1; AKwUvBxdZxpiqxssKpAm9nxyT0CPsedksuDT2m/x6Xr+7OiOszSCWgIW3jorLejvLP6YAzIQby9TsCB0Gbc15Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMtth2CBPxXee7oM26bfjLVphbxplAgNU5PqMRwzg6SqhvyUWO
	hybVnMZgIzKhn4AIXKgx9VJ6AgmK2DHaUcEEK25GCMUXqz+w82awbYigvMbT0piI/s7DutMVHDl
	mPONIkQrBpvCohzw6uKrT32ZWzmiDnZA=
X-Gm-Gg: AYBFou2P1nkaua5BcQiob0FyQP5hIBrxzp1SyaezxiYWXuY7nc94rYyYCC1cAnu2r+2
	jNw+foI09OOabVAXrW9H4Y6MnAM6+OGK1Wp1ZK4TF6FEDTY93uCorCZDy+u/84fNRDo6Irrm6iE
	8xsezx1wLUC5gTCW2ky6pB/l9yvFKzVu07CRzai8do/1Ny7MhTv8mLVw9+VxEi4hmQXwAAilWOc
	MYY7rz1D0khgGVbn+O235BbGUa6m0R2Ng0S2W7d0dz6fL/HvIHsLz10uV6yV1nXvRYeO8IpJ6Q1
	XKYbu6brohkWxpW2VsCl4DBLItk12pJf++ouK+fIN3dcPnMCaYMmD/lUQsvLOkbyXF8hCubZxD6
	0Jo1qFW8sFjkwP9mzpltWMVUypUvb+ESe90l6Qu35yFY=
X-Received: by 2002:a2e:bea4:0:b0:3ab:1729:e08c with SMTP id
 38308e7fff4ca-3ab292917e9mr16875971fa.13.1792430964535; Mon, 19 Oct 2026
 10:29:24 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018-tegra-hda-hbr-v1-1-b8bb1f1d8d15@gmail.com> <87ecdmaxh1.wl-tiwai@suse.de>
In-Reply-To: <87ecdmaxh1.wl-tiwai@suse.de>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 19 Oct 2026 12:29:12 -0500
X-Gm-Features: AclHuK9pYgXL6PjRd-4EMhy8uGYeAfm8xiH3e07GVU1bNqM2yd8kKJKrKzkZa0A
Message-ID: <CALHNRZ_oXkdOO=Q8khQTeAfH_1XQjLK4Vp1WQZ-J3oHoihAFQg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi: Enable HBR capability
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 3:47=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 19 Oct 2026 04:16:31 +0200,
> Aaron Kling via B4 Relay wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Tegra HDA does not set the HBR capability bit, however every SoC since
> > Tegra114 does support HBR. Override the hbr setup function for these
> > SoCs to unconditionally enable the feature. Since Tegra30 does not
> > support HBR, this function will report invalid on that SoC.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > Before this, any attempt to open an hbr stream resulted in a rejection
> > on Tegra hardware. Looking at the downstream support, that just bypasse=
d
> > the capbility check for all supported Tegra hardware in the common code=
.
> > This replicates that in a driver specific hook.
> >
> > This has been tested on a SHIELD TV 2019 Pro trying to bitstream an
> > Atmos demo video. It attempts to play, but mostly just underruns the
> > entire time, with a few spurts of correct noise. My expectation is that
> > issue is userspace, since that is a WIP android audio hal. But even if
> > there are more kernel problems, this should be correct as a standalone
> > change.
> > ---
> >  sound/hda/codecs/hdmi/tegrahdmi.c | 37 +++++++++++++++++++++++++++++++=
++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/=
tegrahdmi.c
> > index ebb6410a48313..c4d8d8a570542 100644
> > --- a/sound/hda/codecs/hdmi/tegrahdmi.c
> > +++ b/sound/hda/codecs/hdmi/tegrahdmi.c
> > @@ -227,6 +227,41 @@ static int nvhdmi_chmap_validate(struct hdac_chmap=
 *chmap,
> >       return 0;
> >  }
> >
> > +static int tegrahdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t =
pin_nid,
> > +                                int dev_id, bool hbr)
> > +{
> > +     int pinctl, new_pinctl;
> > +
> > +     // Tegra 3 does not support HBR
> > +     if (codec->core.vendor_id =3D=3D 0x10de0020)
> > +             return -EINVAL;
>
> I guess this will break the HDMI on old Tegra.
>
> Better to enable pin_hbr_setup conditionally for newer chips below, so
> that the older chip continues to work without HBR.

Mmm. I was trying to replicate what the default version of this
function does when hbr isn't supported, but it does look like I missed
part of it. Blocking the override entirely is simpler, will do in a
new revision.

Aaron

>
> > +     spec->ops.pin_hbr_setup =3D tegrahdmi_pin_hbr_setup;
>
>
> thanks,
>
> Takashi
