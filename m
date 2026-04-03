Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8237389452
	for <linux-tegra@vger.kernel.org>; Fri,  3 Apr 2026 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207030; cv=none; b=j3zSImVw30taqZQbCKO8D+ze/AmRuurh8p7TlGF8H2JJqDDQ0ZDBSmjhn+gR8Q3rdLEhf0ZnTjIGowrJHOc/WyRJVJ4n6wTmba7QidjCDq49uanbo79hQBKXwgRlSG7mDxFYaP5C1DhiDvBsqw/jaYEh9+F/VA0lOfsvpVS17ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207030; c=relaxed/simple;
	bh=OQ5bfwpNtqKoORzjqOgKNt+gU4CVOnEO9xS4ZGiG5dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kTHeeJ/qUgdACaCc+7zF6hOGuODfGuyvNJ/R71DBEhIKeHti2vvh6X7coONVl5/zLP8YkopF7LVYe0LFPufeT37ksmC5KMSvIU0a5i7wcDLsfxpcynj0+HIBmOVg31x9D3oDPhuimbNPAKMY7X9k9Aj0zPr04rloejwBW9/qsKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4D1Hi7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ohr8nwmG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4D1Hi7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ohr8nwmG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6333AhML981428
	for <linux-tegra@vger.kernel.org>; Fri, 3 Apr 2026 09:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A512362zZQbuhvzw7LFit+apZtaCdvogNoibBWCfe+M=; b=R4D1Hi7SIJODx/P4
	JgxrBUZLfnJulQb77W8eDWqj8cyuaKkI2BzhtKoY58I9oEVJOtEXqkR/T5CBoPCv
	06L4q2FZBHcG4d7e+VFwitSBu7Qfc4ib1E42cgZ69z2fB/HJY7lcHpehU3d8fEN7
	wQWPTwjKb7Oku5nUjO0oOYCw1+eXt+VUsXOOEpDR3PtSIOIlUSf/2HWmtulRHLfj
	MqeR6gsEhhyEFZIvENqwS+yuQCKTLQf0SfLGOnun8xprvY4axqfWlS0+zvgAAcD1
	4yf3+zijJhP3TBC7C9APioDAI6Zlku/M4zIO7WFwsr4WjbyQQV+s7gBnxPmMVdbR
	yA4ELA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9tuptxwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 03 Apr 2026 09:03:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so75887461cf.0
        for <linux-tegra@vger.kernel.org>; Fri, 03 Apr 2026 02:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775207026; x=1775811826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A512362zZQbuhvzw7LFit+apZtaCdvogNoibBWCfe+M=;
        b=Ohr8nwmG7jyrgqRvRJ/DMEioZtJYrXB6j8PUvoEjczuJbETVyA6joCjlNfplfvDCQ8
         xQDW3tIZ8CBL0N5h6uO5eP0hKnbrUNEOle1KDULUqGT9VTCtALgrkwVBI9JjopqtiQ1I
         S8QZDJWNducSwmgfSvLBF2YR3sHq7opwGYVF/gws7n4NsXXuEEIHxWZ10P20l5IY9S/M
         YKqnGoLsFzFPODalb5BeJbnmQ+6tjlmaoJp6y6eM1l1TOL3t+5IOSbWfXZSL6zS+tAOY
         xGdhanFZI9k9+eS1UZQqhVLL6sA/i0TjhQ+kpIVfRTwAgODvCb+XF+kdFU0gUkLc1FV5
         Avyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775207026; x=1775811826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A512362zZQbuhvzw7LFit+apZtaCdvogNoibBWCfe+M=;
        b=m/GenNFLVARNzlXho436aS4HySmxLkxd/Z1LbKqK42Ohp8AiPre7ibw2GJ3PV93ZBx
         1HwZ5USBE4qcmtXii8hMN07nsv25INugo/lgLwwrgweYTm5Lm170W5mMPMPq8Eml0vpA
         /cm12MyD/jnPHyRdWMymHoVcKBgDxxBqqMzWGFcLVuWEM6Fqabq9mfZtsik7PW6kD6jB
         HS28lyj9tGtR/OjFsnv5NJSATjc+NB5T8/JHRvg7ZFen0iGYRxHkAOUL5XKhEHKbz6Uu
         5e/zwJrSBrCY8tL9vKJd86jasENockCHNuq2xAslPc7U4O5OTTVJqoaL6HyK/4bIVMqr
         Hm3g==
