Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C94395D8A
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054418; cv=none; b=F5L29RmKc112/2IAHzSt1TxY7fw3s/KE26gl03XBiQEEwk6UUfoARiwmVo5yAtFx4dzxqStRK/l/IYnqen4z2u/vgAVNZu/rqTCxbdh7Vb7UwZ3h5Z/DPVf26uENikjdturTj+UWAafFH0uG4CjG0x/fW841kzZ4Md4hIjA2Cj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054418; c=relaxed/simple;
	bh=7jFrjfVpNEF7+5pofyTW+BP7utiTtPBz1JY9cb1Gn74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvUPXkVX4K8tl7OA4/3O01T3ai29Pp6AZVcmQaKlxmFFK6A+GBfD2UwU3u+C9ghGW3Mk07wKJbBtFAoBDImlZOH3LimU9bcb/XH0Y1/KIVkLcsh/iRndyyyZA9Rg2lIMyYrYGt4d0uLIrukISjaNBJr8i5ZS3Y6l68vBJ06KwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cT5pkRzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSeTBr5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cT5pkRzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSeTBr5e"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298IMfo2662872
	for <linux-tegra@vger.kernel.org>; Mon, 9 Mar 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TrEOcA+LHeeXNlAZJAw+XIej
	7hfOvjSZS4fXCV/6ZP8=; b=cT5pkRzXP6qVFsUdkwZYKvpu2QDIkKWB/m+APQg3
	xlQJXyfUDxe5z5j/J9YHHaQyCPT1iK2NE/VExyzQbVIPzEXUZl+ZXZxrAH/SZhyi
	tKDLTr3m9k69Gy909AFRL0cI6KdJD7DFNOmt3wC463C8wLM48cDSrkLOLtV5Ix/o
	EDSTiDTPnhe+j3+TlBGosUM8+4DtPOw1rEaWNMn42G008p9ZCTZJMzyltrDd9F4Z
	O85hGkC/n+PYGdq5mEMfYii5Gpg1wSToemHQAr1t3Jy3ucXGiNbcLnHmcYvBMfaf
	Gujxy+JLvzq0bucFV/9+WtoERcTQlj3aLeDFfn45uRcXQA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpndb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 11:06:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35984ef203bso8113061a91.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054415; x=1773659215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=FSeTBr5ept85WxlDxOhu1F2+OSu4YmlaDD9bdIBjQPKHyL7sAd4Pm1KtOtBJGkYFgH
         vE5fA/MYTaF8X1e1o/5GTRsfYSIdCO7A0UfOMBQ70/DXFwpPo6SgXGKhnd0ru53ZW47I
         YMyMgNIycwfPlw1mR48soKXvSSLo6q9y9iaDjX4o5JKCZSkIpdKCjN0T2ozV33a8oyVB
         xH8QYudpgX0AwkanoXCEYlyI/X6Uu0GTUIW9pJkUaj6ij7ssXJ6ZjCXiae7CelMjsdTm
         +r9moat5F4nQWgw61W+wRbBZ5FwqALXWctcjUr/CHszQnvY8frFucoZST64EAUFrMin3
         UVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054415; x=1773659215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrEOcA+LHeeXNlAZJAw+XIej7hfOvjSZS4fXCV/6ZP8=;
        b=Yfavt2+swWvTak3DFZWEzft6OEOJ0yRv1uqYAYeRVb0YPCTQMY6Av3ZO7ovX4BGaE7
         3JrqqgL030/TcAkynnU27IXPwi4XTtks1FWkbFpmRWfQveNNvSt9MvvrkAYbWjR7GT/r
         9A482gBkxNLPUN7v0Ffl21GtEkv5iohUtw5d1r+BQJdDP7JrI3d0XX1IUg+bRx9MSa0e
         PlrB8D3YpGp+5Ttsl4D6ho+36iGD6RDELXd2y2wUquKf/0BB1RME5vufzEKsxxyH1+ZH
         ziS91bT7k7dmzO09INeb3doLsKXWK2a1Sv8UsDut4EkMcSQ81b6f4BqA5FIaUbxWZWaG
         SlcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaSl9I5dkGA/mmruQC4hlb+R8dTIzMzWEkNiZQkuFxBZealPOKcT88UoLhMElXeeHjKGGSEnwtYicWtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzThJad/71+6k0bZmVrLwBYwfR2GOUsIF5V6E3Zp2TEajXMDcHo
	k2lr/TRXUgSS/Q4mCJAJHr4PFIxCjWFjnlLeT4xc9Mr3qEwj4cauc8TpVyMjzn20eDfBfjQG5r7
	HJQ391nah69ilatuEaGTgGJ9n72+Z3Z54PBgRaaVoyojXlV3dlSEzRbPS/BJ1kyiulQ==
