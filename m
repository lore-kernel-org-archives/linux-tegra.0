Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265E22192F5;
	Mon, 21 Apr 2025 22:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273037; cv=none; b=o4+k/Xkx4yyhqwK7oSi7yj3IH6irgUXYr30NPubM+oHZrKV9PPsTzmuY5DNCandJDKqr7xZi89TIgq4sncLSxuzi6tgxWYgLubCcnGTp2Jz4IK32/mlKUxgH/NRhSQzjfuTrpYFJuXp22kURNelyQRdtA24AiNqni1tF0GzAInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273037; c=relaxed/simple;
	bh=01rp54CilMkAwqIJ6zYTHUJAgrWddf98A/Ksdxy40H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrFl/MK0uJIlMQiyXtPHSc1vtfY3RvcuviGC26imkniCHSQJJC6/N0aGaM+GId3/PDLSvmuNQD7lJ4+YaUDWVWHhJuPn+1aRqtgKBdxLk2Dg8gIX9i6ikJ/IqS+bANqiEYxMC9TWqjblJuC3r+fdfhdOJfqeRnauuiC/uGztwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niazVZue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niazVZue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F63C4CEEE;
	Mon, 21 Apr 2025 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745273036;
	bh=01rp54CilMkAwqIJ6zYTHUJAgrWddf98A/Ksdxy40H8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=niazVZueFSQ2KvVxM1rVDNi77ZtQR9FgG2KKza5Ya9JH4acJh3hjyyGvs2NbS8T0C
	 QZpRWc7BVqGofg3U48tIcaAF4YbPaTyQplyC7dPOwxQFXfzSfUlwCMOXJHtw9fNq9Z
	 5qAPFcCU4x37EWTn7q43qh5bdSpljhEJz1DgkCqF0MLddyL72ATBiqG3eNbCERg97o
	 d39fcwkpUP3IFxyWH/M8ky10YA4aJJBjhWbkNO1ZZ6FuA6rKMdMaueC75OaZDFx+eG
	 WD4JxITWCJyHBP2+FN3o3VRmNCTb7MQtb4dvcAlUSN2+8hDTv/quTlImi63IPrr6sv
	 9MK7+yV99R4pw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2aeada833so838836666b.0;
        Mon, 21 Apr 2025 15:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkETo9GOzwY4og9/w9pgqJ/8FxYO6NJzNzVxDS39tRk7kE+7U8J7/C1Bcw9GhSM4yiigzrpNXXf+z6@vger.kernel.org, AJvYcCWRsd0mUZFy02tiX2iCadoWmY5ZAoo0Xsu7mSJklFH166uhitjiK97OT4Er/HAYrt6rYcE/z5l0W7AJRkM=@vger.kernel.org, AJvYcCXqWDjGR/3II/irlCiY4bn7JiuD/FmQDCMtv1ZlktKWWlB82HBy0EnyK+xYaE21oWi4Epqn5nTSz33XW+pI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+JyaW5UM+xEsMikPLYDV7UI+iRbYJFdZJYgyTNxl/gd3RjUY
	EomWKHhuPw4q+KSndfOxy5LIAGe0FyuJPs4xRPR5PZbM1B58Dj7+HBvhl9FQ8MRIMqWmA5EBpa/
	BNQMY7gZRLB+gTXJ/QdgtNDAmIQ==
X-Google-Smtp-Source: AGHT+IHxl6XK2QfRQVyCNWgLvJRj7ZuUIQ5fwQHcvIkQqattyeeIKmTOKM9JhGckpjhW3C3lyZts07ybe/w3rZATy8k=
X-Received: by 2002:a17:906:1f05:b0:acb:aa0e:514c with SMTP id
 a640c23a62f3a-acbaa0e5185mr349993566b.2.1745273035071; Mon, 21 Apr 2025
 15:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416120619.483793-1-shgarg@nvidia.com> <20250416120619.483793-2-shgarg@nvidia.com>
 <20250421220209.GA2975150-robh@kernel.org>
In-Reply-To: <20250421220209.GA2975150-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 21 Apr 2025 17:03:43 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Wy326DXXp=UGQ6WsB7-30RTJNMY3ckytk9auAh6Ec2Q@mail.gmail.com>
X-Gm-Features: ATxdqUGmWpmb8bR3-MQ-Nby0OrOQO3Xpm-Hrp3ML4dt6UzrpLCyrIfNheD-Tbpg
Message-ID: <CAL_Jsq+Wy326DXXp=UGQ6WsB7-30RTJNMY3ckytk9auAh6Ec2Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
To: Shubhi Garg <shgarg@nvidia.com>
Cc: lee@kernel.org, alexandre.belloni@bootlin.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 5:02=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Apr 16, 2025 at 12:06:15PM +0000, Shubhi Garg wrote:
> > Add bindings for NVIDIA VRS (Voltage Regulator Specification) power
> > sequencer device. NVIDIA VRS PSEQ controls ON/OFF and suspend/resume
> > power sequencing of system power rails on Tegra234 SoC. This device
> > also provides 32kHz RTC support with backup battery for system timing.
> >
> > Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> > ---
> >  .../bindings/mfd/nvidia,vrs-pseq.yaml         | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-ps=
eq.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml=
 b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> > new file mode 100644
> > index 000000000000..d4c5984930e9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFI=
LIATES. All rights reserved.
>
> First I've seen this...
>
> According to this[1], you shouldn't have 'Copyright (c)'. But better
> check with your lawyers.

With the link now:

[1] https://reuse.software/faq/
