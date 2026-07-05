Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4B2FFF8D
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280468; cv=none; b=su9ms0Mp193PHnaxdICu4Zc05fFT+4fH2k+LLyvR9mZceU/bLZxqowIQWqqS9ccDFpue7oBrKPYaXuHtcU9A2qQbLqczi1L5yNNb+Bzz08RqnMZc7ZzMWApsOrZHO7zwAN5+aeh570O5v2GfOodU/OkopitPt/2oIbu06h8aFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280468; c=relaxed/simple;
	bh=aDbMtkb7vLXS6gEaXl0MiYPwbTWQdGwMD5R/KH8kYUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s9DydzOaBsbR//FeDr47x6MkB05LPTG/M9cxHmP0KGvM+N4oPP17nzdZEKJEQVpMHsebC67lsDrNI6y9vD0xp386QL2fwvk5biiIkn8VH8+BsVWXAeG76xIB4sTjS6O78FGZu+4bpVqOeoZ19V5+Y3hmvqUMs4zZs8K6nyI6NfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu2AUpMP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T8Pl1BcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu2AUpMP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T8Pl1BcH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhakN2324475
	for <linux-tegra@vger.kernel.org>; Sun, 5 Jul 2026 19:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgum6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 19:41:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca0481106cso24488065ad.0
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=T8Pl1BcHV82RNdBhjv/YnnFJMx2PfKDW5ali50O2AuxJ+wFsHHtCe9sQA7Jl4J8V5P
         7Sfx5/Z3iYr87U3fToEpecY9nTGwkS5LuNuPJE7XZnPMR+QFDzqzu/S+2toH3N3ACjOC
         ov/rVrjS9zsB+0+wR1t4Fbu/gqGr6U+MFivmHAi/A6j/xaLPzVm4uQyDjXILKDG5ErxQ
         wCghV6hgJMk1/bOaG+Kbhg96dIIGv8C+5JlWtE+gc5YhG3rek5F5EtpOrDYYpU/XURNz
         veuIPckjfa1XWXIhyV6MWcEzzJ7CCOkwnn0ZQJF++6PDjZKd0MVVabY6iqb5kVozPzxB
         XwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=Z/snaxQF6r5e+xxEiBN/T0m5AxrS4SIo46YMHlo91lWK3cxPk/yDlXaYRrsBaV7Fyt
         sg9qG4++tvu+inFG3tLrrCj8y2t4t4JSeD/QCZQ0czI5oJ5wm4fDhEwTa3ifOVf3C66g
         Zc8o246WOj2UvoiDQijqcjPluIEy7Nm7sHDtNwn1Hawl4TimwZad9tvAb9omst9mMGkU
         fANEtwXzrjOHdWwT6o3PJUs36eVjYsQ0loGphykad+ug5dLQS44Y2QOCsUfmw7r4mdlt
         qAnrVFE5rkIXAU75sL8OXU49n3BnBg9Bcp3lWBrbeTDqvLnqDv35y9yu9gr/PnlNtf0P
         LwdQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeZkNcbCp0Um45o+gkANWvA2n3peidE27uS73G6xAQyPcQK1RogdlFr7IjXqnu2GkcjSNtdJ/fbvnHzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpBbV6SXACNvVV2LDHDyo6/LbJE9yTx+6sRyyrKPZTxtincroe
	g/iJF+YK2s6lIJUZcBJ4HdAnQcrQODGmVqgAKqxhhjkqKWGk7atx1AvDqprHESuvJaGV9nAWjC3
	xQEYceYoQC+FQ5DBZt4zB20RHruBnezUFxaDUk6ednx6CiXaIxMasLCPJl+q+XDJFgA==
X-Gm-Gg: AfdE7ckj27wKARhNOh1MGT9X3tXplfd96oFlvXDX53KoMUus3vWnL0rRmO4OnQ3eLfX
	3eLH4JhORrQrZFD4OiI6ErRWZpFHrUf1pYJjmCKIMcFXSDhNPCAy43ppiMAKl4JJKLd82fJ2WSs
	KmPdUBuqQ+jz9PpE5WOBYkks1Rrjd2dwP1AFPrx15MYNA3zmT/0OnTwzeVnECL7VVpl7cE+AAEQ
	A1Cve731DT7VJPBkFVpUg5a97gBjUUZcwOtqeEfyusod2mPcza4/fwiH884PxaPg5AwKkyrazTI
	i/Q17vbxxDlDp5p7uoqfVbJQjkDsh1M/ePw0ohsCmLxl50snYL8d9JG5rIPR5oGJWJRJnf3yHxS
	7WEo4kls4fkT87PIeGT4NtkSgerCoWgUxNzOWRA==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673735ad.17.1783280465203;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4ab352 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: DJwKOoIeQpR7cBbBFIfSZ5fE_dFDO_0T
X-Proofpoint-GUID: DJwKOoIeQpR7cBbBFIfSZ5fE_dFDO_0T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX1vaNL7lkMr9s
 Lop5pR0kJt+OY2NeXi166ILy6D8jd+rd/mQV2HgID/B0t+UBdSgNBVLfWrj6vV222cxv48gy/sh
 VtUKJE7TzNv1E2p1s32h+96JKCUsOus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/9YDCbmjUKQ3
 SN8S1uQk/+Dpiylxly0SAvBenBEj1VGsObR1y8fECamHVS3TdUapARXX8mqcV1DLt+HyAq20mQ9
 6cDibAictPngMPGLl90IN5pRsiltk1DuWyW5YVjdpMADxBtb3ayDOSA6GQztCvOwFWu+pld3C95
 OAw0/qCY76Lw3JN19V4CUPku/jTdyjXPTHsQ2SEqN0heR6XdfhEFb8//pN9TscmbVZ58smHyuNB
 5KVh0ilPRkCsDntdF0KUZrGbuz+LSJt0RbFC3/+ty1Q3jCGVrdWtxhbeXFNk8WqB0/QU5P2nKv2
 ZL0s3KoRHJdBrqLz2Ym89m6X9cmMJ/IOcROPT/7Ur73mEj6I+RNmt+2DbfNGarnKmjH3ppCE7sN
 O0s9i10xcOVIMZ/Yf1K5i8byMZ8rA/oaW6wravHN017NZ3yqIjtKY/um0yjSMiEAm+Xi7Pio3jK
 uGx/KEO91I5YMLllqyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

