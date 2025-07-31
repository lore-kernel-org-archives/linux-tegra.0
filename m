Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA78264604;
	Thu, 31 Jul 2025 21:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997057; cv=none; b=HWugtW61oHr0MZf4D3FqPFDH6YsXet7YFfkhP3a9iFgiyK4DK7hymcxOU7umUl1PEhSaVNBCSnNt0FjaOShuM64v6NIH6LUQ38knTsLNQB0KPoJ2YNd/WYyZCKZB9JXhgdT8uTtMvZhWalWz7pAZblL7RnZFOuGnqC1ycPZnOXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997057; c=relaxed/simple;
	bh=Vqlmy0/qTjfqHrMSXMRANK7e43gjkoH8sRegyh2cFvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SXykY8Ptv0FmsRFUP7LS+tI2snLyS2wnSu8BzxT3dGp0ks9kh043AGY4m7XFQbrfWQmMER/b+U/BYU8rbqCb1EbudPLmyG8zV1dAxnJZNEVUdgOGv35+2Bp3vvejmbR3gHtR+BGWHpxOmcKWl5tCelpg5++1HWuffLUCFAUVTNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkRF02rS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkRF02rS"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5550dca1241so826826e87.0;
        Thu, 31 Jul 2025 14:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753997054; x=1754601854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vqlmy0/qTjfqHrMSXMRANK7e43gjkoH8sRegyh2cFvY=;
        b=IkRF02rS4auxl/ipD6cEQPHnKXzHrLJvZ7AvR/SmbJNsKwytIWlJQs0raH7yUIWGpJ
         IV8RElFJAEMeZHH/BfRoBIlQGCK1EyhcrhlI9ZQoXZHPJ50FGm1KPwXoRYacKVwGMU3/
         2Mtah8mYecc7dniDteJ4GPNIlJl75Ct6cc/v7ClxPHUBl8p3siGJOkdiaQCbLVjPmYnI
         MKvQGvdvHwsCpYO4I8pYj9QKiagORU4xZtzBK0ia0wtS6LyVg5XnX/Y/+w3XCtYpNmlw
         0U2Mu5GaDTdKn+qY2fckfKYjA/tYgav97Piuf92iu38cQmZCzt0aogPThm14GItoG37t
         ZvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753997054; x=1754601854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vqlmy0/qTjfqHrMSXMRANK7e43gjkoH8sRegyh2cFvY=;
        b=e+4LV9Kbv10VdMQYMtiiErSuKV4UPTdGuzvE5QM2DSqz0OQofF+IDHBf0D5RlBQj28
         xEoRswbkSpInPBrPghanGrsBJ4MJEUjftNwboszLBzb5CSa2NHhDK9Xp7YlLqlE/HKFu
         4P+8nC5fzB69RtgIDEY2xoeoimsa8EWtYntN+R9b2vLUW2z7GGP0I1vJj0QiAuW6arhH
         L+XxA7x8wvTQvGJ1QxvHOIvXOrzs9ZIdGlOQWobWVgp/uFaWHUrVQQl8W/wZ2F2ZB8ao
         xcwHfY2+xhGldEIviys39AQ/U9p74cAJ2erLDjDtbnHY393mH7m+NoOLU323me8YlxES
         GBiw==
X-Forwarded-Encrypted: i=1; AJvYcCUc6Rl/Gn0uLSKcvfcHc69wvuF1huDNVMxDNaewdDnCVZCu21f5busdW4w0MymuDv2/noQ6OothIv9vRsM=@vger.kernel.org, AJvYcCUrfrBLcwVZUohcL08JOb15iRvoyv8dwxydlbqodJKagOl7wy2z5mmLKICc+ZANWJLsT40NUpjVCUVn@vger.kernel.org, AJvYcCVshmywEtlwZ5LKzM1CqV+h7IR1NsXaO7gFFI0DLzwiCpYvj1gMNGUEFW3gzClGgIaYuF8fwP9GZH1RrNME@vger.kernel.org, AJvYcCXGFxjVZOEVzxvohIYAhlMb6w0Mu8RYZsMC7QINQ2LZK/TkhDxCeiZEH9vvvEQPl3ZsmtRlyuWGmrYZVS00orx+@vger.kernel.org
X-Gm-Message-State: AOJu0YwQUKwe48ss0uOcjeyuUfEt5cFhvSaSQrHG+sRnwLHStYOQlSrz
	V/nILirIDX6QpLlqhNf+KVeo3tYLF8VU8VvHhvPZPJRSVri/wxQeQkzSddoRY+kbZtDjB5g1TkV
	6Bpv7WV7p1VszS3cKcsvox8w0iLsVjUGfWD1fHd0=
X-Gm-Gg: ASbGncvkUu5CWAOpvzWgqrs0RFYIGYdmrNAv5F9kx2S0b6Ea4JELyFFF9oXsEnvGO8A
	X2tuj2ABYb6o3NHs04HqWhREK0Q0SKFiBhuV53k6ZQNakqde5SqIp6rXrfXzAVndTPSVYGTjCTd
	wmhZzsinzRw4zyIf2vZo1Ec2FTrvQusjqslp0K1Yql/ljlWdme1eBcEezWQi3MPKtyOg29tRkyV
	+dQoNzebZHwOicPgg==
