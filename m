Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A03B52E7
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818866; cv=none; b=bRRRTd9WKGt8hHqk+vYnzI4C/KXABpd4z+CdpKjvOjwH/TXB3eqUtkjP3HhchZFOJZsPGSYJwNcIiBF/MtmVTGNKlsE/pmlF8V3LPhm456uhKoAGvRnK1AMjzW9wZcUyoHGv5K1sH1SXf135wpEi6oSvGSJQkunhTfxMmXHsUgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818866; c=relaxed/simple;
	bh=6wI9cMZAo2npTuJOYKZetDzsYNbkWj9//2ujo3YHFU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MjobkKWZl6tXi9sQPaHSb4icvCK2OGgdHECBEGjyGtvjeadKrV0Uk3/W75JNt6LZm/z+aTJ1blIinNXWIyFRHVHVMYBZYW1YiH8yc9RkC2kdw3ffyWgF/ciy9w8CltElnbIuoe2q6zmTiR8+0QN2+BCwJMo9Xma8mn/0O2as2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phits5Y8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPsM4u6i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phits5Y8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPsM4u6i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAjeXv1925716
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXew227V6g8SGJxO+3ueOdrfFkheSi9hI9c4QCoM/TI=; b=Phits5Y8ooTczj4O
	vvUmCNqgrAHGGXza3ZVA6oLBXo66NvwZrZhOL9iKeVLv90J+TbVYm/k4JhM2IVpz
	rja0LnasFZA+QSe+DLZcg86nk0gjKHDulX+vgf7//9Q+O4WN/vuP/U0KKy/KqTp5
	TRmkgP1jvTaIJXJZBFjJqsXg+boXzUbCc60fgUkMVlgdx+WFx7iInxOnuCJTcYiL
	Lp6rS/8D/zFzgu5wkjh+ZRde76UTue96r3kNHhXyKX/tXBW+JE0aHS1mmjP0TKhC
	WMMbeoaLGfa6zj70QmAnq+WZLdM1OH3eCQT+GhqEnRTNKdxnY6bxYvp2yvfnAmdv
	bTQ6Cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjs3na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 11:01:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50dd17a71f6so15549091cf.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775818862; x=1776423662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXew227V6g8SGJxO+3ueOdrfFkheSi9hI9c4QCoM/TI=;
        b=jPsM4u6iIvWmlYSEllkM+9s7Rw2TRhLJw82vsnIFm/sGih9xJdmM4PXVIFeXsqGcr0
         X2TrltmMI6Rqb1yv0twBS+GtdlhluBHuQitUUc667+7XkX7+Gje8EO9satIKycmTLM9P
         rh2HEZBHJCk1jqd9uZ5wlQhGFGgGIKgWymXF+8sJiURC//r8jbXx/UyrKKkrVCnB42HY
         UExVDigiXSWANn6Vnx8xk4Ba0eqVXaQV2n95tjpV/YHACu4+ux+a87jpWGLPX+edszUA
         3rwaljJnbPaF6mAnu6mCBpoajk4LGGRQbBzOOkgu7GCqg3wElZcprbmhRzXjdgTMg3Y3
         dzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818862; x=1776423662;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXew227V6g8SGJxO+3ueOdrfFkheSi9hI9c4QCoM/TI=;
        b=gAgceBt+t5+RVUgH7rcf8kMlpzrZW/vYcMgCWMiVyv6pbvvcblGl8I93uO2fFSJK4d
         kegcFvTIzPeUajgZtibOWemY5GAG+/C8nC6pTWjn8r2zuLDAn8c1QUesi2GiYhO5pT9U
         7bWAP/cZb2985RT+sl4akJgchm0tWT5nCkw4Dj6SxDZdYOsqq/cUyooXKwyqDu9LmLwm
         ThF9QYISpH/HbcG4myGPnvMexe1O1regaK6C2Xe9YokTVLP5GoS341RbCahwtSuYTx1e
         e661+IA6RFhg/TKuv6RZSuq/cuWjXgE4oHuG6Fk5jC+H1myv78QM1WUTlyhzwWa0rsRH
         XWew==
X-Forwarded-Encrypted: i=1; AJvYcCWpsSWuVH/F7vlZHHv58rnVjV8hLHrwSAisuM3Fk9ewUNodt7OeMNOufjBcR9AnkrscW54j4cPJcxQhRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/a7sHa3FZJCJJcJSZ+QioJdwQGInSnmNf+V2FkdmV9NVy/KL
	8GyHhi0rHyhBv8BsmZcpR5CYLgHnZ92aBg4GWK4Og5OdIZzswgLR7iOkqcxCduqM3qM3Z/VvZ38
	j7lT/cD44pAtM3RIa8oufCuyk7nHrW+spMltZmZ0TryiRD0MZ7SGGPVplarlCApsKaA==
