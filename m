Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ADD38887C
	for <linux-tegra@vger.kernel.org>; Wed,  2 Sep 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345053; cv=none; b=tAsXgp+305G71ZkAFJuGpENwX3RromLegl+GquD16KdO7ifdE1ZbHITO+b+9l9ADGHj6IeJe0Q0oPvwhv3pkU3YKOC/s1Des/dnVV7jxLzj+3bhTqcn+iGXKhcpC9xFVAknPzEO/3LIpJkKzT/DTdmPmB0hRyfx7+V4q4eaBMhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345053; c=relaxed/simple;
	bh=8MR0+dRHyXM7mT3ooR+6EESjBzW9WOnGSv5H8d47RhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rb09oYPCrSsg9Sp0OJ5Fpt+nZSzEafUYwG10ANHdUO9Bn6g0YZkjmCEPX15r6y+KcP4tfp/0uDo1fYFT40zThebjkaoGsUJz/rZvuJuhutug3niw1hHOFp47XGRg0AvZQ7eZwcnKoy9awsWwxd8W62PhjQj5CfzqqK0aYAx6vog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSIQjY94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JU/z4HJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSIQjY94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JU/z4HJb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682A5hOQ688621
	for <linux-tegra@vger.kernel.org>; Wed, 2 Sep 2026 10:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=; b=fSIQjY943fc+Nt1E
	vvugyaC7Wx105pN0PrilSMKMP4dZmZhwfjgQyP4HUZJLlgk023gmWm8JNYTg9GGF
	+F/Ui1Ooyrqua/zJ+tgKdeTE89EIXMsTY4wo5hNnO2mlX9j82RiINyTrNTc33bA8
	eTAHCVcSa3HzWHQiUQXoNMrUbebyppLSIOj7YHePf/0318fHZG6zitVHj6oHoara
	IUnPZNwRe/7FK89DD3pqiLHtw9tZvFSNf1cUvVe0xGHMCEEN4A8EQQCmUI68aJAO
	dj1606VFdUD0YBpE+7TAM8GhUK5VKdzaQ9DJLgB10YiufUBSCimCpmEeIV5JZpCk
	f+7rVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gehrd83ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 02 Sep 2026 10:30:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so171799985a.2
        for <linux-tegra@vger.kernel.org>; Wed, 02 Sep 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345045; x=1788949845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=;
        b=JU/z4HJbLqKRKHs9ioyKXu/P706BVed7zbQgqroBnJPBMwbIPl7AEZ7tQnRPkrVZ6d
         SrVKGOlxmhJnQzMF+Jy6aawbGAEoM/ydxa6QegGDQtHzelgOqio/mwFToBB8kcZXV6aV
         OEHqVcPyzSh6NrmfeARVzCvt+b3RteUP+oz0l94omB7y4faalrKuW3rS3bAFhqFi1rIW
         LSNpyTSrnECj+YK8fe7lQV64e7Pd9sP3NcW/cRHpOy0g3t5GiLxjfaTIYQvVm2Dnf/jF
         Sv8Pe2T+5661CeTSx6eDICxdeWsDy0eBfXxce/cMxpL5i2FttlZFcSmiQ7SQdZBe2UgK
         NulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345045; x=1788949845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HARNeVclzvscKuULqsNvnK/vJHjZ0V5cPXfo7RY9dWk=;
        b=lk7rRKAZSrZbqQxRFFqVPXwjGVIFC280y0+Ec+tmh0Lk7w7nwmKzhYlylsFJhQc16p
         X43CsQafFqdRv2qYrqDj1NRrTHi5Q75qzeKMin30HO+ClJItIrsj6MbbpLteIDU4EKvh
         IMXHnUPLnIuTJSrqFaiQrBpax55Tn4kdnKctkJ/0AWoUQ5ODttRrh1ZE4swHlOaaNXcM
         lvY2Mt9HL8aS19n6jw1n5G3uM0IMbQSnnqWodN4qja+eK80w0druaptaOebF8Jx80SL7
         OAafgCl8BIbOL8lRAxKRSrhpB3x7/ZyQ0ZWnYM2nS7zJdbH8cBxEhKrLfsajFywWD6hL
         AxgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1pynjzMPIqigIPud+6YGTEM96QYCg+3fwvh9EN7G5rp7DqjzL4+Ior4HuQHn+YRUobgCynpIf/WBPzw==@vger.kernel.org
X-Gm-Message-State: AFuF++l/shMBhWngGywtif/u6txSPd99TayGWzbuUOHStwe+XbBb2io5
	JZ48zxG71tXjZJKetns/mzlDUj39MLYXkd/wlgskBW69nfHTH+v7yDDQt5KFGdmgihoTpSs7vul
	0p8aPlcINhZ3a2Ipg82ekEoy+YXC7QyAg8dvkaxceOpdpncniHZXsi8fsd3u6ek+2ew==
