Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253C35C6AC;
	Tue, 21 Jul 2026 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673755; cv=none; b=Wg3jx6/fzTmuBk5XrGYMcD7KmhVBqiYZ6jqMiaoWZgDXB5aGbsK0UuvLkMqOtE0hX9Tkw6ALOV2JNi1K4hUXqSDBXU+tu9tFK/GRT8wqvOnyou6Vr4dK/DKoIJSHyU3e7r4aHEoPOyXrFI4h7kgC3R6G27glZly9Durq2qLrPXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673755; c=relaxed/simple;
	bh=R+7RPh2mqT0UzOlAQm5I9FbP/doY/PU/NXrr7/5dqh8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DwYV/DpTS0yJZalQmm8rM6FgfVDLZTdyFoy8k33iGcsur6+XhCaxfD38Ec/hK+2zE1bnRtUL8aNoyU/iwDz086ClMibASzrF9B7+UkTyzv3YCzgJjWVHDQmThYAVrx4MdzexcxlU8EE+S1KeZgoknQ4MqU+2sqLziLBMs+6iXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C80fXMY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C80fXMY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE721F00A3D;
	Tue, 21 Jul 2026 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784673754;
	bh=R+7RPh2mqT0UzOlAQm5I9FbP/doY/PU/NXrr7/5dqh8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=C80fXMY/m8fx+QU4G7GAaHr4JPxP/1AEGiobFcoWJTGwAqOXWkCBTtZk4srjQtD2B
	 SEjuU4HcriMFEVdPS+8LtCIV+oohUa/V2MRxsmMs8suVy4Xqlrvoe+imvE7XyiX3YO
	 Bw+wVu58/hvLPPPfqHEWLAQhVfIHf/JURf/7Ti0cJzX1ikAh+SHBNR8bSG26ZsPJKH
	 5Sl3MWGQ5yWr2goEQwi16XYqh4uU7WVlOdMEpcxny/GMWLVxkHrnJpg3J43UT/9ZqF
	 8Pq9vlJkcfYruG1C3aoi2smPXbELwiZUIjE6Sh8a36UJ+h93RYuMEZrC7i17Tqoxmv
	 17cAfrxLfzjsQ==
Date: Tue, 21 Jul 2026 15:42:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: vadik likholetov <vadikas@gmail.com>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, andrew@lunn.ch,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, thierry.reding@kernel.org, jonathanh@nvidia.com,
 vbhadram@nvidia.com, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] net: stmmac: enable the MAC on link up for all
 supported speeds
Message-ID: <20260721154233.77e5b97f@kernel.org>
In-Reply-To: <20260713074911.30090-1-vadikas@gmail.com>
References: <20260713074911.30090-1-vadikas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jul 2026 10:49:11 +0300 vadik likholetov wrote:
> stmmac_mac_link_down() clears the MAC's transmit and receive enable bits.
> stmmac_mac_link_up() is expected to set them again through
> stmmac_mac_set(..., true), but it first switches on the negotiated speed
> and returns early for a speed the switch does not list. The MAC is then
> left gated off.

FWIW Sashiko has some complaints:
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260713074911.30090-1-vadikas@gmail.com
but that reads as a separate issue?
