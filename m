Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F263CAA48
	for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 04:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778819423; cv=pass; b=JvnFsdS7D+/AES81/QlqBc53ca6XFPZc+NHs/xytF7suqNu4/bw2oarMMtmbr6GA3SoERe9CRHN5We57sLPi6fmcFGKDZ4t+R2gJPxEhNMGhovImTG6ppbk+t+uCLjAkZ5FOzlmIcMJnkjw+DE8pLucRN7PT25doyBbDpk+f/r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778819423; c=relaxed/simple;
	bh=ErpV5Q9aO8CtpXnIYlr1TjML/GGAT1epacCJTC2ieJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PblzwHx/kNI9bbfV2o2JHDiuJVGKszNEA8+xKKj1jntZqKKQGU6W78hKS32T29IXkNJIqH155kqTALX4oA4wMo35BqxrJcCwsDTU+H6AxcTA7psK1+6ffJa6MVRqBCf4H9H6wkiqotvhvDwsaE0ca7dF5mAGc5d5tLOu/PxljPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa/BDfV2; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa/BDfV2"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-393a44854d2so67508651fa.3
        for <linux-tegra@vger.kernel.org>; Thu, 14 May 2026 21:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778819420; cv=none;
        d=google.com; s=arc-20240605;
        b=WZppQYjL3AGYgpWpdezWDDpVK7th+B/kWXC6oHVlzmQRwXVSn81nd+QQPcVFxWEPh+
         9Fr5cjOlfLKFL6Aj0zYe5LKZlKd+T6ie+NWzs7z4/Us2j/RvBSvfdjd65g6M+Pt86t3M
         +vtRNTij+bLsXa9nNuTx2GeNBIxrskayGP5hnmY6S00mqKwCoTZqc6QA9XrTxIGRvhp5
         0J5//Qe2jRa39TOcmaJtzL5WsUBdb57EBYvziwBH1IutkU0Plgg/k8m8atFTs50pQpYf
         lsHHIJ39BYQb+y0Ucsc5hRrNSIJmBQaNbRbGBUfOK8/FCK0JeY6J0+lvG9Ttj8Elxw3E
         0QeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ErpV5Q9aO8CtpXnIYlr1TjML/GGAT1epacCJTC2ieJw=;
        fh=D0nATSRYxkKI3uxr7crp2d3W/VvMXazkZGaGX/gSxr4=;
        b=lQpXdZQdu9FS0gfYsyBnvRVL8Blj8/GIDLyMW4S6wEZ4QimJSDphv/FjEk7KyKvhHC
         XWBdt4h8BClwrSaC8CWZpCROEy/iK369stLGc7vikRHmQaYw6/064pBVOanqlZ16tXVF
         eYwt9/koaNMGMzcP4ghYgF0X5EjDNaoUjy2hG6VZT+cjwwpmadoYWEtt/P7xUoPqHVFD
         pZ3+WtXaUEZhBSEYoBlP5alswUJCK9EiHh5RMyHO3U2Ypt/U043u2DNTACuUj3l35tGT
         8FsqqQdYX6Up8VMJy88uzu2wWzbDZhetGJKC3d8XDOMkgQIuQwooyOkARyjXMjcb0Lyl
         u7Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778819420; x=1779424220; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErpV5Q9aO8CtpXnIYlr1TjML/GGAT1epacCJTC2ieJw=;
        b=Xa/BDfV23rBoAi0hVgIorRXJBFdkGd0Gi3n40N+Co7R8umoFKtdaR4q+HQS7aaHoTs
         gqGWZfWMeHRYMoAX9k2noIm1BVNUHwecz/ev8i8Kf2GJL1q7ftmX7InGamdPsFmEoO2q
         LAEhPEeXNg9LblvNjzLPKPWQ423KLgLQxj7pETDmyRWo4iNoze0ZwHE5x1czcIfR2KUm
         hAehLr+IyCuMX28XZmsFIQT7k7WhHUbZ40OJijELacwhqtoPhLcuz4hF9nOSm1zmdWkU
         ZSf1+aR2wbLvl4fIR+OxJ5tztbdf/LFaU1igen+ZSF4xKyePYcIQewmVY5GExAu3hVjE
         xt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778819420; x=1779424220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErpV5Q9aO8CtpXnIYlr1TjML/GGAT1epacCJTC2ieJw=;
        b=EZJITCb7FDP3bfEjbW25SO5k1xH/y8LkaZLKbuGhwEcvhIs7sv9wrpPcAzfSsNFL7Z
         Zm1NOR7GOS7CubO+QxlPcHj6/vluM0fKLKCGMJ4fRysraOGkj4pqzOqMoTAHB6BxtvSB
         agJ81LhJMy14e4V8SjasFgO9DfkDEaQTy4o/LHREFfhgYx6bUlEcTbWSMz4ok1gL+vAu
         ih7aW1mS6iLx7fEIKVkZNEPePkW9k5bko+5n1NpPaDUA++eXdiIKUn1Qq1aVMbA1e+fG
         6WZDR9daJqEqQwmmxsopRIXfzYJNeT+0ZFXjntTNa4hgj8YGi0bXlCtT/H49EyhcbGnM
         0umQ==
X-Gm-Message-State: AOJu0Yy5/e8s+3q0UXiUhLNn+V9wQzzuiJu9pF3E4qBkZXfC2moSdbbU
	xDBYq8puaXWePFPwTO3RM4LaowW4iWclT00LBS6G5hbJDpLrVTVf8yx8lbjKl9yZOxcMrtqxWV3
	nvk2OX4AN5bUuIUMySucdpfxaEmcbVAs=
