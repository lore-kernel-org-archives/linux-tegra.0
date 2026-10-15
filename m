Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0E499F06;
	Thu, 15 Oct 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050309; cv=fail; b=jWStHFXk2lYOzwrZvILbnHbdyALxEHU0wg+bSb8W/yCYqCzjIhHKQju53x8oM8DkkQxnBsFw2GBXXq9VaBQhoxUxyWF3LiQNtw5jBtP9ywEJMBHThaUnIY8bGo6CGL+9o5E7zlwcvNBNMRRjvqK28kVVnmc1/9joe2pW5c8jmJE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050309; c=relaxed/simple;
	bh=cDbDwICgWMUga1LrHYdpjq4nsnbFmnJdk9YQaSxHB24=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n9NeffPCYahSpUrNIejAkABUvEJBv1OkiV46qssV1+YUKXPHNK+K3LqPaH0nR6OONPZAy3dXu9m72D7Kum+Pb6t1aMZDvpl269Mw0Atr3Nq7iWZ2zPrDyL3D5Aj5Y/GIovoBwpKTKzPhoTP3lJOkNgwkLViFGvTLGL7Xw82mGos=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F9F5TJZw; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F9F5TJZw; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F9F5TJZw";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="F9F5TJZw"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A8E3aQFyHrfTsfaYdkTgT7OAJG5raXByXyN1nF7MbkLDTrE1lRdK10sUReCCpl6ChkjqLnjhR5nFCDTa8f1jaU3oCP8fida2Lr7+qGBH+A62DVr9TWKWUPCNV/HNVwt4TMOhqQUtMFIcsiqXq6CCr7zAW4NMMHBNgJPEuWTkfj+oD4ocYqJ4Wgi0c+tI0nTwOxRhxhaJGiSkHfza89jWOUf3/ppIO8ybZ2TiOzGerU89HAIqITsDBeO35mACiT7QGIMmWyULl3lhmASGg0iHq4bSxrzLQ6aHDXJNt1+sY1BuPpmI/TCWdtnm8QyjttMkBx71BBPZZ7juc656R6KNMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8DBi2BFsMNQDEz+bZomEKr7eQA3crxmgei98Zzcz6w=;
 b=cp0rphZiT2OK2GL+EggpVmPu6OsVnXQgQcCAVh0GtKh+AHPqoBThFdSamKH55OP9EF2nbTBbgChoIu5Q+Uov93Hy+w89DO9okjF5n75bqUdjnYppWwRoYs/mc22b9Ob7lAfU1tz5yMl53nnfmTqkFd3LC4YcDxqX9zatYjXu++GQu8cfDbp8iLDMxzcKcpdhonX/o7UnQSpMxjZ3gnzF8QONQr0xFBJtmHF7MJ0gN783LdH4PPSaQ78SxP6XMlaN3K6Rz5ahpLF/T9i1byR3M+YJW59seIBv6Ft3IyRFtzWUzPrHLBfFpAAFRJZGsVOuNclWYri6atWNMBagViBQjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8DBi2BFsMNQDEz+bZomEKr7eQA3crxmgei98Zzcz6w=;
 b=F9F5TJZwvPD2PawB0SyWuIlmSqtGoGqqMk1COPusw8IknImCGBrJiBUtMihzaDQ+uXoMmOFrm6Gfn09xCKtOCecjoFAfmwpir0giNvfDHVqJPzSDPSLL8feSARph2gRxTpfFxZc1zF8ZYgx9RfysLwp5IuPQI4m9gAT6Je4z3q4=
