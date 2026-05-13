Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB101991D4
	for <linux-tegra@vger.kernel.org>; Wed, 13 May 2026 04:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646392; cv=pass; b=sPGDh3DL5yUXsrG/42qZR7to/sPhC5Yk+TPyzn0gxlNQ2TlIk4gA0dGiqdQBHG0Bq3uSYK5x68/MFDG/o680EyYnbYltvfhDgAo/mWIgKFZ5T2ZHDKYOgUqw3FdWs0I80ILsuFH+hiLjzpqesLT4gADwEnIv5vbge54CRz8IJVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646392; c=relaxed/simple;
	bh=Od/jy1kSO8cYiVwYqYVgfsO6PcYARFxGf8hhuSZCNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkQVNWGqrHlSsv6cg33mdzIz7HmfpFIkXy6pvxMn3JFXqzg95YfLp5Z2k2jtyNFSK4bGGxtXst0UF4DVHKTAVBxDxQ7+am0iX8KgQds0M9sVxIvkse647MoJF8pFbW2IdkXQTxjuzAolrhWRk65M0K0EB9Fb8EDQurYC/UQmtQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bq0IrsWu; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq0IrsWu"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a860667fabso5654909e87.0
        for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 21:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778646390; cv=none;
        d=google.com; s=arc-20240605;
        b=afmSXdjkQJKeXnRwIzG7HMYbqSU/zOlMLBNqPg0rN3b6XsPzDkfE0Bk5Pj3qmzEg87
         RDJ06VWxiVnsk6Uf47IY1OWtHLWLiqN8Yfzk9MT8aLqb6pfcaR+QD9ZKdZRUvq4oxRFE
         I54FZXlx4L2fudoWG0HQHUEpBIimlgXI/TLOQbRUNcvFnBed9/6O7rnfmwQ6Eru4ct27
         p/sUvfdrRQXRsuzs+u9ecc4vJDxBY4mylvSiiPwdIOgpfscFT08yMfpY0H3AtmEg4p1q
         z0pLJGoVnpRkeQmYMtdB5OIpPO+/DL6EG1cu4vELDH9Wu9SjgvbS2+XWffeHAYo2EaJY
         isbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Od/jy1kSO8cYiVwYqYVgfsO6PcYARFxGf8hhuSZCNSY=;
        fh=D0nATSRYxkKI3uxr7crp2d3W/VvMXazkZGaGX/gSxr4=;
        b=RI86P5w6FGrHhEujo4LoB7UwSURVlBGuL0uNZKDFJL4X38v8NcwZCnTB3pNIkZfGwf
         7v13KpwcsZeUvoKi0VoxIOdts2bvyCG6xDKNohWLqzuYFXmxkRXGqJvU3WNuNEAcO90L
         AuRh3wOHMOGszNC+IiyUpY6FFVVjFyr+V3IkUuFy+pEX/QT44RYyE1eLGMxGn7xqYBwC
         UK8OyHQx0YGzjzpMhlPikS1sNAf1+4Yh9pvuQAUNHDh36xzPo+gssS3/DPa0r/CK7fi8
         UMi7vUpy8bY/dqDApVSHGBWnWOqs4O/M+XitjbIgpqkr+cQQyeKXfKNx0UbqC7vI7dtH
         CVqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778646390; x=1779251190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od/jy1kSO8cYiVwYqYVgfsO6PcYARFxGf8hhuSZCNSY=;
        b=Bq0IrsWuemqgkJEPSpIdHjsJMbaFEYSJ+jTNHWMV0JwcltfuNxDMz5nuBbbDJ+7Mi1
         oJaBdz3u2F4hH0Ifw3wSTpi2btrl/gRsyfbFCW5LibfQBGWTWG/arrUcWrZpZn2PIab2
         X2rsE65k4i+hey2pwAUkmSyLTeYy8XLgNrID5Pau+fF1EiiEcek1GBz0tYfByyJXyjO5
         0HxeSCuSqRCgXEc3JU5zpv8Jfj5JD5HmzBIbbA82ffkxTmSXaOF4wwgxt2p4GJmYOJ8R
         7bj25ea0PllABUgc0qyy16zXABpFGZhX0CLnjbteRFQoZ8oRXDdBy2/afFD/ms7dQ8bz
         s8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778646390; x=1779251190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Od/jy1kSO8cYiVwYqYVgfsO6PcYARFxGf8hhuSZCNSY=;
        b=pkyvVSHgJUUNpRntrZaiAe3Lhs91FNWp7Wi2Jm3IhPCzI3R0G4KLF+xRTG/rjTMm4X
         gfc0O5TszHi0zKdotjQPdCOp4uanf8noXblUW5p3YwxXxmqdvqFgkED025aTEFr4BpsA
         N1PAnSHab3U27Wf5jHft73RcY+iC0izFnlA1KrT871+5k2o0m12zjIjv8XMyg6JLmAQC
         k/7vbADGc+CmGxhwKuHiKRo1OPnNikNwVnf/DnhQsgqnvfJVeujNKBBXB62HYtZt36hH
         CZwqYPfFPP2QC5HDjrU8+r+FPbmuONxNG5lf/3EPpDnEHqgyarHMqs+E3wz4wCxFWi6M
         meIA==
