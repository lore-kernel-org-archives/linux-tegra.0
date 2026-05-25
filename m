Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE71214B977
	for <linux-tegra@vger.kernel.org>; Mon, 25 May 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720236; cv=pass; b=CoYHSF66fdyQZOYH8QV8b5zzhXuAPYCqD/jsxCvNWPguoMvhsr4kSHXa8x859okaMFsRP/5ZYirJMJMvbVTjmhD3WrXEaddPZURoNjPtnAH+YggRsk28LxwGxv3G8W8un8Gp1l1fkaK5vK5eRs0dGsONsqvCNcJqjQDIpxVbmq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720236; c=relaxed/simple;
	bh=P0e9QPe2YCkGR4KhiV4PcnTIW8nV8j6ZmRvQc7zuxx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W24WsBFENz03fgaus1ZpMgfgaL9roxEGYFAHc84OCt1U7V3xHIUZpJiFkjQeRDPvOF/QIzI8+aKSVwFzatidrOAkSuUCai44pWIGjvsXOY+CWT2XuM7fEpbWYSScARGtRns9XfhVku2aLI8P0m9u0xXj+ZECDL2LKA8HlYrD0es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/o1+SZV; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/o1+SZV"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3044857f09aso4706649eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 25 May 2026 07:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779720234; cv=none;
        d=google.com; s=arc-20240605;
        b=RxOG8H3aJguSPoVqzgt8AYzohjzvRn1tESwQxxtE6CrPh8Fnde/6e7Vm8vw6OJ/X0u
         e9pqPUmAIBeOje1T20rShWMAgOrvm8qU7fw5VuXafKZg+yEOdpxiHz85T8Ap894G99xy
         4QDxfroZewiCLRE1zB950ciSdi5ocpxmcRg6rlp0Y+NrAZElEqMxPHJhzr1oB5bJe6Cf
         nYgSf2q58MIBQHy97hKfVPvdYiC/yBtXqQRmLv5ZUsYV5a1VEjepTmIkkY+Pigpc8bv6
         ole+8CWEvfHYq7J3/d3w6JrSip5hPh1mLxqtvQRy+5ZVhfnarZDTpvSTJbbk4j1ZW34S
         Eriw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        fh=mlL0SG9swMA0/IDYtoY1sS0jVcuvfvlHO46gf1WhL6o=;
        b=CP9t7d+DrhwW7woLuGcYPC13zZ51H2/Nu69JqVJjyoc8Mpacj/R67CH025esvK6UgU
         6C6KkFgOGb8HyPMca/SeyzrZD7Cyld4kbAMMPjcUv4TfmbGT3PDHOeFsBTrZubLhITA8
         vtpZYvkaE1hvyFvyLijjh+AcPTD7F36pM+zEtcbQGT4pGOAM7kmN1nOIigjDjPLNkuGB
         3HEr8ABswS1JDeCvGUgSo00Mhz4h3aJ9x72pK9r2EJSEQeVyXoN52qFup++ClcwrGpL+
         RzkKJfctvwgGCOLm7tmThWk0cqMSp6KxURHDmSfPBS1he47ZUFA2jYFDZIpspjnbLOqU
         h/hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720234; x=1780325034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        b=b/o1+SZVxx8jCQlCjooQ9+G1SIGr3V4E3+7dNCUDIHfz0BgsN8hSO5dfnKP39CVdNq
         Segiyvt4Y9J2ftQjoxYIz63NnQ/KqAuwr0KxZU8XeI2KQcTehxG0d5a1AB1j9V4oOqEw
         F9wOKzoSE/n9i7A14JD3SXmR2erEMoftfgfgsjEDqcCibXwy1rf+1SeMXOUKmy4vTE2D
         6EZoobGsRQ9RBSPhnKWe/AuCg1Jbm7Fw7pkvnQ1enWE9L9NrKHq6skBUedIl5vwQubE1
         tk0OakPVOS79iSIa+P1ekohDOXKFIu4LasK1GSNbqlOxv9WKjTynNB9LM097Dylpw5DJ
         fuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720234; x=1780325034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71wO09jVP9qmCd1Qkiubx2/BEe+jWKIUN5BAIH24AdA=;
        b=MGTfqxMdA3ec6pFqOySWhKxUmNP0UfhsnWuBGAAc/lUrVWs9VlS7qy8QNdjXJbGEkI
         fgGNA31uUkb31fSebr9YYuYITtXtsaB05OIjhhXdXb65ZO2NMNAr/RmiIfkV/7zQnAOQ
         8T52Nn0cWg3J7vFrdaAXT0CJXh2h5XXtkktry1YlzRDTmt5iXszKB2XrlEjgIdk84f3H
         mvIAZVue8VRm+r3D6kjdMtxZHZ1/uV+ivlKuEDwiHsBNE8o0jur1xIPfXFSt+cnwDE5j
         nNprU13kXjRLY3KcDnsT5E6ETZV3/dnpm7MBdsIYZXE3/m8iSJXIJskHVnhe7yjwcFSq
         KRcw==
