Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36133B42FC;
	Wed, 15 Jul 2026 20:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146516; cv=none; b=UYaL3Mfj9ZhrbzVsdDIUbumf1wBgcKTYo7NWWh3kwXv+5QpkP32+gaR5qrJI+6qV7WnR9DZkW8rQTGrKe+V2KQ9pKO0ztm1qoC3sTjq9A2ZWiguyZlEPPLYcQG+T8a1QbeS8bR4X1JFo0JpTygEQU64ilN/H2YG/WyQXnFftMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146516; c=relaxed/simple;
	bh=zMWdskq3PJIposuO9QGPnhNJ9CkB7xJEI6kyveRmc5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnjwepBeaZpDOjRHysZAW8c+HUIg126xuYuPeiVque8P8Xh7KQIeeMfUzIPhY0bww9oSkuibIDPZmz+lUB3RBE9Ak3a7zrn6QYfaobFQD5UTfnhCS+1XwdNn4uV0T2tYqWv4Qlo0mTNF5mD3SvrmNe6xeSiWnc6iLSWFDmgNX50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nPvl6wQZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nPvl6wQZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33B4D1A1007;
	Wed, 15 Jul 2026 20:15:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E61CA6035C;
	Wed, 15 Jul 2026 20:15:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBAD211BD050A;
	Wed, 15 Jul 2026 22:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784146512; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tVIRVlFxjxfOODCPSlfJl/5I9uxASI93Tb+Azv15+yA=;
	b=nPvl6wQZUEA+KAwDEeVKziwkmYeWcqRzJcmE0qJKdQMUAXBgqccMRAzrkOBGnRWqoRBDEF
	vtpt/E/nIgB6PifIzkjzSgrhAFxcF1s85evDBnSjA+246Dsud67kKRCiN0vO3UbqIimeKu
	G1f6BsZn53kk+Q/pDYXfuJtFap4DBPLuR/phFkwJW1bWsgJ0a40ibFbKIEESTYtILcUQNo
	lIamfPYCVF8VaIu/hhQbbz/Rl3YTn/czK2u/FwQSv+Ttue9hWj1y/gMROxnOv9Qf8sVzhk
	EWhZuZshQomAucp0LGgXf3RNFslnTVYT6peL96fvhkK9kh4FUBIO0mPkI6D/tg==
Message-ID: <5c992328-f53e-4516-b7dd-85d0f0022a81@bootlin.com>
Date: Wed, 15 Jul 2026 22:15:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: enable the MAC on link up for all
 supported speeds
To: vadik likholetov <vadikas@gmail.com>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 thierry.reding@kernel.org, jonathanh@nvidia.com, vbhadram@nvidia.com,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713074911.30090-1-vadikas@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260713074911.30090-1-vadikas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 7/13/26 09:49, vadik likholetov wrote:
> stmmac_mac_link_down() clears the MAC's transmit and receive enable bits.
> stmmac_mac_link_up() is expected to set them again through
> stmmac_mac_set(..., true), but it first switches on the negotiated speed
> and returns early for a speed the switch does not list. The MAC is then
> left gated off.
> 
> The speed selection is split into three switches, keyed on the interface.
> The generic branch -- taken for everything that is neither USXGMII nor
> XLGMII, so including PHY_INTERFACE_MODE_10GBASER -- lists only SPEED_2500,
> SPEED_1000, SPEED_100 and SPEED_10.
> 
> MGBE on Tegra234 runs 10GBASE-R into an Aquantia AQR113C. That PHY does
> rate matching, so phylink_link_up() replaces the media speed with the
> MAC-side interface speed before calling into the MAC:
> 
> 	case RATE_MATCH_PAUSE:
> 		speed = phylink_interface_max_speed(link_state.interface);
> 		duplex = DUPLEX_FULL;
> 
> The driver is therefore called as
> 
> 	stmmac_mac_link_up(interface=10GBASER, speed=10000, duplex=1)
> 
> which falls through to "default: return;". The interface stops passing
> traffic after the first link flap.
> 
> The failure is easy to misread. The link still comes up, because the PHY
> is polled over MDIO and needs no MAC, so the interface reports carrier 1
> at the media speed. The DMA is untouched, so its start bits stay set and
> descriptors are still consumed. Only the MAC itself is gated off: the
> receiver counts nothing (mmc_rx_framecount_gb stops advancing, RE is 0)
> and nothing reaches the wire (TE is 0). The interface survives boot only
> because stmmac_hw_setup(), called from ndo_open, enables the MAC
> unconditionally -- so the problem appears only once the cable has been
> unplugged and plugged back in, and "ip link set dev <ethX> down && ip
> link set dev <ethX> up" appears to fix it.
> 
> The interface is not what the speed bits depend on: with the single
> exception of 2.5G, which is selected through the XGMII block on USXGMII
> and through the regular speed bits otherwise, each speed maps to one
> field of struct mac_link. The per-interface switches are speed
> validation, and phylink already validates the speed against
> priv->hw->link.caps. So collapse the three switches into one keyed on the
> speed alone, keeping the interface test only for the 2.5G case. This
> covers 10G on 10GBASE-R, and equally 5G, and 1G/100/10 on USXGMII, all of
> which hit "default: return;" today.
> 
> A core that does not support a speed leaves the corresponding mac_link
> field at 0, and phylink will not offer it that speed in the first place.
> For dwxgmac2 at 10G, link.xgmii.speed10000 is XGMAC_CONFIG_SS_10000,
> which is 0 and is the correct speed selection for a 10GBASE-R MAC: ctrl
> then equals old_ctrl, the register write is skipped, and execution
> reaches stmmac_mac_set(..., true).
> 
> Log an error in the default case, since a speed with no entry here leaves
> the MAC disabled and the symptom does not point at the cause.
> 
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Suggested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: vadik likholetov <vadikas@gmail.com>
> ---

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

