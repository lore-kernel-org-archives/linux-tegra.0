Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCE34846A
	for <linux-tegra@vger.kernel.org>; Fri,  3 Jul 2026 23:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783120367; cv=none; b=O6Y4p5oAI4b59JQF3JPMGSDvsZ32BG/ooIPnGi5gFPlwShi5250dsWZ2CryAjXmzaj+xR3w/b17AG0sW735SScgE3ATKNUEi/kzJP+WZW7x/lv5odb3ULzd/4Jl8HIuzgSwV9SsFoKzaoxUM9wfzgiBZTDAV87xtyTQdfaNUnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783120367; c=relaxed/simple;
	bh=u4LQYJOWirbCrWOLISyUVhSJn5uCp/8k1nYDfOpOI0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NntSNrebPFWc9Z3xeMxjiecWd6YRlcQmCvC/lBcLNz4ojreUa8uluyAHP8Jjr+rV9zuZJJ88GT8a5QrBew8Z/n1mkZKJlsMxPY1tC0EcMA5xARxn2knEWnvXuxJRaw/SHnJfdUX+Zr9FqmvRlwNfMk5A1IhxB5m0VZrUT4de7Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwuefZpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L82nn+v5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwuefZpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L82nn+v5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPZTb871850
	for <linux-tegra@vger.kernel.org>; Fri, 3 Jul 2026 23:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ptvjiVFY55mHuzyR7IOPZN3q
	jRdO4GwgfZdidGQ+xdk=; b=MwuefZpSFTvuNgJyrkHy6OEbxdQIh4zwoxkeV0v1
	SeNT+DdlpzYtM/NzLKO5cRhFyyJnebuIF5IKibnQH9YpiTNtspV6uDvHww+LUUZw
	Z26z8Ghqy1Bdy97MgjMlCybQAcNvxhH7AanAObFO0nN5IPodyrTpWh3DwjILH5JS
	lGZlFabkn+OlzqLPqxZPmZYtMum9AdRVSTRs/wP4GOzKS3Aj0HWCmra/f6MkDSMw
	qYaBJCD0DDY6/4P6Rd9xzPP5E3hUq7S5beve23YXYe29Mo8LO5BMBx2bJeVN/Pjr
	eFrVkDRH+FB3sjLbh5P/z/JAV4UUnzJ+/KZJdzBA5COZEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n486a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 23:12:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso20865486d6.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Jul 2026 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120363; x=1783725163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=L82nn+v5OgZ8kdhpgP6U9sUfutbeAxdFs6Rsk8+2d1gNIQBRrsSe36u7E5F+Md9pN3
         Tgw1jU/YfrruDI4Kk1eyFmovNwMkV/YbtOAU4weS3G/BkVTJ4sY1pPQH64EpzJ40kG1U
         7WllAp2wGqKWZgAShQq9tMk5yYfDxZBJLC8QJCy/XFBsfZppsA8zX7GMK3kQKEC3u8uN
         5KV9ZN9BztN9NJicXhWO2wZqIflc88RPcl/DE33qB8c5uLy0Ab3sfLRXWMraUCw9Olqe
         5mOGotL3uWGomp0Xd0Mb70sSANoSu62bprVWwUw0K++g8S6MYTqWs+YJ9nST69xKUUCU
         5b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120363; x=1783725163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=TRm2a9odmEDkQgaOKz7TiRdLJAml4nPLAEH+LcXS49TJbnNjskx6CVQdpSNIfxP4de
         Wk8bhuqLoQHLCGhU0DVV7L6dB552UkdyABbiXzhDd1Q5ySY2Gb1yd+wbVJDe8PDltRfy
         Q1CayiSa+j3ezzD1Yrh2X6vp8Ko1fKdvUvTX4QQ7XCWGteRWYQBy/bhpK4JC2rZpAMP9
         IYJlxrWO/4qQdS57UFbb2GEe/vsKWX+kTgqsgffk41ydCsoJTFy8mCzkWeG8kz+CT3Yc
         9WhRiyD2RXkpyfSAlNyS3svQM2m6gB0yGjD4FlP7XJe84FkNMfnshm6w9+BtqAafp6Gs
         VOWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqSoRs09me45qTyTFxvXzY8L+DrN519veo6zsk00pQvVyhnLA+6i4gLpOmOW1Id1l4HRfCNpo4Y/v39w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxra8HdHcgOpCCfaP8qV9RpY/GNQ978NkNDsQyigXdLnPlXoT/H
	YqduojkTR37E1qmOWDOGedyguZJnTkq3vyfFyMVJDb4rqqKdc5KuhNFQ8rNEN+AkN91HbjMjVxN
	WWi0zmHJDQLJdV1S4ADleDKXODXdZodnlZaW+p9oumjlO89w87087mjzY1ipz/U0DgQ==
