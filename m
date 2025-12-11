Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA793305E3E
	for <linux-tegra@vger.kernel.org>; Thu, 11 Dec 2025 17:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765474809; cv=none; b=H0NmnVWR451yLFFyRq4M7JSclRcnGuftNKubyU0H4xy/qBOWiCh/QAfcYMWmraTpW4xWys+7KCNjUEWGJqbGVSFtwF0hkOlm5IJs7zcaot50w+OJetRqVd6vdqhZn7CZcMR7528S1rVCwUjlgQb+rLQu9qnQxQUvsWUSO2lupKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765474809; c=relaxed/simple;
	bh=Lx4HMK9AF8VPbF4QFfWwQYGg2V0b2Hxh3AEWgTw1Of4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Him6SqjnANj+9QaP791ZfkltyhpeQ2aUkYKwAXOmNYOawm7glj7AXAMiFjmz6ZdqUqfe1Z2TSpKrhfVnItPMqulHh/O/0XkRXwKn6qSvtmcnCkYhGaIDGtzKOzMX7JKwMtOMVWsyQm+WiJF+Lau99KmiHwxhksDfVVqMwPGOirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktfCNE3K; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktfCNE3K"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b99da107cso3645971fa.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Dec 2025 09:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765474805; x=1766079605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx4HMK9AF8VPbF4QFfWwQYGg2V0b2Hxh3AEWgTw1Of4=;
        b=ktfCNE3Kr404aKEtXUXog9HEBgsLWoJ86Gs1ndesWN1GdzmItJTTZKB4tsjcARXIpf
         kUAsZcxaIctogDvhIZ0kqvCzbOI/IOMc3wmXmxm+bcGevy/AE1RK2T2Jfg2WSrGilh3A
         DfZjW9P2qCqNiQhnN94LiuT00wqCesawNMWI+rskZ1/RF+99LkLY21HPNx3bAUn7siHA
         DQFIX+7TwuJmttHBCV/KHWvrHLGufXwSCBZUEdpqN4SCu9jm7h23YYDnz75lIi2mO4vO
         vqiAl3591RrXNLAFFinjItxwE7wdhN6Befsiex7kWn8yA3S20IatKn8taDoi1LeW07Kx
         oiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765474805; x=1766079605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lx4HMK9AF8VPbF4QFfWwQYGg2V0b2Hxh3AEWgTw1Of4=;
        b=hFroae8U28RpsBRJYHsZ64bqU4cuVC4FAlqwYXA7FbGzKyeDWD1NKZ4kX9Cgvd057D
         td8LWJvaHPHSQIC+49sMyVzMEkTN7CjwrpHOiXiSfjWUqhGNObIByyERe1fypwQzAkz4
         KVtw+p4nF/J7OKnRdjwtoMEkoJrkQTO5TkqjBQ6he4f0l6KjFtTkXNQsUoVrFUnacYH4
         UiegJ12czD/9oOTkDDnAwk8r85EsXn0AZR7e6IypIlt8zrH4Kf7tdfiwofYwz8VSGdzT
         6Amo/o/aFl4+3ZcvFMKdHeij7I5elCYgIoDX8vBlVg8cMeI04d5WoQqN7VkyqYlaoPpQ
         AYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDwIYS8DDqxVtXQEaoaT901pElYplGshrvjdMMAvzV9IkCI0rm2b5ie0iQtIXdxRwcstaNHPB5eEjr8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSfJq818tQxVxC01CgX29FNnXT8ssCmYkRKX8QdgOtGW1P5EG
	/VcDaajacgpBrWaRc9C33CFwYOV38epAA82TtLfSc8ihZd0P9emWCnfwUdu7IUoiv8aUWcyEQMs
	USl1X9R1CvkMN6+lVCglBsGnAkNX40fw=
