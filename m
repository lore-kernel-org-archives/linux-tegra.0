Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22811FE45A
	for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757859886; cv=none; b=uZ1QxjOR3cahp3iatWSU3f9h18qz/F1CLswwykbGWziEpDJrYPmGZN7yFRoIkKpTFSrVObk7nfsizFemvj5oEpmOPrOSKxWZ/fxZT/MHEdgJKsjIkweDOmf0HGQ/HsNOupvr1boyeakxa3KYQxK1/9LfRYVjNzbXjHr3f50+5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757859886; c=relaxed/simple;
	bh=W9lhcPQWYJCkan7KXgFZubDkcctJGU3MKVzKoE7qJJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5Fqxl4kH/10+JwOHZoi2pdSrK1D4x3udep0LoAk6gchXs203aM4to1UeQLkEXZhiyf1qs1Hyo5t9jzGr2eIkF+73ND76tSRCp6GteK9lZJAE6wEtW7mNsePTmtAjkdEKAEjZsZYieuo/NLNBCTeh7l8ZgwORImpJZTZuwIAFXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOUlbR7E; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOUlbR7E"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57171d58ebfso1672366e87.0
        for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 07:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859883; x=1758464683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOL0NG0zrkRA/YQSYESdMqzkPZLcb4cVfP68XzHxZyE=;
        b=OOUlbR7EyCHxqtSIAxrA+u/f/9oGKZIcudmDCPjEcQBVLCDI46rpKpnHLYnsXq+zrJ
         His8MFiZVkZpPkF1bwSyESdD6vVYgblpPc2oW0U5Y++ajqWwIEQ7g1D61bRz67Bshkh5
         tfQpVB8vUflQK+Us/F9cqM/SnGwqTg25YKHO9KTdbvrv8QBeeMyfbf4hxpeJOUq51ovI
         IYqg2Fv87XpIus0qgP0CAA6EFC9AhfaSartmhoXeny2dEqWigG5RPxueWkf96BamFY44
         DJhc4dGvH/z8ulLn2y/GMkVdKiBipYt47/L3SgiQz12P64u6a00VtSy+0mBoeIezf9Do
         s+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859883; x=1758464683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOL0NG0zrkRA/YQSYESdMqzkPZLcb4cVfP68XzHxZyE=;
        b=Ebt/xXv9mB1v2N5rd3U7hmhC6VnjXjChq4lzz+/KyUjn2TSK7w3fTD8DS1a44X5EhU
         31gIeR/JNBs0BT3tnauNk2HVOYFaDnYJZaw2XES67UmGhrdAkfzsIt1xT3t3U+vOCBoa
         t2ekHBUzEUfRgOSnvRbzmTmkORUGf0rk1xGVzPWiHXgr9oWj4Q17GCPoWs00iBScDD5d
         UF5ZXQUx+7FtQAjTXNn7Y7STFD2zPcvk7LeFNE8vFPg6XefvgGn24GQ+ZEelbEEGX/7q
         ft5T/VmQgRnTPOKQdJOtmw+siCWBjSQ7tZVYBqQHadNsjC0W0kw8QzMk+ZprsCGiFaui
         adgA==
X-Forwarded-Encrypted: i=1; AJvYcCXcR5QVyXJHh79Eph+k2MHGMkN+KzBbscKRYwl8S/GZ2bEJI47ytOwsNiVVhfYlZ1Qq2+sZJaaKowin9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMmGaRWwcqZrp+x5WgPyABJYxfapYaY2aWGfyUYofdq0rlWsD
	ev42L9t6a2oi+thA25g2I9CZ5ga/AV31hTexeAs/b9fTK849InuKgVJfaOBYNPzdefKr2vTtuW8
	PSxgYTfsRUqWbY5yLJ8Dq+fc+aCYr97E=
X-Gm-Gg: ASbGncsAzRi9XvmuELm8gN7pE5RcX4RsKyUd2cvUx2nr1OvuFdA2xcmqrYYOpsFbdu3
	LYjdlUtJeJxpzXl1DsLMwg6Shf66CXdkwf4tlUyHjpy2VB9qQDjcMv14+2tznyg8ZWOnquBSoGf
	ocOhjhotfv7VdZPqVKy/e5QUHGdomQld23EKRbekz41fizNwKe2u7kZOwrwlh5h+jN2UhyhFOjd
	d7FNCRaIdQSeoif8w==
