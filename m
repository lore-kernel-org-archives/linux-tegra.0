Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D983B9D9B
	for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218788; cv=none; b=XWnz1JLuiERBxh+97U6MJfjGi6iV08YXzn3r4DUs+7mljP/2HEyJ60Ty/3ybQzQUZr8LJ2z9rRDC1b/XhSIXhT/AZN73OlJjYBOmiS5iSDpA/GLtdhB2f4c8pQobYsXVOdQS9QkAb/+SD/FCM4yYlYLXjmMc9g9WyDSTgT32x6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218788; c=relaxed/simple;
	bh=J/eXn4jxWGAFllL8D/NqvXyBbzgywLRkM6+3tnsk9T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LinQFMR2HJibqy18hxHN9tlVSm540KHK/HWpu2Feco0wDWKtxIuFStnAz7PyZMAvAuxhHIwcdGAovufGr6g0EXwsb073s64iK3cwRL1Q0LnuaJkih8W9S0omPUhjeCce1Wycf88vm/IP5/Sgah4fJVZafqvcE7D1B+46Dl27DrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BrdENJTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvB4Dsop; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BrdENJTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvB4Dsop"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3pkM73893470
	for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 08:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vJFxCRXXAQ3TQeEvqMbHf6JZbJYgoRmy2aLFS+RO1I=; b=BrdENJTcMQ7zUFAN
	qayAoKHnVf+74ijFUtI+1sjehnCalKYJmR+V4UkmfRgZS4q8XAEyr3qeV7z/Kv9k
	e9BUTrzPz5yJlv4DiVPu6/aEpl7NyHlvf+F4dP+2jvl11VZW7uvgs+xCR40xebyc
	SwOd22pwGqSTKRtgtOqAhYAe6SlE6USa6xYSTVi+6tCt53Fn091kz9x7Cu3M1jmD
	T7nwfESm8MwkUkf+lIMJIC0268HqbsUDwDfd924MYngbnHobFNVjBVa9SRpOl2FB
	TjaZ3uyM1/PwFHVuo4n5wI1EPb3IPUJf5mWIqHbNwVmkHv73OyVy8e82oFZvbcL7
	bElvKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyuvwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 08:46:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd858e8709so3094432185a.3
        for <linux-tegra@vger.kernel.org>; Wed, 11 Mar 2026 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773218778; x=1773823578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vJFxCRXXAQ3TQeEvqMbHf6JZbJYgoRmy2aLFS+RO1I=;
        b=gvB4DsopezQqZ1V5twaEpPa0v5Q87zq3NSFGJG6Vuwex3VxBP6Twva35GMSiwrEWou
         5k/EK4tncx5+O8BCN4/8BJdemxzKz8aeEDA8b3CFTa5lV6cOjwJoAjxazsrYjc4uIXNM
         wWF4/Y5roffYoMCRUnDCKHEp1lIXo7B3b3gBS65wbXvolyMVGRrmk/bWmc2h7pQ6HhM5
         A7Ox49hA284/auh0H271JWh5x/G4xkgEmd2Rguc3jUHZZbFg/I2wYdArBpXGfDCt0Bdl
         IIjnkz6nwcNOf7dn6nJsKPMZ8up9ABYlcYVTkO41IxXSZ/T0++k5MvjXUQ/1GU5CcvcB
         hqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218778; x=1773823578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6vJFxCRXXAQ3TQeEvqMbHf6JZbJYgoRmy2aLFS+RO1I=;
        b=qFXSLzR1uV+dlLjP9hkRqaCOala0DyAAbG+ZogFpcD2EMnAfItcZoqRoXXKzdjad8a
         ya7aEqkLdTi68Ehxt/SMYyDvxbAd7LV8Vy9++2ATGr34W1G3iPiMyKrygCv4vcOWEtal
         gNjdairMCoibakClWb3wBbhS+e3MOnsm1BJpKlC3UR2fxBLeEpZmhItTD8MQ/nr93EKj
         wRcTx7GB4yDe1FSUhBTpntLcRBJLFKHU818H2hCaK0Sy1wl/0wpKHecamk5UpTyR0IVw
         7HmfQz0zYzeM289Ib//5oYlLJEM0xPAz3DsYSnHokcsGW0E5EqCpVq4mYepiHAidIp6+
         q8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXB4SKrXEt/LnoKtab0jT14orBK5jeMwhXccLtwXL1kS6PISJB5ubMXLtE5+9JdniU5d2AuWH/j03TDkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWzpnPtYCr4ZgcK0hCzQFCrIcizu0kdhzpmhSAacON9Q9AV7p6
	rrmp4mRId9nE47qv4EpfgkX+YcdRq9ETdgZa0xt4w3yP2bYFd8fsHcs3MQygYhJ/i7IL4yE+3oQ
	M5Mt9QiRKY5//Tdye4oFNkYr0PVnOu4RAudSqpnLNHYaLhheu/IrScnkGy+tI/TlYbQ==
