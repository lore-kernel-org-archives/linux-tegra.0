Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27462D1907
	for <linux-tegra@vger.kernel.org>; Wed,  6 May 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060281; cv=none; b=iRMzOY6Zm+dEtS8skbAaAGrZypIltVufPFvhfOaw9xdJcA7yD9JBlzyxPhRgdu0cqAV974x+dIxEy2KZZQflYB2ZdNxWBscKLpVHd8GTDPoSTA6BZ3AKPmtZUREenTzJSFSp89LjhIsNOm//NNN9Ph0ZGfSzAbkYf6Sh1M259FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060281; c=relaxed/simple;
	bh=qr0ZiLB9ps2AVAiHqe6DE5oXw1vLc5bxId3xZMuHxWQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H2CYD8lCu5ppfhlhyuTJxNvohtl22U8oU2aWpXAyhh4TnAVAo3B4CSp66xPfnGKbEkdqlZoiHbthkFx0t/ZBgqvWSr/5WvtLDoKAbg38RmEZLUuOTLvTiKQQZ6M4rHcuVK74wN1BfnEgFNLcc4ZXv8v/G+fk+aa/sQwY1mwJ7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCGHThI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvDJqWuV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCGHThI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvDJqWuV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468Zwcl443144
	for <linux-tegra@vger.kernel.org>; Wed, 6 May 2026 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7s+0qxdlCAN7+C0UZ4qVMPuFKE1Jpl403dvIhapVC3o=; b=aCGHThI8+xqnNP47
	1V5hQbi2vxrSnRHadLez/6ke9qHEC+15f0ZL3nvu6rGaLMM1w8FO2lJsXARR9J/N
	J07NrjEedeTtwb6QWNLpRtTJRGi14GiAPFI7gs4oRf5V+ZFTxOseb1wkvHB9aqMT
	nHgf6Ey3UaFOOcBkrgEc/DzEYBYaDqZ4UV+myKREUzDWaSTPwwwk+J5udSh+XCA+
	Klksst+wugFxivHwO21f9FaPVSSc++PqDYWKpjbC0jxeRKD12EsbO4C/bm08yQ6p
	jWX1X21bR3kqUb3HTBvhU3KHUobaT1OjeYkJ3knps1587ggzoBnHbnsbPksJjZYW
	Bg9IAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g8as-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 09:37:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso144708581cf.2
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 02:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778060279; x=1778665079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7s+0qxdlCAN7+C0UZ4qVMPuFKE1Jpl403dvIhapVC3o=;
        b=LvDJqWuVNRaMWTBA1dQQmd74DsC0QdWz4ua7bkoWC7SLrLIO5LwIYy2PjxLZStqLJZ
         T62BHVVvvfQe6EeSoHFu9/2nafJIN0d8BVeUtqE/0/5Y/ab+qEq78Y9dHaNfgb6lme9f
         dMf85PhgSHGypli8NrEpnC+7N+JVZi7NVvX4q8ymnGl6b4qI34VcVtyfSppClvc9REah
         67fDnFl/S6/ELrscjjgFPQeB6B40wvN44k17/Ii09qY1cpxqnjY7feZ7RFSJLrG8AbIo
         IL4aawLgVHHGNuUABSKdr/XDQ1eDUgiu+ORMkVmwcuOCXeIIoQlx1GhW1YLx/VysoJM4
         j2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778060279; x=1778665079;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7s+0qxdlCAN7+C0UZ4qVMPuFKE1Jpl403dvIhapVC3o=;
        b=e1eGZXgKgoBfVLXKkKtQjU1+jEK2SKEv0EInpyEHmDbljUNoP5/VrPqOePzkphxp1r
         P990hjoNOHwtfSI5EuucdiDY5MG/TWSj0s0kSf4ojr144VfAb1Woti1UKsK86fQuFYhB
         OykFkhA9VMPT2+pS/UgQ4lDu5bfQFSqm1Ci8SObRfEWxVGuKnRKBKAcOHoZChr9LxTZj
         X6HyL5lMmdkbQX4ekRLRDpd1RhkE4uZi/QqWu7RW/ByJMOWVUUdEOQZM459cMxLYRHW+
         IT0nDctrNrXIKRw2WYNOcgnYOCM21Sgh1xE4CkoW2lrmb7QRPTnsSV7Qj8SBC5VFDkGR
         EpWA==
