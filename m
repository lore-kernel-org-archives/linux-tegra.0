Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5A72BE7D1
	for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 05:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778563790; cv=pass; b=Wi3V8gZ6UGB9Za5JKHyagdUBhFUV6SuE5E+l0AVyKefO1EbOlcwykxlBsJ4k0bK0fGSE9j7Cok3YY/F9lCj09ANUnf556RU8Lat3p3e0yD6ZQcR2RfeorYa3TsmpRicH57XeoBiHdJSgJYQHHduWBuY0xrTxJigz63sE2EheH5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778563790; c=relaxed/simple;
	bh=dfl2eq4XdvwzzwMISw+3fb93nWUCpKg9Ggc5uZLfkQ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JB/lr6ug06YZcxNufKpohv+SPCzk42Rr6RsAIgWJSAoQguNil9fqYU3czbgFeuLzi7OWseCmn+5iNF+HEuMm9/kV7fR24t2wAGMcFbXucCEXjG5aNgm4Kg2gIfxatZOvDwFF+El0p/eDFyx5ByBAEhmQlDeyyvMIznPPzj5SU28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk+qqriG; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk+qqriG"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso5636226e87.2
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 22:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778563787; cv=none;
        d=google.com; s=arc-20240605;
        b=SOSUa/X7CIfx9DJr+hrYkZCON3AtFfvBW+XEHf2Q6ETeubM4zptKIL6JWvsWX1cVZW
         QsYBDEJgtpasnWZvUg761BVl/wrHK+zerwEtCmVq1VKUHjkwvUg32I1PUqKQ7G9Frc4F
         nsUKVQBqCF6C+k1waSlW/g1VUxax1SEYk8gHkJdBaUgnCam7uhevqYJ2iGVx82TA6uFD
         HZoaOBM652i4WJeIgLPPBAk76udBqa5zFCnbuy/ALTIJkqbHGZFeXkKjkGuZkjhrkO+C
         ahrnIOgY5awzVezufGrAPKlTz62px8O4P8aY2i4XjG5DBzlhFx4HTRZ4BxZ/0XfRVlF2
         yD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dfl2eq4XdvwzzwMISw+3fb93nWUCpKg9Ggc5uZLfkQ8=;
        fh=alV3uZGOJS46HNqpJneiGGoE0k+6KnyOVsL8ccygG5w=;
        b=gU+/6FmBjhOIM+eH5GwoRuuuiJJ7/if94SirUQOQW3rKMAleCAQH79tr7+5aocjApj
         rEnF4rf0LmEysQVUjiVs/3TtPCA6spsdcMhPxsgeF2WP1GxvElmshnK4j06iL3ldoubF
         N5YYyAwKm/3wkWfMG0qMrRdVk0OYYJVK3GpAadTtvFjtbq1v4vWG9jprTVla/LQ0i7Qt
         4NodcdFhGJYvLVpXepREWNXABFrk6TzNf+i54yjpmQS8augcY+bUUc0TSig3+8AK3kN0
         gRTxiRbMkE8J2pV6X+gppYxwcTMWQQM2LTebbeuA3ZjY6DvWQo4hDZf9H/yUXbp+G7MA
         PMaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778563787; x=1779168587; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dfl2eq4XdvwzzwMISw+3fb93nWUCpKg9Ggc5uZLfkQ8=;
        b=jk+qqriGcba6QM+fVfUY7b/SXCz0ewZhj0W79Rp13MorqID5ayTuruH6fzg1C1ptmi
         aubWUA/KAqmjRcJKPtGcG4YlodIV1Jp9+RMQiEQip922F7dBFGObKcXGb/ZHWeAXBxov
         sWNxnLUUTowRe5u2AXrX+W1TSYME5mSlPfkPpNqw2rbQDPxAvK0xoYfMBLfwyZXgSYkc
         FoVeyoovTgrk+D38S2lFkokjTROojosmY3/3cCMjk+68sSMjwwiIAJnZWdCwZjh+Dt7a
         J495QPd7WelrVlwVZqCgvHL0PiHOSJS48hQecXekZ9uY0qMf4Wtkl3itPMx8TB1N+v+u
         5FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778563787; x=1779168587;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfl2eq4XdvwzzwMISw+3fb93nWUCpKg9Ggc5uZLfkQ8=;
        b=a+P1kQ9oba8smTt+8mnMxqXkoINX0f/Yz2WBZ2b6Q7CARkt4LmzmIFMZwvEAtBaeon
         Kci42zQa/FhLewp/aSXP31quBOYeOcVLxDyoi1v0mFVoASUwjqouyK4sGtEN6wXwmqLj
         s9Mc6SZ/Wu0ehaP6rnwbzNKn0+RQG+zYpAb8RjgJTE6gUQLARSeIXa/Lp6uHAOVL8o2+
         9djj8PuXfq2dAERU/i8llOt8U3rmSR8IMyxRPpGS0N9WKTRcpmrG+EAZRIBebh2Zx/FU
         9ERGKkwb6fu5glFswfO/iwJN+Int1UOLDQ+2Os5jme+m6HgZII9EV6Ae1g9o89ugctll
         XnOw==
