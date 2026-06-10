Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D663C3B8D7E
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081545; cv=none; b=EeaQrJ9RhMkfegJHe8AsCgWJdh1QNwYg6YZDr07CwmBqWoDqjvWENLpaywUm7MczVzR+qCclLLjQvReJ4F7/NI2peffgYnOiQxreBUY0vIDRzSrm2MEv6+TZySLNIuR6uQhZBruph5CEqn46Wa3WVSqjWpwIYjV3UgdVJ+8KPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081545; c=relaxed/simple;
	bh=oOGuGhaAzrRJOgEyTlVSLrE4h6R33Y9ZkyHEdEdsbrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CA4R0I1axse9ydU2IahRTVDyYRT7Bmp1lQSRhRzRmaTaNpprPVFmtDfNUvXJTxB51z1zglvMl6Q1T+WEVFGU5PSQO7cpZPmnN6xR4Oj73DVNFzwvtRFdGlw+2BdNnuuNAG4J30jEnisUSWMKmTRS4ARyFTz890k36UeCZSGEhfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IqSlpoKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvdPs8kZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IqSlpoKC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvdPs8kZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hraD3151703
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=; b=IqSlpoKC9cWVt/ly
	c0lKq7+31n9Hnv36hhfdInICOq+qcKnZ99S6c6oJrTR4YP0nxzwV5YBo+63czQd1
	me+reUpypNNT8P/shkFp30I+0bzHqZeZOPTOJypsYDKT5DAEh1NAIv55nefq5VG2
	NJk4Z+cxn88mTWW8T2SroSYdWbQGXwF/CtaaOj3MWd3TRETz6Fw8dpOJ0l7Q+Dcg
	2zGh0pjuDJgbhzjz67wCQqNmGTLotNTAI7h1uhfGsx83HwCIYFNkwj59wY3l7AZe
	EjbdMOmnQUfk7pnl7HtDYmWWMslQuksuAyRXuGR3xfcMULwgnxTS0dZSbBaRTOpG
	4hnk7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesksg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 08:52:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1dece2ecso67051975ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Jun 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081542; x=1781686342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=;
        b=jvdPs8kZWJmoCbguIYnVnvpKKtdORyoE4+lQn/p8iPP9RdA8UB05pG/twoeke8ynWo
         pH+Y+BX6kq4075bx7H4uYnCVjLAVE7eqEVKsPv7ioduoDd3d/HgQ8sVaEO5nDJZOFHbT
         /Y4+8fBCM+90qC7D/MO5jtNTFMYK4q0iMQFsQimaGBgAyQrTsSTUZnZ0hSHWMTxJqYUe
         e0LjPEnjChwi9L2Iswtjq9g6O19LtTxNdsa18trA+ih66OmR4ALS+F1WVe/YrRLc+4rb
         1xMr9W7qDZ/7YDAFgPFBSGLnDyYBEOqPHeE5+sLSSKFBLMO4ud1xFCRkrHvmn2iFHP++
         WuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081542; x=1781686342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2hl234ksIEm1RHOdsRVt2VAQnwYkyTNif63obZpEqg=;
        b=XDpWAzC7PHd3gsHJrGkmidaRbPgCZr8vFUieKI9CQv0bSkODiFGiBDfaUgLbyubvPv
         lnOT86/EnbiqadcrEdUplxumznJnUQCALykH+2y4TXPPrj7jX6roWIeCM0GTX0zeoSfh
         eZuc6JFVf8f33vdS3PYlfUFDaMj3ej1dxCWqiWs0YkKnAG2xwGTsipx+9UsuLh2lmyJ/
         aC63NQDa/1Tve54UuZNHqFLVm0rp3oV1MqBqicQ2Uo4zI7oLK04NYqT7fW4Q2KkMpLqy
         6+xQy9nYJjEqwOWbk4l66Hl62+DDxPCM/u8GX+jwvdh0vn0JWY8zbvHk8hFjV0ywySzI
         3Clg==
X-Forwarded-Encrypted: i=1; AFNElJ8dRHCYe7D2yaFzpC2nJTpN+RgID+mm3b6m26fCpBc0UUo4e8mr5Fxp5/NhimUH8zg0BH2qDotd7g9c5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8treWE//mfLzOyLEcg8Dzk8COlHY6ofQul6LyNUzhOTyhFsWi
	zyCJKW5b+LJa4Hluc7QuzGJE53suaWKast7I5rYwQjtj1JlmRIyr5ZTbfROLSA4xsBJSgCGpUUt
	NUquEgNTM/GZ0pZIKAa1x861eRhQe0nK0tEMU3l7bsFxKmCJ3rtpno4sMpIr+EBRpog==
