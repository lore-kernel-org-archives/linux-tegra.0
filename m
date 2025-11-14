Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35932561AE
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151454; cv=none; b=B+JKedpl0jNkeXUDusC9iVWuPQ1YT0Um0bQnLarPag9EDofc1KPnh2w+PII5QzTBCESDVr/QBWspnOaSKRyQOMtT1ma7U2QRT/N8uI9mRjyWozrq0hmjJRCBs31rLMzTv19KwHTylDCaevKQs4gK8uJZ6BZ7qO3hjRWBOCcQCz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151454; c=relaxed/simple;
	bh=EwjWG955RDGVAn5USvAIZEfTpe4NaYPAkKpzi761zd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8VF4paKp/DmXKPcsRB9/PLgTBscRB+W9UNywO/XaXIm+IJCoy6ghZGTYXgsqUcWz4ygRrLcCxfIgljy8kJ4wab93ubCjrMOLvlcTZ7r/9tMt47NLujOfP2q7AcNeqCbAfBqVufRunJyiNNDSs8+W+AV2wB9j2dmaBEb+mjBfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK/LkVlg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK/LkVlg"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5942b58ac81so1786043e87.2
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 12:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151451; x=1763756251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwjWG955RDGVAn5USvAIZEfTpe4NaYPAkKpzi761zd4=;
        b=fK/LkVlgdWO5pMmXXg5ddmcx1cKk8ZQGiX5nO+AJWSTVIACnGH+7pNoP072vs+I9yX
         VffRw2fQVL/UrEiAR+6N1U7hZglzHtX1chIv/rszgdjiXZ0kSEG9twJLbHKc60pFEt73
         e5E7pS0BZ4aYVTpBqjI2BDUUF337l1NwnaTCmItAPdgXGv0a4Gn1Wvj5ZHY35WrAv3Sm
         /uO/hUCIIuUK2bpw8L5ZiBhlKSVQzU/u3J8HGLtmTEvQk7K6Zi/tQGes1CMfMrUtT2L9
         d6/p0MIScJ9C9UwJZ7Q2JQCeAvPvL5a1GXbp+xu52DaIVUYTlmqx7lp/GJiVFxyTNQWd
         tjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151451; x=1763756251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwjWG955RDGVAn5USvAIZEfTpe4NaYPAkKpzi761zd4=;
        b=vNJ6hYvmd68146PLz1R/7KVaNo5xJVFX/SFU/dNCscxwc/SGNa4CHkm92XUo+B0t7g
         ei8kAwrZeQaoIm3uFM6x3iUrHjdDtsxADDZ3N+CxB18+1HtTlZkJU86oWiVg00VtqVtf
         O46KTqTn0lqKMuuwXMZBGI5G5ubZA71cwJZliGSIIDwBg+Edj93/NlI3hFu50EOky+xI
         JvNG95efdNgtA1IOt9ewvcSLPxSozhI+g+OTfmrA1Ud3EGYIOANWTob6eZt4qmkJREqH
         XCmxFrAmjg9qvfqH5RXnr37maAR7NeVl7lx7vqudnYSPxTi/GMCpXikxBVaCx2S/Qent
         8Kdw==
X-Gm-Message-State: AOJu0Yxda9FOuMnsib1AAz3xAPr+czkEDaCniaFlHDGByTdlgY6ymlaf
	CI138tws45rOjl5K1M97Lbu1Alw0DqQpd1122C/OerdrQy/PjBkd/zy9FBQhy8UriUpAYfmOXDJ
	dpg5NND1fCpZf9PE55JUqNkAQ/UuBfVo=
X-Gm-Gg: ASbGncuoW3Y1d2Nv97uAaI0RC1YWAredwom3qwQFdLVxLMxrr+ykRQDREUwkESKc6sE
	chh0ONgRj/V4uCWPZQiQ98RRBoR71ItR/vCMHgdTojbkIK+Wb2UyoDsIQpM8+2VikH/r83EyAiH
	ytVcLVYCD+ckx5C6plGWRi/dZ4BG7WkE8I8IJwTK8mZp2++ndyOVJbnxqYe+GZn4K1FdGh4uDQ4
	IqothuvydSOoZcIWt5atkXiDFwFGuCmi6t+wdW1/D3REp8K6A3cLmeEk0bH
X-Google-Smtp-Source: AGHT+IG4m/qUApaApoj0PDJ/shpgy7n2vXcUB+6FtTYfWGAAjDVzzQ4Zk5o4zNMiT0+FxL5C/QwAZYsbE3KCIsXHvEM=
X-Received: by 2002:a05:6512:3d86:b0:594:253c:20b2 with SMTP id
 2adb3069b0e04-595841df119mr1516585e87.5.1763151450571; Fri, 14 Nov 2025
 12:17:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <4vpqn2iv23pejsx4uxt7p2ojwy67pdzy5bihce7zpnp766f56j@2sr3d4fw4qwp>
In-Reply-To: <4vpqn2iv23pejsx4uxt7p2ojwy67pdzy5bihce7zpnp766f56j@2sr3d4fw4qwp>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 14 Nov 2025 14:17:18 -0600
X-Gm-Features: AWmQ_bll5LYdZRD8euhxQ2kZLgEqw5sRGipuxhZ9DMqNF5j6SxBY7FfWgQoRPYk
Message-ID: <CALHNRZ_4WaAuJmpTnvdpn10=vw5SXcv-5Qq+UX-T_pG4Snba7A@mail.gmail.com>
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > This was originally discussed on the freedesktop issue tracker [0],
> > but there hasn't been a response there in 6 months. So I'm reopening
> > the discussion here.
> >
> > * Nvdec firmware. The driver has been in the kernel for over three
> > years and there's still no available freely licensed firmware to use
> > with it.
> > * T234 vic firmware. The driver has supported the arch for almost
> > three years and freely licensed firmware still isn't available.
> > * Nvjpg firmware. The driver is awaiting final approval, probably
> > worth it to release the firmware with everything else.
> >
> > * T194 nouveau firmware. This does not have driver support, but there
> > has been some interest in working on it. Making the firmware
> > available, even if it isn't merged to linux-firmware, would be one
> > less blocker for someone that doesn't work at Nvidia to work on
> > support.
> >
> > Aaron Kling
> >
> > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
>
> I will continue to look into this, but it'll not be high priority. Too
> many other things going on.

After some discussion with nouveau developers, it was pointed out to
me that the gsp on ga10b doesn't do much and the setup is more like
prior tegra gpus. And that it wouldn't make sense to support ga10b on
nova. So I would like to expand the request for gv11b nouveau firmware
to also include ga10b. Perhaps not directly pushed to linux-firmware
until they can be verified working, but made available so driver
development can happen.

Aaron
