Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03F39EF20
	for <linux-tegra@vger.kernel.org>; Sun,  5 Jul 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280435; cv=none; b=fXr6lD0Kq1tDGXb4DXZ2kdcAs9LtKr3wFb8DOPxnO/XjQ9Av+5GEVZgSRXM36bZ3kgAx19zjGaUkd3gcKUhISvtq2u6CQHNZ0w+b4fCR89OzzYcvTdDvB3/evje8UvEq1JSDxaRlLVmB9A79MiMBq9jb0z8dksZLtKtmjxttnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280435; c=relaxed/simple;
	bh=hPzzIh+00z/2sTyljZcHfK6TfnoHNAT4ontX894B59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7pkdpHBrbxb1TDZfPnmFOKTkGtIyzd6UC594Hc7Lwqu5A5UyaZjVb4MFZhgh3xDozfULRkszR5CIQCFJ5fSxm6F6x0RSDmE3/8RY/ZPJJ04q4+ZS+64sXWILRSlVYBelz25sTfbSWAUtddRPVXFKqq8OtKOcyo/8UwFUYkdsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EDqYFdv4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTA9Hu8K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EDqYFdv4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTA9Hu8K"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhnkN2271514
	for <linux-tegra@vger.kernel.org>; Sun, 5 Jul 2026 19:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=03p+FFlmwi4
	5suRC+aZpApiuhNt9KA4gObs4WxBM+z8=; b=EDqYFdv4Pmeqy9IR99dcNiLiDAT
	/yuTE7Ljg9Hev+D7GIua619X8FUaXVlexko06UWo2I1UG1HwTHa/3pcOiO1FNKdk
	YiY1UO4+AP6rm2LO5F78feakLwRgePs5DdWtrzsXwhYCgTfecFqPFRL/MQqcfyO9
	pb9r2UQAkfcA5gru+dfTHa2mdfv7340zDAANejxt7cH1lKuJqEenlOMOzxtkjth3
	hBP3jcZzSc9vRDjWjL0r4gMT/svWmjZh1dvVGSJdpYFTDJ+ZtuRTINMxgHG6Wmig
	3zizUVw2wRtMv7D6VUvWZqVy2hRD9jXlwyfLqvXinpJSMddoU1sfRGdzOYQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 19:40:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8952346bb9so1794069a12.2
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jul 2026 12:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280430; x=1783885230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=hTA9Hu8KPQHszEz65Og1e9gCQW2eZ/sQXpMHuEmDsIJTuSZhlakz0b6YBehrxZTRsf
         mtBtQ1/+gV5LKqBDYlUXERKyjBDSvb4rzy7nmdLvd6sclFPtLuwfp3MRBLc7J2YLY3e9
         pEs5URSCAJMxiExSa0RQY4a8qSd0whJb1J8VH0KjHnQmoHg/vmWgaOYJdS105iy1dPm9
         wJa1dNDQdLzfCWekV4C4TM3A0PCBkn99UKowiL4UbwzPrzHhmGisse2fAJAgNNMYmFDk
         F0hX0peexMwNXI1r8lREqei+PM259Y70EHyCtHvZeCQ7hx+YgDTdg0tq97sN6IaHtrt8
         7v1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280430; x=1783885230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03p+FFlmwi45suRC+aZpApiuhNt9KA4gObs4WxBM+z8=;
        b=FVKcfsno6Zm1LvhFAdlaX04OIs/Qtx3Esq9aXnqaTukjs1b/Fn6/SgL87TzV30EMHV
         ES9hnjZcHwHTu6ZQ4L86JfW+gt9oywsECXnv84bV2to1e+O4Aqc08Pf0FmH+MD+bAnVJ
         1CXcoFswj0+xUVUDtgiQvGtv9xLpdtvHgjpqpAJ5j1Geu4Lw0Gx0yqOBOEAVbS+/9og9
         qbDi0KiyBvjBh/2H30hMW985IROvIfnAunLwYeQn8Frrj8fFGy5Jgf+cpaolhyJUPNEC
         LFymptVplJPZEbFgdWFBVidJj9T0x7aJE8XYj0RKyRTnl61b4AcT0MO/3JrQI6DnXomq
         KiQw==
