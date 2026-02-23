Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA97356A08
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840653; cv=none; b=TCguyYs3CAV+rZVftwJ/L6pUp5KHDtxbwHzloGrEKrC3cemAoTjXSPHUj7FUnlKhyMpn0ZMjPfGgSGiuhgHjhed1Jf2QTdREwN5q47XNOcpq/DQOFp7xQZuBEYQOdDdgTZ7qTqebiZkT/a/ayrVfLtiYTdKaJb5Ar1QpU9Jwe9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840653; c=relaxed/simple;
	bh=Tndfc3wJdGmzxvMibn6GgX0xz83LjiQ5q6RHOvNjt8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T5TKEFJIWh8iWF7RZX//O1Qm5g5FvbAZYaNaY3NPd4aoMH/eOrn2/SWkVXHdEccCJnYKCzfvbZRxbMrpKqlzD/b2pl+Pr7LweQKwDJ/SGaMyMKmSRmiyQd+KjhxO1sN6Em21pxFumEI2qJ8DS92xFAz9Qv20N9O09EAOitC7uFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQ+fu/Tc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtdK7ETA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQ+fu/Tc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtdK7ETA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9SskL949633
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvg1XiO2kFpCIl5/51S4HrNhMoZX6SHWX0qjQSabSU4=; b=aQ+fu/TcZhShHRc6
	YWU51ERJLaX3fcLZMGVLdQ5BlR1dbtBOO20KtmqqG+3k02kpr5CiBj3Bf5a7P2Br
	uETbUHkswCKwQ5qHV4etskRNt0shyXvIPyea0cXGPNiehmRXwV0Vtf0LXOvTp07K
	haLzdOimhp/okxAYw8EwAM7rKuOVn4XaN4Km5hDFWWp/PiFlAeGLF6rqqCFStXhN
	hRH3ZOKepdYYdb1Uu5FeA2hth+9LNf6MLJin2ctT/GeyZPAiW0hi/GQMmHA7yRE1
	wsW7NxWS5ZqvxFxTrKTSMgqJoh/8vmbaoo93ffFEDw9wUwFLcWNad2rEPgCRkAq6
	Ja+RUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m9sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:57:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso579666385a.3
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840650; x=1772445450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvg1XiO2kFpCIl5/51S4HrNhMoZX6SHWX0qjQSabSU4=;
        b=jtdK7ETAH5Gcuc0pw1dn2ojdxnB8nYXdzCg7fNKhaFWR6EUWJISZM727GV4BdDdjFS
         IF5tURQLmRlOld6F+bRlM/MxJBGPj/x2BC9o4Ci751wNXjhwJ/QqUjrSU4Hx4hLNeOdY
         oqwc+ltJF7qBJ91qzU3pXwtwnwPud81o7QyAX9Od9EKgtPedIA+KIk5g0ag3IV2DCdh+
         1kZ/B3UR/EOt2LtbX6ntFMVTf1AqcUfxICK7fqp/o74nMhgJDWDxxmQFHOz/08leSUwp
         QeDrYS8mktqERIcwP8vSMAcZSph7sogZjNb8Wx+S7EyfqVpBrQ0Zi+fCmoCgO0IsoUtJ
         neZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840650; x=1772445450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dvg1XiO2kFpCIl5/51S4HrNhMoZX6SHWX0qjQSabSU4=;
        b=P39he3P1t3DhiVh66/noj122Tv8N+AydYV1S+cievvAriTIkiS5RmePoyHx+xNvIul
         wzQSHEhOCOmwwOA4V29t1Wj+nfebXX6gwhfp7dHq8ufuNFyBanGmnq1sZ+zb1ohhI7Qk
         0mgR2AraP+PuheQLDW9arzETYFH3c3EMGal7W/D4i1jH7a5ibrVCqbhHL+06OOZmtHuh
         b6B0BFgU4PHaSc7zpGai82IO9IUSN9KQW+LTHSzHk/h/dckCxAK8OFAhAbiBnc0yb+ZB
         fUiJIHGQeOcm8h0lSrAhxhOpF/qOzNDq4iKKT+uq9rGQ+Wx6BTcpxc+XzsOXCP6izgHG
         YRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHgqruXeaCRlNBiXcEp3QNbIDL/5wuWHK/mwPn5olfVOkwxDRv5Rj+sAr65MZvYMEoQ5rH8Xd6xTMIbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIkKph+N4iv6gN+H90BMM/TkNPLccVD2BhsxX4VqdsospYQ/IO
	m5yvgjdGTJMQptJygJctrrRRGb1W/S0IW/IvmiZAnA/UWyWmgHEhRTtmbboVWM0FlIRZXd/JX2r
	XwPLpsQ9Nq/eyrHOpB1kewRU9XVJK4SZlQgEniCG43K4tXBO4NtHoAXRUHpSnzjiiKQ==
