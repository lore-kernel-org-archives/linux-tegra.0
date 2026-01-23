Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7C5301493;
	Fri, 23 Jan 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177383; cv=none; b=JvVGC/NtegHJBD/5LX9UhIS5dOZP2sXYvIB+JJrnGY+JcF2hz5HK9L8drUxkfYXhtizplcq4HTUSLQ62dCGLFr+d86sG1mnY10J3KwQWOE9EePZUFbBiB9oRF4ezycrWCe2LexWe2e/g++z6Zw5xUWGxMuoZBc1+1CreIZEqEGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177383; c=relaxed/simple;
	bh=K1T096eifSfgfEJ3gK+GRUS3m5iyoOqVxk0ssoWJrI4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=M/goXo59SZRjKAMAgjEkmuCqHZJ7Kr8J/Jk7kz+3JfcimWR5W0lPnpt/uPwJVmMcnUIbi4EQggHXnrfWFU9Q799DxQCsFEe/8SxsGxepwJoPpdQLHSCf0VDmwpn/wK36P3Of6UeHmLjiHqdaE6hf8MPu1LQ97YeSeXnHJd+hOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8dSll3d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8dSll3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D81C4CEF1;
	Fri, 23 Jan 2026 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769177383;
	bh=K1T096eifSfgfEJ3gK+GRUS3m5iyoOqVxk0ssoWJrI4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=S8dSll3d2SvJbRYW2Q5zbQGO6QVtEayubFqqkOaWSE3OChl7ET6UZ4olLDCaYlEg0
	 4kcWoTxKAlTyZEkXktNaF+hG+ps6Q/YyQCNhYvmiWapabCc777c+vK/XyduAiL2NQa
	 SdWU2+O1TL8N3y0lzmbh9JG0ZaUTtVWYgG7bxCQphY8hVoCW69XmsX9kNFn5LsUevf
	 B5FXHFEjDLg7fLHtRft5uVln2PmdxtZMlmUa3LQN3rdjlm+w/pu9qx865aOzT0p26X
	 XQt5lf0yp4AuM1ZXVjEC0RljmyHPmJ2F9sek8Uw11l4n35QOQGI3INauyAoBPy5Rp8
	 q1SbAbPMpaXmA==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 15:09:39 +0100
Message-Id: <DFW11G0SNME0.3G28YPXH64DOT@kernel.org>
Subject: Re: [PATCH v5] driver core: enforce device_lock for
 driver_match_device()
Cc: "Gui-Dong Han" <hanguidong02@gmail.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Mark Brown" <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>, "Qiu-ji Chen"
 <chenqiuji666@gmail.com>, <Aishwarya.TCV@arm.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk>
 <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com> <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com> <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com> <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com> <DFVBKRQ35CC0.95P329BK5KZA@kernel.org> <956d5d23-6a62-4dba-9c98-83457526f9b6@nvidia.com> <DFVDC5NWTOT4.NA2H05V84CWD@kernel.org> <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com>
In-Reply-To: <2b7109c2-2275-4a38-a52f-f4f901a6d182@nvidia.com>

On Fri Jan 23, 2026 at 2:57 PM CET, Jon Hunter wrote:
> No worries. There appears to be a couple issues going on with this=20
> board. With the patch reverted the board boots fine and tests pass. Even=
=20
> in the passing case with this patch reverted, during boot I see a NULL=20
> pointer deference crash log from the QSPI driver. So I disabled the QSPI=
=20
> device in device-tree and with this patch the board boots fine and tests=
=20
> pass.
>
> There is a on-going thread for the QSPI driver to fix these NULL pointer=
=20
> deference crashes [0]. So the QSPI driver seems to be the root of the=20
> problem.
>
> [0] https://lore.kernel.org/linux-tegra/aXJWRUhAe8F67-zG@gmail.com/T/#t

So, are you saying the problems you are seeing are unrelated to this patch =
and
there is no deadlock? (At least this would explain why we couldn't get a lo=
ckdep
splat with the diff I shared. :)

Otherwise, can you please share the output of the commands I shared in my
pevious mail?
