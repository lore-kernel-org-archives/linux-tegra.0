Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B984F1494DB
	for <linux-tegra@vger.kernel.org>; Thu,  2 Oct 2025 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759440794; cv=none; b=Xy5IXaVR11eVhzRI2xpAJbOTmGzIwv0KjJOwPcd5SvQfFZUFfCtzJnioMllOoM7oAgpN9TTXv4Mb2uQzwCkrLyTCrAyLyURZz3y9rWvoeczS+Ai0wCTXQWeaf82esAddS/gbqL6nHgXiTteXU1PlzNN65FXq98hAeIhhQ0xMQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759440794; c=relaxed/simple;
	bh=Y2gBk5CB3GMJbnKWbC0U4OjbYTzYttD0oSvzvSM0NBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWl22sEuOYLzzLB1Z8OKF1qH9DT6fgVv8iwPgl1mTc6j28PqHdQgqF1ZawyGzsC9x/kJIsUwHPPfpnelwMjHC9L2e2JM7PviB70B0m49eV4tegHzJ7Alf04ZRnkbcqqIKNGf9/4wwqcsMXvyvQplsv3Jb5XDexx4YEALj1UWIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Op3OdJtQ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Op3OdJtQ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-424da17e309so16672175ab.2
        for <linux-tegra@vger.kernel.org>; Thu, 02 Oct 2025 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759440791; x=1760045591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/omh4dnkehdvWXPDDTiNzbxTABAKha3OuNX6oJKT2mA=;
        b=Op3OdJtQg+5mSsS6ihluogMOBAMMma18pk+n9rIoDKG2cBpoG7r0sycXcI1ey/Rx3Y
         1YFY1qvmdSieGE3KI7x7xi6MNWUJRLsPM1+9zCMiB5veTFC8Mbgv1EokXjfHqyq1OwKI
         IYTeqX6LfQjnetSUzPP3m+7om8aiTuawBgL/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759440791; x=1760045591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/omh4dnkehdvWXPDDTiNzbxTABAKha3OuNX6oJKT2mA=;
        b=ekNq4nGGyaLzZLUKl+TpfC16KLsGTrY6M9KNf4yIH7dRgmPrljzssrwR5p+ITV3j+/
         Yx+XRNBLeIfpo8PugNidFBhgilarwz4ZnlBaGQo0+xU9Ka6W0LQ1ZiPfR+aOTzZJs+Lk
         sheiO4ELNQ/Uduk1Ws+lLlAWHNdx35sP88N4MXLBrLyYIBAzoIUsBbgRRaQ/KenIMk9w
         XoclkkJalB2z+silNiLfAlsC83QLZJCtoOaB9dLH3tdQNYH0GcxQkfaP1oLRBAD1QyLF
         n3GUXEwxSlObzpGHV8LRK80L1/QxPibWmOW/nDszMa5ppobGIL2jiezXITpgRE/5E//f
         U9ag==
X-Forwarded-Encrypted: i=1; AJvYcCVacFhtJvQcqtAd8Xm0W7YtEl4Y/ifme8LM9v20FhBDuBB27nW9g0yNnDUvRn7owrXrGk33hrc18zLSXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1WrbkK6JKiP+hNaah6dgluJJjfwFlO1ZEa/kdyq0QU8dQGfzv
	Mo5zIIrOZPqp+6l4sSzQM22GF9fp0yH7RFTJRMs6y5VSSicrigsyZcwk3X+myChJvSTqlnCQaxs
	P4UA=
X-Gm-Gg: ASbGncvKRERnSj7e0h6BeX8HPuA3XUV8BTP3PyIqeTVOBvvuKbTMuxRo5XehTJB89PZ
	VcIzwZqBMFkWEwb1oSttN8kbPNFVuljITn4nR2m6XtnW+N1n57Bve6I9/yjSYEzDIoQYoSuVPlD
	sHn2QNhw67gXZQXKGEH8oSA2+qUyLNUpS7MadA8Y50Rz3I0rPkYEXe8P7y3VQ/nHybkwtuwJM2V
	EP6BismeLwKRUNBAX0mHOpMNrZ36VVbEb9IIsFL+nqxnsn7lOvnR8LBIYlcsuCe0NBMjwRjfVDj
	4wzjfP9d7Fyuad+yyRnuAB1P0lYvQ4e/IODDjyHyaE3TQhnCI8Ce2YjjY2nUnq61zbDYmWkbGLN
	KkPP5RFu471hydkPJKtfukWLDtBfBAEFWXfrghV6U5YQS8DMmyfuikzrTCuJQVGZHmrEDC4/fvh
	4rDxqbFV9sejKX+YhtA/+w
X-Google-Smtp-Source: AGHT+IErNFM91yny1dEdp8A7VO5Hb4ZRb++lEMb609z6CflOAur7tvBEVb+ZxLRBv6nsmQECPcSE5w==
X-Received: by 2002:a05:6e02:1847:b0:42d:8b1c:5740 with SMTP id e9e14a558f8ab-42e7acecd9cmr11877425ab.5.1759440791216;
        Thu, 02 Oct 2025 14:33:11 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ea7f82asm1165924173.33.2025.10.02.14.33.10
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 14:33:10 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-9399ddb3ffeso106698139f.3
        for <linux-tegra@vger.kernel.org>; Thu, 02 Oct 2025 14:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLf+jk59OTszmqxSjyZWMvWZ8LN5Ysw/nfCiOQHrX9t9ou9qemFqsPrNWszx6kkKBWhMHG8EcRgn2q3A==@vger.kernel.org
X-Received: by 2002:a17:90b:4a8f:b0:330:852e:2bcc with SMTP id
 98e67ed59e1d1-339c27b94e9mr883144a91.21.1759440338414; Thu, 02 Oct 2025
 14:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929142455.24883-1-clamor95@gmail.com> <20250929142455.24883-9-clamor95@gmail.com>
 <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VO2sXssuhZyz+aKvN22xH5eButHOQgKK+qEkPT3Ug2XQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Oct 2025 14:25:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VOEDgUHG138d-_HyRX1EmeuZ=8v+2UL4cXQ0GN0e1FqQ@mail.gmail.com>
X-Gm-Features: AS18NWBl_-6A1NX6XipYEQi78zuUuxrbDfjw2_uXBU-dcpIdXNfIO_PqcqCT8kc
Message-ID: <CAD=FV=VOEDgUHG138d-_HyRX1EmeuZ=8v+2UL4cXQ0GN0e1FqQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 29, 2025 at 8:15=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Sep 29, 2025 at 7:25=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > Add an eDP panel entry for AUO B116XAN02.0 used in Lenovo IdeaPad Yoga =
11
> > with Tegra 3 SoC.
> >
> > The raw edid of the panel is:
> >
> > 00 ff ff ff ff ff ff 00 06 af 5c 20 00 00 00 00
> > 00 16 01 04 90 1a 0e 78 02 99 85 95 55 56 92 28
> > 22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> > 01 01 01 01 01 01 12 1b 56 5a 50 00 19 30 30 20
> > 46 00 00 90 10 00 00 18 00 00 00 0f 00 00 00 00
> > 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> > 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> > 00 42 31 31 36 58 41 4e 30 32 2e 30 20 0a 00 f1
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed just this patch to drm-misc-next to get it out of the way,
since there are no dependencies.

[8/8] gpu/drm: panel-edp: add AUO B116XAN02.0 panel entry
      commit: 5b50bb435629ab206cfa1cca3d71847d4523f88b
