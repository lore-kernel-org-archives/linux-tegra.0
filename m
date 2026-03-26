Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458D33D6FD
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520219; cv=none; b=MPzXG2Rc3efQHtl1d49eBILIS/xxRDUzrpXdlTk/091I6/CBVdZkqgEV8OU/mVJfBqGK1gVComsfrXLhP93555h6u12vhfU/tvpJhI6MDUxvqsiyrUbjwM1koYFBMMDUbvhskr5XXrZDG+IsAk3f2xxbl37kEbFrHjq2zJBMlr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520219; c=relaxed/simple;
	bh=5+Wld1uE8fci93f3ikEjkfEzNS+Sq5hrw02mrCqry00=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BccCoCbBNIO6BcP7NXxEFDwaJ2C5VYD9ltIDRNX4LLk2XsS9dCPLG8HzqGMSYbO/KpCcF8ofB4kBHzi72GKYuvvYNmNjZhZkAKaEE7qB3VHXVKFtQj05dGAGMy3E86nM4xlRJEqzp+xLO/E0SINvqmMdUA4tTgIUduR5kfnsot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtcKVLp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtcKVLp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411E3C2BCB1
	for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520219;
	bh=5+Wld1uE8fci93f3ikEjkfEzNS+Sq5hrw02mrCqry00=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GtcKVLp8KviwFnE4f/4ieWPFVpket/9v8WL4S6ryt8BK61pTs4CSjSyNQfLnt9Q+g
	 hrvjFZQoeUIM/vgv4edFr1PzV671hAAuEVLC3vIe7IKASQSYgyE/3IKFA0n7KOYl8a
	 Ay2a99ZP/LpSSFOqjT5FgolskE/ZrVD3oGJp/1IBdCdS1XTF4/31qULqblYaB78z0L
	 tJvJh6hxp+ksMnawT/4up6nq1grNxtTbSZgd4hiticgaBRFXWJDgsAxZdNsYxwur9j
	 55czNvNzUttqopdxce1putKnJLOOudceW3Xntr1SEr8Wu3F3cAXiVWqYb1DR2Dsjck
	 1kDl/kBuyZX1A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a1307438ddso913888e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 26 Mar 2026 03:16:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW10gNYlQsgNjnq0TU02RJUp71m5YFAH1eoljYyS9UV92DN8vrkRIl0UWot9k5UfHOOK8wp0+VDYc2RMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lud0PAJrVJeBfxQW8x7JDOtNffumoX0XZjMq6I9hIvxDz03p
	sDhTFu9CyEhnl44xrrjZmayS0eZSGgCmUdeZ0Wi2foSeaIhgebsgrOri06PfYNBmDcuSVi/68fI
	RNnZGgtQ5HN89uuxequAV51iDQr7+JBl6qg5eKbOMiw==
X-Received: by 2002:a05:6512:6c4:b0:5a2:8433:af35 with SMTP id
 2adb3069b0e04-5a29b980c78mr3508946e87.13.1774520217879; Thu, 26 Mar 2026
 03:16:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 03:16:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 03:16:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <acRtWZohqfDLbMKE@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <acRtWZohqfDLbMKE@google.com>
Date: Thu, 26 Mar 2026 03:16:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+jrJJ34K3TfA46VL76Egi-MAcPj=X9jQGdCtc8-KENw@mail.gmail.com>
X-Gm-Features: AQROBzAeJMUKoW15_JABBsm5WMBNoQbs7v0FFIuKi5a_KzgY0RVFileLg4A4584
Message-ID: <CAMRc=Me+jrJJ34K3TfA46VL76Egi-MAcPj=X9jQGdCtc8-KENw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: tegra: paz00: configure WiFi rfkill switch
 through device tree
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Mar 2026 00:29:54 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
> device can be instantiated via device tree.
>
> Add the declaration there and drop board-paz00.c file and relevant
> Makefile fragments.
>
> Tested-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

But now I need to find another victim of my auto secondary fwnode experiments
for OF systems. :)