Received: from FR0P281CA0216.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:ac::20)
 by PAWPR08MB9759.eurprd08.prod.outlook.com (2603:10a6:102:2ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Thu, 15 Oct
 2026 07:44:47 +0000
Received: from ZR1PEPF0000E464.eurprd04.prod.outlook.com
 (2603:10a6:d10:ac:cafe::a5) by FR0P281CA0216.outlook.office365.com
 (2603:10a6:d10:ac::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 07:44:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E464.mail.protection.outlook.com (10.167.241.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Thu, 15 Oct 2026 07:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMB870rvj7GUjagYzR2hv6cKmsIWu3SV/5r6leDXBHBwh8LS5aZFjuo9YXGfbCXkk9V99BokiA43qDMeIIxjayXdeScS7x9zp3xMzdUycHMzJ2s8H1XtVaLdSOJV71iLB5xk9euCx/0OHYDiv5sNC/ZugbthxQosd4AaSPcRXZdBbNi/G01MyMJaG0JbkDgWV/O/rjLRelzmKH2Mbu5IfhNI2yMuE0H3aY+wXYF1haCEYdyYwT9Szvv1vs3OSbVXrFHTbg+eJd5Z10qHFzyQ+qzQugx6ezvw28TMtPPWSeKCTxaJJmV4cyZ+1yfCXWur726EmQ8p+VLHIT9ue/ayfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8DBi2BFsMNQDEz+bZomEKr7eQA3crxmgei98Zzcz6w=;
 b=f/n+Nw+z5xrAOKL9d53/o0jSYoy+R2OsRWARwAeLSW7NfESV4nYe+x8G+FKHv1EBDcEOAoX5R6zFNV1hvpJ+vwzN2rA72LYV0lLmOx+lyYChS9ov3iP4cFAS3vtFAPq15fti3FYIil1wX2fkBe6HJbl2UyZ0wRvBBAuXQEwsMY0l2eg+bH041TIM+M+ZQWh0OPs+jsIAWSClYGORt7LmPkmx63sOhEdhdrhEHC+u+ko4wPYhOJu0Wlik0MjrtyXgZmqNGKNVU7fJ4TuYyxRmxPR4RxOVO15hBDUfILKpkryuQCx+vuOAh9vBq8mB9WWf3bqBDCnIQYETOM94df83Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8DBi2BFsMNQDEz+bZomEKr7eQA3crxmgei98Zzcz6w=;
 b=F9F5TJZwvPD2PawB0SyWuIlmSqtGoGqqMk1COPusw8IknImCGBrJiBUtMihzaDQ+uXoMmOFrm6Gfn09xCKtOCecjoFAfmwpir0giNvfDHVqJPzSDPSLL8feSARph2gRxTpfFxZc1zF8ZYgx9RfysLwp5IuPQI4m9gAT6Je4z3q4=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DU0PR08MB9509.eurprd08.prod.outlook.com
 (2603:10a6:10:44f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.10; Thu, 15 Oct
 2026 07:43:56 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0546.006; Thu, 15 Oct 2026
 07:43:54 +0000
Message-ID: <c0c04151-1ba9-473c-86a4-e066d6881858@arm.com>
Date: Thu, 15 Oct 2026 09:43:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] cache: add SMCCC-backed cache invalidate provider
To: Andre Przywara <andre.przywara@arm.com>,
 Srirangan Madhavan <smadhavan@nvidia.com>, mark.rutland@arm.com,
 lpieralisi@kernel.org, sudeep.holla@kernel.org, conor@kernel.org,
 jic23@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 Souvik.Chakravarty@arm.com, treding@nvidia.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20261013070205.3566865-1-smadhavan@nvidia.com>
 <20261013070205.3566865-3-smadhavan@nvidia.com>
 <23e9b66f-083a-4a77-8214-25f30c08057a@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <23e9b66f-083a-4a77-8214-25f30c08057a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0019.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::6) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|DU0PR08MB9509:EE_|ZR1PEPF0000E464:EE_|PAWPR08MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: 429c23cf-62a9-44f9-8440-08df2a902f75
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|6133799003|10067099003|18002099003|22082099003|11063799006|4143699003|261009223027099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 7uJUjwC7gel7mkfW6R0LWgXyqnMTW488+Pxw2fY3Zq2OaQavRoXFyXD8/eapX7RLn+1isCxZw6W26h0nOE8KXVxm3PeBs+CfD/C5/ylK+4o5rrs02RgZBVnWBF+S9owhfFYld9yQocmCWNQf8yb8oxRU/B21lCG/ZVKD+JZ9wqyOGvDdjNHyEFugmKojUeRoWDsnLhA76aaqW96rVbm2XJ/EzUX4hO2NO4NTko77nGNbljEX1EpiKyZ/7ppFWWlRZLqJ5ZABUfiRViqIIb9fPpQD+P0O+6ZEf9y+5y2NnPzi9wUqiiFbJnSuX5FfYMIliD9RIAPIt4zOqm9IF7mZzfDAfFYYbg5bNDH4AoRS2Fp+Onjsoj8sbL4SzH8jYEcfRhjUxZN9CFvWStpxGPn+tBzxxBEZz8pSBBX0eTiPkrtPpQUz+V1djpdb66EHT3OtYZ0xAmJTzZV+XAESA6SqNR/usEvr19oX0q+NnICq+Z3juZPy65C7DPVHnmvgLjtY3HqDcplGZ+meX3ZLf3y0/FDSRpwbtZYM+xImQWcVU2tOgQZ7UxnHIe6HMp66BrP+gElxUpfpaeVq9FSA8AGHn/+HakuEei8iNtt1HKkrSILBNdfCdm/ir9HW6cs6SNG2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 y1o3/ZZSsiuSNOWYE6pESyzrs+hPc4lYEBIVU3MYgv0fR7xwp0KLTAs+d8L6BzCob98/zIV5pXoS+HXPOoEAzzVpsmGeawPxOD4nZGTexeqK+MwAX3dnndsVs6OQ4AlHuoQrQPUeQqj+0Qu/NM1iYRtNO23mu5cuvCY8XJOnHit30eSy/yG8Eu4P5d6+ohjVeiY8MkUAgGxYyyBS15oxOEsvS1YvRLqbmaj7IbDa+5Qpg7fYcm+Ns8HVHn4EA0/o6IYdRe3+aYRIGAiz4Ofog41WncXiY3HvmOpe8/3GSngFbcLej0rOMPUol2v/fHKAZ/8n+6AAHhJ6+ceiVIDT/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9509
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E464.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b8bf125-5c11-4a89-01ed-08df2a900fec
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|7416014|35042699022|14060799003|6133799003|22082099003|10067099003|18002099003|13003099007|11063799006|5023799004|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KEDAbBAYmQVI1snONl+4UhjbBriGWy/axG7Ar/hPX7xcbHVBxNKHi4CNOBVeFKr/XV0WV7dx+KSdsdumkIIgAI0btflRPiFf9Bka9OsxnN5g389VTZN+cfdHD2I+xWf5AgCIUfRD2hJFN7cr+x5rv4iIQtzoqby3dLP5QxNHGDoZ3ftffCqjNKTEA0p/FO9sFbfjp06R7XKOahij3YIt+wCqFLEsVtt26XTSLcIHG47f0aJV2Vd21ikqRvgmNl4RoHYf3Q8QAbD70PgFngXNHi/penOirepqS/P6omMbYgdytp29btdc7Z75bkjC0mZx2tY6a+2FK/ENmzv5OXyarxT+ZlinWWO3IM0a0rCB4nvbS02e//tGoqsYmb77d93CeBNMpOTh12xB11i6oWRxIyeC4nv6U6mjCnnaiJA8lVpf5whey5dsyXjEPuxSK1Ucq6YgKZJ4l+YIXlmvvfCdlmhSoui+JDvZI2KPuNZKbgCpDJRR9dC6NObx6R7CpG7vxZhh39zXuszRaka51+qH5VhEFNBOYm8n8z1w6pJ8VbK6GmHVyXpHzfwLsSFiY69dN8r2Kr9I5Zt1Qn5NURjkGac2k6lXMw/tl+6g6USoedn3NjigG8sDZV3n+mn6a2Nh+WUtcOTTF3fdUoGcxHXnUUIDE8qFelsZcIENxAdRbd4=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(7416014)(35042699022)(14060799003)(6133799003)(22082099003)(10067099003)(18002099003)(13003099007)(11063799006)(5023799004)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N9E+Ion7kWcDR8APq6Lpl1M3mym2GHEmCxQ+86J9yq+OrE37lNTZ49qEEBfMHfc5Lbtadi/8vXaTzD4ArrOnZZUYwV+M4NiSpYw0fxnoBG+Ls9X7kcAB0/M+o5vgCCZHk44MqO6s4ygTkObjJkI9/wOvJa05M1M9j1U77kI/F4rcosaAZ6V7O3PqUVT9STEm3dY2JaKMHetpBARY5jRP4VCQlvFJS4q9FSJ1QW6sLUH+Q7P0qT8KVvPxTSEGqFplJbpB2RkvRd83l7GkHV6gSIe6/JGRRfDPVRmeCJQeBQSeBdAyADDoefHxFJLNiwO2fqhs4NLvs34KFiqV+djmIZxHYMyI10Owyr9nXMqCm+s/97pt9RWmmBy6BWNw1wYULsvyuB+jLuBM2CNfdpgWw0QjdCURwHl/WemoxVnwHONPZWF6sxBKW2QWuxQa1TKE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 07:44:46.8427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429c23cf-62a9-44f9-8440-08df2a902f75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E464.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9759

Hi,

On 2026. 10. 14. 17:38, Andre Przywara wrote:
>> +static int smccc_cache_probe(struct arm_smccc_device *sdev)
>> +{
>> +    struct arm_smccc_res res = {};
>> +    struct smccc_cache *cache;
>> +    int ret;
>> +
>> +    arm_smccc_1_1_invoke(sdev->func_id, &res);
> 
> I think you should provide the explicit function ID name here, and not 
> rely on which function exactly is used to probe for the interface's 
> existence.

I thought that was the point of the matcher, that you could in theory 
assign the same probe handler to any function ID? For example if there's 
some FW that implements this (or a compatible) function, but at a 
different ID, you would only update the match table? At least that's how 
most subsystems (I2C, PCI, USB) do it.

>> +    if ((s32)res.a0)
>> +        return -ENODEV;
>> +
>> +    cache = cache_coherency_ops_instance_alloc(&smccc_cache_ops,
>> +                           struct smccc_cache, cci);
>> +    if (!cache)
>> +        return -ENOMEM;
>> +
>> +    mutex_init(&cache->lock);
>> +    cache->latency_us = lower_32_bits(res.a2);
>> +    cache->rate_limit = res.a3;
> 
> According to the spec you would need lower_32_bits() for a3 as well - if 
> we are going to use this value. But I don't think we need to, see above.
Where does it say that? My copy of DEN 0028 1.7 H, released 2026/Jul/24, 
only says the following:

   X3 (uint64_t attr_2)
     Rate Limit: The maximum number of SMCCCC_ARCH_CLEAN_INV_MEMREGION 
calls allowed per second. If set to 0, it indicates that this field is 
not reported by the implementation.

See my second-to-last comment on v2 of this patch:

https://lore.kernel.org/lkml/591e7ac9-310e-40f4-ab22-161d6ea8f487@arm.com/

Maybe I have an outdated copy already? ;_;

Bence
