Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811D6158535;
	Thu,  3 Jul 2025 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560865; cv=none; b=Zb39fMGS27wpCCNxJGhoSwI0A7EJjFDBlaqaePOL37NM+x0A+dNE9ALvIDgUfTd63Xk1NssJd8OQUWyYEWQHso+2SADMsIrPc5IlOWQE0/mzWQFnVyvnrvQEtTdvu7AhIio/QfhaXw273AcppzC8Rahla1hxzVVxbE6kYZEbdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560865; c=relaxed/simple;
	bh=WdH4sBTuoMdc8vCQH2pqGoLuQIke7zGv5YkPaKRmBMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZf+UyGbC34ywan0Ac3TbxkL51NY/mBcjIY4pLmKD4wPPsPFBZW8pdjNRt/xFJrAb6hPG/RcPZe10w25JiZqaN00nsjagqAwS6TLTuXEerpLW8u7Uxdbb08zsi1UU4XSLEjahDWKFEwbgSn7FEnDDMNz0JHDRKnK3j2SWuaT1Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ere3aHR+; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ere3aHR+"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5562838ce68so118729e87.2;
        Thu, 03 Jul 2025 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751560861; x=1752165661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdH4sBTuoMdc8vCQH2pqGoLuQIke7zGv5YkPaKRmBMY=;
        b=Ere3aHR+P0/IRabtsic4GmdC3hMY7RzPqV4KQLz1jDLNgPjEPIYeO6o5Tz+iPMpbUf
         P4P4dTVwR+1LfslVLYilefdsU/WQEs5OmQ/QfV1uAgEcaFlaEqDOln2XtFwVvBVtKHas
         lj/leJzHjfHCU4ULPMBrWDWallsZyvQON1GAAt/Rb9bdU1JAt0Kh8gDEpilVwsBzinlZ
         jtHewR1keOOj4JK3dHyVrL1axvwbMbrM6q7XWkKLVQdZVbPKoUsYekzG2XUBLeBAtrN1
         Nvn/LwjkS/FQq9gHfnl57LgtF/gVMhLVVIMeJQ/2VELQSZ8dSeQW0iZits+cpA7PT6Tn
         8pAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560861; x=1752165661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdH4sBTuoMdc8vCQH2pqGoLuQIke7zGv5YkPaKRmBMY=;
        b=EbPK49UDsgRv2MKjgzsVbMHrnfXYpBSRd2Yq0a2+kHSFakl1sl4+3rXgczJcEzXtFf
         lFvZAqCfjtuRuu8YqInmMsZ5F+B7jK+k1d6BGtp6k97OBYFCuN3SG2WMWjmSCoDJN3Qy
         vrBtn7GxRdr4i2syTqJKZlgc2PQ3kGpDEWCQQb137NhtFWQvZl9/XFqmnVMY/q8lOH+3
         x4j7aCe9cXdzzJ78k9okUvdaAFwX399LfFx/VbQrSfSiBeNdsgx7x0jR87F+QwswLde2
         GE5gE7OyY7AAhg2AkWX7mvCKBRa3ZVA03gzJPWqDTUk9Qq7I9dIeYv/xIuzS66mlEuOh
         7y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWApgyYoGKznroKbY8wx5tgEzjeE/iqWWoexPl9WCSKjBhEVZC49KF67uwflG71dXbDSrvtMIuJd7JV@vger.kernel.org, AJvYcCWB8uV520m6oWPdsiNN6u2dLaTDUtXpl5af6yKxVtGawZusTmIUMNlZgADXPZG93Rgf2pAryppl+gT/sDon@vger.kernel.org, AJvYcCXb1y8TO9erQkRznfHTgqPzmJyFi3x3SQPtevcN5DIMqyT/Qvjb8BNWkrx2LAbeUk/olT3l+4FWdqu6hz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPWoejCj8iOgSlpvwRb3Ybz2pvjGobTp4VOpfA0Do2lh8D1dT
	pTYqbHOwhXwTWNHURDl0V98QzvgrQGTPP3Xs2AG+1tFlYLs+2E+KtgGQ1qtVxYqTEcbyA0C8Lg0
	R6V1HD6K9BCTa8z4PJuue51qTI/kDZ+o=
