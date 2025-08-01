Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1E1F4181;
	Fri,  1 Aug 2025 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754041201; cv=none; b=i9VZz3ylP/4Iftcorb993zVm5D+BI737PM9HhJEcfbboAdx3FcgJXZx7W91Pa1hjXn43WpJGvyZ7sYdgwcEwAgIR+qAWgtfnc0M4zb1Ou8gImO2BadUNG91Eb6mL+0pkIJc/VLsAI4LT4znsELvxVIg57huP58MA9anEWjXiYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754041201; c=relaxed/simple;
	bh=hBn//WsE1x04zKyOGbDGjGAYww+kot9pe0dE+1BfnX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLcP7MfMamuQt9qbyqOYGhxcSlQMTjGHmtx4/p1drRao0/3Wj9egoq/YGyHJRd6ioIm4RiSlywj3ojFz6T7qMz3dAAyVUj1D5d5lzElPeyFPbBxsW1Yb7lHQuKH74juRjPzb6ys+PDxW/lx5CQp1qI0MhYAaQA9frCrU2oiFMvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrRe8T5t; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrRe8T5t"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-454f428038eso12690845e9.2;
        Fri, 01 Aug 2025 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754041197; x=1754645997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hBn//WsE1x04zKyOGbDGjGAYww+kot9pe0dE+1BfnX4=;
        b=WrRe8T5tnz8bG8o7OuZ8i+mOuR+P74hnEKMCL1b3C4ZlTjj39zm/BfxCiCU+iSkqH0
         0HyKU2k3iECUXg70z3t9APJ1jk7IhTPxo63gTf4+1h+BAEId7v4wrZ7pZWpg5jz0FRbQ
         aAJvn/q2meqMG6fv8e6HxZaf3RnWvSqCMDvISIWZ8K2oaE1Q/WAcJ8FUXWNNqeSEFykB
         CYN0nk5Clwuwe7kyshdgdjV8qNJi4L1nErqBZGyJCpGalfHKcIpntdJR4d2BnK0fTPbh
         mUTfUbiKG6ikvF1Woft+2Iyxl/1WWoAOh8XOuh0XsRPrez29tP1ngpOCW3FeN5UHcnq1
         bs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754041197; x=1754645997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBn//WsE1x04zKyOGbDGjGAYww+kot9pe0dE+1BfnX4=;
        b=lyt+Fi7yXiHIflRR10TcgV7jg2SlT+eNYYUU7jaC16MEOGAwW673QnMU5T+AdnDaNv
         zEWKMvZIxc/4+N5xHPVmcMQ6Fim+NHeSfonymT1BjspOtJJxZaC2RYKRRrqFm6JV07uf
         IIfMxxBJp88p9yqEYeIKjY+Q8EmHQGUEoHeoYZqp3aOheWWhd3tzcf/uad30pH8VkMxZ
         8qLkIYK7kiCncAPSx8MeYQa5y+nuKivmCkzEbCbvamtQg5WgiYhYguf+SbD1CkmK/F2R
         C4t3i7pU27eBZNCBnmRn2YGmNFzwtX9RwGAWcxi7A6K6uvku8erW7Gu5949TMWfDIHEK
         LCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6/jBDEJG8jOC1KMooG4w1W8LTk+wclHU0CQZrMOgEUnT9n40ieILZcyYmyAvexa9Hq6E59DJ2+c0t9L/m@vger.kernel.org, AJvYcCXFZr5Q4LFCNESogQzFgTltdWrLViiXOP8OuNYA8uUitw8yrv0Qpz0M2d6u4E/FsqsJ8ChjiRNGuV0E@vger.kernel.org, AJvYcCXORYF8xErxsjhxKpuPuD+0SjhPwcDJeGHVuKffVXsEOY34lQBy+R6fPfimjyv9VMMnc8B0txgqK6kQfFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqWKVdVjFNJkQaLsVTJp23fIPvVV3D4MWELbUaZKUzocZ36nzK
	2g4dqEVenEGh1s8ulaMoocy4LtLHYDptSB8GXsb3rweLCX4eorozcwouv8ugHw==
X-Gm-Gg: ASbGncugCeE90Hd3U11xlg/p39f4eeNSFpez72yYluqJtUCXjtzPCHpVY9M2FgL+3yG
	Oy0weJ6/TF7iwX/bRH88po7FJ8vG/cyCkEU4eZAgEtOVIET43q9dIWwZwM7PiVFSn0/LIjD+zS5
	qWV79UNP+ZhoaYcF8madrSmTI+f3CwOU76Ag0u/586wCL/20TCYjDUUt8SElvjidvPtd4Zc/iNE
	XPTawqLBILMAPGlK9mM0TR1esfySY0EgQ9FclccWQ+7ru5UwTr6IZNAJR+lFlQ+L8o6FZcLWyfG
	dMXW88N6SbylHwQmCpC/QkoF31ZSAmShPvyrXkfOK3dhwTozpPX2sJTZ7WmlscL4uzCixErq0qU
	JPxRLeLHTEiLBLdizs2bne5fV4wSx6od9lChxf3sW31CSB97UtPpwCSVvbNUmoQuJfjmQMQu1em
	oZ0E20aa9S
X-Google-Smtp-Source: AGHT+IHE8Eexm42LgwgZ0rmkWO50Mm9e/qaPhJAIWts/kwUqYPsIA/nvVSs/tPL9agk+CZU7xo1syA==
X-Received: by 2002:a05:600c:4e87:b0:456:1d34:97a with SMTP id 5b1f17b1804b1-458aa325515mr18400365e9.9.1754041196544;
        Fri, 01 Aug 2025 02:39:56 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589edfc8bcsm59474825e9.9.2025.08.01.02.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:39:55 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:39:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Nicolas Chauvet <kwizart@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
