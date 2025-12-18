Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B22D323F
	for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766092846; cv=none; b=c00owTDFrSvmX89uwV4qKIBWjWA7p3H09tDJGM55xaDyAW7eyOBqpyjeP7OTSxNJN9bFeJnwtKqGLgAm6GimOfJxwNG0ojow/L9I4rA0UzvgfxHthyuhFGR58Ypawhs6rVODsFkM0jFWHluD7SPzSbpeUe3ae6cpuPI4iyif93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766092846; c=relaxed/simple;
	bh=ieq0ZjcZ6Em7AjJxXDPnmdbM7ndI9q9WnvRDMXFpCtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSz6IlERzOwM56yTcsxPtWieUFGlu09YWRXBgo31gAQeMAPaF4GyWig9d0JFEdYVHHbav2QG58jSW1BMhtIumL6LZ6RpMYszPKrWDTj0Vo/giRBTfuOqVxB0qENE4/QZZgPyQ1o5qudjR/hCqqlYvt+caL7mWPPxjy16iiK0DUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSlLydC0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSlLydC0"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38007fa1efbso5583601fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 13:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766092842; x=1766697642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkYlQnzcC6iwQIlh0mYCygHeE7SPIbVoP6P3AZkPwEA=;
        b=mSlLydC0Tw2PqB+jgKDkg7LwSBrrDpMko6AVXN81zTXpQRHNBHgTVTgtH8HhRa548N
         PiYIISErOlf/7O4db4xLO1JRV2a5WkY/OO4vQK7QvzN/O6PK8Xh+QaFmM7xtTnFqYUTi
         sB+Ohr5OufUPLTDgYMBefdAsxGuiaoMKSwEa3fYxTJQnZawCnTmS63Vm2ZzLIVDCLbcu
         1BPF6DNNHyhKeAgfQa5Ey2Ohew/9f+BLidD+qiokWNwxhc1B7LdWUfIlzAl96+wbN3/u
         +H6vslT/7qD25fDD7uCqNmP4Hgk6gIqMq2xOQsB+y315J2Pdn3262GRjyTjsUragFfE5
         8xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766092842; x=1766697642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tkYlQnzcC6iwQIlh0mYCygHeE7SPIbVoP6P3AZkPwEA=;
        b=gyMQ7mKfymQHflokh+23TgEx3XLMCP3J3qMI79vArH1bHYMYpjlxreAVbZrg37O67v
         wTVIFkxDX1RsmTGFFqOWTF0PmayR1DbedvR4pYSTN4r2z90zA9IUc+dszPs+9L/FJoIt
         fognj3kwntQhnW4z6F12/3zfduIIODQ75AsbN3tlpI0wJkzNBsotrCruQ3OZ3ESLjPoq
         WfLkbwBNszH1i4bzkvZUGb5iB/6nFnZYUGZH3AfR/OsWPdhiBaan4llbrOYQefmiQ1Cz
         Y+kRn2+Fox5tH9NmGZKm/ve4DRz3jEPZSnmUYqz9QpECWdPWVvp2Q/YiJ9dPo9l+GST7
         W+4A==
X-Forwarded-Encrypted: i=1; AJvYcCWFwUFFevU76tPimogorfppUwkv1hpQ0Cd6qgOfUbKfGJYKkhiUYUt8iC5fnYwylDuI8jwEc6ndmiXyQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQoLfBIZiWmA5Rm0OtL2yhtqeIK9y/qw4spsnMPb4fiQ8iriR
	84E31sgH0GdadCuyoqaJ3gXcPel2OK88+v7DaxJNmytftEwu2+fygnD4i2I0WtpGU4RoSUsU2yQ
	+lTFh+046TgL5/XIWoxHSScDpBC5zqI8=
