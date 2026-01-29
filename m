Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2D37BE6F
	for <linux-tegra@vger.kernel.org>; Thu, 29 Jan 2026 08:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675636; cv=none; b=WOVE2HDuvOYP3SAPj41R+4fQ+MctIujBjq/g/3AiU/1F/d/VZuITeKNPy1K04TGPu4o9bgaE7fW9nrU0wk3MNzTkgPvgU+5zGDNZjUjLm31ECBeYDNZWB9JJeKCCDv3msgAqY1r40/+3qvsWD66qJ4D8M5Tq7vfwphX3WYCfwJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675636; c=relaxed/simple;
	bh=Rp4eWS6K2LPGlTY1whwjufRv0SdYHoiTxsiJRJoxQos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+yakIv9HcdrZCKh1Mk0jplHbSAe6OMVGkT8SuKpcf/nVXzWKXRnzA9QhvhjPNwR1DA3qT2t5gOw9+4aldnUkfUO1Qz2chzTTO35Pp5plPobsaMSPFHs0cd9jSfBSDVyDZqtpaMf15RvskgCrZQk1wZS7K7xRTQDpDt+hlZcUnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZ+e/kZc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PchpeZrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZ+e/kZc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PchpeZrh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2pgFn2152632
	for <linux-tegra@vger.kernel.org>; Thu, 29 Jan 2026 08:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r++wupaoeMHVUQiWZNyeVVCDxB1U6o8YaUE4PRTZyMs=; b=OZ+e/kZczmxjBy4l
	yBl16TJQ3CbhYok04T1mE52r/jJIh6w4unlbLwU6yusoUlxvxwiKefYE/CRbkWtY
	/c3w4ZPAhpho2b76vRn2ARR3DUafzzp0z/I7z3Gv8REN09xHWxVN5z/TczV6njeV
	m6iaFnHv9lDFEDvEQG2hexB0XatvSSF9QeWSW01Tx/N0s16ntYyS2gY/DWAVExjy
	w35WQukt8a9poCml/9IvddTxE3yEkqjqbjGKt8xfAlTak5e1EZJZPi5iyGKhhuNp
	F5ZReTuWXI8BaZ0YmUwjhfzZzQtOPwQb1sWQ4+efvXzcSdxJj1clEESPlLq2P03V
	nGgyHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3an7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 29 Jan 2026 08:33:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a2ef071dso315663985a.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Jan 2026 00:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769675630; x=1770280430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r++wupaoeMHVUQiWZNyeVVCDxB1U6o8YaUE4PRTZyMs=;
        b=PchpeZrhCSdyiik6/x3Dols+4Hg7La7WvQaloGDLIIAS3G/ewLuuA2AXCSWvTCUL9j
         dYEujIrfgF8hSg31Ehf+rckRF0GFffKmf9TTmq4TjNOGnpjPajCb5OTTtFxCq/1+gd7z
         jiV4NnD8/dXxNwsai2suWPg5tC+FpmJtaRIks17nnjPn4ZTxDqv7PjeFUgr0xK7gtIDI
         qSv5nclhgc3j/Nia5E0kECD589190aMi/YiPw4QAYWHOzip/bpvgqTiyOWBzEUHyzPO4
         o0yeL4D6bt5trj8sl3XxSdcJWHA6G0gXSICew59uVRfoMtpteab2dSf5YFZKqV/+sds5
         VFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675630; x=1770280430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r++wupaoeMHVUQiWZNyeVVCDxB1U6o8YaUE4PRTZyMs=;
        b=UYk/gC3XreC8Wz9GXbV/gtEca/ksNwfevpgeUbnkAEaEzHAgBFLgbqUewWy+Kou5l+
         gNwyiK3nTdxo2QLK9MPArpwNd5jQ0d7TP/7i0swWqBUtIY5vuN13oMotgycR9+DDL8mU
         4SNvSwyS6d7QX9P+SjR7eUllqhtzwYZ0TcE2nINoJEnb4FO24Qekn9y0uvNx4LLPCYxj
         FXwYQfsj7iztYKDiefMRQWnE9E17jtrMN7cEE8wXVBmzyiEaqFNexXTkaDywfcZ4TrcH
         md6VPOgnxMTwu9d2U2ed5vx8zQd5CZPv3uPVuaaVLv2KMYvF9/Sg2ArA0CkS0HHIi+np
         kmeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhePSGdGIQvfSAC+6/596IY5eJty8EBmm5PCWjOp0Y2KQbqwdxlR4Gu+rKgnpmUsF0T0AWHBUIUpQRXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwk+NCi0OaMisD3Eb2kntIt1DScFtGbrrtdq+jxTWsiDEcN3tT
	RMXZ2/wcaeGDlYedaplPkFnhLCNwtsuarpuUUiAYbIVlkzhJ+Rn8e35qZS2lrj1f2UvWGD4aPvG
	VvMGJMkIVz6/L/F9NEUte2wYyQLGaVrgVOXjM8rqh4WPzaXHL0H3emvj1r0r6V5L+Dw==