X-Forwarded-Encrypted: i=1; AFNElJ9GB1D539sgxHC/jMhMVc3ndmirwqRFUfzDNXC/KHifsHom7GonH+tcOi2H0KKWMreOAKv4OVFAKhjSZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAC6a18VmzGzU7LnMC+UA8qiLHTxGBezVjiqQmXiB2eFfXNAc
	ah6yxXHYW+w77yA6EJd/jN44UEnwecSkG5EY24QrzLrYR8tlP2G81cmXRhcFU8Eqxkp4+OygHZ3
	jo5D63+GslZ0/44x1PHy5QoC6AaqOYXo=
X-Gm-Gg: Acq92OG9Dpuf/wIePFxmxIlAwEmiWHPiNqB3DKB0eSTw2BwGHV8Um07P+IEm4wVgAkO
	MIYy3WJ+acM6uxS3gYeQN1dz2AnrfXssF9Qlst0657Mn7GBFQ6pBLH/osO2Z1yjZJ21ISfkn7r4
	eobkVUdOh5t6iwdVwoZKU7pSK2HSZmoPEaMrQuFEzHS4sMwKwW98b1Ec4uqoDq1box6XPkEPPfj
	0DTQYrWHNV+ZrzDHtqb0aBcYZcU5LpC/JsmhJaCNn693Je3wpbBnKH7CXzPLxe3mG5BlR2NhtTr
	u5+Szrwz
X-Received: by 2002:a05:7301:198a:b0:2d8:7302:d3d with SMTP id
 5a478bee46e88-30448f4b600mr7027108eec.8.1779720233893; Mon, 25 May 2026
 07:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com> <20260523083013.46372-4-clamor95@gmail.com>
In-Reply-To: <20260523083013.46372-4-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 25 May 2026 17:43:42 +0300
X-Gm-Features: AVHnY4JqJNzX6TKO-WM02HYhrKkr3o1HkibMA_XK5sGKWAX5Jy68yUCNtw6-GnE
Message-ID: <CAPVz0n0jpnPFh0f=CWHufzZ+e24xsem5DFTKdFu6sczCLk08Fg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] usb: chipidea: tegra: Avoid controller/PHY init if
 bus is externally controlled
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> If the USB controller and PHY are externally controlled, then the
> registration of the controller and the PHY initialization should be
> skipped, since these configurations must be done by the device that
> controls the bus to work correctly.
>
> Since USB PHY in Tegra controls clock gates required by the controller
> itself, Chipidea core PHY management is not suitable for Tegra.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 32 ++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>

Hello there!

This patch is required because I could not find an acceptable way to
manually remove and add a platform device. I will explain the details
below and hope that someone can give me some suggestions on how to
handle this situation.

The Tegra USB controller is the root node, and it is bound and probed
automatically. This is perfectly fine for ordinary use cases. On the
other hand, the modem used in Tegra 3 devices requires the USB
controller to be registered at the exact moment when the modem is
ready to handle USB. If this window is not respected, the modem will
not expose the USB device, and all you get is a cascade of enumeration
failures.

The solution as I see it right now: The modem has a power sequencing
driver, and the USB controller can either be autoprobed and
unregistered in the pseq probe and then registered/unregistered in the
on/off sequences, or it can have a status =3D "reserved" set in the USB
node and manually register/unregister it during the pseq on/off
sequences. This would eliminate the need for this patch.

The problem I have faced is that I cannot properly and manually
control the USB controller driver to bind -> probe it and remove ->
unbind it from within powerseq.

Help is appreciated. Thanks!

Best regards,
Svyatoslav R.
