Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0630B502
	for <linux-tegra@vger.kernel.org>; Mon,  6 Apr 2026 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461801; cv=pass; b=ic0Jcc/vFTVd9ms/zCn8zsmgwyGS8vnZc2DePoa9YxlrpP9Tlj5l692rr6w45yZxW9zVaDtJGGhOtCXxhO3LGwhg5dJnSD4wJoRAqVGQG4rOyWhg63vVvFR1Pm6nBfaXoJ2doQGroGFxI6GvmUEE+RKmlJLAAb+/hWWrLuBoIzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461801; c=relaxed/simple;
	bh=zJbr+eLaJjgs+tCMj7zqyWMZplQoYcu1uDFDJZ5r1BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jVGLjRLl3pGtEJTs72C+fiBSS0vr+mLaeEyXtXGPbElBEniMmGRObXowCF6yX4itbzVNhuiasj33BzTY3ZnBFaFd4rq9yWfpmbFHc6HikC0N82aY4MiQJWcg8bqk2rXvsCMp0vnk8lpfvFUP6F8nPMy+WkWLraDK4bKlwMmFcNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO7qslZc; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO7qslZc"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38dd8e7f131so18657581fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 06 Apr 2026 00:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775461798; cv=none;
        d=google.com; s=arc-20240605;
        b=YdkLkTyPfWZJ/aouiXVbRE4aFcLjK8toJxTYDPVRQJiZ+HPW+ZciF9pbnrFz/s5Cn3
         r3OqFpxP+hBZfTP+HDpzTO5HemFp501lqysg2DBf8goM6s1zKGqXPAPWCdUEL7QwDbc/
         i6mEXiPYIdNwAKHwP9URNKykd2Mbc3woZ3E673fkv41JtNaKdIYrasjfbjjemPFQpYVT
         Q+sliaPcF/ymCVSXAkwlhDIgzoHsKl/uvl0lXRP+GmtfqtGEAr0V+L67pObZGK1FwiIb
         rx87Sim2UJcwk0ZGvE0t0isz+tVfAemjMIh1vAr3LZeaiWOqxZkhUQf1GjwZu0MI6h5B
         GkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UnlbKDhrQ/0GPwm7Nbi+1dGWPAJMKskML1JTvCTlthA=;
        fh=9CJ+jx0giFabzlZ4KHOx+zQ+FPxOiFaLvjmVl1VrgzE=;
        b=dFPuc1mzO5vpKRBxCaeb2KfkJUcnghx7U7lia0YbV+lFxahj9+fASCS3AjnOuQk13w
         inBRin/BT4lCb8UviAHU3+2HxcFkLECN37tOWS2D923YMoN2TaU84Dt+b69aTi0wXG6N
         Hp6/zG9woIfnSJkJgvKNz6mTrxEyKdLrCsH0FwWyUOish3eVtRLMSF0+DShOiEItQIua
         8F+YMT4cP56TuZp2oBxWyZnN0CABlGg/kUOZhifkw1lbVIQ3z71LVxLOdp/yiynxMRn+
         19OBcyb4xoatzoYNuOh7EF2TEqcJdCcmJIAOezuCMRnBkHdYqusSRht3x/vR7AWPNy1x
         3P9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461798; x=1776066598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnlbKDhrQ/0GPwm7Nbi+1dGWPAJMKskML1JTvCTlthA=;
        b=cO7qslZcMnDSiTYUAY3JZQ4ED+YYvo2Gb4kCzucM01st+MgY7f1ffiRDQRsoLnJ+AB
         JItMauYenVFXiTPyEbMAiFGsktz/mvEAX/58nM2KzX7mPYCgorcciVAKGWCr9PtuHZTb
         k/wPWUVeADW4+jOxpaByrGWXCVBaB/JNjKFz1HYj9w5FCNL1jnDd0AU5hYLz8tas0iau
         4DU9rsbQMI9xoSi6mAJJ0badcE1Wd6WuL6hGBFoPHb86PLzk/81eh65QWZ7BkHpxqYb+
         fS+YH5Wmpy1kx9HEG/bpPyA7FAnE+OpW5U4yZNngpnSKWmV7zvIgZzVtPGqYZ+WMC7IB
         x0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461798; x=1776066598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnlbKDhrQ/0GPwm7Nbi+1dGWPAJMKskML1JTvCTlthA=;
        b=FH5yuLtrWwhFTGIsRUPurUR2WyjwsjTGyW4p9sk1r92/alHpQ2DNHTaYlxZbpJF85b
         4XD+aW0o1bWpNqoLJj/e/4Xma0Dso6yB1QX5JbwJUs0eEsXrlo3kKybJ9CaV/SSsmidt
         ChjaqHHdfAC2RmOeUcSD6Pwph3v0Sx0GF+0owktf3gdUJsCVJob6sdo/ZUvJDZ0X5q/J
         Dotex5B4shI4llGNRf0Zx8AuUnal1sfjXx1id+dNlvPSG0vQ2CR51i8L+GIdBPagDZrJ
         9jJxFZA+yngCoRKWtqUZVNH/B7KQMNLyTyg2hQvLCdWw8krJOIHsDv5aBS+KBrUoDItU
         dpPA==
