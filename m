Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA730E0F9;
	Fri, 23 Jan 2026 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187269; cv=none; b=ID7oM3kM+XQxfOi11ReFofgfgFd7TlAKcsa86JjJptZwNdCX1fmZItPWA+SPDwZahDnoSr5K1kW0d0V43NKicAV6zoPicqsliaXI/fP3hejQLCdZxUgosQyAK4GLhh0XNxahOSbjagMQVfqFH7ozuvG9FQ5e5gl7NZz38fvfQHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187269; c=relaxed/simple;
	bh=HxovxSgeXj5Hx118Th/7eXKqpT/c0hw9aE78CY7gbaw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=NYptvf2Jg1Sc11zprmoz3fKJK9l+3zEp6ztUYnJRVHCycigRBc3CR2plNkldomqgILhB5d9enZOWv621rkeKgMrofBrS57LXY4Lhyzz1+6KTPph0eqeE70yFwyRZJrKsl2rTRDnfens0UCURVX9W0CKC7GCS+3G4IQoQpESXKPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1JebDhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1JebDhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B2BC19421;
	Fri, 23 Jan 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769187266;
	bh=HxovxSgeXj5Hx118Th/7eXKqpT/c0hw9aE78CY7gbaw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=X1JebDhlvyGSI+55UHnAM2hcBkOpuaWXAlz9NjyTfMsG/R0EjUa7V8VwQSvJzrzm0
	 LUJEd8k2BeC44WHU8A0GaVO3H5KB/44CYTWD6MNaVsX0R8dWpb6X2OVD8oMVgUzTm+
	 mBfLSKVKPOGWERIWaZytlHtOIJvy4AKiuCSCtN/U+om5oUX/TIl++CUdRqYi0ylG92
	 w3ErhvfJo9M7ge6/pkWJVCm4yiphLXgjqrT7h4toM0CDWoaUqJq7Fm3ICOeEmzSnmN
	 SYVtju2ADdGU8JzN+B8zJ75+1VjCF71mmP03ciTuVbqaoG+Jfk8OSDRg9BKpv8kO2c
	 qsHDiVvgcx5Xw==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 17:54:21 +0100
Message-Id: <DFW4JJYIDC2O.3L1XXBT5MY9SI@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Gui-Dong Han" <hanguidong02@gmail.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Mark Brown" <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>, "Qiu-ji Chen"
 <chenqiuji666@gmail.com>, <Aishwarya.TCV@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com> <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com> <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com> <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com> <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org> <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com> <DFW11G0SNME0.3G28YPXH64DOT@kernel.org> <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com>
In-Reply-To: <b3b0635c-657f-4869-bc88-06de9287a464@nvidia.com>

On Fri Jan 23, 2026 at 3:29 PM CET, Jon Hunter wrote:
> I can fix this by either:
>
> 1. Reverting this patch.
> 2. Disabling the QSPI driver.
>
> Now the QSPI driver has issues which need to be fixed which I am=20
> wondering once fix will avoid this problem.
>
> However, I guess regardless of the QSPI issue, should this patch be=20
> having such an impact?

So, this patch by itself is correct, but it reveals when drivers do the wro=
ng
thing, that is register drivers from contexts where it neither makes sense =
nor
it is supported by the driver core.

The deadlock happens when a driver (A) registers another driver (B) from a
context where the device lock of the device bound to (A) is held, e.g. from=
 bus
callbacks, such as probe(). See also [1].

While never valid, the deadlock does only occur when (A) and (B) are on the=
 same
bus, e.g. when a platform driver registers another platform driver in its
probe() callback.

However, it is a bit more tricky than that: Let's say a platform driver
registers an SPI controller, then spi_register_controller() might scan the =
SPI
bus and register SPI devices (not drivers), which are then probed as well. =
So
far this is all fine, but if now in one of the SPI drivers probe() callback=
s a
platform driver is registered, you have a deadlock condition as well.

So it seems that something of this kind is going on with
drivers/spi/spi-tegra210-quad.c.

I did already run quite thorough analysis throughout the whole kernel tree =
with
various static analyzers and also played around with LLMs for finding this
pattern.

The tools gave me two results:

  (1) The IOMMU one I already fixed [2].
  (2) The GPIO driver I posted a patch for in [3].

I specifically also looked for all drivers that are required to run all the
peripherals in the tegra194-p3509-0000+p3668-0000.dts hierarchy, but couldn=
't
catch anything.

(This is also why I asked about OOT, because there are quite some compatibl=
e
strings that are not supported by any upstream driver.)

I think to really see what's going in with spi-tegra210-quad.c, we need the
dumps of the sysrq-triggers I provided in a previous mail.

I'd also recommend to pick a stable state of the spi-tegra210-quad.c driver=
 and
apply this patch on top (or just apply the spi-tegra210-quad.c fixes as wel=
l).

Subsequently, we could try and retest with the diff I provided and the
corresponding lockdep options enabled and with the sysrq-triggers (without =
the
diff).

[1] https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/
[2] https://lore.kernel.org/all/20260121141215.29658-1-dakr@kernel.org/
[3] https://lore.kernel.org/all/20260123133614.72586-1-dakr@kernel.org/

> Please note that a lot of the boards I test are in a farm and I don't=20
> have direct access. So although I can see the test harness SSH'ing into=
=20
> the board, I am not accessing directly. However, we can run whatever=20
> tests we want.

Maybe you can trigger the sysrq-trigger from a custom test?
