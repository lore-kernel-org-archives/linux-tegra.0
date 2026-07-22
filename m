Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56C442B0D
	for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784742855; cv=none; b=G9jV9624j7gmi+REeGLalDcyc4FXKM80nskZGBKhjmtDP2N0GH/1ggPILaYbgMGtYJ6hZTmCQ+YifuHu0X4pDGX2jJkvt4+pVorB8yGoruYnfI43iDhLEWImMuFO6TyQi7r6n9t9gnCljBgj2g+FRw4H8IQAOSvp14Mx587CmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784742855; c=relaxed/simple;
	bh=usaMV1dIxfXj6MymHa2B9RrjjTnyKrAw0LZdEuuIEBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvACNqAQF4dfP8sRg2CnREaPgRjQaemd9a9pDkXgLEisINTK+9BqrwoRIAIUztRgcpY58H8noeIDOrpm/JBJcjf6nwaOrBtxPgTtHtQ+xhmPeyV1xAWlVnZ54BsKHK21UnbnbBnmfoXriie1AUfzOHvaH798ckTMRmeCEYH40iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmzq/d/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmzq/d/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949701F00ADF
	for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784742852;
	bh=wpXWpJ/XepBYidQLS4RBKK5VuWb9g6pAC0cnJOX/glE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lmzq/d/YsVm++VKdefaHPw6n8u3G+Cz3jYzE4EbEkFxM1U05Gh4ajAdRQmCCKalIF
	 LgxaehzcXUmk30Qd3yXJYvwSn3WvN+WY3FOmGhKbeBzNx6RDGcWWtbyg0qA/k+4rMB
	 hjnjGiF53DnJ0W5XS1+tANf99npYBaCX4WSqRI/noHkO6exDliymqZcGRYcOqm+gK3
	 03maHksi5kRJwOhviXwnsiyFSDHn5qBqCezyJ0mexhNDvawjJ/GAnvv7aebfBZJuqY
	 atWo2Ad3w5mCAKFOulb8yT0vRlDOLBhoO2/EnRUG2fJIqcXgNL18DOutOzZH23dVbG
	 8InXvUW+xTlVw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197f968b3cso35070566b.2
        for <linux-tegra@vger.kernel.org>; Wed, 22 Jul 2026 10:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUTdN4OWSll4oA3ww6r6gghHsqpq8K3TTW7I/wsv6edaFhml+k++FQvnzkFyTQYRi8sJDptFsacHGCRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yV118Gpv4lirnLqeqVPORdgCWyYyf6pdTvWpJsT4hgmTDxi8
	2eYXlV1/cljnSR4x1QwDOUyEOUQUAHEYagax8OzNLf657vm1r+8eZkTgrw7e5DKjCH1pYvKpP3V
	6/dR0yNNlHDdQgctMUyFich87Eo1kjA==
X-Received: by 2002:a17:906:478b:b0:c1c:4e00:3fe6 with SMTP id
 a640c23a62f3a-c1c4e004923mr15833966b.4.1784742851162; Wed, 22 Jul 2026
 10:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com> <20260716-tegra264-pcie-v8-2-23e51589229b@nvidia.com>
In-Reply-To: <20260716-tegra264-pcie-v8-2-23e51589229b@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 22 Jul 2026 12:53:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpSTbJoxu6CCe_1LpG3gR=Yx5VydTKufTp13LRp5za3A@mail.gmail.com>
X-Gm-Features: AUfX_myKJ3ItLjHpG8Uc2Sapy4DnBxW0AxTenwVXA8NEdz1LrUYTCptHK5c-Gr8
Message-ID: <CAL_JsqJpSTbJoxu6CCe_1LpG3gR=Yx5VydTKufTp13LRp5za3A@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:07=E2=80=AFPM Thierry Reding
<thierry.reding@kernel.org> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Switch to using the PCIe root port bindings in preparation for using the
> standard WAKE# handling.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/pci/nvidia,tegra264-pcie.yaml         | 40 ++++++++++++++++=
+-----
>  1 file changed, 32 insertions(+), 8 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
