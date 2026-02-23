Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333F34E74E
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840117; cv=none; b=arV089yETUIfINSIWBDxPWukuxhq7F8Kp7rknBYbiLsSdiW2oJY6xG6gLttTYR+uSSgIIHHd0sPXjqxM0U/xdWYkI6Z/tv9JsLZjcG7S/gZ/FKLowX2BNS0W24x44pKu/Cq5uSXQOVxJNsk5cDrBBNBTSlVgXDdrOPL7aSVSPxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840117; c=relaxed/simple;
	bh=MXdD3e8LYNsZ2rkBLsxXRKdKS+qaWMeFUpfALLvAVxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0VW92m9TzsOiUecyXMjaaZh6LzziWIuzYNYYLA+GiRMSN9UD2Xtlo5jlC/KaAIwvCPi1KOaholZ/qbIbCUTzCJVtaA2K96i41rZDJrpAIuy/M82jz7tSNxLis5IwAI7phOUPbQbOOMjJD/cDoCFDWKdcaFWwZjzq/IbSKv5avI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OroHNi22; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQpWV+5q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OroHNi22";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQpWV+5q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Lmkc1198815
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=; b=OroHNi22lccLAVQK
	nJZ2qGAu+APmq7aHe+SfJiBUPhHzXwPFKzGBYBjtqbvLsiR38MQTWBtLfDdwiXPW
	YXbMDHumwqPvtvy9YUJTgusdcpnFDlR/tT2DuxGrQfb5Fl/aHYpoYk/0pueXMqe5
	HPPOhogDrj0AzoSRw9dFD4s5CDSs5V0wg3S8gwSWP5hHIJm8nVO6hrwPpyqxfuGD
	Vmss0gofubgX7joXjX1kxO6wJVRZg2jpmqoB9KvpD+/RUUlQ40Il3vo5tSUNqR61
	w6n5GTa52A8kVjgIfcfG1xiORjje5OiIu3J6bM9s1s60lrzKOlkaR9lgI8TRN/u4
	RfPUaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m86b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 09:48:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso3952670885a.2
        for <linux-tegra@vger.kernel.org>; Mon, 23 Feb 2026 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771840114; x=1772444914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=;
        b=ZQpWV+5qVy/XqBSfbtOyLQR6NhWqFtAnKCio8KNpfQZ/rhSkdP9WBopgFQkGQKQ/Yv
         LEiNNs6hNPy/7sLWbYrOQjg75l1YRF7GbR1fnBoPghVY9rCHtc0nwY6LPq3OemT9Xk17
         jPTjUDt46WcPW5cUAbcB2yGeUr6T4bUvGDZCAzwIA3SFC5t1TNxsGpyYN4VE+ZpIjlia
         Bw0/CE7kw9BNV3TA4CLmqpMJ1NeSYD2m4SECL1PxYKIx7lI0sbAmDcmZ1rHSFlGoO8am
         fo7HMqg6j209IW8OeBFj4gX1KD5S7jhSuXDbW9IpTqkCbFByQ6TISVk5XU+OZebu/cNH
         aGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771840114; x=1772444914;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iEM8cMdtJNGkyfS6uG+d6iaU5XdbvHNbxCiohXcTZI=;
        b=lFMMCJ5ZOjcGgGDjazpvxYE+GbYDR8L1MjvgVAqf9B3wEP7uYsuKLicK09NYLkO+bW
         AeMNLMP3z1Qg64Gs3sY1z35fewXNK8dUUSf40AjR6plbpqpWfNneYaRpvJnckKUQmZCv
         HFqt996u9O2s9NVeM/ts7p/nDvzU9PgTegRO9e8Ui24FKcyC1Vw6atNLcZRLIsxx+VeV
         9eXvZxrosdkU+fgkQaWt6ruWqhOm6o7AKK5FfeCLBF7QzskdSbBrU/+zTD5GF0XsB1Wd
         ZL29jSM0ti/aWNacprPk5kY/CJadgKH6v7NyANhlLcdK7fjBa6l6FJ3NlmyTyj6KFzzY
         +0aw==
X-Forwarded-Encrypted: i=1; AJvYcCUXl8XCeNm5Kw+pxBTjDtlgEQxclNybTv7UKz3pjjpzAGjC8O+SjfOf5uXAUzcay7lvy6olo560yiAkjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPYIknvruTtE/sONvnbuk8N/2vLkRdYiasx6dU8Zk/rn/ob3B
	oePO0AXZZe/VuWpYkwiAb/8FcPXyjx2/TPmMyzYyPw5In8AbwOuLjPAd+mRP8HFFaoNQQVez0LC
	UB4xj+JOeyTeD5lu025Nn1rfwWNspuQv0048HRJhYpEJ67bSdPExwhno4emfnT7q6XA==