X-Gm-Gg: ATEYQzxudugwCcvxhK+j9EpUzRqsWRgJvO0IIOeF6btS0fDOsT+xFAw0jYAUFKOGR/H
	Eb69RINdnjJw7QYU+J58Vv7fD9dqXxep6eD7264ZoaF6lxqr4iM36YpRVzEEK6jRN8XLKv3vokT
	p+JEiMVrmjOwJTTv3385x8uBipRJNjqXCLa60IHeePvxlq88sMHq9yDwfPXLzBXWUBKdi58fCv8
	vJgVKd/EcWRKS5vqAnblKJp89HcacHffEdwgVr5BamO4mElwoN5yNO5o3MERXarxCQGwJBRXoxU
	RhHtdQCM1aZMGEcJEAIoWBv4skhMI6sZaWXBtyLeN9zVnaFBQvH/nb/SHLZpYX7DHzpbluAD5Fa
	BRwLUZ0krClpLQTi4r7vL1/7sXTzCQiLwKZ5BZQ19EeE+8v3fg2A=
X-Received: by 2002:a05:620a:2848:b0:8cd:9253:215b with SMTP id af79cd13be357-8cda1a87e2fmr217870485a.38.1773218778190;
        Wed, 11 Mar 2026 01:46:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2848:b0:8cd:9253:215b with SMTP id af79cd13be357-8cda1a87e2fmr217868585a.38.1773218777716;
        Wed, 11 Mar 2026 01:46:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1f4c:200b:aaaf:c666])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81fcd65sm5503816f8f.26.2026.03.11.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:46:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, linux-hardening@vger.kernel.org,
        gustavoars@kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: tegra186: allocate irqs with the main struct
Date: Wed, 11 Mar 2026 09:46:09 +0100
Message-ID: <177321876121.6763.3562212784533777999.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309232804.331882-1-rosenp@gmail.com>
References: <20260309232804.331882-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b12bdb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LMpztJHqCLRgs0MzPDEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pZiHXGyqQltJ8F-oHQXsyp1De2nvIb62
X-Proofpoint-ORIG-GUID: pZiHXGyqQltJ8F-oHQXsyp1De2nvIb62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA3MyBTYWx0ZWRfX8HksseEBbNdH
 hoAeJo9qhPbqlkf/4/M4brQTTXM/iCkCYuEJLF5xA4L3kyWh6DsQs8cuzc9n3af8l/Ns7ciuFGi
 ZCgUDKkPxKyweogkDsDqIT6bXK76UFt9D6wY9TnmFC8kDzhAe1KjkPfqTF270YdYytFUwa0zPkX
 yEZxf+PO1OjeXn9ys23enLzypAVgmNPSOaEe/3c36KruUcHCQOUgWmQ7L1hPfLNu46sa0gtY20A
 NnS2R1Uhy3inCZRQuf+9LdDWVMkS+27cJED2Fa1zIfHlTTA/Uva/yWsAfrrY3N75HYixtsidAIq
 FwAkue/t4V9v2pi1Sz2EFCDHlQmxDreRzK3xThlp2yAKBMEorLxbQHzVkwDlnud/7ORdOBho5+g
 XrHpCqH4ZbwP74I0XkvHQTmPcd2Ax35j8qlmZpBgAaoJSPalrOhCWKiMpE1ifJylSLJ4NJ9hafx
 aZnlDKUuUfVDm2EcXng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110073


On Mon, 09 Mar 2026 16:28:04 -0700, Rosen Penev wrote:
> Remove an extra kcalloc call by using a flexible array member.
> 
> Add __counted_by for extra runtime analysis.
> 
> Assign counting variable immediately after allocation as required by
> __counted_by.
> 
> [...]

Applied, thanks!

[1/1] gpio: tegra186: allocate irqs with the main struct
      https://git.kernel.org/brgl/c/b4784adfe3aab3e74b5f7556834d87e416b666d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
