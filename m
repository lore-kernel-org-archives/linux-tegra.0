Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C10C2F12C0
	for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765406518; cv=none; b=TjlRTgbrykdqxHfrB8YRfdAfUorHdHR7gy/f/gfY/S4OMNn+FZt7L2GyXDaAEGx2gQGbBzMCilgIw/6B13y8US2JbiJJFJzPhsGPzCYysyEkbDjqWZKR/ioytOC03Pbp1kkCjR05TJwoqmMbINW5vEnfP2q3o6Zh3Fz9uv4aSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765406518; c=relaxed/simple;
	bh=1OMD4xUDwT6u/G0dJl1XTjBHGfj/rQRY2e5zShZyDNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfFPs8k86z21GK40AXfxBeFBNOx5laGyQwLtnavffjJ8czF0vRncJtadDU248+teGQmPl1CrKsbgWk99agqMA114LndCP4KfCBqWimZp1aHmOGya/GE9bH5NVas+fE00KL+7kRjRWfmigcczhOZ85WL+TWwn2VcxDMiXyXYLEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dkblqr2f; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dkblqr2f"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5957e017378so322852e87.3
        for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 14:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765406514; x=1766011314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OMD4xUDwT6u/G0dJl1XTjBHGfj/rQRY2e5zShZyDNw=;
        b=Dkblqr2fDGZlU3LNtaDPHpWTKtEah6nnz6Z5Ecm70wN0bMMYsEicMFXOgcmnSNu3x4
         V00fQk3r5fPgbQRHHQ8JMquGaWwdWX+q77+sk2W6ftnWJwnzTrW9+lyKXaUCCGEoDRgx
         QZK02vFaRn3y3rxZoojwnGiY93piqMO0R1khaPe/ozbizF0WA7RaZgs0kXHv09VGsxuO
         rZ4nyYZRrQ50NesJni4tycD6XQS7rrKF3d2RxqiqzSegowkgqvMwy76LE1vrj9X/6B4D
         bJgc/ychFsrNQ2vBF/0DJa4lzWKg8IzlmD4u0fBRxTTNc1RXItoTvAdK3l+ioEEVZj6h
         SE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765406514; x=1766011314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OMD4xUDwT6u/G0dJl1XTjBHGfj/rQRY2e5zShZyDNw=;
        b=Y07n1SaBGDFmiawzauJl+3RkkH6FZmGDUqIDbRxBraD0WHlBDtbjlDi4Cc6C5YhWs5
         cISvHAqz+GCiJywF3vBxyIqbmYkAoIFE4dYHZL0Vh4DlFamdQEsUV6QJnuJeNrya94HS
         TVIKxZOs6FKVrwjy6a3wCyiM+Krz/DJ5gZcw+z9JN1A7tYPORGY0yCtmVwSuOs4m1cXi
         nW5tuMvURPBJp8nTeVfnDPe05qQ1YYtLYfH2vG3JPkHSI1rjbpV23SJNzy1joCt58Ud6
         6QZ+Zievpmuo4xS1qqZdJc0Rc3oubIxHAftFRDZqRsunQyJqXlJeR5VHSyY1kb11hETF
         h1nA==
X-Forwarded-Encrypted: i=1; AJvYcCWP1p09gB2NQ5Hj+9IoNA7t5IVt1af2zTzTNxlugs7lwFzppnWvfvqC1XzC/R8X4U3udGmVmvciSyHGew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM2bIgUIrK3xp0lggsAWZLnQ2CSNtkQRUY6ESpV3rbYncqAfQX
	J0OdnuQlBhdPpim7bJiHsFNBtoXIqWxmwue+WY0t09eCJ+w8D2q6um58RGvVL1qMMLSLs+EZjPs
	iZgDQNzGm2X6QVc08hGc0eCU+xylFv+U=
X-Gm-Gg: AY/fxX7XkKmxX7VStRrv9ZysEF9v2uIhewCZ6EPnDlj8B8TkJFmg/CJ5nE7ZllspQjl
	LtNAjhWZt2sNKvTCoeIEvT0S7nzGJE56DSh/+Vodu4zVCETp7PmfL9cbIc7KxW2eiLHwoiIi3f3
	wUwjN2R+B0yfEgN+xagfy9yNkZgiKcCP96itUCFsSAZY3hDQuHdZX/CMU49/9JASVTQBOUysTX+
	heAhd7oiWGfUG1aGTsL4UdcNIZHNVzxzfiKkhHdvGJbf8K6w/dZRz9j8RUmjMPiWZ5H0/k=
X-Google-Smtp-Source: AGHT+IGsKYkhTWcpJpLscMxwx7R3zru+drHhH4uF8OXfDLT2nVkQImR9wpH1gNyMwWK+Dxoi4dyZRG4zgtd80OqXY6M=
X-Received: by 2002:a05:6512:39d5:b0:594:2d64:bd0f with SMTP id
 2adb3069b0e04-598ee4e63fdmr1526066e87.16.1765406513923; Wed, 10 Dec 2025
 14:41:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com> <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com> <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com> <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com> <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com> <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com> <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com> <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
