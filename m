Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D4A1822E0;
	Sun, 23 Jun 2024 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165247; cv=none; b=XRj9WIFCK0xsroya27caEDvI9k/eI8fejTZrefqPRZzvbZ2DuYG20+JJLU8UBmA/ramGcckDgfkU+20nq9XI6uEKcdXjHPQ2p0TJiF4HaxepJUDRCKUy8UAt3fMF7xpofragxczTNj5+eI7h2pyZYdrUjbWTdmZ5aUqgc/tX5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165247; c=relaxed/simple;
	bh=xCIjlLU+YakUc5fuLo9TO91SuDeY+pD0mnSf1NumfoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EdPwYelU/yHFH1vi0V7qZ7h8BmLtwtiZqmtsG1+REF71sTuDxxgvrI2TW5qw/QIi5DrkjDC4zLdDZeecusj+elhLailgPjnqburJ9OOoH0Y8QlaI8405Gw4WvDA/JX96QmkNBjlkkcCvrcEnkCkIdWw4eFT/xHZpkB2F/YIAqvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ar73IYdA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ar73IYdA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45NDU2YE001012;
	Sun, 23 Jun 2024 17:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wuhg/3cemlHf/YP4akQ9wMReIiCa94w1mxM8h23bgU=; b=Ar73IYdAsn2oBGUT
	mqh9Sy4mledIq4FxeHdfeolp93Ok6KSe/yq3QgSaUd4DSm8j9/17uwfeqfBBER6q
	JZRTzwaKuoS4Thd+Tj3FEZ8uoAO3LFD5myR3JsuZ0AmYNYDKGOX2KfJFrLZMOo9C
	VX/8wWlx/EiBruMz/V9Ms2xwKc6yX9MPX11WpeSmvOlxFFH9ZY9dbfKD8M7jWA2V
	wCGPmNpNoiyIbkSU6Q8MY8Vgv8m6klNgiTfy6nCaK98suIW2Y57vm7kXugu73ae7
	zYoUiigjQflpeZNCYhqDZ0KDk6y9tq5piZ87Fi/PNLu0NKLRO9QFx00Me9F/KYGS
	wtxU3A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqce9yn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 17:54:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45NHrxsf021637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Jun 2024 17:53:59 GMT
Received: from [10.48.244.142] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 23 Jun
 2024 10:53:58 -0700
Message-ID: <d3f5890b-db18-4e56-9768-db0382717baa@quicinc.com>
Date: Sun, 23 Jun 2024 10:53:57 -0700
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra-194: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding
	<thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC: <timestamp@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20240603-md-hte-tegra194-test-v1-1-83c959a0afdd@quicinc.com>
 <92059885-858c-4a07-9e2d-cda10c6c38bf@nvidia.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <92059885-858c-4a07-9e2d-cda10c6c38bf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GU-oAhvBn55s9n00FRVOmrXA_oXre9d1
X-Proofpoint-ORIG-GUID: GU-oAhvBn55s9n00FRVOmrXA_oXre9d1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-23_09,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406230143

On 6/11/2024 9:24 AM, Dipen Patel wrote:
> On 6/3/24 4:22 PM, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>  drivers/hte/hte-tegra194-test.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
>> index 8ee038ccf601..df631b5100d2 100644
>> --- a/drivers/hte/hte-tegra194-test.c
>> +++ b/drivers/hte/hte-tegra194-test.c
>> @@ -235,4 +235,5 @@ static struct platform_driver tegra_hte_test_driver = {
>>  module_platform_driver(tegra_hte_test_driver);
>>  
>>  MODULE_AUTHOR("Dipen Patel <dipenp@nvidia.com>");
>> +MODULE_DESCRIPTION("NVIDIA Tegra HTE (Hardware Timestamping Engine) test driver");
>>  MODULE_LICENSE("GPL");
>>
>> ---
>> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
>> change-id: 20240603-md-hte-tegra194-test-668212d1420f
>>
> Acked-by: Dipen Patel <dipenp@nvidia.com>

Following up to see if anything else is needed from me.
Hoping to see this in linux-next :)

/jeff
