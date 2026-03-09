Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306E4399011
	for <linux-tegra@vger.kernel.org>; Mon,  9 Mar 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055177; cv=none; b=qYKKHtX5f7G47B3f+Qa+eSWeexKuMnVCnWgqjk/2DSTqupTTskSe2Q/0y4aiOcTSZ3n6162tHevQmlIYITkqnY/Y2Wly5mUF0vSQt78tWNeI69mlGF/ivwpYItRz6A1sjJienW2pe1i3xJ0pHtgLQBjGYqlnCc8jKcLj3BIdN20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055177; c=relaxed/simple;
	bh=AejVh39OfouTSd2iF1xalh+o1wTJiUiMTTrorUnm0v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIvoOyu73VszljU8+ylw80ysfVwIKScoJJAhU6zeRAqYWnlMl2usd+HDJe6qqTi6WOZBpIJPhnWH0pgadJX6Ml2vfPP8B207+NxeNwHHO3dzYXVrfQ1/0wgQNNz8DwZPUCeBfssG1hrOc/PLQWc4mBcv8p6qDvkAKQOQ9vDg4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpI6JDD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCwej5Uz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpI6JDD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCwej5Uz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298W9PB3773088
	for <linux-tegra@vger.kernel.org>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
	7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
	iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
	uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
	9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
	7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
	mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8jxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 11:19:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae49120e74so76076175ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 09 Mar 2026 04:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=iCwej5Uzc2W4ofJrtmyHnVECx2FD7lPG6JGRf7wfG0dhkC5dV+Z2Yi5KObS1WaBznz
         TIR0hH1nH86TzI+mtyU6g2MWn25cQDlYrHz5fT0hLcA1e6P3fbPAu0QW9G+D6XE+In9E
         caOr9Zlhv1894g5WJElGyv1rHAKyG06NZrUSIoDgLK9+j4hYpmaZnT3QuKNf7lu9kb/8
         rW8rAD9v9qZ+6ouDQEFLAtinT65oha7X1XIOgMW5Br/rT+G21o3aF1EViUo4Yuu/jF3B
         3wFF0anzf38whn0dWUjsTIWQRv9Bno4xGuZZ2iXUV8TWZTegFWfeJu5y9DcROpV6G5tK
         Fu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055174; x=1773659974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=CD/FPW3JgjUQyfZLkv2A979A84HUk4ZaE8WFf7r0hdqDJNLTVNNq89lnuMBE/c3HhN
         lkFno/8F2K6PTIeke3GVymi+IGqIt5fYmPTnWC/KPL4K4RgGd5McrFGREjBYIiOeRRIp
         A18f7S1YHJ8K46q8qp0KiS/Q29g5Q5IkI70uEtwe2YkFb6zUbE0wljArF2qjNS/GIetS
         Lw97gr32vegtDi/TuyGHFLdslUPW777Sn20PEanEPTWu4KtFLvvKo7DhngTQDNCSkWxM
         dnCFA2R3KPGC+c9BREwF4tYF6ruX6U6IUd9BAy9eLW3kottbolFx+9S5n8ZwCR5GNEYf
         51Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVLcmK+/4K5oDo5ykU2XSNzfzXDFpMJ+2iXAKs7PuSTqx3S75yfzZPo7fU7SM3ec2LKcuf9pHaiq+3Z/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4pnd5sN4o30yoAGC7qxhGhkHUPf471ezIUtteULfncGK8SK/
	/JFQFP1f904JTCKxQaehg2jBBR1AzCRibqfUAB6iFeZh7viVdI+/5+7cEjCogkHG2/sQNpLb2f3
	V+6MkTu2w59zy5+DZ60f6iyAWEIRiTXbYwsmc2A2cbnew/cGClLhFqyXsYdC0Cp1DMg==
X-Gm-Gg: ATEYQzxXVqiMnYZNjgX3WfqSpuTeTP0UbRgCElaP2ClZ14YfdT2FTGRbSQYkUuhLu9r
	se6BZeL3AFQa+ZcqrbrM+lHM7imJ7C1hYFvNwDlVLGMDXc0Q3ReoQZR3ije55ZzPH7F5AmoJHBX
	npSM1c6b5GLEieOSolBB1V49XJefBQvdBAjYcGNh/59umquT2HNjfIQ7cvwWXFCNBBe7JYVXX1R
	i3d44HWSrJMy6kQEXk4/RXeOcRSfIVR6QKPgWiMWE1dR+r07NIOztmV0sxrNy+2sy3cNWgS/1Om
	zMBl7WPzZRtY37xphkbBFWBxGlPnItMFEAvVe3xi+I8367H5kcH/n2j+anAuKh+W8RES/L1UR9Y
	xvDT1t+AwizcXz+2zrdAS4reg6s+3AtLfwyI=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474375ad.41.1773055174154;
        Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696;
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
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
Subject: Re: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use
 and number_?x_queues
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: R72klAf-pGbF7cEvEWtcn8nVQlC7m9Lv
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aeacc7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfX901qC3M/r0Ie
 pF+WDhH8oer6otO8AXeMQK5bEnf9rc3A/53xz8YdSVExJ5i/TJFTmhZ2F+J2TTec1fSqn+e+f/w
 h/T2oiR8DNNFVwaZ32EOuAQETw3cgJynsQSjFrqKNOi3Lt9YiUIn3WClU0mNU2NAfYaM9Cf6Suu
 BZez5cD3D7NuasCDhEg19y0CcHh86bq1bDqWrHjtGA3j8RE+fBhiWb2V3ql6NUYCZe3vtPXyJ2W
 9HKCj0AMgBd0ABF9PWCAdoHlSI1pk787uB8ItgsneRsnug3rWGXax5UaWRdlliT/UpkM3qo6vk1
 VhkCAAg8NG1pIrgwgy9QGBhLO7KXXfWDVZl7SAqbdwJn4D8RzXS3+Pl21mRCS7zA2iGuShaCPIR
 QPue0Sh8BW65ngCdvDqFp2stnCUZWJBnQaMePj/mPSh/aRfJT39d2EUNvYLoX9YSFD77cCRtySg
 RxpWoBKz7eqZQpL2W1w==
X-Proofpoint-ORIG-GUID: R72klAf-pGbF7cEvEWtcn8nVQlC7m9Lv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090104

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan
