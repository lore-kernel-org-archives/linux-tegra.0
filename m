Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FC1355023
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841689; cv=none; b=bT48Iq4HyTGCS/oR/lDe8n89RZsGshsCyckxArj8DXmOOlilH3aKxdMf6qG6Hj9+p6llnxPMgH3Fw8TEhOCI16DzAKfCA+3vHIjCFYosIjqQ/G73PlnIVzVURtF1Sz54YWJYbmmGRtUUpv0QddRa1qMrerbPDIzda6Q4yiurDZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841689; c=relaxed/simple;
	bh=qmklrboQIpSfdlDZ2hHPRPuP8NQIz98sLqpsBfIp1xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJG1QBkdcYaz6CRsFBn1smQryx49RSbnF6PRxB+WLm8mGrLRLxgcleaHBLnD8hQZrQOxLwtK1qPXp9iqGhuGvkEIpbAwJyPLJjCa1VcggcWy/Zi6733icupKBCnKF0UrcC0nPk2d5Ng60DtEa9LTThJrtQZUOO7BoY3XZur/WSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5663601fe8bso3870456e0c.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 02:14:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771841686; x=1772446486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYufON41haCPAAlB17VyKfqSryTL2wR1KeTBsoMTWuQ=;
        b=SaBKgDgZUzBjGFUtpohZvJDN5Fk5zZI2p5NcUwl9BOn+INGw8JzSEnFCGvuuiRr2St
         7F1pkp1DgXjAmiC+RcMnVzE1b77ptd6ftAnEaCkast7K16UDZo1cLilKtvjh8S1P1Vgz
         C94BshZXbn/kvDTdff5Ai28RZ06ymnTDXiNRCoIQCKxwCWWx0qC9Eh1wlL1qvZSB2//E
         Yd4FJ2siIuqhA6jj0UiLJ747hfPav8Bkcssh50WfGqKrD7Uwj7u1cWpEZkuXqla/74/o
         Z1Q8e/u86qYzKlIMZqes/PocaRITTsn6FDqcrUaFDWOWUGS2okwarDMOxPtlkNyw1bGn
         Sorw==
X-Forwarded-Encrypted: i=1; AJvYcCVask17kHeiLsivGzL2yXXKThPOBXljgsmvHiBAeUlgVSrWA8r2wUo8KiA4haev1LO2WV1rJtEIFMRW4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIk1hVY3aE1stBEepE/oSv5gectHSoQpobGesIofoT20Aphs7y
	y9Ts7SmuEYGIsMA+B3biF+TRJsSKcKzLZnQQm/8T+l6UZ0fmE0j/boq27N5S/BSZ
X-Gm-Gg: AZuq6aKUnbbdsZQ/Wu4ypcM3y0mG9i/1gdJmnYkTWMaSOZmdVcph5NL6VOtmqaia0d8
	9M7B/zbR5tsGUpBEfE0uhgVLAdZfd0eDBAmIelMC2qB9+frZ7Fl6rK/1EALcAqx6PkId42D714H
	8atXg3sYgYxGYiON3d1I0+OBI79aEQwu75P7b0IVq4wR3KOnvmsRIzQCX2OexmrTSULXjxDc1Xu
	3J/sebLN8OraBowMpUXR+QAZnRwCqBeDAwuty53SnGKQPlBGgEu4YtvAZXXsp6UV4mTi8xBt0sw
	qp+lh22gRLXQK4QxtKW5aQYNZq0V9OVEM7ovZ26PvM7tGkQXuZkaZZAA2fmbdaPKfCtB58yA99d
	fP7AJn53BfaC05qqJrHQo4+32d6QmZK9KYDThiqGDF3On6aIRpsWCjw/6rUpQQ3ozis8azgbNNP
	P5zs519xhvzvXHUh1FkKCZE19u5x8X7HA/TVMf6YaeyIRfxbQ9rbjVwWp/F/uHEQOp
X-Received: by 2002:a05:6122:2a13:b0:567:5ccc:1367 with SMTP id 71dfb90a1353d-568e48681d7mr3760301e0c.11.1771841686589;
        Mon, 23 Feb 2026 02:14:46 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e58fe3cbsm8257043e0c.13.2026.02.23.02.14.45
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 02:14:45 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56739adfa1aso3049787e0c.0
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 02:14:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgXwRQvMvkpHIo40it5Omg/dkLN4byXCyeTNBSwTTv+b8L2rp9THb4hmsUsc+appQ3Q9PXk995MYtL2Q==@vger.kernel.org
X-Received: by 2002:a05:6102:38d3:b0:5fd:8175:2eb7 with SMTP id
 ada2fe7eead31-5feb30db471mr4509289137.34.1771841684922; Mon, 23 Feb 2026
 02:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217212707.2450423-11-cassel@kernel.org> <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810> <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
In-Reply-To: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 11:14:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
X-Gm-Features: AaiRm52HvurLndDwor1bgpbfCcI9wH1Ckd1tYC4oQp0RsW6za3e41CkVlZ_fe6s
Message-ID: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den <den@valinux.co.jp>, 
	Damien Le Moal <dlemoal@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manikanta,

On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
<mmaddireddy@nvidia.com> wrote:
> On 18/02/26 3:27 am, Frank Li wrote:
>
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>
> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
> BAR_64BIT_UPPER from BAR_RESERVED.
>
> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>
> This makes the BAR description more clear, and the reader does no longer
> need to check the BAR type for the preceding BAR to know how to interpret
> the BAR type.
>
> No functional changes.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>

[...]

Please do not send HTML emails to the list, as they are rejected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
