Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7738C411
	for <linux-tegra@vger.kernel.org>; Thu,  9 Apr 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723789; cv=none; b=TCsKLrwQUInMH3kTNicT9dW9yKNTdwGfw7Bx9mv7tXlaHfZCRVrttfHzagh09qYIOVTbK81Yq97T2ncMngQZ/yxqDIaDY1H4J5+FP2/l0gZWeD7Nq/hKiO9ZXjKc8V5y5gS/y+W3qShnG1cABWruXuB1IBWGBWD1p2Wa8qrfUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723789; c=relaxed/simple;
	bh=Y9K7E5i8KxnQMZtVX7CHkn7UT/rMHmmRz4/ssFCiHKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmMlqwCrheb3wLr2yMDHvbUxBqm9kmmBYS9n8NNd/UzIOjeyh5LOLH3SekizLqWGDQgFLPpaOQNt2ZiG02uLYLLIasBv6FVt0q8r8a2njxmnpJioicrnudBAXpNwj7z2swWtC/yEHQIWV1iFFxuLl4VzqZeEWNuNA8M4any8LFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC2mJBbT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPAPXGD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC2mJBbT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPAPXGD9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395Lx9h4107652
	for <linux-tegra@vger.kernel.org>; Thu, 9 Apr 2026 08:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+z7jGPtMr6kk7tyw7tKLvGhBNxPtQPNHjwBSsQTlfmQ=; b=ZC2mJBbTwR9W2owz
	/xcfQqHX5Ax7wsyLh3uJmm7hyZSYTYYIEa0+xD9h97DPpew/YiFq2pEnICulNw7m
	nGezQoMsEqq4pZv6G10qJ1jCY3l4zkrNXQduyDemBNZ9++iEJp2u1cI/qMy1iJ16
	+EdQ7W6i/fBlMzVSmJB82CjFiJpOvxGZFY/vwfGWiEojdNOSdmCctCyqs+HIgSD5
	R5ma8eqetsu0UZNc4Ekzxn8n0eZ42AjaU9xZl9ZZMyMQUAVoRgMZRwhLPoNIV5xT
	OheIt34gKDpRax+0VKj1qdL2HrlDXntnlJFGoT2IA0yDB6/yOwOFFl0C/IVJkUbk
	mD0quA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhaj0ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 09 Apr 2026 08:36:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d76f460b2so28325671cf.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Apr 2026 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775723786; x=1776328586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z7jGPtMr6kk7tyw7tKLvGhBNxPtQPNHjwBSsQTlfmQ=;
        b=BPAPXGD9nQHF6/P78BQpmCpx/8WI74oJoH3KhtgfOBSwYHgD8pbBH+PxNNrLhxSH2h
         m4ODxWXTHZ7ijL94mCjluqoZEJwkQWHSvzrRFaArLklHEEFbas7owA6HWsqUlD9F03dc
         PkwJ33G4OXuecqhwUOYn6RD346h0MwzjsK63KpX3kOEkYYzBVysucCz61QgBD5YSPEeM
         24g20SiGh3IOKIbyApQvyNO47qPomM3f8v7y79NFzJbpITkmei7sgWF8ASeb6OqckOpu
         kSV6fZ8wig/srd+9Q4VxjQP7VzpQjz0YMEssMUYuRHgV+3AD0royV6gYx2vX49s8ka3w
         Fwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723786; x=1776328586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+z7jGPtMr6kk7tyw7tKLvGhBNxPtQPNHjwBSsQTlfmQ=;
        b=H25tNP/wBr0HpjTqoDDs3iyOyP3ttNO1HYgZOCLr/0EYrpU9sJIbtpsUUrDLLO6rBk
         kbk6GqULs4IYs7prvlCwjS+E6od6sQItBSxLiobTcG5ioT6cI9rHRMS+8GHNAUvXpeYv
         iQir+2r+4zlkT6W8k19vBmwjxkRdRDmTTKRNe+cciRD+WYCvvbsxBdWAkP63Tj15drPQ
         zFialOxZB4axi1+AXxrdN88NyXrNiSVqjP42kR+7wkcqv21hPCfZUH4lyR5JiI/Ubh0Q
         5FVkL5cAukWIJhL2TGN1HsbKU3yMnYHc6aItr+L9zia2EHQRxegdmEmjoTAoLJja9Ckm
         tsgA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Xq/RQyTw4xUE6dCGVwEcyYCO+fIScSPwBtdBiFkwDTVo7y1t6UUjHEzBsOgf23n1+oNiLv8HZUYqQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEixn0AjVQJAO6vsesuCyklsSEjBsL8trezixxEgybtOKflFDA
	KGjcNfnv3gy+TNZCGodSBRzhXIjhzySP1/HcgmgnIVaxzNsj52AXyexHYYfWyZBLoT6PU5s4BpT
	Sla73UIp6Unvy2UVNut12F/2eF1hS998rueMF2D6cXSInj5HroPeSdmZlAHYVXjCP4A==
