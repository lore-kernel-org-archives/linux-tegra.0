Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC135F18D
	for <linux-tegra@vger.kernel.org>; Sun, 26 Apr 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777206274; cv=none; b=IcJA1rGCViEWIVsa/hqqwqq2jfBCEJAseAbXIeM8MKg+mzvYSbcAK0jVavmHQ9xscerGE2ruE7s8ICctq9b2MZGiEGMoaRt6iVF51PQTnbb9rC+W1pzmoqu3znwZmRYJyOpGAU+p0hwNLeBf36rRqSRZgqfwpVR9YCuYeUBW6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777206274; c=relaxed/simple;
	bh=M8+16Tj1x6WZs0f2AbNxWFKqP3GGmOYuJQcsOgQ1kHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9rYIlZ4Cx5OiuWlWtZQ3CJk1Ve/W2WwPEdZnV5YJG9FY67ibBAIMUisM+lc15R7QWILIjw9u7pleRSj1lfwVTGsplaZmBqo7CRcYwcVxsK53pyBqUpjSosyhJAIqkOm2TKDfW/46tvjwxc42c4KdPshdJFrVM3kFCyieh+GW7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBdSkHvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYcNYrws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBdSkHvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYcNYrws"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q9Xoxa066480
	for <linux-tegra@vger.kernel.org>; Sun, 26 Apr 2026 12:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xbAF95i14HhsfSGXuY/tMJx2
	G1OOoMWvPHHUcpNBgbM=; b=UBdSkHvT9cBi2Jo8+qaSxIm3tFuFv4IjHRt4Defp
	J1pcgUKQsRlyAI6J6Y71om7S8eqnhHQVTuFCkx7ptJ7QA27qU7S/VyQUp9UcWtnT
	Y2IgVf4CRsOsO2xc391JW3oeaeZ3NhFzKUZ3gYWSh8cI67CjqLoauKwTlSZzSf18
	2m0BOY5JtPHm6EupG3ecLOWTCkKtN3KB0P/tBimb3QzkU11Zsc3ALX+aPIo4cRcx
	nGQvgRP5s1+nh7TQd8F/p5FV+C+eWZm32aB7u1/uuve1j2Awgs0FBtC1Oh7DGAME
	Tr11On8xNfWYgPnHwc7pgX7y17VyheojbE6BvrM+zyD9QA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnnf2suv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 26 Apr 2026 12:24:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fcdd579e1so62187911cf.1
        for <linux-tegra@vger.kernel.org>; Sun, 26 Apr 2026 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777206270; x=1777811070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbAF95i14HhsfSGXuY/tMJx2G1OOoMWvPHHUcpNBgbM=;
        b=eYcNYrwspCh0fuhbjGM5byEs1FMSjMtVVMNuYl6Wcg2BsOSkHHlBwM5cyPYc2V7zVE
         xuvjfwz7K2evYX8Aw4QioCVE6fRdj83KVFzdZ5IySUYBpzVK+5IiVQk7qKkRz4L4cFni
         igKCAgDHYF39gCIafEL1fA7LxGo3KE2WBTiXlZpOV6KQKdW6KKI2wWW+LTZnfrXt6Lvk
         wjVtM5j5/xspjttWxvASgiF4gewbv5Wk1RfC1lt2lXJ59z9PipKRC+zZNJn7lsU+Vjzj
         dhStSOsTeZQXXlO8bg2hxSzrHr7oABDuZ7QnaCd8jrsPBlktfQwDFjScJ4diE7jR6xBW
         M6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777206270; x=1777811070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbAF95i14HhsfSGXuY/tMJx2G1OOoMWvPHHUcpNBgbM=;
        b=JjmcipvBGodAw6TRCqZIDK4WQGboulDApXnGWOTXFGmMRp7G1I/QzKmOIB7PB0PmDp
         nwIZ0RUJBkZESx7JItQbVoEhgvL/8sksfV6lhpgvT1kdAb0oA7JQjGJ0m4jFkhzddnMm
         gM+Vc7jbpFwF8b9MP16rD6QyLnpe5v75uK/4GBCVSm3ndjpUYFhIHQcQ6CmEmgwls8M8
         iVAMgs5hceSVU+SNbnRlMxRcPsmLaUN3ugVnCZmuzu/1t0dSSJXvdQvt5rHvhj11HCkq
         OMuOk6dchjt8WrIjmZCakyQRRQKpdOghwk4BkDNr3+3Sy8n+IeWjcQzRyM3YZm4WJH7P
         qK5w==
