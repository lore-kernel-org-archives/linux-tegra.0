Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463586;
	b=c4ucxBs35Z1Bzf1pJztnlvU/BNGNxqS0Bq1fQtnCEBWfB3/qSPHXLma9sVfAhk5HY2NT
	 kWbaIIZmZDg0Bd/lvaRCUiv9AtT6BHY+HEXo0xnqPRNFQ2LSSPGKSoMs6cPeZBY1TvTRl
	 +v2DTCFfPE7n1YmzKi5UN7oV9ex3TtxxjGFjauqwK8vlOTU3AdcN5EkF0QfRtHax3YDuG
	 zsllypi9wNPY8fTXvDyY+AYsSHO1hEB70CP9PBgM5B/q/Z5hxgP2VZLZaTpQL3AqStlYr
	 i8HegozC7+KpXpZff6GMqeuUVNEUTA6vaalYXIlBRQ8v9J78Ftc4YjMQ/FzIyE1gfig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
	b=UagCBl1OkT6WC9LVbVTngUwNhf8TtLnogfIaJIY9J8yrN1i9+/zdCwHhPiBZYHx3HLS2
	 XJTkJjuC98D0zl3Dquv3cAUjX7mjAm+V63q3QcoTJ+XXUafLRQXzpa4JfBWfcGZbdQLYh
	 pq7ieUS7rqqIbpmm4e5znFCwSvCxUxT9nuglRAaFGarFo6y03ntryWLENVhyOHOVIeepI
	 dFRNO+C7vMMsn8K1kkn9ZyzU7bUadrpP+0+xF6oMWX9/QvgZ0e9SaT6IIPuaXYCu8CkU1
	 qTrC8G4CnBFjVI1QCmlhs1ufwJACvWvIdtBb/yn4rsCShPo4zMSU4JXEEsehNxvO28g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNT7zDKW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D684606A31D
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 16:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D684606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mym7SJzv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MNT7zDKW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VCxwUr1629997
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 16:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zvoaKP+xUkSGJRscR5IFcdre
	CABepZREPTFbnRV1kJ0=; b=Mym7SJzvPJhBrW8cTjXDr3bK0JGoqkt9BOS67c9H
	AZsqbfCMihN1+Nnb64lqybfcq1t6P3fuqhRNPe4cbhfvNEsAwr+aXeQz7KIiVmOZ
	y6hpGPvDX/0Tm6yC8PcRy37IPLDwoGiLsX/G4SlKxq7/kkk6Ac6MSmXubqc3gwLE
	rVFQ3IeE1FRc3g6As8OjO0KUeklXIsmdvXMj8p12gJosHwJMgVb9r9YHH429jBqQ
	kQrIUFT+6LBDdr/FdpxCEWjLCfqiYFCBXo0lhlwQ6OnNsViWUejIKg1eac7xszF6
	8OcJsSUAO+yAIIg01Iw/gZopm0LimI9h4jcFJYlYQpYKpA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93ehdqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 16:19:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so423108385a.2
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463584; x=1794068384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=MNT7zDKWVIBMg3LVpF7ZxXSIQsOSnJXNcMS+WBv25npD6WIyY4VXpWoYIECmhj6bg4
         TzTSVZGDFhky26H4mtQU7SBkDmzh4B72cCIaEd8AQMvXCNxYcoT13+WP0gxxvtsa+zya
         U5jJNNP4aFVfOKRzzhyKNnvX0vX0QfOBdhBI1N24OBGXf4gBc50K1DbaDdt0aZOt5n5K
         Vn2kwCo9MWRYOYHhWYF151j/yNpM75A1liIAMMXdnwO/DQZDmfpu90w4GLSx3hXPOxq5
         DwKOXjSzvRvkYSCY5Fh4qdj3kaeyD0H2sVaJc4cAst2Y17flSN9h/YHvSdYumKnDYHxB
         xrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463584; x=1794068384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvoaKP+xUkSGJRscR5IFcdreCABepZREPTFbnRV1kJ0=;
        b=c7RNuxREzuQIp8q9lHbgBw66ts5GXQVStxg6JKzSz0VeVaM/8MyfAgumzgTvDKXclU
         08vb2n4T2M9W6exZiEK2EAdkRFqEvwpq4X0qHH0ikbDMOAHeRgbupi2vcbGjdc5loitW
         lPdWqdak6PpwgkDwByMPeLyJJ29K6DXd4MfXq8fMrnCXMwCnidZseVYdE58Joc9Dhe3x
         fCYWYPzMUqIkdJVLIpH7nOARpMzLpdFVpV0aJMFoLU6w5cVHfTWy6LbGoze2xyeB+lVc
         p2+14mFDmGCCqf7HkU2gVprPBeNCkuvldb0SUl+vgrpBT3zihtJ1F22xXrcko0xIqMAk
         DpBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEH1lzfOgPpQPsGE6lTmrR2zdJgpA2FmUxK2SPS/y+Y2MayDSRuKqHm7OCHTDTzl6nSgWnQUOP5ZLCXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4RaUaAc+ACOPez+kz2EQ62IQ8BzZBuVOOzR67oekl8pK1ABwj
	tzyzeVU8SBSmBbhNty3aKRehowNlA/2vf+U6hv09pc5cst1qKF0KDmAYK2EJBEkDBF3OXWTQTl/
	O/K0OPNBZBg1TQGHAN7mwTwtO1PiqxN0kPx/KWWLdhvLsCFrR2TNQCM08mEiwv4yTMg==
