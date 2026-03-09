Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99444396B73
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054505; cv=none; b=mu8fwAEW4x0BBR8KZ4re0OCUCsVSH22KK4eUhzejOzh0gnOi0Pj/rNxgMtL6raH55w3egY1+xeFYzEQem8b6pptmeH5Ua/+DUACU5FP7WncDLe3Uj6odJxY+QCrHDn4Qah0Qu2BXXvR3Bq5ybt6vIo3Khn2U5tLWJuAW4M2AaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054505; c=relaxed/simple;
	bh=haZYw/rVRG4cTY6XlUED1nGXUhf7pYB6b6bzXHZlX40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1p1sEs6W+igGsWLp8r2mBqv0UvHA8tVhxfKWbBbeZ2TiEE6Wh7fvTbFFSF1Z+icpVmsEFJ85CpNBlnIuVpn6oeL7UWxuvzKbzYpp6GLtWp3OymJqFcOcEasXwro4wyhlUu+OqjMZFZJBmSGkO2y+gEUEZJ69QEADrNiPKjLe5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ub24Gv1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/IEdR+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ub24Gv1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/IEdR+b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297mTmM2798716
	for <linux-tegra@vger.kernel.org>; Mon, 9 Mar 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+vqi5yNfETZAao574uaaCl9
	A1rW1wYUCbmkQ0a4C8Y=; b=Ub24Gv1Jn9nX9rjaOFOGcGwcZdVmHjStc0FyiSku
	Du3qSxRdTTmlVzYgQU52dkfNzEOykV6TdXX3XU2RMK5PpxOOuVmJnJtQTSSU3aQh
	YZzE5Y5YAOPSZz7lIVDB6OrQqEoNTkG7ubqqPSc695WGs8YU5Pf2motMQ+QZiTG7
	D1KjojNEENM+PhejSi1HkESscTsw9XJIGLBnUwRAt8QC8HearsmjoHY4RF7rJFkr
	J0HybVZePW1OirXbbHCjmvNavFwA67/oKKp+MPInfHMVdnJSDAqGCBVsPFAMRvGG
	933MqxunRvncA0CWlIIQtWPjnVk1jtIPVkCIg6XS4I3Ygg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qewet3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 11:08:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b8bb5211so6291039b3a.2
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054503; x=1773659303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=i/IEdR+bcJoT4s1jMvcducB1mjixJC0TpvNWdGyRYiktxJLfrf4kRAkqWtEweAJIWq
         9fGYoNwMFcmJuiwo4mDDVUl5RDVU7EZWx49EmUutOBksKIhBg0adBpVLDnQTpIfteqX+
         vJoGDt+mnQuOV3/q89PXuyt8WLWKud08IOSarX+GNdu9qq4DLXVs2D9N1dcxBdA4MZAp
         vPvl10hDOGhyj9UNxqPsqQsb8gW+3xnoFeFoLg/k348d6kS9eQeitndVvAEDieFFbO1j
         8NhMHoVcXEQ/S6ROTcHrctKIpUI0R094TqxpkpZDIaPjZAbiFBV5tQx1XMy24NnYbmgd
         9Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054503; x=1773659303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+vqi5yNfETZAao574uaaCl9A1rW1wYUCbmkQ0a4C8Y=;
        b=ZLFbqlu6NXwTdOWiegwiRqVH6fzto19lYkvWR3hmwqB3baKceou8MDHiNoYy1+znpv
         aGSmLrvLh1w985QPfDhx7cwTpMwcUzZXx5MKR2wcOcZdgM10dHOZo+qc0Gj9EFbRMGI4
         NLaoQiyrkrIuMgpR+hbm3ISTot0FqX0ct0iBkv3/nHqTvyIZYqVnVGcBV+fZF0dORkoZ
         x0uX1nhxPCtEGmz+KX7m4kJEFzGZvoaBqq2YfhtSVC3Giae0QtQGiH0MUbPT8rl1Kshp
         XfbXISrAtNPLr8x6ztMcIdx8ZRkEi3a5rIze//Mq3+JRpXqBhx6ln3bZXacpA1mYlqTg
         bZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsDCXkWPFHLitFjMqXjFNe02U88LUK/EwaDVL7zcFpIjcQ9X0NexFKQI/OYqybKOVd2h9Reed0wjdnKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlOAdsDcH0aZYHNdCDNC0TC9/pX3YlcOKRk7OAHxJbSznvGVO
	/tw3s83sTLGpz/3ozfpuyFTGS71ySRcdYAXK791xYKGnmTVCNKKQJtMab1PS35F4YqM8r0YNXx7
	Pcd9Wq/schmPUWOvf/1iW8bqYVMEgTh0hKX1a6tO5brHSzMSzLMWUriizyDhmmjPCFg==
