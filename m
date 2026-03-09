Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4837395DBD
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054665; cv=none; b=N0nre6cy67kca1yfgA8xCcCamJwXh/tfgTfCkX6/me+MUwbJrj60gjC4MK0Cr2QtsroVyfIOzH6wtgBh5VQ3OEazOWAbriZe3r0wO1p6Pzq3XSKzr3q5RAZe1P15JniJvuFBDkJwraqCsdCkQKQkrOxVmOc2WYLZP1k42XHrkHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054665; c=relaxed/simple;
	bh=jRloghjBa1pGeGfZukYYZ2zI6AVLcOq1y96jm/iQ/U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCQUwITUNZ/DJf2jDYRDKDA13reb7iu48PO7xruOJ984ghHSChZkMyllgX8F4xRMS/OSSOuu/55DHyjywibgeJOwgmHV+6NF4tUFNUMqP2vK1N7rFOF3SyyeoxKTwRsptz8aO6B/xU6G4j2ZGddHIUDOfVBJZnm4Kv8CEYmQwGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JeyvWL9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4KvBN9/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JeyvWL9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4KvBN9/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6299TOHd2284673
	for <linux-tegra@vger.kernel.org>; Mon, 9 Mar 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vcqntBHnJ9jNcmMCrhjcICJ
	WTC4/uHfcjNc+otCaEk=; b=JeyvWL9CvFdqMvYH4Uwf5YXE6DfuYFJRKgNHwPFY
	j4P2q15t+EjR4zrgqEgCtY6mhfSEZVxpWD8Ja4EEbbJDJoOAyAd77b3YHrktAGR8
	sNrWbQJZhKLG1cyMMGplh0w41UKXhpoPf2MeJiOuhVMxrIJl8FxS0tnYn5yh/K3i
	tdp2qiAEg51gDf7PkG3fG37g1BIo+w6nyF3PQFjASzyrU9UmTqeePxxdNJ8YcKQo
	GTlIlhBM6cKjrIZ9Et6Uc7EyRo5Ofl5HTG3DK13vijuu2TQ48ylv3nf2LEd7a8DA
	ca2Whh2J67xeuowrAUHuoD5nRjBWvj1EenFqV0oJlTNgbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crd6fd1ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 11:11:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82988b04c5cso10757585b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054662; x=1773659462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=i4KvBN9/bL4dM718TCiVDn/BTBIEPVu7pa+NLIOsfr94o8cjVyzKZAc9tSJzh8t3ei
         WbepxWQ50/8UF9GAhIRRUsPUX8M4hpV67vDkYHOvSiZOdQfnoDJNaQAtzQsMXXAh2KDe
         Z/IHgQANKfB9+iqR+zyofwP+MAEnjHIlJJ9XNEQS2sWkmzIUl0N4OHiItNcf+ed5NU6L
         s4ialrziWkmI+2H51qayp7mBByBGHImCKHfAaSNXmGrL9cNW/OwGBlnGX4pcdFuoG9yI
         b7hhCY9N7y4ypKSbOcWqZN6LW14Z91oPzOykhOkKlSolgbDhnYq+IBQQv5HzCNTsxXE0
         7ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054662; x=1773659462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vcqntBHnJ9jNcmMCrhjcICJWTC4/uHfcjNc+otCaEk=;
        b=l1S0Fj4ITRn//Rf7Ma0jn3oy9PUDU5i5FKPgh5gtik8HKEeqPuVr1mhW2NoXY+g2zL
         mcIREOpVwCU50VdLehvqUvmUG0dIAxYabDUOn+7n76Owbt2TUoqe6JZ05K59G77f119N
         pyU2DcP1amugsz9Ze2r+P8w5MnVUKW6cFKXe5s+Ne8RBULOSWJva0XONYaIgPcB2xN0n
         KARlOcEaIuhLguqgtNiOVxarn10ihuMtgrHutHQGQGeLVQ7JPh2nZ6zdZYJjqcSrWAu/
         8IFKd2B0mgMFQDaT5y3FVdaid/EhNH1NuAxqQVPkGzvT01C2YIDFx+7+hdVI2NxJP2ma
         SdNA==
