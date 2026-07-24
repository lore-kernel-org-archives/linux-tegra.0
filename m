Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BD23A9628
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877554; cv=none; b=N1e0ZsYxsynyzby2t0oOY/LScGTkM1FGg+miyUMEeUaL8pME6QoFfTYtzXD9aU9CHFewHQvup2N7t8nI4y6th37oEPYYJbRG6UbaygsDoOsJiFXauAH5VqXgNHrc7Ww6J+s1WIIfVCPYZNZHNlat/Fgs0pK/wd31R8PXoy1NsI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877554; c=relaxed/simple;
	bh=KCWI3HNx7SBSYRM9H+O74KRL98G1L4v3MvETRdT4fww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XY0hqw4zVxp5izkztUOaWGAPenXu0+iYE9bIBaq1L8+Hp9obDsISS5pkM8w8bNXo7ixA5o//k2sNh+DYO2FGfC8ZRw2uLp+tR2THtvxelCavjhiJaF8T3Q1qjm1QsszxAh+kQHYrBZg96yLT/BPl3KBk77Ehb3V2pVAJ8UxMB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enChIPtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoaeaA8E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enChIPtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoaeaA8E"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4smao1897512
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=; b=enChIPtp/j5fth2d
	abWNbz0T7ekPNvwODwOVFrhDaNFaD41JtFgod2KyVyo7b6hlyO3z1NZNTNHZHKlS
	OgirzJ+3DgAHA9zlJIW/hYERuJ13aX3d6oB/k8DrvTEoPCn6ehsEvnagnkuDT9l2
	ODtxAIumC12a1U3C7K3b2J9+Lb7x8Y7x7nxus5cAURI3cHdn/RjosXBy1lIUfoIR
	2cAZOmZPFqedKdUDVDXAJYxDmsgOT38XwOl07i1ULtXjUMm7YLR5PuFY4EqK2G0z
	VE+r3D/1GdCrj2sTReZ42dCsfv6J7p3vWo6cL2M2DNoQwcwCflu1SVtDW42VqynH
	OvilAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em8fsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:19:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so2474305ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877552; x=1785482352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=;
        b=GoaeaA8EUePV2yyxwV2sKVO/WMNeTP+++bUjNEdo9wrJZv0GiwzWELKxMgnFtkFo3M
         HwT4ipGGfoHL1AitJMnv1wF+VlRe+1TiWhTgOpdnwxNgVXd9o9LrOCJujGbfUisWHlFY
         IeDXQQeUfLMF/6dsa+CPiAOwX72iUDtqP9MD7OLrZX7G1TIkLUmLwl3hKmi6SxAvEIiF
         SmcFGU+df/mDjmBpnHiNP/dIpCbQPcHOdf/gwbeDhAJewTHoyZv7ArQ9hDvoI2WtAW67
         8bTtJQB2+/lmvHJTj6jFNezyp3kyXohGTBizrIYzLtoFqXMKXaTDZ5+tbWre1OrOlzFE
         OrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877552; x=1785482352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o+cn3qFiodANuon2nIvIKSnIrm4LrxKQ/PH84MmjCzM=;
        b=Wb+fTJZFMRyXyQ0BTKx1ADV3fQIqQAq564u0FDU7dC8YJCnOWpFMRnW9/s8f6cPsp8
         dXsQlmgsH7SkWdOY/bOzvFNd5EhiNCUQkBSujyPtKIT+I9fNTYStTfjaK87gkn5OvXsi
         LaFpLuJNzN6U4c9xqR7ACt1i3hNYDm0w6hcKWrenR2iwCIU/czFxAAM84MG/6+M5TXvI
         VhMokRIylgakjBRcbqYQ1sYyfo6IGYE5FBEkyLcf04SU+x22XOgMPIUKf+irhwOmbHoR
         caomL/1NB3rSM50mvH7J5h+rc5JD3qFEYDGxmnj9/2hwKrEmOdm/I3GbUNvuKDJzU79a
         g6iA==
