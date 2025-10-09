Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453A25D53C
	for <linux-tegra@vger.kernel.org>; Thu,  9 Oct 2025 11:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760009941; cv=none; b=lSEwdSptCltJhYTKWdcR4it+bGnExTsUteAhFhou28+hAcfnTZZ3v7MIGoDPkgu8stVE15vuA6D1afsgvMyrQxIgCIq5PlSSG/6k7bA/ytrQz8zQWcg5ntJLGgpU7fX7vCZJSg9U2sqhwdrds3ntE6qrOJ7Mj2x3lrUoO+bleNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760009941; c=relaxed/simple;
	bh=rP1JaiC+dKbCUaMXThGQDLqJez01N94aR5wIs4E+XU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IegDJB42+RlivDViWtBSaaqFjs7B7684pgW7ZLdhYETQ/1BUF+EMdk9hCeCy4hDNOU7BTVEYLZXqo6AE4W+wTZgtrNyu25kRKxqEJQgzdPOVpzCIJd9O74hi1Ft/RYNMJBwEnALmbTBrivp3dNkjycxt1PG+NMBbYO9ZQryzZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxgVCDTo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxgVCDTo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso530161f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 09 Oct 2025 04:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760009938; x=1760614738; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rP1JaiC+dKbCUaMXThGQDLqJez01N94aR5wIs4E+XU4=;
        b=lxgVCDTozyc+TI50WrD7zjYOnYNBEX/r7NaE/aKm5pJ3Wy9rQUNPOhMlbOAxDqDrsX
         rIvxoKTx1Wr/BwbCuNlonXPeLY3drHp9C9QjLfPwNOknNly3j4qDoiOAi8V/jhESmBow
         55o3th2LUfXhjl4ouRrLRoc/BqlWeMD2vCdN2tqMdY1TXoKIPrc4RpLRu/tgPqJzS2by
         tSg+ataeIgh43UBp80IJu9y/DsBczas5pJvqxp17fKSgDHXGeOVwUmW43vnPWTjrnCYW
         z5Zx9p7bm4Vjv5xOR1faAkY7IlMrdkDMrXNTocmuU6sCgE9rMIv93DB7XmfTbPdPYgfW
         aKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760009938; x=1760614738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rP1JaiC+dKbCUaMXThGQDLqJez01N94aR5wIs4E+XU4=;
        b=SLx+yXp39FL8/WKBXGc39DckDx2uwKMXXG075+XvZ6QAqrCzY652r8r+2gIVkfIM8k
         Pi3o7Qd78zxDxl4VC1Qc6elGOVjRA2IKnT/30k06uUk6EYJRnYnR41wZlCBhyYayOvoz
         GzV/5FzcDMWSMiqSVo6z2RD1aetFkdDR8LJRVTTJj1OnQlJlFJEjLrGpV/bvibpQJ/UR
         h4lvwKSc73b7in4uiSeDWqsu0o1zwi3U2rycEWu6fbpqfIIry+dsbtQS1oubBPkhC0l7
         Jw5cnnKkt7dfq7d6B1Ygwy9VCCyIPnzfuyfzrr6b57ZePWHggp1RAiR6MCvjBEDMSn3Y
         3F9w==
X-Gm-Message-State: AOJu0YyUKGRVMbCcw7UyGVgsArWnhg1GLFKE4uHNShOTe4U9W2nUU7nx
	46gxZ3z5rqVJQxTeNqBo4OhNn+lgbekAfJG3iZJ4OvY9A6iXcp+dyOBA
X-Gm-Gg: ASbGnctV6mVThnRtIspfOv47teisnqKR31KnvaxjHpphnhMi4D9LE+arCWHsvX3eNFC
	HzXivy9K0Uitx9J3/0bNAy8g2RflHnPwzWiIhl1TL0NDtOR/UMI5AWMXIjhEEYfYo1zutPha/6I
	6OYx712DGoFAaTA8xMMq2gGrLzwS5fq5OFik2guPO1ebZPhlwN++852gN8z7cNIB9U9PlcGYI5O
	dEJ3jkf+F7grTESsN9+r/LCaN7AldXBSLxWFRmlmwd8+7vNJaTHSipskyjqi9I3qCZ0EyjvD7aZ
	47Xc2GhlbTB7xIwczftG4EuNyD18/1b+S2sioq04T2zKk4BxYozbU/RoXeAIyBrcUYCtCj+/S7v
	8HHpoXWcHKmzj6rQROLTlZRq5d1iGABV7pUKyQdMHYyHaVtvO5tNk6CLvEaacDD32252C7AWhF8
	baA75/yv9NEM4kBEbKEuX4QsEIn65guBqdyA==
X-Google-Smtp-Source: AGHT+IHAcQEEBgMcQz7wMA2qmx6+wpQkTPjE+CkCEvZDPinipAZ9tUIugghSyFPe5tRLrgYjHfifyw==
X-Received: by 2002:a5d:5d08:0:b0:425:7ce6:fd50 with SMTP id ffacd0b85a97d-4266e8db473mr4788177f8f.53.1760009937964;
        Thu, 09 Oct 2025 04:38:57 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e970esm34383994f8f.35.2025.10.09.04.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 04:38:56 -0700 (PDT)
