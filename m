Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8252586C8
	for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765996805; cv=none; b=nybiM9TIXxjx8xnBuG6GlGqQhxL6EoLCfWNHTPRFMBbUfoLHg4SB9GED3h0cBvlCY3oxu1Gb5UpnUa3TTZigsp0/Y4vdGrLgXUnRFlkxdUyl7d2qA5lqJE2NY6dYNWCsbG36xG2ZGJ7noIkcmqk4e2NWklw2JhV6Vbph+ufdxpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765996805; c=relaxed/simple;
	bh=czfF7s9136ZNt7DqdCmwaIdSeXzW4fp0xyjyrA+KaOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXmBoBLo6CMd0PzwYtTp4vYK7HRtjGllkRG4ipErSrlC7VN7nIA9PHCS4b9G2g1K3ThEidjOBcw62BpC9U2ak5j8MMWyV7xPUCN5UmH31OLGIbWbZUhbc5FB3c3JLCl8YX8J7P6Y/tgMXoC4kpUOcQNGWob8x37eEltjohTdOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0r2bXq2; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0r2bXq2"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso1854853e87.2
        for <linux-tegra@vger.kernel.org>; Wed, 17 Dec 2025 10:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765996801; x=1766601601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czfF7s9136ZNt7DqdCmwaIdSeXzW4fp0xyjyrA+KaOE=;
        b=V0r2bXq2uEg+tU8eDM5vS496Cqmdb4oH8acWQwgaZVxUbrWt9bvbjVFMKjDo0tLgkA
         aFcSpgcQURYnf1gf0BNce4Uk1vDJF2/s3vFDXDeFt2BEOrr12TtsV+65sP1EBqPLQatH
         +7p2QUzntoSo+FVlDLAoNgD2mZ3Z7YZQcnOVGi9sMjMG57xzVwR1zB7ittK8t+t9Je0E
         8FR71jd6/7GqenYrYi2SeNqJhX1CHn2R0Zwou2IxvQtyjt9vLpRl2yO0te6CAdEwOP8C
         kjAgvTAqYWPFK9AYJDeg2Y0Q3VlgZfQwljIXENATXT0M/Kzrgj+efHW/nIv4i6z6LtpG
         fN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765996801; x=1766601601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czfF7s9136ZNt7DqdCmwaIdSeXzW4fp0xyjyrA+KaOE=;
        b=F0Yf0bxnAQG+yE7IeSskTdwrOmJFHQd/sImyTL5cIg4YXBQlZIAKSEQGsGf3abkCbB
         Zar9gBQt5sJwtx+BM+6TtgH8tEa0Kmg1i41UMjVny+iTeEUSQ6V9E346oAwix3PO0p+l
         25duibI+x41O4lDl8Ijth6zionPcfgY9sJQ+afdhsf4EgQVSAkjeKrptot3cMsrifAoG
         WQmt+Z0e6PWoEoxsJMpK5+0PRKR2fr9MqKlRQZvDwvta3OPXasMvKIwr3+4xfBfHgmkj
         x+Gjkz/Aj2ecfcv6+ClenC0qd59PqoFxnR8SsvbofZXfjoXG0Glw6tWU9om8NGQ3So+1
         jqlA==
X-Forwarded-Encrypted: i=1; AJvYcCXmiLdiRYPAY2irbbJHwSL0B5uUzbZrHjiV9WKUL4siNW4r+mgVk7i0FduBf2zAEFrBr7MLqMCeKbHeIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKP2Trx1N7hS9DX+MAT4MwVHKRgCLLX070gQ7YgSy6avAiApD
	lLBPB6JWmFizNWEB96L1PQPJ1iSeVIScs5s4cBG/n73X5FJMzoTYHlqoWL8fwR5eATFdwTPeSVC
	wqQhGFRFCdxckRHKfPafrNwrBgD54pMk=
X-Gm-Gg: AY/fxX7R3lqaB6gIGkAOEYsyR6ximc3rbfyt50Mbj9tCAqVDlLpQYoF0XuFw7sA6G3+
	CSu63O26/rloCMm/5BxJsymdkk/+IwjzqPuVilmBJo4YrgYfHlgJug/UwNUBUM9py6fVZCJ/abH
	ywoyFWDL3/u/14ykKF0PGjUUbdT2/eAX/0Rk7wS46dOjjQ41FeiZaljcoyOkaKWFxtTAj++NbcY
	bJQGdYc/5zmpHu5nWjtVahHr0S5cKD3nZE0nsWxvrc3tA0Bqt5jbVmfHqjgDD1d6YxoUy+kTwPk
	5HhF9A==