X-Gm-Gg: AR+sD13tCHGHcjJLmVuis/9mdCl2queJG/B6iXg6oWItvBp8Nc9E0s0bfvR3QaUYDje
	tpL8riNyzReykuCdi+7lwgI4Pe6GDSH/3ZbCgWK6kuJqbR5z69CbIXWH+yxyz2gakanyOs7OpEL
	xCnyOc/PHBekC7t9nHOfQgvediskrHvLGKbREqxJLFN5vDUO88H96bGAqgsaFqB7CE0p40nnKtJ
	kxFcevIypZc8aApJnL0BWTTENQi51SGzKpXBf//OkNeT6Y5I3NeIVOS3r2V8alnqry2yEEdqcJ/
	Ts5mqG1h9vrJOot+73twFRrkAVgkLiEtkfbjNsKBXAYFGmlYBFh4gPlId9HkRKSIOAFez7nGMQh
	vxUoSHW+E3DSdYggHgTtRxaKaO20=
X-Received: by 2002:a05:620a:8fca:b0:937:2c3a:4b70 with SMTP id af79cd13be357-93960fa64f9mr269711085a.32.1788345044781;
        Wed, 02 Sep 2026 03:30:44 -0700 (PDT)
X-Received: by 2002:a05:620a:8fca:b0:937:2c3a:4b70 with SMTP id af79cd13be357-93960fa64f9mr269703485a.32.1788345044243;
        Wed, 02 Sep 2026 03:30:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm5667434f8f.24.2026.09.02.03.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:30:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thierry Reding <treding@nvidia.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: tegra186: Add support for Tegra268
Date: Wed,  2 Sep 2026 12:30:40 +0200
Message-ID: <178834503625.13814.18008045740177349445.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
References: <20260828-tegra-tegra268-gpio-v1-0-317bd91295e2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q0QU4Jo4f5dzNa_12Kt9YuLOYjQaHrrQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX6UHuh3hfoyPi
 5vohi6UqmhDJHC2LPQNfc0HQOYjeq7CyK/zdDHPK+1P49cPfdYur0t19ZUyDf3SiBSZJbSohoTw
 3rvOdw4GbFbyQuUVqIwC6ShVCxbQRlQnPSToIr461C94DuSajifKte1C0yXIhA+KJvkIsaaUmYO
 qLH20mXgrF8fZNn3AwY1ZA0icA8ur5NfrGO9kiCWOkX+BMsTS2XFRweXdO/XCQ3y+NiJ0h9P+/O
 Be+44aGZ4pMLbrH5yrIJ4pbLbCaiTNunA+1AYDP7jUrOi1CTEg2zc/6P7tVkR5rVVtWp4j01Vo2
 L2ADOGkqV2sOjGaCR5gWl4NuYg/tX7X+UXaqO3HDMzhjf7OlFWsQ3EsPDNgxSW7mY1NvaZD++5r
 249TCY7A3iAClQ9q23DHGJA2XKC6t08bgob5Gz4rOEl0lVJikyszE9hmEXqGuo6OK3XdLz+ew4l
 Z8LMqimIoj2e2zHztpA==
X-Authority-Analysis: v=2.4 cv=NLflPU6g c=1 sm=1 tr=0 ts=6a97fad5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zkdjkONUlUTOIc7Tji8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX4v4LHKaknJPq
 kXzRTawDoPgPPkkqc0DoRcvOenZc3sYw9pvWD2pzvzQGe5pClSUV4JPEC7J4mSkT9u6vIde+qUt
 0cT6uKZ6XX+KLydjpFFHpgOa9ambzPg=
X-Proofpoint-ORIG-GUID: q0QU4Jo4f5dzNa_12Kt9YuLOYjQaHrrQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092


On Fri, 28 Aug 2026 15:39:50 +0100, Jon Hunter wrote:
> Add support for the GPIO controllers on the Tegra268 device. At the
> moment there is no device-tree platform/board supported in the mainline
> kernel for Tegra268, but we will be working to add this. For now we are
> starting to upstream some basic driver support to pave the way for
> supporting Tegra268 based platforms.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add compatible string for Tegra268
      https://git.kernel.org/brgl/c/884214495d377b97a27bcfc371fa1f319a63155a
[2/2] gpio: tegra186: Add support for Tegra268
      https://git.kernel.org/brgl/c/d5bc04687649ccf7b15b421052943870d76bbc2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
