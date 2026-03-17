Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968C43AE1BF
	for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773747912; cv=none; b=dLKVAZZuRNMaLjGypD2pXJtLzkIzFv79AWPPhE0S1874+bAOcfDi9rbm2rJRlYOBQe/QCl/kDMoKZaeeKCE0G3wiz/oJQTs0TV1d4GSFJsSLJtbZolaP1CVsDMW6JwCdfcBe+VGPoDhmpbBTObhbkieP8ts6kxwBZV5eRi6Ib6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773747912; c=relaxed/simple;
	bh=a6JGZHNLmDjgBE7UJX8DjOMfdT1XtVYSMErNAfhXIQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpKmOe7s/N6GlxvhWTy/T2cvOEphcuQSYUAaQlgaUlX9WFPvwPkoRZJdvH7gFlbli1gmb9lnw6YLMGbjXKcCzaVqMjS3L0SBQ/CkQKc4tl3RIkjgqv0VhAniwcZP+E0Z8NgmRoAYFdMP+PcGO1CA1PwY9R4D6Umma0O1NkjRa1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYebuKFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYebuKFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576DCC2BCB0
	for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773747912;
	bh=a6JGZHNLmDjgBE7UJX8DjOMfdT1XtVYSMErNAfhXIQk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iYebuKFLbQgPXfUWIvavbnBJ629p/FVMpTEBs9c5vKRSdcTjc9be8RgrhZPOS71Ml
	 Ih3UNIzSXzgre0UHE6zqIvnN7TGj15bCr7WHNa+dygMITNqTuUDLbEHa2GgK6vrdlh
	 tG7U+ElYqep2tj7CWSzbyUfQL1uG75Dzbxwg/uzqjPr6ySvUmfAqOKkmeqW7gLcPga
	 hoLGbYOMhKHx4M1zfL8i+HcCsUX/CuYSHIejESb8v254ZEkpqZ2sXdFLRoo0ZHUfsx
	 CA3XuYn4W+R0lEUrMz7/b1gYDqdgdGvBUO2JBJK4BbX/N8llJFJaHgvUVOR0tMWabu
	 X1oGoTBZnXBYA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a140efd2d5so10080467e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 17 Mar 2026 04:45:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWc89tRVtWK7lGptuTgMfsta4QIUlgCzQlys5uM9W0W1T+D3FDWTjxwBMENOwgVQFkKOrERld56QiEMOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIL/yV2Ks8kh2oA1TdJ4hpFDzEVZ7LFNoBb6R+iNNrNZQoGhWx
	mJB/8mAJQuXpwUCTyalOpJNVOpMT5EnaOoed1uJpJJIG0BTTvH7+upczpj86LyRP3x4PcOwHosP
	s+GOk8zUwfMdA/DWl3kx0G0PVdkQ68NWYnN9jN3W2Vw==
X-Received: by 2002:a05:6512:67d4:b0:5a1:407e:1206 with SMTP id
 2adb3069b0e04-5a162b15266mr3838399e87.35.1773747910957; Tue, 17 Mar 2026
 04:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-gpio-shared-xlate-v1-1-0ce07a1362d2@oss.qualcomm.com> <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
In-Reply-To: <dff3c797-a619-42c0-9696-3e617e13356e@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 17 Mar 2026 12:44:59 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
X-Gm-Features: AaiRm51F-rZceSowWivXHo_LwR8DeYLwNLyNKy_RKop7yCzWOvSjXTbLiKGOTw4
Message-ID: <CAMRc=Mfg-2kjfd5RrcD748WPcUUef=aaxyk8fBtzdcbxqmxcCA@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: call gpio_chip::of_xlate() if set
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 11:12=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> =
wrote:
>
> Thanks for sending this. However, I am seeing a different issue now ...
>
>   ------------[ cut here ]------------
>   WARNING: drivers/gpio/gpiolib-shared.c:499 at gpio_shared_add_proxy_loo=
kup+0x118/0x1d8, CPU#8: swapper/0/1
>   Modules linked in:
>   CPU: 8 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc3-next-2026030=
9-00005-g02826fefa46f #14 PREEMPT
>   Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit/Jetson, BIOS=
 buildbrain-gcid-42974706 11/20/2025
>   pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
>   pc : gpio_shared_add_proxy_lookup+0x118/0x1d8
>   lr : gpio_shared_add_proxy_lookup+0xfc/0x1d8
>   sp : ffff8000832bba30
>   x29: ffff8000832bba30 x28: ffff000080d01010 x27: ffffffffffffefff
>   x26: 0000000000000001 x25: ffff800082df0538 x24: ffff800082df0528
>   x23: 0000000000000000 x22: ffff00008012c158 x21: ffff000081455010
>   usb 1-3: new full-speed USB device number 2 using tegra-xusb
>   x20: ffff000080d5d430 x19: ffff00008012c158 x18: 00000000ffffffff
>   x17: ffff8000830786a8 x16: ffff800083078718 x15: ffff8000832bb880
>   x14: ffffffffffffffff x13: 0000000000000008 x12: 0101010101010101
>   x11: 7f7f7f7f7f7f7f7f x10: ffff8000827f20d0 x9 : 0000000000000003
>   x8 : 0101010101010101 x7 : 0080808080808000 x6 : 15151a0a59460209
>   x5 : 000000000000003c x4 : ffff8000832bb990 x3 : ffff0000800fe800
>   x2 : ffff0000801c2f40 x1 : ffff0000801c2f40 x0 : ffff800082df0538
>   Call trace:
>    gpio_shared_add_proxy_lookup+0x118/0x1d8 (P)
>    gpiod_find_and_request+0x1bc/0x548
>    devm_fwnode_gpiod_get_index+0x1c/0x6c
>    gpio_keys_probe+0x494/0x9fc
>    platform_probe+0x5c/0x98
>    really_probe+0xbc/0x2a8
>    __driver_probe_device+0x78/0x12c
>    driver_probe_device+0x3c/0x15c
>    __driver_attach+0x90/0x19c
>    bus_for_each_dev+0x78/0xd4
>    driver_attach+0x24/0x30
>    bus_add_driver+0xe4/0x208
>    driver_register+0x5c/0x124
>    __platform_driver_register+0x24/0x30
>    gpio_keys_init+0x1c/0x28
>    do_one_initcall+0x7c/0x1c0
>    kernel_init_freeable+0x204/0x2ec
>    kernel_init+0x24/0x1e0
>    ret_from_fork+0x10/0x20
>   ---[ end trace 0000000000000000 ]---
>
> I see the comment says ...
>
>   /* We warn here because this can only happen if the programmer borked. =
*/
>   WARN_ON(1);
>
> I will take a closer look, but let me know if you have any thoughts?
>

I suppose this is not a reset-gpio-like use-case? Could you point me
to the DTS you're using? I've reproduced the bug with a dummy dts and
xlate function in gpio-sim and this patch fixes it but maybe I'm
missing something.

Bart