X-Gm-Message-State: AOJu0Yy6kM2AC5jHSLwdoqf1+buCFS2fbeV9aieFgIVr0eMNj/8maBcp
	bg45PgdqkarUQ4YXwTc8ytmpC4T94+alsqFCcJWBomPdOM8uS33t+KGbWeuUJjlfEr0CDRXy+a0
	wpxb+vFQ3SgrpKXm71n063X7BA3uKnhQ=
X-Gm-Gg: Acq92OHxO81qqIUHUox/0wui90HymKLp31nRFmNiGL4BcdnsIQd8x2kzOkKvF3pL0xy
	MiHCBtBofn5aGB8Hblj4+5KcDgVBd4DLtraqxr137+9fivBROa71Psl/jT+RHvKAQ9Vohbfd1vT
	lzCioh4LvzbPWGE3Xs4HFBGrM32gPvEKmvuNu15O3SEBTl9iK6cMLOMvoLSKo5u6roMQy38wndX
	AWrcovonmmUOzPpVcI4yn/zmTNkU5LJsb8RT+1J3s9OACGLjxw7M7infKiokynWmnvSbo5cKcm0
	w7URDwFmWbPtkBET1yrWerMoCa0skoTuYA/iiFRZLP39yRlMVig6KayxZ3UU6utdZEFi
X-Received: by 2002:a05:6512:3984:b0:5a8:9909:50a3 with SMTP id
 2adb3069b0e04-5a8ef9b33f1mr558092e87.32.1778646389282; Tue, 12 May 2026
 21:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ9mmf_4OagcooO-s+SU1KrggT5_ZwM--ambxZKXN-oQDg@mail.gmail.com>
 <I47hlmySTbquW1VgZFOofQ@nvidia.com>
In-Reply-To: <I47hlmySTbquW1VgZFOofQ@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 12 May 2026 23:26:17 -0500
X-Gm-Features: AVHnY4J05I14Pa6Vt4Ngz3X_e3VtIngTjwNHxIsqjoQPHNK2DwVj1oFmnqeuLK0
Message-ID: <CALHNRZ_EjqA4aeqZhmicRwdpMxjKp1QpwLW98dyRa36HBX8aDA@mail.gmail.com>
Subject: Re: [BUG] drm/tegra: DMA buffers are not always freed
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 10:26=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia=
.com> wrote:
>
> On Tuesday, May 12, 2026 2:29=E2=80=AFPM Aaron Kling wrote:
> > There is an issue with tegra-drm where some buffers get created, then
> > freed, but the dma buffer never gets freed. Causing display controller
> > memory allocations to start failing after the leaks fill up cma.
> >
> > I created an issue on the freedesktop issue tracker [0] with a patch
> > with some debug logs I added, then a log from Android that contains
> > these logs. CMA is set to 512MB, and when allocations start to fail,
> > the unfreed allocations add up to just shy of 500MB, where it's
> > reasonable to expect that 8MB contiguous is no longer available. The
> > log was generated on a Jetson TX2 NX, but I have seen this leak on
> > other archs as well, this also does not appear to be limited to soc's
> > with nvdisplay.
> >
> > This does not appear to be a userspace issue. The graphics allocator
> > works as expected for other soc vendors. And as the logs show, the
> > delete dumb buffer ioctl is called, but is not always followed by the
> > dma buffer getting freed. I have also observed this issue with a
> > gralloc that uses the tegra gem create and such, this is not unique to
> > dumb buffers, that's just the last log I had when deciding to post the
> > issue to lkml.
> >
> > What I primarily intend to ask here is how to further debug this
> > issue. I'm not finding any direct path between the delete dumb ioctl
> > handling and gem release or tegra bo free. Can someone point me to the
> > pieces in the middle I'm missing, where the logic is to decide is a
> > buffer should be freed?
> >
> > Aaron
> >
> > [0] https://gitlab.freedesktop.org/drm/tegra/-/work_items/9
> >
>
> If the issue is specific to buffers that get used with display, I have
> an idea of what the issue is -- there is some circular reference
> counting with the BO cache in the host1x driver, and that means that
> BOs that end up in the cache never get released.

As far as I know, this only affects display controller buffers. Though
unfortunately, I have limited ways to test the media engines right
now.

> Let me do some testing locally and I'll send out a patch once ready.

Sounds good, thanks.

Aaron