X-Gm-Gg: AZuq6aKInIfN2TSpZbZm/QGkhlXZr4Z9NHH9GvKLVYYcbk8FbxpwNN2RjRbfNrIyMPo
	nCs1zQxrEk9+as/QldhAPKqNeeAVvT9T9V+Ye8I8knrV9m2ATVnLGmXyhJTH/ry018kPf/9S2y3
	rVQALorT8SDly44QJc6vgzu5V1MQWi9yuDnTKMV8++FiUebJdD34N4t2cCBd9yS5Ap5tPtq1XwS
	kuWf63MW916XnDsfD+3F57gdtbQF8zYHZ33MQWoaNQtl7JffLW9cejJAEsA42TLFua+/V3M3M7u
	cpZOXFFIkSXn6Y79OVe3vLPfTVj6Op2iv/oyPPUtBoFucSRsv2+2OMZbe4yqLZoM9M+hx98P46J
	Qzv7MXrZpxMY7GCknWL2guTo3kD8FaoD9PsCjVu5HmVrljMfrwmk=
X-Received: by 2002:a05:620a:1994:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cb8c93e6f9mr1023316385a.0.1771840650357;
        Mon, 23 Feb 2026 01:57:30 -0800 (PST)
X-Received: by 2002:a05:620a:1994:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cb8c93e6f9mr1023314285a.0.1771840649862;
        Mon, 23 Feb 2026 01:57:29 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm275752805e9.3.2026.02.23.01.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:57:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prathamesh Shete <pshete@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix handling
Date: Mon, 23 Feb 2026 10:57:16 +0100
Message-ID: <177184063426.89486.6234449273578156163.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217081431.1208351-1-pshete@nvidia.com>
References: <20260217081431.1208351-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c248b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wUYQds1HYIAdow92arIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfX99Ug8T9gXLPv
 wKstCQcFxpHcKhvIiVwzt8x/AuCi4dQNolZMtiFEakELEJj5Puo1maPDTzuvuRI7rF7WSh55W9E
 7Tv809lVcN25gHphvqLT6a9i8ZUMKs55pKMX/gUZuTz75vZmb9kUlH2rzaQstKZX75r9kjnJZQz
 Rfcgxju8lGAMi43WIGUPRGIfmxSE/HCrDl3qknOs0MPtsn1WzBea+xj0gJVemnKrHs79K2GUXgt
 a+tnoLuyefX33wn/XTAn+zapwGViCueRK1T+NEv2Jx9lFUYO6PRkEETZsTse7w6tDPs7cOs1nNA
 w6BYNC2XDMnUBvQmD7YNxn6f/sDcvmfYuz15e8S+xOLGU3BQorQFGRW4Ry4IQ3wfx0Uksbveszp
 m/D0q9Imry0kkxorCvv6UktpTU/oSuQMEZylR7CKkY3rZwH4F6qdKO4ZYy9PhPCuFziE+sNgIt5
 MXqjTTLV/RZwUNyxiCQ==
X-Proofpoint-ORIG-GUID: v_L0YSgTaTQioE9o1eCkCpavJDKhlY2u
X-Proofpoint-GUID: v_L0YSgTaTQioE9o1eCkCpavJDKhlY2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084


On Tue, 17 Feb 2026 08:14:30 +0000, Prathamesh Shete wrote:
> Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
> prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
> controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.
> 
> 

Applied, thanks!

[1/2] gpio: tegra186: Simplify GPIO line name prefix handling
      https://git.kernel.org/brgl/c/2423e336d94868f0d2fcd81a87b90c5ea59736e0
[2/2] gpio: tegra186: Support multi-socket devices
      https://git.kernel.org/brgl/c/2c299030c6813eaa9ef95773c64d65c50fa706ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