X-Gm-Gg: Acq92OFxNlDyvnwH79X/4CPbY42h7+okvSolXOBrwcHWjDtj3Dm+gkXEI9HJaZpjkPJ
	XaBD/mNzuuKoZgtpAbRNTIGR9aL0LdKXpcvK0UdpVfZ4P4txV5aPmOp6zypf120MoprES/E6Pvo
	4/zW6Os+NwJ1RzS59TuULaR59DiKWufAJmIvkAbgkZ0AmTlzbPqsFye55FKgXVtqeRPkSc/XrSD
	xngve3HGCaJk3Y9ESMnLblOpXSeT//GU3xsupvKiRQuy6iKya8nIzTtdBI/HSnxHhhzqyaM5txO
	VyVaH42deRf5kPwiaQgUzKpfR0Pjco4xmTQdQzn/Acz5772EVgmdPKett6ZNfqOVmWY+Xboj+kS
	NLh4=
X-Received: by 2002:a2e:9059:0:b0:38e:58c7:cd1 with SMTP id
 38308e7fff4ca-39561dc13c1mr3692541fa.21.1778819419755; Thu, 14 May 2026
 21:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALHNRZ9mmf_4OagcooO-s+SU1KrggT5_ZwM--ambxZKXN-oQDg@mail.gmail.com>
 <I47hlmySTbquW1VgZFOofQ@nvidia.com> <CALHNRZ_EjqA4aeqZhmicRwdpMxjKp1QpwLW98dyRa36HBX8aDA@mail.gmail.com>
 <QKr0fha2SnWy9Cj9I74wxw@nvidia.com>
In-Reply-To: <QKr0fha2SnWy9Cj9I74wxw@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 14 May 2026 23:30:07 -0500
X-Gm-Features: AVHnY4KMxQxcdb0xOeM8iOKKVIXWOA-iHaJh2OHO8vszrzLtndX_JaZ-2BAd_9Y
Message-ID: <CALHNRZ8MZmPiWtKHkcQwu3_1Jf5rU8pZQL4h1AfHtuEdY3XjPg@mail.gmail.com>
Subject: Re: [BUG] drm/tegra: DMA buffers are not always freed
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:39=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Wednesday, May 13, 2026 1:26=E2=80=AFPM Aaron Kling wrote:
> > On Tue, May 12, 2026 at 10:26=E2=80=AFPM Mikko Perttunen <mperttunen@nv=
idia.com> wrote:
> > >
> > > On Tuesday, May 12, 2026 2:29=E2=80=AFPM Aaron Kling wrote:
> > > > There is an issue with tegra-drm where some buffers get created, th=
en
> > > > freed, but the dma buffer never gets freed. Causing display control=
ler
> > > > memory allocations to start failing after the leaks fill up cma.
> > > >
> > > > I created an issue on the freedesktop issue tracker [0] with a patc=
h
> > > > with some debug logs I added, then a log from Android that contains
> > > > these logs. CMA is set to 512MB, and when allocations start to fail=
,
> > > > the unfreed allocations add up to just shy of 500MB, where it's
> > > > reasonable to expect that 8MB contiguous is no longer available. Th=
e
> > > > log was generated on a Jetson TX2 NX, but I have seen this leak on
> > > > other archs as well, this also does not appear to be limited to soc=
's
> > > > with nvdisplay.
> > > >
> > > > This does not appear to be a userspace issue. The graphics allocato=
r
> > > > works as expected for other soc vendors. And as the logs show, the
> > > > delete dumb buffer ioctl is called, but is not always followed by t=
he
> > > > dma buffer getting freed. I have also observed this issue with a
> > > > gralloc that uses the tegra gem create and such, this is not unique=
 to
> > > > dumb buffers, that's just the last log I had when deciding to post =
the
> > > > issue to lkml.
> > > >
> > > > What I primarily intend to ask here is how to further debug this
> > > > issue. I'm not finding any direct path between the delete dumb ioct=
l
> > > > handling and gem release or tegra bo free. Can someone point me to =
the
> > > > pieces in the middle I'm missing, where the logic is to decide is a
> > > > buffer should be freed?
> > > >
> > > > Aaron
> > > >
> > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/work_items/9
> > > >
> > >
> > > If the issue is specific to buffers that get used with display, I hav=
e
> > > an idea of what the issue is -- there is some circular reference
> > > counting with the BO cache in the host1x driver, and that means that
> > > BOs that end up in the cache never get released.
> >
> > As far as I know, this only affects display controller buffers. Though
> > unfortunately, I have limited ways to test the media engines right
> > now.
>
> I've been working on some more userspace for the media engines.
> Hopefully I can get that in shape soon.

Great to hear. My android use case unfortunately has some very
specific requirements, namely a c2 aidl hal. But maybe with more
examples of the uapi in action, I can try looking at one again.
Though, my last attempt using the existing nvdec example had my head
spinning in about 3 seconds flat between that and the c2 api.

> >
> > > Let me do some testing locally and I'll send out a patch once ready.
> >
> > Sounds good, thanks.
>
> I posted a fix, please give it a try. Incidentally, on my side I don't
> have that much testing set up for the display :)

My initial test run on p2972 using swiftshader is looking good for
this specific issue at least. Part way through a vts run and I haven't
got any allocation fails, far past where I got them previously.
However, this may have peeled back that onion to another problem. I'm
getting stack traces from shared plane atomics, and a lot of mmu
faults during the graphics tests. I'll see if I can narrow down a
simple reproduction and trace down the cause. And I'll check the bo
caching patch on a few other devices, then post a tested-by on there
if they work.

Aaron