X-Gm-Gg: AeBDiesr5sPeh3WiflvxG1djlrHyXdzukHc4uSFTNchjRHxv0XHVcSjkc3NJvAFw1Yw
	xH+egk4yUETZDUVVrsX3xV4wI0hdNL9cqj4V2uTszVqvqn4rBp3hQfkFzYsabM0MUD323MZuyU9
	yXUdMFXychYObV1Lbasa8YT0dL3VWeEQu30/J83POGW2pRtwxYIPq8X1EmGoqKAqaUkOY+Fh4Ju
	5VGyVoY139qoIYDDAriQRqH7QMV05fBMKYLeeCnpJW7M0e10MRoJB1cLTEeAhXszpobPyBqs07j
	s3/F0YbfRjB14QMuMqJBZ3DwD39kxS49+CPNV/sxnxw2dJ28z1m0xq6n0pH9zXmyUrRzV1arbGU
	qE+vXe+nEaeQoDwnYPuM7FT9GNV2TnJUyq9dNtxTcKJP6jJ753pY=
X-Received: by 2002:a05:622a:248e:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50dc21ce255mr34961161cf.24.1775723786225;
        Thu, 09 Apr 2026 01:36:26 -0700 (PDT)
X-Received: by 2002:a05:622a:248e:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50dc21ce255mr34961011cf.24.1775723785786;
        Thu, 09 Apr 2026 01:36:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:25ad:5d40:fb11:35a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cfa75ae2sm67976645e9.14.2026.04.09.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 01:36:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@kernel.org,
        jonathanh@nvidia.com,
        Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra: fix irq_release_resources calling enable instead of disable
Date: Thu,  9 Apr 2026 10:36:23 +0200
Message-ID: <177572378022.62056.4431173020007463184.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407210247.1737938-1-samasth.norway.ananda@oracle.com>
References: <20260407210247.1737938-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RH-q_vA0e0bMcHsNK5WVTMCJWujl6mzp
X-Proofpoint-GUID: RH-q_vA0e0bMcHsNK5WVTMCJWujl6mzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA3NSBTYWx0ZWRfX0nvTFZjXETOy
 Dgo3qyp0b8UMsroHxDaxz0Up6SdFO6tYv3NolwRKf2wnLxpmV//lnupNL5iVdKU6FH7PRxr8Ph1
 YuQ5zutGT+crmD5G+hb5ZN9d4ZUUj4QVEvIxT53UP/cJJ9DcNrScjt9EMwqwcvqAOeRcRS0RXH/
 vvUVUC5i04x8ZRCzNJjf5N+sHEE8+4paI8fgBxnSDuMMXbOIkgS0YdSzvs7jrkT2r7SqSLuEJyo
 hC+x/BzcUn+NI7+JqL7JyIY3rmyGdFBmb9f8Kns7SI/m9FWtG77N22kDiD9Iv8xY8ueb9H2i1YA
 eArseMsVE/e1laEVxRxrFv4HQSaSDpZkk3kVA0FaPLTI43kNhb5FTjgTPfGOMPeVTaJZNEHVDrc
 aRKQMbI/M0ixqfFNhfngwgBKFS9/AxDynqQhRcccCRzhtqVm25aEVyCYeYk0zJ4TbHEbczsWnJ2
 k0xay+G9CUYABeNTyDA==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d7650a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=knViAHviYLxJDNZdbiIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090075


On Tue, 07 Apr 2026 14:02:47 -0700, Samasth Norway Ananda wrote:
> tegra_gpio_irq_release_resources() erroneously calls tegra_gpio_enable()
> instead of tegra_gpio_disable(). When IRQ resources are released, the
> GPIO configuration bit (CNF) should be cleared to deconfigure the pin as
> a GPIO. Leaving it enabled wastes power and can cause unexpected behavior
> if the pin is later reused for an alternate function via pinctrl.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra: fix irq_release_resources calling enable instead of disable
      https://git.kernel.org/brgl/c/1561d96f5f55c1bca9ff047ace5813f4f244eea6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
