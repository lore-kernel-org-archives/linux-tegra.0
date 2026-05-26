Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBE3CAE66
	for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789854; cv=pass; b=Q2L+8APtQcSPHQijGicVwjGE7MfV6sQq/1aY/fCl7zqf7medXj8bb9aPZX5MN4YDVhPctdkLadWxlFFJaPzsIGF90MaE7kAMWuqfbTE5BK5G2j3WL2b5v5jHHMR98qG332JmBKUt+JEiXcyyPFYGxgvaRvg1uzPihl79VcUm6Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789854; c=relaxed/simple;
	bh=6JdPCZF7Dk+LCK/fQNMCvQ7TciVuLce0qtseH2AlqEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7DjapCezv1DP5YOcBrcBeXIysDZpDHiepeLt8hLb/u2WiLTyoLshXDOC3Ud8loZLdHNw1ARES9tQ7cVMzzjKR9KjZTOeMMlC/vnxDC17+mZMbYfEEAbCGDV/ibBRc4SmcCi+bFc/DAH3LRnAk6lLFjAReF07PhGvLBd2HGdPMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8kZupkx; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8kZupkx"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304997cdb21so1661551eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 26 May 2026 03:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789852; cv=none;
        d=google.com; s=arc-20240605;
        b=dSilLQr7Q6BsX9cCLlz1FWrp54f4SBnIguSCComxnzsKyqYOVP3XFm2pv3iuq2agzj
         p0cFeQLJ7NIz7NcPrrZ4dd0PNCi84JAxb74wnJnWMJzL35NQu/XRhPKxv7KVoxlmSQ8s
         VJfETaZt+IvpvNo9HLdKhrhp8SphxBGZa0ltopwLRSpBIa51+z3s/NWzUphefWuZ576W
         abg1eXap42lMc2C0fIc1ON/Is9VyEmljxQwBCtXE3whSPgH4I0dMpbzG9DQRV7qNfhX/
         EE1f6VTfW7KADaWPqwtXcK6NR0+tfwgdVlMC+tNH7HmXPeRGeBhf2QlSN6oQoZuQn6AH
         8jLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=is3W8B8GsxatajI5hJo1ERga8VuNN1wrfiQOz6wOJ7A=;
        fh=EFxXDnVY6cEu39RA8Oy3L+D+vXGX/K0b1ev2uqW02Dg=;
        b=EOrP6FtklKYJ9ltHynIb8ZFfNJVzvSZEvieaLlf1ovc5d3CbSeQ8trr5uhE1sc3B4f
         Kk6n5RznM75qtHnETjpSGbdEb6APVUVnWtize2TgFqyFd5iO0LDD+gOmOHfjwoS3uzOT
         jk2QPhFQINMbbALRhDYwt4fm4spz9sAUsUJIHhFtFQLfIein2hzPazkh5isUSf+w/XtW
         pjnPaRZnTvqZLSjXXUIGhALfNq3gm+hkdS/AFW/M629DV8yi5wzbyRF7J7Qoa0qFYpLA
         SeTTVfjyinit6tDYc5HNu/JRFaojutqFhVkY691zhEDGZsktFUeTzz1FbX67sdcnVMsA
         0+8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789852; x=1780394652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is3W8B8GsxatajI5hJo1ERga8VuNN1wrfiQOz6wOJ7A=;
        b=V8kZupkxI/vE6LNmfw+m5id719UJZN+8pHBqJQfq9WNiMxBM28M1L7LMN9KFuHxigy
         hwvP1ysr5IjDocyqcfOCI9p8kgJF0t2/fdewG+AOwI5Z0tNbBpgpBNnDOHr5uOjkZZlu
         Qt1aoJGckN/eQsU6r5aosRy2wcH0JcEqtqXI5CjB3IDioRlu7+tUNbAxaOsdw4aMtyIV
         V3c9WaTcDvHh04DcVh+PoD7Uu6orfCRys22cihxrkoDkzQVQdTMAMWYaj2J4rNRFihtb
         lp8qaHB43eNJXbpzW3yQXZRNR0NKdnSbi2gD8RQES9F9NrD/MZKwPRSAotMOASG9YTVs
         2qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789852; x=1780394652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=is3W8B8GsxatajI5hJo1ERga8VuNN1wrfiQOz6wOJ7A=;
        b=XwDxxoHrJX7G0idNlmbGrx6vKXdFrDeKGKyNPdjFyoWc+A4PvDoxJVt35+OWU814+q
         z+Gi/CBAbvwn1GHy8D3NcJxutQO4MFTH3whoQ0iMgshjwF5065iVe8xA6ODl8j6ByIqo
         PVlZfelH+X6zMN5z0ruODYideuyH1zRF9RtpnWNBOHtF9QrbgRye+DcUwuWjxxn5SG6D
         fYDzt3GmJhqCEHA8SFfqSkl2bpo0/oqVphZnrXFLd6d+wft0ztF8UR6pO+PTWGSjZZpe
         LcPUJlwO3848sJF6gdjTBoIhKG9QOt3nALfyctPGDmCc2s6C3TW7n7kHxaCu54VJM2Bv
         a0mA==