Message-ID: <pm5wrq5awpfokvw2eimzj3r2b2x7bhdd4x4kg4c7vhkti6sp5u@aetnoqlqjrfk>
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
 <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
 <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy>
 <CABr+WTnn2qOXEMCiRDywySAxn0UeKAcx5XOJNpn731tXxbCPDQ@mail.gmail.com>
 <CALHNRZ_T_-FDOhLsjr7Vm3V0ekKkLCtv+Lt0x07133Cq+62cfQ@mail.gmail.com>
 <CALHNRZ-133F5-AdqLdnyXac3tFRir2+zamUXaSamUiw14aWwVQ@mail.gmail.com>
 <CALHNRZ_6Kf3wGkSY7_Sb9UpFX0qnrPEvKcvMxdRk2dNjj=gxPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s6gur245a3cs2thn"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_6Kf3wGkSY7_Sb9UpFX0qnrPEvKcvMxdRk2dNjj=gxPw@mail.gmail.com>


--s6gur245a3cs2thn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 04:37:46PM -0500, Aaron Kling wrote:
> On Mon, Jul 14, 2025 at 12:39=E2=80=AFAM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Thu, Jul 3, 2025 at 11:40=E2=80=AFAM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Thu, Jul 3, 2025 at 11:24=E2=80=AFAM Nicolas Chauvet <kwizart@gmai=
l.com> wrote:
> > > >
> > > > Le jeu. 3 juil. 2025 =C3=A0 13:00, Thierry Reding
> > > > <thierry.reding@gmail.com> a =C3=A9crit :
> > > > >
> > > > > On Mon, May 26, 2025 at 02:07:35PM -0500, Aaron Kling wrote:
> > > > > > On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> > > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > > >
> > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > >
> > > > > > > The Tegra210 L4T bootloader ram training will corrupt the in-=
ram kernel
> > > > > > > dt if no reserved-memory node exists. This prevents said boot=
loader from
> > > > > > > being able to boot a kernel without this node, unless a chain=
loaded
> > > > > > > bootloader loads the dt. Add the node to eliminate the requir=
ement for
> > > > > > > extra boot stages.
> > > >
> > > > Is there any particular reason why this applies on jetson-nano but =
not
> > > > jetson-tx1 (or any other l4t based boards ?)
> > >
> > > I answered that in my first reply to this patch. This does also apply
> > > to p2371-2180, aka the Jetson TX1 devkit, but I don't need it for my
> > > use case because it is supported by the android bootloader. To my
> > > knowledge, there are not any other supported t210 devices that use the
> > > l4t bootloader. And this is not a problem on other archs. If there's a
> > > desire, I can replicate this to p2371-2180 and send a v2 without the
> > > rfc tag. Probably better to do so for consistency anyways.
> > >
> > > > I wonder if it would be enough to boot an upstream kernel with the =
l4t
> > > > bootloader (and no chainloaded upstream u-boot) as I cannot do the
> > > > other way for some reason (using fedora based upstream u-boot cannot
> > > > boot downstream l4t kernel anymore)
> > >
> > > Mmm, I'm not sure. I can boot a mainline kernel on the l4t bootloader
> > > without u-boot after this patch. But my use case is android. I've also
> > > booted a simple busybox initramfs to do non-android verification of
> > > changes. But I've not booted a full Linux distro.
> >
> > Reminder about this series since it wasn't picked up in the recent
> > staging for 6.17-rc1. Should I mirror the change to p2371-2180 in a
> > new patchset or should this get picked up as is?

Sorry, this somehow didn't show up in my list of things to look at in
patchwork. Yes, please add another patch that adds this on Jetson TX1 so
that we handle this uniformly everywhere.

Thanks,
Thierry

--s6gur245a3cs2thn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMi2kACgkQ3SOs138+
s6F8aA//VXK6znOUaFzj0+JwvDT+R1eRh7hd6G/GDtV32eErwNDER+dKG/t8SXVm
Wef3CsSt346JF9oqOqKlTNewO76ZFNtiVkCnpWKAGoi1q4LZUF26hraNRe4pmjMK
QekqZpd0iu/WdyiYy7ECF6wG6Hsw85ChRWtkviXk1Y88xfF1YjklHJjJcSS/qJAC
hUwiGnOx0QUTfi4iTjTeGsVglIQLl6AnjMnZ+EO+itWeStxKR64lzX4EZTxY8M2w
0+CLYAavFMWQEZHlISo2mbYOH2VCJtgHEzGMb9ToSkJCix1NNFKlzou4o0Nn2kcD
xJlCoVFytAhplVYnqyb5qZOizCEaMY00XvKhpscZ16gCaYA/2tWBcF3NcEwE2Rp/
BGBIInG3xtFwzNDMtLG3GtcCbF3p2SrFJM6gYncHSPFI6lQdiMyNuLJfAdj9cvRw
vgP0LkiLqbuIt5mfA2QOHxiXbWXvvnOIrHLEnEjhnG+vTLqmNlu32HeFVDyEww5E
eMpGE+tVNKMJMi8TTQLMc4YS+JWsM9TJRUsjbNLVfVfT/9oKDamxfWngBzO/VUJW
hvZW3UEOaXzSMleUF/umcUafxW1Uv3ovIqN5AQrpHs+ddNG1XGc/PjeS+b9VmRpl
ZEHWssCPYqWxIXTlBwaUSZZffdouaK+FfIr+q6chueBSKWNR2i4=
=GooN
-----END PGP SIGNATURE-----

--s6gur245a3cs2thn--
