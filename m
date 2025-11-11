Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E74C22257E
	for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 23:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762903075; cv=none; b=Zx57cz7Ym3Erfn3G0QVnKjRgDPwPLoFXyc3eI4XdJtgb+03A/g/H7ItZ8qFjkFQJJoKlvx8hByS0oEau+cq2gv1xmzkwt4FJZE2av7g7Oz2YjLX9hrBXaQ+wJiY5Cvbi6Je8M3XklKkAOYwfDl2M7226fxNKCii+oRiXJx/2dyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762903075; c=relaxed/simple;
	bh=piyjk0UICuFLylh+Sm1fnefVrHatXFXMF4SInyqrXeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hdc14RBKMQv77m7YcFIp0x+whd8lHq8X8vGzKjmdcun4hq1jIlxmgdLkrQS7Ed3RK6Z22DVtFzW3+twJCEVXawORvJcGKh7fHUSsYQcqIFPs2SnypluKhjoolx0q+cZoDB0rATgM9WysdJDlBcVDRwcOgX4i8SpPnsXYhjkpBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHAtLRy2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHAtLRy2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59428d2d975so213440e87.3
        for <linux-tegra@vger.kernel.org>; Tue, 11 Nov 2025 15:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762903072; x=1763507872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxXzAibViSwAAylldqlTc3TG7DUM2kT/SoBJQ9gVkp8=;
        b=DHAtLRy2efxfkL5EDn8JoBILhV9Z3d5BY+fyahqwi24rTOLBwyoECxfpsNvUXMhcXa
         0EEyWwdMD4jCsWttrb2Mz/DgA3MmH6jDPkDSLUNtTGoFg/ThllpkQGepG6qWkB8M/7kQ
         QBDq8tKCxNoYuVh9PY3aRfeIEOFXB7PlB23VdgDd3PlwDRpZiogvmNJHbBGRF1eW9Of4
         4ZJ2afMZ2EnySSW2ZBbivIieZs9jyhhHkpMCiDWVRiYmhkWvZq+uBzV2l9PTgr/ajgZW
         p8OovpE7dg0u9v/et/aOcv/c5p8Bz8wY7qNBkRozXn/aeAtynbLXp/pTy8kYz39yFnhQ
         U9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762903072; x=1763507872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XxXzAibViSwAAylldqlTc3TG7DUM2kT/SoBJQ9gVkp8=;
        b=uNir9G0emkQdKSvKj5FE+tj4i6/xoVfSHLzq16Mifhz4ddMNPgKkcivioJ1jkX1eoI
         ioe09b3nvi7Mn7gn7uaP4JsWlRUber9kyb4y7IOlmribPLn0gqu9oW4ASRVy9rRr+Bta
         taJYSkulVKnXcxxi7nkM5cOzHUQ/pkOCucVoiGZ4oo4ySx9ocgRInCwwPV7iqQLa6DN8
         1f4rqUiScNXrEQz72RxaPmrTeeTFTAoZeXECAfKkF1ARJFn1b27DwhM0o6WMAccSKoJP
         sj8HEPI/XknHu6w0LV2C9zPjY1dy29ktSoOP3nQS97UJCkd0EMACbFjNa+R+kCiCCx14
         24IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvUSm9zgZYALymG12vcUBiRPcnpEg55/S9X6c95unK5ZKaZqVtLHOHrLIK9t/WXx2GMebuG9RExvw2bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfuj5bSA0Gu0W2YolMKV6eIkxp4FuLaTX4xt+zA3KdHMdHkCe7
	IPIPohkdEpWOZ24cIc6Qa4bxjIueVogrXgg1Lso/dMmd4qZ5afURedaxQ4EN9aI+5tmr46jMHG4
	MdH37bbe++okpEyV6ON3lRaOZX96/K/Q=
X-Gm-Gg: ASbGnctx1ewWdwP6vzsVgxdeB5qxY0LdgSvA3HBqS2ln4IGfWUfTD5eWH1gQ4vvYCtl
	VfJZrR1cpoQ0og6tyH8hTK5Bb/1Iwc4XWR7tqx977Ue+RqN3N7h/+R1yYTco73YrzRzM9pbTyc1
	dM0b3+XkLYifcrw9JRj9+oSkHAvadMLCIaF9AttL2ywDfJScF6oiD4o9wx3o4fcwBjaXo6Gyyjd
	w48V9ZCdLEKxd+MrYjmLq/af9vTpEz+O69tg6EM7sNK6wBHXPfUsou9GZdUL44nRUXxYeY=
X-Google-Smtp-Source: AGHT+IECOFMI8OdowjaSX2iDsqoM90iLrXne/fWxcejwflrbsKpPRHv9RqN3KIY7SrMPz9KQt1HDoSYoHFJRU6eT+YM=
X-Received: by 2002:a05:6512:39cb:b0:594:49ed:3ced with SMTP id
 2adb3069b0e04-59576e40572mr245993e87.54.1762903071425; Tue, 11 Nov 2025
 15:17:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <20251027-tegra186-icc-p2-v4-3-e4e4f57e2103@gmail.com> <82c8dda8-6fcb-48f9-bdaa-f3d1431e41ae@nvidia.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com> <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com> <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com> <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
