Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA5F3BBFE
	for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710882038; cv=none; b=C4EVZ6Zvl1OhrqkZ3kt/V6cXduMG8SQC1HLwKtzsg3RPaV7iV8iOnd9q8K66ujV8OcFfvEwuX09wLfkMvxTs/mTCo7KxK2RrHvv5UnWEd24Rf1QNtjuiNr5ZMrJi1h0zlkdAfe0J3tzWr0j2f89qoLKgyxp2jJo6aDZMg516MRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710882038; c=relaxed/simple;
	bh=FFxWdNsrCs+Ws3tNdAflAKfMvAZZKT7Q+ZcIn5QT9hE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfjoDpEVc0r4CcTiLpT1FnD9hP04ipftxJ6owAqrYioljxL7nTV/bueoy0FtojFHpraR/UZyFJHBCY7vrpEygnCE9Adwu/L/gbhNUEZa4VnTspl+DsrzwdxwVfAJ8FEthC5x8hu/VGNZqVIeM2qamoxulqsBLZN85WlcUsFhZZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ohnSC74G; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ohnSC74G"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56a2bb1d84eso490211a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710882034; x=1711486834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJm66ymQj4qZljhVLm+D5W3oaVWUS1R2lKPopMwVbNw=;
        b=ohnSC74Gy6qhmZ4TJxNjzIPcAk5WHJCCALrrAKhS9W26o8EiujvlCUIs+1bwGdjE5R
         GHl/iUCv89u391HTSWThMCGnkeKoEjmW+V8TsDFwDPQq75CZSLY4s1dbx3dme99Pe7v7
         YHBdF5sXJZuMuZi45EAk9l4DLcXSplPMgm9Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710882034; x=1711486834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJm66ymQj4qZljhVLm+D5W3oaVWUS1R2lKPopMwVbNw=;
        b=jNe8ZfU5lNN7oqu+C+BTsTjplDktiUd/xQJRL4cOsNm3uGwx+X+b8REeJ72wGrJVtS
         sGk0y2L/D6FgW4X6/y/IxnHAqTic3ZwF2Ki3hmLG7CP4C6xqnI3i/hjcx73LOMGZhJoM
         IsXuTkWdXJGKAQrgxtK4fxmquRg9baHfWpbOzudPN+8lSFNXAAYZQp/OZehGQsN+cvPo
         Xf88Az+MnJdULV/M6I6Vt7DwFxN9J8Gu3m0IKbVORzCJ+5gfEsF4TbYk0pGo6lEKJYsH
         K08FBbdxWk8QIRvA6qFQoq/9om2PwrClBZL+8k3u/JLVU+o6R/7dSidd0XllvFVLTr3z
         GQBg==
X-Forwarded-Encrypted: i=1; AJvYcCV/MzEWAJKndSD4wBXyJuKRKw/79jNX3xBmETJbVVX6sUGd88RGXYG5f4Y2/lvOQsFpV6x3Xwv0LZdi4BORT+g8O1EKEOy3bfN6/KM=
X-Gm-Message-State: AOJu0YwA9kdjVNiFg8MSQVFKVcHktdTI0ykuwhZaMaXPiX966Efxb/r2
	yq/TMLAGq4mmIKo/9V/GyI0eeYpdoYmrYLcy6/E+GCAM5LqIuMa3c1re7Rr8vW7vt0QU0OOTyTZ
	JfA==
