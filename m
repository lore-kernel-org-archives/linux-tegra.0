Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA9034107D
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931528; cv=none; b=jdoJ35T3tPcRNLhQFwgAYU79+bYLPtO6ebMnoLy30OqZw+VBN3jIAPRP5JxfB7ey6O8Ox8OK4KLgFUGwyxSGM9p7eL5UCbRwirdJRW3ZqYLhRrLiept9mL6Za0H/smEGrDEbDrSkp/SOsC5RYOwwU9YImscH9xetLwEzhLWbDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931528; c=relaxed/simple;
	bh=Y5AUihlHPx8033n1yOFmjVml/WtHSR3f0szw+EBr36U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwY+kh+hhOT5G7O5rsTjk8vfbTCMUvi4fIZ3ZQAKiKperhUohiBGsF+F/DpOOJZNV7qOll+IE2jCM1QPK112iezgeRctopP6RZjHC2s1gNLT213eqm8c2VDRw+9zoCceOjBX13JRo9N9xGdFuma+J48B3rS6QKifjTbPudLTLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXICIGf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXICIGf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927161F00ADB
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 22:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784931527;
	bh=Y5AUihlHPx8033n1yOFmjVml/WtHSR3f0szw+EBr36U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lXICIGf1UNWbXRobIKI9vq8gfVQOaBiRfA6RrCvGwb+7k1eIQt1onaKPXJE9EwBMd
	 DSDP3JGtdHAPsI9P7VG+5OkWFt8NGM6qSft7tJ7qHymSY1573sWp7WdkZrqi2Bo/DW
	 zg4ccVEXCrrLmxOeSQ/OZiYWf/jI8sH8X0cr5ngy+kZUKmUVgJsQAhts3RQdTNFZtf
	 9JBWn6EJfIUGIBbHJK/jSxpCcPqKmDG4iXe+p5e7f60H2sdauWGHh98TSiinB2RPoS
	 8fGlEVNFh+1VjncXkKjb81l28LQ9tVkyUAqo4vW70Gd+4Z8tkx9j/PQ/VE+kosqvCB
	 w1v1C7tIEKTEg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b021916bd3so1005512e87.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 15:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpfUtcN26WLNER8TdQvHfjFADvASL0gWQGCjdXQybE4e/dxnJqyhobcUFIL/CxgVs2D5c1Yf79STT+Jeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBBl7DhtHtane0OO+D1IMxaztK6Z3z8td2k+ouTHrHO7X6SMwi
	9cpCNht7h1p3Sx3S4YV25d6hV3i2anV0rdVZi4nQ1pb2lpz6kc0vyHLjhj+XHQ+m5Ck7oDGo4sr
	jd62rEoisyqyfYjap1rXc4LvS5y23P3s=
X-Received: by 2002:ac2:5469:0:b0:5b2:a75f:8a6 with SMTP id
 2adb3069b0e04-5b2b2f55d02mr1518354e87.29.1784931526354; Fri, 24 Jul 2026
 15:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717113210.599463-1-pshete@nvidia.com>
In-Reply-To: <20260717113210.599463-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:18:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLnY85znRbLgVdRdi+KrkbRpY76EpmXJ8G8K=ee5_HMYpA@mail.gmail.com>
X-Gm-Features: AUfX_mwqFAMi9qWV0Q1OSmDfHdOr5bMPAC98hlFCKCt_w73sAvw_TCl3Lck961g
Message-ID: <CAD++jLnY85znRbLgVdRdi+KrkbRpY76EpmXJ8G8K=ee5_HMYpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT
 pin names
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, u.kleine-koenig@baylibre.com, dakr@kernel.org, 
	bhelgaas@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:32=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> dap2_din_pw0 and dap2_dout_pv7.
>
> Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin control=
lers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

This DT patch was not CC to the devicetree list, resend so the DT binding
people can ACK it!

Yours,
Linus Walleij
