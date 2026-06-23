Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FA2DA775
	for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 08:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204327; cv=none; b=J6qCv/SA2nkSGlP9QViqhyiUfKJFfPD//+5U9WG/xGgAojeMkY+VibbPsRg0j6LXh17YvR+iFH9rikJhedITvWAMqZNHjHK4CGbr1mFRCEB37rKKuA49NOZssjOVNdhWM4kBY7QcURUHCOiT2g2ZB9QbQFSneGsAqPFB3zvJ2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204327; c=relaxed/simple;
	bh=PEfg9/E5y1UFi3sIEh1+99lXZ/MgRXWyftWSdT02h3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMXwF+0YXmYscELkVMPT+zXbt7ClHCQZvxuX8M55fiugQk4ZpAsqtgLRmyHjRzUBBV+GExkTs42/1Me4zZenau/EATYwoycLp7k2u3IcIkWVUGT8+kiVLJaedVgWW1+aowEBkDCHyUviSB1ae3JP+MD/8oD1sPrDywykJk/C1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADIqg0r0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcN1o4/b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADIqg0r0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcN1o4/b"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7jCxo1778209
	for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 08:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0q7WRTscj9d++RUzX6zRMArlx5VJ2vmnVwOo85kg9g=; b=ADIqg0r0UmZFfIA2
	GbpbtZRizks2YNme7bRdSkrW/ikbhz70yXNFFQ4ZvC9+GE6miDx4I9cpVeQkMmv2
	I4gJsIDkLIQqX/Dy7S3+Aoze9l3Y9TM74thAjmQQOEZXaZ5veZCuNMy5fiC+KQDv
	5ylI4NzG8uAyFOpnQZG6NxJEfZHHt8lwg3Ckbj7u5uKN5N+GwNFoGlnLl//PtiZI
	HsytoI6OUx4T2CKXg9bNLgHcTj2i08PtUP3YQNhu0CSxBe9+vFrzPXLzju5mzNfX
	iw44vNFrEsLYpgOkoCeyfYK7sYGAZNxgHciB0o15ImGTZbS9uGuW7WjKHc48wrlT
	mC1YtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gr75p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 08:45:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d3261c5cso1136172185a.3
        for <linux-tegra@vger.kernel.org>; Tue, 23 Jun 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204324; x=1782809124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0q7WRTscj9d++RUzX6zRMArlx5VJ2vmnVwOo85kg9g=;
        b=IcN1o4/bSoiSLFIjJax2ewXtxgSGK8StJRhraPLwNBIJRvIZYBaYOfRZpvZevgHIAb
         Ir3jc/RHJNRQi18ncdutsVuWeqij0bRPdkey0tu8dmBMwXoIp5+f73mv/G2Ti6rSd0tC
         Dwwj6+qeBiDOOp7JjhcLyvKFmdTCd/lpajmvK21PT3/X0/usvvqPlr76wDDkAE33KPUn
         l+qHN6+4pn6YGeCd9mBkKeY2kETgV6xdIWCHJC9PtUpWFCAdeMd828DZmDYLaG327rQc
         HOhweYgOouGBaq2dS2JSTJ0W7E/btk/DLYrKKEefiHBtWphmEaC/cJ4KYVKB1wW2Zxyc
         LmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204324; x=1782809124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O0q7WRTscj9d++RUzX6zRMArlx5VJ2vmnVwOo85kg9g=;
        b=oT+nUqaPSsa6aCvNqpiUvGcmRzeD/YO3F4HQCgdC9EnZDGg1/lt02ZV73gTOsl7DSz
         seamSiCdNX1K3+WqbcWyOJEA/Ue4mNTjYgeFDnlBji5pDNEBjnOgSx7omAc5kDAijQyu
         WPgo66wdiZxP3wr3I3aG7wao/86/QOQeFRfeczg5bJNOrA7akvfjHhiIV1Fyd/cAEH5i
         hSMLpkA5CihG+w7h4yzw7CXR8fjhDFbYGqeEmQ8dp1QfUg1ZeTQZkQr5dHL+awsc4dPw
         /pbID3nOQBep/ngcSKmt6wFaZxE2waTOLzbdn3pP2miqmF0xDMV41qNC7u1rxYRsflSR
         QOuw==
X-Forwarded-Encrypted: i=1; AFNElJ9+p40glLW43TfmBOw010JP/r3skyu9v/Yba6lnvkCiamQ9LdtSI/1xBLr2u6X7tkHPqWRz+5NxPtSkiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySDh+prsIzV/3kJJ2M8cwfguuI4+7D/BDy0Tti76xUPp74DsEr
	Xsu3PTulGkvzukQMR22J4CRBEUe1AEJipc7BmXh0sNoZjO7GzDi47LHwg2pn55Ynf6iYnaOwyj/
	pLLEQuM8j3T6BDyvEcuCDFXGvYMexCsi1GAdsepXcdmhHSvs1Le1N3+xaegbY1+VZCg==