X-Forwarded-Encrypted: i=1; AFNElJ/as0a0q0nFlKTUPiYycY2l1e4DzFHx4usdjJzVNJQyjC/8/rgdZ12Y99TTFWQa9M6esx8Od3Tx7yA/MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfApui6o+h6vkORg7j7RyrXM+74HvoevNbTCQOxO5l/BmY6+Q+
	ma6wfT272fvfOXxrMljfaTCAHX9lqWzfsytr6iIJTVriLCJu+jKjXZe8EBwcasRsNCdDlRPQHzS
	9LawoP/KKiZQNpnG/1QstcxkBQEVkf8TCQL2scK7qq3CyLrhL06lPebKheMx5mcDC4g==
X-Gm-Gg: AeBDieu3xG+Qf5KR95YKN3kjpgVrRkClIRR1R+WgRL5aiOuC5ZORfxISchlSwMxshrF
	Ft168VF5PLrqXgO1uRdlbCoGaD5ah7NZs/0rFYrBP2kIidsCeQLSTENLV8DlcI7kAppf+tpmgLC
	FMTlv8P0q/Gw1iHsFiYRRzMTzooqrPQ8CuL6vOXDrLNdF0daarO1mEkRk+XeyovNGnz2EVA25Uc
	xZxkGnSMzGeQSsDGv1Jye8TWOOt6IPcZ9Q9ZgCzxDzQLxBBk9dwJOC3H+eiYmjfKoLrpoVCA68w
	uFgSx19rSjXd4MQ44Jyx6jJAKCCXyjfg4huI/VHGz18jtluj7u47vZrHasVC5bthf/IOLbFLC0k
	XO29jVKI3WISzPxDU8CHgAy/vL9HmzGqjjbACYxr1ix+vHi9sXcf7Ia2QGZcKU5ojILZ5GgX5eK
	vz87mcXXlkTlzzvrD2TXxl+zfQM1ttpy8Ein6TC241T7VcLA==
X-Received: by 2002:a05:622a:5a05:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50e36c7395emr549145271cf.50.1777206270015;
        Sun, 26 Apr 2026 05:24:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5a05:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50e36c7395emr549144771cf.50.1777206269618;
        Sun, 26 Apr 2026 05:24:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm7396347e87.59.2026.04.26.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 05:24:28 -0700 (PDT)
Date: Sun, 26 Apr 2026 15:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 12/13] media: iris: Add platform data for glymur
Message-ID: <x5kuf3n4z4jn6qxkqshzzwofitz2wsh5ayjlpz24cm5weo4nqg@smtwh755sc3z>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-12-0296bccb9f4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-glymur-v2-12-0296bccb9f4e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3duOH_5OsNSlm9urGqBVhfJlYeO-mLtV
X-Authority-Analysis: v=2.4 cv=Y5rIdBeN c=1 sm=1 tr=0 ts=69ee03fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=54w5cVOzKzMHq45Zt3UA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3duOH_5OsNSlm9urGqBVhfJlYeO-mLtV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI2MDEzNCBTYWx0ZWRfX2qmckcESL+cT
 +w3S5U4Ddx0/0/P5oQagJ7cYf8nu0xSOaXv20+JGQKIDq5nQVwLB1vE4jHOYWC07d1vbmr+EqH/
 NuEBT0ET9F+vzEEWaDwD/zcCOrR+0gMS4Qhz/Vp7DEWJNU7VzUBeHOL+hHPIE652MwD+YnGOBsJ
 P3g3tvEhN2yrK+1Z/+wvSeQhL2ASUUipDj5Rj454Pmfs684+CowztvOHF51yJjiqEFxGzCOqOGc
 RAmzyK7FSOFeLCV5QR+/y9lpxT17Lu2MVPlfBaTl/XhIS6z4zQNLV10hF9WlGcMqE4hDhEDnTQG
 lDcICYJPhk0PNl+lH1zUpgetAGvxCVhVIQVSFE6MZmyN6BcQyhB/itsXb9yeP1NumgQro2kaoIf
 Zpz6YGxMZy01j5zF7jT5tvibtmclirlQ3U+/LSe4smAmqpD+pZH9S6c46mLI3no5AHywi+/lXHC
 6q9PBxiwFAi1jROYwcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604260134

On Thu, Apr 23, 2026 at 06:59:41PM +0530, Vishnu Reddy wrote:
> Add glymur platform data by reusing most of the SM8550 definitions.
> Move configuration that differs in a per-SoC platform specific data.

As a continuation to the previous patch. Compare your commit message to:

On the Glymur platform Iris core shares most of the properties with the
Iris core on the SM8550 platform. The major differences come from Glymur
using two cores, wile SM8550 had only one codec core inside Iris.  Add
glymur-specific platform data, reusing SM8550 definitions where it makes
sense.

Even for such small change it is much easier to first describe why you
are going to perform your changes in a certain way.

> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

-- 
With best wishes
Dmitry
