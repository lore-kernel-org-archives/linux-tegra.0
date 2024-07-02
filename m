Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E66150994
	for <linux-tegra@vger.kernel.org>; Tue,  2 Jul 2024 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719910637; cv=none; b=o7faakJGoun0+/q4QiXRjHvhJ0Q3PV6z9FW16iTd6XcQtmPSm+hYENRbcoIqNyXJ3TwMhSZDrGTHBihHPKlzUWkZv4hmuzGhIqBua28aSTSfL/BqrmmWMIqeIniHLB++hdc8hYUj/VW/9WvKR/sEMn4E7KBra5jHB6fjYbM6KHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719910637; c=relaxed/simple;
	bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fx4n/SxE4dNR43gNEqgZ490EBdHwwT7qoUXy2bDyHTwDcFg7N/14ftSVleo1c7gsuj7R3v8S1/yxpUchfZlVrjRtMKUkIho0O65jJiZ8udE3nfGx3jYzqSWQ1MkQGJwjo7Ao6OVmnAJ7fLcvRSivI+NE4STG4KhFTfY1hVcgQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=glwt1H6g; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="glwt1H6g"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so46104321fa.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jul 2024 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719910634; x=1720515434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=glwt1H6gEHz5G7Wnt7RTnhGCqk5JZIC88aU+612xeTQ6wk6987komrereM13fpQuFw
         DnM3gWpGvivvrkmaVkZqjw8iQJMRiyL5bY2JlsfTg/sM/01DZXoZR6xmrnh1+cSB5zqI
         wsfe8xel4I0LhUKd6/AFreXDxAZnRqLVMcToFi+bCN9n07eOD/0x1TPiL2u+yYnWMxlf
         7kG098AIf2R+T9LJOtND3GOT2eZBBQUs0mjMgxScReV6q9Er2dv8wbfkAAu3VE9TdV3Y
         xJd+TqCnpltgchQuCl9btbMOFI36sdKBHC9/UBtE7oG5sFTS6Jge7euCZ005F0NnqXAX
         f41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910634; x=1720515434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=p4i62S4hnVrS+hgpL45g/6RooYytuyMu9ImVGxmnwiqTlJzfRR9W8FfVCsuGt2ROct
         bJ35vqV4eDrEU2e02aVEPZ4LTqx5Kqz9IBzEsZ9O4lOWsCdGqsHYjcrmysTuYb+QP2Zx
         IObXxqJWXEt5AkM8r/aCUEUAcUCIiPzUdMHK5O8EEw9q+cqSN1X/ZO0gK3Q9S1UgrCVn
         JjBVpqvJDOHypRfP6DGxEYqT9KaTeqcEaBoMBF8GQch68FzpxMIa6/ruYF0ehA++V8ub
         HLjkDW++aR6JbY8VXjeEzPQ5uwLRPopXv+HqULpNkvOGs7Q9W6TyKBX+xrAKe1pRG/MN
         5f9w==
X-Forwarded-Encrypted: i=1; AJvYcCVJkvXw2EHvi7KRH2kb9WSUml8NqN1sRe/oDIvFxLA4Bwr/Xwyv9A0ZA//00D5hiwkgWBZBbsq/vRSt7gsue9ucfVmm3NvBxCLEdFk=
X-Gm-Message-State: AOJu0YxC90lH+JnMxTrNtkhpZn/6LL5gtyRidolYbVDFGdtSqEep1f1G
	JRZZ7sZ50N112d1TEVqoW5ehWQs6PqQXOBMwFJQg8I5uwy+awArhPOinvJO8PRt1We7pn4jump2
	+lt6yoCsciF2s6WPL6sEezRxrunE1Aaj8KuT24g==
X-Google-Smtp-Source: AGHT+IHo5eEIsVu44pGpnRevjVwA1ZpOtmw6Mmmn4Q+VHOJCxnzpE8v3YnPOHaBgvtoU17z7s4obBrZVrOf9sLuZILM=
X-Received: by 2002:a2e:bc06:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ee5e6ba584mr55892571fa.42.1719910633934; Tue, 02 Jul 2024
 01:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 10:57:02 +0200
Message-ID: <CAMRc=McP=K0jSD56JdCR9DPJmJN39Z74mjAo0qX2mEnTBN1GAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] eeprom: at24: remove deprecated Kconfig symbol
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 3:54=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> All kernel users are shifted to the new MTD_EEPROM_AT24 Kconfig symbol
> so we can drop the old one.
>

Nope, with this series arm64 still selects the old symbol.

Bart
