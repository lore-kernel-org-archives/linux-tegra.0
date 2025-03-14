Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45041EF09A
	for <linux-tegra@vger.kernel.org>; Fri, 14 Mar 2025 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741946670; cv=none; b=LJyvs02tQtL9tlqgSx94TWM8sNdX2Cs82CZ2a3mB2Y11NtxFDPKSMFys/sxc+VB2GuPoEAaakghXkDFg4R5FzMALUujYBBVaEyZphJmIUe5wA1/sruQHqYSaLZcpTrb0eCuJuDUJoXodd42XckwxJ9CCzwrewKr432+D08HDutg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741946670; c=relaxed/simple;
	bh=HrE09mKedOk9fo3MpK0rYjDRK3jK5wC9NgMIu9SSbyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsYOf7HQlNVViNDMdmq747urzgdt5/MIXRKKqWxxfHD+8INUlGLij7ydNFgdCfzS9nN2h039eJ0rnx6vBjDSDgLR9eWmD0c2LiWnDGfj88h2yxqEk7Rh7aBzrKPHyUbaRxG2jH3RNbVUrqme5qEyBysaWc53TyfpPFWyxIwpico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fRFz+CVT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fRFz+CVT"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30b83290b7bso19432671fa.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Mar 2025 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741946666; x=1742551466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrE09mKedOk9fo3MpK0rYjDRK3jK5wC9NgMIu9SSbyI=;
        b=fRFz+CVTQzcXSawwdIUbuElv9csN3dJzClHpjYLb3w4lsLtSB9c/zhswXlQOmhVd7e
         xBPENOMhpDOeMvEYDK2Oru5gLih8Fz6iGgCF/fVGKSTQ8iOZYaEk+vNBH4vEaIR4L3LH
         HcjTYvssraNPJ8G36kw/RVUscSMN7jO47FP1nQAcVDOBXQLRboWd2i7p934TsaeNOuAP
         rbzWVmDPJaYbSB+/VGn6X128UcJopmKrhls18ensxLsvxGXhOPcfJcXtNa1bPdF+KHrK
         hOIiQjXl7kHKgq4OdiIU9YwoBq+J9U6FESgqHRnxshlk4qNxGy8eRiC6IrSyw2Y5rgJM
         6Llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741946666; x=1742551466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrE09mKedOk9fo3MpK0rYjDRK3jK5wC9NgMIu9SSbyI=;
        b=dvl19Aov0M51JapCSvNAVroY5jeHayyZFIAATLSCBhuqyBD0mR5OqoAi4gD1njSszn
         p6NCbr7DW7SaDfUXFhk/AB1Q2/TWRBGsww1A15XaI+918csMJutnfYtotjPxrIJLCMj8
         Snw825gLzES0mZHL3Y8VQ4mJUKurjy0qxH91K0nKcCLAbzeggLynbo5d7DZsVtjgpCwn
         uYIgoNxjgAOAl13O9CigKgxDYwhMA0m8oUNpU0UKQz4BOF/YCdoQv5czM1Z84xOrrCRw
         cZZ51tXJk+HN2YH2KLGFmH1q+7hYQ8YuvJF6GMOmJoewDhGQvURhkJ6bW3nywJmWdVfB
         Ds5w==
X-Forwarded-Encrypted: i=1; AJvYcCXxJhA/jew9LPHMwU5L7pWeJAUH2gx6pgWDGbKAUQpTNr96jmg1QmL+j91OEA6M/Ej2vNvBpsJfxEJmMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHthNe5htPZS09J2YjJ0KaQV3/zsQ+JDazE7rsz27hD0TdBjO
	5/1FTuhPNOBMH9dlI0LBWaHWvqeb3dqOB8DIA65tu7EZaAvn/up555Y8jFg0uC6Ofmzy/KUyaM9
	UQ+6kR7MgbrqvOMt6n0v5WppWrmm1PvIp2FDqXA==
X-Gm-Gg: ASbGnctbt3oQr5dA5bX1gpTMWX0O6fdG36SqCYO0NmFLmw642DV6mWwxmraeJ2/XUB8
	Ec1sPNmf+LP0bWp80XVPOsvlVl3dVbdCEkdJgu+ETsRvPe6uE6Z6Tf7DqSX58E5LsE3wYLsydK0
	7PByCsH+nMe0t9JNjjtgzhUE4=
X-Google-Smtp-Source: AGHT+IGgoI83vSiToX3Ab2Md4G9QTPt2uvDlfvIFor3poPeFCoQq/Et8/x3cJtVhEho87JFB+bRoP0HoW39vS4Eny+4=
X-Received: by 2002:a05:6512:1386:b0:549:66d8:a1f3 with SMTP id
 2adb3069b0e04-549c39610d3mr518455e87.40.1741946665777; Fri, 14 Mar 2025
 03:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305104939.15168-1-pshete@nvidia.com>
In-Reply-To: <20250305104939.15168-1-pshete@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:04:14 +0100
X-Gm-Features: AQ5f1JoOEe7T9gHagqVccCbtiE4HvkyR3XLHW6KSzkjBygNKsQbkExvz7sXEKJw
Message-ID: <CACRpkdb_c5nfS-WsQdOViYw7nHQo7CfDkcSiVho7=Ufh15i9yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: Add descriptions for SoC data fields
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:50=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Add detailed descriptions for the remaining fields in the
> tegra_pinctrl_soc_data structure. This improves code documentation
> and clarifies the purpose of each field, particularly for the
> pin-specific configuration options.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Both patches applied!

Yours,
Linus Walleij