X-Forwarded-Encrypted: i=1; AFNElJ+B+/1g4su5xzwIN6+GwbmlPhuYjihV1GYYPR+GkSk2U71QYPXIqYXrcPyF5YHp1fUwCoKilqhmLtFE3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtNIY96vEXrwKiDKkw9/QeRzuhcnzEnM1WBI/r0qUWBYt8PpcW
	Pjmw7RIjBR2+Bsc/E/m62+Qe7A62LGvZVmRDIWtNZz2z94vcVPm/54SGnGD3Pi1UkWAFfA+wW+R
	ND9HWO09zV6Ufp+FbxikicXR8mcnPpsk=
X-Gm-Gg: Acq92OH54QOSVTUv8VVX8eNASua6KQEwwsttZuwTCvPs/ee1LlGNquBJjgBM2B57nz8
	bvh44SijtNSr3nyd16qqBFawhCj1r57tw7pUiJrhYfyyqwYuWhntEe4bHKZFanokDYugcC6cs/8
	ogm/7dKtvoD97HEAD9cJkz3XzM39Vmd2X5Z5yPnJuvrqQuhDdRbA/p23PuBu0exoFiZJD02HnEW
	5Cgi2PmTOnakdHe18fud0MIwnEFE9bPKXWUHnwfGz1apkkLfWTzMjausxodTdMWhn+xNGjAqgbo
	/ZhbGRtktW5CNiK4vDU=
X-Received: by 2002:a05:7300:e826:b0:304:8881:b82 with SMTP id
 5a478bee46e88-30488810bd7mr2815420eec.1.1779789852421; Tue, 26 May 2026
 03:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 13:03:59 +0300
X-Gm-Features: AVHnY4JzVg_O8P7k26t8Ze2LsHov-mbPzQTfo6cA9NaMmsFopTOCr3ZbuuFWfFQ
Message-ID: <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:5=
1 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> >
> > Document the Tegra modem pwseq used by various devices based on the Nvi=
dia
> > Tegra SoC, describing its usage. The power sequence provides interactio=
n
> > between the modem and SoC-specific interface configurations.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
>
> ...
>
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    pwrseq-modem {
> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> > +
> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> > +        power-supply =3D <&vdd_3v3_vbat>;
> > +
> > +        nvidia,usb-bus =3D <&usb2>;
> > +    };
> > --
> > 2.51.0
> >
>
> I assume there's no such component as the tegra modem *pwrseq*?

Hardware component, I assume no.

> What is the relationship between this node and the "infineon,xmm6260"
> compatible node?
>

The xmm6260 has a phandle reference to it. Since there is consumer
matching logic in the pwrseq driver I am leaning towards removing this
node entirely. This patches is still in non-final stage and I would
like to hear any opinions on the way to improving it.

> Bart