X-Forwarded-Encrypted: i=1; AHgh+RpSXy9KOrL7khxXq4co+HgT+qRZ2Ns2uqr4mek84OEmONqmX3bO/aUgSzOWduGZxNUI0NmVnW0R1gboVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YhTOv0shv80U7Lzd7N21jpNSucPhfAyjf83+jZiycyoNTNto
	WTJD1IuMFtnXsLmC9fKlWwTkVxcQMHjOiSOwdJCdWWedTXuBcOW3ecPzJElMQV96ceWelQqj02x
	RxnJ0lEcEyr62lKVyo0ZLPseuMz+eQgbe8qRvyKNemwnmYxv9WzelUSx3Mo4TJFrdyA==
X-Gm-Gg: AR+sD13zERODAbpGwlMGVTSCR7i1axsc33tflGrqtWyLkl+Z8WKvCShkLJh5qh6jLss
	4c1r6FIQPyvlSpS8WyS8dWwc9t1AjqvKiu2TONMuvRlkr/+P56MsynalX6SPm8q8qmukeam4Wql
	nCNRgk2FBS1f+VYrX0kEPhtBMRV86k38db+SBXT+XL5ZCqVWyjqcW/6aoWQwEw4lhAZ7Vu3tp2J
	obpVR4f2i57a1wvFmW3QTP1o+e+pxLqifMFo9AUrPPvm1h88AnX3ViQ8btDgMtaTUlEzEzBRFOO
	YWHEVbc+kx9oaS1/9TtcP1c7CqYhFeJ0wiUj47RyCB3Y2ZxTQtDsqTDEsScmKX78HD+YpAdBjJX
	hyIuROd0zyHuJxGblPzuI2FXNNCg1562yeZifTP8jJe9/v3KCMAelfQeTFeIGojvCfDbZndeCVA
	aU8KWeI8nBW/JRRjiNbAyifKSvSoU=
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr73353275ad.3.1784877551540;
        Fri, 24 Jul 2026 00:19:11 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr73352855ad.3.1784877550917;
        Fri, 24 Jul 2026 00:19:10 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:10 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:09 +0530
Subject: [PATCH RFC 04/10] PM / devfreq: Add new target_freq attribute flag
 for governors
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-4-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=7716;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=9zK8epQvNbuVk1OIit8CUMNNYQlt7Ism/my5pJtwFUk=;
 b=nOAw4COlo3kTot+tWkInoVAG4WMWOoJMrZMVGgHNvYlBa1wuSNNnr7Bt15tb0fp2L8/rUxg/o
 dcNHgIULXzuAkC6FA9umZi+IFucLk0uDWz6TFs4cvfmPfaNyoi36lFN
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX8d8HGlkqAdBP
 z3Q4n2s+S5NmyRZqKLeqJ+PhdSQoTyE4X24knKOSeIBN6H8kuLt6scVn4yFXzLJRphxQLE4SxEZ
 wsEGOu1M2JXB8knnbtJcX3BVdqAWfSE=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a6311f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=WcTcrbn6WVXM4q_icv8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: kUkFDoPIiZb94nKhTqLEcE8EguIZQYQn
X-Proofpoint-GUID: kUkFDoPIiZb94nKhTqLEcE8EguIZQYQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX6dxGR/tGwusL
 EOLiYzzEqiqOiF+3qASSpNsiTtbKJioYE2Wye5jldItHtr5fpULr/EQZ9+HWGmBKlZv7ebcczyq
 BKQhmFltjZP4DLohvYRsC3ATkn4YwZdHEFBanqCg+P9u1lfD9G/dMYm/EWsoKOctNL6i+JzM5iG
 nDXrXnkmtLgho/ycvcz9ojOQYE2Ujo3M7vVj5ZyC51gj+6W0McTFUVo0ebhFyXdex8rMHr8eNsn
 swpZzQTCCLALDf4weYo3U1XVWGrTdlmzFaRYnCOsj4s2FWULnegnAoi3RS1n1DIhJLCy4UtAfVH
 3h1xs+ScU3x5VNGo7IDfTr16NdCDutFpDm4GLSX9VRer4iwamM2Ygyx6gJYHEnfT58aRY1/EDsr
 D+Dm7cojlnvY3wtSM8R1nLjMu1c/Tr42PaLWRpVUYPV6vX1R98UH8bN8EChjlkqBRqlA4TiGOFB
 XQaqHlhdTiruPt6nuuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The target_freq sysfs attribute exposes a governor's predicted next
