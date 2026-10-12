Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3286F40B38C
	for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802549; cv=pass; b=O4UR2tkWerc2tLygAdKFPepjlueyCBwITp/Aq22htW0O/E0i0iBjn0LzCkvOHWgiPrWxF3ez3+85step14PoEEuhNQW1rAuwEXZ2HJ0JZg4hnuTDETo7peFsXSniDkfAVjOo7ZDkNQZF3eIz6JLB0+SQFmn9JS7E1OfritA9GY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802549; c=relaxed/simple;
	bh=l1EXipAKmMkC4QwXJ8OoHPfFNSosRCN5cyKya011Gw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ymla2l9/4KmcUQvWUs5C/uZYkrtQOpnfQUN5AZ0T6EndDsIiko6+v9fMVdtxjhjx+ClIaSnL2RlTaIWn7z2jqP4RymHD3qZRMDf4KFd66rir2tpdQi5iObDTLNRzGqEhrHVkijbW7i9HOp+5rY90/zGgCGqE4q2H7B65Ymht+X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYX9L2CP; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYX9L2CP"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso4498822eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 12 Oct 2026 03:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802547; cv=none;
        d=google.com; s=arc-20260327;
        b=ZM0pOiqOynIddhzbMcF4XeTLhJlXwFlCk4yms5TK0bT1Qb/RH0CQxR3JQJO2di+zvo
         rcKjbH5uvdzY8RB9TQk0WfEGCqv3CuGGdQ7s0pIOvF0NudwAcVmqZvtC13Nk0pbGuYka
         /26wFbTqAyFnPceMrh0Tsw9uc61GcsXenov6DiYdkBaNT7oxws4aRNlSFwSn/JkSRE6n
         ZsrD8evlvk1hq7Aq42GyLiTdHJUplz/YpJSEMdsuquT/OMd2GVpG1nphSofsKQV5xPz8
         tM4yAH8MwyVT6nHadZMa8ziV4tqqJXJd1khPeWXeD9kWk9svJD7GPtlU9T5iejzyU7Vb
         u2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        fh=hx6Z0qSprxneGy4rZncnm8XYZqukJzg2xSs8HkJlgAo=;
        b=D76EguBHeDq86gY1FC8OevHma9MpwzISHAhmtp+vjcimRlCm/bApESsVE1iu/YzGxf
         302ZCShNhpdYaPMrpsMNohG7zSPz2xp7wC23jBms3KwSgKKKZpFfC7ZHNJexCNA+hD9Y
         T5t9VEm8F/53xTQW2R4JoU9FpoEuGnML1y9w+aD+cVaGZXyZE8rFiZ9aszSPWWIDbtQd
         dDF+MuAU+4CqGcdAYahCpSpZxWUQWVpr26nNZHFB5DII27BAkSGe29nCnelQbesrRqi+
         2daWO8gdYpE5X+ixmTMa3Mvqao5MP8F+8u3jkeosPM6jLxe2sbIiGBtkOMZSnYjL2s80
         Oarw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791802547; x=1792407347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        b=JYX9L2CPwELErdnA2VR9OlUD1AcDPj2aoEDCkMXfTAvCz18j2lgC+sjlHvnXOeTyYL
         zf552/7Z58k6fEPTryNlTjpIYM8WOAbYmmVvWWn5euNzQvNq1cwZo6FbMfRiDPuQMUa3
         IOjeecMdHuouzpxIGddmb8WRfAoCIDw/G4U6Az9rpODAqW6fghbK4sQoib3WtX5Swuau
         xlMr0jESpTTtVDhr7B/oltKVA48Jsz35qtF+GLUJ8oNTmW/W0UXr3vKvxfRnXSx8rADp
         qukLI+YZWa+OP/8RKPgfMUcDtWxBAa6V4OlgmJ0IXmkBzwAdm07jZ+LPIjV5fVewlivK
         372g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802547; x=1792407347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9ROzNBJNDCemx8euIOsygMH5hKPgnw7X8l8m/TjjpI=;
        b=yZCMQLV3GI5CPxYLXWPUaZVKgrZMRaCnmbyipqG3zu+0bjzqo2/lY4MSVG1XBT8me3
         s+gUHRmDR84H+T6R+UpZIlf5ju5BHEHafGP5B673yE7tfU1icdMlR1C2DunFyQw1fpcr
         RmpET4pMdM+bIRZqBiOeEWPjdLt4UsB6Oo6ZFlRO5s999m17jTfUvTL46+aousdTruWe
         BrJJu+agJfOM7jrsr9xm1aiSgouwHTiSzXoRo/3txdYxNHHWLUVKE8VdvNgH1lzdr9mk
         E8zT0D9fyEQpwA0jir0dXRbZltNbjlV8nT2/ivlxIKRgvxey6e9u8hxD5RDEPajSdgBC
         8sbw==
