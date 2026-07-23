Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295CE47127B;
	Thu, 23 Jul 2026 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806308; cv=fail; b=GWaNJ2sM5VraTpGXy6fAiloSKbScmTU31L5si9sNfvmh8NBwOgv3IWc8pqMDk27uI8xIu4djq51ZNt8TMP3WCMCWqBG6HPEGUFw/cgdWHEUwB4ijXgtyaH7wo8kfBmtSV64+UAf6l+ad6I7rjEiEzM3FjMyQa1npVoZgHJXx5wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806308; c=relaxed/simple;
	bh=0dAASP8ghmQ9JTFGJHtKfQRPme6Bf67Oamqq7OUcBK0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B8eGpPEG+L9k7SShUYJSPofmfmpRUP24EI9fI7rARCANxqiiMPz9V20pJb+b7YpFD3f4voH5yKWgS1tifsZkvQ3IY2EzqWnuRkEaQ3lD3xj864fnI3YXY1mdbagWQs+9lbCkXmQPLEKBWrILYiDmJyrPZu22iNgtqIetgI/uab4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=uC8dZF/v; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="uC8dZF/v"
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N4uwHS1899657;
	Thu, 23 Jul 2026 08:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=T0bAtf8FRXv7oaYZYfvxRNgpf/1wNuPRhgkqGemSzDY=; b=uC8dZF/vBelv
	Cy3VEeQk/hyNWCU5iJlQvEXmKRU6+tWIXwpblw2tMlOAmoGuy+NIEDH2w5s56mpS
	a7oxsqBiCA3rMQ4N6JDJKRFfSZED/P06BfvwtlVZDLuLUfeKohIQ+G3to1DT6FoF
	Fb78KYCewremuOsTCT905ecQrnnq5yJOBR3pwSlIk+cesS7B8WGTdy2HksDfRXG5
	1pOGiVqwrndFT+Ec/xpnUq43ii8UAgOmu4b0idGTQ7dUHBQQWcBOSrcMZLObPkmr
	8YglZJkEEhmmAzWRirQvzO8vgHoUGwAVV3H0Q9hCZ0WV8lt01Z+7FA/ibMg38kYy
	sRgmhuWvLw==
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013013.outbound.protection.outlook.com [40.107.44.13])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fgpbe1399-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 08:39:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3i1ATC37vn5m1/XTp2ESbF0sK1voCCmuv1A3qFtulQf9FfIIel09KvoFe+AgCkeDCs+65IZyaj5y9nm4XmXCw1TNykm0Nwg5TMrbz4Wa5Rxm5shVO4hMCjUU3BZcoAez1HIpq4OZT8I7dzZzkrWARSr3Czrg7r4d2KYXkz5dk/oPkyGa7et2K4IsOpzvJ8F1jKSE1tlkY8uMGWCuCruWoBnamLPnxsjsaswwgD8SdCnSLaqUIR9KH3tmyrBvj9+FJiBcDAu8u+6qEuf/sKGsOMDGM6vRm+0R2YIyv4ExSZlF77+rTkF+YJX9exl2jUEI2yRICJAkTJg8BWq60bE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0bAtf8FRXv7oaYZYfvxRNgpf/1wNuPRhgkqGemSzDY=;
 b=Eh5nprM2+0YgNWucKZBS0FDhHwx9pePpKOUGyLLuucTs/1+yvQOHviTJHi+zJQm2totxxIQx0TdYY8/Ys0vfZ56PwiPIZtlxht68Z5swlbT04Bh6KXCkWOcGqyFJaErFT9ua3wMlq4qUVfY4B++c9EyLIhwPmuAwjChYsAdPIVDtfeccdqxtaMwCS9sjRuXkaAXqGIluTRXhdTLbC4qgBjLRlGidcpwmJQ3MZpv1zTkBA8lT1HQx3hIGGEGsNJpd9sIcMu7MuFOvWw9LI+p/Bs8OwbfIgKI3MrJyCpjO/jI5SnM6gOQt8VGzBaZ0KfgWTT1brbWuSCldZtZVb+7i5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SE3PR03MB9825.apcprd03.prod.outlook.com (2603:1096:101:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:39:31 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:39:30 +0000
From: Jiqi JQ9 Li <lijq9@lenovo.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
        "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "jonathanh@nvidia.com"
	<jonathanh@nvidia.com>,
        "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>,
        "mpearson-lenovo@squebb.ca"
	<mpearson-lenovo@squebb.ca>
Subject: Re: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Topic: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Index: AQHdCTjxqFFLh3hcGki6q863z60IUbZi7r4AgAAMxPqAAC7YgIAXvOvB
Date: Thu, 23 Jul 2026 08:39:30 +0000
Message-ID:
 <JH0PR03MB863784014DC41494B229033083C02@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260701090639.669524-1-lijq9@lenovo.com>
 <qdp3icvlQKCtNtIxYUjG_A@nvidia.com>
 <JH0PR03MB863759EED0FBEED43ADE8AC983FF2@JH0PR03MB8637.apcprd03.prod.outlook.com>
 <qH2CwJ61SfKj2xT1jc5N9Q@nvidia.com>
In-Reply-To: <qH2CwJ61SfKj2xT1jc5N9Q@nvidia.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SE3PR03MB9825:EE_
x-ms-office365-filtering-correlation-id: 92c476ab-efaa-4be4-a425-08dee895ea02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|4143699003|10067099003|5023799004|11063799006|6133799003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 re4enEWCFJFH9ucouGM9KpMc1PIDzq+tDqctTaDaAxL6aMgL50FSgakub2POzxJW7Eut1GUus6bAnP8nVvzFptfZqQCdMMhLFyOhsnmxRHg06EGrVQJ7fEHLq/IYfMePWK3rnyAmEqyrT2tAchsdh7T3chX4oe8OHhmOvYX1367kngEcmVKuwk18c8qeJmWFF+IVggzKvSQ/J6ownOm+fUnhed/AoLVORJhPe+teXUyr5RkEta7cZjmO86/AENdzqvtMged8Lyj1yYwCtKWH/RyirOOgwl8qh0PKN8cfRL8drNIG+Ef1mWlSFE/eYBXZu1e1LRpeYCbRVTqmWf9bA3Ur9sEXsRJrvmaAE1HdluMTDAWJ3dlAfJds3UroK7q8fGDUWRot42vLvs0s8OhZWl9MHJ8TCGNHv5rsniDcaiY+fhWXWq7kgQDrUVGi1ac8jj7XR7eKH7X51bJ9Dm7xSVWLuFZAiXli/eUQPWRas2fGdewSfXOQpWYyPHeKYXi4bPx6Ge6H1XDVPoEeXKU4wbBcmIczsKgFUgqtFWXRiywT4vgzJg1txsdqux3sVAKyjsieQPQkaSQ7VU4uDWXXuHqPdKvIPCTfEsQP0c/AJZ2LSpp8V0PgeUAAIgVf7uvTWsw+eYm1euYFrc8EEofAUf5jHS7yApUIvi2D2pfHVI/pdwPaDOnlZVPK112YP+nOezNyum7Fjglo6I4RxX5DYsvKdo4gJyuCtqdjTcCYKHI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(4143699003)(10067099003)(5023799004)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+T1nsNTCgYUBx4rU+Jm3F1zAAUSc0etKGk1vzB4tuRlArl+3XfK1+9UtAb?=
 =?iso-8859-1?Q?JwV5CVUpRI93Bs7p/mb/MvJSGRFiVETW1yVxUx/IxyASDj9SNVuLg/s8MY?=
 =?iso-8859-1?Q?HldSa2lDPcKfTabONzh6qXfb5PU68iatLvskwBqoT8A9Nv6jJLb1adWA5l?=
 =?iso-8859-1?Q?FXaqAo/SAYCFIFZNJRVXV3IehFYdYVHi4tpl0dyTBHVvgpJ6SHCP0KvYRx?=
 =?iso-8859-1?Q?Hn8HAH/j+K/S6w5gjv2isenfTbsGv1X6QmEP5ALiti9BuzXGeNIq0Aoq5W?=
 =?iso-8859-1?Q?WQM20ypYlJqzD7dytAzzu9+Ef5x3be5T6Ws4Es22WM05+44RShJSHeIhVd?=
 =?iso-8859-1?Q?8itt7WPp952dTO7wJULb8tEikT4s7eN3larodK124NQIYazECF8PSI4HEy?=
 =?iso-8859-1?Q?msPa78bGy6u/Oyau6VBUd3VQusdBb9GCwKHIkWSNZ5o3B2Rkbc/pXWv5wj?=
 =?iso-8859-1?Q?k3myB/B657VzocofCiV4/lPVK7wgZHHfxk5RECJ9tLBQyocuPS1bMqNXY9?=
 =?iso-8859-1?Q?7wFcBPEa+HYsjm3bUnnAIix8/uSr1+ZXgiD+wlCpHbh4tO3Fgoru6x2QOF?=
 =?iso-8859-1?Q?6UO5iKFu8GDjHcnSvdufAusyfVEbYaXz5/b2wT08+I4Q1RXUs+xiSVY2P7?=
 =?iso-8859-1?Q?Bc77ltfAf1byIqGKgIJmIZgS6WP+VNU2PkGjTi+P1LHndVf8FgD5hZc8U+?=
 =?iso-8859-1?Q?fWnw0tE5w8NUJmv6dZHQAjEhY++KhE4Cb8DSjO4EE2HA+lfXAoYEbf3+01?=
 =?iso-8859-1?Q?FeGwjvC04Rd6PGpbfUciK6OmtzpiYWABSaTSk7E3oj0sFG1727ePc34oO4?=
 =?iso-8859-1?Q?eNUdEWHd3PuJ0LS3l9FXR2KQqpRANmPbZL+DzMTk3SR25jZRCUvm8ifxFM?=
 =?iso-8859-1?Q?fbd7XbNwU7uAHLBxsiaCSekdtNvhhDaNyyE7f/Wmtkb0bgfWG8OrgTOfGs?=
 =?iso-8859-1?Q?MSUgdkB97jnvVHQSa612B+yjpDKyiyEvNpQoXSgWoT+mlPRaYX6cXo02cc?=
 =?iso-8859-1?Q?V/LykIWNc4WIA78gKUZ2j9kzdd4K5rYgqqcNDyeaxLZO8OwrraoGuYuotV?=
 =?iso-8859-1?Q?7wNCLygK0t8euSmfHsK8Lfz1NTCcvZJBIF4IVcqMAp/EckBMhdQ4DdIBnb?=
 =?iso-8859-1?Q?s8IWqhnJ1zHyphulq5yhlMl8SS0AiDiJ1sP63r5QjE6r7nhjAyUotWoLwS?=
 =?iso-8859-1?Q?ebSSfhwq44Ri8TjNP9DeMGyBxUnIW1nqVrT2u2/BDIBCsrpgBXNrYWAzhw?=
 =?iso-8859-1?Q?5grfHf1koYaK+DKntYcxOb0l1Hg0KShFUPPyuoosC0VJRa/RYE+aCZ7xxR?=
 =?iso-8859-1?Q?owSeKhFBZa6jEiMH+RS8JuNFw9RWa3l44I2wFPFRLR3RHL/NUI6AhKs+ea?=
 =?iso-8859-1?Q?l8zy1OcUOwz/hk86pm0fNcqotCg58X+fgKd91hDOeCPm+OegHu+hwqDTe7?=
 =?iso-8859-1?Q?CROgf3ynZgE48sCVfcJ6UoyXeKLWDwIy+BV/2MYUq9FpJUBC16OdbQzMwG?=
 =?iso-8859-1?Q?MbXz4qNAfc/kdFhzh8lnfF7NPN97l30XRm/WivhikRGu1xs1lx1tmvKUMB?=
 =?iso-8859-1?Q?U8WS8/AeVtyRj++L5rAR9vmRv1Jrzr1GcjwULCQNZZGmbGb8WXLNiYNsgX?=
 =?iso-8859-1?Q?8fzAJ7FJkcEfs+ppH8KEpozZCf/tbm92EkHEeKgGDeiAt0L+Nr36henoXE?=
 =?iso-8859-1?Q?YUDkHLBwIluJw0lbIPTBtg0ij2sHZTyF23A4ixFhcjp98Spy0hmvM/Q3qs?=
 =?iso-8859-1?Q?nzr0vcBB0og9/PBYvnXukRSnPfOlo3SKfOIEw5I2zNoR4Q?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mV4VZFOe09SJUF1nh+NXnfn7uPZ8WrfC/a46SDAf2rdn1zFS1l69g45KrX/wLprJGKVG+9c5BmZ878ok4ufZ6o3FJ+9ETZ0iThdVhKH+GTZK/Ck+X5r7YLUP526Dd9gQ5ldQlnnnpXuMSNd/LTdzEA70UV/TRmLI84yL+Qv+3bOAWazdIXaWB8X3srL7s6PZ4kIuzPFtM/YlcYqKRMBI+tg39GAOtiAEvK54Etovd8e4Ffi5jjL4GtUCgXX3DO/S8hbUi6RIxnBpgcKD3/ON0Nqx4CRN+swjC1Sg0mfUGD5WmL0D7Rqt/c0taHRDp0A1Ga0ZJxMjjGsuDk1OtPRKVg==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c476ab-efaa-4be4-a425-08dee895ea02
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 08:39:30.6779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i5+oG0Jv/0xeclFRJz/zdQWkc29yWAB5CY96eU8eFJFyjGUOmEUBLc0pk4e/pt/anzwrNCcNQyVkYaFnZp/ONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9825
X-Proofpoint-GUID: niU3vvrDwTGZRDJne-LG-yQ_Eoqyd_6f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NiBTYWx0ZWRfX+W95nyZxFINF
 c5V9rF1VfyRG9w5mLbjCuAwj+lG09NxroV6Ld/VPd5Cp8DoLu/5Z5NjnBOcCsdyY80gZveeWHAT
 hQAKCkbrX9hm0+ELWlLsod4B4SNS+9k=
X-Authority-Analysis: v=2.4 cv=R8gz39RX c=1 sm=1 tr=0 ts=6a61d345 cx=c_pps
 a=BQMBfqo4H/Ek9IdlfhYwUQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=qMr132F7aASziHDET4f3:22 a=voM4FWlXAAAA:8 a=8k6WQxmsAAAA:8
 a=qrWku_wbSQoAw53ey84A:9 a=wPNLvfGTeEIA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: niU3vvrDwTGZRDJne-LG-yQ_Eoqyd_6f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NiBTYWx0ZWRfX5OhB3zKIZ6jC
 axjUOY89IkNPjNxTtvxK5wat2FzCXCeQ8EC+GhGpwm3Fk6Tn758EMJUDz/zlTXi/UcxJvFEZSUm
 nAUqydjPLzTda1a25KHUlgj5ot8wWX7Ntcq4VJNYBsWuxxvm0EgA6Oa6p0EejPckT46RjVm225b
 nJcXCRiuAixsNI38ak62xmaGLNd2bBMOSb91UBC8G9/ur9Xinh4jvH5R2kG/pRqz9DTlBQlhFbq
 JB0s0dYwAqUxzheJjLfaP3QunN3UgIKRi1p4+6zv4xG8PeY3b+R1Wr3+pUIUlWwh47pAzdJF2WG
 9+LAKnJqXjoTaavPgkfpqWSUCuI9NNvAsSthPRH4wcqeEuyNgXapRUn+2hQ3ryT8qdxWnh0bx5B
 NR2lz22tk5VUTLwGIMMp/GeHtlrqgNiZv13j8cfW2XgaleQCtqdBZ4fDxMMFMbvC76MyRO/Ne2n
 na0nLYI6b+K8odViSkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230086

>> >> Add initial device tree support for the Lenovo ThinkEdge SE70, an=0A=
>> >> industrial edge gateway based on the NVIDIA Jetson Xavier NX module=
=0A=
>> >> (P3668-0001) with a custom carrier board.=0A=
>> >>=0A=
>> >> This initial submission includes:=0A=
>> >> - 40-pin expansion header pinmux configuration=0A=
>> >> - External Micro SD card slot with dedicated 3.3V regulator=0A=
>> >> - I2C bus for 40-pin header=0A=
>> >>=0A=
>> >> Static verification passed: dt_binding_check and dtbs compilation=0A=
>> >> complete without errors.=0A=
>> >>=0A=
>> >> Signed-off-by: Jiqi Li <lijq9@lenovo.com>=0A=
>> >> ---=0A=
>> >> Changes in v2:=0A=
>> >> - Remove unused input-related headers from baseboard DTSI=0A=
>> >>=0A=
>> >> Changes in v3:=0A=
>> >> - Merge baseboard content into main DTS, drop separate baseboard DTSI=
=0A=
>> >> - Use stdout-path instead of bootargs in chosen node=0A=
>> >> ---=0A=
>> >>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +=0A=
>> >>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++=
++=0A=
>> >>  2 files changed, 114 insertions(+)=0A=
>> >>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinke=
dge-se70.dts=0A=
>> >>=0A=
>> >> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dt=
s/nvidia/Makefile=0A=
>> >> index 72c0cb5efa47..736a3f8a923f 100644=0A=
>> >> --- a/arch/arm64/boot/dts/nvidia/Makefile=0A=
>> >> +++ b/arch/arm64/boot/dts/nvidia/Makefile=0A=
>> >> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p350=
9-0000+p3636-0001.dtb=0A=
>> >>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb=0A=
>> >>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000=
.dtb=0A=
>> >>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0001=
.dtb=0A=
>> >> +dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-lenovo-thinkedge-se70=
.dtb=0A=
>> >>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb=0A=
>> >>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0000=
.dtb=0A=
>> >>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0008=
.dtb=0A=
>> >> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se7=
0.dts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts=0A=
>> >> new file mode 100644=0A=
>> >> index 000000000000..530d5bcaeba7=0A=
>> >> --- /dev/null=0A=
>> >> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts=
=0A=
>> >> @@ -0,0 +1,113 @@=0A=
>> >> +// SPDX-License-Identifier: GPL-2.0=0A=
>> >> +/dts-v1/;=0A=
>> >> +=0A=
>> >> +#include "tegra194-p3668-0001.dtsi"=0A=
>> >> +=0A=
>> >> +#include <dt-bindings/gpio/tegra194-gpio.h>=0A=
>> >> +=0A=
>> >> +/ {=0A=
>> >> +     model =3D "Lenovo ThinkEdge SE70";=0A=
>> >> +     compatible =3D "lenovo,thinkedge-se70", "nvidia,p3668-0001", "n=
vidia,tegra194";=0A=
>> >> +=0A=
>> >> +     chosen {=0A=
>> >> +             stdout-path =3D "serial0:115200n8";=0A=
>> >> +     };=0A=
>> >> +=0A=
>> >> +     vdd_5v0_sys: regulator-vdd-5v0-sys {=0A=
>> >> +             compatible =3D "regulator-fixed";=0A=
>> >> +             regulator-name =3D "VDD_5V_SYS";=0A=
>> >> +             regulator-min-microvolt =3D <5000000>;=0A=
>> >> +             regulator-max-microvolt =3D <5000000>;=0A=
>> >> +             regulator-always-on;=0A=
>> >> +             regulator-boot-on;=0A=
>> >> +     };=0A=
>> >=0A=
>> >Nothing currently references this regulator. Should e.g. the SD=0A=
>> >regulator below supply from it, or should it be removed?=0A=
>> >=0A=
>> >> +=0A=
>> >> +     /* Fixed 3.3V power supply regulator for external Micro SD slot=
 */=0A=
>> >> +     vdd_3v3_sd: regulator-sd-3v3 {=0A=
>> >=0A=
>> >Should be called regulator-vdd-3v3-sd.=0A=
>> >=0A=
>> >Also, please move the regulator nodes to the bottom of the file=0A=
>> >matching other device trees (alphabetical order).=0A=
>> >=0A=
>> >Thank you!=0A=
>> >Mikko=0A=
>> >=0A=
>>=0A=
>> Hi Mikko,=0A=
>>=0A=
>> Thank you for the detailed review of the regulator nodes.=0A=
>>=0A=
>> I have addressed your comments for the upcoming v4 as follows:=0A=
>>=0A=
>> 1. Regulator naming and placement:=0A=
>>    - I will rename `vdd_3v3_sd: regulator-sd-3v3` to=0A=
>>      `regulator-vdd-3v3-sd` to follow the naming convention.=0A=
>>    - I will move both regulator nodes to the bottom of the file and=0A=
>>      order them alphabetically (regulator-vdd-3v3-sd then=0A=
>>      regulator-vdd-5v0-sys).=0A=
>>=0A=
>> 2. Regarding `vdd_5v0_sys`:=0A=
>>    - After removing it, I encountered compilation errors because it is=
=0A=
>>      referenced by nodes in `tegra194.dtsi` (USB padctl) and=0A=
>>      `tegra194-p3668.dtsi` (PMIC regulators). Therefore, it must be=0A=
>>      kept in the file. I will add a comment to clarify it is a system=0A=
>>      supply required by the SoM and SoC layers.=0A=
>=0A=
>Ah, indeed. That's fine then. I agree that a brief comment would be=0A=
>helpful.=0A=
=0A=
Hi Mikko,=0A=
=0A=
Just a gentle ping on this series. Based on your previous feedback, the=0A=
v4 patches were sent on July 8 and addressed all your comments:=0A=
- Renamed regulator-sd-3v3 to regulator-vdd-3v3-sd=0A=
- Moved regulator nodes to the bottom and sorted them alphabetically=0A=
- Added a comment to vdd_5v0_sys clarifying it is required by the SoM=0A=
  and SoC layers (as it is referenced by USB and PMIC nodes)=0A=
=0A=
Could you please take another look when you have a moment?=0A=
=0A=
Patchwork link for reference:=0A=
https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D512658=0A=
=0A=
Best regards,=0A=
Jiqi Li=0A=
=0A=
>=0A=
>>=0A=
>> I will submit v4 shortly with these changes incorporated.=0A=
>>=0A=
>> Best regards,=0A=
>> Jiqi Li=0A=
>>=0A=
>> >> +             compatible =3D "regulator-fixed";=0A=
>> >> +             regulator-name =3D "VDD_3V3_SD";=0A=
>> >> +             regulator-min-microvolt =3D <3300000>;=0A=
>> >> +             regulator-max-microvolt =3D <3300000>;=0A=
>> >> +             gpio =3D <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HI=
GH>;=0A=
>> >> +             regulator-boot-on;=0A=
>> >> +             enable-active-high;=0A=
>> >> +     };=0A=
>> >> +=0A=
>> >> +     bus@0 {=0A=
>> >> +             /* 40-pin expansion header custom pinmux configuration =
*/=0A=
>> >> +             pinmux@2430000 {=0A=
>> >> +                     status =3D "okay";=0A=
>> >> +                     pinctrl-names =3D "default";=0A=
>> >> +                     pinctrl-0 =3D <&pinmux_hdr40>;=0A=
>> >> +=0A=
>> >> +                     pinmux_hdr40: pinmux-hdr40 {=0A=
>> >> +                             pin7 {=0A=
>> >> +                                     nvidia,pins =3D "aud_mclk_ps4";=
=0A=
>> >> +                                     nvidia,function =3D "aud";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_NONE>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
DISABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_DISABLE>;=0A=
>> >> +                             };=0A=
>> >> +                             pin11 {=0A=
>> >> +                                     nvidia,pins =3D "uart1_rts_pr4"=
;=0A=
>> >> +                                     nvidia,function =3D "uarta";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_NONE>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
DISABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_DISABLE>;=0A=
>> >> +                             };=0A=
>> >> +                             pin12 {=0A=
>> >> +                                     nvidia,pins =3D "dap5_sclk_pt5"=
;=0A=
>> >> +                                     nvidia,function =3D "i2s5";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_DOWN>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
DISABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_ENABLE>;=0A=
>> >> +                             };=0A=
>> >> +                             pin35 {=0A=
>> >> +                                     nvidia,pins =3D "dap5_fs_pu0";=
=0A=
>> >> +                                     nvidia,function =3D "i2s5";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_DOWN>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
DISABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_ENABLE>;=0A=
>> >> +                             };=0A=
>> >> +                             pin36 {=0A=
>> >> +                                     nvidia,pins =3D "uart1_cts_pr5"=
;=0A=
>> >> +                                     nvidia,function =3D "uarta";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_UP>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
ENABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_ENABLE>;=0A=
>> >> +                             };=0A=
>> >> +                             pin38 {=0A=
>> >> +                                     nvidia,pins =3D "dap5_din_pt7";=
=0A=
>> >> +                                     nvidia,function =3D "i2s5";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_DOWN>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
ENABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_ENABLE>;=0A=
>> >> +                             };=0A=
>> >> +                             pin40 {=0A=
>> >> +                                     nvidia,pins =3D "dap5_dout_pt6"=
;=0A=
>> >> +                                     nvidia,function =3D "i2s5";=0A=
>> >> +                                     nvidia,pull =3D <TEGRA_PIN_PULL=
_DOWN>;=0A=
>> >> +                                     nvidia,tristate =3D <TEGRA_PIN_=
DISABLE>;=0A=
>> >> +                                     nvidia,enable-input =3D <TEGRA_=
PIN_DISABLE>;=0A=
>> >> +                             };=0A=
>> >> +                     };=0A=
>> >> +             };=0A=
>> >> +=0A=
>> >> +             /* Configure i2c bus clock to 400kHz for carrier board =
peripherals */=0A=
>> >> +             i2c@3160000 {=0A=
>> >> +                     clock-frequency =3D <400000>;=0A=
>> >> +                     status =3D "okay";=0A=
>> >> +             };=0A=
>> >> +=0A=
>> >> +             /* SDMMC3: External Micro SD card slot */=0A=
>> >> +             mmc@3440000 {=0A=
>> >> +                     bus-width =3D <4>;=0A=
>> >> +                     cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4=
) GPIO_ACTIVE_LOW>;=0A=
>> >> +                     disable-wp;=0A=
>> >> +                     no-1-8-v;=0A=
>> >> +                     vmmc-supply =3D <&vdd_3v3_sd>;=0A=
>> >> +                     status =3D "okay";=0A=
>> >> +             };=0A=
>> >> +=0A=
>> >> +     };=0A=
>> >> +};=0A=
>> >> --=0A=
>> >> 2.43.0=0A=
>> >>=0A=
>> >>=0A=
>> >=0A=
>>=0A=
>>=0A=
>>=0A=
