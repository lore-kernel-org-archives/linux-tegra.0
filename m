Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD9D46BF
	for <linux-tegra@vger.kernel.org>; Thu,  6 Feb 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738815859; cv=none; b=dhyAEje/XEde9E4Ro4OCTVoWN0PsEkWD0+Np1AMl62qaQ3WPYJiC07Qya4xodzWNfjOpIpmuLucFjhWICluEDUJFrKb82opoWjsI89n/+QvqA90Pp3a3Ej01CPW7wbuXMRLgwja9MI9T0qdBzgNApGl3bdrMrkQ8vDRqZTyocUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738815859; c=relaxed/simple;
	bh=x3RoQDABbP3pMXuxhTOvr017iXEkAiYBJfNFjunIDd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l9eo8eKwX2XADH6B5LGx5ISUqysLA8gOLyBwhIJwtG27aQ/0MNJkH1o8Lcwf2FZNF8sQzh0ulNaPiZ1VxAbkoXRwjIzI/js2dhEJ/0WUH7olhH/r/soe68pp3ixiPSuKs66OnaPgI4HDGD3jeF+gsaXTSw0i6KkuceEP44CpUSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8nkR86c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8nkR86c"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515ErRlp010840
	for <linux-tegra@vger.kernel.org>; Thu, 6 Feb 2025 04:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzZDnfGZLX8HvjMJIk88Bhmcd/aj0bIaFc3nWEIhLaE=; b=c8nkR86c6BC5hEkn
	06WRCLGJhjYiKrGQITC3YOwKgG2fU73gFNkFFVrEH+dTurP/GEgsT+p38xGymqX7
	9U5g4bPctb0MTuKHlzqdsGNicCkLYjxPdOmWpnCydGMxy2P+3EsfVXhsRcC7+35b
	hQjwNkV6nEVPvaxwKHomkaohsUGAJNGmzliFXjv1nQzDe4aUXd9T8DKwim7i703f
	67yKf6btiWDYi37YPQWUkzn2E3B4hKuWrrdPAa6VjhpZ05wANiZHBfm+oGHHGNb8
	1jOmWVq1W/N0uqb1SpwM+nrffrQRuTpvmc0lxCwVSdoF8FuCVTTDWWogpSB421Py
	RrcSAA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ma599phm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 06 Feb 2025 04:24:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21a7cbe3b56so8179325ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Feb 2025 20:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738815855; x=1739420655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UzZDnfGZLX8HvjMJIk88Bhmcd/aj0bIaFc3nWEIhLaE=;
        b=XEPOc9BXwC9G5d6UwXr+4aBqoY2Yn3sEJkpLH5bjE2tSKc0O5RkwakJgAENis/endn
         +v8RKEXdG3IW3IvIi6LtX3Ssm/uePR86qg36EehPxgEChkf2IU/Wxo+0aY+ny/5n37CT
         pKvvjgzGWG3wiIvZgONCa0iNPWA5UZduQht+YY5a2Lkca+IJJCYc8pQhWwmp8zL7ruUi
         mnc0AdXnnHyvPPd2dahksPYooZQcAwRzgqhob665du2V2NwOUOhWOGkDNfmuzs9PwRVi
         CLIf8QwNMxNkf+ApgT4cLt128w4gcaN1r+E5vdRhO0RKqND2IbpeMnGGTJayr9Cs/I62
         4Tzg==
X-Forwarded-Encrypted: i=1; AJvYcCVRD+rcTrp/a7IfDXOE/MJbo1OG2iSz6NgGNQOoOJE3Mt1v1oU/szrBbi5msM4IQrXbqMWUSeNFgBePng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3zHj9y05igxAmmsObNjed5cphnKbhs0xmH+ntpOr6nB0/zNON
	2Z3G2JRkQiUH3QKl31bJMkH2UXDq8YzZcdjCE0njLM9odREB6Ad5D5NK8nuBbrYHGnTASAh9dA5
	BOTKppp1iA7GUaaHlVwGihxYjzDhP6gwe4Dn1MIRFHamSaEa4rswfjCbTumIecw==
