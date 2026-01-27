Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF14355057
	for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526356; cv=pass; b=bqnz4F7iJT4XoF13XDe7o9kTQJPcmFd+pzaZmD3C+NoB9BkCd0hofnrzUTRy67GHbGeAcBckazgwMRl0uEyBYR3rWhB5d4frP6ZYjGpITEZTplLR25P/TgNv2ZvDLF1oPk0Jfw7mdbYNqScu7FZh8slB25537+3/mNM9rCpUnEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526356; c=relaxed/simple;
	bh=EZIz1/cie9/IQyg7v8expstk7RzQ45xYU7SHO9pVxmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZV8wm4XOvfWn/xcx23LDwl7UVrm7gBpfS24emmrANlAzQYyU38mfMBSQO7afqlx9A9UdgvrHdzHpNrdCZq1Jrr3PeHHbCmDo/7U2Orb5BwC5T37ucLND38SgMXn+jOiSKKTtGjGql4anOSaZM4q1RwkQ4HTEzsRiRABbQF7MfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv9/nN70; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv9/nN70"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7cfd819ae5eso1558046a34.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Jan 2026 07:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769526353; cv=none;
        d=google.com; s=arc-20240605;
        b=FBzNqfip8FIHogW11OwbD5bFbYLOfv3Vby6QfNZSgb4MHm8eo3z8qpyEK2QnCd4YAA
         hENGyqOKDuLXQxw+2MQJT/abvHbc5H8hJ05sXPfDin1Bs0pz6vQP/JnOwcxlsFYSNyrC
         Myqej4OHmI5KOpBrUL5uFitNzQD9dAK7s0iTGEKrat/s/9AZ5z6nGSWebRiFUnfdFROQ
         3cUITiAlDjQvUeQevDMUDhshXnLkeRXt4Sax1PAkmHX/K3NwRmJPxt7wLb1g3cardwT1
         fjBl5qCgb450QirJjPvrdLUauKFpZjbNm8ZiewCc0K9UYEGUob/QH+eF9dc79Be4LpEf
         IrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2C+7oP2S4I0NADOrtRsPULHH3X35yibIt1qfthHwO0=;
        fh=LB0pHojJXnIGhqxCDm5uZStWK1S3+pNhENcDNUjP27M=;
        b=MYNxAhJnvoOxKCJ0YfXoFDWctRvG15jSzJav1VtNLcZhKBwC8tjj/lfKEbL8H/jBfV
         xHp2z/XRDBg4IX2u1St0WXWaIFX5oBwakqSxprILU5+CbkDKL8pdfKd5dysF5A4Oe0yu
         jdmpaVwQX5K/Gr/wGG5RQ4v+ynQjXp+Mqc14T3idGJdrE0ezq+FKrt8CaVUH2+Ep1BEY
         fp+c9Uwg7itVJTRlpuyZkK+Ky6IejmBSjlXsAiFxCOczdJMx2dmr8ZnTgLTJnFACT4OO
         8NvDOVDkC7KoOJ35HzmmCwtt8AzZIG9pfdcNcLe+/QBzl5iJsK6qW2YtrqNcbPgEEkFw
         JJ3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769526353; x=1770131153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2C+7oP2S4I0NADOrtRsPULHH3X35yibIt1qfthHwO0=;
        b=bv9/nN70vNyY49dhPMMye8GYSP4+trgIAinxVjJRw9zW3A/lWOHG2JDjjoOUpQui/q
         ZBxGJF199awFxBpzUy3C0caKjF18RTe9nW1RVOpU/s0/UXInEqM9bQTcIoHj7v/NrXe/
         5lCMPWgj3axu3OpHEBmQEFavvxnQh5Vba4ASIB/AnnSOy6Mdb9RUnsJMXMPMLsRUOOzK
         UFdgcZag0m9IN5YJftOxqso4lVLiP/q8Xpd7emiahbV2rUi2ruowy9YXE9WOZArBsN8V
         bRGQXBwqfnKU4bUHz7JODokqo2KQ5sI7EXhnpYgaCCkBS8Ae+85nDj9/ge9NySQw/WEd
         RN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526353; x=1770131153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2C+7oP2S4I0NADOrtRsPULHH3X35yibIt1qfthHwO0=;
        b=KIsxeoiKApS19ZnSZ8FYf7W3MAH70kbOzPMfYYPOaQobzwwTAXfwaCLi7vTV3+KXue
         n+RE/gPzo3wEN0ow/aSKhl6HUtK08JvENZFZrkdeCpljQXaBVPcahA3P/1LfZEuvEVT6
         YE+a2/GkED/drfkosGAJ6tUJQgpR4ifGm3lS4CSD8YOFy8jZZVDUQng4CwIGaWPz1+6S
         lhMzHlwpmuNox32SRLgVGGyPdeuvs+81pqx9W2G+yDoliT+STOOHr0hJhQRzgFg9BoKk
         Ms9IoFs7iTW0SabJ9xKW6jjPEsP8MHxcr0mU15Dt1U/1o9okFLcf9FdGFth4Ijtz37zL
         z3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1FwEAc3um5FZuIN5AAE3AIEMYUdVTaGbsKJ1GEjGF5RG+yy4FUTGVB5zZA6IcnKNuCjdexYGbbb/+rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGcn/rR82u/tCr0RDmYoDcOBWuIHebISHZtqMFqbhc58D1xpD
	0PZ6LyCKDOwMrAgMRdDWVOwhFTjDz3j/jxEfi59FVEKZlUw+MindfHwj7kvi/Zz2axIgUuGZ+ah
	la2GtpmjW6rVI4g50BEGwwP+gzJCzLA0=