X-Gm-Gg: ATEYQzwiSMyo4XprQs4tr1WPdSz9IP1IFjV5lW4sQUysxDHVYPgKl4jM/OciZtT+xYq
	8vTdvDiJWeff16A6XKXEUEPL45YuW6ivsqrn7SuBLXfy8Tfbhrkx4slRd89spU+ORcj5be4Eshb
	eHM4Yrk/me7QdMVwpt3GEMPIPgieEmKyeQIpekWUEHrbGlyKOgKR0npiO1bYk0cLvQRW/5/tm+K
	GvbqQuDk3YCedrGzpOmL5gA/U6X+PBtoJyyyhx9LGURTNib8drQZNCQ7BjVBGS4D23LNHwc0dqV
	RwL/HbcskGwoWxyAjH5kXpD4HdMv+0eadj7AjolCYn+Lu62Dc5lJ+sJM1d7bTWbxxon5pDR5fvN
	FuE6bM/CUxt7w1Mi7c2IB+6fZTs2Ltz9Rgks=
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232869b3a.34.1773054503049;
        Mon, 09 Mar 2026 04:08:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:249b:b0:824:4a22:ec16 with SMTP id d2e1a72fcca58-829a2f142fbmr7232839b3a.34.1773054502566;
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48dfc17sm11868886b3a.64.2026.03.09.04.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:12 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 1/7] net: stmmac: provide plat_dat->dma_cfg
 in stmmac_plat_dat_alloc()
Message-ID: <aa6qHFVdQ8pvDb+d@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX54-0000000CVrw-2jfu@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: twWaqhTC2UjIcJbZ_yYCov0TpH2APtEU
X-Proofpoint-GUID: twWaqhTC2UjIcJbZ_yYCov0TpH2APtEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX2GFLydHkgJB0
 exiyTdLcUc89DTSGXkld9H/pmoBWbWZ+zd155AxmqrdcmrKuzsWIfqyihYSUufdvVSsREhxTdZt
 /nH/gnCJ/S2pH1VUYXkMV2pckzCYTT623/WQ07+rz6W4DGhk3sGS1k2fwQC5o2XWdTO28Gdmwl4
 CF6ri1dGAevL6IdB5UL7M0Wa5Hhg7jh5JUEIs3b9nLNUmZLkghu//lkDTKLsw/FpOjuMb1Ud4eJ
 xaM5Hgfyl+cklD1QHuCONWhsItg2slSIKAmpJudLaw6o6EyfXO2diYMyge4r9IcAcoJfmVJsTy+
 uXB4OCWR5x9Z3qiulTXYAW+gjBymJnS0tyYbxd2324RDgFGyY434ClNrcb5dKvVclc4Uz6cNu7G
 lhDMLJZ9Oz2Q5W7jiiIcUX0t2ijAcy0Pp70vNOdceJzrUx0+WR6rwamOkXJ9Lydylwx+b4eG7c7
 fQMqu9Nc2QvNva+xl6Q==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aeaa27 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=EL_Z8gHO3nUhwFgt7b4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102

On Mon, Mar 09, 2026 at 09:39:18AM +0000, Russell King (Oracle) wrote:
> plat_dat->dma_cfg is unconditionally required for the operation of the
> driver, so it would make sense to allocate it along with the plat_dat.
> 
> On Arm64, sizeof(*plat_dat) has recently shrunk from 880 to 816 bytes
> and sizeof(*plat_dat->dma_cfg) has shrunk from 32 to 20 bytes.
> 
> Given that dma_cfg is required, and it is now less than a cache line,
> It doesn't make sense to allocate this separateny, so place it at the
> end of struct plat_stmmacenet_data, and set plat_dat->dma_cfg to point
> at that to avoid mass changes.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
