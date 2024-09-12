Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183513CFB7
	for <linux-tegra@vger.kernel.org>; Thu, 12 Sep 2024 20:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174692; cv=none; b=RYcf5tW08mLrQqze2N6cIp82bNbvtldqGnJj2UcAWU5rDlgGdpF36Ji2a+SBGPntkxUMJKRGEnD4STKwzo3ARFdl8YYL3w4jnbxWsIdZ8CZHInWYBhXWOSpPM7M/9qIkf24yJSGAfmpeb+aOLPZqGyxFN4wWR17k3E9TQ4Np8t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174692; c=relaxed/simple;
	bh=MYDZvrqlWEpmfJ0PC8MrAJxxkqkqQuxjGFHhVbXAtYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufi5Cfv5hCBhz1UyLCAinuhqqXLLVzdKecDzAuOW4UCgGs5OE4EoGcMDduzDhMit37ljUOOHBtUQ94KoojPd7L52rIpQSfHCWMVFSlJfYWqB0KC5sMMKfeKDt6teiFlIzbqJ0VJzbBaxAoSO/cPOa0Y2LJuPHeqypVqBbWo3TMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zMYKHmeH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zMYKHmeH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2068a7c9286so2321645ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Sep 2024 13:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726174689; x=1726779489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=awElkTLWK6u37rMcH6vV+9dmrRY/uH5yY9ycJ6GvqvQ=;
        b=zMYKHmeHeQVgR09jItL/tqN8Iu4Z3xtNVUJI3mfrZ+xz47TgmOXyD7WQL1V+VVGI3b
         057mf/boAlQUxGXeRg11VB7fhHybVjqZLyWIvQcSGLVNYAvEv6iVp2R/U2+FSV02jjcd
         suOfT2n8WEHaIQZ7MAl3Mw314o+l/CEiO4Pp1cMKbQGXY3VLZ/4NDcgIO8whd3++PjfM
         bYNypxqJ5LyaYGOl2easU6fx3QBQhOBcywyL59Sdf/VWM4nvA43cJPIq7jivxdDaK1Wr
         50tRSpf6h/DSxjes6lm4PoYYfAuZHQUzhdoTCApthYu9TE1JgagCpEIBtR2wsA4IRZTO
         6LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174689; x=1726779489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awElkTLWK6u37rMcH6vV+9dmrRY/uH5yY9ycJ6GvqvQ=;
        b=mnmClNUqUrSG9GSoVfQOrqz0CEETSIqc50b9KDKNUOyPL1SWDKiRS0W9V5Q2k0/Cpz
         2JxJaIrAX2g7SEtfKLyv/zbaZuFrRhi2lVGBxC5e6fMDQZQVkW9DEGErUbnM9pPn5rPS
         Hyhw8WOz1D0ywbxq40ERxx4KqcPP69DMDxKR50SP+fu8pcH82V1FB2ZZDAVhrX3XhOVB
         1tg1GZqXoWQIjpgMPLZl7w2kTr7ssk2azzzenFD6A34ZGJwaxA+CzfQvwsoezYHD3jI2
         KRL2QQqaEf6Rnao65xoVegZBUFm+/7TXtJ9D8iKIihRgLf7MpVLBtkQtxaSfTU5LR7l9
         2b0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRiJyGGKF7a8ef9+N4ONrNp0F8IoYEHdbiM8OhMmd6Vi/xDd1SLZ8PBUKF6ZhJ9942Akv/oinnf5RBhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIWyAxVUvMErZ+1pSMPQvPSpWCClWt0gNLs03BI4FKAPC7KhhJ
	6sJjycrBirQBeyMRplrAvdXCLdlI8aB90Ii1EWrB13i7ZyxEB+GN+uNk+DOVJq8=
X-Google-Smtp-Source: AGHT+IFNbFNRlMUVnmzvIAqMYOHLNoYiu39w2cW+++5PhbuKhP72IpMktdJxCrIrvKb5Z0jSCotKrw==
X-Received: by 2002:a17:902:f60e:b0:205:809c:d490 with SMTP id d9443c01a7336-20781d61d67mr8439965ad.16.1726174689001;
        Thu, 12 Sep 2024 13:58:09 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b0097desm18030445ad.247.2024.09.12.13.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 13:58:08 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:58:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Message-ID: <ZuNV3ewTH63lb972@ghost>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
 <20240910-fix-riscv-rt_group_sched-v3-1-486e75e5ae6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-1-486e75e5ae6d@gmail.com>

On Tue, Sep 10, 2024 at 08:51:07PM +0800, Celeste Liu wrote:
> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> introduced it because of Docker, but Docker has removed this requirement
> since [1] (2023-04-19).
> 
> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
> needs an RT budget assigned, otherwise the processes in it will not be able to
> get RT at all. The problem with RT group scheduling is that it requires the
> budget assigned but there's no way we could assign a default budget, since the
> values to assign are both upper and lower time limits, are absolute, and need to
> be sum up to < 1 for each individal cgroup. That means we cannot really come up
> with values that would work by default in the general case.[2]
> 
> For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
> can only be enabled when all RT processes are in the root cgroup. But it will
> lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.
> 
> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
> support it.[3]
> 
> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383
> 
> Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>

Acked-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/configs/defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 12dc8c73a8acfaa5c8f442968a807de303428d9e..de85c3ab261e6d62b2089a3c89bdc9d1b34fa792 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
>  CONFIG_MEMCG=y
>  CONFIG_CGROUP_SCHED=y
>  CONFIG_CFS_BANDWIDTH=y
> -CONFIG_RT_GROUP_SCHED=y
>  CONFIG_CGROUP_PIDS=y
>  CONFIG_CGROUP_FREEZER=y
>  CONFIG_CGROUP_HUGETLB=y
> 
> -- 
> 2.46.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