X-Forwarded-Encrypted: i=1; AHgh+Rrp59lLSn1IZb2iMJzlt0AQc5cOa4TTPLSSsed+GBNF3M4ER/V+a9Lh/4ClQb6E59B+GrF+FIan9GnJbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY2V0yuFRdjeyLv+PFhj46E1cVaT54Qv9dCpKh8u4SkyDH7LZG
	nBkSWHn/t75IpxP7+tep9Q9jcyubrQZ+FMXxZT0FAslTbwbYCQMexW3tCSr/VbmkPRaVOZFOQ8y
	QTGhBvG0bX7aThMYxMrnq0ly1Ki7RvF05YKiOTgz6OwROT/x1raNwPpL2LRN5lXL4bITVBkyEZQ
	==
X-Gm-Gg: AfdE7cms7/Hh5Lp19ef03x1Sa+7t8cz14lEz3UpKjXkvbIVgoy74x7Ygnaujgon7mPQ
	xvIn6cJ642fTgsX4F9yNzPxfK2+ErJ3dwkISLdxSrrEInmvpFA9TuFfA55GqY+3gvPZipXu5IMa
	g7LsgjKeQW1sDEbrr9YKamCXk90znq8xdNefhNOUlVr8u4vg7f2jjBN1GvEihxlfnrnJm9ibEeY
	3ZNcfqvOdGVKaZ2aXUCgh/5WWYaBETcAeRCX5OLLAaVMo8D1gQPrCZTvXqnsF+R/JwaMLBuSltX
	sbWneDFlBLU1Bt+5XIoHXRRjSVDr93RdfOfFosm9Aw0U6zWG2OqezMIBm4yJN5JNWDs0vDvfYEz
	X3Y83XIY0SOAZ4b3Ip7Xf0EJwKhD8w4A24BiQOQ==
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693676637.34.1783280430280;
        Sun, 05 Jul 2026 12:40:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a122:b0:3bf:9944:a8d8 with SMTP id adf61e73a8af0-3c03e3ed638mr7693658637.34.1783280429779;
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:29 -0700 (PDT)
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
Subject: [PATCH 33/42] drm: arcpgu: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:09 +0530
Message-ID: <20260705194019.2565498-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzXswIzF0UzXd
 k2titrNDz9jrqVxEuAsyg6ox//WwanyxJdY7ZpXLHBmFkkDLKBmSZwfGBOfaKjL2wfgKIDuNWKk
 XnyAHJsY61yaJLwr3U44xe+y5lLYKoY=
X-Proofpoint-ORIG-GUID: LOMqcoaKRbSB42Cu1aDTqA_Deit4Br8y
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab32f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=lEtn7xO9CsvGDZioIccA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX/8l8Yz+6wWNj
 +ubEgA3jTJDqlewdScPxZ4W5b99wEoGvWEwVc9mq64zgCDw1J+RpgEErn3i1EIt959ZPjmI0Puy
 SrJ+QSiByY+QxmfCwMqXWGQX6/PNhO6CmCd6AarSUH4A3Rs6eoB/8wSVIuqoqdY5XdBxvZ/CRs5
 OmbiZ/q1TZi2vcvAd7pOKQ7Mx2uVdCvQkUnQt31W6sdJtcVsnaOKxz2WwIiI+8DGSz7TkM51BlT
 1EA1sE8cM4YcPcm8N62TQ5ny5KHJwPPZl35JGlK0ZaaUFGoiiqwyfxZBMdG13xk4orFcnRLT9Rk
 d67+4gECsyppwqgh4Horzko9OUr6uM4noYHKnAyflqiDlj6G7WwrT3owHQ2bEc4cqiCQgVD7qCn
 PWXLn7Kd6VjUi8Jk/njY5tkNQDp4dxWNlhkzC3jnxyPVf8O9JWoXLa1+X72J81RRXIvPzYF5a6r
 pjTWJLNWJXYONHf5QIw==
X-Proofpoint-GUID: LOMqcoaKRbSB42Cu1aDTqA_Deit4Br8y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the optional reserved memory region is released on device removal,
fixing a missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index c93d61ac0bb7..fa01407570a8 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -278,7 +278,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-- 
2.53.0