X-Gm-Gg: AeBDietd3gjDj7gp1AadrNwNJ/06wuplrGEOBW/9AlnH2rcAZMHKJmyX1iGLKLmrx6C
	GtMiZJh3TChiE+d8liLQ1yqf3ZsN9JHDZIr9T+aQVzHjubpBY8AT6Rj//NWn2qX4sSHtWoccAkr
	4OQtYsSqlU48NwmWUrY7u/YAfan5nWZ+Xy83njlWjM6YYNtFuGeKHPRoiGtZ3oI76Z+v81BOGoR
	2p8wElxYAEJ2wTnU+Diq3eMaut1lRiQdkv9UAvUgVRNI/STwsXYZQH0BeHjdbG5emsT7oYdkzwB
	ArUM/l5JmGAw/rO1IlN2j0EmTsQ2T3wzppmMQdEKGIpN9dMQ7KD4Vuidu3ZFwoXl+I1paL5qS1U
	4YSW7XThA/JNqfR98eRVLoP8V+Coz/1/4OgvpLakpqg5tRt5t
X-Received: by 2002:a05:622a:150:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50dc1b85089mr84213871cf.37.1775818859292;
        Fri, 10 Apr 2026 04:00:59 -0700 (PDT)
X-Received: by 2002:a05:622a:150:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50dc1b85089mr84210741cf.37.1775818856787;
        Fri, 10 Apr 2026 04:00:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dbcb66sm18714715e9.9.2026.04.10.04.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 04:00:55 -0700 (PDT)
Message-ID: <b7df6bb1-015d-4651-a439-d89ee0e03f04@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 13:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: tegra: Enable easier compile testing
To: Linus Walleij <linusw@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8d86f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HSW5M3-sS6Q-1782CTEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: CCSMS4R7v18eYE7-8y6bwceN1Mnc9p7Z
X-Proofpoint-ORIG-GUID: CCSMS4R7v18eYE7-8y6bwceN1Mnc9p7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwMiBTYWx0ZWRfX1Rk1SM1UI8uF
 HBBe556Q65NM9CV9CoK9qqV1dY/Pi978io/1ZW1Z7QTo1AlnHK5G7W9yukEfIoarFafWYFB5x2T
 f4APqLInRttNeSDAQyxIZ6LXbrFicfFYMQVnLmU63SF7MfHO3eOAUfXQYvhYWGH0ESqw79YJWSh
 h6LQiXYZTwSGqkQEiaR/Og3uj/RFBErHsFyVxNQrPo3vGDrN832mK4XpK5mmD/OsMTyyXzxH093
 Qm6KjERJp7r3iWwBWfasjAj0OphmzWoA7ZwSnZ2GSuMfAGd/OqxsQ4c/EoC/6fReIrDmpiHtsw5
 guBdb7YZKdDO7obp7wlZQCpv3WKRmTtZVCXgelTeU63yGnVaTsbr1m5pR8frs+n7HddzESdXN26
 ebtqM2yUvvRQbKBuuuA1LCiZaeBNPyEqrPKE/W6MdePmdshtysJlKEZN1EurBCrJwqGsY04xOmh
 mZmm9oxNiyieUaatcEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100102

On 10/04/2026 12:30, Krzysztof Kozlowski wrote:
> Currently NVIDIA Tegra pin controller drivers cannot be compile tested,
> unless ARCH_TEGRA is selected.  That partially defeats the purpose of
> compile testing, since ARCH_TEGRA is pulled when building platform
> kernels.  Solve it and allow compile testing independently of ARCH_TEGRA
> choice which requires few less usual changes:
> 
> 1. Descent in Makefile in to drivers/pinctrl/tegra/ unconditionally,
>    because there is no menu option.
> 
> 2. Depend on COMMON_CLK for PINCTRL_TEGRA20, because it uses
>    clk_register_mux().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Not extensively compile tested yet. Pushing so LKP will pick it up. My
> build tests are still in progress.


I tested all of Ubuntu cross compile environments - arm, arm64, i386,
x86_64, sparc, m68k, sh, s390, riscv and powerpc.

Best regards,
Krzysztof
