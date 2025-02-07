Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024D23C8DE;
	Fri,  7 Feb 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946179; cv=none; b=m4QvAIexZILIO9SMyBv7sMNGAqnaVDAZawqlLH8r6hDVNyUGLFqHyjYegMprvHjb4+S4w0hDDVwusa2RRRac8vCecp+djVJU8ueiHtyl9d/10wrLGCU9hFTMdBBvxGEN0bf9X5QX33/tZPbx49zJviJ0Y6jgUecw9N9hr5goHJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946179; c=relaxed/simple;
	bh=GoRnrOJNF2v2pKCP9TwMINEk/TI+ukjYs9lRbvKzkyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyR/hY2LCH/42cVDy7oV/2qITr/oKHxqZ2COz91gJHNHU5W6JrZikX5bA2HRU0n5bzyr9kDzwi+/9jSbxrEgNGkPekrG9xLFf+ktxonsTMc25FYmnfQqPtjEezAfeV/mLZTEOeaIU23NWOo0+ls3Nq3gdbm/FDbe+Mftu74jcq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9tKL2f/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9tKL2f/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43635796b48so14028185e9.0;
        Fri, 07 Feb 2025 08:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946176; x=1739550976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9nUdb2GvBThqgN+D48FvtJqf/3N0UIxoSUn7Ei15VQ=;
        b=d9tKL2f/DnbjLr1SsHqzRE3HCs7Aj6SGLFZuNB43nMUr/RiGOKxbD/xCfM1ScGD8gg
         bz5JhrD+JiXX+qp3G2vn4kZePpnx23r+rtLiqxPOW375mbiYdd8Vo+0sWz8JpBTeXYJK
         RMu7m7IHbSxZqsMrV0aymbnyttg0Iku6AQuHpGdcU5Z9mN76hJhmKzEt2ccV615wme5Q
         eGwzVa8A0AmuZwTF96/Knl7MihV89WMoTvpUoScFB3PqH6ibOezK3uPEISR+4oUwsv20
         cnkF474JL+YbT3Yc+G2BQa5idwJiR4hH82SY20pvYo7mqVTzV2Pnx29xFb61vAdYapLs
         Z7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946176; x=1739550976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9nUdb2GvBThqgN+D48FvtJqf/3N0UIxoSUn7Ei15VQ=;
        b=fe6LkMzAmFXNT4T2In4qTLmICDs71KGEq/S7q14xI+wmxJoIj1iVS/r9vnlVBxwKgC
         yPu3/3b6ivbTyutWBtxbTSeNDsCuSuKZSz/aTmQjYmwCvvp/bxw58ZTkTO48Fiei0Zc0
         VjqDTbmahw48X52G1Gl6KAzBTaOk5gPjpUuawI+DNiN2+d80Q5dHhoF8Ck0/SOE9dsDz
         7Z8amvJSVuI8yBvlSP2hfPJGKy4lM4i9lcI1qK05akI60hMnQKMLIB2EVfuHaee78oP+
         LNURXje8q3ieOg34vSHuInlgOnkkZMERXwou33vA1M7ueQt6iwPxjG0KfEap+E0oLBQQ
         le8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhdXlZaWbbqBYfmvbMpYrjcsfGbBGD6YJ8Hi9jN/CRgBtum/7yams/HbCHtw+qnBP0ozFakNq0KvqEQYM=@vger.kernel.org, AJvYcCX5AAZ4YbTD4p9avJMaGU2dXcSligIvOhdO5cBeUk4DP+THxSuHZJOV1WB8ICMxqVssm5MprTn9oCpKyxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRcPWMYy213ZKs6QCwOpkGK4CsxLuD2mdRu3gNMAEo+5GW+wU9
	6/gTF0Uyc+YPpzN9rIRW+qcwStmUsZbdXGz1Y2ovhLTdixl007jw
X-Gm-Gg: ASbGncu52xkKKg3FbkhmYVnMVvt1tCn9yPT39fRfIYK3Ali+Y/BvR/tQhUYw0uML9vr
	IZdy3+6H6cGA3wP+dcuotBGW6C33ohv441vj4S6rnhvnkVcYAPjbW+khQi66rsgBOpEu1DutECl
	7SOy6+c4a2Qh0EjeN/xNdnHKgTQw+sdxkmRZptAYpEDMZi/KurM3zQPKf6ADu8n5b0VjXj0psfv
	ZF7T+evVBqzy+O8e7z1/9ZjuAVSFsP7VNPoFJRX72pl4WX9PfdJYMNAKjwwJgs2v8uoKjSt7SE/
	GlbVH5ZbXx6BdOgy0D9j/TQKgccFOA84vfZuckJa6Lz9zeC6oL1Q06APubLOIvz+WOaiSzDvw31
	zKA==