X-Gm-Message-State: AOJu0Yw0WOevCe0ooqh98MpUKg2wluo2wjV2AyHcRa0UJHfOaCllukqR
	yom8VvQw6OuxZD85c1UjKTxIXjP+EyXoLclnWOppAyEkMnXwnUiWLrKRgEuSmkEWJmJ09VFOxnj
	rsKdwrv5tOF5WKCCCDS/0c0lzGfdCZuSpRXtJ
X-Gm-Gg: Acq92OFGkvrd5P7bBU3aswmhi1JcjSlrjZnnfy4AgBohrOxpg6Heh+9+YN4XBjcsXqu
	C655YvnnT/496GDkcLQOElA27iBhTY1ZwUer4FMDmFkyVg7qJm5tW8V1M66tzdv1smZA9ISD7Ud
	apQai9wQ2R+VYtq3LBsRHusyo9X0Sq3YCbqTkwm0+0ABUe1ssZHCqZJD5fILFZH1Ac4FYkUeTvM
	K7ZRfe+O060vfs2oxr7wxzOVi0Twqbs/gPChIAR5Rh4G2j1QX8Mww/zFWtWoCNwR+Vto2PWPRoP
	z8P7pbPkkFQgM8KvYU65xwD7gGE0hGdE5RjTJli+zwT2ijsbLiUjtdTvhUM4NWCKVLMf
X-Received: by 2002:a05:6512:2252:b0:5a4:52d:4abc with SMTP id
 2adb3069b0e04-5a8a949f19amr5519345e87.8.1778563786826; Mon, 11 May 2026
 22:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 12 May 2026 00:29:35 -0500
X-Gm-Features: AVHnY4Kwsv7b2fXRf5ywwfias53-xE1lZIqqHODDodSMGEK2NJ1hWGs7ABH5zC0
Message-ID: <CALHNRZ9mmf_4OagcooO-s+SU1KrggT5_ZwM--ambxZKXN-oQDg@mail.gmail.com>
Subject: [BUG] drm/tegra: DMA buffers are not always freed
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

There is an issue with tegra-drm where some buffers get created, then
freed, but the dma buffer never gets freed. Causing display controller
memory allocations to start failing after the leaks fill up cma.

I created an issue on the freedesktop issue tracker [0] with a patch
with some debug logs I added, then a log from Android that contains
these logs. CMA is set to 512MB, and when allocations start to fail,
the unfreed allocations add up to just shy of 500MB, where it's
reasonable to expect that 8MB contiguous is no longer available. The
log was generated on a Jetson TX2 NX, but I have seen this leak on
other archs as well, this also does not appear to be limited to soc's
with nvdisplay.

This does not appear to be a userspace issue. The graphics allocator
works as expected for other soc vendors. And as the logs show, the
delete dumb buffer ioctl is called, but is not always followed by the
dma buffer getting freed. I have also observed this issue with a
gralloc that uses the tegra gem create and such, this is not unique to
dumb buffers, that's just the last log I had when deciding to post the
issue to lkml.

What I primarily intend to ask here is how to further debug this
issue. I'm not finding any direct path between the delete dumb ioctl
handling and gem release or tegra bo free. Can someone point me to the
pieces in the middle I'm missing, where the logic is to decide is a
buffer should be freed?

Aaron

[0] https://gitlab.freedesktop.org/drm/tegra/-/work_items/9