target frequency. Not every devfreq governor has a meaningful value
to report there; some merely observe an externally-driven device.

Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
a meaningful target frequency must opt in to. Gate the existing
target_freq sysfs read on the flag and return -EINVAL when the active
governor does not advertise it.

Tag all in-tree governors so visible behaviour stays unchanged for
in-tree users. Out-of-tree governors that drive frequency updates
and want to keep target_freq readable need to set the new flag.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-class-devfreq | 8 ++++++++
 drivers/devfreq/devfreq.c                     | 6 ++++++
 drivers/devfreq/governor_passive.c            | 1 +
 drivers/devfreq/governor_performance.c        | 1 +
 drivers/devfreq/governor_powersave.c          | 1 +
 drivers/devfreq/governor_simpleondemand.c     | 1 +
 drivers/devfreq/governor_userspace.c          | 1 +
 drivers/devfreq/hisi_uncore_freq.c            | 1 +
 drivers/devfreq/tegra30-devfreq.c             | 3 ++-
 include/linux/devfreq-governor.h              | 3 +++
 10 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-devfreq b/Documentation/ABI/testing/sysfs-class-devfreq
index df8ba88b9f6a..5be9940a5853 100644
--- a/Documentation/ABI/testing/sysfs-class-devfreq
+++ b/Documentation/ABI/testing/sysfs-class-devfreq
@@ -37,6 +37,14 @@ Description:
 		The /sys/class/devfreq/.../target_freq shows the next governor
 		predicted target frequency of the corresponding devfreq object.
 