X-Google-Smtp-Source: AGHT+IGhtmsEbzQcaf+8NICJY1up8ff9KOtypRQ7vNYCqN6W16osuJdw2mnIulQclN5H9+bdRh/3dg==
X-Received: by 2002:a05:600c:198a:b0:436:1af3:5b13 with SMTP id 5b1f17b1804b1-43912d49c3amr67161965e9.15.1738946175138;
        Fri, 07 Feb 2025 08:36:15 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da965b3sm62277455e9.5.2025.02.07.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:36:14 -0800 (PST)
Date: Fri, 7 Feb 2025 17:36:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: rusingh@redhat.com
Cc: airlied@gmail.com, simona@ffwll.ch, jonathanh@nvidia.com, 
	mperttunen@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Fix a use of uninitialized mutex
Message-ID: <3jpwmb4zt7ykjclzcqmc6rkhmzl4vydefrece7eirnrltcryod@fcmmakzfzapf>
References: <20250206155803.201942-1-rusingh@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s5hrl7oke7odb5io"
Content-Disposition: inline
In-Reply-To: <20250206155803.201942-1-rusingh@redhat.com>


--s5hrl7oke7odb5io
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: Fix a use of uninitialized mutex
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 03:58:03PM +0000, rusingh@redhat.com wrote:
> From: Rupinderjit Singh <rusingh@redhat.com>
>=20
> commit c8347f915e67 ("gpu: host1x: Fix boot regression for Tegra")
> caused a use of uninitialized mutex leading to below warning when
> CONFIG_DEBUG_MUTEXES and CONFIG_DEBUG_LOCK_ALLOC are enabled.
>=20
> [   41.662843] ------------[ cut here ]------------
> [   41.663012] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> [   41.663035] WARNING: CPU: 4 PID: 794 at kernel/locking/mutex.c:587 __m=
utex_lock+0x670/0x878
> [   41.663458] Modules linked in: rtw88_8822c(+) bluetooth(+) rtw88_pci r=
tw88_core mac80211 aquantia libarc4 crc_itu_t cfg80211 tegra194_cpufreq dwm=
ac_tegra(+) arm_dsu_pmu stmmac_platform stmmac pcs_xpcs rfkill at24 host1x(=
+) tegra_bpmp_thermal ramoops reed_solomon fuse loop nfnetlink xfs mmc_bloc=
k rpmb_core ucsi_ccg ina3221 crct10dif_ce xhci_tegra ghash_ce lm90 sha2_ce =
sha256_arm64 sha1_ce sdhci_tegra pwm_fan sdhci_pltfm sdhci gpio_keys rtc_te=
gra cqhci mmc_core phy_tegra_xusb i2c_tegra tegra186_gpc_dma i2c_tegra_bpmp=
 spi_tegra114 dm_mirror dm_region_hash dm_log dm_mod