X-Forwarded-Encrypted: i=1; AFNElJ/1YCRlN7zCD5xJVzsWJiBN89vcRhkb6xSZajIywAYSz0cL4uKdU91o+yLR+GLQ/QFu993crnlZOk1rvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3m4xDGNA2GbRx+Xiz4j/t/nCx7IOfCyHr76nC9S5//gulqTqd
	4TyZlV+Iikuc7um8hW0ZbrNuLjwaD7W7bCjGgGWq9PZ+JbbeKxbxSswtGSX/X2qIcQPtyQqQyA9
	EJoV0CcHLJmyQJBXRZi9PPTjxoVYsPkIDH/S+++SBRq/na6rhE4KVzp/EDyTn4a48Ow==
X-Gm-Gg: AeBDievPoxYrbM9Bztx4lNcFgfIDvN9vngJf/m48iCaK3iUKgv1kCUe/LWgy5gqYAbc
	IKSJX7zZIZ7c6vwzu9Sjgu7n1nmb+VAnuF4YbF36d59kvqKXI0Z2WX4/rUeQJESc7JWNtuvUZCO
	WctMSJb+0MfCOaQjnPCGpr/PCsfmu04bh13/ThZzKWNK+LMggt4uhVtBM6K6+007T3fywBgPG2J
	oJYc5p5BcZubOk5ysKN2fQuh/ZRzrgrLkHD4bYjehUU17rOz1Vx2LBvR6gkXK3E+Fv6cYVFNOq3
	IhaD/D8XMgWHMai1xMQLxSoeDH3358cunKQORqj5qKSZy7VFFC8WFDWHzCgSTpbTFDcRTq1CA4W
	f8MZbxxUDIun8RK821bV0SknBwU7vY5DudcqordGduyCQIhKBMKUhfqBJPnoRuLepmqrFwIU2yp
	nb02KiAvfEdlBk4RQH3Mk=
X-Received: by 2002:a05:622a:6096:b0:50b:4337:179a with SMTP id d75a77b69052e-51461bdb369mr34218771cf.3.1778060279160;
        Wed, 06 May 2026 02:37:59 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:50b:4337:179a with SMTP id d75a77b69052e-51461bdb369mr34218481cf.3.1778060278755;
        Wed, 06 May 2026 02:37:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a547bsm38519455e9.5.2026.05.06.02.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:37:58 -0700 (PDT)
Message-ID: <d60b7b44-37e4-47ae-9af4-0c8d24b6c599@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:37:57 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drivers/thermal/tegra/soctherm: Use
 devm_add_action_or_reset() for clock disable
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20260424160019.41710-1-daniel.lezcano@oss.qualcomm.com>
 <3075fe5c-e8c3-4439-be5c-0f6eb2fb6e48@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3075fe5c-e8c3-4439-be5c-0f6eb2fb6e48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb0bf7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dtrGPWWTKDy4za8dmv8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SaUTwsaELA-67-e-qhmFqgYifxm6anC1
X-Proofpoint-GUID: SaUTwsaELA-67-e-qhmFqgYifxm6anC1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MyBTYWx0ZWRfX2gPxxJEx9Ev8
 TOueh1n+K+LSsS7DGHqlRcykhoI7Ll+yWIYSpdghzC4igqc4smoQOoMMIoox5AA1CpEFwG3oxod
 r81v96Esc+Tm6OUG4lJtHvxk+pp94aDo6S/AhYdjSWqWjH5Wx9U9Hu0O8mVbFYWXQkBlJ6DsGwY
 UxdyHDBSbNFGlQFA/edfLx6eysRnYMPLT5u3qrqV66xmb6iyJwPLJetXVBqGzvpqgQMQWkmOzlQ
 SKjV4GU26WFSAmor/0E1Le7p0u/koQUSKm1TXRMZinov0qC2tlwhom8yaIJru6wkGJMXRXGNq1T
 VZwx0M+qjndd4JJWUtDYKC/kTDX41UQVHQgNBQytm70Fl4JuH9uh1JXuQk8BZRzJHf0QDDtWb/j
 JX7fa1AlY4yCC3nwApfkg4kzI/7qs0F7K9Aax3/ehAK4w9Qp+MYd1yAwZOYhWCf+OfNtbWFZRi5
 SZkenbGAJohnYTVJ+hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060093

On 5/5/26 14:10, Daniel Lezcano wrote:
> On 4/24/26 18:00, Daniel Lezcano wrote:
>> Replace the manual error handling paths disabling the clocks with
>> devm_add_action_or_reset(). This ensures the clocks are properly
>> disabled on probe failure and driver removal, while simplifying the
>> code by removing the explicit error paths.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
> 
> If nobody is against these two changes, I'll apply them
> 
> Thanks
> 
>    -- Daniel
> 

Applied, thanks
