Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC63728E17;
	Thu,  3 Jul 2025 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559853; cv=none; b=kUzlTFQPYzZ44FE50wWLksQRvVMfSPimbBuf8oScIoybmQGOy7G39naYbhrXn1x7GS/lfcyRuZHufZhHNQqo8dYrPvxkhmp9wqkIgzaepPc693tzzPgdDcMQPH+FSlwC855bJhPwJCakS6OmfkOioX8HX1iSt5iB87vCztsLUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559853; c=relaxed/simple;
	bh=ZattO5Mn2hbw8j6k+Ojc2VZsIcamMU7rl1sPrW/W0SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9r8EWEqPeQfDMdKRFSxSN6MG57YKidd9raHC4Aix5j5fZfwOrHlruUiOwpnlwMY6jeGhMyXquLkwPHm5+hh6jLj84zSvgjb348dWBn49MOlXFqJi+mDzbYvjAsNH8Qv99hdJtdG0s4f4olgLY2QxRg5btBRfrA0b+bGB1sOyrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEgCWzvH; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEgCWzvH"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-60f24b478e3so76176eaf.3;
        Thu, 03 Jul 2025 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751559850; x=1752164650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZattO5Mn2hbw8j6k+Ojc2VZsIcamMU7rl1sPrW/W0SA=;
        b=ZEgCWzvHLTVHSgww+IzCSNfW+8Ih7H+5gTka5NGtzjwlOSTSd2yudGQfJaR6ZdLFE2
         8woLK3hlCwW9YuvNC5lu2m3TlAGF4B1slPveL9pUCn+sSTTQfGQ7HZiwTysWgSTRxAjt
         WTuOdxIrURSEihndDtlTLwtR/Wsnxxlbs//PIoY3v1eTZwUKYOwOmHmm5m+00hVTGE7f
         2IJsra+44L7fAF0CX+rJE0HPDew+xxV7UiFM8DHLK2bPCsBGzTAJ3Mvzez9KHgMRtlRE
         VTMDpUXxj8Kxru0CClgxJqafkskjYT3HW6hzlPnEJ33T4AOFDKCa7GA43pMMfwRZG028
         M+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559850; x=1752164650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZattO5Mn2hbw8j6k+Ojc2VZsIcamMU7rl1sPrW/W0SA=;
        b=FKooUpFvffqwboSoGTlO5sNeDuN2CyMVdrU5In0Se8kLc0nOGoCXGN2xRuNIw4WSrB
         gxLAaeOLsDJpJFJpO20sFItlDNJkJ/Da+0mRljrXasGCAXiNKQMr1ARikB830ZQwj4lV
         9fEQfOLu7oirpJQnxtsWQQS1Alrg41jHiHSVD+nMpXIfXizQ1gwsKyIMnNl5xEFiIXn3
         pqBpFVJPtChjKr0zcqaWum+ZLuLyIG65sAAjgcEtzwAPANfUljRWi49ZaYADv4DhEV9S
         FrBXMIJXLre45LZmd4BtUziN9zshSZ6FL6NBnBGOk51DGELOP0QkStNj+r7bJEGbNjvA
         5UgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN1x5rV7vgUlgkpvME3J63XGxpbwODzo/3p5/VyNUEVKWSnWJkIw1maJDeZtyalxYLuc2B0lfQKuqb@vger.kernel.org, AJvYcCWTOCiaWU8W2FULAqqLVFYSbPK5uJFIaxma2QXlRvCN+sJRNIPnweWhiLhj1ILoWl8AL32t36Zyd6mL8DLi@vger.kernel.org, AJvYcCXyVwLUlW+lney2jqoMPzaEuj0J08/aBKTYI4N0yEFmUo/ZM/9Cbxa27FTaXg1IjeCNF/IIE37urApwK/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCAWBXn4NqLJTHGDYauzmsMJIL6CUMV8QXRPckv6AoCuBbpVYL
	uNHtL/vJK4bwcXpjGKZuma09ip7ihMJ6OP94nV1LQN8am4YNEAZ+706hZx6KIdkMOIAjKI8dANc
	4DGEzytVAseIERRs41dTQMsCe9cxSkqM=
X-Gm-Gg: ASbGncsUCtAD2BAY19faOwhvax/2CsfivtnG5E2Rsjw2B3g6ks5bJO2h7FQ3dsl7+Un
	rR3tvb/Ay91X4uV89eNxiq2krOZ6vMuFrgfy+Cs2t/bVxmD8hxjjZaQk/4+KJcKM1bY2q/OOYH0
	nsIGyy67iEm3vVCn+K+GLuSCO0+zrh3YI8oopYbful
X-Google-Smtp-Source: AGHT+IH23ww8t4Ksjbvw04Pw1dg6g23ybwLHvx+e9HpnjY0WklCP4KSUDd3Djui5CG6kL/P3nrBFNMGPKv5nAgOzn1k=
X-Received: by 2002:a05:6820:c8f:b0:611:e00a:598d with SMTP id
 006d021491bc7-6120116d82fmr5594771eaf.8.1751559849936; Thu, 03 Jul 2025
 09:24:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
 <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com> <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy>
In-Reply-To: <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Thu, 3 Jul 2025 18:23:58 +0200
X-Gm-Features: Ac12FXxB8p0am1jeHuRsG3pEC3-oMtt-Xsi26v4UVhYH88yQRdtMwuJ6D3jOGbA
Message-ID: <CABr+WTnn2qOXEMCiRDywySAxn0UeKAcx5XOJNpn731tXxbCPDQ@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Aaron Kling <webgeek1234@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 3 juil. 2025 =C3=A0 13:00, Thierry Reding
<thierry.reding@gmail.com> a =C3=A9crit :
>
> On Mon, May 26, 2025 at 02:07:35PM -0500, Aaron Kling wrote:
> > On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The Tegra210 L4T bootloader ram training will corrupt the in-ram kern=
el
> > > dt if no reserved-memory node exists. This prevents said bootloader f=
rom
> > > being able to boot a kernel without this node, unless a chainloaded
> > > bootloader loads the dt. Add the node to eliminate the requirement fo=
r
> > > extra boot stages.

Is there any particular reason why this applies on jetson-nano but not
jetson-tx1 (or any other l4t based boards ?)
I wonder if it would be enough to boot an upstream kernel with the l4t
bootloader (and no chainloaded upstream u-boot) as I cannot do the
other way for some reason (using fedora based upstream u-boot cannot
boot downstream l4t kernel anymore)

Thanks for the hints.