X-Forwarded-Encrypted: i=1; AJvYcCVKBF1Ib8bQGv0TVmgqSi0wtBywrk23JLE5rUmpVdX8KXC101QvqjAMzki5c9bCqaNhlg4L6hNEboN/MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxqLKfUfOWXHNV/Zf/jaFE1gNXUxJwOZpOi6aDcvGm1G/f7iGk
	QKEd3j2d7AnqZHeN6eeiHr+FS3gX2tcc+an3472B6SHE/hfO6mZ6EgXAo3v3OmCQjfWNNY/mnYc
	Q1wzQSBTSlIM5VwefvUcc7GD68YeHtsY=
X-Gm-Gg: AeBDieuGerZsNkQMPnlqtAM+XqTQ6Cf9YonxG+O65nyE/ejVED+P1hQkkzgGU0H/I2o
	6W6PGvGk7+GPbaUEn1kO75qdMw0cpSQAfrSA/OldaCMTh59w6h3urstQyy0RlzFOAXmwLto+YxD
	9Y+PCxwpX0NFMbfkuZUNouc5L+uLRU/3xzbn/lMQ1XuNUmv1kDf4eNOwHgQ8bOuxbs4qGQ64YjS
	exSy0JifYtFboHq92PhP4sQvvehqMM52fePlBx0CQvpLlTCF9ldbuft0E5NSkzfrGUiH1GS/yJI
	WfioIrK3uE/etCYEx6L1qe6EYiA1X2mX/OEa55HV5xo4iPOTmg3eC0lR/NdjhxFwIGzb
X-Received: by 2002:a2e:a54a:0:b0:38d:eb82:d7e6 with SMTP id
 38308e7fff4ca-38deb82dbd4mr21958531fa.9.1775461797343; Mon, 06 Apr 2026
 00:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <CALHNRZ-YQe7_7UGfFNsBe6pdvFjK+1sS0Sye7od6WF+yqAYttQ@mail.gmail.com>
 <5289895.R56niFO833@senjougahara> <6462154.GXAFRqVoOG@senjougahara> <aZQ-cMn-3vI7UH7t@orome>
