Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18482E62A4;
	Fri,  6 Feb 2026 03:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770349254; cv=fail; b=L+koa6CQGL+faYiRnpTmEb/MlUpW0vrFxu/7po4j5pUo+uLBGJVqS4zU+EddAgJEmiDJR0+4ZVZeeeBfNWR5LPWAAX4rMDH8wJ33BL+SFalASAd1iZcdg44es99ncN9Uxc2w3ZfSPQe9oF+15n426/JPZCg1W3VAdewbS4u+zjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770349254; c=relaxed/simple;
	bh=xHLQfc7vDxObIYN3vU4A2S09IC8/+H/THPi4UxTD3AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I7H6/XEunUVPstcwlwTHt7p543Mn8OhJGTb0uuZf6pPEkRMpvfBTvmqA9tCd7FBV7i1l6Mh6+psxRwGV16VAcJUIeEGJfZKImIOyYrrFodHLTVvXSuILwAj+HCimy/TAZzzA9bsATe4dT8QbF0K1Fhqxg+lOvySy0QGwNRYMBsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fB1os5+z; arc=fail smtp.client-ip=52.101.56.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fB1os5+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBmrj3DLrKjBYYHApB+PP3vy/76aEVh5OmxLAk+FwqGHHfLX9lAkcecys0lo/DcfpEn/f684JArJzW/UHxATLVSouKdUUAx7FHONCrjNVAZm3NkQ5WjaJgoV1DgP9olJpB4PSwXwA5QWZaANYXcv7BBQH7PgKxAcxTy5omP4Cf4WJq93rYUv5s4aPS2PA9Md7QBp8TE1GoOmEliLGzlqYg1ffB7zVEkTntyuDIxcVNsNuHt86+MySP22DiUlSdS7Y2CyXYQ9IVUB8dtX9drYYHg9gOvJjzL+UAe52GyfMieMeJAl2S4babaoDef2Wjf+lebOFgMImI6p8iM5aUO8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4az3chT7W7tjL4DsHecKGXBtxHaLn4yxnvausxAl5YQ=;
 b=seLSGte8qCOvm4apg/RRoIfNMSGxD90gibRX26mrFKu5VN6/PS/BPnk9n2ZqCUgStRWMPIBju+3+n+g8iqwqNGpm2L1RDkOH2wbEQXriAOJ3DGHrEb5pwqU1Uc9pJWvR4rStcwfbeR3bi/3wHtWPylxhdTgq8I2FNrPs/zEY3XkR2NL/VgMjgSfu32kT75e4HDEe1N5rdWSKCJ2EcDImIZI1H0X4/1Dur7KN8CPHEbrPFWT//nzQ5vCoKMEWDKQVoHXjmYIgKdFGizrhaIIyl9uJ/IlacBdqg7r7zkRdEDj85JZTxjR9gFPpRqIz1ckr5t6GwR+9MpB8F8ldOL3A+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4az3chT7W7tjL4DsHecKGXBtxHaLn4yxnvausxAl5YQ=;
 b=fB1os5+zli8crLSCm1CSeoPOsxlATAznOF+CCVTTdjLRKF1bUBQqep1r286VU25Cd5Hxeu37IdjhoA/pQSsl7wt4OPHLamOTZuEw/KFtKbQT/9UhTAZiEdDcGILpcBhp7SNlorh1vuX9bf5GEFI2Vu4n/3jhSjm08FBr30x/Lxh/U7ir+iy4U1B0hdfeAt6RVIjttQfF3qL5fn51aYE8DwslrtCqn/LoBMej4QW38LSEfPbeIQdlQxnE2s5z5XT4OSd2vtecZR7+YB3Dy55hjEP0aq0KEabIs0bD9jWhZO34TXbzQBVNrxDDE32BFP8oL05Qk5Z+p6LSkNjZFb3jPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 03:40:50 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 03:40:49 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v1 3/5] ARM: tegra: Add EMC OPP and ICC properties to Tegra114 EMC
 and ACTMON device-tree nodes
