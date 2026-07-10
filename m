Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454714AD0D;
	Fri, 10 Jul 2026 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690228; cv=none; b=r8A6njpomEZmdGjHxtxz+jCNniEB+inHQ0Qi90L5wzur8wBG5Bz5Ib+N3y4+yogY1EY0cK9rt7HMFh8CrcDVWKmkV2cRpbyHcbQqnvVn/vRn6Gy3SB4/bjZw+FuysYTRJC+wIAEWWM1r0t3lmZK6uga7ameJjDrR76VAGpGjaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690228; c=relaxed/simple;
	bh=b/vglTP+IKruvz2yGmUvcz9yqkMIbduqRzTMyqMIE0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBWBPU8I745+reKYtppmB/RnEwelbg+M7X4tehv/jC2oCx50FmaZ0tlVobXcFR5hyDPt0SpoGAx43rotvBI+cRyMYylhfLSi1af3lcI25Y0OmP5htvxO4G1aS0d3dIGi3MjMs3bvQEAgRRIKC7k7IO2qu89pX5t15hiZOCHcRQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FEORK/Pg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FEORK/Pg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A7851A0F3D;
	Fri, 10 Jul 2026 13:30:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BB5460342;
	Fri, 10 Jul 2026 13:30:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 711FD11BD0729;
	Fri, 10 Jul 2026 15:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783690222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uDJ2NspnWYSeFFrJVKp28js19pGvhwdwyMuLVe7XZ8E=;
	b=FEORK/Pg1YcuIm2N9LZYvA2jnKfWliNHVs2tEZfJAaJjW8vNVo/vsKKANTxRnSOFE/Sdwu
	XYPSc4pMTGNsbWA0IeE2WvOxAfVu2tFl3/YKHATQCnxdcWjF17RiGl9VLFewwgMieH2cV6
	oAp5fBYcQlA0RL8LziR1Ddut+b2/FEopm3P1IFCMR3AOJrQFLo1xaftjE0a/9UnGvcidei
	C+FpCqFMvxLKuC7IqVOI8y3FfR118wUCbzeEmq9u+i/XQr9wM4erAg45DA4ZgcfMD9uche
	QICf3kcwnbYzlyU6VtmaGufN3TMUAenzNKfnBJzxXWh31DGkgIhiLvGfI82V0A==
Message-ID: <f23adbcc-6f9f-4828-8de9-b85c4450b4b7@bootlin.com>
Date: Fri, 10 Jul 2026 15:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: enable the MAC on link up at 10G on
 10GBASE-R
To: vadik likholetov <vadikas@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bhadram Varka <vbhadram@nvidia.com>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710120908.3731591-1-vadikas@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260710120908.3731591-1-vadikas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 7/10/26 14:09, vadik likholetov wrote:
> stmmac_mac_link_down() clears the MAC's transmit and receive enable bits.
> stmmac_mac_link_up() is expected to set them again through
> stmmac_mac_set(..., true), but it first switches on the negotiated speed
> and returns early for a speed it does not recognise.
> 
> The generic branch of that switch -- taken for every interface that is
> neither USXGMII nor XLGMII, which includes PHY_INTERFACE_MODE_10GBASER --
> handles only SPEED_2500, SPEED_1000, SPEED_100 and SPEED_10.
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
> which falls through to "default: return;". The MAC is never re-enabled,
> and the interface stops passing traffic after the first link flap.
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
> Handle SPEED_10000 in the generic branch, as the USXGMII and XLGMII
> branches already do. For dwxgmac2, link.xgmii.speed10000 is
> XGMAC_CONFIG_SS_10000, which is 0 and is the correct speed selection for
> a 10GBASE-R MAC: ctrl then equals old_ctrl, the register write is
> skipped, and execution reaches stmmac_mac_set(..., true).
> 
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Signed-off-by: vadik likholetov <vadikas@gmail.com>

Looking at this, it seems the only important thing in that speed selection
logic is how 2.5G is handled : 

 - either through the XGMII block when using USXGMII

   ctrl |= priv->hw->link.xgmii.speed2500;

 - or through the regular speed selection bits :

   ctrl |= priv->hw->link.speed2500;

The rest is speed validation, and phylink should already be doing that for us.

I suggest that instead of this fix (that is ommiting the 5G case btw), we rewrite
the whole ctrl assignment as :

	switch (speed) {
	case SPEED_100000:
		ctrl |= priv->hw->link.xlgmii.speed100000;
		break;
	case SPEED_50000:
		ctrl |= priv->hw->link.xlgmii.speed50000;
		break;
	case SPEED_40000:
		ctrl |= priv->hw->link.xlgmii.speed40000;
		break;
	case SPEED_25000:
		ctrl |= priv->hw->link.xlgmii.speed25000;
		break;
	case SPEED_10000:
		ctrl |= priv->hw->link.xgmii.speed10000;
		break;
	case SPEED_5000:
		ctrl |= priv->hw->link.xgmii.speed5000;
		break;
	case SPEED_2500:
		if (interface == PHY_INTERFACE_MODE_USXGMII)
			ctrl |= priv->hw->link.xgmii.speed2500;
		else
			ctrl |= priv->hw->link.speed2500;
		break;
	case SPEED_1000:
		ctrl |= priv->hw->link.speed1000;
	case SPEED_100:
		ctrl |= priv->hw->link.speed100;
		break;
	case SPEED_10:
		ctrl |= priv->hw->link.speed10;
		break;
	default:
		return;
	}

(I haven't tested that, I don't have any stmmac boards here that can do more
than 1Gbps :( )

Thanks,

Maxime

