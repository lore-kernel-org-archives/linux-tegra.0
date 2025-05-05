Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2066.outbound.protection.outlook.com [40.107.100.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B413AA53;
	Mon,  5 May 2025 05:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746423302; cv=fail; b=IIBFbMzzt2CR4ENrBv5TdmYcuv573NMz2/aXQ4gWnRw+3NWOFdcenyXg0JM04n9LQv8fThBVmZyQHLa45t1crEZwm6mjkBFjSYw+x0ht38nOFSnualP/ooEKePEhYA2PXQwEt+BH3dFjvdLgGW4qPymgvQ+VqAuhl9qgWYJTFTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746423302; c=relaxed/simple;
	bh=6LEX20qRSUaARWBBCM9yxgyZELsLwH6PvBJuw8j97QE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i5SPNSufmPwirLbcI0ApICHD94YjgNEELWgSWnGKezNIuuf71oBg7a7a77BSVnem1nngG0hFM9AR9/hFswGDPeSNu/46F2vn46PxEKxCoxXfs1P55Uj+piKFwaKbn4TbOawItiAnYwzA7mfeLiUdOVFnlKbKe7R8tpwtPDitbuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UrEd2qIZ; arc=fail smtp.client-ip=40.107.100.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UrEd2qIZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iK9Xp8y5OQf6qB2aBssjwuIGiWY/fhrH/HYlDrULFSVAWqDwdSEghH7IFvEmbL9VGpYkIe+zGh2Aaxgc/N7LnUXAcLni4OvQVuI9LCKrm2fIp+AMcbhK1nhB2Op/LXGODK0ecuam3wLsKQ162jUFT3m3wwZMoMgggZkS3aUwRiIYmaDYZ/adytEx0dBkap9sPOKbBY5cYAiqPCFr3yjPVyZQbGe9mpkeiiO7cjT1ylpqpcsf5ibTjW1KWxbdsjrTEkG3+NFMB0OTtRQZTeOpp6S1vj9c1RRGXr6vDKKU3rwebT71mptVxZu0gZDAsj0DfPlkBRCI5NpPoprV13Kh2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LEX20qRSUaARWBBCM9yxgyZELsLwH6PvBJuw8j97QE=;
 b=NSiFcRBuZh7jyqd8Bu6p4pMWwzHNwjMOg679AWHgFeRoLbT0256D+frM4bDnIohOdwfKZKoQT7MPzOYJzXlo4sKG/byyf2ZUP+0Q8VUUtsC6sXaEqL1NuzEbLjTeWQyKAdYZYR7ObkkjE5HXBFL0SxmZeqrOORcFpUF6Dr7+oYthrOZBQVZNVT7bKXJdjD5+TxQCc0Di/Gl0cA4u26ruuMv3+DJjfIcfWr3EorOaFIDI2rPPXxnq4u9Ew9Ctly33XsgImkvhPAUKwqDWBoDpWPx4f3/eL2/FapJgNJqC7KmpkJuw0VWfaq7IpBZgzYIkQ4IuttyvIa/trBL1QNOv+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LEX20qRSUaARWBBCM9yxgyZELsLwH6PvBJuw8j97QE=;
 b=UrEd2qIZQsf0yk7z8XrPR6rNy/ahEx+pMjVs3zBLjspy4GE8DCV9LtDtj0mOAZdBB/MRde0IrkfYjGEAuFNwioBJ5F2LDqSQ6HYoAQ+KZSI3RSRNlQTs+259d9JgpXiEKh/u9nYDNB+oCtLHFwxY/E+AC1ky9NzElnNRo+tP0loERQT9Crya6JIJSLFdjFWE9NpYJkBdHoeLEpomVv0q+A7DR7i9A9eRrkGM0fRipSTmLTcWJl0oXNZkRldZ/kKYZ94VS3Tks7/QzmXynpiz8lLE/LfB+aCOutwycNF9TiUXQE1Gd7TfvHRZ4cWIHRe9GcIIZCzeNJpc6xcvnkDJJA==
Received: from DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) by
 DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.23; Mon, 5 May 2025 05:34:56 +0000
