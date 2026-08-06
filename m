Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19124423E99
	for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2026 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052877; cv=none; b=U/pqKmDq5lAiBuiaIstdyEzSkBPGw2sHVPt9skzCsQEmdHrnm9cPnW6y2G61buP1OAEXvfN/JR6PZn66CtUHQnejX74rVS/H8y3WM3BnfECQ+wkOc0RmsW2MVXALy7qnAC/czQHtM0rMl0z5bEOYcItFxY3s5IRoL0b3/GHqDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052877; c=relaxed/simple;
	bh=CaL5TsSLfvCa3cDrJz+Yqsek3VoUcRNh2Kv16NL3Z3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0UEPSF9MRzyK6LtxIh/jtgLoTsEofhp0ydHGB2LVWEhCXjh/w79Q3rWR9h4RoH9176obNyJ5pqbjYItWgC59MlvRYhPJTnEBK16HYcfvbpVlqNTRa58RplNyzrweA9FPopWrvAoFB7F/m2bGz4O08mVVG3jZssNag/HUTubyOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvzzFU1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvzzFU1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BAB1F00AC4
	for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2026 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052875;
	bh=CaL5TsSLfvCa3cDrJz+Yqsek3VoUcRNh2Kv16NL3Z3g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DvzzFU1miAzRlp6j+eonbpWh4X3cQF4Zf8ip3ufvQ056MS4NxAMMUIyeGkwdJAZ69
	 tnWU83SVFGofvLZezJWkkYcyDPssUsh5ziJinzY6FngfG8/eOco/4j1nVt+Mu9VbPc
	 1cTKWylUBgVTX+o7jN/ew0TiL+qRW7BCEVonYxSpka7MpB4z5ilP2ZhA6odZx/10+0
	 S+M+b9JrsmwxtOODIRmsvl4OJqtmCCptpYEzTe9VCKZmbrhXDNMkZq9LcxFkXz9XG9
	 5PIgyCFnc1PtfbnEOOyg3n884tTdcZXJ8+DLi03HFUg+fThk2yob00qliKrCmvCdc7
	 B+SazV4W95Pzg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1788187e87.1
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2026 14:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpGjjdDQ0GS3F0x7ZuA777uxcEb/kWkydKVASpS74eRR49QH+UNolSkvZsn+iiJqYZi29aHvlC6q2Lz5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Evquh9Jsh+sHWSFriYGlmxCqBk3dk+KB0V+4IYpOm2s2G6Lr
	5j/JXgTHXHpGtbqUFMf2ODKiCkToerjq3zXxEMPnzz/VH5Jiv4XV/36orYiJB4G6QLrk08B07PC
	D1O7TqcafvaAhqxgV2l2GA8cS9BzIqqI=
X-Received: by 2002:a05:6512:39d3:b0:5b2:e178:4088 with SMTP id
 2adb3069b0e04-5b2fe39cd5amr1905632e87.4.1786052874207; Thu, 06 Aug 2026
 14:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727141121.772110-1-pshete@nvidia.com>
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:47:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=b8B2YVB3dHkPLOYDxiffaST+CgbYy50aaQ1mPFyM-6A@mail.gmail.com>
X-Gm-Features: AUfX_mytEg4ToHSuhGJgiTmxeaRsRUFU0bYKV21UeLQlt-Z3TQER_mVGqT2sPSY
Message-ID: <CAD++jL=b8B2YVB3dHkPLOYDxiffaST+CgbYy50aaQ1mPFyM-6A@mail.gmail.com>
Subject: Re: [RESEND V2 1/2] dt-bindings: pinctrl: tegra264: fix DAP2 DIN/DOUT
 pin names
To: Prathamesh Shete <pshete@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	thierry.reding@kernel.org, jonathanh@nvidia.com, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 4:11=E2=80=AFPM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The DAP2_DIN and DAP2_DOUT pins were listed with swapped ball suffixes:
> DAP2_DIN as PV7 and DAP2_DOUT as PW0. On silicon DAP2_DIN is on ball PW0
> and DAP2_DOUT is on ball PV7. Correct the pin and drive group names to
> dap2_din_pw0 and dap2_dout_pv7.
>
> Fixes: 30a9d5162f25 ("dt-bindings: pinctrl: Document Tegra264 pin control=
lers")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied!

Yours,
Linus Walleij
