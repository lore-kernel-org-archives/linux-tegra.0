Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0D17DFE7;
	Mon, 11 Aug 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900144; cv=none; b=DrwrTfxYbZIuiLjbg561ydvUlz04DHFriQaHK45EfWDGPC/UwFzT1cSiO/Fsu5webRDPvlW9KGuchxDuBnhzAMbr8gGa4wp2a26kT9EK95BpkG4gbzOtHi+3AyTF0g+NlTQRTLrxVXx+JJ3vjgzCP57QdSKmUCFRd/K0AitoEsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900144; c=relaxed/simple;
	bh=6l+kIPrtTOld9kfiiJFN90DL8QZo5I1DAmpfABaUThk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEPC48758tB2QCJ7fMyzwJ/vkall8MgXzBGkvh+cgrJsjd9GjVZh31CJ6xyeR1I2O8Eh/rOjiOTSwmTRVecItLWn757ULnZMchddfe4z6pB8PJN2nzHO7Jzfbg7d2qigUS1Kck8YEKOcFYkMXw6++JEKxqA84+IP2kfidcmjllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikrI2Yux; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikrI2Yux"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so2558586f8f.3;
        Mon, 11 Aug 2025 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754900141; x=1755504941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i/21xnbMhiQmAEs/HYi6PR/TYpOSV7Dr+9Icq4dAgg=;
        b=ikrI2YuxKtY+5lxZQRdHyk057WNt7B52/1D5KNBXZ0758EH4A/UHQ92ukSXKa9rCaS
         Z+jpjvzwYffRCk3uAdl2ZkQLK2tZkEZpvR658QLAzcpfrJCuGE1+Ka6MrDq8NrWv8FnQ
         ONCpcSO7sDVFo8RI8udftSxi2BtxOrSydCHky16ujoGLAIFIZomD5K/Zhqqh5vEQS16y
         P8nKEb2HidTIgTXfKBlcGo9I0FHrT5q7EOYkgQvvyzxzHnZ9K/O3rtmgmQhiiOlTmDeO
         C3Q/cpfbDetDn6D+f85GLmIk0UgZcWSWtb7DMCPHPx6MNlXWvkdO22tcIt4gnQi/0KEF
         jy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900141; x=1755504941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2i/21xnbMhiQmAEs/HYi6PR/TYpOSV7Dr+9Icq4dAgg=;
        b=oqfljDjAdQJ3/bhLPgcDZKBcnVGW/Nc8sqZpNrHp+NhXhXEevNPH3e7JtmSnak90C3
         JtGV1wz05dc7uHunz4nLUm3GS8Tmer9dpwWI5xh8tiZuaK01NZU8W4CT4frV5oi5BVBu
         o36DEJQLkEOcoc8v2zzRavhpy/WIcgX8AEHajGhigUzRrsNED8IPXyuJtmC3NqoizW9T
         8ITdx82I9BAIfG5HyvMwVzp+s1riAsYpF2xw53Wdw9a6Wur1ASxMDPUAnVXcfmxAxYnN
         IyWDyNftX7CkGiyeeKN9E5tPVm3MvqT0PySkOAbhFprXiDYD4KuoaS0U8X4qUyCQVIdn
         6g7A==
X-Forwarded-Encrypted: i=1; AJvYcCVHbwuweInZ/QUsu9gcJIlKP5o9ZkXUouuWXpanVbLmkMYQYqIOUytMHN5n++yA9kDjJuNtkleUv22NH3Em@vger.kernel.org, AJvYcCVwtutzKZYVXnamP5n8O782dciYjlFYTHgaAMTSOODZU3HgT+pdk2+78LR7tHxP/onB3q5/UNPx0uWkpyE=@vger.kernel.org, AJvYcCXr4qlofaC5CoXHkMQtskXmmuGNrgYcAkahGW4JvsDX/e95DT9BTcsB4neO7d/0WM9vBye23VX7o93T@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbY2R1+dCe/BEjOU7bGRx7PyZh+lZz3VQXdjy7WdMPSXHWtOj
	dthrOumFZRtQa9hWs17WrRQ5Qz+DGxyg68ojjX6JxOaRhEgyk947UNcqKrOtZZxr0x3FVvn1ney
	1nzo3hxCbZ1EzOo7wm1T8bpU0KDTnGDPfWfGw
X-Gm-Gg: ASbGncuWExPa6nUOlWjg6DPMm28ttquIi0dH5scnUMJiTxty/wNaAUGnqslbcjNzD/p
	RwHhXJJAS2qITuJCwrwGWNuThhIjJ6HlhtZ4t+Y3cw+sYeuck6zVF3bwjnNfQsiDbt6zLfPmO2Q
	mefEwETEfznZ+v7TXqkTRzRck9FE8kLYd2kFQWSrIxHbE9dldKqKj5tA5NCnChWJgacdb03knz+
	2DsmqVJ
X-Google-Smtp-Source: AGHT+IFrXyW3WnoaVgzkRQmm/tTcl+vQfD/WIMcNw/CuErG9CVALCzU+fiaaNb+FMYO9B7wLoNqZwjwCRaQXpj0ZQsw=
X-Received: by 2002:a5d:5886:0:b0:3a4:fbaf:749e with SMTP id
 ffacd0b85a97d-3b900b50a59mr9026882f8f.49.1754900140728; Mon, 11 Aug 2025
 01:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504092324.10802-1-clamor95@gmail.com> <20250504092324.10802-2-clamor95@gmail.com>
 <20250512162439.GA3441216-robh@kernel.org> <CAPVz0n0j-pMRgP0Kgfq=hHDQRRqF0Jvq_XqwTtnKo1hAUr4cHw@mail.gmail.com>
 <bc98d732-ea41-45bf-a269-f4f691243914@kernel.org>
In-Reply-To: <bc98d732-ea41-45bf-a269-f4f691243914@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 Aug 2025 11:15:29 +0300
X-Gm-Features: Ac12FXw8oyL8n94a1kk_DsJMeM6aN-Jl4TbRfbh4fNm_u2ycR7rV5G1SRj1riV8
Message-ID: <CAPVz0n13OB5fk1TySCP13h7ZotMERCMK=Tp1xTTVgA-qFrJNTw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: tegra: document EPP, ISP,
 MPE and TSEC for Tegra114+
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 11:1=
1 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 11/08/2025 10:01, Svyatoslav Ryhel wrote:
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  clocks:
> >>> +    maxItems: 1
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: tsec
> >>
> >> Drop -names properties if there is only 1.
> >
> > This is added to cover existing binding in tegra210 tree
>
> Existing binding? In what tree? This is mainline, we work only on
> mainline and that's a new binding, so you cannot use argument that there
> is broken code using it. Otherwise what stops anyone to push broken code
> and then claim binding has to look because "existing code has something
> like that"?
>

It seems that your words and action do not add up

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/=
arm64/boot/dts/nvidia/tegra210.dtsi?h=3Dv6.17-rc1#n181

>
> Best regards,
> Krzysztof
