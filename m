Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17BD1E5B68
	for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2026 21:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052903; cv=none; b=MC2jNOhOJusXfqrDQiMGdF881B1y51lbpqctCcYmaSUJ+Dj2HDOSASxD/Vcwb9F82jPdjEWlIk5pqvOQrJnlxeZiNC/0oLFIUB6/GYCU+GkdKkHFLlwDfi+77AouhV9RORBPGTWNEOMnwcrTLGQat94mk0/3VckZPrM7ijE/UQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052903; c=relaxed/simple;
	bh=k98Bm3UVj63zhBkI6wrLRs31kagMcbh6IIHVpgl9C9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+K8q+LrIRECctwBZUMzETjX+VMANoL4o44UMvKyTLCEzixcMVXn1aYRHCNssvbsjBjhrzlLr65ODmzxIMY+O/jgqWlQ4aKaWO0Jyia03v/N6Gb8XTQxaE0YhkWEUBz62gkzupqZhxbCFsOieC2Npvf4lFYILDSG6RDayYrBSUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZpYDe6Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZpYDe6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A6B1F000E9
	for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2026 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052902;
	bh=k98Bm3UVj63zhBkI6wrLRs31kagMcbh6IIHVpgl9C9I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EZpYDe6Y09zCCXpN79/31AcVJo1mTu5+KlgNXNu1nO9T8ME5xBs+xOCwu2kJYyDNq
	 AFoueH4i+5m20TmQ8UhUsb6S34nC3xzbZXjQQBedCkO7VXQ0JGApbQFt5AEqz1im9Z
	 YEn86hIzdqJGM66CRu2YwULVcbzGym3tJeG8450gwHjbBSxexcQhBFvW24q2d4z22I
	 EMrp88ISe/41f9TF82IaTXPW3l8DCBfdJeOCwos0Vw03sK+L9l62G0EKmpSzJgzCrN
	 OdoN8LXDxNTXs3GCbpesu08QZGWAWGJmTNNvDEpJcrigd6wk5t5D9ivoWOjecwMsfP
	 ypxdTz0T56cqg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so2771638e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2026 14:48:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrvBf0n7rMUpbjW+axcjeoM0FfumORBHx0uuK8GKSFBJ2NZFgCbingpzf7Isk7DxX66tDZL1DYfBxx1Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB01cJBesASUvtTxm++TKWLOJN6nYZNCWBsFcvr2o0tqdV7Mgi
	R7M73vkRn3Jxd19jmNiYh6pS4hXH6bAiWQv1FaRdyT6vohEK7/dfdQZetD3V66QIH5jgCSMfQlj
	ZRfonz0tRM8L9CYJkuK1CpkYvQm+sgfk=
X-Received: by 2002:a05:6512:3e17:b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b303b7e6abmr663601e87.43.1786052901560; Thu, 06 Aug 2026
 14:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727141121.772110-1-pshete@nvidia.com> <20260727141121.772110-2-pshete@nvidia.com>
In-Reply-To: <20260727141121.772110-2-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:48:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLkY-r8QYT0_tr=CDKxqG7HdOmuxgBL3F-Y3KmR6iLbqSg@mail.gmail.com>
X-Gm-Features: AUfX_mwK_CyqtR9BVNeQ0f9t4vpa0IHqx6BW4oYdJSBTHObHrEw4GFinTFYQ7Ow
Message-ID: <CAD++jLkY-r8QYT0_tr=CDKxqG7HdOmuxgBL3F-Y3KmR6iLbqSg@mail.gmail.com>
Subject: Re: [RESEND V2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin assignment
To: Prathamesh Shete <pshete@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@kernel.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 4:11=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The dap2_din and dap2_dout pin groups were given swapped ball suffixes:
> DAP2_DIN was described as ball PV7 and DAP2_DOUT as ball PW0. On silicon
> DAP2_DIN is on ball PW0 (mux register 0x6050, drive register 0x6054) and
> DAP2_DOUT is on ball PV7 (mux register 0x6058, drive register 0x605c),
> as reflected by the board pinmux.
>
> Because the ball suffixes were swapped, the groups were also assigned the
> wrong primary mux functions (dap2_din -> I2S2_SDATA_OUT and dap2_dout ->
> I2S2_SDATA_IN), routing the I2S2 data-in and data-out signals to the wron=
g
> pins and breaking DAP2 audio.
>
> Rename the groups to dap2_din_pw0 and dap2_dout_pv7 and give each pad its
> correct function (dap2_din_pw0 -> I2S2_SDATA_IN, dap2_dout_pv7 ->
> I2S2_SDATA_OUT). The register offsets are already correct and are left
> unchanged. This matches the board pinmux.
>
> Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied!

Yours,
Linus Walleij
