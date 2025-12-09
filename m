Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A12C236B
	for <linux-tegra@vger.kernel.org>; Tue,  9 Dec 2025 04:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765254390; cv=none; b=qIXfTozikpmwCQs3ZN+U7R50GYTS1F9UCwKFpcSsJDXGlvAw8le5G33tkLpth/Lwh09w9uUli5ukyE+w1fosZhfek6QkLCIVPk3i1RmEj2TzQRsZHzVPKENq4kLWSAVK0GMqmL7B3pNO7dou7H7c07SIDWH/Yqox4Tqgbnry0zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765254390; c=relaxed/simple;
	bh=4QNfQT+yaSWc9HC3z84t8OAr2py9WRAhBnkZqk0vEH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6Mbg4zJZsajWfQTaY19SHSUbiynVe/MY6/IMdbOf+C9zlJoskJNRm5xViqE/StzjUA9bQJ8IA8ValSjo1bIR1gyf+OcZBbmxXh6Bo2u8SI8DudeXsNHoAk4CPyEm+pRxE9QoBLiu73QN0mFvjpFMDJKFbFFsq8EA8SQqfUXknQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdKdbvI8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdKdbvI8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-597d712c0a7so5483286e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 08 Dec 2025 20:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765254387; x=1765859187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QNfQT+yaSWc9HC3z84t8OAr2py9WRAhBnkZqk0vEH4=;
        b=mdKdbvI8Yk2rfMLD3tPLnJudt6MMA7IBoXOviqbTKJzz4pZl4T5lE0nyvMib8MdjWd
         jriiucdHCgYb0uZL93ZNsUcJkXQqVEiYx4j6cHEiQR4UkEdtDQtz786W9eQklO+SKvMI
         bQNdVBSIoQZ0AyFWI6o7KVL3sQi8trEIxpM6ue83AYwFWwm9hgpUXYJncsdK2BJMQeer
         7mfgWFGQsBsyfXBuXR9oPax4Cg0FX9ixKeiMQp8Fg0z9c23twqcqMsL6bkZZGaBQUPOI
         Nqenlzxa+f0qI5v+QhY6h0sqHDjzsgMti2gYx4n+FZuRq2cLjwZ/Dsfc8MGva9/w1Ggf
         +AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765254387; x=1765859187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4QNfQT+yaSWc9HC3z84t8OAr2py9WRAhBnkZqk0vEH4=;
        b=B5fyyTq3byO0ogEAxwcuehI204OTYQeItm0hY6vDvgXFeJZdJrlzVULlIVUY5caKC2
         My+bBd1gF4xHJ8rG3vbSg1hg5XeUiaLr8kExz7iFVhpG6/4jIdd67lQdMRKrj+FreUvD
         KQL9uZQpGpvZWBny5Eo3pgJLNcG+ic7aJnBxyIBllJ52XDI+cLuzunhIBq1aVcUkAPaZ
         4mN9iWNMPYc1irmtNeiRX1KSCyv1fN6QQAYXhYg8Wl6O1MlDUSEUD4vks7oNPHHoP8+y
         t7lmPHmQ1Mvc17vgAg4oK0Uqzui+YxHoAkHRMPLeyB+aAZc0iGmmd1i5woMEI9Vo5BDd
         iGNg==
X-Forwarded-Encrypted: i=1; AJvYcCWWanrMKKiPV3Q0ljycBauGM8cVAc6W3bF7MSBn5ascYG2R/iQiB8s7HucWpSSNdVqb4srqbkxOHqjX7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YywqCm2AEuPWWlvh6bTWQBlVDU/6F16bwIsXQk2kcZehYxbGrYm
	pYfHmGNtEsYkoOn4bW37NeRcSWHVmKpbaIFTf5ZZlDgEzjmjMRSftKJJF4QBjm+I7xy+Npnmw6T
	IgPOv+hXMkP7DNCc4JRmDQCOhpXVhI2c=
