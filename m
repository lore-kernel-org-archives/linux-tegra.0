Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BCE3E2752
	for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756362; cv=none; b=dlqNYuKllktq0UtU2doa/A9B2ORxb/gbq2f51XZD7A/jgbzVmVEMEplnrYfAHZ8q01HSPkeMgowmTwto3VPWgU7JKBFGJ2jrnaZpiPQvn9Bqwkvtb3szC+P/2PtF2yMGxq5HkodefEUe/5EWo0naXHq6bfWhyNvGVj54YBmtgGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756362; c=relaxed/simple;
	bh=VkTwmhS7TzdTxSZhQAoqMIViln/3/ikyYrQQ3InTDpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsaeiWo1W21STpbeuM74NxVZcKzJykbrrCVr6aFrJjFA/wTEvhfrC71nOCZaogxaKGgdkyj7fWtP/hsAu0FkC/4iSwgNwOb6rO8z/G2Smk2CcZh/9zXp+5daf5hEqAm+bONfSfKEB9V260+vo29Wfza1RMYXFBclyBjgydUpPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgvrTR7/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgvrTR7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747DBC2BCAF
	for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773756362;
	bh=VkTwmhS7TzdTxSZhQAoqMIViln/3/ikyYrQQ3InTDpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BgvrTR7/V505qTN+9HIbp/5Z8j+hurHuxQEqUimgLdzoVwAa75NtMqgqpeSKcdDyK
	 1/DZEJpijWh0OzJWjrPhtjpKJe+OCHVnUQv65vTB30npoROkMOrVcMfV8LzG6wpezE
	 KQrSk3kaq+4TR0Rhx6g59IdUQY/Aa2ulMc5ShFTTFWliiG2wbsHCUEfdDrzufPRH6y
	 oyhDMgsknS7f//Eogqhyu8GOo/zJV+ts+9MQOGpG12tipmLoEbhG8NuxUV/p+9Lb+t
	 KG9IdkxZWVQKX0xYXffQ1Ppd1JqyW4Uht5tVV9iUlqoXQFdAcAE3fJqvQXwQ+Q/F8k
	 mULeFcJgdMgkw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a133b686f7so573799e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 07:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqxur4oUR08nqY2b6fli+6zeOk/rZuJmGA12rhQAmZ7CEvZidVg78CT/pNlh4BvGhR0iC7yRKbqQdYtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7Li8cYz+0OXL7VRDfLkCBrGEa1THnSXUiagMyXn616zweiZG
	W6c5C3IzE4WPXKaaMBldSxsnbNmcpsFVgD+X95QiMK4tDUVw5Mm83gGVqrPw188RYjvOK8d9PvZ
	VWZom+VeCjwP/Jhde5EGW6fiERBk435JquIwYj9QGMw==
X-Received: by 2002:a19:550f:0:b0:5a1:3f63:c7e1 with SMTP id
 2adb3069b0e04-5a162b05c24mr4459138e87.26.1773756361113; Tue, 17 Mar 2026
 07:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com>
 <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com> <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
 <e217c9a6-e2a6-4413-8247-19b7ab72a53a@nvidia.com> <CAMRc=MfK_eqbWDdEQHHWgAyz-zMWyW5G=DF8eNh0o+iyt=BtOg@mail.gmail.com>
 <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
In-Reply-To: <d05d4468-84f7-4692-8381-e0742f1f2749@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 15:05:48 +0100
X-Gmail-Original-Message-ID: <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
X-Gm-Features: AaiRm52UZHEJJpMjZFLLpV4-eYvoDOZtpjOmkJhIKo4-4ig59CTtUtHJL3aQVU8
Message-ID: <CAMRc=McY9dcDLXPM8-QErxzAJuoe1bxy8BX5H2y0uCHXJSsAwA@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 2:47=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> >> I am not sure if this is because these are child nodes of gpio-keys?
> >> Obviously this is not a proper example, but something quick and dirty
> >> for local testing :-)
> >>
> >
> > Let me create a setup with GPIO keys then.
>
> Thanks!
> Jon
>

I can reproduce this with a gpio-keys setup. I think you hit an
interesting corner-case where the consumer device is the same for two
shared pins assigned to its child fwnodes. The setup doesn't make
sense really but I guess this shouldn't just fail like that.

Bart