X-Google-Smtp-Source: AGHT+IGlv2ax57xdAxcgpKY7t6yHDH97U54LvSlSNzVOFQKCGM9THTfZg99iHUHNfg3ngRBiUo+Ka2Gu4jNs1BVijrs=
X-Received: by 2002:a05:6512:1256:b0:55f:6bc8:19b7 with SMTP id
 2adb3069b0e04-56d79b23437mr4070925e87.15.1757859882794; Sun, 14 Sep 2025
 07:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
 <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
 <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com>
 <CALHNRZ9zfjV-ZttJd_ydgEaWk7XB+3YPfKGuYXLBL9qA8Exv0g@mail.gmail.com>
 <CALHNRZ-HTFz38xZFsbpG6C3r_xDQTLNOZWPX21TzNPaLyxf6Xw@mail.gmail.com>
 <xmirimw2guubgrf6umt4qiknpyjaepkrx4oggcmaffoyd5sli2@kzewnjv3bkjf> <CALHNRZ9uJ9g6BGhUmBaaMM3DhQDh7mTtqKKr0A98X-5V4ompEg@mail.gmail.com>
In-Reply-To: <CALHNRZ9uJ9g6BGhUmBaaMM3DhQDh7mTtqKKr0A98X-5V4ompEg@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 14 Sep 2025 09:24:31 -0500
X-Gm-Features: Ac12FXy5JXU7gOyeU6ClkGO-LvqM22dVNb4lFs5nwsHzDncJiwk16On4YrZpLD0
Message-ID: <CALHNRZ-7LFz=C70hWBPox2EYD-t=Cs-buN+N=4xVGaNHg41ahg@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 1:56=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Fri, Aug 1, 2025 at 4:43=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Thu, Jul 31, 2025 at 04:36:17PM -0500, Aaron Kling wrote:
> > > On Mon, Jul 14, 2025 at 12:35=E2=80=AFAM Aaron Kling <webgeek1234@gma=
il.com> wrote:
> > > >
> > > > On Mon, Jun 30, 2025 at 2:27=E2=80=AFPM Aaron Kling <webgeek1234@gm=
ail.com> wrote:
> > > > >
> > > > > On Wed, May 28, 2025 at 12:42=E2=80=AFPM Aaron Kling <webgeek1234=
@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Rela=
y
> > > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > > >
> > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > >
> > > > > > > The p3509 carrier board does not connect the id gpio. Prior t=
o this, the
> > > > > > > gpio role switch driver could not detect the mode of the otg =
port.
> > > > > > >
> > > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt=
s | 1 -
> > > > > > >  1 file changed, 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p=
3636-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.d=
ts
> > > > > > > index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409=
df355bbcb691ef99b0d0c9d504e 100644
> > > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-00=
01.dts
> > > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-00=
01.dts
> > > > > > > @@ -669,7 +669,6 @@ connector {
> > > > > > >                                         vbus-gpios =3D <&gpio
> > > > > > >                                                       TEGRA18=
6_MAIN_GPIO(L, 4)
> > > > > > >                                                       GPIO_AC=
TIVE_LOW>;
> > > > > > > -                                       id-gpios =3D <&pmic 0=
 GPIO_ACTIVE_HIGH>;
> > > > > > >                                 };
> > > > > > >                         };
> > > > > > >
> > > > > > >
> > > > > > > ---
> > > > > > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > > > > > change-id: 20250513-tx2nx-role-switch-37ec55d25189
> > > > > > >
> > > > > > > Best regards,
> > > > > > > --
> > > > > > > Aaron Kling <webgeek1234@gmail.com>
> > > > > > >
> > > > > > >
> > > > > >
> > > > > > Friendly reminder about this patch.
> > > > >
> > > > > Re-reminder about this patch.
> > > >
> > > > Yet another reminder about this patch. It's been over two months
> > > > without a response and many other patches have been pulled in the
> > > > meantime.
> > >
> > > Reminder yet again about this patch. It's now been two and a half
> > > months without even an acknowledgement from the maintainers.
> > >
> > > This one is getting annoying. What does it take to get a response fro=
m
> > > the tegra subsystem maintainers? Does time have to be pre-allocated b=
y
> > > the company to look at patches that aren't from @nvidia.com's? Are
> > > there certain times during a development cycle? When responses happen=
,
> > > it seems like there's a lot of activity. But then everything goes
> > > silent again for months. I've not seen any pattern to it so far and
> > > it's becoming extremely frustrating.
> >
> > Just people being busy. Nothing more, nothing less. I'll pick this up
> > once the merge window closes.
>
> If I understand correctly, the merge window closed on August 10th. And
> I still haven't seen any movement on open patches. If everything
> unrelated is on hold until after Tegra264 launch or something like
> that, it would be nice to at least set that expectation instead of
> everything being held arbitrarily in suspense.

Is there any intent to pick up this or any of my other pending patches
for 6.18? Once again, I see many other things queued for 6.18-rc1, but
not this. This was sent in before 6.16-rc1, and now looks to be missed
even on 6.18.

Aaron