X-Gm-Gg: ASbGncvOMpMf9fQCcg+nDHnUzRS9IWmI6eVW7UJd7ab1T++S/KA5h7IswMVnBEhva+s
	irBkjo0N+45AudmJCib7/7ZT99wd9tqMuE5Hl15aQH4uxd0Ee5sL03sm5weDa5ULMzNjJs6fhRq
	kLE8t45BbeoqJSshRMskryrwc7Zg426cMiGQyuaa/CX7oKb78qskaGZMbQOD3IpXjnuPy4rOKkD
	9antVGUkZbzeTdHmOB5nBaemUYArj9AJEL2eYQUJiPr1pAslBSYZ8Zio7tWKKw1J8rz4Yg=
X-Google-Smtp-Source: AGHT+IFR8801MDmyrZ18WOguOY+Gn0UIvPBqOLGDs22BI9QURUqSD4rNMEHzVCfSwWAzDWvmrLJoAz9Gyfs5PBTeLDo=
X-Received: by 2002:a05:6512:3d9e:b0:577:318a:a1c6 with SMTP id
 2adb3069b0e04-5987e8bf1cdmr3462912e87.23.1765254386315; Mon, 08 Dec 2025
 20:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com> <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com> <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com> <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com> <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com> <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com> <63be3373-1ab4-4aa4-aa7a-0175727aa9a3@kernel.org>
In-Reply-To: <63be3373-1ab4-4aa4-aa7a-0175727aa9a3@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 8 Dec 2025 22:26:15 -0600
X-Gm-Features: AQt7F2qHv1xU42NvH4dUdczccSFHNDISNqkEzdZv_IWSUPDeDRC4VEc-RTlPQG0
Message-ID: <CALHNRZ83EcVnyBYADsuXtMu9omBd8WW+7reyb4GX8FfJ4sOcyw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 6:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/11/2025 12:21, Jon Hunter wrote:
> >
> > On 12/11/2025 07:21, Aaron Kling wrote:
> >> On Wed, Nov 12, 2025 at 12:18=E2=80=AFAM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> >>>
> >>>
> >>> On 11/11/2025 23:17, Aaron Kling wrote:
> >>>
> >>> ...
> >>>
> >>>> Alright, I think I've got the picture of what's going on now. The
> >>>> standard arm64 defconfig enables the t194 pcie driver as a module. A=
nd
> >>>> my simple busybox ramdisk that I use for mainline regression testing
> >>>> isn't loading any modules. If I set the pcie driver to built-in, I
> >>>> replicate the issue. And I don't see the issue on my normal use case=
,
> >>>> because I have the dt changes as well.
> >>>>
> >>>> So it appears that the pcie driver submits icc bandwidth. And withou=
t
> >>>> cpufreq submitting bandwidth as well, the emc driver gets a very low
> >>>> number and thus sets a very low emc freq. The question becomes... wh=
at
> >>>> to do about it? If the related dt changes were submitted to
> >>>> linux-next, everything should fall into place. And I'm not sure wher=
e
> >>>> this falls on the severity scale since it doesn't full out break boo=
t
> >>>> or prevent operation.
> >>>
> >>> Where are the related DT changes? If we can get these into -next and
> >>> lined up to be merged for v6.19, then that is fine. However, we shoul=
d
> >>> not merge this for v6.19 without the DT changes.
> >>
> >> The dt changes are here [0].
> >
> > To confirm, applying the DT changes do not fix this for me. Thierry is
> > having a look at this to see if there is a way to fix this.
> >
> > BTW, I have also noticed that Thierry's memory frequency test [0] is
> > also failing on Tegra186. The test simply tries to set the frequency vi=
a
> > the sysfs and this is now failing. I am seeing ..

With this patch dropped from -next, what needs to happen to get it
requeued? I gave an analysis over two weeks ago and have seen no
response since.

Aaron