X-Gm-Gg: AZuq6aIjDLf96tkA1Zvf9iF3w/GgCgPl8IKJwc9EwWJJQyFa+SVR4OMjuC2KKZc8z56
	Bne9jdFnn8YQexobsV5XgdPcRp/nFcyOa0nRO/+9t4IaUUZ1gj5k60cbMxQ9N6FzKE/buzeb3i1
	VH6xE8LgC+6Jy84CyjqjxkntepJbSQidm83L29YiqM3r0FsZaMN2tTyBZFYEwr3mP3JpKO+MzI8
	kOdShN7Nd97UBEYnbtbZLgMh3i8U+llo8+opKweG62BZONY7YOZg9luZqCI4LYbKAJ7+H+/CTi8
	Crfl1Dm5EGZQfMHiFQ5zffGXf1vx9Z5/iSsxG1aleB1i/1z7GF6WX4CitX+DLBw=
X-Received: by 2002:a05:6830:658b:b0:7cf:d191:3a76 with SMTP id
 46e09a7af769-7d184fd847fmr1235028a34.2.1769526353260; Tue, 27 Jan 2026
 07:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk> <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
 <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
 <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com>
 <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org> <13729ce4-66e7-4864-abda-f999008161a7@nvidia.com>
In-Reply-To: <13729ce4-66e7-4864-abda-f999008161a7@nvidia.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 27 Jan 2026 23:05:41 +0800
X-Gm-Features: AZwV_QjKoFvsNHouG-TVC9y4W99qTvVQ93HukXr2la3NWWyy9ScvyMW4bV92w9w
Message-ID: <CALbr=LYewLuOmENTcOsWOHGw7uC7XTCd9TSxr_xRdKwu6+1f5Q@mail.gmail.com>
Subject: Re: [PATCH v5] driver core: enforce device_lock for driver_match_device()
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, 
	Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 10:53=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> =
wrote:
>
> Hi Danilo,
>
> On 22/01/2026 19:35, Danilo Krummrich wrote:
> > On Thu Jan 22, 2026 at 7:58 PM CET, Jon Hunter wrote:
> >> On 22/01/2026 18:12, Danilo Krummrich wrote:
> >>> With this diff, if I intentionally create a deadlock condition on my =
machine, I
> >>> do see a lockdep splat as expected.
> >>>
> >>> Anyways, another option would be to attach a hardware debugger (I ass=
ume you
> >>> have TRACE32 or something available?) and then get a backtrace from t=
he CPU
> >>> affected of the deadlock.
> >>
> >> Unfortunately, these days I don't have such tools available so that's
> >> not an option.
> >
> > Hm..slowly running out of options. :)
> >
> > I remember you previously said that you can still SSH into the machine?=
 If so,
> > can you please share the the first output of
> >
> >       echo l > /proc/sysrq-trigger
> >
> > directly after booting?
> >
> > Subsequently, can you please also run
> >
> >       echo w > /proc/sysrq-trigger
> >
> > and
> >
> >       echo t > /proc/sysrq-trigger
>
> You can find the output of the above commands here:
>
> https://pastebin.com/PuhFURwh

Thanks for the logs.

Looking at the trace, it confirms the previous suspicion. Since there
is no circular dependency shown in the logs, it is not a classic
recursive deadlock but rather the device_lock remaining held due to
the earlier crash in the QSPI driver. This prevented other devices on
the same bus from completing their probe.

I'm glad to hear that Breno's SPI fixes resolve the issue. It's a
happy ending for this case.

Thanks for the hard work on debugging this!