X-Gm-Gg: ASbGncvM6mCtKhAwj6XdIDzZb25ZWqXQbrchYq9c7HDgBereb9sPXfijz1Rw5YG20fV
	T9fk33ZnaZ1xEB7fOzni63LPjs8QGSw7H+dHuhv7ELXvdMelque+Xl0fb9INkdfj6mSKdd2rQmd
	Mketj5341W0hcp+3fXv2Xix5vbK9KCC7kvmW/qSoKjX3QNX3bZeIHZ9nBXqxZm1mG9c3Mk5dM++
	U0rrQe0g4qPO9lpRZj5bzYc1za5GFEDpnKLq8Lsu/HVIRixOKsI6pfJk69o3aIk/Ot06Kq+dk5m
	Amrm6N6CfMDgUJeqoAtDKl5jAqNtwA==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ede88b2334mr12379135637.30.1738815855151;
        Wed, 05 Feb 2025 20:24:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4bOrr5uUDRlCbMOWSGKN7WtxiRHglYPcsXxM0kkvRTF76K3q2h/bgcDp9ITqdP4O/UH8rzg==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ede88b2334mr12379098637.30.1738815854768;
        Wed, 05 Feb 2025 20:24:14 -0800 (PST)
Received: from [10.218.35.239] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af780ccsm190657a12.71.2025.02.05.20.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 20:24:14 -0800 (PST)
Message-ID: <33a19657-a890-4d59-b7ea-5798cf8f7d9b@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 09:54:09 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIIHYzXSB1c2I6IGdhZGdldDogdV9zZXJp?=
 =?UTF-8?Q?al=3A_Disable_ep_before_setting_port_to_null_to_fix_the_crash_cau?=
 =?UTF-8?Q?sed_by_port_being_null?=
To: Pelle Windestam <pelle@windestam.se>,
        =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>,
        "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc: "mwalle@kernel.org" <mwalle@kernel.org>,
        "quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
        David Brownell <dbrownell@users.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "opensource.kernel" <opensource.kernel@vivo.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Brad Griffis <bgriffis@nvidia.com>,
        Harshit Mogalapalli <harshit.m.mogalapalli@gmail.com>
References: <TYUPR06MB621733B5AC690DBDF80A0DCCD2042@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <1037c1ad-9230-4181-b9c3-167dbaa47644@nvidia.com>
 <2025011633-cavity-earthworm-2b5e@gregkh>
 <3d9db530-a0b7-4f18-9ad4-233356dfe68c@nvidia.com>
 <e3a457d6-092b-4b7a-9032-50daddab6f1f@nvidia.com>
 <0fa6c6db-fd75-4a09-b4fa-d6a98bb8afac@stanley.mountain>
 <TYUPR06MB621712E6A082791B397088BFD2F72@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <f264888e-6100-4812-9661-ffad174f45af@windestam.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WpdI8ipfnhCU16qhZ5VBwSqy3Ik5tFl6
X-Proofpoint-ORIG-GUID: WpdI8ipfnhCU16qhZ5VBwSqy3Ik5tFl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=561 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060032



On 06-02-25 12:59 am, Pelle Windestam wrote:
>>>>>> Odd, you have a usb-serial gadget device in this system that is
>>>>>> disconnecting somehow?  That oops doesn't point to anything in the
>>>>>> usb gadget codebase, "all" we have done is move the call to
>>>>>> shutdown the endpoints to earlier in the disconnect function.
>>>>>
>>>>> Yes the board starts usb-serial and usb-ethernet gadget and on
>>>>> reboot when tearing it down I am seeing the above. As soon as it
>>>>> disables the tegra-xudc endpoints (as seen above) the board appears to
>>> stall.
>>>>>
>>>>>> I'm glad to revert this, but it feels really odd that this is
>>>>>> causing you an rcu stall issue.
>>>>>
>>>>> Thanks. I can't say I understand it either, but I am certain it is
>>>>> caused by this change.
>>>>>
> 
> I do not have much to add in terms of solutions but want to chime in
> that the same issue happened to me the other day when I upgraded my
> kernel. It manifests itself with the rcu stall whenever I try to reboot
> my device with the USB-cable connected (it is a usb-serial gadget
> device). Moving the usb_ep_disable() calls to outside the lock (where
> they were before the patch) solves it.

Are you also using tegra-xudc ? ep_disable routine may be called in an
atomic (interrupt) context.

Regards,
Prashanth K