X-Gm-Gg: AZuq6aKgh2dJXFDGbzOvUJ8ogbh+ONbpJqqV4Fgvz3RnOGm0UPKkdnAbZ603cMhf4/P
	SnINesc1bza8XlxRoqMrgS+T1NOHLYoEJY3NVxkNBCXc9mouVcD8PP1OkyIBbuZBJ3j1Syc0NWj
	I3WLosYenir/4DK54M7GRsoW+mG5opM7FCvfvX/iufLwQEqf6wZ0LUjlvab6eOGjXoTnD1E/hV5
	zba89MsVS1AjvJRJX18DODG5ZntwJiS+T59OdnzKhIWE2NCTbwqd4Aa+qHuahP8sVSuSZwemzt1
	znjTCoiO5sFBAxQtYhEgTpV4joX7SWr31BALZb0zm3Ba4WGUWHRrkoJdVkhhYhgQoymKWPbreac
	0MXw3aM5BSg1cZURFz9SHekFRQotCYDULDSTO5qmOVTaHqD9VCA==
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr946022085a.7.1771840114344;
        Mon, 23 Feb 2026 01:48:34 -0800 (PST)
X-Received: by 2002:a05:620a:294f:b0:8cb:54d6:7ba with SMTP id af79cd13be357-8cb8c9d1e69mr946019285a.7.1771840113787;
        Mon, 23 Feb 2026 01:48:33 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b668f3sm186879935e9.3.2026.02.23.01.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 01:48:33 -0800 (PST)
Message-ID: <63d4562c-13b0-4f91-b15c-a1ec03799842@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:48:30 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
To: David Lechner <dlechner@baylibre.com>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng
 <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
 <20260118-pinctrl-cleanup-guard-v2-10-bd36f681bdc0@oss.qualcomm.com>
 <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f5b38942-a584-4e78-a893-de4a219070b2@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c2273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Lrcc1p6bT1NFpwlYX9oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NCBTYWx0ZWRfXyclrk8xEAiZ5
 BS/ZahyNpYlUVzRdxa/CB9Dmqu0TyrtoRVvVOgBABnQrSBo/YBoSf5jfLdDpvSc4916+1JpBPBg
 Jjbyl6xX2as78skIjmAf7TYOmHs5cbq4BSW7fS9a0pYMVYjFTb8tLuGIuBBgqdSx8R/IDfwz8s9
 DQ1/ajVWr92GTHdRruv94JPkXkAEE2aJa9vqgoc0VSKSR02RuXUzbI03TpppFZT+uh8ZeNYPrbN
 mOr/qEb7iR/LBURCn3T+yBlowakEvuC2nt1HEvwG4elR6x3RmLQfyaWSsM00a4zuB5crOOuYYr1
 zyI1GJZwGhD3jy3iK4i7DElk2uO04IyywKEJ84oDHMEpyV7MjC6pHLoPKd3fTgNYGUynA1pCcLS
 GOPZg8gMLujnNa4afOdGve3griawl3mXYAausqo2LvtN3h4x9VgMLlr2Q+5wFBAoTaV4ptLN9YT
 an+i4g0qs0qFQyjBr/Q==
X-Proofpoint-ORIG-GUID: ObU2y8Lu0NIddioK0TqdmMhHyZz3GlY1
X-Proofpoint-GUID: ObU2y8Lu0NIddioK0TqdmMhHyZz3GlY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230084

On 23/02/2026 01:12, David Lechner wrote:
> On 1/18/26 12:09 PM, Krzysztof Kozlowski wrote:
>> Simplify error handling by removing two mutex_unlock() calls with
>> scoped_guard().
>>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
>>  drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
>>  1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
>> index e44ef262beec..bbe1cf712965 100644
>> --- a/drivers/pinctrl/pinctrl-rockchip.c
>> +++ b/drivers/pinctrl/pinctrl-rockchip.c
>> @@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> 
> Filling in some context from the existing code...
> 
> 	for (i = 0; i < num_configs; i++) {
> 		param = pinconf_to_config_param(configs[i]);
> 		arg = pinconf_to_config_argument(configs[i]);
> 
> 		if (param == PIN_CONFIG_LEVEL || param == PIN_CONFIG_INPUT_ENABLE) {
> 			/*
> 			 * Check for gpio driver not being probed yet.
> 
>>  			 * The lock makes sure that either gpio-probe has completed
>>  			 * or the gpio driver hasn't probed yet.
>>  			 */
>> -			mutex_lock(&bank->deferred_lock);
>> -			if (!gpio || !gpio->direction_output) {
>> -				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
>> -								arg);
>> -				mutex_unlock(&bank->deferred_lock);
>> -				if (rc)
>> -					return rc;
>> -
>> -				break;
>> +			scoped_guard(mutex, &bank->deferred_lock) {
>> +				if (!gpio || !gpio->direction_output) {
>> +					rc = rockchip_pinconf_defer_pin(bank,
>> +									pin - bank->pin_base,
>> +									param, arg);
>> +					if (rc)
>> +						return rc;
>> +					break;
> 
> I think there is an unintentional change here.
> 
> scoped_guard() is implemented by a for loop. So the break statement is now
> breaking out of the scoped_guard() scope rather than breaking out of the
> outer for loop.

Yes, you are right, thanks for catching this. I think the code can be
fixed with "return 0".

I need to check my other patches as well.


Best regards,
Krzysztof
