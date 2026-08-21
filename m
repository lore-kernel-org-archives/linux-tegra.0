Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4248F855
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 12:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315864; cv=none; b=YTusvfaVn3proqm1cssHOCHXHnfXgFAiDfmukRrIzzWsgPeUHkhG4sO2K41FtraRZVTPDOzlWtSpur72p1qRx66QY3nmlBcuvSgSKzGUsMdD1dHmEaf1Y4Ry1IT9ICXWE2//37G2xS/xIg4vo59kA0rIPbXDWwJX3iSJz6zFplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315864; c=relaxed/simple;
	bh=GjqXahD//iU7Tevwwv2au8Zxe/p4j2pFv1QqW9yzUr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNNKAybdXFnN7lgXkFXFX96Y9YjyQaQYl1GiwVOiieJT6/gxeSV+hsVbpSQB6Cjj7wy8JuEAuVNJfS6bdmvSQcduaqTwvVQqQhCPBlPvnqpID9uHI1Kc9zveNwI1WEggoS9H6ic6usaekySnEey02uHo0XFNus5NP2p6+dfpOP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXLJAeWU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXLJAeWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B53D1F00A3A
	for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315861;
	bh=8+hizvcdqGonufv2DpcVufMd01dDompVLkD4kRlhkmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nXLJAeWUTKD79L+pbwJbn+9CpAZES2OLZcIdizQnTfVGc7TE5nSca7PXL/pw9PKf/
	 LGq4mmubFlDIVBeL8eMU7UP1U7FlEn8maKIBwxfELo8naNUDEczA+lmMYVK2RN1KGc
	 fk6SJmlxqmlWEphZ7J9geKJGaNuhl/aELbXMNGqPwM03kCQPX2lpyJhZ45nl8Ywmj7
	 cW2f4usgidgSOdwF08/Dfaza6tqjkz6iUncz9jpF89eKDMX9BC2cQae3BCIxxUxQm7
	 58IEFHenUsHZS+V0LwgN/n7ckKq2dzAK+91kJnV/MHKymRRCE25OPquEdcnZ/5Q7Uy
	 RRcifVFuUbOEA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0148201fbso981153e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 21 Aug 2026 05:37:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro0ClexfB0pr/msFTjSli37nw3Yat52HZRQOTQVLUu/7S/aFXH3INtreNaWmnWKvZAuqbQTCuNp1YvFWw==@vger.kernel.org
X-Gm-Message-State: AFuF++nuPFV8auTMxGKnaVWlx6bzSPgz1+yl+GsIbbjg1u4LqGERLt6U
	Gsn15xLSs8ck4zdWC+Tb34zwF4u96Sj8g7e643o0BODAQP5+qCLeL2Oa8uMzV5W9fPl6BzMhPc/
	HJBjG1NGWaZFVyIOKBK2YxKf5XLbbk0o=
X-Received: by 2002:a05:6512:3c94:b0:5b2:e5b7:2419 with SMTP id
 2adb3069b0e04-5b4841e99d8mr2026186e87.5.1787315860266; Fri, 21 Aug 2026
 05:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787239869.git.geert+renesas@glider.be> <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
In-Reply-To: <66afbce10c485164340a3947885cdf4217a4ee2d.1787239869.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 21 Aug 2026 14:37:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmNWGOLdo4apkCf39Au+N=9Gjn0Uwa1xHdYU49_-x2FfA@mail.gmail.com>
X-Gm-Features: AcwNN1X-YF9gwMXQysAFmBNyelij8BztSmG4GmXtlxed1V2wjsfBBNI0pYxaxjQ
Message-ID: <CAD++jLmNWGOLdo4apkCf39Au+N=9Gjn0Uwa1xHdYU49_-x2FfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: versatile: clock: Make sure clk_init_data is
 fully initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 10:52=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks right to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