In-Reply-To: <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 10 Dec 2025 16:41:42 -0600
X-Gm-Features: AQt7F2rRb0r-F0QPrReCRvnoBgcPrhggXOXKiUk6KwS3zwChkVgtdtb9j31p3DM
Message-ID: <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 10/12/2025 18:32, Aaron Kling wrote:
> > On Wed, Dec 10, 2025 at 9:04=E2=80=AFAM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >>
> >> On 10/12/2025 05:06, Aaron Kling wrote:
> >>
> >> ...
> >>
> >>> Let me try to iterate the potential issues I've seen stated here. If
> >>> I'm missing anything, please fill in the blanks.
> >>>
> >>> 1) If this change is applied without the related dt change and the
> >>> pcie drvier is loaded, the emc clock can become stuck at the lowest
> >>> rate. This is caused by the pcie driver providing icc data, but
> >>> nothing else is. So the very low requested bandwidth results in the
> >>> emc clock being set very low. I'm not sure there is a 'fix' for this,
> >>> beyond making sure the dt change is merged to ensure that the cpufreq
> >>> driver provides bandwidth info, causing the emc driver to select a
> >>> more reasonable emc clock rate. This is a similar situation to what's
> >>> currently blocking the tegra210 actmon series. I don't think there is
> >>> a way for the drivers to know if icc data is missing/wrong. The
> >>> scaling is doing exactly what it's told based on the icc routing give=
n
> >>> in the dt.
> >>
> >> So this is the fundamental issue with this that must be fixed. We can'=
t
> >> allow the PCIe driver to slow the system down. I think that Krzysztof
> >> suggested we need some way to determine if the necessary ICC clients a=
re
> >> present/registered for ICC to work. Admittedly, I have no idea if ther=
e
> >> is a simple way to do this, but we need something like that.
> >
> > I'm not sure I understand how checking clients would work. Is there a
> > mechanism for the emc driver to know if cpufreq is registered to icc
> > in a way that works with probe deferrals, but also allows for it to be
> > optional?
>
> I am not sure if such a mechanism exists either, but it seems that we
> need something like this.
>
> > Alternatively if there is not, can we just accept the abi break and
> > have this and the dt change depend on each other? I know it's not
> > desirable or the first choice, but if the other option is to rewrite
> > part of the icc system, then perhaps it should be an option.
>
> I am not sure it is an ABI break, but the default performance might be
> worse. I am not sure if you are proposing a way to enforce the
> dependency or just saying that there is a dependency. We can't do the
> latter, but if there is a way for the kernel to check the dependency and
> make the right choice, then that should work.

So we can't accept that older dt's will run slower on a newer kernel
and say that a newer dt is needed for full performance?

If that's not an option, then I have no idea how to resolve this. I'm
not greatly knowledgeable about the icc subsystem. I can try to look
into options, but I'm not greatly optimistic about me finding one. If
someone could suggest a concept on how to make it work, I could
implement it. But I'm not even seeing the concept right now.

> >>> 2) Jon, you report that even with both this change and the related dt
> >>> change, that the issue is still not fixed. But then posted a log
> >>> showing that the emc rate is set to max. If the issue is that emc rat=
e
> >>> is too low, then how can debugfs report that the rate is max? For
> >>> reference, everything scales as expected for me given this change plu=
s
> >>> the dt change on both p2771 and p3636+p3509.
> >>
> >> To clarify, this broke the boot test on Tegra194 because the boot was
> >> too slow. However, this also broke the EMC test on Tegra186 because
> >> setting the frequency from the debugfs failed. So two different failur=
es
> >> on two different devices. I am guessing the EMC test would also fail o=
n
> >> Tegra194, but given that it does not boot, we did not get that far.
> >
> > So you're saying that even with the dt changes, this change on
> > tegra194 still does not boot before the regression test framework
> > times out? If so, I need some more details about this. I have not seen
> > issues on p2972 or p3518. For example, if I boot to android recovery
> > where I set the cpufreq governor to performance, I see emc clock rate
> > set to 2133 MHz and 1600 MHz respectively. And boot time from kernel
> > start to pixels on display is 15 seconds, give or take a couple
> > seconds. This is using the boot stack from l4t r32.7.6.
>
> Yes. The boot failure here is not a hard boot failure, but the device
> takes too long to boot and the boot test times out. And no we will not
> increase the timeout as it is there for a reason. It could well be
> because the default governor is not set to performance. If you boot with
> just using the stock 'defconfig' for ARM64 without setting the governor
> does it take longer?

So, I checked out next-20251210, then b4 shazam'ed this series and the
matching dt series,
20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com. Then built with
LLVM=3D1 ARCH=3Darm64 make defconfig
LLVM=3D1 ARCH=3Darm64 make -j33 Image nvidia/tegra194-p2972-0000.dtb

I packaged them into an android boot image using a lightly modified
copy of Gnurou's bbinitramfs which just drops to a busybox shell. Note
that this includes no modules, and since the pcie driver is =3Dm in
defconfig, it is not included. Then I flashed that with the l4t
r32.7.6 boot stack to p2972. I got the shell on uart after 4.275
seconds in the kernel. Per sysfs, the cpufreq governor is schedutil
and all policies are idling at min freq, 115200. And per debugfs, the
emc clock is 800000000. All this looks to be as expected.

I have no idea why the regression test setup is timing out. I have not
seen the issue through any of my testing. On pure mainline as per the
above paragraph, or with the patches on the android common kernel, as
per my target use case. I don't know what to do if I can't replicate
the issue. I don't suppose the flash package for the regression test
setup is something that could be released?

Aaron