Date: Thu, 9 Oct 2025 13:38:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: IRQ thread timeouts and affinity
Message-ID: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7tzznfw5eznq6ir"
Content-Disposition: inline


--h7tzznfw5eznq6ir
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: IRQ thread timeouts and affinity
MIME-Version: 1.0

Hi Thomas, Marc, all,

Apologies up front for the length of this. There are a lot of details
that I want to share in order to, hopefully, make this as clear as
possible.

We've been running into an issue on some systems (NVIDIA Grace chips)
where either during boot or at runtime, CPU 0 can be under very high
load and cause some IRQ thread functions to be delayed to a point where
we encounter the timeout in the work submission parts of the driver.

Specifically this happens for the Tegra QSPI controller driver found
in drivers/spi/spi-tegra210-quad.c. This driver uses an IRQ thread to
wait for and process "transfer ready" interrupts (which need to run
DMA transfers or copy from the hardware FIFOs using PIO to get the
SPI transfer data). Under heavy load, we've seen the IRQ thread run
with up to multiple seconds of delay.

One solution that we've tried is to move parts of the IRQ handler into
the hard IRQ portion, and we observed that that interrupt is always seen
within the expected period of time. However, the IRQ thread still runs
very late in those cases.

To mitigate this, we're currently trying to gracefully recover on time-
out by checking the hardware state and processing as if no timeout
happened. This needs special care because eventually the IRQ thread will
run and try to process a SPI transfer that's already been processed. It
also isn't optimal because of, well, the timeout.

These devices have a *lot* of CPUs and usually only CPU 0 tends to be
clogged (during boot) and fio-based stress tests at runtime can also
trigger this case if they happen to run on CPU 0.

One workaround that has proven to work is to change the affinity of the
QSPI interrupt to whatever the current CPU is at probe time. That only
only works as long as that CPU doesn't happen to be CPU 0, obviously.
It also doesn't work if we end up stress-testing the selected CPU at
runtime, so it's ultimately just a way of reducing the likelihood, but
not avoiding the problems entirely.

Which brings me to the actual question: what is the right way to solve
this? I had, maybe naively, assumed that the default CPU affinity, which
includes all available CPUs, would be sufficient to have interrupts
balanced across all of those CPUs, but that doesn't appear to be the
case. At least not with the GIC (v3) driver which selects one CPU (CPU 0
in this particular case) from the affinity mask to set the "effective
affinity", which then dictates where IRQs are handled and where the
corresponding IRQ thread function is run.

One potential solution I see is to avoid threaded IRQs for this because
they will cause all of the interrupts to be processed on CPU 0 by
default. A viable alternative would be to use work queues, which, to my
understanding, can (will?) be scheduled more flexibly.

Alternatively, would it be possible (and make sense) to make the IRQ
core code schedule threads across more CPUs? Is there a particular
reason that the IRQ thread runs on the same CPU that services the IRQ?

Maybe another way would be to "reserve" CPU 0 for the type of core OS
driver like QSPI (the TPM is connected to this controller) and make sure
all CPU intensive tasks do not run on that CPU?

I know that things like irqbalance and taskset exist to solve some of
these problems, but they do not work when we hit these cases at boot
time.

Any other solutions that I haven't thought of?

Thanks,
Thierry

--h7tzznfw5eznq6ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjnnssACgkQ3SOs138+
s6H/fw//XHBacGZ1WIaZWFeKGgC7KIa0ThRdPdvwPt/7Pnvs0RGF5E7+IX61zdQe
luQOS5rfrygOf05XxWortvQJnhMppVJN6N//i33eXrk+wU3uhymEFZBLguQPyIB8
LeCO2Y5G8/ppNbd+F/LOXF8JiRF1/tMGyCxtfTnqtxPjbPO2XNTKActv6XsYWed+
tYUuknya5lX8j5Lp+y1tc1NkCJvwgCfnhfxmpS1njZX5OMzidveWIP3HVDy9iCTR
ogq6Rk/rzyxlYxa/Ii1AtZUS80D6idaMyvr8gbB6jwYI9LwVQqEHg9WQPUQ4l1vf
/DBdZ5i7yvHwKAn3JYMnKSHJurp0avbqky/8Ou9m3rNSaZACkhrUhjqYqdIG1rIx
+U1NcIzpRyg38JahYdiI3ZzW83FD978KHQQ7Ctt1DSdpujEoNdslv5cXmWfTXYTt
C7o17uBicCt9imXAUaGPlK0509JmiwC45FrI88hAYsGK3yb/Gj9MGa44pwD6fUbC
tG0VLoHmxWHjAKZLgcxLLiu8v8Rqmu0/DB0qJ1B/B8kBR54tfTTeLIdSMYeAspwB
Yix5k3QDJAW6UmdvAwVAumGUGH4bfSxlDkViv5V5zBnLIFKJuSkTNaHfvdY+0+GA
p3jCFr54MCEhAS4rUCrf9ZZt/N5gXiGs7PxPZ4AIlNvrJAsaKW8=
=867x
-----END PGP SIGNATURE-----

--h7tzznfw5eznq6ir--