X-Gm-Gg: AY/fxX4motFP/KDflljpbddofmDLg5yReWx7fbC0QCe+Rb7/BMyJVXCi5DjMPgEsRZ4
	5UvIod7piVlmN50dNzYcvB1Uv0D8ZppUOk3J0hQelKdGZoyb+bCTRMr4E0nZKzm4kdDgELxnkiO
	JH+AcGfSCA09GIgaxwoMEF9m+S1EZFNN64/OcD34N7qbLHTe4Eo5JWcknxqXVZtFdElOQpPAyFU
	1JA+s33w8McEnXOA37HyFXdvYewhU7Gp81qn7cci0SugsgRbcckpIQCPs7NChHBSmghv9A=
X-Google-Smtp-Source: AGHT+IEiUjsh9MdyHGHu5hSYaLiBAwvlbiLAvEBxHUXl2wGdpmF/stwBEhVdYaYYdZBf6h/2veig0J1HC2k6xCqqieM=
X-Received: by 2002:a2e:a595:0:b0:37e:6a88:99c8 with SMTP id
 38308e7fff4ca-37fb20c1673mr22861991fa.29.1765474804576; Thu, 11 Dec 2025
 09:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com> <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com> <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com> <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com> <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com> <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com> <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com> <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
In-Reply-To: <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 11 Dec 2025 11:39:51 -0600
X-Gm-Features: AQt7F2rFE8po-cQL3dwn-KBtp-NEsoAGWn4mBuLPGDS3wGH3dLMk5rCp6uQfPEM
Message-ID: <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 1:47=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 10/12/2025 22:41, Aaron Kling wrote:
> > On Wed, Dec 10, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >>
> >> On 10/12/2025 18:32, Aaron Kling wrote:
> >>> On Wed, Dec 10, 2025 at 9:04=E2=80=AFAM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> >>>>
> >>>>
> >>>> On 10/12/2025 05:06, Aaron Kling wrote:
> >>>>
> >>>> ...
> >>>>
> >>>>> Let me try to iterate the potential issues I've seen stated here. I=
f
> >>>>> I'm missing anything, please fill in the blanks.
> >>>>>
> >>>>> 1) If this change is applied without the related dt change and the
> >>>>> pcie drvier is loaded, the emc clock can become stuck at the lowest
> >>>>> rate. This is caused by the pcie driver providing icc data, but
> >>>>> nothing else is. So the very low requested bandwidth results in the
> >>>>> emc clock being set very low. I'm not sure there is a 'fix' for thi=
s,
> >>>>> beyond making sure the dt change is merged to ensure that the cpufr=
eq
> >>>>> driver provides bandwidth info, causing the emc driver to select a
> >>>>> more reasonable emc clock rate. This is a similar situation to what=
's
> >>>>> currently blocking the tegra210 actmon series. I don't think there =
is
> >>>>> a way for the drivers to know if icc data is missing/wrong. The
> >>>>> scaling is doing exactly what it's told based on the icc routing gi=
ven
> >>>>> in the dt.
> >>>>
> >>>> So this is the fundamental issue with this that must be fixed. We ca=
n't
> >>>> allow the PCIe driver to slow the system down. I think that Krzyszto=
f
> >>>> suggested we need some way to determine if the necessary ICC clients=
 are
> >>>> present/registered for ICC to work. Admittedly, I have no idea if th=
ere
> >>>> is a simple way to do this, but we need something like that.
> >>>
> >>> I'm not sure I understand how checking clients would work. Is there a
> >>> mechanism for the emc driver to know if cpufreq is registered to icc
> >>> in a way that works with probe deferrals, but also allows for it to b=
e
> >>> optional?
> >>
> >> I am not sure if such a mechanism exists either, but it seems that we
> >> need something like this.
> >>
> >>> Alternatively if there is not, can we just accept the abi break and
> >>> have this and the dt change depend on each other? I know it's not
> >>> desirable or the first choice, but if the other option is to rewrite
> >>> part of the icc system, then perhaps it should be an option.
> >>
> >> I am not sure it is an ABI break, but the default performance might be
> >> worse. I am not sure if you are proposing a way to enforce the
> >> dependency or just saying that there is a dependency. We can't do the
> >> latter, but if there is a way for the kernel to check the dependency a=
nd
> >> make the right choice, then that should work.
> >
> > So we can't accept that older dt's will run slower on a newer kernel
> > and say that a newer dt is needed for full performance?
> >
> > If that's not an option, then I have no idea how to resolve this. I'm
> > not greatly knowledgeable about the icc subsystem. I can try to look
> > into options, but I'm not greatly optimistic about me finding one. If
> > someone could suggest a concept on how to make it work, I could
> > implement it. But I'm not even seeing the concept right now.
> >
> >>>>> 2) Jon, you report that even with both this change and the related =
dt
> >>>>> change, that the issue is still not fixed. But then posted a log
> >>>>> showing that the emc rate is set to max. If the issue is that emc r=
ate
> >>>>> is too low, then how can debugfs report that the rate is max? For
> >>>>> reference, everything scales as expected for me given this change p=
lus
> >>>>> the dt change on both p2771 and p3636+p3509.
> >>>>
> >>>> To clarify, this broke the boot test on Tegra194 because the boot wa=
s
> >>>> too slow. However, this also broke the EMC test on Tegra186 because
> >>>> setting the frequency from the debugfs failed. So two different fail=
ures
> >>>> on two different devices. I am guessing the EMC test would also fail=
 on