+		Reading this attribute returns -EINVAL when the active
+		governor does not advertise DEVFREQ_GOV_ATTR_TARGET_FREQ.
+		All in-tree governors that drive frequency transitions tag
+		this attribute, so existing in-tree behaviour is unchanged.
+		Out-of-tree governors that previously relied on the
+		unconditional read of df->previous_freq must opt in by
+		setting DEVFREQ_GOV_ATTR_TARGET_FREQ in their attrs field.
+
 What:		/sys/class/devfreq/.../trans_stat
 Date:		October 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index f08fc6966eae..2f27a239e34a 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
 {
 	struct devfreq *df = to_devfreq(dev);
 
+	guard(mutex)(&devfreq_list_lock);
+
+	if (!df->profile || !df->governor ||
+	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
+		return -EINVAL;
+
 	return sprintf(buf, "%lu\n", df->previous_freq);
 }
 static DEVICE_ATTR_RO(target_freq);
diff --git a/drivers/devfreq/governor_passive.c b/drivers/devfreq/governor_passive.c
index d7feecd900f1..b75e4bbee4b1 100644
--- a/drivers/devfreq/governor_passive.c
+++ b/drivers/devfreq/governor_passive.c
@@ -448,6 +448,7 @@ static int devfreq_passive_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_passive = {
 	.name = DEVFREQ_GOV_PASSIVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE,
 	.get_target_freq = devfreq_passive_get_target_freq,
 	.event_handler = devfreq_passive_event_handler,
diff --git a/drivers/devfreq/governor_performance.c b/drivers/devfreq/governor_performance.c
index fdb22bf512cf..b9ec587f582c 100644
--- a/drivers/devfreq/governor_performance.c
+++ b/drivers/devfreq/governor_performance.c
@@ -37,6 +37,7 @@ static int devfreq_performance_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_performance = {
 	.name = DEVFREQ_GOV_PERFORMANCE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_performance_func,
 	.event_handler = devfreq_performance_handler,
 };
diff --git a/drivers/devfreq/governor_powersave.c b/drivers/devfreq/governor_powersave.c
index ee2d6ec8a512..69eab1d0a7fc 100644
--- a/drivers/devfreq/governor_powersave.c
+++ b/drivers/devfreq/governor_powersave.c
@@ -37,6 +37,7 @@ static int devfreq_powersave_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_powersave = {
 	.name = DEVFREQ_GOV_POWERSAVE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_powersave_func,
 	.event_handler = devfreq_powersave_handler,
 };
diff --git a/drivers/devfreq/governor_simpleondemand.c b/drivers/devfreq/governor_simpleondemand.c
index ac9c5e9e51a4..65ff9d912ef9 100644
--- a/drivers/devfreq/governor_simpleondemand.c
+++ b/drivers/devfreq/governor_simpleondemand.c
@@ -118,6 +118,7 @@ static int devfreq_simple_ondemand_handler(struct devfreq *devfreq,
 static struct devfreq_governor devfreq_simple_ondemand = {
 	.name = DEVFREQ_GOV_SIMPLE_ONDEMAND,
 	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ
 		| DEVFREQ_GOV_ATTR_TIMER,
 	.get_target_freq = devfreq_simple_ondemand_func,
 	.event_handler = devfreq_simple_ondemand_handler,
diff --git a/drivers/devfreq/governor_userspace.c b/drivers/devfreq/governor_userspace.c
index 3906ebedbae8..d1b765a7b8e5 100644
--- a/drivers/devfreq/governor_userspace.c
+++ b/drivers/devfreq/governor_userspace.c
@@ -135,6 +135,7 @@ static int devfreq_userspace_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor devfreq_userspace = {
 	.name = DEVFREQ_GOV_USERSPACE,
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.get_target_freq = devfreq_userspace_func,
 	.event_handler = devfreq_userspace_handler,
 };
diff --git a/drivers/devfreq/hisi_uncore_freq.c b/drivers/devfreq/hisi_uncore_freq.c
index e1f64b723082..5a2d7e011ad1 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -398,6 +398,7 @@ static struct devfreq_governor hisi_platform_governor = {
 	 * Set interrupt_driven to skip the devfreq monitor mechanism, though
 	 * this governor is not interrupt-driven.
 	 */
+	.attrs = DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = hisi_platform_gov_func,
 	.event_handler = hisi_platform_gov_handler,
diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
index 401aac6a9f07..fcb278c4a74c 100644
--- a/drivers/devfreq/tegra30-devfreq.c
+++ b/drivers/devfreq/tegra30-devfreq.c
@@ -776,7 +776,8 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
 
 static struct devfreq_governor tegra_devfreq_governor = {
 	.name = "tegra_actmon",
-	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TARGET_FREQ,
 	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
 		| DEVFREQ_GOV_FLAG_IRQ_DRIVEN,
 	.get_target_freq = tegra_governor_get_target,
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index dfdd0160a29f..2853f571dfdf 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -43,9 +43,12 @@
  *   : Indicate polling_interval sysfs attribute
  * - DEVFREQ_GOV_ATTR_TIMER
  *   : Indicate timer sysfs attribute
+ * - DEVFREQ_GOV_ATTR_TARGET_FREQ
+ *   : Indicate the target freq sysfs attribute
  */
 #define DEVFREQ_GOV_ATTR_POLLING_INTERVAL		BIT(0)
 #define DEVFREQ_GOV_ATTR_TIMER				BIT(1)
+#define DEVFREQ_GOV_ATTR_TARGET_FREQ			BIT(2)
 
 /**
  * struct devfreq_governor - Devfreq policy governor

-- 
2.34.1