X-Google-Smtp-Source: AGHT+IEmMFYpTsy7wplDTv+TvnqKIC+tcDulyXq+kDtXpv9MN41UXjxBR3LrPFZW6JvSRRg3z+DOHg==
X-Received: by 2002:a05:6402:43c8:b0:568:d21c:e0ef with SMTP id p8-20020a05640243c800b00568d21ce0efmr555156edc.6.1710882033744;
        Tue, 19 Mar 2024 14:00:33 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id n13-20020a05640204cd00b00569aed32c32sm2707816edw.75.2024.03.19.14.00.32
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 14:00:32 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4140eed8a4fso30625e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 14:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDe6Xym3Hc6HgvKL/pbEcahSbA+QzNwEA11yXXh5VqCgI3oyvJjK7Hfl9aQ2xqECBmIsQ3yXBOtXP2QyZTMSXBpRpMDJ5LaYrfq4g=
X-Received: by 2002:a7b:cbd0:0:b0:414:da8:76dc with SMTP id
 n16-20020a7bcbd0000000b004140da876dcmr63824wmi.6.1710882032388; Tue, 19 Mar
 2024 14:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
 <CAA8EJpq-NjmYkWHAVsuP5jA_Z7Xx0jCiqEDgU-0ni9BCg7Opuw@mail.gmail.com>
 <2fa9a262-de60-2c1e-9ac3-1e478ec65bb8@quicinc.com> <CAA8EJpqg+Di7PH2bmQ6uMidD3MhQ+N7w-1MWWEOBrH5DbsWSTA@mail.gmail.com>
 <977f647a-fc30-d9c9-f973-fd8bd9a4020a@quicinc.com> <CAA8EJpoAwRKbHxVhi0q9koSUWFPcD4sP=F36r+rYsrtbY0fLkQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoAwRKbHxVhi0q9koSUWFPcD4sP=F36r+rYsrtbY0fLkQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 14:00:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0k5U0i+Q_X_3HAviY-LXNrAw=PFjWDg+eej-Kq=0Y3w@mail.gmail.com>
Message-ID: <CAD=FV=W0k5U0i+Q_X_3HAviY-LXNrAw=PFjWDg+eej-Kq=0Y3w@mail.gmail.com>
Subject: Re: [PATCH] drm/dp: Clarify that wait_hpd_asserted() is not optional
 for panels
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 19, 2024 at 1:55=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > >>>> -        * panel to finish powering on. This is an optional functi=
on.
> > >>>> +        * panel to finish powering on. It is optional for DP AUX =
controllers
> > >>>> +        * to implement this function but required for DP AUX endp=
oints (panel
> > >>>> +        * drivers) to call it after powering up but before doing =
AUX transfers.
> > >>>> +        * If a DP AUX controller does not implement this function=
 then it
> > >>>> +        * may still support eDP panels that use the AUX controlle=
r's built-in
> > >>>> +        * HPD signal by implementing a long wait for HPD in the t=
ransfer()
> > >>>> +        * callback, though this is deprecated.
> > >>>
> > >>> It doesn't cover a valid case when the panel driver handles HPD sig=
nal
> > >>> on its own.
> > >>>
> > >>
> > >> This doc is only for wait_for_hpd_asserted(). If panel driver handle=
s
> > >> HPD signal on its own, this will not be called. Do we need a doc for=
 that?
> > >
> > > This comment declares that this callback must be called by the panel
> > > driver: '...but required for DP AUX endpoints [...] to call it after
> > > powering up but before doing AUX transfers.'
> > >
> > > If we were to follow documentation changes from this patch, we'd have
> > > to patch panel-edp to always call wait_for_hpd_asserted, even if HPD
> > > GPIO is used. However this is not correct from my POV.
> > >
> >
> > hmmm I dont mind explicitly saying "unless the panel can independently
> > check the HPD state" but not required in my opinion because if panel wa=
s
> > capable of checking the HPD gpio (its self-capable) why would it even
> > call wait_for_hpd_asserted?
>
> I'm fine with the proposed change. Doug?
>
> >
> > I will let you and Doug discuss this but fwiw, I am fine without this
> > additional clarification. So the R-b stands with or without this
> > additional clause.

Adjusted wording in v2. Kept Abhniav's R-b. PTAL.

https://lore.kernel.org/r/20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c70=
48d94f5b6b41@changeid
