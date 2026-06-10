Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77DD3BADB3
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081553; cv=none; b=debhGmt6UGG+E6p+oDz6zTXMvzz3ThjiTfGMg+mCvDB0lCZ7DTyLvjuBileR8zQxRe6HKDWbqYdSgTrfbpIpGsBl65A4l3nrAfz+s1GiJbCjRa9yiVofzrmkCKni86CcOphECvujxDCpdo59M2p3okjRgy/M7kHmPkHCiZmYLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081553; c=relaxed/simple;
	bh=Jt8WeTmVt4JUIBhcmu9lO3/qyAspgei2ScQVQmUjjbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsDB4h8gtWq6Rr4uyGMKqAcUwq9DhnWEtHHwDLI9KZCbDuox0AzhuE5FsPSK7hd+UW0AS3HIzt6Rv6NqngwujecKeVJY6aLQHsFHA3haXWp8DF4D81zUcL5jV44lnI2sQYwNdHurvBpcS+3hbRRsOanz/Gma5PHGb1kmI/VKy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HE5y9W2n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUo4IpNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HE5y9W2n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUo4IpNt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hnvu530865
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=; b=HE5y9W2nDO3tuHbH
	jq/cMrHyhdghrYiGW8i9yilPHf/YHs1MjNi3rEqmXjqEn1YzAwazfG8fezKQCEKs
	OFveIOZeGBG21A+I7NfnrlwJvKUehJTFf/dxFJOT769ym4CoFnJl3Wo8L8eIi8uK
	jCtrKwLWnePuP3ivIiuxA9JFlMldURb+aoAWehuSy//kD8sIBtjcWoLZPtCJWEPx
	Ym9G6EnKHGjxZI7jG3LiceDNtrZ4/fL375qCHFIJVIiyxFw44EQPaEPf2MHnoYYe
	BVWo1yIblsLrrkBgE7hslCe0xxNnutwGXEy2Qpu84xfW0MlhqMwlSYS5rnwVC6xS
	dTim1A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh1mrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0532a6588so61059235ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081549; x=1781686349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=;
        b=SUo4IpNtpX1Ds73EFN7H5kreJsGKrMxc+6ikHxTQyKOeENUyB0f61vwUP7Bt5Xz4Kd
         hs+iK9C5bS9qAVUaimfrGXEc9elH5YRYgs38vNNv2wLOSpFzBHFje8MUWm9M0iFnskmy
         0D6tjaYqWGHhFQkNBj4WnGGFmmiPyrvjrLrfPCln9qkTHjJT3JDkfe9WRDLBFd4NWDXQ
         fmX1o2Z9Vfk1o+uugZnGtZMWR7D1bYwWGOucoCnDXNNSpHKcmbrDdr+fLG8Mb67hCCTp
         RqqyVVA8JDUTxqQGulQEqsFyoE0odj+cMVI3TEkZud+fwtdEDkOhOeWfAJ4Rg9KW+o+A
         93GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081549; x=1781686349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MBVvbqlw+1NOFx2/e/goeBGUj7Yh97eXwaqTR4dNxy8=;
        b=kOccsARh1fwD2pK0FehZGBH0IhXJ3qu3aGxt8Sg4xRWvdaNEgeBZDEZQmA9ZMZq6Av
         eRgnnBu8Hbv3u3/YYMqjfzMSYg4QEdWOAfeH6s1dsM/0FUpIBtT1VzNMJ7F5UnPGmcS8
         U8fEfqGfVnxEK+ZR6/UNZVfs2l3sNO5mqvemWHF49rWY43jp0yj6cldAKj93ux+wm3Lk
         YtBMQmarF0jjMBZwoEmnsJ5FFxpOegs4wRnlZn3nJ8zEQwPHfWySN9Twv6u00CJDpiIQ
         7ldGjzbKn9hGpXz6JBzk2MPhDV4F5+dIC6I9pQO/iToYJ/vTWPCFzTh0kprL1IpxB6i4
         +/xg==
X-Forwarded-Encrypted: i=1; AFNElJ+E2rcUkR4aq0eKx2N1RxGVV+rX+0UmIoa7nyyK3DD884AJuwXZgbK4Y4fmzVdIGu5Yh+5RQHuDzgX0Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyysuNQUyl7pIsgReSi5GPlk3ld2wOHxGo50OfMR/D8soau0Njc
	eXDq3d72l4jqyHyVnTvOdCU7/JuNiFmxkabFbCjJYR258zgWG8gLgs1eiBvOVDD71idh6ZkIML3
	5rJHKW1v80iHQZND27nxyGtbd/ZMpPiTYfcEl9aisn7zize4uTTW6jBOwzdqve1HEIQ==