In-Reply-To: <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 11 Nov 2025 17:17:40 -0600
X-Gm-Features: AWmQ_bkYm4fjvjDrlS3yKb85hc0z8ySFttCNXBmRTjm0WjIIiGVUIlHpFMqe8b0
Message-ID: <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 3:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 11/11/2025 17:04, Aaron Kling wrote:
>
> ...
>
> > My setup uses the boot stack from L4T r32.7.6, though cboot is source
> > built and has had changes over time to support newer Android versions.
> > There shouldn't be anything there that would affect emc clock, though.
> >
> > I'm seeing the emc clock stay at the boot value, namely 1600MHz. Per
> > both debugfs clk/emc/clk_rate and bpmp/debug/clk/emc/rate. I don't
> > even see 250MHz as an option. Debugfs emc/available_rates lists 204MHz
> > as the closest entry.
> >
> > I'm trying to think what could cause a drop in the selected clock
> > rate. This patch should only dynamically change the rate if the opp
> > tables exist, enabling the cpufreq based scaling via icc. But those
> > tables don't exist on linux-next right now. My test ramdisk does
> > nothing except set up sysfs/procfs/etc just enough to run a busybox
> > shell for debugging. Do the Nvidia regression testing boot scripts do
> > anything to sysfs or debugfs that would affect emc?
>
> So this is definitely coming from ICC. On boot I see a request for
> 250MHz coming from the PCIe driver ...
>
> [   13.861227] tegra186_emc_icc_set_bw-356: rate 250000000
> [   13.861350] CPU: 1 UID: 0 PID: 68 Comm: kworker/u32:1 Not tainted 6.18=
.0-rc4-next-20251110-00001-gfc12493c80fb-dirty #9 PREEMPT
> [   13.861362] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [   13.861370] Workqueue: events_unbound deferred_probe_work_func
> [   13.861388] Call trace:
> [   13.861393]  show_stack+0x18/0x24 (C)
> [   13.861407]  dump_stack_lvl+0x74/0x8c
> [   13.861419]  dump_stack+0x18/0x24
> [   13.861426]  tegra186_emc_icc_set_bw+0xc8/0x14c
> [   13.861438]  apply_constraints+0x70/0xb0
> [   13.861451]  icc_set_bw+0x88/0x128
> [   13.861461]  tegra_pcie_icc_set+0x7c/0x10c [pcie_tegra194]
> [   13.861499]  tegra_pcie_dw_start_link+0x178/0x2b0 [pcie_tegra194]
> [   13.861510]  dw_pcie_host_init+0x664/0x6e0
> [   13.861523]  tegra_pcie_dw_probe+0x6d4/0xbfc [pcie_tegra194]
> [   13.861534]  platform_probe+0x5c/0x98
> [   13.861547]  really_probe+0xbc/0x2a8
> [   13.861555]  __driver_probe_device+0x78/0x12c
> [   13.861563]  driver_probe_device+0x3c/0x15c
> [   13.861572]  __device_attach_driver+0xb8/0x134
> [   13.861580]  bus_for_each_drv+0x84/0xe0
> [   13.861588]  __device_attach+0x9c/0x188
> [   13.861596]  device_initial_probe+0x14/0x20
> [   13.861610]  bus_probe_device+0xac/0xb0
> [   13.861619]  deferred_probe_work_func+0x88/0xc0
> [   13.861627]  process_one_work+0x148/0x28c
> [   13.861640]  worker_thread+0x2d0/0x3d8
> [   13.861648]  kthread+0x128/0x200
> [   13.861659]  ret_from_fork+0x10/0x20
>
> The actual rate that is set is 408MHz if I read the rate after
> it is set ...
>
> [   13.912099] tegra186_emc_icc_set_bw-362: rate 408000000
>
> This is a simple boot test and so nothing we are doing via
> debugfs/sysfs to influence this.

Alright, I think I've got the picture of what's going on now. The
standard arm64 defconfig enables the t194 pcie driver as a module. And
my simple busybox ramdisk that I use for mainline regression testing
isn't loading any modules. If I set the pcie driver to built-in, I
replicate the issue. And I don't see the issue on my normal use case,
because I have the dt changes as well.

So it appears that the pcie driver submits icc bandwidth. And without
cpufreq submitting bandwidth as well, the emc driver gets a very low
number and thus sets a very low emc freq. The question becomes... what
to do about it? If the related dt changes were submitted to
linux-next, everything should fall into place. And I'm not sure where
this falls on the severity scale since it doesn't full out break boot
or prevent operation.

Aaron
