Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6ED1FC7;
	Tue, 12 May 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544351; cv=none; b=f/puyNWW6exXAct3fvVjErLrBh8dqknkUTkSyHPax1qldIMbk8ZOan+FJLFb4qdmOwoWkMHCc7G7IqER2lB7/Kb9d81Yvqi991KRhH/6mtFV9ZANfvVDmLwnbWNW1aTBcpAxcvZ9Sf48l50TRwhtTVpao2b4uHTieO85J9xG+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544351; c=relaxed/simple;
	bh=kkCpz9U5igBoWHQPg2g2DTIcrL6yoXTvmxVfC6APpmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cp0HJ22olgqo3mmyqWpuYLFzj2TM9vwOFUM2sYJx5Ty/BxLYSOOUD6xpFbKLnr49KONSUOj7ynS7yE7MQEHUfrwzQz5Lnxflnt4kCqGcyIimKfAYsrgnFtsikuCij1XMdV41cauOEjYzS1mq0LG/3v56ZLXd5qSm+BJ2A1UCeyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E762EdsE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E762EdsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C095CC2BCB0;
	Tue, 12 May 2026 00:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778544350;
	bh=kkCpz9U5igBoWHQPg2g2DTIcrL6yoXTvmxVfC6APpmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E762EdsEUP7EeUzhirRq9i5MITTEaFNtN7TQO8/AG2hzT4JhP0YlYf5zWPMRW+vm9
	 vy8RE1eimM9ovu43s4LDcEBgeIJ1H1IJNYdY0SlvPlx94hODYdpj6g3MX6TrkSJhpB
	 eW3lcIEhn5mqC330gC482o9tc6f+sd0aqYEbXCPrFoGI5JwcoIbc3L69Y3areJiZsj
	 EAct2WD0Ehrl+YRpE3S7/PAl6v2sDGike04NBj1UZILhh5ScgIGsy8FExF4dVEiHaO
	 ccgLYIZX03UXYVZv8cLZwVaU4WYoRsLBn75inbCOBkjJ+NnQhvoY7g0hk8accfA67q
	 93jAypajenh7A==
Date: Mon, 11 May 2026 17:05:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Thierry
 Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
 <peter.chen@kernel.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 0/6] Add support for Infineon/Intel XMM6260 modem
Message-ID: <20260511170548.0065fd07@kernel.org>
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 16:56:55 +0300 Svyatoslav Ryhel wrote:
>   dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control
>     property
>   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
>     controlled
>   dt-bindings: net: Document Infineon/Intel XMM6260 modem
>   net: usb: Add Infineon XMM6260 Baseband modem support
>   dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
>   phy: tegra: Add support for Nvidia Tegra XMM6260 PHY

You need to split this more on subsystem boundaries.