In-Reply-To: <aZQ-cMn-3vI7UH7t@orome>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 6 Apr 2026 02:49:45 -0500
X-Gm-Features: AQROBzCC1tvEeY_Oq5VJe6-2y9qjEvpxLUw9dYTCTAT-dENH2KliGiu6OEyML_0
Message-ID: <CALHNRZ8Zs2Zp80OgoU6R54=n76JgiYGbMvWD2iP9HpUFYO2big@mail.gmail.com>
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 4:13=E2=80=AFAM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> On Tue, Feb 17, 2026 at 12:53:54PM +0900, Mikko Perttunen wrote:
> > On Thursday, January 22, 2026 7:22=E2=80=AFPM Mikko Perttunen wrote:
> > > On Tuesday, December 9, 2025 1:21=E2=80=AFPM Aaron Kling wrote:
> > > > On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek1234@gm=
ail.com> wrote:
> > > > >
> > > > > On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.re=
ding@gmail.com> wrote:
> > > > > >
> > > > > > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > > > > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 Rel=
ay
> > > > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > > > >
> > > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > >
> > > > > > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4e1=
2.
> > > > > > > >
> > > > > > > > Mmu is now being enabled for the display controllers.
> > > > > > > >
> > > > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arc=
h/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46aa=
1d8eedcdfbae1fdde1374adf40337 100644
> > > > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > > > > > >                         #iommu-cells =3D <1>;
> > > > > > > >
> > > > > > > >                         nvidia,memory-controller =3D <&mc>;
> > > > > > > > -                       status =3D "disabled";
> > > > > > > > +                       status =3D "okay";
> > > > > > > >                 };
> > > > > > > >
> > > > > > > >                 smmu: iommu@12000000 {
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.51.0
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > Question for Jon as the author of the commit being reverted. =
The
> > > > > > > commit message states "we do not have a way to pass frame-buf=
fer
> > > > > > > memory from the bootloader to the kernel". If I understand th=
is
> > > > > > > correctly, this is talking about seamless handoff. What does =
this have
> > > > > > > to do with enabling mmu on the display controllers? Seamless =
does not
> > > > > > > work on any tegra arch as far as I'm aware, but Tegra194 is t=
he only
> > > > > > > one that doesn't have mmu enabled for the dc's. But enabling =
mmu
> > > > > > > allows for better and faster memory allocation. My initial at=
tempts to
> > > > > > > enable this didn't work because I tried to attach them to the=
 main mmu
> > > > > > > unit, see the related freedesktop issue [0]. After noticing i=
n the
> > > > > > > downstream dt that the dc's are on a separate unit, I made it=
 work.
> > > > > > > And so far, it seems to work just as well as Tegra186. Then w=
hen I was
> > > > > > > packaging up the change to submit, I found that this had been
> > > > > > > explicitly disabled. But I'm not seeing why. Am I missing som=
e
> > > > > > > additional factors?
> > > > > >
> > > > > > This isn't seamless handoff to the Tegra DRM driver for display=
, but
> > > > > > rather to simple-framebuffer. While this does technically work,=
 it also
> > > > > > causes a spew of SMMU faults during early boot because the firm=
ware does
> > > > > > not properly pass the SMMU mapping information to the kernel.
> > > > > >
> > > > > > In a nutshell what happens is that the firmware sets up the dis=
play
> > > > > > controller to scan out from a reserved memory region, but it do=
es so
> > > > > > without involving the SMMU, so it uses physical addresses direc=
tly. When
> > > > > > the kernel boots and the SMMU is enabled the continued accesses=
 from
> > > > > > display hardware cause SMMU faults (because there is no mapping=
 for the
> > > > > > framebuffer addresses).
> > > > > >
> > > > > > That said, we did solve these issues and this may not be happen=
ing
> > > > > > anymore with the most recent L4T releases, so it may be okay to=
 revert
> > > > > > this now. We should find out exactly which release includes all=
 the
> > > > > > needed changes so that it can be referenced in the commit messa=
ge. I
> > > > > > want to avoid people running new kernels with an old L4T releas=
e and
> > > > > > then seeing these errors without any reference as to why that m=
ight
> > > > > > suddenly happen.
> > > > >
> > > > > For reference, I have rolled back my Android usecase to use the L=
4T
> > > > > r32.7.6 bootloaders on T194 for a variety of reasons. So I am usi=
ng
> > > > > cboot as the final bootloader and not edk2 as in L4T r34/r35. I h=
ave a
> > > > > pending cboot patch to support simple-framebuffer handoff, but ha=
ven't
> > > > > fully verified it as tegra-drm is currently unable to takeover fr=
om
> > > > > simplefb like openrm does for t234. But all that to say that sinc=
e I
> > > > > no longer use r35 for t194 I don't have the setup to easily verif=
y
> > > > > which point release works here and what doesn't.
> > > >
> > > > Any further thoughts on this patch?
> > > >
> > > > Aaron
> > >
> > > FWIW,
> > >
> > > looks like the edk2 patch to update iommu-addresses --
> > >
> > > commit 6071946461389221d2314cbbae0377610b5b1f6a
> > > Author: Jan Bobek <jbobek@nvidia.com>
> > > Date:   Tue Mar 21 00:15:27 2023 +0000
> > >
> > >     feat(NvDisplayControllerDxe): update FDT with framebuffer info
> > >
> > >     On ready-to-boot and whenever FDT is installed, update FDT with
> > >     framebuffer mode information, base address and size.
> > >
> > >     Signed-off-by: Jan Bobek <jbobek@nvidia.com>
> > >     Reviewed-by: Ashish Singhal <ashishsingha@nvidia.com>
> > >
> > > is in since r36.2
> > >
> > > $ git tag --contains 6071946461389221d2314cbbae0377610b5b1f6a | grep =
"^r"
> > > r36.2
> > > r36.3.0
> > > r36.4.0
> > > r36.4.3
> > > r36.4.4
> > > r36.4.5
> > > r38.2
> > > r38.4
> > >
> > > Not so good for T194 since r36 only supports Orin.
> > >
> > > I'll look into getting this cherry-picked to r35.
> > >
> > > Mikko
> > >
> > >
> >
> > I looked into this and it appears a version of this is in r35, but it
> > only supports T234. However, I also found that at one point, L4T
> > bootloader configuration has been modified to place the display
> > controllers into SMMU bypass until otherwise configured by the kernel
> > -- which the kernel does in tegra_mc_probe_device.
> >
> > I think that means there is still potential for an issue where the
> > display continues to be on between tegra_mc_probe_device and tegradrm
> > reconfiguring it. However, I cannot reproduce that happening -- most
> > likely the display is being turned off before that because of a clock
> > or power domain being turned off.
> >
> > In any case, this means that we no longer need to pass the
> > framebuffer's information to the kernel. I think it would be good to
> > have some clarity to ensure the issue described above cannot happen,
> > but otherwise we should be able to enable IOMMU.
>
> The problem would happen if you enable some sort of early framebuffer
> support, such as simple-drm or simple-framebuffer. Maybe even efifb. I
> think it'd still be worth getting the iommu-addresses code into r35 if
> for nothing else but to have a bit more of a safety buffer for the
> future.
>
> If we don't and for some reason decide that we want early framebuffer
> support, it might be too late to get UEFI updated for Tegra194. I recall
> that the UEFI code for Tegra194 is different from the one for Tegra234,
> so it is probably not as trivial as a simple cherry-pick, but I'll try
> to do some digging and find the code that does this for Xavier.

Any updates on this?

Aaron