X-Gm-Gg: ASbGncsjffkyOJKoHRblKu0QK5HOroMDQFW+tjA1TEVwh8LaY5FjHCfmxvea9fDEjyp
	8iz4qDfS7Nbw34zaqEvVVWhlCWh/4LNN8o4dfLRZUXhTPfbTxM/6mCjmajCj5qszIFoAnvd454Q
	xBhSNffLPKtXuB4j09ukhAbcycYP6oncXNWGODEQxhMXw=
X-Google-Smtp-Source: AGHT+IEKPGqxoBPyYO7oEQAAR+E5wt2+iHGhdlTdIjwJAOyj7LpnwTL2E17vH4/krE9C5LBajTRe0s14jyvKE4qvQqU=
X-Received: by 2002:a05:6512:3c88:b0:554:f9c5:6b30 with SMTP id
 2adb3069b0e04-5562eef54f1mr1432503e87.38.1751560860978; Thu, 03 Jul 2025
 09:41:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-mts-bug-v1-1-78500613f02c@gmail.com>
 <CALHNRZ_7wChDsvpUnQHnOTT9VzT1Lgg8JYgg13AFV8Jg_3itwQ@mail.gmail.com>
 <nuicekbfdgjbfudtlul74ifsqckfg6itybb76bkzuaxfcp5ve5@yevlttgtobxy> <CABr+WTnn2qOXEMCiRDywySAxn0UeKAcx5XOJNpn731tXxbCPDQ@mail.gmail.com>
In-Reply-To: <CABr+WTnn2qOXEMCiRDywySAxn0UeKAcx5XOJNpn731tXxbCPDQ@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 3 Jul 2025 11:40:49 -0500
X-Gm-Features: Ac12FXyw2cWLiolTgqYlITN0f61RfhoSLbyAs5KERbqnbb-BOrtGxa3SWwJfwas
Message-ID: <CALHNRZ_T_-FDOhLsjr7Vm3V0ekKkLCtv+Lt0x07133Cq+62cfQ@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: tegra: Add reserved-memory node for P3450
To: Nicolas Chauvet <kwizart@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 11:24=E2=80=AFAM Nicolas Chauvet <kwizart@gmail.com>=
 wrote:
>
> Le jeu. 3 juil. 2025 =C3=A0 13:00, Thierry Reding
> <thierry.reding@gmail.com> a =C3=A9crit :
> >
> > On Mon, May 26, 2025 at 02:07:35PM -0500, Aaron Kling wrote:
> > > On Mon, May 26, 2025 at 2:06=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > >
> > > > The Tegra210 L4T bootloader ram training will corrupt the in-ram ke=
rnel
> > > > dt if no reserved-memory node exists. This prevents said bootloader=
 from
> > > > being able to boot a kernel without this node, unless a chainloaded
> > > > bootloader loads the dt. Add the node to eliminate the requirement =
for
> > > > extra boot stages.
>
> Is there any particular reason why this applies on jetson-nano but not
> jetson-tx1 (or any other l4t based boards ?)

I answered that in my first reply to this patch. This does also apply
to p2371-2180, aka the Jetson TX1 devkit, but I don't need it for my
use case because it is supported by the android bootloader. To my
knowledge, there are not any other supported t210 devices that use the
l4t bootloader. And this is not a problem on other archs. If there's a
desire, I can replicate this to p2371-2180 and send a v2 without the
rfc tag. Probably better to do so for consistency anyways.

> I wonder if it would be enough to boot an upstream kernel with the l4t
> bootloader (and no chainloaded upstream u-boot) as I cannot do the
> other way for some reason (using fedora based upstream u-boot cannot
> boot downstream l4t kernel anymore)

Mmm, I'm not sure. I can boot a mainline kernel on the l4t bootloader
without u-boot after this patch. But my use case is android. I've also
booted a simple busybox initramfs to do non-android verification of
changes. But I've not booted a full Linux distro.

Aaron
