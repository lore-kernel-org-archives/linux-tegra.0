Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEB2701DC
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353274; cv=none; b=TQlt/YsjZKIQmNU3A2QEMEz6pN8iUDW0FVd3zGUYUKjsohFPYx8GOSFbYcqP0DHCtsD94X+UfK3fFPwg/3Di7sdZsUxQ2oNWYcrjlx0jMKsmbsK/BoP8TGJ0/lgMV8NTyhFM5674NNvU27uskmJJejsjAUENIJHeCO2kU7r7DE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353274; c=relaxed/simple;
	bh=E8DFODlJLJ+y3VSSXotPZr4NsjZCHB3Ts21MsBOSvss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ka8QcstXXX+evzr/ANr0Oh/UMpM+wI17Mu/9hJW7djNaBtxY4d8zAKD8RK6u9LKQojPsR3CZ2yAHbMWtzOQc+/+5qIbDSyOP9S0wa1SAnZWJe4bKksDCXcTsDrCtYmVvLFhSRdFMf+SNmB25l4PtSRUBl2YjTON9fYhrHPs5g9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pk8c94Ni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioqtMrxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pk8c94Ni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioqtMrxR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6kw2g963965
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 08:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uK+4kn8AO+bpharGD5GrnEb11l7R/4dOB+PjjNQevu0=; b=Pk8c94NiStWS7FME
	Sw1hbP7ugy8wv4Kjgx6VKPG+xWOUnXFA7PCO+UfSkyupCIs9HP8JIUt0Tkle78bj
	y1bZ7J3uZb1oHnOpAqZqNtqIt/0OtifolrgJQQBtlxvDsQIz/b1M4NOzz1iwZ0W7
	3bZFr0tpMEwNFTdyA32oj7kjVORwNM1BcH4SxLDys9cfBvYlA+bhrpYGsbYRy7Hk
	8ZyGlqMQJagk4tE5Xjs7qgei4CWp6a3Fz/CaRD6uv1dTyvxUzIIz45EAlCI8eFoJ
	3myBYMvSkhaMw3V8fcQDklFhbrDLeYLlagEhlYhlyLjG6vK2U2rTWoYt2gVc0RqS
	dg+xIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh3xyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 08:47:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516879bf1a7so158473091cf.1
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353271; x=1779958071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uK+4kn8AO+bpharGD5GrnEb11l7R/4dOB+PjjNQevu0=;
        b=ioqtMrxRM90dKeZt5HjkZcBhqcfvyaJoJ+LSiB3GNlKFRZexQt8qH8ehlMH1aqveUp
         sjWiBaSEUAYaWLkoV87VGknKl8UcwIWq3sb37y5uC01GA3HLK2yYCfB1gWGnTfCjQyYc
         qM0GAATgZW5Uu7hgyD5XDDP4wrdHZ8CDQPpGJlBZdDIHltAxMfEMEUBUWqmbrtnYLdYI
         0OhYaMqXqPVOVaR8onc0zbXPtNO2/1DstsB4kUGXjfp07J2fQ+7/NvYgG0GEFGi5Xyjo
         cZ+jZW2WI+0loNQKrJ/7KXbnZnyi12zS8uUQ8d96N3kh3gslaDZOFnJv2c7Q2GfmdQ0G
         5c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353271; x=1779958071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uK+4kn8AO+bpharGD5GrnEb11l7R/4dOB+PjjNQevu0=;
        b=aYuhkRnzAl5elcRO8URVpw1D1LqITawWHx8XsI/dYh9WevEY+t//29jnisw/i08HVx
         4L7H1QyvmcWb7u3B1aZv7GGhWaZUT1M9oDnbAwlGLzEBkkdzwaz3bufr1vJQNVqQVAWh
         V+h+sUlHeiPPyv4usuxUuAnh8ntdXPezwBt0i1Yci1/GpZxmhKlJ2yfkUsoklqGHBM5G
         OK+Gn0Xts07tTBJFEkDGOSG7Qlr5fx50PfdRQCjETws2K4ZLzfPtuk61rUADRQTxNjQe
         GUUg/qPYkZXb8ljKo+t0f2VE/Lnaz8KX62fygLxw+hlTrd69HzYPEgR6DuPYa6BafBTf
         aD0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/TN4Qf/WlsBFaY4t3fUDE/duyUcCjtMOg6yRQ9voAqseDp+vHHFfF3SjM8g+bLcszbipD+TBffUGywnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1OS0b87pNnjDlY0qTGkXlfbrQgg/Y3UzIxiLA+5m0EAklRD9/
	F9iOnyopWPGMHbBDtYpbTbHV5hq2IC5Va3hn/fEsHPg69UItRzLar2Zj2ac4F31Ud+CIhemxM00
	gwwWK0VX4LQtneRP8fteltFBuhtdr7G9XjIkkwCgXGQkoDfK9VmGtOnFeCO2uGrVzTg==