Date: Fri, 06 Feb 2026 12:40:46 +0900
Message-ID: <6698837.lOV4Wx5bFT@senjougahara>
In-Reply-To: <20260126191536.78829-4-clamor95@gmail.com>
References:
 <20260126191536.78829-1-clamor95@gmail.com>
 <20260126191536.78829-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0159.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f83baf6-f346-466b-228c-08de65318500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajBuZXJzc1hCbXlWMHN0RWltSm1vYWV1dTdNWHNZeXZnQzh3QWkxZVo0eEZG?=
 =?utf-8?B?UnhKMUF3ems3WDRSLzVXNTkrUmRHRmdWdTBaVXpGM1VpVVJYbm5uUVF5dVJz?=
 =?utf-8?B?WWFQZWVXS3JkbkFUYUNSUEdJcmNYdkJ1UDdKeW1vT3pBSDE0aStIRjAvdXVm?=
 =?utf-8?B?bzFVRzRxTmtUMGRoVXlxZ003Zi80UUFyMGYxNmllQWdub2FadWhHWDdJdkQr?=
 =?utf-8?B?V1BFOEVpdnVPZ3NnMTlmVjV4VnVOdUZNWDR2TnM2c2xQeURpNzU2SThkY0Zu?=
 =?utf-8?B?Zkw3aUFjRjUrL1FGQ1BjSDBzOVZ3dm0waUR6cE8yOWs2aGwrUVhML0c0b0lX?=
 =?utf-8?B?SU9VQ3ZDeFVvV1EyRjc5NWdMK0F3aFh6SThPZ0I1NENMTlltSkVUUVE4ak5B?=
 =?utf-8?B?ZzlOaW5OdktJZXZ4VW1Ndm5td3h1VXUvQ2dIbVkySGFjL0tyTitFRVJicVQz?=
 =?utf-8?B?UEQ5dDEvMGxNU1FzUEZNWFNtV0dwVzdxdlJUVEJEQzJFdDYzN1dGbEZSc1pk?=
 =?utf-8?B?d0dVRC8vSGJJWVBCNGtlUkpkelc3QjVjSFgrN0tiRGpoUXI4aTVqUlJDSFor?=
 =?utf-8?B?dmRuY29uK3pkS1Y1ZXFkQWNFQmxHbXM2dTJ3cGZxWUQwVnp2MWpoUmYrTkJv?=
 =?utf-8?B?QmY2TXkrNElpcGYvMEZCRzgrYm56SURrUUJDblNPQkpZSGl4WkEyTVpTTUJv?=
 =?utf-8?B?TWd4QmQ5SkZQUHZveEZuQTJLZXZmUWZzYzBzdFpkNkdGOTFNdWpRWm1XSk55?=
 =?utf-8?B?SStDS29QSGxUZDVkNWNyVUlaak0rYXE2b2RvS0M3SDJPaWtsM3hjZ3JCcWVC?=
 =?utf-8?B?UEM2N0p6ektxK0Z5RHF1OUk2eHc0K3JJciticWVKQTU1bnIxNnMvRGhFWW04?=
 =?utf-8?B?eG9jOTNSR0RKSXlTNzE3N3kzd1FUQzZwOWpna05HTDRSMVFWL0k0cmhGMEVO?=
 =?utf-8?B?d3ZGSVFuMzE0a3lGRVlLK1lKbVo1UDhxWENBTTRZMjZZTU5nWnRwR0JGR0hH?=
 =?utf-8?B?a3ZoUE9YSTJrK3hrQnFnNjBiTVBxQm5IMUkwakprczNYTzFrQ1BZS2NsK295?=
 =?utf-8?B?OWk5M3hnMHZiaEJoSXdmSVN5ZFQ5UFN6VGtjS3NuMUpER0U4ZUl4UGdUZW1n?=
 =?utf-8?B?WVNIbFd4eE9TZVRyS2ttd0JPRVNEUWZoREJmdHY5dTlUWGJMbEtpOE5IL29O?=
 =?utf-8?B?YjRPRVpvbXluakMxSzZqc3A5RSsxU1c0dGRxT2VvMGJocHV6UytMaXhUaEk2?=
 =?utf-8?B?Nks4SGFUdExPWjN2QWRBVml3cVpxaW5OaldiNDFwQ21yTlpUNkpKUy81SUly?=
 =?utf-8?B?MkNDd2cyMyt6d2diSmhpcjhydllyVno2R2l5NUVlVDRyU3VPRU5WNjMxKzBT?=
 =?utf-8?B?UGRFUU9sc1JlUHV3OTU2MG15dnNjQkRKWlAyUkZZS29WendhYXBnN0RvWElX?=
 =?utf-8?B?QUUxL2J4NUJXVkkyeEhMdHNPYW5XNUI3aTJqZlBEbHpGaG9aRmw1L0FJbGdm?=
 =?utf-8?B?bU9TVmxIUjBOaUxGMmRSK3hmd3lwbWxCRkNjdUhwdkpFZytQR1d1akpRa2l1?=
 =?utf-8?B?ZW9pMUY1MEpVUEt3bGdTb000aHA4LzNKN0xYSXdyVlhMR3prOXVBeEVIU213?=
 =?utf-8?B?KzI1T3czMEVvS213TVZzWi8yemFmd2hlWDZqK2dtZzRIK1J2bXVJSVhEaE1l?=
 =?utf-8?B?RWtxMExLcStMMjVrczFsWXpUSEFBdWVmQUQ4bG9DakVBM2liSXlvdjlPVlJq?=
 =?utf-8?B?TzhFUDYyQXVObmlUalNFRXJvS0tDK3NQTStvOTg2VG5mOEFJMlR6RWIvdGpS?=
 =?utf-8?B?UmZYcU9FUllZWUpRTWdwbEJyOEdZTGdPOEsrV09nMTUrc3VJU1VoRVRiTzZI?=
 =?utf-8?B?QUhVZUpydXB6aUV2bXNsZkpVbHJlcWl3ZllybFlkY1BFR0ZoNlNhYWQ1NFJY?=
 =?utf-8?B?WnFmVEFSWnhVK1pQYzVMSzFTc2FLbVNmUndqVVR1Yzd0K0R2MjlrUnJiUVhB?=
 =?utf-8?B?cG1JdXRvUzZxQnJ4VmtML2o3M29ZTFl2TkxDMEJRdDlHQmlWb3R1Y3dsWjBx?=
 =?utf-8?B?SUU1Sk0wQkc1aWNwck9uYVJvVDlUOXVITkNScGY0ZVV2a3JkckV4eXMxRVpt?=
 =?utf-8?Q?Y2co=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0FlLzQvMEpSYkZvUWJNMmZPVmFCcjdkTnBWdlNRaXpTR0Uybm5tKzh3QmNJ?=
 =?utf-8?B?R01Zc0tyTWpJK1pzS2loalptUVY3bERZUnUvZWZVT2dxQ2JURkpnMWs1QklW?=
 =?utf-8?B?T3lwRVBiUGZFVmNnQ0tBaXlMTHlmOVNzc1V1aWhtdldaYnN0aEsraTNTSEY3?=
 =?utf-8?B?c3JqZG1Td0UxNEVPdkpxb05ja054djV1V2VTQzRXRS90cTZwbXFlVDU4NmE1?=
 =?utf-8?B?R3FQQUhRd3U0ZmVPbWVkZGc3RGVGczd2Rk4rMHRqWURaelNtR2hkdFMrd1hX?=
 =?utf-8?B?Qk9XSzQzZTh4NmFxbmExeFNiQ2lHbE5DN3M4NU5RdUxZaCtLQTgrK050VmJQ?=
 =?utf-8?B?WjBkMWxJS1N3c0YxdTJ1NDZyYmdVbnNPYTJ3ZVBlMlBiTFNobzFOSEFlUUFy?=
 =?utf-8?B?RVZsS2hINW9aSy9rc1RnZnVQaGZsK1BQVXFJRldoMnBvMHliNWF4YmQwQVBB?=
 =?utf-8?B?bEV5ZFYwNGU5S3JPNnEzV3FOdkFZQzIzTWpCQk1JZExZNUI0bk8rd0tHS2JI?=
 =?utf-8?B?UVBxdUNpd3VicXg5Tnowb1lmUmtyamFlZGhXY25uRDk0MnJlalRkQzhjTHBz?=
 =?utf-8?B?Z2Mvbm9JWmpYN1JlV2F5dnpFNWNnRXdkNDNKeXRUbHVWeW5rRnFXdndhR1hV?=
 =?utf-8?B?R3BXSmVWQ0xSallCd08rbmVQMzFENjhYREpKYTloRks4eTN4VEdoOVJ1QnJB?=
 =?utf-8?B?OFZQTUpwNE9CVHFjL3g4anR1NC8wV3dQNHkvVGdoT1F3eHhPbTNrZTA5YVRD?=
 =?utf-8?B?Mi8vaU96Q29ZcUdoUWFqWDRrUnZiR2RWeG5qbDUwSUVNS2xhVXo0aXVEaFow?=
 =?utf-8?B?dHhFdXRGbWRzS1BMQzN3bzhGSXd0ckxyaGcydU10cVRteFgyRDM0TnJXMW5o?=
 =?utf-8?B?eWhDVndiaGlkWjRENHlmQXNOVzVmZTRRU3ZXTEZSK0pvYnRSakRaVCtpdlZj?=
 =?utf-8?B?Ti9kdE5EL3dteHlaMFFqZmczV2JsZE9uazNQMzZESkxlNnVCcngwYS9WRVJi?=
 =?utf-8?B?WXNnWlRGbTFwTE8ySUxjTnpSMFhsTU1wZ1hoOUsxNEtiOEJnQnBkV2wydHFL?=
 =?utf-8?B?djFwR05CZ080c1MxK0xoL2dvZlhJMmw5azNQdjd0dmkvMFdHT3ZLYnQ3SGFq?=
 =?utf-8?B?bkNzTFpNUFNLaENPMlZHZ2tVUyt0Szd0Mm5iL2w3d0xIRlJhc2VsamhHM0E2?=
 =?utf-8?B?YnJJNmlONHN4TUw2ak9vOFBldlJMNFYwMTR0S3hyOCsydzdCZnRtMUdFQkNx?=
 =?utf-8?B?NHRKcU9RYjh2cUdkS2N2alNTUjBiV1habXAzbUVzTlB1UEJYL0JHcGozbWdu?=
 =?utf-8?B?NjEva0N6SDJhOTE2YkpRSUtQbmFCSHZIanpKRHZ6ZW5vNVJaSVJvcXo0YzJk?=
 =?utf-8?B?RTdZTTlwU1B1d1BtS0E2R1NhdmtNSHc0T2NiUUI3ZlRlajhuYS91dkdWSWJt?=
 =?utf-8?B?V09ZWjFlZVcrV3BYdkhPMEQ0NHl1bEhzaVZMTHZwRVhtYncya28xQnlwZ2Zy?=
 =?utf-8?B?cGJaTFpFV29MNk4yWjJWZ1NKVnRkajVzMEc0R2V2eE5rbUdlK0E2SEZla3Fz?=
 =?utf-8?B?M1AzbzhTQTZwY0dRRk82bU1UdzcweFlSS0QzL0FDdThQMDh6RDVGWU5aTHVB?=
 =?utf-8?B?YnE3NWM5T1MyaExYTGxWTmVjKzhCMjhQeEFJUE8vcjF3Q0ZTdndZUk9SdG5K?=
 =?utf-8?B?WDl2V0JsRGJGdlk2LzNYeDljTXpSTVRLNjh1N0psMkFOWlpCNzQwNjVBS1B3?=
 =?utf-8?B?QUxFcTFKaWlnVFIxYlhZYTNMUU03TFowSDlJcnVBMktJSkI0c05DMXZERVAz?=
 =?utf-8?B?MStVaUswR3JlNVFoQkxlSytOeXBNTGRRV3JUKzc2YXNWb2t5VVlKbC9KWDNR?=
 =?utf-8?B?c3BHUXZxLzhKdnlKODRWdXhtTmZWcmd3aHJDQTI2UlRqTVo4VVFEWWxiS1FH?=
 =?utf-8?B?V2g4NnR0RE00Y2RXMGxsQmZqbzVxUk1hUXhuVFZaVjRxRnhKdWE4WDFyOHE0?=
 =?utf-8?B?V1JHWXI2cjBSMklHRTZjUW9IWU5iakVEY2YrNUxXdUprbjNWYlFoUHZYbThm?=
 =?utf-8?B?OFJjNTRCRklQR3NWc2pzV054MDhnSVZUVysxS01lbUtVdjRYTGdVdjBuenlG?=
 =?utf-8?B?aXVuNExNZlVDTHlyN3J4czM5dTdGcjlQd2JreE9PYTVZdXVGbFQ2YzVoMlJJ?=
 =?utf-8?B?ZGttNXl4SUdDRUxNTi92ZXpwZzdxcXNhOUZTc0tYOTlWVVBXT05NSUY3RGkx?=
 =?utf-8?B?Q09LWGZHNE9xUlpNdFBCNzNlcktEeHJsc2IrY0VvcFA4Q0I0NE5qcWN6RllT?=
 =?utf-8?B?a3FhWDBzT05ObTVvMW1SWFBSalJ5NXJ5YjF4cVdZS0RtdWZEZ2o1NkxwcWwr?=
 =?utf-8?Q?l5niIoq42gqHuazr1zsJsrJ+J0R39RVcWuStICJa3exUC?=