> >>>> Tegra194, but given that it does not boot, we did not get that far.
> >>>
> >>> So you're saying that even with the dt changes, this change on
> >>> tegra194 still does not boot before the regression test framework
> >>> times out? If so, I need some more details about this. I have not see=
n
> >>> issues on p2972 or p3518. For example, if I boot to android recovery
> >>> where I set the cpufreq governor to performance, I see emc clock rate
> >>> set to 2133 MHz and 1600 MHz respectively. And boot time from kernel
> >>> start to pixels on display is 15 seconds, give or take a couple
> >>> seconds. This is using the boot stack from l4t r32.7.6.
> >>
> >> Yes. The boot failure here is not a hard boot failure, but the device
> >> takes too long to boot and the boot test times out. And no we will not
> >> increase the timeout as it is there for a reason. It could well be
> >> because the default governor is not set to performance. If you boot wi=
th
> >> just using the stock 'defconfig' for ARM64 without setting the governo=
r
> >> does it take longer?
> >
> > So, I checked out next-20251210, then b4 shazam'ed this series and the
> > matching dt series,
> > 20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com. Then built with
> > LLVM=3D1 ARCH=3Darm64 make defconfig
> > LLVM=3D1 ARCH=3Darm64 make -j33 Image nvidia/tegra194-p2972-0000.dtb
> >
> > I packaged them into an android boot image using a lightly modified
> > copy of Gnurou's bbinitramfs which just drops to a busybox shell. Note
> > that this includes no modules, and since the pcie driver is =3Dm in
> > defconfig, it is not included. Then I flashed that with the l4t
> > r32.7.6 boot stack to p2972. I got the shell on uart after 4.275
> > seconds in the kernel. Per sysfs, the cpufreq governor is schedutil
> > and all policies are idling at min freq, 115200. And per debugfs, the
> > emc clock is 800000000. All this looks to be as expected.
> >
> > I have no idea why the regression test setup is timing out. I have not
> > seen the issue through any of my testing. On pure mainline as per the
> > above paragraph, or with the patches on the android common kernel, as
> > per my target use case. I don't know what to do if I can't replicate
> > the issue. I don't suppose the flash package for the regression test
> > setup is something that could be released?
>
> I thought we already concluded that you did not see this because you did
> not have the PCIe module present in your testing? From the above its
> sounds like you still don't have that driver present and so you don't
> see the issue. I guess I am not surprised by that but I am not sure why
> you are now saying you have no idea why this is timing out? I thought
> this was understood.

Oh, come on... The issue is a combination of old dt AND the pcie
driver. I can reproduce low emc clock with that. But then you said
t194 on the regression bench was still timing out even with the new
dt. And that's what I cannot reproduce. And then you asked me to test
with pure mainline and a stock/unmodified defconfig. So I did, using
-next and the two open series, but clarified what an unmodified
defconfig meant.

So, I modified the .config to enable the pcie driver as built-in, then
reflashed. Otherwise the same as my previous post. I got the shell
after 11 seconds. And clocks are still as reported before, cpu at min,
emc at 800000000.

Aaron
