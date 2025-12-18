Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEE02C0299
	for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 19:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085948; cv=none; b=vAZz6ecd71gtjtrDDVia2CcHe50jam1jfGt6WqFBkwlIXDxuOKTeOWSpnSXExzMln/4sb/9HRNJJWpB8eVRLFnthcBV3uBXyZyf9qPszGqMQaXGRsjynqtrmBYAsc48dGEs26fyBE2GnzSHjls0HZohx9+O5K9myvQgyyfMdxfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085948; c=relaxed/simple;
	bh=lEM6wcZQjbK5csKYAo9HJLG5ZE3pG6lOhQoSfuom2QA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETfNrC1xzRk+a6tkxH2oP5q1yFISUUeOl7EuXTWDNx4TDd0LnJtCd4al92Q6SULZrLXMc4tzAXsk/Z3LcWMG5zmDbXBBa3/wJ4yonwXfR1UWIXQp6GArDMjKapx3RPmodlvkYAVVfJrXluIVlvQIh/IANOKS/oiKmRTcC5mshSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTy5k5jD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTy5k5jD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5942bac322dso1176518e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 11:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766085944; x=1766690744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJL8giZDA/iNhFXPLlRDNPclPQi+lPfq3+n8DTeE0CU=;
        b=aTy5k5jDKIL5a9hdWOUD3TYpDQEKRFvhd/zrEzz+bKsfuh4drb+jc+OswB1kQifcYp
         IhZNMZAC7b12tn6gjpR9cXJk9ZymLrWRj19yEV6d2CUBTlAw4FHswjhqVCP5LRbyv2iB
         IBlk9f/+w7DTcodCXneYIBqOYzZNk2sDR8ZRBoLMWXUBMl9kDPyTQy4BJU2MUwS3eglU
         dY4jimLfPN0p2nFN6BJH5B5vgqSn8z6SCsTZXfGPYTVnIqOVoqXLjYc04kFn65kGSjhQ
         RFQ6ZAxpReIFIny8Ld9It+FGIYLJMf+DVj0B7SG8pcsc8fB9J05ncLD3pp96iu9a+aDt
         ugDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085944; x=1766690744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wJL8giZDA/iNhFXPLlRDNPclPQi+lPfq3+n8DTeE0CU=;
        b=H8SD1Bsh77uaGHV3Z7EZzx6+IHhnRKWTe38DPpCIs/gzs1Xlg2tnDfRSgstLhzuPsE
         te50ANUwZCcHgF74n+oDQvO72Rk3RD06EhKX5cZ9SmY4QTFwASxZCMTA7y6NVEXsKh2y
         3xEJnMICvwp0vH0P4MvqJ4QKDna45PD2kTQbGlnHBuEWafGJkiLPtpRS9HBWnfG8F1Bi
         /yE5U3nEeFbSdCdR70eFdT8wHoyko1RuuYkwcxeY177mG5G9R2eE/PZSpHV4dmrVagQu
         RaMOZiGPa/p5NoZP6ESw13vqsqvYdnhdi6HOd1mQgeTXmx5jq2ukxO/jHzivs14gparf
         3QLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUluHl6g00CfnLljEDKBeGlKGsgxCCy7P8zl70RFBVop2LJ8RAW6xq9HeVt+dQ65oJqGtJbyRTZmbBPVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKNFJ4AfVz9wGEpcis4l6XKBruMtrvKDxvBa3GS3x828UC2Gf1
	VCk0s+kupk8iaaSNGA++IafdeHnQke0UojRENZbAStx/9se7OMKzvWVujK9aOHioLryOMntl2j+
	OAC8rOKwppMl+0SYtBryT96xKBTzsJ8c=
X-Gm-Gg: AY/fxX7mX8OWGoAYCBw2us1S7JIHvZZ+stXemfr4bF++p3I4D2DFJYvltxa/XTZz6or
	+CmlgmY/nfEgHdnfp30ixSZlkqaCG0yzkTnfe9VMqBUJSnGAo5D4BwxFfubHiqzKjWRzRecppIa
	HPoWCSLiOs1nVgsadwGuAaEBEyQe+U1veT+JyMnBFrkWqhgiOvqqnNIF6tv7+UdhCIUEIailxCC
	XlEwOjdwghG0mrhQ6ogI/m8MUvA+YxLAS2mxvuZOrUS5VbnXum4KRQApKfD23A+jzTjhjE=
X-Google-Smtp-Source: AGHT+IG/qjuFiJj3XPO6XEgMYvwF4LI0pqEda0ThsgvRtSbNpM0QDVe4dlYV/5LAIOguoLwj5Yncemx6XhPJamN9EOk=
X-Received: by 2002:a05:6512:e9c:b0:598:faba:c8fa with SMTP id
 2adb3069b0e04-59a17d006e1mr244111e87.10.1766085944053; Thu, 18 Dec 2025
 11:25:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com> <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com> <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com> <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
 <1b9f0b14-876c-4c6e-90eb-b04d016f88e8@nvidia.com> <CALHNRZ_GGAg_VP8gSdtw_1CA2A0netrOeA2+guZfxyG7POhHoA@mail.gmail.com>
 <adc7ca5c-69d8-4164-bd89-3381b101576a@nvidia.com> <CALHNRZ-SU_kyak_u6mfUZBHJ9Cph6=-edhL+yhRizu8DDy=Big@mail.gmail.com>
 <CALHNRZ9mfO_DQR-RuH_QH=18R8zTt9VqbPaVCdnDKUWzx1pm3Q@mail.gmail.com>
 <45057c95-1dba-4302-94fa-f63941ee2b20@nvidia.com> <CALHNRZ8gJbyuD+0yFQwCJ+g7OcffjkXopRSJKoDnr5WMmUVGwQ@mail.gmail.com>
 <0c5eddc0-8b37-4199-a8b8-f235ac3aa476@nvidia.com> <CALHNRZ_zhZ3a7h8nSWkpGv6+unKn6DkSA9tKQ6cmb5TXjGcC9w@mail.gmail.com>
 <4900cf8f-9ec8-48d6-8187-126e111cd048@nvidia.com>
