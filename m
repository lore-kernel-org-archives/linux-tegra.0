Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400236EA8B
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468766; cv=pass; b=u6V39NxO1wQHIft3QMfrPXbp6Hv7jUXJ3fP701goCG+scm4meflgI2Lru4yLIG64cdY4HjEumlsYeRHPZ4RVLV6uEBp27197BCe+jAB1TGxqWZQpFokHK7GtftGaW1q+hgdw8deAMMm5U/aRktSdqx/OTWMUpWMkH09EGPACZWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468766; c=relaxed/simple;
	bh=E8rkKROlN2DBsFDy2zAwmFjvflwBkizPuT2WdL5S2YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OkuHyyr6qDO4IB4W8iv0b7xa+Xyj7t6SE7XvWLLXDnN7ofZ3QhW3UCAtzvRR8WyHGOXICGHBnCn3wXLAoAswJMoo42nE1p5wQG5tIAdp0FMFifcxLlFXWzWqzrUIqd6+JAHDhjzjeo9bhIOif6e9Bt8z3aurKuOWIKHzpHAgMec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDUvF+Jy; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDUvF+Jy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso2758854e87.3
        for <linux-tegra@vger.kernel.org>; Sun, 10 May 2026 20:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778468759; cv=none;
        d=google.com; s=arc-20240605;
        b=EvQKv7UIy374Lx+hzlSvUWfDKCOE4C5XR5uFk/oI9inKbHWBvZP0cvsr75kd/rZELw
         ltnUomqVTVWEgXG+gUZhUCJJCX5PlK0dwvN8P81pWoZ2IoCyXNd3x1Sg0YDYLDB2fO+0
         iup1wpJFm5bL8rFTfpDhQokhXnq0LRunK6+eNdq6rQDMNXc9KZKm7j9OB5Wu8CC3+mtS
         qtA0LauUMUddEtPtPQ4wGZuMnBolcbe07DvkrXXgD8a8tVF6YMW24uqprQY32xS4L5FK
         1lhTyrn9lWwGVrC2idmx8XzZgylvB7t9+vc+7eYj7xqpflcbCLnR5EKIkrxshkWGL7hl
         lK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E8rkKROlN2DBsFDy2zAwmFjvflwBkizPuT2WdL5S2YI=;
        fh=dCyTThM2pBl05YaGf30DJLrMrQ0pxGTtC+4zA3+q4kM=;
        b=TsqafCFlCxy3UNYmfzSdN4uNXsBuoBKb9a2Cr99BfCTzxi3DwCfIRGLZYbxhtQxys7
         X1FLFerCXxiQ2pDeG7iwe/cSe/nJdGm4+XJ/5A5X2wNwNgEMjbKhUr6kQqv/dgkO5dO4
         svJx2NfFusoG8lij9OVn6F/Wt78JWx9QvURpDF3teyO+NTiUQBisYZNd843cvCaL7YOr
         n/rqUi5eEwAcBw8iU7AR2vkihOOXkNlUYGJXWgVsUYDkWtcXmMroOGhnk6jm/jlcS+as
         qY0D+5OGI07USNn4htoqvhzGUuyYD6lnHcits7JKjGGkHHQPXkWySZRxjAXKQewTQ1nc
         MBjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778468759; x=1779073559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8rkKROlN2DBsFDy2zAwmFjvflwBkizPuT2WdL5S2YI=;
        b=DDUvF+Jy4tDy4uCcRvmAR5WRe12s4aL+/HVtPX/7+ZabTbWtl3KH0/y1FURc6RFd4f
         9d7J3ce6+KTVZKnx3uvqDEMGsRZIq8OzEB1HDMgv7Qen0noWAE0RG3gesqheV6cqL4AZ
         zqa5HVyzRhXS0cj/sXg7ivyToftZ8ij8JGsMHOyUoTjjaDgcOTefJDlhoGpo+PZo1pvU
         3rI4iAxkEB/pK3Xz/CC0nIgCWP8B+SQfUkzhcJLMh8QMhgNqztMPr3UYNW+vBYDItbUO
         nR0PBErouzVFlbD4NV1pz6ExJorfbqxbpGWcI4mpGSwhu+zmDavJL3Nq4zBMNelFzwP9
         7bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468759; x=1779073559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8rkKROlN2DBsFDy2zAwmFjvflwBkizPuT2WdL5S2YI=;
        b=drdpKgrxuVsgNuYznhd8D0FB/Sm9mH05ji+PEPdN2u0B045jUD12Kd3lL18nIqGC0G
         KfyqPG2aBuq+1f22K+bA5hqMKJ1Mt+xjqZ6p0WI8JAmPxigwzc8ypHr9XUUGVuXddeIA
         5c5svaqAT7lJqu+ZsfQDwfsU9u42yYLrTfM1pSHe3cDmmRWveRFuz2/BE1ny7Ez+Tk2K
         vUhOTxerYdei8/4Yttgi73rPBsENC0OaZ2MqRQLnJUJOKg2Pc0pk87/dczIYgf587CmW
         SZkYYguRrGn5yIFyNAuytxyj0sqvVQzZqiLX3BZNQxc03LRlvGe3ZKsQwvwloJFNAiJy
         4E1Q==
