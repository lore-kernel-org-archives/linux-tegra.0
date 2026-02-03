Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FDC6FC5
	for <linux-tegra@vger.kernel.org>; Tue,  3 Feb 2026 00:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077199; cv=none; b=ddSYGDiHu+0Iin82yi+LlPc81/Yi4hepqiZ9t6KTfczSZLa7KPwDunrtV+sLCim5TnPwonrtQEsO2GEUZ3p2ub2u/sDXblbNWU0b9btkNkxqyOmRQPtfL6H0Ri+scaC6UkW5GlM6dktR1srLk5UcuoTCtrd3A9jW+Ro/bvud4D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077199; c=relaxed/simple;
	bh=SYeGoreiX8dI0LCiK/jiS7IA90ZFkVbLZTsO3MdCF1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjuHrc4sWCfWG2PnGOO6586OZDDAMq4n9KuiQ/b+pnEmO8IKPQEDG9tdbWnjWG9L4zt7J/WKgPplPJFdPGPT5HIkeIu2JPISrNd/MggxZP+o/USY6I7MeF3KOcZ0IETc1lhO1Cw+Ol+TGvi4ph+Lk6R8bKTJqVXylmj57CwIAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ey0QQoH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ey0QQoH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69192C19421
	for <linux-tegra@vger.kernel.org>; Tue,  3 Feb 2026 00:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077199;
	bh=SYeGoreiX8dI0LCiK/jiS7IA90ZFkVbLZTsO3MdCF1k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ey0QQoH6BwuTR8fff+OqmjThDYe7eCajwESX4d2drLFd3bL1lc0hNeSV4U52uY3WP
	 QcUpsSxajR/4h0BPohLq74kEN7nf37cBqFJWcGkGyIozqCNdodAdU+s64a70q5ZP/D
	 2yXwXiH17dKeXfl/TyWRqjoxWYySycZmYLVjBP7tIzkVjUhSTdZ1tbohUOFJrELwUl
	 SojBUyG2lQp7gqXyncwS4gon4SEEwFi+jCgRhKr5iELp9S0ji5LdDwX7EgunBvpAaK
	 uM/3qojAupFuEw6KItnYABCiXYRxurRftIAWX6qbTN1haoU4FNOSOsG2gT3r/hYbou
	 OCo4b+pYqLUWQ==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7945838691aso4228577b3.0
        for <linux-tegra@vger.kernel.org>; Mon, 02 Feb 2026 16:06:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjIf9aNDsxnILmYAQqamRgnUz50MfTJw31XMWupZMPQB8pZ4xCOLXeaKLBj9VeZKh8tn2hMmEULBBPzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaEtaNUJ8O616WGR2IcP2s7RvZmnw3VMorJ4WJDF6G8+gk5Dnp
	orLlqIGSwIXi2a/TiAspe1vhOohPdo8WAGe59iE+TpEdzpzpu/dG8CAR+xauW0vlTbh/HfUivM7
	lTXP2KEhBjvpEat53bduPX495s+4b/PM=
X-Received: by 2002:a53:c78b:0:b0:644:60d9:751f with SMTP id
 956f58d0204a3-649d2f80c52mr930885d50.44.1770077198799; Mon, 02 Feb 2026
 16:06:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128085114.1137725-1-pshete@nvidia.com> <20260128085114.1137725-2-pshete@nvidia.com>
In-Reply-To: <20260128085114.1137725-2-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:06:28 +0100
X-Gmail-Original-Message-ID: <CAD++jL=DOjp-k1XM6kULURQF5winWWqBm-S3JYFEVsZ8FpsY8Q@mail.gmail.com>
X-Gm-Features: AZwV_Qhka7MsaZkB33uaVL0wGJTuPnFbgweVPaF4CVuqk1UUYD-WghDyZ7pRfdo
Message-ID: <CAD++jL=DOjp-k1XM6kULURQF5winWWqBm-S3JYFEVsZ8FpsY8Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: tegra186: Add support for Tegra264
To: Prathamesh Shete <pshete@nvidia.com>
Cc: brgl@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 9:51=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra264.
>
> Use the "wakeup-parent" phandle from the GPIO device tree node to
> ensure the GPIO driver associates with the intended PMC device.
> Relying only on compatible-based lookup can select an unexpected
> PMC node, so fall back to compatible-based lookup when the phandle
> is not present.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
