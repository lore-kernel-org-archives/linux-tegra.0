Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB93E8C65
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840963; cv=none; b=r1qeUcDRdJHOHWbNkrT8jOpFX7nrc7pyLuumgMCtRsmbJsY67F5ZEMQ9bSyo3SUBc9BCSQ+trLffjsrsFdc5x2sGE1VqmudzkrEL0CN04JzxP4VIWRLwtCco6bK8pWdOrGdh/hbeMI4Ms3b0HmkRnMSiP9baKFg11GEYR84uh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840963; c=relaxed/simple;
	bh=VMgkYTMwlnokU6dZQE3Ao5kciYSZAnjVYhrCiDpeP9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xvzspq415wH0hmftWSRLe/8rdcJwv6DykklxMCLirpvTUMd9O9jNLg806PNPrLdeToBFvc45b1c/AgBcmeOqVVfd4MCfU6W08qFdDOVjno3OjiENgYu1vEJ1aPTsiB+I+SJjGj4csxuqOGe2v2g41qxIbyCzl/7ym1+/C6zfA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3Vu0oI5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3Vu0oI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE611F0089C
	for <linux-tegra@vger.kernel.org>; Thu,  1 Oct 2026 07:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840962;
	bh=XyIJKYtW/j5VljRhmLkukvVpN5gok3I2d7ghV/kcy1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I3Vu0oI5eq1gVVYF93rqxGyoRroHzr0LsZRAonM4/0ax5TxlN4C/DEGe7XMWrKMyJ
	 oEKkgnU7fm3a8/XWcqo7vLUURR/CxJ80mCgdNXt1bkHBDFCRzB+L7EFBqR9A5+egF8
	 1AEFjSCmavksALbn6p1Nd6pDYqxOvhStZCgZIYVHi0dTH6ZEN7HDRD7tDOwdtK/zHW
	 NPvzimi2Auqqv1uvsfnj5zHLC7hdeTwqQL+rvcCoSpKcfdM9tYrnfJBEp0zPEbC+/3
	 cbTpMygUomPs6rtXJbPbMiomMWqrzFIXTovqbCnyKSMTMVZC3ZuzaBMjD7Cmnrgf99
	 7/ahLzMkfuwUg==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a8736cfa68so891201fa.3
        for <linux-tegra@vger.kernel.org>; Thu, 01 Oct 2026 00:49:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKhT0TCLKwkBqd4C9eLDuRjF2TwQb1CNHqVRijqk9LjS/J/RNPEBx/YYkgtU9YMKVlEMQmU2Cw7C6W8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPPjvPATyWqrnKDKVshmCXY4gNQZQyLxaAGL3fKh9NZgZ31dX3
	zr5XZ0+2dNySvcrDGXlgcezVupgRODFxjST1xxgfQw6ncjEz/bVIU5++e7EpkL0FYLwuQ6oHUhK
	iqYS+QDoUN+CqaC5u5H3Wc6l9oF2YI3M=
X-Received: by 2002:a2e:a99f:0:b0:3a7:60f3:40ab with SMTP id
 38308e7fff4ca-3a7791db9d9mr10505361fa.8.1790840960901; Thu, 01 Oct 2026
 00:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924111856.622898-1-yaojiale02@163.com>
In-Reply-To: <20260924111856.622898-1-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:49:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTzLm00UKdUZuxWidNUppQM=Fge-dUgDJGB-NdRVEn9w@mail.gmail.com>
X-Gm-Features: AclHuK94BUrWP3xIZVDdzHiy75M55G8Bf6SCaXSllBatpDtlnoRY7lIcGNcpU_0
Message-ID: <CAD++jLkTzLm00UKdUZuxWidNUppQM=Fge-dUgDJGB-NdRVEn9w@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: free maps on DT mapping failures
To: Jiale Yao <yaojiale02@163.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 1:19=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wrot=
e:

> Several pinctrl drivers reserve map storage before appending mux and
> configuration entries while translating device tree nodes.  If a later
> operation fails, their error paths free only temporary configuration data
> and leave the partially built map allocated.
>
> Commit 17007cd700601777d9ee203a13d97e64ece3a10f fixed the same cleanup
> problem in the generic mapping helper.  These drivers use their own mappi=
ng
> callbacks and need equivalent error handling.
>
> Free the accumulated map and clear the output parameters on every failure
> path in the Spreadtrum, Renesas RZ/N1, Tegra XUSB, and Samsung drivers.
> Each patch changes one driver and remains independently buildable.

Patches applied as nonurgent fixes.

Yours,
Linus Walleij