X-Google-Smtp-Source: AGHT+IH5SEyscjk7iSVRESVoQUCqc0O03CtkFh0J6+mrMiTpFlh2+Zv0pvskEdCuDpOiVxZhk9W5sxcqDx4Ff5ZydPM=
X-Received: by 2002:ac2:530c:0:b0:598:fac0:497d with SMTP id
 2adb3069b0e04-598fac04a37mr4354585e87.15.1765996801022; Wed, 17 Dec 2025
 10:40:01 -0800 (PST)
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
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com> <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
In-Reply-To: <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 17 Dec 2025 12:39:49 -0600
X-Gm-Features: AQt7F2o46Ohom0P0WE0GJ6uBeOZ16bcF_f9PNHDRhkCESFgS-mfJisImvKUJjAQ
Message-ID: <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 11:39=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com=
> wrote:
>
> On Thu, Dec 11, 2025 at 1:47=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 10/12/2025 22:41, Aaron Kling wrote:
> > > On Wed, Dec 10, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> > >>
> > >>
> > >> On 10/12/2025 18:32, Aaron Kling wrote:
> > >>> On Wed, Dec 10, 2025 at 9:04=E2=80=AFAM Jon Hunter <jonathanh@nvidi=
a.com> wrote:
> > >>>>
> > >>>>
> > >>>> On 10/12/2025 05:06, Aaron Kling wrote:
> > >>>>
> > >>>> ...
> > >>>>
> > >>>>> Let me try to iterate the potential issues I've seen stated here.=
 If
> > >>>>> I'm missing anything, please fill in the blanks.
> > >>>>>
> > >>>>> 1) If this change is applied without the related dt change and th=
e
> > >>>>> pcie drvier is loaded, the emc clock can become stuck at the lowe=
st
> > >>>>> rate. This is caused by the pcie driver providing icc data, but
> > >>>>> nothing else is. So the very low requested bandwidth results in t=
he
> > >>>>> emc clock being set very low. I'm not sure there is a 'fix' for t=
his,
> > >>>>> beyond making sure the dt change is merged to ensure that the cpu=
freq
> > >>>>> driver provides bandwidth info, causing the emc driver to select =
a
> > >>>>> more reasonable emc clock rate. This is a similar situation to wh=
at's
> > >>>>> currently blocking the tegra210 actmon series. I don't think ther=
e is
> > >>>>> a way for the drivers to know if icc data is missing/wrong. The
> > >>>>> scaling is doing exactly what it's told based on the icc routing =
given
> > >>>>> in the dt.
> > >>>>
> > >>>> So this is the fundamental issue with this that must be fixed. We =
can't
> > >>>> allow the PCIe driver to slow the system down. I think that Krzysz=
tof
> > >>>> suggested we need some way to determine if the necessary ICC clien=
ts are
> > >>>> present/registered for ICC to work. Admittedly, I have no idea if =
there
> > >>>> is a simple way to do this, but we need something like that.
> > >>>
> > >>> I'm not sure I understand how checking clients would work. Is there=
 a
> > >>> mechanism for the emc driver to know if cpufreq is registered to ic=
c
> > >>> in a way that works with probe deferrals, but also allows for it to=
 be
> > >>> optional?
> > >>
> > >> I am not sure if such a mechanism exists either, but it seems that w=
e
> > >> need something like this.
> > >>
> > >>> Alternatively if there is not, can we just accept the abi break and
> > >>> have this and the dt change depend on each other? I know it's not
> > >>> desirable or the first choice, but if the other option is to rewrit=
e
> > >>> part of the icc system, then perhaps it should be an option.
> > >>
> > >> I am not sure it is an ABI break, but the default performance might =
be
> > >> worse. I am not sure if you are proposing a way to enforce the
> > >> dependency or just saying that there is a dependency. We can't do th=
e
> > >> latter, but if there is a way for the kernel to check the dependency=
 and
> > >> make the right choice, then that should work.
> > >
> > > So we can't accept that older dt's will run slower on a newer kernel
> > > and say that a newer dt is needed for full performance?
> > >
> > > If that's not an option, then I have no idea how to resolve this. I'm
> > > not greatly knowledgeable about the icc subsystem. I can try to look
> > > into options, but I'm not greatly optimistic about me finding one. If
> > > someone could suggest a concept on how to make it work, I could
> > > implement it. But I'm not even seeing the concept right now.
> > >
> > >>>>> 2) Jon, you report that even with both this change and the relate=
d dt
> > >>>>> change, that the issue is still not fixed. But then posted a log
> > >>>>> showing that the emc rate is set to max. If the issue is that emc=
 rate
> > >>>>> is too low, then how can debugfs report that the rate is max? For
> > >>>>> reference, everything scales as expected for me given this change=
 plus
