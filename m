Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87E3D5226
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179463; cv=none; b=kwonhmmqcJhiD7FKFmuhUQ58YstJVnZhpECTHU9xlWQP1yrzlhZ/m8P9gCHbSJh1KaE3hVjXFRPV55ty2R09yrDAtH9v8fYBbG/zrYUhdH3YQ14clRdPJjomZ0+5SLTW8OtxLeKPfwlzXcqTm8mNecp++8EkqFVmi2bhjw0URdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179463; c=relaxed/simple;
	bh=ROPHg9VN1Qhr0+agsTuMoXUjyKJkHv25AxjLVLVB9ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzQulezPsu1+hLcN6jblGb+BDqP8wHhlb4g6QO+73mTEj4m6xxDfTkdbjqXziWh66mGjNaL6ovE766z3CWK2Fn6Ko8K+7+/b6P5zWRbpwf4lRP4a5mq/pJKPiVc7JbqMPuEu8eheIIBA8LibqNZrsTT1e15+7+tu+SgnmBqYqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGSj19RP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGSj19RP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7ABB1F00899
	for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179461;
	bh=ROPHg9VN1Qhr0+agsTuMoXUjyKJkHv25AxjLVLVB9ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dGSj19RPNVZr855QJV+mFD/1CvtuBHkoJNWNNuDqWYjUE3uMO40myXboo5LhFLIbb
	 IlqtE+gjh5jV8Xf9H2ZojTNl0S772m8xR82i7PdDg4UgYhXJr7UBbcLGRwYmgkhdUQ
	 CwChBOWAHTU4VYZMnNoLSXqAfjcy2q8kNkNjpYn4b8mmI5qHhik55JFy8iwAvpMuVs
	 ztvkY4wdss2cHw8DcBwtqvB71M28ATZVltiFEJMpHEH0U6n/v6n1MDAuZ+me2oVMAO
	 vL0HXghSO8jXfP9q58hMJzwdGvECNrCmtfLZYw/TQMX5BdZTI1n1479O+yk8UFC21H
	 qBHu9ZhSeFbCA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa5ce4904eso8236757e87.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Jun 2026 05:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8mI1ppEtmL/hfCK8LZoO+roZ9/2++d4tkATnAib+x8XT2JDnD739Onu9ywdnNUlW1WhLenAU41A6rusQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6QP3cIf3JjNQnL3HrcAWEUub34fykaDRD8YesiY6qY+5I9gyN
	O6nDCndfesb0GobZZdKaOYIl9VM9OsLO7c8E7Zh2DovcjM/WNdmMoc6TwfSpkP0Z40SrIHNuxm7
	ECncbHq/d3SZlcx35EyBh3pj6XWCmObE=
X-Received: by 2002:a05:6512:124c:b0:5ad:bda:4e87 with SMTP id
 2adb3069b0e04-5ad27fb6a9bmr780946e87.30.1781179460707; Thu, 11 Jun 2026
 05:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608094122.1245189-1-pshete@nvidia.com> <20260608094122.1245189-2-pshete@nvidia.com>
In-Reply-To: <20260608094122.1245189-2-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:04:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0FwBGrzdFp2dqXnUg60jnma6BCKNDyirEO4BFZh6Yzw@mail.gmail.com>
X-Gm-Features: AVVi8CcCDaOf4-MRCZfqSOQvD3MxIOCKTrbjtHNT3eOWDtAlzq1F4eMyJsM7JZU
Message-ID: <CAD++jLn0FwBGrzdFp2dqXnUg60jnma6BCKNDyirEO4BFZh6Yzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra238: add missing AON pin groups
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:42=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Add 24 pin groups on ports EE, FF, GG and HH to the AON pin controller
> group table (tegra238_aon_groups[]). Their pin arrays, drive-group
> macros and pin descriptors were already defined, but the matching
> PINGROUP() entries were not present, so these pins could not be muxed
> or configured through the AON pin controller.
>
> The pin arrays were not referenced, so the build emitted
> -Wunused-const-variable warnings, and commit 119de2c33d96 ("pinctrl:
> tegra238: remove unused entries") removed three of them. Restore those
> arrays and add the full set of PINGROUP() entries to make the pins
> usable.
>
> Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patches applied.

Yours,
Linus Walleij