X-Gm-Gg: AfdE7cljgYbzY/Lhrz5263ltvFb+X9b5k83JEXCxnYsyPwIRMt3zM/C9ThuNDVMUHI6
	kMhu+CWa9q+/olEBZgruDAwaI8upZmtc+E38PiVersTw5RCtyxfsPSKnkHQO1kh7pBX+DT5F13T
	wHLL1nKVvUWn1KSo1AUb8UaIQfz03e5NtjGxVLZirWKBQNM3lzktHNZzzotd30EwEdIoIMqDvct
	j8n6MDR+7RvEcTmaIEQuShcnRrB03SuJ3ceI5cf8WvQQPYgkIXdtc2szmOwOv2jNBw8kqPXU/YX
	nT5Knvj7BarDjZ0CjYgo7L7D9VgMgQYWgFrriJGgdfkTSlP5SVujpLfCkgmIpUORornnHwSWhwc
	oWF3Jj+WnTykvlSbrWhKCDs9+HtGIDeop/3BjBzYNMAHuWG/417I26T1R16/r+uMbY7628pQLHb
	MmS5kNJnl4G9eK6ZlkHSouCq8P
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20755316d6.38.1783120363139;
        Fri, 03 Jul 2026 16:12:43 -0700 (PDT)
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20754586d6.38.1783120362600;
        Fri, 03 Jul 2026 16:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm815528e87.71.2026.07.03.16.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:12:40 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
Message-ID: <6ejxrh43bkhryudrxk3lkzf2knlgv3mxtfgzhrzujw7km4n5bq@4bd2ahopzs4j>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfX6BNPJPQUylU/
 J2ecm0IFvsudCnBpRCNNQLBCsGk6euNXZ3HNssAxmV1Z70zo4FLJ/skDo2cB53j1KhbviQvn1V6
 Db3VaJjvkDEhQDKSf4hIrKRfrQOlWGE=
X-Proofpoint-ORIG-GUID: fD6BHtFQjwUERxklrPQxiJItWyi2e903
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4841eb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Dn8qeLIeI0d_esIdenwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: fD6BHtFQjwUERxklrPQxiJItWyi2e903
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNCBTYWx0ZWRfXwENKKOqaT4Io
 Gg1sLGAnu5Az+0cpwH4NhAPv+ondmT6rCGJqQFCMv3gaLwvj3dJL+Q9nFfLncxFgxhFmxPpcW+6
 2/0phrKP9WSuJOobTmtE50lYX+Trq/6EFykCrV0siUaZ2wh8GvbRZEy0gS75arRDO2Pc6e1vt2z
 y3qihUDRq7gOkR7O3zKbeRDYEzvkLgMeWDDRpWaz0JWNp0VHd3YpsBX4Hcb6aauTfsRjTLauWU0
 w296fWr9jzYtobx3I53PnPWBJFlZuyPrQHbYs+ucEHgE69Mh4tuUGZEWhSWOPbKg6fuoiDi08uv
 g0WnGyFYur1g992O1aQecCALiEGDox0cjBDeVjdcXLY5aVnCzZD/dAC75HhYn/Lk4cFeAzxfTF+
 f3yixOKVs6e0YMV3GHCzsWwZZJZu/ESypq7iZZ+o1vaAZ0CXR3gl9j6FObRCr03wmVm/DStmwNQ
 UuI52YLeNOUCGZblFEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030234

On Sat, Jul 04, 2026 at 01:08:16AM +0530, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
