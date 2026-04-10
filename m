Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7830B53A
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804509; cv=none; b=FkVUewppcymgq+U86BMYBMO1+40nB4ZofTl1uJv+l/f09LRHUUhvy2vQkS7XG7Au4AySBn96DuWFTvO2LhrC1eW0gvgMZyfdLJVMaLJeE+kMGYjhEDZnXfZSQu+5egITG3Z/nvpUAnrIOvkM7MynTs7aa1LYhxizRRVp2AYz5a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804509; c=relaxed/simple;
	bh=5CwLK7N5vG4M/bjssokkvdOdUU/go2GwsEzzSsaUKV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHA5BNTG/DZ/Q1aIfFgNID/hj9x/nl6UHIlDNHZyXu1tePmjx3zw+91QlNz0ssLFAZpLRu4boIczcTykCRLzAaWzVZsD7YoO4G+/N4VsigOkGsDiwcr+DHmW0jWdIBJwJ9MVUe4g6DT5BF2Ukfb6taf/EueIffrFjD3cmjet/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6BKfLCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8APOXxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6BKfLCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8APOXxF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6rb2c2624739
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 07:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j3cadraVbA5x6WWtlIouIDJTFvxZDo5K1e/Ec0fRFBs=; b=Q6BKfLCEp2RDvSqY
	gTFXI9PXRmX84PCkEyvyNoIos1cKvVKNvE5E/EYkbJ1w2tP6nio7G+DKm277eY87
	SCupz0gJj/vtJ8G9N7vr7nZKWPPgkgXZ1wh91Ogux/+GdLkpukP4NWG5TgvOWEly
	0MzmmE/YJ9H6LRm8sNBVBI4/bpsZrZQsZcx/MSa685Izh/Mq0MP1CcmeXaHMFJh/
	13wsti+1G3DB1i1VZc6CbWHi7Ygy7rW6RSou2X/ZzIb91HOTDARI6/+3aekvoLup
	3bT/B78rIouR1hhJTvuxe8zGlATRAedI6bJSoZ5VErdoUIgOMd52GaR2JI9P+icO
	5gAGaQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu331s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 07:01:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-605acae0d76so2377049137.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775804503; x=1776409303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3cadraVbA5x6WWtlIouIDJTFvxZDo5K1e/Ec0fRFBs=;
        b=X8APOXxFNXjc1vRwHbhF68c8PNSlWdqJ8uaOVLr7XqbQlKdK4zYyc9CIcScwqZrjIP
         RP1xbpZjsSiNw52HU8E4i6+wYKoEydBa229DD8pvrGK8TJjRDIDtugeW3lmEORdnKDvW
         a7xChrlb/VbHWB15q+P4CYM1h1CQtOtOU5Bsb4D5ZAYBCY1YVLzQmmL3AhOLNp9W0dQm
         QjE+p1mqPkOd+3SGuWk50/luHYOTi0MagfrdwTUxy8ojfiwqjx+U0zazXaSXiqYmw25J
         eyqCVu5dNuBUhjicC7n5RsNPHlqwm8HyF1Upu9DgIyu9kFqV3FD3d0NFqztPzmSIVfNy
         /d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804503; x=1776409303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3cadraVbA5x6WWtlIouIDJTFvxZDo5K1e/Ec0fRFBs=;
        b=hgQCzTQN5KeTnuuP089EJpdkpMXQZqZ88X1vpX7st2eJ5VzFdyo8OIT787YHpGFfcE
         H2rlx4f3aQOZYJivhPaN2bBzuUfwx9103DwEG1eBl255YzHox8NU8gFxGU/iZTxJ9OBb
         pJlgvwDP9OAhEcGvvSoAcgkpP/H/J3/u6Hg5Rp1EdGMbE3BZUadpbfQySrrWxeemAge4
         gnapZq9gFVr8NGASLaXDw+8NJfaqgk5iKXhV+IRe3rZJS1kKZku2woiXktLa/t3xIh8N
         /N5DeLoW7rvOFL4gn+tKlwGMrrj1ab9wIPNjzRbIISehVKAgAUtLwuyEaPbw7zSVYv+s
         E+DA==