X-Gm-Gg: AY/fxX7smZN3QQUgWgkm/TkWiiJRSVVYY8U5TqbN9dMDbLiO1pj1xP0ANjYJQNh3gw6
	xg3pPlaNcpX50JWhQfU577UjwMHmGBnLn2MzJtwLhIKJfEjzqQQ4yZANRWn7+2nSWP0aHIi6D6L
	qpBA/6zblpS6bv0+vOOgnbB0Uc3afvF5QTvvmAl67dHAJy7hBfJM3y+ZzjVHqZUXaH4KU9FnivL
	sPKzPN+e3u88MK5VQXTVwjudO6oX4kllZ1n6LBlrFsTd6KIPcRMxb5XvzcOLD7h2eAVKgr8fpfT
	qaRWex4Ix8qoVCbSDQ2PC91EQbZzp6LADLTldllEaigHzaePkVx7PbJi
X-Google-Smtp-Source: AGHT+IEf1RMbiiLCCcOIP+//YLej1QuB+5BL7QbemlT3vMg3qeNAx3dtjkRmU/mTxIVuHubVDbuhUefeDwYCZVCtwHA=
X-Received: by 2002:a2e:a908:0:b0:37b:8f05:13bf with SMTP id
 38308e7fff4ca-3812169e048mr2179951fa.43.1766092842097; Thu, 18 Dec 2025
 13:20:42 -0800 (PST)
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
 <4900cf8f-9ec8-48d6-8187-126e111cd048@nvidia.com> <CALHNRZ_vZm7n-fZSVA1YzUPz0=znX_D6aBZ0nwUyjKdwcrO1=w@mail.gmail.com>