In-Reply-To: <4900cf8f-9ec8-48d6-8187-126e111cd048@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 18 Dec 2025 13:25:32 -0600
X-Gm-Features: AQt7F2qAeEHv_2FfHkh7Z_bzzCTxus3tGn07P6jnd7hI57gbTbuAJfIi-XuhKpI
Message-ID: <CALHNRZ_vZm7n-fZSVA1YzUPz0=znX_D6aBZ0nwUyjKdwcrO1=w@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 5:12=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 17/12/2025 22:44, Aaron Kling wrote:
>
> ...
>
> >> Thanks I added all these on top of next-20251216 (as that is the lates=
t
> >> I have tested) and Tegra194 fails to boot. We always include all the
> >> modules in the rootfs that is being tested. You can see the boot log
> >> here [0]. We are using an NFS rootfs for testing and I see a message
> >> related to the NFS server not responding. I am guessing something is
> >> running too slow again because the only thing I changed was adding you=
r
> >> patches. The test harness reports it is timing out ...
> >>
> >> FAILED: Linux Boot Test 1
> >>          Test Owner(s): N/A
> >>          Execution Time 219.31 sec
> >>          Test TIMEOUT reached. Test did not report results in 120 secs
> >>          Percent passed so far: 0.0
> >
> > Okay, so. Modules are in the rootfs, none get copied to the initramfs?
> > And the rootfs is on nfs? And for this failure, nfs never gets
> > mounted. So... for this case, no modules get loaded, implying that
> > whatever is happening is happening with the built-in drivers. Which
> > means this case isn't pcie related. Are there any modifications to the
> > defconfig? It appears that there must be, to have dwc-eth-dwmac
> > available. I will see if I can trigger anything when using ethernet.
>
> If you look at the boot log you will see ...
>
> [    7.839012] Root device found: nfs
> [    7.908307] Ethernet interface: eth0
> [    7.929765] IP Address: 192.168.99.2
> [    8.173978] Rootfs mounted over nfs
> [    8.306291] Switching from initrd to actual rootfs
>
> So it does mount the rootfs and so the modules would be loaded. I

But the bottom of the log says:
[ 188.360095] nfs: server 192.168.99.1 not responding, still trying

So does it mount nfs and load modules, and *then* fail to talk to the
nfs server? That doesn't make any sense. And I don't see any logs from
driver probes after the rootfs line. And there's sync_state lines
stating that pcie among others isn't available.

> believe that PCIe is definitely loaded because that is what I observed
> before. And yes there are a few modifications to the defconfig that we
> make on top (that have been added over the years for various reasons) ...
>
> CONFIG_ARM64_PMEM=3Dy
> CONFIG_BROADCOM_PHY=3Dy
> CONFIG_DWMAC_DWC_QOS_ETH=3Dy
> CONFIG_EEPROM_AT24=3Dm
> CONFIG_EXTRA_FIRMWARE=3D"nvidia/tegra210/xusb.bin nvidia/tegra186/xusb.bi=
n
> nvidia/tegra194/xusb.bin rtl_nic/rtl8153a-3.fw rtl_nic/rtl8168h-2.fw"
> CONFIG_EXTRA_FIRMWARE_DIR=3D"${KERNEL_FW_DIR}"
> CONFIG_MARVELL_PHY=3Dy
> CONFIG_R8169=3Dy
> CONFIG_RANDOMIZE_BASE=3Dn
> CONFIG_SERIAL_TEGRA_TCU=3Dy
> CONFIG_SERIAL_TEGRA_TCU_CONSOLE=3Dy
> CONFIG_STAGING=3Dy
> CONFIG_STAGING_MEDIA=3Dy
> CONFIG_STMMAC_ETH=3Dy
> CONFIG_STMMAC_PLATFORM=3Dy
> CONFIG_USB_RTL8152=3Dy
> CONFIG_VIDEO_TEGRA=3Dm
> CONFIG_VIDEO_TEGRA_TPG=3Dy
> CONFIG_DWMAC_TEGRA=3Dy

I will incorporate these to a build and see if I get any different results.

> Looking at the boot log I see ...
>
> [    3.854658] cpu cpu0: cpufreq_init: failed to get clk: -2
> [    3.854927] cpu cpu0: cpufreq_init: failed to get clk: -2
> [    3.855218] cpu cpu2: cpufreq_init: failed to get clk: -2
> [    3.858438] cpu cpu2: cpufreq_init: failed to get clk: -2
> [    3.863987] cpu cpu4: cpufreq_init: failed to get clk: -2
> [    3.869741] cpu cpu4: cpufreq_init: failed to get clk: -2
> [    3.875006] cpu cpu6: cpufreq_init: failed to get clk: -2
> [    3.880725] cpu cpu6: cpufreq_init: failed to get clk: -2
> [    3.886018] cpufreq-dt cpufreq-dt: failed register driver: -19
>
> So actually, I am now wondering if this is the problem?

These lines are from cpufreq-dt trying to manage the cpu's directly,
which it's not supposed to do. tegra194-cpufreq is supposed to manage
them. I see these lines as well, when things are operating as
expected. The real driver doesn't log anything, but the policies are
visible in sysfs. I did a little bit of digging previously to see if I
could remove the log churn, but was unable to do so. I would have to
double check to be completely sure, but I am fairly certain I saw
these lines before my changes as well. It's something that would be
good to get fixed, but I don't think it's operable here.

Aaron