X-Gm-Gg: AfdE7ckDIr3wMgpXFX+nLPL1c9TOKrgaXBhCFUGoEmY+g9MJaWDyZnCNd5t8+VVgBYh
	K8//EbrYhYaXeeNu+T0TwXnusaoDYnimGmVJ0Rzso9VjrSeJhYpETYjU7ljZVb9+rw6tL4mhQbD
	nykQmrqqPeW3ceU7tjTJTqiCTA9tQg1JiONGvernPD6PxZvIOmAkv83h2+ke85WGGzbcDvavl4l
	vzishbNkZKa0kx0g9aGekj8fI1zq9v+NOMeVzMJ64MPVNvK/0eJag7MjJgIqpyrW83Ox15adPvy
	H2UR1cY/eUWRS2C7BvDlmpc6AM4qddXDNr3ivGzPe9pSWSZifQwrI45rFBnodMtM5KcwNvfq2ou
	88wYnaHnqLYhOSf8XX1HH/x2/KRplPZ5+60LVkgw=
X-Received: by 2002:a05:620a:4481:b0:915:9051:ba2 with SMTP id af79cd13be357-92092450e6cmr2841998585a.49.1782204323756;
        Tue, 23 Jun 2026 01:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:915:9051:ba2 with SMTP id af79cd13be357-92092450e6cmr2841994985a.49.1782204323304;
        Tue, 23 Jun 2026 01:45:23 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ac73:5de7:b9d6:d9e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788547sm35622583f8f.18.2026.06.23.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:45:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra: do not call pinctrl for GPIO direction
Date: Tue, 23 Jun 2026 10:45:18 +0200
Message-ID: <178220431330.7682.16070388780345614075.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619152439.1239561-1-runyu.xiao@seu.edu.cn>
References: <20260619152439.1239561-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1840jKY5zSpwSa3TUiqOtI6AJH-paaB-
X-Proofpoint-GUID: 1840jKY5zSpwSa3TUiqOtI6AJH-paaB-
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a47a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=DckfCgsgHaicydLOKuwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX8KwNpULKCXhu
 ZsjdFU2Xqnl6b0Dn2ysVBX+otOEgQSrEjvz69H2FZWhAGGVl+a5Soguu04wjJ3bgAg4w2KFt18u
 tsXFK8+ACWvwgUBynEUUmYkT0qxOekY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MCBTYWx0ZWRfX4TY7Y0/YrIPr
 wHyP8lGawGXbKWeUor75wObrktqQaFYxS36mjoMLNimAVrBrNq33zhUY656rmfkL5GzP2rEC9W+
 41M+XwxcUmtP/SkOGnzWDgplJm3Z/lIQ5DfG2KobIc3p2/1wWXmlsYIkzuOCSXf85W+tnNZPsXy
 vVy1j5VaErOG0vhSp+tKIhIwG8YRORtOJLUDQcb2kfvV0zWxeU+V4V3/wGDij+AE8I/LFfyPY9J
 JMv4zvDxjut5MpJlu/t+En1ivtKDlIkRddrarmZ7CY3TynmyXVtcgVSB24nZbRkVfBKDjJB1o5A
 PZOt1AHAVksdJumWNVxpwH4gIRq05XT34tt29PZGFP4wbMNYM0Y6XpJ91ubzLevRbpQUR2Qhx0D
 zd1lPzRu3e10RcKMbNzHVDQlFt4+DhqMMd7JDN4ESBNu6rGVfHc6cd5OHuOk/kjhR103cJQE3vv
 9iAhR/l2SWxbELK+Bpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230070


On Fri, 19 Jun 2026 23:24:39 +0800, Runyu Xiao wrote:
> tegra_gpio_direction_input() and tegra_gpio_direction_output() already
> program the GPIO controller direction registers directly. The additional
> pinctrl_gpio_direction_input/output() calls do not add a Tegra pinctrl
> operation, because the Tegra pinmux ops provide GPIO request/free
> handling but no gpio_set_direction hook.
> 
> The extra call still enters the pinctrl core and takes pctldev->mutex.
> Shared GPIO users can call the direction path while holding their
> per-line spinlock, so this otherwise redundant pinctrl direction call can
> sleep in an atomic context.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra: do not call pinctrl for GPIO direction
      https://git.kernel.org/brgl/c/d3e91a95b2b0fc6336dbf3ec90d831a1654d2720

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