> > >>>>> the dt change on both p2771 and p3636+p3509.
> > >>>>
> > >>>> To clarify, this broke the boot test on Tegra194 because the boot =
was
> > >>>> too slow. However, this also broke the EMC test on Tegra186 becaus=
e
> > >>>> setting the frequency from the debugfs failed. So two different fa=
ilures
> > >>>> on two different devices. I am guessing the EMC test would also fa=
il on
> > >>>> Tegra194, but given that it does not boot, we did not get that far=
.
> > >>>
> > >>> So you're saying that even with the dt changes, this change on
> > >>> tegra194 still does not boot before the regression test framework
> > >>> times out? If so, I need some more details about this. I have not s=
een
> > >>> issues on p2972 or p3518. For example, if I boot to android recover=
y
> > >>> where I set the cpufreq governor to performance, I see emc clock ra=
te
> > >>> set to 2133 MHz and 1600 MHz respectively. And boot time from kerne=
l
> > >>> start to pixels on display is 15 seconds, give or take a couple
> > >>> seconds. This is using the boot stack from l4t r32.7.6.
> > >>
> > >> Yes. The boot failure here is not a hard boot failure, but the devic=
e
> > >> takes too long to boot and the boot test times out. And no we will n=
ot
> > >> increase the timeout as it is there for a reason. It could well be
> > >> because the default governor is not set to performance. If you boot =
with
> > >> just using the stock 'defconfig' for ARM64 without setting the gover=
nor
> > >> does it take longer?
> > >
> > > So, I checked out next-20251210, then b4 shazam'ed this series and th=
e
> > > matching dt series,
> > > 20251021-tegra186-icc-p3-v3-0-68184ee8a89c@gmail.com. Then built with
> > > LLVM=3D1 ARCH=3Darm64 make defconfig
> > > LLVM=3D1 ARCH=3Darm64 make -j33 Image nvidia/tegra194-p2972-0000.dtb
> > >
> > > I packaged them into an android boot image using a lightly modified
> > > copy of Gnurou's bbinitramfs which just drops to a busybox shell. Not=
e
> > > that this includes no modules, and since the pcie driver is =3Dm in
> > > defconfig, it is not included. Then I flashed that with the l4t
> > > r32.7.6 boot stack to p2972. I got the shell on uart after 4.275
> > > seconds in the kernel. Per sysfs, the cpufreq governor is schedutil
> > > and all policies are idling at min freq, 115200. And per debugfs, the
> > > emc clock is 800000000. All this looks to be as expected.
> > >
> > > I have no idea why the regression test setup is timing out. I have no=
t
> > > seen the issue through any of my testing. On pure mainline as per the
> > > above paragraph, or with the patches on the android common kernel, as
> > > per my target use case. I don't know what to do if I can't replicate
> > > the issue. I don't suppose the flash package for the regression test
> > > setup is something that could be released?
> >
> > I thought we already concluded that you did not see this because you di=
d
> > not have the PCIe module present in your testing? From the above its
> > sounds like you still don't have that driver present and so you don't
> > see the issue. I guess I am not surprised by that but I am not sure why
> > you are now saying you have no idea why this is timing out? I thought
> > this was understood.
>
> Oh, come on... The issue is a combination of old dt AND the pcie
> driver. I can reproduce low emc clock with that. But then you said
> t194 on the regression bench was still timing out even with the new
> dt. And that's what I cannot reproduce. And then you asked me to test
> with pure mainline and a stock/unmodified defconfig. So I did, using
> -next and the two open series, but clarified what an unmodified
> defconfig meant.
>
> So, I modified the .config to enable the pcie driver as built-in, then
> reflashed. Otherwise the same as my previous post. I got the shell
> after 11 seconds. And clocks are still as reported before, cpu at min,
> emc at 800000000.

To try to move a resolution along, let me try to enumerate the issues
again. Again, please clarify should I have something incorrect or
incomplete.

1) The primary issue is when an old dtb is used with this commit and
the pcie driver is loaded. I can reproduce this issue on t186 and
t194. If this becomes the sole remaining blocking issue, I would like
for an exception to the normal rule be considered and this merged
anyways. Since it does not cause a boot failure and distros package a
new dt normally anyways. And to my knowledge, working around this
would involve redoing part off the icc subsystem itself, a major task
in comparison.

2) T194 is reported to have low clocks even with a new dt on the
Nvidia regression bench. I cannot reproduce this, even with the pcie
driver loaded. Can this be re-verified, please? And if it still
happens, can logs from the failure be made available and/or more
information provided as to the state of the unit? Like changes to the
default defconfig, modules that get loaded, etc.

3) Setting the max clock via debugfs fails when icc has pushed the
current clock higher than the requested rate. This is a logic issue
with all tegra emc drivers that implement dfs via icc. The suggested
resolutions are to leave this as is to keep consistency with the
existing drivers, perhaps updating all later, or to update the
existing implementations in a separate series, then send a new
revision here to match. I am personally unable to verify anything
older than tegra124, however.

Aaron