X-Gm-Gg: AZuq6aIVZa+qgashTQ5Y+KGSQARb417yU1x85eCYdMFkddn1Jd1Qf8WAmXLiZBmEIUO
	g8Xe0CGc8qm9Ls4qPxvjs3qKI1WgbbxKxdjqMv9BLoXW6HL81+yTytfBD3kYoegc+IlSkMQhEc8
	7087nMrLB6RC2wvmETna/rcfv+UZv3sG9iPUkuZd25Wb4wrPh+7xIydloTjT3d+2RIa3giiNwDZ
	yGiBNhm/DeUzX/MQlBx2V5NforssbJOT+yz4lf7tZ1jmiKLl9haZ8DZy17jy7KfDWD3m8p1JdpP
	HxcdAXUfbvGmRBzrCi2K3sPBpo9QoGQEKjgkdLeBQR8XEwXv0c6vskEydqdz3Q0N97mJcvluB02
	bVDE+77CWvItJHdJD5Bmu9acVEc9lB2lJ3gfyW/k=
X-Received: by 2002:a05:620a:191c:b0:89f:19e:46fa with SMTP id af79cd13be357-8c70b875d23mr1020895585a.20.1769675630368;
        Thu, 29 Jan 2026 00:33:50 -0800 (PST)
X-Received: by 2002:a05:620a:191c:b0:89f:19e:46fa with SMTP id af79cd13be357-8c70b875d23mr1020893885a.20.1769675629977;
        Thu, 29 Jan 2026 00:33:49 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:eb30:6a8a:1705:215e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4757sm13298559f8f.5.2026.01.29.00.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:33:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        robh@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: (subset) [PATCH v5 1/3] dt-bindings: gpio: Add Tegra264 support
Date: Thu, 29 Jan 2026 09:33:47 +0100
Message-ID: <176967547599.5796.2816287193040668949.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128085114.1137725-1-pshete@nvidia.com>
References: <20260128085114.1137725-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b1b6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mkNFcrO7423Z3Jl_UjwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: boql1S3N_vqfGE7snkoCE7saU_BzjXAx
X-Proofpoint-GUID: boql1S3N_vqfGE7snkoCE7saU_BzjXAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA1MiBTYWx0ZWRfX2vSoUv58qj3n
 9XSla4dE55WAcPtexxgNFBglf7XHotyIZSP6Ie25jVTBVMtRgjpuyNvpqraVmbGFSuMZX16v9hY
 G/7Gn/GxrxK/+JX2HhsJigi0s+t9U98zBIOygG6X20/UztyGmd+92WbsO+kGv5ruqPtxwAewq7j
 gmQhiMTTdUThp6XlIjAhPfQm0nlLPOeZ086LBz7SWdMyK5pt1vG4beZDvXTE284abI+mVcG+ixH
 ODi206kgOFx76LzQb1/YjwXyhA8IqOhy+bcaLIzMCXzTOP+pOEjCsHlNn2Nnvf9Mk2aTSH5gANk
 k9PiSy7zKmbVFUIsKqUuz//XKnww9bWN9uPPkVJMAonbSyXzhst+AUOM8t9ehYDtE3UPezLflZN
 5qOmnW1D8913PgV1uBvZMWhhcCelinEebJBy7cRaBxH1+0vVVs2bTqjS1wJAzVKuECGtw1T4zGT
 2dKlPnQsUe72wzjDzTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_01,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290052


On Wed, 28 Jan 2026 08:51:12 +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra264. The number of pins
> is slightly different, but the programming model remains the same.
> 
> Add a new header, include/dt-bindings/gpio/nvidia,tegra264-gpio.h,
> that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin.
> 
> [...]

Fixed whitespace errors and applied, thanks!

[1/3] dt-bindings: gpio: Add Tegra264 support
      https://git.kernel.org/brgl/c/b565717e1d50078b8f13f3f796e707d24a6f3fdc
[2/3] gpio: tegra186: Add support for Tegra264
      https://git.kernel.org/brgl/c/af9b4a56f0000fb11057e204ddfb05d72ba4dba0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