X-Gm-Gg: AYBFou0oYpP8+vCIUy630MmRuoFukqPydOpe58Vy86HdgHmMhLrOOnHlUjp8VOB+oeP
	SK0Qw5HlLq9c39Myvzd6YDPbHKu/2sL4b81yDCZ0tt35wYqPesmow36HgA7hihpjMq6KFFq4223
	dfRCsS0TM/QgcH8rkwsHzkpIOdDmkVb/vPLCDNQkKc3cByD/zG4QL8zPbqjTHqYddZ54Ue+RQid
	BSs+oLn5wjyPa/25hzgw0Jv95jFQVwaEWKcVBL+NMkZ2wi3x59yslZu5kgnePFYlNdRUmcz406u
	ucbvZBxnQ6ET84RYmXkYUzFWy5savYcFK0pawJo/H/+A1Qq7plNUf4dmL284Sv0HmrvdsMVCi/I
	gIGCNive/IZQFmwNhDqqwuSlS7RFiq5BQIEG9Skn6QAMD/yzY7Bm8AMNsiEYR10p4CMKoAIKn2y
	VJRgCJXUfsjlDuyhUS1DC2kgHuNDpqJubijpWjh16n1rYOXn5UP+awlkJBmG9poQ==
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979232685a.60.1793463584167;
        Sat, 31 Oct 2026 09:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93e:5e2c:8c12 with SMTP id af79cd13be357-944216f3483mr979220585a.60.1793463583497;
        Sat, 31 Oct 2026 09:19:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbee0094sm12126731fa.20.2026.10.31.09.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:19:42 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:19:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 15/35] drm/bridge: anx6345: set the panel orientation on
 the connector
Message-ID: <45e2lt2ngv3ozvpapexui5gicabcvhsxfhrwwq3pdakmdiyxnf@mag7bgkjplav>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-15-5e3070a3478f@oss.qualcomm.com>
 <179344372467.9825.11469688608855257522.b4-review@b4>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179344372467.9825.11469688608855257522.b4-review@b4>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NSBTYWx0ZWRfXwQWkSL5glZpN
 Ppl7/GTY6CWZfXOqxacLtkNGaQF2Iob4ATpFSSknbPgnRwJqHUVWBv0FnrG3L8Cvh1+SZROz2C2
 zAFc/MRHFuhYhE1UoHtuJ8ty6lA9ChdDoOiSrtq2+jDem/XbSDlT+QSAf8Zda2vImagG0jjBQi8
 sYlq96GmjKQoKUnn5/fdnSZOkY9Xb48erNGeXaFbF1hg2xn7t3gS5luqOZRDtVP+mVwRiMsVxqD
 7ASOQyyJXe5BeiL+xKcZnsPKMLHsfsExOEbRXFvpiyXa1J2gsgzdwN2rw22T9Knt4UnJYZFNEBg
 j3IGa+Z/gtKa5nEvGXekksTWCffFn5Sz96GtuauoIeSCdm4ZCT4tp1XeBq9c6D9u5wLu4KCOd1a
 R9gT3a8Ey2kGXWlkRWhri7BomUgJdWNpm9u5uoA8xkqFUlnyjtu+ZL/aeMD5UfxX7IpRuS3n476
 +/5rb9aQTAM9X2yMUxQ==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae61521 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1b4m9KtQkR1i_e9s8qgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tjU6FzwY86RMi0eVF1QvIfzYa2-XpeLJ
X-Proofpoint-GUID: tjU6FzwY86RMi0eVF1QvIfzYa2-XpeLJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NSBTYWx0ZWRfX3efYTeN4iKSF
 P8CRHFNrDdlUrAvYDc4u+DrSwdIKaWc2sjSIt7Y20IvYvy1SMg8vVRvaLvtar5aS9pcwkVdcAwc
 WU0gKg0Y1eIs2gcUsDFeOmfIhLJG+Gs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310065

On Sat, Oct 31, 2026 at 11:48:44AM +0100, Luca Ceresoli wrote:
> > The panel is used directly, without the panel bridge, so nothing sets
> > its orientation on the connector apart from the workaround in the
> > get_modes() of some panel drivers, which runs too late.
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > index 407834a03b63..91ce1a877bf8 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> > @@ -525,6 +525,11 @@ static int anx6345_bridge_attach(struct drm_bridge *bridge,
> >
> >  	anx6345->connector.polled = DRM_CONNECTOR_POLL_HPD;
> >
> > +	err = drm_connector_set_orientation_from_panel(&anx6345->connector,
> > +						       anx6345->panel);
> > +	if (err)
> > +		goto connector_cleanup;
> 
> Muy understanding is that this driver, and those in patches 15-21, should
> be eventually converted to use the bridge API instead of the panel API, but
> that's a significant work and so for now this small change is enough to get
> to patch 22 (workaround removal).
> 
> Correct?

Yes. Refactoring the drivers to use bridge API is different, bigger
project, which can be undertaken later (or in parallel).

-- 
With best wishes
Dmitry