X-Gm-Gg: Acq92OHXmojzeXS1nqziw5l57BUnT2l+jQ72K1e/9gMZqmQ1KyqNzdYVoHsfREx6EdC
	29jx/A1q0/PZDCaCSvgL9CA+o0sCyrTX/S5E8XSA67YofVH0yD1Nz9EBCy4JSlBqQRV4wAa3F73
	qlpvQFKT+WVvh++LUWrFbF6GCLKmXznEEsqUTp2aRoB0eyvYgPFZ/JP6qRMtGPgQswJyRjvkD2r
	BSQp0zhrhkLQCaaMJXRAxqAyBU8etAuAlAQHomQ3fzBCiIwOBjt5rAfbWp/upVgNIU9XsxmJ2ZC
	ragTlEpzKJQm5XxL4LEU/jqtrWI0MybA8yaIR9YpyY7VOjKj6KYL2W0AjX772vSIlK/8+7KZUws
	9r7FDwsaLNVg0Ihg6I3dQ9OFOYb3wMlHjXJjruaQhWxEIH7gUJw6/WHxKxd2lEVNrxPzmrKTbWI
	PbTBVE6sgrjaUOl5C6QPyDZ/cannaag08DmNVgdUDwHm8/+x0R/piwcEgFCHo=
X-Received: by 2002:a17:903:fa7:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c1e80f98cfmr263574195ad.4.1781081549599;
        Wed, 10 Jun 2026 01:52:29 -0700 (PDT)
X-Received: by 2002:a17:903:fa7:b0:2c0:dd75:e824 with SMTP id d9443c01a7336-2c1e80f98cfmr263573845ad.4.1781081549156;
        Wed, 10 Jun 2026 01:52:29 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:28 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:32 +0530
Subject: [PATCH RFC v7 5/9] PM / devfreq: Add new track_remote flag for
 governors
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-5-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=3562;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=i8JmP8t0IIDx2YuhJ586pU9J0+L8gn09QqoMvPwEzvk=;
 b=SjTlP3ljJexiSuNiz3k1DP81x2Nsjn02FN9iDLP4o7nw/yM9wDBLOmgzsNAF1zQPVffbuYZwV
 fiaFkBpgVjuBwr4NTgxGOi3wvNISInadO5xNeaHkiIXZp5iXDIa9ywS
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX+gWmmOpgANrp
 9bC1XFdtVitHcrIexHmYlh3+Mj5zknyR2/RniZL/BlKp8c81PCPlCkwYyHIFoVJ7uEUl6Hpn1WZ
 SFNX3O9AsVxZznk+HJqK+JAtqxXGLgSVI4UP4ANExbF2r21SqfLBXTJB4vzrwsAS548A2Mx8d6E
 t0c4wSPsLWRLsTgxuBDOd97dBrKXQFzgJ2n0rsVzh/ZIH32vJsHrjo+lBtElNfuwJ9plTYr4kjx
 qIm1ALiVfYZUd31UZqZnvgqRGQ29NBkdES1FSc2G8DR03QFwZisW2H2RtX1kzDP5ii2ZRimV3O+
 H29YCzE7EjL1bwSqIsQj5bAsZfxrSVIVP2DjPHOpGnkECaU9hAZ8K99vY8kbHDzeT3faGA7Ng0G
 HKipdMzR3SI/t8x6JZaqrdKHq3Tdr0Xh9k7a4m+23pfrfpMe0R4dxqbssWRvc9FWVeW6JtoAaJE
 L+NBH4Wjk5PgU+ASdBQ==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2925ce cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_Sn8c3TY04LLovrI2V0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: l4uOQxrSBCc0ShsrBw1URnKAffTGIqf1
X-Proofpoint-GUID: l4uOQxrSBCc0ShsrBw1URnKAffTGIqf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. In such
cases, the device's frequency is already updated by an external entity and
devfreq only needs to keep its transition statistics and notifier
subscribers in sync.

Add a new DEVFREQ_GOV_FLAG_TRACK_REMOTE governor flag. When set,
devfreq_set_target() skips the profile->target() update sequence but still
emits the DEVFREQ_PRECHANGE/DEVFREQ_POSTCHANGE notification pair and the
devfreq_frequency trace event, so transition-notifier subscribers (passive
governor, devfreq cooling, etc.) and tracing observe the remote frequency
change exactly as they would on the normal path, and the transition
statistics are refreshed.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 21 +++++++++++++++++++++
 include/linux/devfreq-governor.h |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 2f27a239e34a..71c6ced9e4e1 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,26 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/*
+	 * When a remote agent (e.g. firmware) owns the frequency, skip the
+	 * local profile->target() call. Still emit the PRECHANGE/POSTCHANGE
+	 * pair and the trace event so that transition-notifier subscribers
+	 * (passive governor, devfreq cooling, etc.) and tracing observe the
+	 * frequency change exactly as they would on the normal path.
+	 */
+	if (devfreq->governor &&
+	    IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
+		freqs.old = devfreq->previous_freq;
+		freqs.new = new_freq;
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_PRECHANGE);
+
+		if (trace_devfreq_frequency_enabled() && new_freq != freqs.old)
+			trace_devfreq_frequency(devfreq, new_freq, freqs.old);
+
+		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
+		goto update_status;
+	}
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +395,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..e4f7b6cb07bc 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -33,9 +33,14 @@
  *   : This governor is never changeable to other governors.
  * - DEVFREQ_GOV_FLAG_IRQ_DRIVEN
  *   : The devfreq won't schedule the work for this governor.
+ * - DEVFREQ_GOV_FLAG_TRACK_REMOTE
+ *   : The governor only tracks frequency changes performed by a remote
+ *     agent (e.g. firmware); devfreq skips the local profile->target()
+ *     call and just keeps its statistics and notifiers in sync.
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes

-- 
2.34.1

