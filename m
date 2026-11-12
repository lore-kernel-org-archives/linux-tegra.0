Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493213;
	b=2QZuNGBUjRzyqUtDriya390US+pje46YF02xcCE+WCNzI3dkYkmspJN1Ls4tN3I4WxdR
	 bS9tQDi+cvolL4nPqSE6O9PDOIvfwLxKz/kTEVrTefqkSYNIiv90BrDNSqRHCb4Qw9V3s
	 bKZX7ycejyU36L85vVd1nBX/5Rk/5i3xRSP7OTFbNwChf6+hTY0FisQEhrK0zdeJztcj+
	 U07ef2Oo6RhNwwpxV4M6YQFdzptEZZrbHqAs6hPlMZfbo/kXFV+ZFpTfNwrFNbSvbX+p2
	 qIgKBf770fB7CnEpCtwhsSm6zTA0mY6dcWQyK8DDjIqqR/YZj9lg/UwTlL9EzR3bIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493213;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E1CsLVh6aynACJFDOzaOC9Rn3V3RjM9yRgBiUsH2gk0=;
	b=o7M3TmnfJOwtmLoQhKj5i7Awm7MUdUAEZqrKHQ1M04wTXpfK3T1RX2iVtU59Ek9Z0TcZ
	 HmcF2mNX0dXSdp017aBiWQ+LSmk6q9SM41DKsh0onD+G4as9olLESf8Vjq58uAsIaEa5d
	 1cS2ASLxLdVArTOa27DgAk2TMr/is1D86hyy1KcPpwcr6tAmLsnFtOM4i2ZuBxWzT96+Z
	 IQZje6KCXxsRJEPZKHr/EkZS2zmKZaIk8avdtYmyhruQbK2LwPL5sJLWTW3Scp6q8E1n6
	 XNFtL5TQwijmXqebNneI3XiyyRkUkMJuUb3RvXY/3qKM0KGTw7wC+karvdo3itkUxiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoARwHnd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35065606B2CF;
	Thu, 12 Nov 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoARwHnd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030D71F00ACB;
	Thu, 12 Nov 2026 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493213;
	bh=E1CsLVh6aynACJFDOzaOC9Rn3V3RjM9yRgBiUsH2gk0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SoARwHnd2sroBBu3klAxmtwaHRx6rgBP/YSXGFybfTkihjpZJjk62hgOqEtgIxvNy
	 eZ7FpI3k9TCb+KEqIKpbqZdXfz9Kq75/0kXOmEDynVuLW5nxk7iGvnlLrtmAjvHnzn
	 g+gH02R8EVWyH5V7Mpy3eSe1saPhuUJrkE93EtcTS7sM91NPiNr7zd3Q0dPTlxz26f
	 l/D1r6KKduUj7C78o/Bf3KlVgOVeNitREf63LNeaF2PCYCj+kOwq3EQtKpg6r4IijT
	 W2vugE2Z4eoDf8tK/2fpl+mXccQmLXzpX4Es0sftGaiy0G+rOVYDxLpjGlTR6PgCh3
	 PbICow32k2IXg==
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] ASoC: tegra: ADMAIF: Add Tegra268 support
From: Mark Brown <broonie@kernel.org>
To: Sheetal <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, 
 Sameer Pujar <spujar@nvidia.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Anupama Kunkulagunta <akunkulagunt@nvidia.com>
In-Reply-To: <20261104111836.1100527-3-sheetal@nvidia.com>
References: <20261104111836.1100527-1-sheetal@nvidia.com>
 <20261104111836.1100527-3-sheetal@nvidia.com>
Date: Thu, 12 Nov 2026 14:20:07 +0000
Message-Id: <179449320746.339049.259253313248679941.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=33wr+nkv3EGi4Mh6rJ/otBChAadoJv9WSingu+n+VFU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+npaoZZzu9//wedWwpHZn9TO/F10PU43+f94j+uaqc
 78EAj/N7ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEouYwMuzYeP7p4vsm2TYJ
 zVx1l57KhO0zf6B8Pz7yUfwN1eCXnwQZGV4XX+I+5Ck4b9qHenbjMCHlKRcimm5l/uURtZltMkF
 wEgcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
> five RX and five TX interfaces. Add the compatible and SoC data for
> this configuration.
> 
> Add register defaults and five-entry DAI and control tables. Retain
> the Tegra264 32-channel per-stream limit and use Tegra268 FIFO defaults.
> 
> Set the register bound one stride past the final global TX enable
> status register so the access callbacks mark it readable and volatile.

> +/* Tegra268 specific */
> +#define TEGRA268_ADMAIF_CHANNEL_COUNT			5
> +#define TEGRA268_ADMAIF_RX_BASE				TEGRA264_ADMAIF_RX_BASE
> +#define TEGRA268_ADMAIF_TX_BASE				TEGRA264_ADMAIF_TX_BASE
> +#define TEGRA268_ADMAIF_GLOBAL_BASE			TEGRA264_ADMAIF_GLOBAL_BASE
> +#define TEGRA268_ADMAIF_LAST_REG			(TEGRA268_ADMAIF_GLOBAL_BASE + \
> +							 TEGRA_ADMAIF_GLOBAL_TX_ENABLE_STATUS + 4)

This is the one stride beyond thing from the changelog, I've got to say
I don't follow the reasoning there.  Why do we need an address one
beyond the last one that exists to be readable and volatile, and why is
this different to the other Tegra devices?

-- 
Mark Brown <broonie@kernel.org>
