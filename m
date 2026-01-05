Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDF62DEA78
	for <linux-tegra@vger.kernel.org>; Mon,  5 Jan 2026 15:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767627850; cv=none; b=sJU8T2mRgpHdINCR9hNJNIZUOlcuF7K3TmK0cRXxyyc8ABueRy6ocFZmZ/bbuPmJtiKR9iYVUJPAhac2fv6HYnDycDnUCYXPBNewQR6O2fZpT0Tv8YSdEm8hM/1MJNLxpm7kHz8vtM4lhmFbtW/i84uXAXGDt99EmbkAn55DWg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767627850; c=relaxed/simple;
	bh=KiNxep5hkYX8mBtTbqMNksK7S57ebqc/+kkLTcHNE4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyLcRSb0q5kleDSwDj5LfFZID1cSNLjvEBq6ewzwRergrdgxJ8TeBjSc4c26lm9jXVUOxtMWyYoByPLBo/e9aKlPmFDhgLDU/j94JpRjf5JD9wPgPrco5tYDFXBnbADBujVJ4Orw07WiketHYWLSEcXPMm5QM4CchFS6CnDRUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+oVeAmy; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+oVeAmy"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-790948758c1so1048387b3.1
        for <linux-tegra@vger.kernel.org>; Mon, 05 Jan 2026 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767627848; x=1768232648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYkOfrIXwEeEFPSymxR3igzs8AcT4FFM6Z9IKdtfy90=;
        b=K+oVeAmyEIii94itEfFsZ/vynH7usZ5Xqi9M9EjHJvCCTHQbDjN6C3zziwWrJD8NH1
         JxYUz9uuHNi0S9le0OSWfOCMLX9ySLpaay0oQK1elBPH3rWXt0Q+9Ldzq/9P3XK3G8Qo
         Ng6dbg41sxvYGLR+dgFhrQkHXbrxREAjLywobWuOSXIRfWACD7wod0NKUYOpO2GuT68+
         7BgtRugchK1vwNYagSakPWiTqn4vjfkVfohLFp4ZwClWp6QiQDa/liBKKGpPoF0wdVyt
         PUDOTHLHqD6wV3PDfRh1shkRXbdU1ad/4X9BaFrO7CNx7NWksTtSQeyimkgwFHQCLxuE
         vj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767627848; x=1768232648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wYkOfrIXwEeEFPSymxR3igzs8AcT4FFM6Z9IKdtfy90=;
        b=jdZiokQ4dmzPGPVy2Ngkkim38Yr7EXs0FgOYVBj+qz24G5TW+PD64hZTg0L5X6EiWI
         8XfQ5xG8+zofjg2fqp3wUO36Bxki2M29vfCMYN3FovfZYUVFSyRruWZT48viMEX5ooju
         Uuz0XCehuMMs+E++mbdDpbTX+y3lSmCdCNQaZhgIcsC1luf3vjpd6l8TfpMziGQLC9D8
         8q6/pSGgdJmHJLa/FWC/3lHMNx1N6gtOtHtvi8ZC0+hyWzmOh/xZTt1AvjotU3gesIDF
         ytOvjWGY60TfEBoiXAEb6XgJUaTgYLP0jRhiJVdKZ3Dy4XLlUvuo2EhQzL3e4+ONs4sd
         sz/w==
X-Forwarded-Encrypted: i=1; AJvYcCWok6w6QYrbcB9cCS5zPi9np2yu00XV5XWS7p62CLtIQm9AJ1R3FFPtfMXVhmjLZDjuBt+tj4dVUEkGrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5MHbcDLdYja+vjCvtdaKS78wvumOms+9as+r0Mvpb4+IkYBNn
	Z/XqcrrXmsfJ/R0hEJtVWQvoih/QtolB58jQ2/Kkivvyb83mW+3S65I/POx1AePJaBVS+SdzQvo
	Rh9M7ltXBRi6gZ/cVCe7eL3anhLJQB63rnjqyVeaCBA==
X-Gm-Gg: AY/fxX4fnoKUT7A6NIwD5Ii8PnIwH+I01wUEHoSAXcqDtpjGzudpOnBH4ad15c1/i7r
	YLIVTNq52VR+HPHsGDfwrX+OP3MsI1VIKXiT56+kRRqEYMjKIDtDp1+fRVyQv7Polg4KoX3j57k
	tYCT0C4eSCuxIlTZNyPydP8MX68EtsTmFW6+6vsA1L+pIlA0YjOBoog8nDZZnyJexrsNIDuwl2l
	PEl80xwTkPIIVE0V/Ro9Td5HNQ44moqUOlzMFtC5NoG7dtldjdDQP9UYd9JQGCvF+Dowv2GqxVr
X-Google-Smtp-Source: AGHT+IENHVUmB19L8XKrR9F3h/bUcv670rXLNPc8TlmGC/MryKRU0KhX2UylF41J4XgVldLhv8H5dvEksf5MSA62IC0=
X-Received: by 2002:a05:690e:1901:b0:644:79fb:7dbb with SMTP id
 956f58d0204a3-6466a87edffmr38658466d50.6.1767627847953; Mon, 05 Jan 2026
 07:44:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com> <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
In-Reply-To: <DFE83EE9TFJ8.FZBQIKRUYFS5@bootlin.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Mon, 5 Jan 2026 23:43:56 +0800
X-Gm-Features: AQt7F2oqegGb5yKIGMER6lWYmnSkEDaT2O4LmiDNPF01eLd1hF7mOVwPxQMX72g
Message-ID: <CABFUUZGXjQttwmVfXSYiiswju4TomsDLS2S5_xv_ukMMJxh69Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] staging: media: tegra-video: move shared SoC
 declarations to headers
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry =E2=80=94 I mistakenly replied only to Luca off-thread earlier.
Re-sending the same note here via reply-to-all so everyone in the
thread has the context.

v3 was sent only to silence the Media CI checkpatch warning about >75
columns in the commit message. I agree that for an exact sparse
error/warning line, keeping it unwrapped makes more sense.

So: v2 keeps the original single-line SPARSE message, while v3 only
wraps that line. There are no code changes between v2 and v3.

I=E2=80=99ll defer to the maintainer who picks up the series =E2=80=94 if y=
ou prefer
one over the other (v2 vs v3) I can follow that convention for the
next revision.

Luca, sorry for the extra mail =E2=80=94 posting this publicly to keep the
discussion in one place.

Thanks,
Sun Jian

On Fri, Jan 2, 2026 at 11:53=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> On Fri Jan 2, 2026 at 12:44 PM CET, Sun Jian wrote:
> > This series cleans up tegra-video SoC data declarations shared across
> > translation units by moving them to the corresponding headers, avoiding
> > local extern declarations in .c files.
> >
> > No functional change intended.
> >
> > ---
> > Changes in v3:
> >   - Wrap the SPARSE warning in patch 1 commit message to <=3D 75 column=
s.
>
> My understanding and my knowledge of the common practice is that you
> shouldn't wrap lines if they are quoting a single path, log message, erro=
r
> message and the like.
>
> So I think v2 should be applied, not v3. But I'll leave the decision to
> maintainers applying the patches.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
