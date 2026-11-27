Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789239;
	b=fpobpxy+seBw0KZfi2a1VjEpxlc5IP5nSMQrIMIJDYBdMptDRRkkm9Y7gpZ6TpFlChMH
	 JH314ni/x1BrFOLQgPpj/9XJKcJV08NsT7RwMBVD11Dzxc58njNNnrsj5jj2hJxwERTUp
	 zbJYvzC/nMmtWZ0z1YGEjfALQHLguBzvuwwU5rdeJDdce834Uw2/IRpQm39ZQURwwUAvb
	 fMt2Shly6TMCzFaiJzuJVS2b+IsC20Gq1GQGxY1nM4HV7si00VfbQ6B2nM4mta7JWZPXY
	 xA7ybgieJMah9/Slmie/wbHaoGr5I+wLYJphmWjRPlHaf72k2k/lsJOd2nL+/3Zv1kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789239;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Kgs7wFN+rDT65O3xOykNsRGmtOt720h2hJLHwk70/Nc=;
	b=xJ1sgtiAQlRiRBji32Jv8BcgxFSzEJnqNeDtdw2sNABiidA4QNsM8M7y1BuJeHI6AOjQ
	 5LxpuLFS9YaO3jBmY0OT1Jg0P6kJI+0jYFYae91HSSIgR5fvDgBDO7ma8k2yUVJVnPJTx
	 p74mkiOo0T6r+dBTdBfWqsSnnzD9XwpJIYNP+KGLtVmz2ylmouJ2AyZt2PDMPO5dxLhnt
	 SV7TdwR9iuIRQ6z0lgwz14ZWhYgJREZkRtZpnrvwdot5G/LG+RxDmuy2QvMmp1dL0Q/ep
	 x4JgvJKlEWiLxZefysBTz9jIOzbQT+ivStrgC367c4obTMfkO+u7pCbC+tqfEHyzlCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkL3oTpf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B27606A31F
	for <linux-tegra@vger.kernel.org>; Fri, 27 Nov 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkL3oTpf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6001F00898;
	Fri, 27 Nov 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789238;
	bh=Kgs7wFN+rDT65O3xOykNsRGmtOt720h2hJLHwk70/Nc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nkL3oTpfaIdjpDp3MrA5cigT4gIOOBaZyKoIsOZ1kRvC7SzZNQIlU/laZngXyQ78X
	 GKL38XmBVHh+i7ZhbumXH/dRRbrwYwjmRkoPWv/TAguGhZdz5+EgmL/kQiR4P4pz94
	 8fZa4yron1cWzPk//Hh3Hl2dFdohzbhwmcuDhCtvB8rLMvgco3mmmToflZugwBwrst
	 FnqyRHOy/qIZzL1kKoSOjFp8eEPaPOtjDR4ZQfeq+tfDq+3hkgrvoWJPKbypS6RMFh
	 xyt1spLj/9h8mOjVKn1q7JNR8myREhYPhdmDWo5mwCsX9iOlYWJZQEhxO6d1Z/CBGq
	 79TCZsH0Sd/fA==
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
Subject: Re: [PATCH 2/2] phy: tegra: xusb-tegra186: Extend Tegra264 fuse
 calibration
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-tegra@vger.kernel.org, 
 linux-phy@lists.infradead.org, Wayne Chang <waynec@nvidia.com>
In-Reply-To: <20261116-tegra-phy-tegra264-v1-2-a82b8e10a553@nvidia.com>
References: <20261116-tegra-phy-tegra264-v1-0-a82b8e10a553@nvidia.com>
 <20261116-tegra-phy-tegra264-v1-2-a82b8e10a553@nvidia.com>