Received: from DS0PR12MB6416.namprd12.prod.outlook.com
 ([fe80::c1de:5f2:909:e0c4]) by DS0PR12MB6416.namprd12.prod.outlook.com
 ([fe80::c1de:5f2:909:e0c4%6]) with mapi id 15.20.8699.012; Mon, 5 May 2025
 05:34:56 +0000
From: Robert Lin <robelin@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>
CC: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su <pohsuns@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Topic: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Index: AQHbuxv+LeZnI9ouXk2TXsmvoikGMrO/EGmAgAAP2oCABGhGYA==
Date: Mon, 5 May 2025 05:34:56 +0000
Message-ID:
 <DS0PR12MB6416F5ABF087F7E708C96764D98E2@DS0PR12MB6416.namprd12.prod.outlook.com>
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
In-Reply-To: <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6416:EE_|DS7PR12MB5933:EE_
x-ms-office365-filtering-correlation-id: 45ef0e41-8be6-4f5c-c659-08dd8b969207
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1kwNlJOQ0d5SGRWS29QUS9YR1JmQVhoOEdLZ2x5eVg0TGlZZE1ZU1kwVXBv?=
 =?utf-8?B?S1ptWE1EU2RxdFVPMk1nSGZtaUZmKzVod0JqS1JXRVdrMG44OEwwUVVOMzJt?=
 =?utf-8?B?VTRKcGw3Q3AybDgwV0xhS3AvOTFXYVZKdHVkaEczUEdGQnExNEpkTGFUUjV5?=
 =?utf-8?B?cWVRVWQ5czZuTElpVGdYNm9HR0ZvMDhnZ1NkdVp6UzQ4RXNybnRaYzRkY0I3?=
 =?utf-8?B?WDdNM0NTNE9YdVBSUk11ck1CT2RpT00yM08wcnJCTmFtM1d0OTBkcFJMSHZw?=
 =?utf-8?B?UUpOc2p6Rlo3SVBCN0RKdS9BbUd6U0FpclVvUVJxWXBreW9oWlN0Q3dIbXBR?=
 =?utf-8?B?Sy9ta3VBUytpdEthdmhuMVpDbmFIc3lWL3dRQUJxRDNkK0Qzd09RazBUMk5F?=
 =?utf-8?B?b0FQa1NEcVFpT0tiQlRreTV2WThQMFpmdERYNUZNWWpEKzhBc2FCZFdNSyt3?=
 =?utf-8?B?NTMwT1RObWlXRFRvZ3lyNU56eHpKTzJwUlRQZjhjd3k3U2IzVkgyQnQxRUMr?=
 =?utf-8?B?Z3A5NFYzY2liVlZLU1lyMkU1aGdxNGRIQ2hMYS9yYnkxNnJwd1dlZ0FleTg3?=
 =?utf-8?B?YmFab1JrT0xEcWFlbGZLb2gwRXhzUDRVOWlyT1AyN2tGWkhpZXhsM25TRnBT?=
 =?utf-8?B?K2pWR1BPTzdWaDQwQ2lPQWNlQnFRa3ZLT0FnZGJvd1hhSDAxMXBUTEhRSHFl?=
 =?utf-8?B?WVNuYS9hTXlGTHFlM3p5ajVMNlAxR0NxeVVuUStKTUpvMHpha1lJbyttT3pN?=
 =?utf-8?B?Q0hacW0wVWkrNFRQakVMYkRRVTdWeGpxZGZSa1ZPZiszYUxlVCs0dVZLZTZ2?=
 =?utf-8?B?d3dxMXgxdDRmZzdoazZpVDlDelhLUmRia01ra1gxNkY4bWtKWFVCWm9zZHJJ?=
 =?utf-8?B?RVI1c2M2QU9vaXhjLzFPOEIyNmlUbW9GWVg1aDN3T0RRQXpEeTRWV09lbUFw?=
 =?utf-8?B?Z2k3ekJ0WHN3bE9RZGM4WTZ4VUZXN2J3Wm1FampzMGVnUnpKbVpTS24wSXVX?=
 =?utf-8?B?dWJaMTduWkdPdjZ5K2wwZU5UQk1VdDV3dGduWGJON2l0NWU5TDQ0R2c3M0Nt?=
 =?utf-8?B?b0JHU0tzMWFVek10bndoVW9BNzNNRER5elVONGJvMVJMT1I1d1VLT1R6WDVt?=
 =?utf-8?B?RXNTT0xnalpYaVczRFR3cDFSY3pFY2tSckI5bHBJRHZoM0dCeERJcXNkTW9x?=
 =?utf-8?B?aGJZZDhJb3BsaHljZXZJdVZuZDlnQklQM3ZUR2dUNG9YSFQ1RHg5ZTkxRThG?=
 =?utf-8?B?L3lLcE1EL1B6S3dsVWRHNmdObTZ5OTFyTkVmUVdaMEp2WGtUajk3QWNsZSts?=
 =?utf-8?B?UG42ajE1Z01LbmVGejgrQmprZEg1a3hldG5vL0tmY1hZcmdGaEtpM1Vvalls?=
 =?utf-8?B?cVFVYkdvMy9LZ3l6TG93eXNRZ2d1NXhENVRGdm42bDN1R0tRL2d0T1dSZ0dC?=
 =?utf-8?B?dXFxWUl5dXFiNC8wUEpseXNiMStmNEpyZ0ZKWm9mcUVIcVNhblc4a21QMWJ3?=
 =?utf-8?B?aHhHZTZYakZyaWRiZUUwTnhYbmZPekh6RFF1T0ZqQW5MSnNJaVo1cHdNMnky?=
 =?utf-8?B?ZXU2Zk9rUmo3bjdaSittMlhDekprTnRIRU4xNlBoNTJFOVEzaHZXVWxSalpF?=
 =?utf-8?B?OUlxemtRcWxTR2xzU0tkbmx5U2g5a2xkWndqazFranJ5K0wzK3Jod0NzTFpk?=
 =?utf-8?B?Q0NlY2RGeFkxWjQ5RTRxS3JNY0ZnQ0pDaFh4UFljaFlHOUxYaVowZHhKYk1P?=
 =?utf-8?B?bFJpdlgwSmdVWWswbFovb3hMa2tOd1JwU3AweU5uUUxWM3FzamVxZXVnVUtk?=
 =?utf-8?B?NG84Nk1YZDJ0VHZsVEExcUc3cFJ3VUhXa0daZDZ5Vk5INU4xUFBKSVcwb3VM?=
 =?utf-8?B?T1d3VENpaDZsZ0J1MHB1Z0JMdWpOYWpLUnN5TnFWTWUzZHJTVXhSd2Y5Uk5r?=
 =?utf-8?B?ODRwVUhPL25qeVJzc1J2QUdBQ0pFQVhsWEQrckZQSjRwMm5NcEpQWkxaTGNY?=
 =?utf-8?B?anNHZi9CQVJnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDRhTUNyL3BiVmtBUnhGemozSk9uemgwbzEvY2NmTTdXUllYKzVlRUdROGdL?=
 =?utf-8?B?MWp6Q20zOG82UytXVmZKWCtaaE9UM2JiREttUTBFT3h4Vi92Q2FrZ1hCZWQ0?=
 =?utf-8?B?dU1XY0ZhZVdNUVYxcUEzVEFuUlRtbTBZcTVlRmtINmxZRDlpTXJGOFlpUjdw?=
 =?utf-8?B?ODc3UGhNbE9Vd3lBZnZPT0dKSG1yVmwyaENaMHpOczhObEY5aVZkYTF2MjZ1?=
 =?utf-8?B?dEdHT1hlSjNFMkdsNkVEY1B5ZmN1dThLTFhiemJZSnUrZXdMVHRvam9lWVB3?=
 =?utf-8?B?VG5NSFJSTmVuNVQ0UTRyMjlpdkRuQUttTGJCc3BwMU5zbCt1aXF5YWZ4eGxz?=
 =?utf-8?B?dGZOd25oSTVHNzVlSE9sYTdVM0dpUndmZEJ1R1dvK1BjRTB0NGFUM3l3RmhG?=
 =?utf-8?B?WG9kTzJTNzNMSWcxc0tqdCsvSzJMSFFtdUhDOXJObFN3MENNWmx4aGdONEFK?=
 =?utf-8?B?amVQekt4VnVydURLVlhqT3A0NlRvYmJ4TmJPWU5Ic1dwbDAwSzlHTUdWVWFW?=
 =?utf-8?B?U2d6ME5uQTJHS3JZV3ViR05lUkZNaUlvdjFzN3hlTDJpQUh4NS9OUjVrVnlF?=
 =?utf-8?B?bEdMMTltNHB2Qko1QTJUZ2hYUXZFdmFVKzFpRW5IQVdYLzUrUC83VkhOYWh0?=
 =?utf-8?B?M0ptbmhGVTdHZXlEbWI3aFdGaWpVUHQ3UzdRWXRTRU9HMTBkaG05clIwZk0y?=
 =?utf-8?B?bnU3L0VhZzNsNVNna3hxdXYzMFkvbUcwT1hwQjlMdFliMmxmMUFtQmVxaysw?=
 =?utf-8?B?RE05Nld4TklsMTV1WDVBUzVxNkpTY0tPdURwWEUrRWVUNXdtVHd6UlptT1NC?=
 =?utf-8?B?VFVwMlg3OUY3clJTNFpBbm1aVGJtTllrMzJjZzRGYmtSdVBTMGVYbEJ0S1Z3?=
 =?utf-8?B?bkZOUGhmYUFha1pxei8yeWlIdy9tcTVLNGtwMklVUmN3TkdJblhzbFNJZCsv?=
 =?utf-8?B?NTUwU2NOMWdEYUlLb0RaazdjbURTR0syeTRsT2pTVXQ1WGhJVkhVSmZkU2tJ?=
 =?utf-8?B?T1pZUFI4R05KbjRqQzdHODhWbG8rZlRWZ3g2ZVYxdmRxdXlyYjFBaWlrR0hU?=
 =?utf-8?B?c1VpaXJaTlRtak9teElTQ0FLTDFGb2F5THVmUXZYNzZOUkZuN1NwTTRwOVRn?=
 =?utf-8?B?Nk9FcDNmTDg2a0hEeU9CR2hxZGc5RW92bG1ZYXgraExnNFFoNkZTME9SR09I?=
 =?utf-8?B?M0tWNktPQWlWcTlkZU1VNTJUQzg5dzM4OGRLTHk5SE1ROGZPNy9ZOVN2aWJp?=
 =?utf-8?B?ZEY0WHRVcXJPQ2U3ZXhsQ0l5LzFwZzFFRlZVanlZcFFoUUJvQXE0bFA1LzRJ?=
 =?utf-8?B?Q3VWWktmaFE2MDVudUg5Vkg2dmxNVlA5TFpvQjl1VE9UcG1zdGlvVGZ2Zk9n?=
 =?utf-8?B?UFNidkltOUM3eEhaWTF4UVNVaXB3SE1IVklLS2kxOWRhbzdDVjB3aFgwa3d0?=
 =?utf-8?B?WTBldUlCamJhbjNDN0FaOUlFWTlqcmwrRHlLMnpyWXh5THNkRDJCTGxsNmpk?=
 =?utf-8?B?Q296Uy90Nk0yTUhmRDcvYW1rOVJobVA1VXFHUTQ1aExTM1FwY0NKZkw0VVRv?=
 =?utf-8?B?VEZRZjBoQTJ5d2JZYVhqUkZBbjE2UUNROEx4Qm1HRXhIL29EUkF3ODk0My8z?=
 =?utf-8?B?L2FDSENCdzRiMHQwRlFyV3NTbjI5Z25PSldPREVJeXpFTjE1Mlh5SlZJR3o2?=
 =?utf-8?B?djdQVHllODhLcnk4ZUdNSHJvZWpTRzl4MEJ0NHRJYU9SYmF2T2VOaEIwVmRU?=
 =?utf-8?B?UzU2OFBvaUlEZVRwcmtQTUN5Y2Q1aUlqWHhuT0ZFazY4d2FrMjd4QmJSM2Ro?=
 =?utf-8?B?SWh1UkFTeHFSZktDK1NVTjJESk5TVmpaa1Aya1dTWmxiZGVuZ3U2VHE0QmJC?=
 =?utf-8?B?QXU1OWZYV1NqUUo1NUd5QkZIaVFabXkrZHI0Mkdtb0dMVWZtaHo0NXd5ekYw?=
 =?utf-8?B?TXE2dGloWm1vc2FlUzlLRTNPZ2hLSzMxRmZiN2NrUWhxTVpsdm02VVQrbGtu?=
 =?utf-8?B?aUxBb0I5MWJlRFgrQ2p1Vjh6cUpHSU51M0tZSWp3NDczMWhUbXhIbDU5Y2dN?=
 =?utf-8?B?VTlqQWgwaVc3OUs3ZzZzelBDOFZBUlJoTFg3ekY1UUV0dkRUc1lWaWNYMjF0?=
 =?utf-8?Q?pdSI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ef0e41-8be6-4f5c-c659-08dd8b969207
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2025 05:34:56.7494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfXxPxIaMoQy9fG52FREYbIR8MCCc2LF6Zp4pvfjSiHkb78kBM1QiCOr0pT2pRSlgPzMQQlLTqNvNKilCUQkzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9uIEh1bnRlciA8am9u
YXRoYW5oQG52aWRpYS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDIsIDIwMjUgNjoxNiBQTQ0K
PiBUbzogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+OyBSb2JlcnQg
TGluDQo+IDxyb2JlbGluQG52aWRpYS5jb20+DQo+IENjOiB0aGllcnJ5LnJlZGluZ0BnbWFpbC5j
b207IHRnbHhAbGludXRyb25peC5kZTsgUG9oc3VuIFN1DQo+IDxwb2hzdW5zQG52aWRpYS5jb20+
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gdGVncmFAdmdlci5rZXJu
ZWwub3JnOyBTdW1pdCBHdXB0YSA8c3VtaXRnQG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjcgMS8zXSBjbG9ja3NvdXJjZS9kcml2ZXJzL3RpbWVyLXRlZ3JhMTg2OiBhZGQNCj4g
V0RJT0NfR0VUVElNRUxFRlQgc3VwcG9ydA0KPiANCj4gDQo+IA0KPiBPbiAwMi8wNS8yMDI1IDEw
OjE5LCBEYW5pZWwgTGV6Y2FubyB3cm90ZToNCj4gPiBPbiBGcmksIE1heSAwMiwgMjAyNSBhdCAx
MjozNzoyNVBNICswODAwLCBSb2JlcnQgTGluIHdyb3RlOg0KPiA+PiBGcm9tOiBQb2hzdW4gU3Ug
PHBvaHN1bnNAbnZpZGlhLmNvbT4NCj4gPj4NCj4gPj4gVGhpcyBjaGFuZ2UgYWRkcyBzdXBwb3J0
IGZvciBXRElPQ19HRVRUSU1FTEVGVCBzbyB1c2Vyc3BhY2UgcHJvZ3JhbXMNCj4gPj4gY2FuIGdl
dCB0aGUgbnVtYmVyIG9mIHNlY29uZHMgYmVmb3JlIHN5c3RlbSByZXNldCBieSB0aGUgd2F0Y2hk
b2cNCj4gPj4gdGltZXIgdmlhIGlvY3RsLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQb2hz
dW4gU3UgPHBvaHN1bnNAbnZpZGlhLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogUm9iZXJ0IExp
biA8cm9iZWxpbkBudmlkaWEuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBkcml2ZXJzL2Nsb2Nrc291
cmNlL3RpbWVyLXRlZ3JhMTg2LmMgfCA2NA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKyst
DQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItdGVncmEx
ODYuYw0KPiA+PiBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItdGVncmExODYuYw0KPiA+PiBp
bmRleCBlYTc0Mjg4OWVlMDYuLjhkNTY5ODc3MGNiZCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci10ZWdyYTE4Ni5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItdGVncmExODYuYw0KPiA+PiBAQCAtMSw4ICsxLDkgQEANCj4gPj4gICAvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4+ICAgLyoNCj4gPj4gLSAq
IENvcHlyaWdodCAoYykgMjAxOS0yMDIwIE5WSURJQSBDb3Jwb3JhdGlvbi4gQWxsIHJpZ2h0cyBy
ZXNlcnZlZC4NCj4gPj4gKyAqIENvcHlyaWdodCAoYykgMjAxOS0yMDI1IE5WSURJQSBDb3Jwb3Jh
dGlvbi4gQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPj4gICAgKi8NCj4gPj4NCj4gPj4gKyNpbmNs
dWRlIDxsaW51eC9iaXRmaWVsZC5oPg0KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9jbG9ja3NvdXJj
ZS5oPg0KPiA+PiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPj4gICAjaW5jbHVkZSA8
bGludXgvaW50ZXJydXB0Lmg+DQo+ID4+IEBAIC0zMCw2ICszMSw3IEBADQo+ID4+DQo+ID4+ICAg
I2RlZmluZSBUTVJTUiAweDAwNA0KPiA+PiAgICNkZWZpbmUgIFRNUlNSX0lOVFJfQ0xSIEJJVCgz
MCkNCj4gPj4gKyNkZWZpbmUgIFRNUlNSX1BDViBHRU5NQVNLKDI4LCAwKQ0KPiA+Pg0KPiA+PiAg
ICNkZWZpbmUgVE1SQ1NTUiAweDAwOA0KPiA+PiAgICNkZWZpbmUgIFRNUkNTU1JfU1JDX1VTRUMg
KDAgPDwgMCkNCj4gPj4gQEAgLTQ2LDYgKzQ4LDkgQEANCj4gPj4gICAjZGVmaW5lICBXRFRDUl9U
SU1FUl9TT1VSQ0VfTUFTSyAweGYNCj4gPj4gICAjZGVmaW5lICBXRFRDUl9USU1FUl9TT1VSQ0Uo
eCkgKCh4KSAmIDB4ZikNCj4gPj4NCj4gPj4gKyNkZWZpbmUgV0RUU1IgMHgwMDQNCj4gPj4gKyNk
ZWZpbmUgIFdEVFNSX0NVUlJFTlRfRVhQSVJBVElPTl9DT1VOVCBHRU5NQVNLKDE0LCAxMikNCj4g
Pj4gKw0KPiA+PiAgICNkZWZpbmUgV0RUQ01EUiAweDAwOA0KPiA+PiAgICNkZWZpbmUgIFdEVENN
RFJfRElTQUJMRV9DT1VOVEVSIEJJVCgxKQ0KPiA+PiAgICNkZWZpbmUgIFdEVENNRFJfU1RBUlRf
Q09VTlRFUiBCSVQoMCkgQEAgLTIzNSwxMiArMjQwLDY5IEBADQo+IHN0YXRpYw0KPiA+PiBpbnQg
dGVncmExODZfd2R0X3NldF90aW1lb3V0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZCwNCj4g
Pj4gICAJcmV0dXJuIDA7DQo+ID4+ICAgfQ0KPiA+Pg0KPiA+PiArc3RhdGljIHVuc2lnbmVkIGlu
dCB0ZWdyYTE4Nl93ZHRfZ2V0X3RpbWVsZWZ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UNCj4gPj4g
Kyp3ZGQpIHsNCj4gPj4gKwlzdHJ1Y3QgdGVncmExODZfd2R0ICp3ZHQgPSB0b190ZWdyYTE4Nl93
ZHQod2RkKTsNCj4gPj4gKwl1MzIgZXhwaXJhdGlvbiwgdmFsOw0KPiA+PiArCXU2NCB0aW1lbGVm
dDsNCj4gPj4gKw0KPiA+PiArCWlmICghd2F0Y2hkb2dfYWN0aXZlKCZ3ZHQtPmJhc2UpKSB7DQo+
ID4+ICsJCS8qIHJldHVybiB6ZXJvIGlmIHRoZSB3YXRjaGRvZyB0aW1lciBpcyBub3QgYWN0aXZh
dGVkLiAqLw0KPiA+PiArCQlyZXR1cm4gMDsNCj4gPj4gKwl9DQo+ID4+ICsNCj4gPj4gKwkvKg0K
PiA+PiArCSAqIFJlc2V0IG9jY3VycyBvbiB0aGUgZmlmdGggZXhwaXJhdGlvbiBvZiB0aGUNCj4g
Pj4gKwkgKiB3YXRjaGRvZyB0aW1lciBhbmQgc28gd2hlbiB0aGUgd2F0Y2hkb2cgdGltZXIgaXMg
Y29uZmlndXJlZCwNCj4gPj4gKwkgKiB0aGUgYWN0dWFsIHZhbHVlIHByb2dyYW1tZWQgaW50byB0
aGUgY291bnRlciBpcyAxLzUgb2YgdGhlDQo+ID4+ICsJICogdGltZW91dCB2YWx1ZS4gT25jZSB0
aGUgY291bnRlciByZWFjaGVzIDAsIGV4cGlyYXRpb24gY291bnQNCj4gPj4gKwkgKiB3aWxsIGJl
IGluY3JlYXNlZCBieSAxIGFuZCB0aGUgZG93biBjb3VudGVyIHJlc3RhcnRzLg0KPiA+PiArCSAq
IEhlbmNlIHRvIGdldCB0aGUgdGltZSBsZWZ0IGJlZm9yZSBzeXN0ZW0gcmVzZXQgd2UgbXVzdA0K
PiA+PiArCSAqIGNvbWJpbmUgMiBwYXJ0czoNCj4gPj4gKwkgKiAxLiB2YWx1ZSBvZiB0aGUgY3Vy
cmVudCBkb3duIGNvdW50ZXINCj4gPj4gKwkgKiAyLiAobnVtYmVyIG9mIGNvdW50ZXIgZXhwaXJh
dGlvbnMgcmVtYWluaW5nKSAqICh0aW1lb3V0LzUpDQo+ID4+ICsJICovDQo+ID4+ICsNCj4gPj4g
KwkvKiBHZXQgdGhlIGN1cnJlbnQgbnVtYmVyIG9mIGNvdW50ZXIgZXhwaXJhdGlvbnMuIFNob3Vs
ZCBiZSBhDQo+ID4+ICsJICogdmFsdWUgYmV0d2VlbiAwIGFuZCA0DQo+ID4+ICsJICovDQo+ID4+
ICsJdmFsID0gcmVhZGxfcmVsYXhlZCh3ZHQtPnJlZ3MgKyBXRFRTUik7DQo+ID4+ICsJZXhwaXJh
dGlvbiA9IEZJRUxEX0dFVChXRFRTUl9DVVJSRU5UX0VYUElSQVRJT05fQ09VTlQsIHZhbCk7DQo+
ID4+ICsJaWYgKFdBUk5fT04oZXhwaXJhdGlvbiA+IDQpKQ0KPiA+PiArCQlyZXR1cm4gMDsNCj4g
Pg0KPiA+IEVhY2ggY2FsbCB3aWxsIGdlbmVyYXRlIGEgYmlnIHdhcm5pbmcgaW4gdGhlIG1lc3Nh
Z2UuIE1heSBiZSBzaW1wbGVyDQo+ID4gdG8gYWRkIGEgcHJfZXJyKCkgd2l0aCBhbiBleHBsaWNp
dCBtZXNzYWdlLg0KPiANCj4gSSBwcmVmZXIgdGhlIFdBUk4uIFRoaXMgc2hvdWxkIG5ldmVyIGhh
cHBlbi4gSWYgd2UgZG8gY2hhbmdlIHRoaXMsIHRoZW4NCj4gZGV2X1dBUk4oKSBtaWdodCBiZSBt
b3JlIGFwcHJvcHJpYXRlLCBidXQgSSB0aGluayB0aGF0IHRoaXMgaXMgZmluZSB0b28uDQo+IA0K
PiA+DQo+ID4+ICsJLyogR2V0IHRoZSBjdXJyZW50IGNvdW50ZXIgdmFsdWUgaW4gbWljcm9zZWNv
bmQuICovDQo+ID4+ICsJdmFsID0gcmVhZGxfcmVsYXhlZCh3ZHQtPnRtci0+cmVncyArIFRNUlNS
KTsNCj4gPj4gKwl0aW1lbGVmdCA9IEZJRUxEX0dFVChUTVJTUl9QQ1YsIHZhbCk7DQo+ID4+ICsN
Cj4gPj4gKwkvKg0KPiA+PiArCSAqIENhbGN1bGF0ZSB0aGUgdGltZSByZW1haW5pbmcgYnkgYWRk
aW5nIHRoZSB0aW1lIGZvciB0aGUNCj4gPj4gKwkgKiBjb3VudGVyIHZhbHVlIHRvIHRoZSB0aW1l
IG9mIHRoZSBjb3VudGVyIGV4cGlyYXRpb25zIHRoYXQNCj4gPj4gKwkgKiByZW1haW4uDQo+ID4+
ICsJICovDQo+ID4+ICsJdGltZWxlZnQgKz0gKCgodTY0KXdkdC0+YmFzZS50aW1lb3V0ICogVVNF
Q19QRVJfU0VDKSAvIDUpICogKDQgLQ0KPiA+PiArZXhwaXJhdGlvbik7DQo+ID4+ICsNCj4gPj4g
KwkvKg0KPiA+PiArCSAqIENvbnZlcnQgdGhlIGN1cnJlbnQgY291bnRlciB2YWx1ZSB0byBzZWNv
bmRzLA0KPiA+PiArCSAqIHJvdW5kaW5nIHVwIHRvIHRoZSBuZWFyZXN0IHNlY29uZC4gQ2FzdCB1
NjQgdG8NCj4gPj4gKwkgKiB1MzIgdW5kZXIgdGhlIGFzc3VtcHRpb24gdGhhdCBubyBvdmVyZmxv
dyBoYXBwZW5zDQo+ID4+ICsJICogd2hlbiBjb3ZlcnRpbmcgdG8gc2Vjb25kcy4NCj4gPj4gKwkg
Ki8NCj4gPj4gKwl0aW1lbGVmdCA9ICh0aW1lbGVmdCArIFVTRUNfUEVSX1NFQyAvIDIpIC8gVVNF
Q19QRVJfU0VDOw0KPiA+DQo+ID4gRGlkIHlvdSBjaGVjayB0aGVyZSBpcyBhIG1hY3JvIGZpdHRp
bmcgdGhlIG5lZWQgaW4gbWF0aC5oID8NCj4gDQo+IEkgaGFkIGEgcXVpY2sgbG9vaywgYnV0IGxv
b2tpbmcgYWdhaW4sIEkgc2VlIHdlIGNhbiB1c2UNCj4gRElWX1JPVU5EX0NMT1NFU1RfVUxMKCkg
aGVyZS4NCg0KSSdsbCB1c2UgdGhlIG1hY3JvIHRvIHJlZmFjdG9yLiBUaGFua3MuDQoNCj4gDQo+
ID4NCj4gPj4gKwlpZiAoV0FSTl9PTih0aW1lbGVmdCA+IFUzMl9NQVgpKQ0KPiA+DQo+ID4gcy9X
QVJOX09OL3ByX2Vyci8NCj4gDQo+IFdoeT8gQWdhaW4gdGhpcyBpcyBub3QgZXhwZWN0ZWQuIEkg
dGhpbmsgdGhhdCB0aGlzIGlzIGZpbmUuDQo+IA0KPiA+DQo+ID4+ICsJCXJldHVybiBVMzJfTUFY
Ow0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIGxvd2VyXzMyX2JpdHModGltZWxlZnQpOw0KPiA+PiAr
fQ0KPiA+PiArDQo+ID4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB3YXRjaGRvZ19vcHMgdGVncmEx
ODZfd2R0X29wcyA9IHsNCj4gPj4gICAJLm93bmVyID0gVEhJU19NT0RVTEUsDQo+ID4+ICAgCS5z
dGFydCA9IHRlZ3JhMTg2X3dkdF9zdGFydCwNCj4gPj4gICAJLnN0b3AgPSB0ZWdyYTE4Nl93ZHRf
c3RvcCwNCj4gPj4gICAJLnBpbmcgPSB0ZWdyYTE4Nl93ZHRfcGluZywNCj4gPj4gICAJLnNldF90
aW1lb3V0ID0gdGVncmExODZfd2R0X3NldF90aW1lb3V0LA0KPiA+PiArCS5nZXRfdGltZWxlZnQg
PSB0ZWdyYTE4Nl93ZHRfZ2V0X3RpbWVsZWZ0LA0KPiA+PiAgIH07DQo+ID4+DQo+ID4+ICAgc3Rh
dGljIHN0cnVjdCB0ZWdyYTE4Nl93ZHQgKnRlZ3JhMTg2X3dkdF9jcmVhdGUoc3RydWN0DQo+ID4+
IHRlZ3JhMTg2X3RpbWVyICp0ZWdyYSwNCj4gPj4gLS0NCj4gPj4gMi4zNC4xDQo+ID4+DQo+ID4N
Cj4gDQo+IC0tDQo+IG52cHVibGljDQoNCg==