X-Gm-Message-State: AOJu0Yxn4d/honGWzkFR119/3wAhA1SHpdMXFfDaMRdpVAMFM3ZFg5J4
	CMAJvcY/YiAC4K7Hzt/t1EZwunSjii3AEnyQXLNh5r4LCMCC2oHSFAw8j7fBB6xuQTEW+L7ZpNc
	YgqGfJzSrl5B5GWrtz5QGUJbZvjjK1xcqUQ==
X-Gm-Gg: Acq92OGafarTLYYKCDjPO5ziGbmAUlyBavSeLAiJE8Qrh4VTolrTBYoFpXHWvk1lzxt
	qaJNQ0sD+9dxYaOYE3TTsptgstE5Ki8YaakNa5nYe60xuqO4Z006R7EPMjo9A1xbIF/3yIPD22w
	I/p1Ekh7gjRTWzayCk94Dob3RespY/t10L2lUOrWYBGEKP1uBFuie/SLGh0Y2iD2vAWRqPtsVO8
	mzlC7fAGKKUCV+H5aKKxurSRvTjIl4kQxFQuJXVVH+QrARLVAOlNN1rF/U9q459xHZ9bDi8nB78
	7KemGR6EVBt5xnSc5gzN/aka6PgqMbbExECt3Dj0gEywDJwvDebJR7unVRgn4Hxl0Pae
X-Received: by 2002:a05:6512:1386:b0:5a8:757b:80ff with SMTP id
 2adb3069b0e04-5a887ae07ebmr7444031e87.12.1778468759265; Sun, 10 May 2026
 20:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <4vpqn2iv23pejsx4uxt7p2ojwy67pdzy5bihce7zpnp766f56j@2sr3d4fw4qwp> <CALHNRZ_4WaAuJmpTnvdpn10=vw5SXcv-5Qq+UX-T_pG4Snba7A@mail.gmail.com>
In-Reply-To: <CALHNRZ_4WaAuJmpTnvdpn10=vw5SXcv-5Qq+UX-T_pG4Snba7A@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 10 May 2026 22:05:47 -0500
X-Gm-Features: AVHnY4KgND-0dHuqGkFDQosr9I-GGnOSrz5cSXpeG4NuHIWVbaXE6_kzul7nJ2I
Message-ID: <CALHNRZ9152Ox=Y230zmFM_eywsOtr0Z07CYLKZH+hGbOhRmF7w@mail.gmail.com>
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > This was originally discussed on the freedesktop issue tracker [0],
> > > but there hasn't been a response there in 6 months. So I'm reopening
> > > the discussion here.
> > >
> > > * Nvdec firmware. The driver has been in the kernel for over three
> > > years and there's still no available freely licensed firmware to use
> > > with it.
> > > * T234 vic firmware. The driver has supported the arch for almost
> > > three years and freely licensed firmware still isn't available.
> > > * Nvjpg firmware. The driver is awaiting final approval, probably
> > > worth it to release the firmware with everything else.
> > >
> > > * T194 nouveau firmware. This does not have driver support, but there
> > > has been some interest in working on it. Making the firmware
> > > available, even if it isn't merged to linux-firmware, would be one
> > > less blocker for someone that doesn't work at Nvidia to work on
> > > support.
> > >
> > > Aaron Kling
> > >
> > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> >
> > I will continue to look into this, but it'll not be high priority. Too
> > many other things going on.
>
> After some discussion with nouveau developers, it was pointed out to
> me that the gsp on ga10b doesn't do much and the setup is more like
> prior tegra gpus. And that it wouldn't make sense to support ga10b on
> nova. So I would like to expand the request for gv11b nouveau firmware
> to also include ga10b. Perhaps not directly pushed to linux-firmware
> until they can be verified working, but made available so driver
> development can happen.

It has been over eight months since the last response. Nvjpg driver
support has been merged in the meantime. Has any progress been made on
any of the firmware releases?

Aaron