In-Reply-To: <CALHNRZ_vZm7n-fZSVA1YzUPz0=znX_D6aBZ0nwUyjKdwcrO1=w@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 18 Dec 2025 15:20:30 -0600
X-Gm-Features: AQt7F2rOKFnv0j_h2KhWjuTmfPNT0BjejXKaEal9deW7fZy_bxD2iDyMjOwaTVY
Message-ID: <CALHNRZ-PGV9OcuB4aGsqw+aj5xUpRTEd4_+v7=j9=oMo9rk0oQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 1:25=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, Dec 18, 2025 at 5:12=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 17/12/2025 22:44, Aaron Kling wrote:
> >
> > ...
> >
> > >> Thanks I added all these on top of next-20251216 (as that is the lat=
est
> > >> I have tested) and Tegra194 fails to boot. We always include all the
> > >> modules in the rootfs that is being tested. You can see the boot log
> > >> here [0]. We are using an NFS rootfs for testing and I see a message
> > >> related to the NFS server not responding. I am guessing something is
> > >> running too slow again because the only thing I changed was adding y=
our
> > >> patches. The test harness reports it is timing out ...
> > >>
> > >> FAILED: Linux Boot Test 1
> > >>          Test Owner(s): N/A
> > >>          Execution Time 219.31 sec
> > >>          Test TIMEOUT reached. Test did not report results in 120 se=
cs
> > >>          Percent passed so far: 0.0
> > >
> > > Okay, so. Modules are in the rootfs, none get copied to the initramfs=
?
> > > And the rootfs is on nfs? And for this failure, nfs never gets
> > > mounted. So... for this case, no modules get loaded, implying that
> > > whatever is happening is happening with the built-in drivers. Which
> > > means this case isn't pcie related. Are there any modifications to th=
e
> > > defconfig? It appears that there must be, to have dwc-eth-dwmac
> > > available. I will see if I can trigger anything when using ethernet.
> >
> > If you look at the boot log you will see ...
> >
> > [    7.839012] Root device found: nfs
> > [    7.908307] Ethernet interface: eth0
> > [    7.929765] IP Address: 192.168.99.2
> > [    8.173978] Rootfs mounted over nfs
> > [    8.306291] Switching from initrd to actual rootfs
> >
> > So it does mount the rootfs and so the modules would be loaded. I
>
> But the bottom of the log says:
> [ 188.360095] nfs: server 192.168.99.1 not responding, still trying
>
> So does it mount nfs and load modules, and *then* fail to talk to the
> nfs server? That doesn't make any sense. And I don't see any logs from
> driver probes after the rootfs line. And there's sync_state lines
> stating that pcie among others isn't available.
>
> > believe that PCIe is definitely loaded because that is what I observed
> > before. And yes there are a few modifications to the defconfig that we
> > make on top (that have been added over the years for various reasons) .=
..
> >
> > CONFIG_ARM64_PMEM=3Dy
> > CONFIG_BROADCOM_PHY=3Dy
> > CONFIG_DWMAC_DWC_QOS_ETH=3Dy
> > CONFIG_EEPROM_AT24=3Dm
> > CONFIG_EXTRA_FIRMWARE=3D"nvidia/tegra210/xusb.bin nvidia/tegra186/xusb.=
bin
> > nvidia/tegra194/xusb.bin rtl_nic/rtl8153a-3.fw rtl_nic/rtl8168h-2.fw"
> > CONFIG_EXTRA_FIRMWARE_DIR=3D"${KERNEL_FW_DIR}"
> > CONFIG_MARVELL_PHY=3Dy
> > CONFIG_R8169=3Dy
> > CONFIG_RANDOMIZE_BASE=3Dn
> > CONFIG_SERIAL_TEGRA_TCU=3Dy
> > CONFIG_SERIAL_TEGRA_TCU_CONSOLE=3Dy
> > CONFIG_STAGING=3Dy
> > CONFIG_STAGING_MEDIA=3Dy
> > CONFIG_STMMAC_ETH=3Dy
> > CONFIG_STMMAC_PLATFORM=3Dy
> > CONFIG_USB_RTL8152=3Dy
> > CONFIG_VIDEO_TEGRA=3Dm
> > CONFIG_VIDEO_TEGRA_TPG=3Dy
> > CONFIG_DWMAC_TEGRA=3Dy
>
> I will incorporate these to a build and see if I get any different result=
s.
>
> > Looking at the boot log I see ...
> >
> > [    3.854658] cpu cpu0: cpufreq_init: failed to get clk: -2
> > [    3.854927] cpu cpu0: cpufreq_init: failed to get clk: -2
> > [    3.855218] cpu cpu2: cpufreq_init: failed to get clk: -2
> > [    3.858438] cpu cpu2: cpufreq_init: failed to get clk: -2
> > [    3.863987] cpu cpu4: cpufreq_init: failed to get clk: -2
> > [    3.869741] cpu cpu4: cpufreq_init: failed to get clk: -2
> > [    3.875006] cpu cpu6: cpufreq_init: failed to get clk: -2
> > [    3.880725] cpu cpu6: cpufreq_init: failed to get clk: -2
> > [    3.886018] cpufreq-dt cpufreq-dt: failed register driver: -19
> >
> > So actually, I am now wondering if this is the problem?
>
> These lines are from cpufreq-dt trying to manage the cpu's directly,
> which it's not supposed to do. tegra194-cpufreq is supposed to manage
> them. I see these lines as well, when things are operating as
> expected. The real driver doesn't log anything, but the policies are
> visible in sysfs. I did a little bit of digging previously to see if I
> could remove the log churn, but was unable to do so. I would have to
> double check to be completely sure, but I am fairly certain I saw
> these lines before my changes as well. It's something that would be
> good to get fixed, but I don't think it's operable here.

Turns out, this is actually semi-operable. There's a blocklist in the
cpufreq-dt driver that includes all tegra archs <=3D t234 except for
t186 and t194. If I add t194 to that list, then the log lines go away.
However, it does not fix the nfs boot issue. I was finally able to
replicate it by setting up my own nfs rootfs. This series does not
affect it though, fwiw, it's the dt series that triggers this. Before
it, nfsroot boots as expected. After it, the reported issue happens.
After adding t194 to the cpufreq-dt blocklist, the issue still
happens. But... if I add "blacklist=3Dcpufreq-dt" to the kernel
bootargs, nfs works again. I don't get this.

So, summary:
* Adding opp tables to the cpu nodes causes cpufreq-dt to try to
handle cpufreq for the soc
* Adding tegra194 to the cpufreq-dt-platdev blocklist stops log
messages about the attempt
* However, it still affects the ethernet driver, causing watchdog
timeouts and adapter resets
* Blacklisting the cpufreq-dt driver entirely prevents the issue

I'm not sure what to make of this. Anyone have thoughts? I will send a
patch separately to add t186 and t194 to the cpufreq-dt-platdev block
list as this needs to happen in any case.

Aaron