X-Gm-Gg: Acq92OFCxDhGCK01lcRZ62sgWl1V0WgSJb1qo8/2WdJvYyf7bHgdlN9OYcUqnJ2PmBi
	VVS/d6rsywTpvWE0HWZYS66hwaEklgR5nncIIzhZscU0dSjlovre2zNDst9pwx0EWlrVuaYcXsu
	WG3CTUK+5MiXa2CzkoYzVBnZE8Igqs+LJcgFxDWGow1IXEdLDU0hDBudHnaBMMO8DbxVjIVKBX6
	k/uhec0jfQgPCL+qkPrAWwBhYFi+3k1DqnJTggIX7UCtetfcvaRfT6MZWpGPekg1EL28kucAJ98
	gLUcwCSRWNZ16MREoq8FZxvHjSYeSxV2UWFtoTxDlxvb7Qr2f4/+AERB5nAoYfaYxRoglUekloU
	5j3WLCgains2thIie35dgEcw9ewZ9x8yy55j5vRnYKnA8Lynn52DTC01zYBGN
X-Received: by 2002:ac8:5a93:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-516c55d240dmr20382781cf.23.1779353269576;
        Thu, 21 May 2026 01:47:49 -0700 (PDT)
X-Received: by 2002:ac8:5a93:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-516c55d240dmr20382641cf.23.1779353269178;
        Thu, 21 May 2026 01:47:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92dbfdsm1092093f8f.18.2026.05.21.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:47:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, jonathanh@nvidia.com,
        thierry.reding@kernel.org, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suneel Garapati <suneelg@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: tegra186: Enable GTE for Tegra264
Date: Thu, 21 May 2026 10:47:46 +0200
Message-ID: <177935326423.17476.15579318210410721861.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521012031.2003914-1-suneelg@nvidia.com>
References: <20260521012031.2003914-1-suneelg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0ec6b7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XCSH8kJi7rWScvbx_esA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX0OMp9HfbULCB
 z7BOGoffMOE6AGY1YrYYpa1k+xMDc044xkLhmUyyMsVq70aARDaX83bprG7bdEDbHVpQ6hIZiT4
 b4DvjTpMOtmEgT5AuPs74gQREeBMFS1xZKY6NRcyLkYj5OfaITXc49Mt7yypG9OBC+ds+dYzSCl
 g4cwUla1EV+83BfgHMKiAufzh1IlD0p6XU2rn8uypgA12I6sui7rqCKUg+GpEfGfq4lJU4qvClo
 GJvbColQyiL43XFs2MOWXdp7FTfx9bhc1RldWC7ZjZqOpo5XrzTy0foD9PFh4A14KkXzlfmbX9W
 lxz4As5Z9WMMQzOWpSimplw8eK9pPYEGgkUUviByb6isjHLAgMDTRoOThCKA+Go39j4OG3qOE5P
 n4st+Jl7VTEeCoIqIzUy5BxPIxkbgOL+8s+NFWq32J2RQzeBe55A5tjbMq0sdaWpP5cO0elw/ha
 oiUBqVFioq4hrNs/3Yw==
X-Proofpoint-GUID: MnK56YdbPiMC3smkV9dKHopGCVKOcYb3
X-Proofpoint-ORIG-GUID: MnK56YdbPiMC3smkV9dKHopGCVKOcYb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086


On Thu, 21 May 2026 01:20:30 +0000, Suneel Garapati wrote:
> Set has_gte flag to enable GTE for Tegra264 AON pins.
> 
> 

Applied, thanks!

[1/1] gpio: tegra186: Enable GTE for Tegra264
      https://git.kernel.org/brgl/c/822878aa1737c6c9573e05c5cd501b679cf5ea1c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
