Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B433DA7FF
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600787; cv=none; b=XfNMTmHPkEqIbu/PyzqiFgamoNPT9eJwHG7gGaqpXPOLDmMGFz7952N5//3FWmCorBQt2VYIFdGXsZM89azF4waOd9NiO64jkX+aMmCvLfew4MgFynjPASTrZL72lmlmZhR7IaQHKeR9JzMc7tNJ3sIdeHyoX24r6TZCha0/HrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600787; c=relaxed/simple;
	bh=9MJT31aeINcZMGMVHLoFa3CZPYQ+ssR1QudYTkaEzaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M17EO8Sog8qMkztx+CEP8xDefdFjOXsIYiQvvGECnkhjVZMaXlyv/XPlHy4FvdM7z5eXoX52ekbHKkfmz2NwSCP3+SgAqmxVg6TeSVxyFxJNCH3vYBT/kuzI/7sehShG5X8SlyzflTYr3wFXWL3/D/saV4eSrLaEMAyP6UNZ528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2Md9jrf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2Md9jrf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B7A1F008A0
	for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600785;
	bh=dSg3kT2fLA3jr6CT33W9oAmxCzketncHCg6B1BQ+4Ok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=C2Md9jrfeG+gaf4kKWnITeZFsM5oydYKb3uCLs1b0I3nbfSJ1+lCiYQzUuNF5DAgN
	 h7X5wRRpdlYFG6I9T52EXK2mY1Y5UNmHbwYGfZtpg42ILb8GncC1ZdPLEez/cKNDBU
	 /YPFnmIaLkI9cW83E9opMcrQ0uDIc/7bqYgqX9d0fuOlBcXEbSR8tfsyVvzJfzn2xl
	 fNUtjZCmfywRoNynBI+n9IwvnAG2jtxYtRm7Y+eSlumuEmtKq6elhLfdpUkXSjqOk5
	 Iumxni72nTMl9Y7DcYA4jl0BQntTUt9G/jfhGFXRqEoP1SpLYvDzyPndlQv3tDmmwM
	 Mc+I28pyWlOhA==
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af43c5b0cso354762566b.1
        for <linux-tegra@vger.kernel.org>; Mon, 28 Sep 2026 06:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzJOQTTUuKUaVh1AxxzFtLdV8PGoWIPzqI2gzAItXxjMpleJJX+tf5QwtzNbJZ0E/yAAi76NL8Ub1D6w==@vger.kernel.org
X-Gm-Message-State: AFuF++nY/1er9r6QHi9BCcC0x0Xlo0jBEvdMHBWN7rgrj4cdMc53FRQj
	/xWxgjhZ7Drg62MBgJtveg9fnVMixM3AzvKQUY0WUn3b+E623bnUog7C+B24ALMKMv9SpcIQuSu
	tSHnDZSF21c9EFpuQAo8mNaCP3BGiYg==
X-Received: by 2002:a17:906:7946:b0:c26:1648:a06b with SMTP id
 a640c23a62f3a-c2ac2511a13mr1012188366b.38.1790600783728; Mon, 28 Sep 2026
 06:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-ti-tps6586x-v4-0-6c7a8fb8b646@gmail.com> <20260924-ti-tps6586x-v4-2-6c7a8fb8b646@gmail.com>
In-Reply-To: <20260924-ti-tps6586x-v4-2-6c7a8fb8b646@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Sep 2026 08:06:12 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+gwYcjW6DuGTeRj5AHZHAwU3_5sohLR0c-QLVwpb38gQ@mail.gmail.com>
X-Gm-Features: AclHuK936JmmOdyFrip_4yEB0zxMGhTS-Oy8SILUAvOVnvMI0ZJdPGR8zpJ133w
Message-ID: <CAL_Jsq+gwYcjW6DuGTeRj5AHZHAwU3_5sohLR0c-QLVwpb38gQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] regulator: dt-bindings: Reference Tegra regulator
 coupling schema
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@avionic-design.de>, Lee Jones <lee@kernel.org>, 
	Shree Ramamoorthy <s-ramamoorthy@ti.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
	daniel.baluta@gmail.com, simona.toaca@nxp.com, mfd@lists.linux.dev, 
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 5:04=E2=80=AFPM Bhargav Joshi <j.bhargav.u@gmail.co=
m> wrote:
>
> Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
> Tegra-specific regulator coupling properties. Update their dt bindings
> to reference the shared nvidia,tegra-regulators-coupling.yaml schema.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/ti,tps65910.yaml       | 12 ++++++=
+++---
>  .../bindings/regulator/maxim,max77620-regulator.yaml         |  5 ++++-
>  Documentation/devicetree/bindings/regulator/ti,tps62360.yaml |  1 +
>  3 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