X-Forwarded-Encrypted: i=1; AJvYcCUo3QoUehQ/yEg88I06Dk5PGULC4U1rHiGEDQJPbim/txrEdG6i4YFXgnkn2q0guDv6hnlZNWaX+gMSmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr8hB/5b85rftO0Da1IHsq8seyqCABYU75f/NXqeL5wXiXelUW
	M+YL/N7E+xC+ftt69RDnfvo9kG0kEEonhgyP1fRqrsjT64tDUgO8RjkLioc5s4oI7kekNaUfPL6
	tETW69c5JrswzrkWzHCRl3wEA2MtewG9fwwzTmkFqhkxI9/SITnnWZLFyF+T8on/piqJlRVMF2Q
	==
X-Gm-Gg: ATEYQzyGaORLnrHlZLXXofJ4dmFL04xypab2jYuJmhlTWj2m6GhVkGc/UFFbl91P5aZ
	mHyrbSEs6SOR1ZB7z7bRYuNCnGrjlx1RAq7liddWBx+69s4QmO9iflIvvg/WLeq7QKfVFClI2mi
	+TFwR9GXDL76JHxF/9vAwa21tWkIP3Ds1XVjXFTL2tcM6OC8sEyPhkB5UWmi+mT7p4TbnkBNDUh
	isQk9hcIyyWMlNe55IO7a1GiYGDbBDv+N/PxzOLd+MOfbLFatHso1I2Q867GKUpg8yL03vVG06T
	kdQOZ5lOWONFf5PMQnpZHPydynPvVZSkZN+MhkzCDAFGmAcG+2rcS42zhUlp/QzYaQ3g+CzKdb+
	umye+aODoHBwC0sbZou0qVVXK1oU6+JobTckWocmLCmS5P2YOs9A=
X-Received: by 2002:a05:622a:346:b0:50b:4bb6:d9b7 with SMTP id d75a77b69052e-50d62b58b81mr30891061cf.63.1775207026466;
        Fri, 03 Apr 2026 02:03:46 -0700 (PDT)
X-Received: by 2002:a05:622a:346:b0:50b:4bb6:d9b7 with SMTP id d75a77b69052e-50d62b58b81mr30890681cf.63.1775207025991;
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b982:38c7:df87:b18f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980df5afsm18723805e9.6.2026.04.03.02.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 02:03:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Make deferral warnings debug messages
Date: Fri,  3 Apr 2026 11:03:42 +0200
Message-ID: <177520702059.10090.7671588942831580065.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401133441.47641-1-jonathanh@nvidia.com>
References: <20260401133441.47641-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3OCBTYWx0ZWRfX4eih8hG+zjIR
 5nMhp4E9Yx/2rxpGG1mmK1vPrAzS/hjsw3rH27wJOK7XpcXc/CL4j3GGa5wxUDwBb8OYfPHrV4R
 cgRa/DrUza7mJ32YjWJtkrNifDHvW34c109IuJ3BDpUSc8paHhIYf3ooCIjrjdZtYgC+LDxm/9I
 PuYbPifD6VH8Wdbtf6UrDP0yuW5UBszwDZcxM8vhlVU+mwyp4hO8y9RBd267xFfPfqvEvmFomfW
 70NgFFYQoZ9Zi2QLZ861cG1snU92wdhnUKgQaieuDWZkhEu/KdFVqxuX52/eJb/7LpYzTz0jeiw
 fhVkpIjwj42EYlVZOIdZmRNqhyGmvrNzb9HttThugMKaVFT+RqPuS9wf39tqHkPoZlNMbD4FZ+l
 W0AgqHcXMZG0uvvGofOi2yiDkx8GU7LrXSE8OWM0r8NIcxcYay1WH8C+WfOZeL+oQ1VX0BnTRHs
 km3dr2/zXpFPR/y3Meg==
X-Proofpoint-ORIG-GUID: _cKLCXBMRIJ5FpULY-oRzD3oCxEYs_Ws
X-Proofpoint-GUID: _cKLCXBMRIJ5FpULY-oRzD3oCxEYs_Ws
X-Authority-Analysis: v=2.4 cv=DZ0aa/tW c=1 sm=1 tr=0 ts=69cf8273 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-YVWButmvYyXKJA-fhUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030078


On Wed, 01 Apr 2026 14:34:41 +0100, Jon Hunter wrote:
> With the recent addition of the shared GPIO support, warning messages
> such as the following are being observed ...
> 
>  reg-fixed-voltage regulator-vdd-3v3-pcie: cannot find GPIO chip
>   gpiolib_shared.proxy.6, deferring
> 
> These are seen even with GPIO_SHARED_PROXY=y.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Make deferral warnings debug messages
      https://git.kernel.org/brgl/c/c0cd31bc3a92ac04147660a3821780f57b76bf1f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