X-Forwarded-Encrypted: i=1; AJvYcCWMlsy9ug4Xn4Dxk5nxK6uUkm8JiVxP3X8SirNBzdlxgbcEkTlDcqqeHoENsbuhJxgAzJvdZIX1Z1aCmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLiqOrDPR/Vbgt+Jcg2NmiuYWNS+bgTbWN+wFxfZ0IvFtIz/8M
	vPEkONGTLaOysYn2epcuqRU5JFO69nPEWyBze0oOTHVRkxxLZy/Y5QxraYBFk0cn+P63gxwcSrs
	Qgsi8qbMSC9csz1TklzS7w1b3WvbxYMTBWUGP3+aQspro20XAwCUh/bro41umBxx70g==
X-Gm-Gg: ATEYQzxGmVHG5iqXUCKe1GFDpvTJg3CR4NtIPkv/xr8FpplGFnta7oZBbh+Gio24mc9
	iS/0ZizrM/vZs0z9srllB12BW4RHPjozMYrJGxd/KBUFiLYBAAua1ZC60rWcRw/ggHGqvC3lzhp
	gUtz91jJzufPm3BrdrBkFrau4mIy1xFXTxDBmjzT8zfTE86IhMqsj+ltZmOsFO+OXW9pSyJSbpx
	gOmzmqmZ/JPP0ogTR0S5Q0qni8NUdJDz2MSXdi/A0invL+GkjTJPYGpPvGf70FZl49civdBR2Ft
	b3IVkh2fn+Y81WQcedLvk/M5S2whb3Sz6OBG3l/QPkoWtvzNXh7f88zmQxk673P9bsvzzkVEMoZ
	butqkcgIblkoDeGuJkGj5UCcMzsDtE5TpBOI=
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988611b3a.20.1773054662329;
        Mon, 09 Mar 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:2309:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829a2d85103mr8988581b3a.20.1773054661861;
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48676besm9478833b3a.40.2026.03.09.04.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:11:01 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:40:51 +0530
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
Subject: Re: [PATCH net-next v2 5/7] net: stmmac: use u8 for host_dma_width
 and similar struct members
Message-ID: <aa6qu7oWLeB0Dpeu@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5P-0000000CVsK-0iwX@rmk-PC.armlinux.org.uk>
X-Proofpoint-ORIG-GUID: 2Kmnro6VFvuDw69GmqfYXSIgXlgYUVxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX+bDGLxdaBCgw
 P1ef0gLwxhYG3qpxkd8HSXQO6o8UeVC7GnHRhn0s/zgtu74w+WOZO/nC9ClP4+92PswZZ/hEyjx
 wSHiwCniCHrqT+XBuATv81A0HsWSMFe3NGgdpIXs0I28THE0GQFRYH0mgsM6DjhbXdKweRl089M
 yG2TvBmLEWAnPy9XebxEsNVfQE5fU/Yk34Y3G7VXOiEEEnlVfvq/3qIMYhnSfabq8DZiHbJBt+4
 2UYD4pSQRGF7XTG08e5+m+juhNe2kgxFWr7ixxV0fxekFcZ8cGdBqV4J+0ZAus4xFiFjjQ8P0Rs
 Xn7m9N9lKpGX3FbjmuY/UAa4JsCwRhv1lOOsbOot97Q4JtNop/ylUUmz26iXrMngzLTDa+wvjIk
 gz5Nb+Iw0DUEcP3L2csKPG10LZOGiEZsMpSIjmBgftS3Ej9NIQaL1FUHi072UQdyqAEgKWBMn7R
 edtpaIjq0rh4dZayFeg==
X-Proofpoint-GUID: 2Kmnro6VFvuDw69GmqfYXSIgXlgYUVxF
X-Authority-Analysis: v=2.4 cv=RP++3oi+ c=1 sm=1 tr=0 ts=69aeaac7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=nXI6kmJP-DpmoF2jiF4A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102

On Mon, Mar 09, 2026 at 09:39:39AM +0000, Russell King (Oracle) wrote:
> We aren't going to see >= 256-bit address busses soon, so reduce
> host_dma_width and associated other struct members that initialise
> this from u32 to u8.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  include/linux/stmmac.h                                  | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Acked-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com> # qcom-ethqos