X-Forwarded-Encrypted: i=1; AKwUvBwqFtOvAQCkjvmWg5k5LjjmWzKuCGgPPebr/MywuirSzOSO5WWmY4AefzqO3OZw7Uyhg7HyvwCNwX39Ww==@vger.kernel.org
X-Gm-Message-State: AFq9FYKa81zTAYo8gK3t1WCYT6TbXB/h1gsWrH/CQHMoih+ifoompuWU
	FYDpchShxKmSRvBKICEgnIDHbBKxSs/ZkZD1Ny6t9tNM9VQq/LwVEj4OqEYpHZoupqvRf5mCyAJ
	HlUlF6Wq0cg46wPqP4FkRJYJ9fx95JHw=
X-Gm-Gg: AYBFou2hqfhE6npvL7cy/qR9m8kMK2lQwEhBwvHlLG0vu9jw2TukvHnUt9xVf/EMkaM
	2CXEuZcyIwuP/r9noElWTyiYEwCwkmv7Iw9dCL7wB3ohzqxBold07InkaAWb1UkXb399fesYrC5
	kWHRYx2CgajBLraDPPRtFsVJoEtAjqT8o8avIL/KikU5bLdSbOJWccKE4lhhuCDesK4oZpKFQHn
	P7oXUtqSMBqfR6lCMFHYqudPtYFBXR9MeAxJ3O5kZmuS7wnmeOqJ40EGHplFmJDx7zpp0X1IdwR
	0uceUhXOCiAbm/euQJondDz0FUTXj5wIXLH9QOvjV0FdKKJTW7JUBkdzebrg8kUgPhRsIsJJTcb
	XNXXwrapLWs3gR3zZmMajAjgZ
X-Received: by 2002:a05:693c:820e:b0:351:5b99:5f35 with SMTP id
 5a478bee46e88-3537df50ea8mr13679930eec.6.1791802547178; Mon, 12 Oct 2026
 03:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004154456.145362-1-clamor95@gmail.com>
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 12 Oct 2026 13:55:33 +0300
X-Gm-Features: AclHuK9-WY5HBOzJjdXhPqCGEm0X08eS8KVRxjYfB0CV_-KCl6-E-4-979CzLCw
Message-ID: <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices and fixes
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:45=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add nodes for recently supported device (ALS, LED controllers, haptics)
> along with minor tweaks and fixups.
>
> ---
> Changes in v2:
> - added USB configuration update commit
> - added p895 power LED trigger update commit
> ---
>
> Svyatoslav Ryhel (9):
>   ARM: tegra: lg-x3: Adjust WiFi node
>   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
>   ARM: tegra: lg-x3: Lower supported suspend mode
>   ARM: tegra: lg-x3: Add light sensor node
>   ARM: tegra: lg-x3: Add flash LEDs controller node
>   ARM: tegra: lg-x3: Add haptic engine node
>   ARM: tegra: lg-x3: Add backlight LED controller node
>   ARM: tegra: lg-x3: Update USB configuration
>   ARM: tegra: p895: Update power LED trigger
>
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 ++++++++++++++++++-
>  3 files changed, 127 insertions(+), 10 deletions(-)
>
> --
> 2.53.0
>

Hello Thierry!
May you please pick this patch set if you are ok with it?
Thank you!