X-Gm-Gg: Acq92OE3UYgdqGkwDkwXGjvFSp+1GoiVRiY42F++AVY/l0sS8sXNPsdYdKhHCX79aBq
	Mt8zqj9QpqRbGs0yfbaElL73MGuM0REZIL5Jhe/sGYFXvjxH4f2OmLEqeVAkKesy9AxZ0y3tKMU
	eaizss7pvrJF/WAJVNvk7Q2pB3FhwQtBI+DjQWq9eQsmX+y5rPW0plTf+XUfidhcJh9KMwbGSst
	zAzL3GZzPH+vLCoGtbQimm9bRwTen+7+Lr7Bfynm51ZSbJUdEv6lhrVOoJOWJHN3KcYSmasG5gX
	kRTniTSnFqDJEaLWuf2CowdQ86Ybj0TvNf+8TwF2DlVwKXl/vPGlrBHmQSRYKCibUKVTnH/c+ee
	NK4VnAUYLSL3h2Yy4rxXHl2S1GsZr4oNTgQBo5DPSlykQt8sb/UeLd0dOyfoz6RXyHC0ESQg4Qr
	KJw+VRD4tF/f0HBRjZiEVaz7RQ7zbGsXRV3YRgqU0N5p9W63vsvpAidmkP02w=
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr266012345ad.22.1781081542464;
        Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a17:902:f608:b0:2c0:baaa:db94 with SMTP id d9443c01a7336-2c1e881fd52mr266012015ad.22.1781081542021;
        Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:21 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:31 +0530
Subject: [PATCH RFC v7 4/9] PM / devfreq: Add new target_freq attribute
 flag for governors
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-4-f3f68c608f25@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=7702;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=37NxbrW1EfFxbpoUejE/ZkFqRHFRkvYdYd39MI8qo+s=;
 b=W2YwkcFEZ5IJT5/BN4jcRVsu+M3gLs8KmACdb/DaAC0FZxActyPflb7dcQI3MNy0IpcPTz95u
 UBtczXw4hFBDkwsTXTzL3xmtnru2Kr0uwjm8jtUQ4lPWKylW53WgoTs
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-GUID: gp22epZmo-uyJpTANVnfIWslYhXfZnpD
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2925c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hD80L64hAAAA:8 a=WcTcrbn6WVXM4q_icv8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: gp22epZmo-uyJpTANVnfIWslYhXfZnpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX1V0bYyZBGzaH
 0LbVh1AmrG6F6wZNZLXAb39IpQZN87ejok3BOeBWF3UXijwI6EKo9FLJ73EoZjjK2lrKmIPCuwL
 Bs2uzJiL/ngS0unpMnh0cPhoU3Hp9zlIhMVKVxWJ6334f0T5dU6pdudMecyaEXi1gbWi8XUOUaJ
 s0ofoTafHk4Nz5osDvSREsQH8NrM+zQ0CEXmTxJoAg9lKqdomRzWBm5TCI1ki3WCV3agyxcCo0V
 Myjr3eeRglifw/OGVN8i9LuwDaDAkpZC4QsuMhcQKGSX5D4PM9PZ10jqCVFNLkLxhstO8MYjkKg
 4S3ath/1lC5axIJUEJXtpOW87Bn9VjdwDQX92jwAzgSBMaEI4w2FlyfF01mKCKy1SOLsNmyRXvz
 bqS3DH8kRbTP961MyEZfOTrIK71QOESnwaYfCMFO+YdvFXBmNsB6VJTvExiDMTFrjA8xsw/TgTZ
 kPC55ntQm1/5vUBq/XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The target_freq sysfs attribute exposes a governor's predicted next
target frequency. Not every devfreq governor has a meaningful value
to report there; some merely observe an externally-driven device.

Add a DEVFREQ_GOV_ATTR_TARGET_FREQ attribute flag that governors with
a meaningful target frequency must opt in to. Gate the existing
target_freq sysfs read on the flag and return -EINVAL when the active
governor does not advertise it.

Tag all in-tree governors that already populate previous_freq via
get_target_freq() so visible behaviour stays unchanged for in-tree
users. Out-of-tree governors that drive frequency updates and want
to keep target_freq readable need to set the new flag.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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
index 4d00d813c8ac..0800116e3334 100644
--- a/drivers/devfreq/hisi_uncore_freq.c
+++ b/drivers/devfreq/hisi_uncore_freq.c
@@ -399,6 +399,7 @@ static struct devfreq_governor hisi_platform_governor = {
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