Date: Fri, 27 Nov 2026 19:50:31 +0530
Message-Id: <179578923178.13164.18174436960653488279.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=mani@kernel.org;
 h=from:subject:message-id; bh=FDkL8TxCdGt4Cot5ZWKl2DVZjdjNpPaai+/tR4lm0r4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCZGyPFaCXzURl6P1NsgTMnDY/wNb3kHWstCFT
 rhY4OhPxBiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmRsgAKCRBVnxHm/pHO
 9clyB/97O11fXYXpVTrahiofe1gtv6SR/ialX31BVmoEoP5jOSrzI0+Zbun7SBpo/uSMuwh5STf
 cfg/OFmFghe83IELOA3i307f2pzeWdJAEoQ6G9Og4QBDne9Q3G/4yTHe5rCyYbNVe56k05Dm5ao
 0NTsifKlsyXHa2D8ghsh4eDEe0KyAiRcPZsuEtptQ2btwbKAF67aoFxxL9OD4Dg3+LfR/WoiA3z
 LoNdwHtEiNtMC31Hx97CnduoOsDMrn6Damv6/LRjo4SNDGCWtnWuhwouZQXJjEzXQfpkUqKji+L
 krkWorP7vTVYXJZ9IJrV/SUxOqlhLTqEtr5fcMd3u1CYXH0l
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 14:51 +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add support for receiver offset and squelch offset calibration on
> Tegra264 to compensate for manufacturing variation in the USB2
> receivers. The receiver offset calibrates the receiver differential
> offset between D+ and D-, while squelch offset calibrates the squelch
> detector differential offset used to distinguish valid high-speed
> signaling from low-amplitude noise or idle. Each USB2 port has a 4-bit
> REC_OS (receiver offset) value and an 8-bit SQ_OS (squelch offset) value
> stored in fuses.
> 
> Add a SoC data variable 'has_rec_sq_offsets' to indicate if the USB PHY
> supports the REC_OS and SQ_OS register fields. If the USB PHY supports
> these fields, then read REC_OS for ports 0-2 from FUSE_USB_CALIB_EXT_0
> and for port 3 from FUSE_USB_CALIB_EXT3_0 and read SQ_OS for all four
> ports from FUSE_USB_CALIB_EXT2_0. Apply these values to the corresponding
> fields in each port's USB2 pad-control register when powering on the PHY.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 57 +++++++++++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h          |  1 +
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
> index 82f5c6c8f6a8..8bfc340724e7 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -27,6 +27,10 @@
>  
>  #define RPD_CTRL_SHIFT			0
>  #define RPD_CTRL_MASK			0x1f
> +#define REC_OS_PADX_SHIFT(x)		(17 + (x) * 4)
> +#define REC_OS_PAD_MASK			0xf
> +#define SQ_OS_PADX_SHIFT(x)		((x) * 8)
> +#define SQ_OS_PAD_MASK			0xff
>  
>  /* XUSB PADCTL registers */
>  #define XUSB_PADCTL_USB2_PAD_MUX	0x4
> @@ -81,6 +85,10 @@
>  #define  TERM_RANGE_ADJ(x)			(((x) & 0xf) << 3)
>  #define  RPD_CTRL(x)				(((x) & 0x1f) << 26)
>  
> +#define XUSB_PADCTL_USB2_OTG_PADX_CTL3(x)	(0x94 + (x) * 0x40)
> +#define  REC_OS(x)				(((x) & 0xf) << 9)
> +#define  SQ_OS(x)				(((x) & 0xff) << 14)
> +
>  #define XUSB_PADCTL_USB2_BIAS_PAD_CTL0		0x284
>  #define  BIAS_PAD_PD				BIT(11)
>  #define  HS_SQUELCH_LEVEL(x)			(((x) & 0x7) << 0)
> @@ -255,6 +263,8 @@ struct tegra_xusb_fuse_calibration {
>  	u32 hs_squelch;
>  	u32 *hs_term_range_adj;
>  	u32 rpd_ctrl;
> +	u32 *sq_os;
> +	u32 *rec_os;
>  };
>  
>  struct tegra186_xusb_padctl_context {
> @@ -935,6 +945,15 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
>  	value |= RPD_CTRL(priv->calib.rpd_ctrl);
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>  
> +	if (priv->calib.rec_os && priv->calib.sq_os) {

Can't you use 'has_rec_sq_offsets' check?

> +		value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL3(index));
> +		value &= ~REC_OS(~0);
> +		value |= REC_OS(priv->calib.rec_os[index]);
> +		value &= ~SQ_OS(~0);
> +		value |= SQ_OS(priv->calib.sq_os[index]);
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL3(index));
> +	}

I believe this can be simplified with FIELD_ macros.

- Mani