X-Forwarded-Encrypted: i=1; AJvYcCXHIftBNZVccXP/cxAEyb51xHruYeGe/SjK2yuf9IqdYBaSkWckk1a6liiniUoVZFaJDp1gkoSQvdvHTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4BqGzMPETBqyB/c1EIDfoOS1G6wMgURARoDRV+YNVTW4N6gdc
	AhNBCY6sQdCcFekGAEv0Z3nuK8nrP5x97Xwt0Eat945Zbln77VnTPn5y5KmiIuvocV8tazBQ6ty
	02U2Lttnzs6RrZIX35v6OEr9b1QA3oJGy4l9F0bH+u5lQ1vZiZ1sKFr+7pN22tWHf5w==
X-Gm-Gg: AeBDievIlOl2bGjMKU5XNCLSu1WJjuMqiAYKxonl3SvJK7uePMJS3MgycyTpwZjNhIK
	Y5y2RfDrzSP6d10EMRRenXg09YcgDPhTSkqo5tABH6/KmnnArP88xuFYVdZ7eUzdqZ/aLBjUUJ9
	3RZoQttZKiHhJrr4MKNqNt1l9mr02635sEKykA3RtCUw6M8Soy+6Dy1aIBgoEYvNNNHk2UeejG/
	clIMPYgn0ifMKXCZ1n/TESqGieEtJWeFKBjX1ilHMoEH/zkgtEFNWU2a1RbS5oguubmrB17EqRU
	ItTR5mXTXcwSU6iFc0gCUncl8tNJwC6J+bnYoiYgM16yYAiveBlZG3V8YiExHFBR/tm82oTi9Uz
	Rij8vvawsNENiqTjaQOvPa6cXW0dKhwijbaqPc9FC7dyqGnBwhg==
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-60a01472c5dmr651389137.29.1775804503140;
        Fri, 10 Apr 2026 00:01:43 -0700 (PDT)
X-Received: by 2002:a05:6102:6044:b0:605:27db:c899 with SMTP id ada2fe7eead31-60a01472c5dmr651360137.29.1775804502701;
        Fri, 10 Apr 2026 00:01:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm5392682f8f.13.2026.04.10.00.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:01:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, thierry.reding@kernel.org,
        jonathanh@nvidia.com,
        Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra: return -ENOMEM on allocation failure in probe
Date: Fri, 10 Apr 2026 09:01:40 +0200
Message-ID: <177580449667.5107.1202144409942234546.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409185853.2163034-1-samasth.norway.ananda@oracle.com>
References: <20260409185853.2163034-1-samasth.norway.ananda@oracle.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LnHr9fZNUtW98SYGXUozDy-dZ0bX0VjE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX2DPtqVgKrfc3
 ZVsNhsW3M5w1ibJH74kgfcfewrez1LeE6sKWZWbaFX0e1XxI18E5yo5Wyd6gS0z40loHgaR7WY5
 X/fRCvBk5rRBHFSRMkUEfdt7PGeKn0jjpek2TLTeqDT8lIdbs4HNOBKjsl4U4/6iJMf9dk7JWvL
 /EAVMeIzSqxPRglciwgu/8Z36n+Clzrsqtd+MwFCmO/GFF3/gJL9ObnEH/Du2gMACQLlc+D+ogZ
 kQpaxlftkZYlUUPNYaQadHdC2+tqJuumY7Ghq3lhG8BRH3rJV/B5xbqUsdibLkz99W6ti1onTGF
 kcVikcTRWxEemBW5DDNCuP8zOBIjNstSp/dP+6f44TA4e1NSHAq38fsfNC9mgKOufBLUDQKvnTE
 7Y2yNnjq6QZHVYViXg0lmW29LF4l5frfMxlqx5I5+8cB6EqcUDm4Ib+U2w47wZsVgqIAmSgoSKx
 G/C5W8EvVW8Pf1rvtgQ==
X-Proofpoint-ORIG-GUID: LnHr9fZNUtW98SYGXUozDy-dZ0bX0VjE
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8a057 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Uc01JgEEHFk6bR3E-fEA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100063


On Thu, 09 Apr 2026 11:58:53 -0700, Samasth Norway Ananda wrote:
> devm_kzalloc() failure in tegra_gpio_probe() returns -ENODEV, which
> indicates "no such device". The correct error code for a memory
> allocation failure is -ENOMEM.
> 
> 

Applied, thanks!

[1/1] gpio: tegra: return -ENOMEM on allocation failure in probe
      https://git.kernel.org/brgl/c/57df6923ca53b524d06d2347b896d9de74b3bc86

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