> [   41.665078] CPU: 4 UID: 0 PID: 794 Comm: (udev-worker) Not tainted 6.1=
1.0-29.31_1538613708.el10.aarch64+debug #1
> [   41.665838] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit=
/Jetson, BIOS 36.3.0-gcid-35594366 02/26/2024
> [   41.672555] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   41.679636] pc : __mutex_lock+0x670/0x878
> [   41.683834] lr : __mutex_lock+0x670/0x878
> [   41.688035] sp : ffff800084b77090
> [   41.691446] x29: ffff800084b77160 x28: ffffdd4bebf7b000 x27: ffffdd4be=
96b1000
> [   41.698799] x26: 1fffe0002308361c x25: 1ffff0001096ee18 x24: 000000000=
0000000
> [   41.706149] x23: 0000000000000000 x22: 0000000000000002 x21: ffffdd4be=
6e3c7a0
> [   41.713500] x20: ffff800084b770f0 x19: ffff00011841b1e8 x18: 000000000=
0000000
> [   41.720675] x17: 0000000000000000 x16: 0000000000000000 x15: 072007200=
7200720
> [   41.728023] x14: 0000000000000000 x13: 0000000000000001 x12: ffff6001a=
96eaab3
> [   41.735375] x11: 1fffe001a96eaab2 x10: ffff6001a96eaab2 x9 : ffffdd4be=
4838bbc
> [   41.742723] x8 : 00009ffe5691554e x7 : ffff000d4b755593 x6 : 000000000=
0000001
> [   41.749985] x5 : ffff000d4b755590 x4 : 1fffe0001d88f001 x3 : dfff80000=
0000000
> [   41.756988] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000e=
c478000
> [   41.764251] Call trace:
> [   41.766695]  __mutex_lock+0x670/0x878
> [   41.770373]  mutex_lock_nested+0x2c/0x40
> [   41.774134]  host1x_intr_start+0x54/0xf8 [host1x]
> [   41.778863]  host1x_runtime_resume+0x150/0x228 [host1x]
> [   41.783935]  pm_generic_runtime_resume+0x84/0xc8
> [   41.788485]  __rpm_callback+0xa0/0x478
> [   41.792422]  rpm_callback+0x15c/0x1a8
> [   41.795922]  rpm_resume+0x698/0xc08
> [   41.799597]  __pm_runtime_resume+0xa8/0x140
> [   41.803621]  host1x_probe+0x810/0xbc0 [host1x]
> [   41.807909]  platform_probe+0xcc/0x1a8
> [   41.811845]  really_probe+0x188/0x800
> [   41.815347]  __driver_probe_device+0x164/0x360
> [   41.819810]  driver_probe_device+0x64/0x1a8
> [   41.823834]  __driver_attach+0x180/0x490
> [   41.827773]  bus_for_each_dev+0x104/0x1a0
> [   41.831797]  driver_attach+0x44/0x68
> [   41.835296]  bus_add_driver+0x23c/0x4e8
> [   41.839235]  driver_register+0x15c/0x3a8
> [   41.843170]  __platform_register_drivers+0xa4/0x208
> [   41.848159]  tegra_host1x_init+0x4c/0xff8 [host1x]
> [   41.853147]  do_one_initcall+0xd4/0x380
> [   41.856997]  do_init_module+0x1dc/0x698
> [   41.860758]  load_module+0xc70/0x1300
> [   41.864435]  __do_sys_init_module+0x1a8/0x1d0
> [   41.868721]  __arm64_sys_init_module+0x74/0xb0
> [   41.873183]  invoke_syscall.constprop.0+0xdc/0x1e8
> [   41.877997]  do_el0_svc+0x154/0x1d0
> [   41.881671]  el0_svc+0x54/0x140
> [   41.884820]  el0t_64_sync_handler+0x120/0x130
> [   41.889285]  el0t_64_sync+0x1a4/0x1a8
> [   41.892960] irq event stamp: 69737
> [   41.896370] hardirqs last  enabled at (69737): [<ffffdd4be6d7768c>] _r=
aw_spin_unlock_irqrestore+0x44/0xe8
> [   41.905739] hardirqs last disabled at (69736): [<ffffdd4be59dcd40>] cl=
k_enable_lock+0x98/0x198
> [   41.914314] softirqs last  enabled at (68082): [<ffffdd4be466b1d0>] ha=
ndle_softirqs+0x4c8/0x890
> [   41.922977] softirqs last disabled at (67945): [<ffffdd4be44f02a4>] __=
do_softirq+0x1c/0x28
> [   41.931289] ---[ end trace 0000000000000000 ]---
>=20
> Inside the probe function when pm_runtime_enable() is called,
> the PM core invokes a resume callback if the device Host1x is
> in a suspended state. As it can be seen in the logs above,
> this leads to host1x_intr_start() function call which is
> trying to acquire a mutex lock. But, the function
> host_intr_init() only gets called after the pm_runtime_enable()
> where mutex is initialised leading to the use of mutex
> prior to its initialisation.
>=20
> Fix this by moving the mutex initialisation prior to the runtime
> PM enablement function pm_runtime_enable() in probe.
>=20
> Fixes: c8347f915e67 ("gpu: host1x: Fix boot regression for Tegra")
> Signed-off-by: Rupinderjit Singh <rusingh@redhat.com>
> ---
>  drivers/gpu/host1x/dev.c  | 2 ++
>  drivers/gpu/host1x/intr.c | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to drm-misc-fixes, thanks.

Thierry

--s5hrl7oke7odb5io
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmemNnwACgkQ3SOs138+
s6FKaw//X3XB+8Fz3hObndGjgD0aZEDVlRqsB+84ommmdSfn9suky/dowzx6UshJ
Ajijhdm+43mNDUKTi9LI+RYG9cvi7SYAu9LX1ZSVJsTWNPGuNJenBUAdarkoEXqu
iwwmpGgBx2tL++TZeF9B+lJKAUgM9L5wS7DrrLpM3vguB3q8F/p0M9uIvd9nf/y0
nh/2fR0mwrgzKAZcVHlXcCDKAblW/bRufIdF8tsX+jZJZHSvFiZ5E6FI3fRpq8tv
uZrz0rDVWP/IbTNrYlY1pLyK5P43142UNtyrafIhBPwcMPWdT7L0YTubkV1lp5FK
ckarw/uh576SkfCcvE6mWYxJ5ZSi68zL8oxDB2aDvrJ2oIJk+RGRY0JjY4ion6X3
wCso3ITOvjIX5b1mMkyehEvxMGcuWji5wZVgaeI9pADMUm/nrnTZAfdJQvHnUu4t
mk7ImS9S5vCIix/Tz3b4hkU6/rWU4jI0ERXKoBgGg5PQGnYLjvRCa0WbfDDy+irL
QbriR/Qz6oT6c46996DvY5pE9qhFIf1wVB7IbqOzJowsrTxcHcYfn2jLpZsUjFU8
Bqkja8z5Ke/cLfpOcuJSZJ97FGOXhq9bXqUiZIlUi5PG0N0Gd9fgFnXEzrMC+g9d
WqLMjCs/KeTytK2wwuMbxdN5yEbdSuYXaRHIbCkFfLP0aZ2Q2Oo=
=R8SY
-----END PGP SIGNATURE-----

--s5hrl7oke7odb5io--