X-Google-Smtp-Source: AGHT+IELLm1N5Ppjjh9kVyB/GgDaekTSvsHbCW2xRXD/GRV4HUi05JzcAJt4z9x14KBeFtKn2U/5jRnGQJlTYL2r0rc=
X-Received: by 2002:ac2:4c4d:0:b0:55b:8bf6:5178 with SMTP id
 2adb3069b0e04-55b8f27bd59mr72922e87.14.1753997053801; Thu, 31 Jul 2025
 14:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
 <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org> <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
 <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
 <CALHNRZ--ZUxqrXHEnizXC8ddHC5LFA10oH+CgQmOcTt+cJ1CWw@mail.gmail.com>
 <6abdc70c-0def-4cf1-b1f4-ea9bdde4fcb5@kernel.org> <CALHNRZ8=ikQe4L6h9VHpTGm+OFU0iZA_OV6LUP6jDUySBv4+Lg@mail.gmail.com>
 <lvj5atllziwnfreau25fejckllzhgur3rgh5udpx6boz55lgu5@h6fpsnz4xmkg> <CALHNRZ9VEUzU07j_fUWhNnF24y64wkO5_Vun-mf6d_m=Xyx4dA@mail.gmail.com>
In-Reply-To: <CALHNRZ9VEUzU07j_fUWhNnF24y64wkO5_Vun-mf6d_m=Xyx4dA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 31 Jul 2025 16:24:02 -0500
X-Gm-Features: Ac12FXzvNAHUS3ffK2G9J4btdZr71xKux3JnYqwj2ZcIW7pIFSzuXrYQC--hXjg
Message-ID: <CALHNRZ81AOu=3JFjrx_J5cGAe+6HLjy01AyeMfEKGrMzxNgo2A@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 1:01=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, Jul 3, 2025 at 2:24=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Mon, Jun 30, 2025 at 01:48:28PM -0500, Aaron Kling wrote:
> > > On Thu, May 29, 2025 at 3:53=E2=80=AFAM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > > >
> > > > On 28/05/2025 19:35, Aaron Kling wrote:
> > > > >>>>
> > > > >>>> Friendly reminder to the Tegra maintainers about this question=
.
> > > > >>>>
> > > > >>> In lieu of a response from the Tegra subsystem maintainers, I c=
an only
> > > > >>> hazard an assumption, Krzysztof. I presume the pstore carveout =
is
> > > > >>> bootloader controlled because various stages of the boot stack =
can
> > > > >>> dynamically allocate memory, and this became bootloader control=
led to
> > > > >>> prevent any of those from overwriting pstore. I worry about har=
dcoding
> > > > >>> an address in the kernel dt, then finding out later that there'=
s an
> > > > >>> in-use configuration that overwrites or corrupts that section o=
f ram
> > > > >>> during boot. What are your thoughts on this? And is there any w=
ay for
> > > > >>> this patch to proceed?
> > > > >>
> > > > >> I haven't been able to find anything out about this yet. General=
ly it's
> > > > >> difficult to get the bootloaders updated for these devices. Tegr=
a194 and
> > > > >> Tegra234 may be new enough to make an update eventually go into =
a
> > > > >> release, but for Tegra186 and older, I honestly wouldn't hold my
> > > > >> breath.
> > > > >>
> > > > >> Thierry
> > > > >
> > > > > Krzysztof, based on this response, is there any way or form that =
the
> > > > > Tegra186 part of this could be submitted? I can drop the newer
> > > > > platforms from this patch if Thierry can get a response to his ot=
her
> > > > > reply about how the bootloader could conform.
> > > > >
> > > > I don't NAK it. Eventually it is up to platform maintainer if they
> > > > accept known DTC warnings.
> > > >
> > > > Best regards,
> > > > Krzysztof
> > >
> > > If the decision is up the the tegra maintainers, then Thierry, what's
> > > your thoughts now? What is in this patch should be compatible with
> > > existing l4t and android bootloaders. But it does add a few new dtb
> > > check lines.
> >
> > I don't adding new DTC warnings, especially ones that we know up front
> > we can never get rid of. The memory one is a notable exception because
> > the system becomes unusable without it.
> >
> > ramoops is not in that same category. While it's certainly nice to have=
,
> > I don't think it's critical enough to warrant that permanent exception.
> > Where possible I think we need to work to address issues souch as this
> > at the root and fix bootloaders to do the right thing.
> >
> > For any cases where we can't fix the bootloaders, I think that's
> > something we have to live with. Having the support for this live in a
> > fork is a fair compromise, I think.
> >
> > I know this is frustrating, and it's very painful for me personally
> > because I initially set out to redress a lot of these things and failed
> > to do so.
> >
> > However I can't justify accepting endless amounts of quirks upstream,
> > all of which would set a bad precedent, just for the sake of things
> > being upstream.
> >
> > Thierry
>
> Alright, so to make sure everything is on the same page, let me walk
> through the archs.
>
> T210: This fits within dt check requirements afaik. If I send a v2
> with only t210, would that patch be acceptable? Though, I would like
> to double check that my assumption about the arch is correct. The
> downstream 4.9 kernel does allocations for ramoop I can't quite track
> in the vendor code. I'm assuming that by matching what the downstream
> kernel picks, that it's within a large carveout that the bootloader
> will never touch. I've not seen any corruption in my use of it so far.
> Is this a safe assumption?
>
> T186: Software support for this arch is eol, so what the bootloader
> does cannot be changed. Presumably no other choice but to relegate to
> a commit in a fork or out of tree patches.
>
> T194: Some software support still exists for this arch in L4T r35. Is
> there any positive feedback on making bootloader changes to meet dt
> check requirements, or is it too late in the cycle?
>
> T234: Still has active software support in L4T r36. But essentially
> the same question as t194.
>
> T264: I assume whatever happens for t234 will be mirrored here.

Reminder about this set of questions.

Aaron