X-MS-Exchange-AntiSpam-MessageData-1: ORmENt3/oqWLGQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f83baf6-f346-466b-228c-08de65318500
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 03:40:49.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqiBF7RG+zWCEqaLwrpv0DdtPnxr07A5cwKM9H7vJEB2XYXsYU3r8urJgdtpR7OYxuys65HzB0ugoLLPHnoU+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771

On Tuesday, January 27, 2026 4:15=E2=80=AFAM Svyatoslav Ryhel wrote:
> Add EMC OPP tables and interconnect paths that will be used for dynamic
> memory bandwidth scaling based on memory utilization statistics.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../dts/nvidia/tegra114-peripherals-opp.dtsi  | 164 ++++++++++++++++++
>  arch/arm/boot/dts/nvidia/tegra114.dtsi        |   9 +
>  2 files changed, 173 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dts=
i
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi b/arc=
h/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> new file mode 100644
> index 000000000000..b40a1c24abab
> --- /dev/null
> +++ b/arch/arm/boot/dts/nvidia/tegra114-peripherals-opp.dtsi
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	emc_icc_dvfs_opp_table: opp-table-emc {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-12750000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <12750000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-20400000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <20400000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-40800000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <40800000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-68000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <68000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-102000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <102000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-204000000-900 {
> +			opp-microvolt =3D <900000 900000 1390000>;
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-suspend;
> +		};
> +
> +		opp-312000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-408000000-1000 {
> +			opp-microvolt =3D <1000000 1000000 1390000>;
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		/*
> +		 * T40X can work with 1050mV for 528MHz but T40T which is
> +		 * in the same group as T40X requires 1100mV. If there will
> +		 * be enough data that T40T can work reliably with 1050mV
> +		 * for 528MHz then voltage for 528MHz opp can be lowered.
> +		 * T40S should remain with 1100mV for 528MHz opp.
> +		 */
> +		opp-528000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <528000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-624000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <624000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-792000000-1100 {
> +			opp-microvolt =3D <1100000 1100000 1390000>;
> +			opp-hz =3D /bits/ 64 <792000000>;
> +			opp-supported-hw =3D <0x000F>;
> +		};
> +
> +		opp-900000000-1200 {
> +			opp-microvolt =3D <1200000 1200000 1390000>;
> +			opp-hz =3D /bits/ 64 <900000000>;
> +			opp-supported-hw =3D <0x000E>;
> +		};
> +	};
> +
> +	emc_bw_dfs_opp_table: opp-table-actmon {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-12750000 {
> +			opp-hz =3D /bits/ 64 <12750000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <204000>;
> +		};
> +
> +		opp-20400000 {
> +			opp-hz =3D /bits/ 64 <20400000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <326400>;
> +		};
> +
> +		opp-40800000 {
> +			opp-hz =3D /bits/ 64 <40800000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <652800>;
> +		};
> +
> +		opp-68000000 {
> +			opp-hz =3D /bits/ 64 <68000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <1088000>;
> +		};
> +
> +		opp-102000000 {
> +			opp-hz =3D /bits/ 64 <102000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <1632000>;
> +		};
> +
> +		opp-204000000 {
> +			opp-hz =3D /bits/ 64 <204000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <3264000>;
> +			opp-suspend;
> +		};
> +
> +		opp-312000000 {
> +			opp-hz =3D /bits/ 64 <312000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <4992000>;
> +		};
> +
> +		opp-408000000 {
> +			opp-hz =3D /bits/ 64 <408000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <6528000>;
> +		};
> +
> +		opp-528000000 {
> +			opp-hz =3D /bits/ 64 <528000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <8448000>;
> +		};
> +
> +		opp-624000000 {
> +			opp-hz =3D /bits/ 64 <624000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <9984000>;
> +		};
> +
> +		opp-792000000 {
> +			opp-hz =3D /bits/ 64 <792000000>;
> +			opp-supported-hw =3D <0x000F>;
> +			opp-peak-kBps =3D <12672000>;
> +		};
> +
> +		opp-900000000 {
> +			opp-hz =3D /bits/ 64 <900000000>;
> +			opp-supported-hw =3D <0x000E>;
> +			opp-peak-kBps =3D <14400000>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/n=
vidia/tegra114.dtsi
> index 77ab17f397f6..9acba15fba25 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
> @@ -8,6 +8,8 @@
>  #include <dt-bindings/soc/tegra-pmc.h>
>  #include <dt-bindings/thermal/tegra114-soctherm.h>
> =20
> +#include "tegra114-peripherals-opp.dtsi"
> +
>  / {
>  	compatible =3D "nvidia,tegra114";
>  	interrupt-parent =3D <&lic>;
> @@ -323,6 +325,9 @@ actmon: actmon@6000c800 {
>  		clock-names =3D "actmon", "emc";
>  		resets =3D <&tegra_car TEGRA114_CLK_ACTMON>;
>  		reset-names =3D "actmon";
> +		operating-points-v2 =3D <&emc_bw_dfs_opp_table>;
> +		interconnects =3D <&mc TEGRA114_MC_MPCORER &emc>;
> +		interconnect-names =3D "cpu-read";
>  		#cooling-cells =3D <2>;
>  	};
> =20
> @@ -655,6 +660,7 @@ mc: memory-controller@70019000 {
> =20
>  		#reset-cells =3D <1>;
>  		#iommu-cells =3D <1>;
> +		#interconnect-cells =3D <1>;
>  	};
> =20
>  	emc: external-memory-controller@7001b000 {
> @@ -665,6 +671,9 @@ emc: external-memory-controller@7001b000 {
>  		clock-names =3D "emc";
> =20
>  		nvidia,memory-controller =3D <&mc>;
> +		operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> +
> +		#interconnect-cells =3D <0>;
>  	};
> =20
>  	hda@70030000 {
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