X-Gm-Gg: ATEYQzwUR3rNBfrKRJ7dUlhFU5zoz/nNlfemZGOt8XHYg08VVJZe7YFN0IwfAkqhPBz
	eM4dMZrN3/JoHqpQe4Rj8A8DS30uFyx9nmsaiVqKIuZ7KRhWwe12ZYw00gb50Sxzgp3jhU4LDZt
	fzqv4qWZFWEc4zmwoMPWm9pCSOzt6cGDf1CrAmpxSyBJY3k9jzlt+9v4bqflDMQwOChNSoWz/Zn
	QL8ZFKkLQLPMWQqynHVQ6ZOS4CRjZifGxJNCKvgSMiUyjD6FLHdUvOWu4rF0f3yt4n0dwyMo7E3
	n7XpTSeKO4ZfkG+/Zlt2KgrL5K5x4BDnWO/i8sZKDQGTF+u9qzFHS2RUobcXuHhid+tFMGHHx8x
	wZGYlKXUb7pxwRLhHUUL9TKGGxoPyLjs8e2k=
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443414a91.34.1773054415393;
        Mon, 09 Mar 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:34c:fe57:278c with SMTP id 98e67ed59e1d1-359be353f40mr9443395a91.34.1773054414906;
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcc2d096sm4067057a91.14.2026.03.09.04.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:06:54 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:36:44 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6pxGDvslU9ygra@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfXwDrcxEJq9GJw
 pe5OmCKRd++CM0JQO9QqThF7YW/ILlDs1HHIMvtF0oniVjvb+LmQn54VLDGEu4NP0Cl2YJxm3/Z
 Zhubmzmh/zxR3TkuOsYEBQSCFnACe4H090Wp5kG+IN4dej7vah5ZxW1XeIOM/EAYntUQzzIC6di
 WroVp+xJ2ZCGDzMwkx5U5fI5653btzwKLwoUrMMDOMc/rP42EK3n/yu2T8SwZwy59T3k58F40Ol
 uHmnRAzF38irVYzDeTzNS5pYaJJ/yffkWmrHuagopKkNC2gOBj8HmEpor0ak95SFEj9ld9AoJw0
 PRUZCJr326ZaK3fGnrkjilRHVdu+Gykw7HXM7ofu97JLNiONOm8gH2lHAkxVAptja2iFRIWQh4S
 aNADAcVA/0aQQA4QTsy2aEIvhLKLjPGM0uhJ5bX3BG5YXKFzQOVt++oee0hZq/8+Jd4K6TX3mXd
 y4tgtB4Q2TJSWXE0ibQ==
X-Proofpoint-ORIG-GUID: F2pxx91y1eRXE5v2X7SqHmY6Okfmfo-X
X-Proofpoint-GUID: F2pxx91y1eRXE5v2X7SqHmY6Okfmfo-X
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69aea9d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=J-7NsHqoITSIJWJjikQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102

Hi Russell,
On Mon, Mar 09, 2026 at 09:38:26AM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> Start shrinking stmmac's memory usage by avoiding using "int" for
> members that are only used for 0/1 (boolean) values, or values that
> can't be larger than 255.
> 
> In addition, as struct stmmac_dma_cfg is approximately a cache line,
> shrinks below a cache line as a result of this patch set, and is
> required, there is no point separately allocating this from
> struct plat_stmmacenet_data. Embed it into the end of this struct
> and set the existing pointer to avoid large wide-spread changes.
> 
> Lastly, add documentation for struct stmmac_dma_cfg, and document
> the stmmac clocks as best we can given the driver history.
> 
> v2:
> - fix error in commit message for patch 5
> - fix typo in comment in patch 6
> 

No issues found with v1 on QCS9100 Ride R3, so feel free to add:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan
