Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235332D876B;
	Wed, 22 Apr 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776889040; cv=fail; b=sQtgQ+LWDD7La1+YlP5igySgeMLwYFpubUCjnaNabhsviLuGoiscYG+4XhwmBb+KmB7FvakHdQHWAPJ9Yizi7pxsI8twbnz6scN4qTG579x7kPZjwubGEJZmyCpnN5jA57vSoABflU7pu91k6JAMUj09uYhN6rKwhSa7orWR/zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776889040; c=relaxed/simple;
	bh=g3uWiks58ZsWjN0CpjGueOBhTu4XoGr43e//3fNkMI0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QVFOBdG5HBVcyzMdGmWHET9P2fqfwEAZX6wPomNYZwGHSK3VN+5xmvXrV6g0Y8Pc9hGycAnBYScBAYcjsD2RZiExnCXqXDkvnSoRzCOIVONrqOxnv4QdFMZSfSPFdOEIu6rSctzZ9zClLrHTaDkmSNAaSAd1lIpuiwsYWzRCYRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S8/azgFC; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S8/azgFC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxHMIKp5JnD6gHlxMIJoCXlfbYJ/+jgC3O9hnecU2VMRJuiR43BGye4NKvZlcyfRVTSFdxfIL/Zz3TxR2uMT3WkvRBhkrbPgMCiBNWuF+g5AI4XVUmu1lnvs4G8ORKmgDrLjXmpbc4+ROColWbzQ3LmNe1uGUj673peeL1IFFfhnsLjyPyQcEzYfjLlRf7ME1WPaYoyVRFYAjvKX6NgDxBpO5T020p3qftlI/gtL40Rvf3TdYbhIJr+bvjZJzF3C4z+sXIOnuJzvpBDtgeyJM/QA9V44nB8wKZCrXM/vWjokOcZ3VYzf4uLVn3FIA+gC8YCuT7kUOG20SlqZu/ybUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3uWiks58ZsWjN0CpjGueOBhTu4XoGr43e//3fNkMI0=;
 b=AjJt02n3mecvAale34ypwQSVcSvkj3Dho0v+PwkgzTfs6ZVCslXPiZ0fuXk+PJjPLv4U342Gn+6GCjY3pehpsi8avRpY4PTD6s8yMpljsPoDeL2NbYF3MacIeMNefb9243KV/BpP/5QfUyGamyPVG9fKoXeJHZsYcDqRiXqpzJnItCNmns9hS1TsskWghACu+etQOdkvpENfEWSY51yawjiFgeksNEfZtfQpfIDNbzi96fvCxQy7xD+mDKsRmbtd74Vp+FqPSlb7P/t7ghxnToceK5WGgBoz5sL5+bZv+3wr+5VPjr9x7zgTvX0r+6tjKIaOI97uFq5M2BNssaGZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3uWiks58ZsWjN0CpjGueOBhTu4XoGr43e//3fNkMI0=;
 b=S8/azgFCYGrrWPUBmrlIkJVPwbzXLiFdNd+44Ulv9aOkFsq5RW5TDQEIBCjzfl6WCAxEAdznfJqu/lUSG9wR87fMgCmMxFXQW2MuQ9z5C3nD2bxJnzUATWd73c+1hRygAv5WgD7tqY89spKemqAyC2aqW7UbHAC3FqjoRdo3hPequclx6Hlwu8THxM+llKUt0HM97dCyJdnZEwDlDFJZzP0uBcAIM+FfPenfWPQgvpjsijTZ1Rj/frxreDuq1UgL1/MfVI+Ff/qdyjEPobIA1SWZaf8CFiXSuLuoTmm1I2kJxPKxwnX8C4qpGHVtFIzbPceYN8JZ6v7fumLR6ezAdQ==
Received: from SN7PR12MB7226.namprd12.prod.outlook.com (2603:10b6:806:2a9::18)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 22 Apr
 2026 20:17:12 +0000
Received: from SN7PR12MB7226.namprd12.prod.outlook.com
 ([fe80::c07d:130a:7def:6807]) by SN7PR12MB7226.namprd12.prod.outlook.com
 ([fe80::c07d:130a:7def:6807%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 20:17:12 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: James Clark <james.clark@linaro.org>, "will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Rich Wiley
	<rwiley@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Matt Ochs
	<mochs@nvidia.com>, Nirmoy Das <nirmoyd@nvidia.com>, Sean Kelley
	<skelley@nvidia.com>
Subject: RE: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Thread-Topic: [PATCH v2] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Thread-Index: AQHc0c7yos7CcRPahUaeUXks18pTqrXq4xGAgACF2xA=
Date: Wed, 22 Apr 2026 20:17:11 +0000
Message-ID:
 <SN7PR12MB722693E924425893F4A62D54A02D2@SN7PR12MB7226.namprd12.prod.outlook.com>
References: <20260421203856.3539186-1-bwicaksono@nvidia.com>
 <b1458bc3-0449-4f0f-b346-d25547dd4c97@linaro.org>
In-Reply-To: <b1458bc3-0449-4f0f-b346-d25547dd4c97@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7226:EE_|MN0PR12MB6102:EE_
x-ms-office365-filtering-correlation-id: 64451d39-6758-4441-748c-08dea0ac2340
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 JlXciMQ4GBKBvrBeHzX7lFVlz5xLk6/ITCOkYn5guj0X/NTjKZ98gUa7yPxHT35OCslEffdb1BEdAGz/rSIKvvB5fDQhfPdLg48a+j8cJ9i5/6B06bEQx4KJL8ub5wcI4XdgwZu1Xft5t8WpJk6WDxZCrlLa2s/mSuPfH8XbWo56SfLodc40X5qmb+g6J7Omod17k/SskngnBetDxm/0RdYaeYzIYPq44b3LU2W85tAIEQ8Cesv5e00WdBy/n7AqtkR7gAsakZU0ergdyUKJSzC8c+GU4oxeqG8p02GYbBQa55jSGIfnhfneaF8YJlPe8eQnpc1roSQ1ostUrt2YotKvPEr0uBulel4Shc0TRzpziqoK53Yp2iXJ4thh2mGXAHF4m0fplW2tgUJnmW0MM7fxbJC2RBDZEwD7X5CVvFDDZECKzZGAlQRkcwoH3f2AL/TtSqyMTD2xgW3jNtstW3FfDpKsR8Sg3OZyL9hb+Xe57al19cioxo2jGOpfzB8j8MJ8JtmFx/Yv3i+5Z9Arfz10Fthc8r1krcRYnvm10k9MTdSVqkWudixP3pw8Q53qXWgQ6hdQZ3KSn7vE72FaA95rHLPV/6GIOpannIHhkRINadvGngyCydtAym9LZEL+eFwMevCLyCXn2cWL+Wu3yGaZOtD5NrvHGiDEK1xvN3L70WQCE9wkDIcSzEydAjxwrS8HLtZ0aRCVzTunYe3VemgxvCT/5uuF/AxUFvG2xqrbig5Hf21rBI5gS2s/PxIs2AjtT4c1jia9j//rfGU5QtFzKf7jVQiQAp1oWTLjaQg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7226.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VHMzdEd4aTd4bVBzeGx3QWxDNnJPTHZrem1LZnhob0tLKy93em4zdzREdmJ2?=
 =?utf-8?B?L1ZNSTFyZVdLbVMwV1FWME9YWEVlZ2dIMC93V3YyN1VCUTNGcDJYak4rRmps?=
 =?utf-8?B?Ym9PMEhGamZuZUFuOU5qT3g2VjNYVkxxVlRvTTRZMWhKT3BDa1pCT2ZxTHNW?=
 =?utf-8?B?MDNRb0RjUUFObU1CM3lNbXNPK1BURzZZR2FDbzdWcVh6MmNSQmY3Q29HTFo5?=
 =?utf-8?B?cVlSbjFaMXZwR1hHVVFsT3h0L3A2QklPQTd2OEhYclN2ZDhNdmZPU1hpeFJU?=
 =?utf-8?B?RWQ0TVA0MHMwUHNIdDBmR2hJcjZIQ0JpQno1Z3RQWTM5RU0yTHovRnpZVEVu?=
 =?utf-8?B?RWhkTVNybFpjT01xSnh5UlFtTXZsM1N1RDM4UVM5RUNmUWE0czBpbmJWYWN3?=
 =?utf-8?B?ci9zWHFFTElqaVdjbFNpT2hPN1ZDd3hRR0s5enBvYzhqZWNOYXBhTk1HclJh?=
 =?utf-8?B?dVhBemRYQXdxVURGTWFuOUxLdXdaTHYwWXVQTXNyOVk0ZWZEU0Q4L1kxc214?=
 =?utf-8?B?dWNiU0g0bmg0NUs1a0s2THgzd3l2cnQ3c2VVNEJwL1V1MEpGM3JUaDgrZXZU?=
 =?utf-8?B?dUhwZStBMGpEeDJoYUlST3E5YTRTQ3lkTzZkbjg4czhuTW1aL3I0SHlpMzBX?=
 =?utf-8?B?enVUc3BTaUMzY0crQnpFN0lKLzMzQk8wOHVHMVBFSVB1Ni9XMWdSd2dFaDk1?=
 =?utf-8?B?cFZ4NjljVjN3NmdWdUhUVmNBTlBkZG1qcUM5VjVDT1h0RHIvWXhBQjNFVmtK?=
 =?utf-8?B?a0dOSTFDNVdxVS9QVkdlUjVuVk5Way80RTZoMWVhNnJhRFlYM3hCZnlaanRU?=
 =?utf-8?B?VHhnYXJCbE9sdkpCaUtHRnZhdEpwMnFMMHl0aG9seHZwMWRtWjU3clNIc0I4?=
 =?utf-8?B?MTVSU2FoWWNEclVtczRhcTZmSDhYUHFXNU1Edm5jSm80VnlNQkcvNWw5UXUw?=
 =?utf-8?B?YWlsdGVHSTZmQXpnY25POUpTRzZpSWc0Q1I3TG53dkRLZmFVQnFnQ1VCZUFU?=
 =?utf-8?B?bXpJZnpwUGJTeFNJeDFaZWFkOTN2aGNZVzBidGF4SDZ5Z1I2N3owcWc5MHRI?=
 =?utf-8?B?OVIzR05ob0dKRWdGS2lIWkQ1UkJ0VHgvREVxMktCb1NudGpIVjhGeDNZdWxw?=
 =?utf-8?B?NUhxcHZycStaeitBQ3hpVkRVT2F1WDlDR1BSVHhMaElhYlFGb2RuaHlJejRq?=
 =?utf-8?B?QStWRFpsOFl6RnBObE1tYmR3WE5VdVNMYWNrR0RuOUJ0aVdXbUQzU1poSUg1?=
 =?utf-8?B?bnN4Nml2WktFWXBCNkNKRVc1eCtidW1HRy9yNW56KzlxNlFxTW12MVFVQTVV?=
 =?utf-8?B?WW1udHU1SC8vMmpnR0xYbCtxa0dUTlJyRjRleThTNk1uVlhISWhLS0RFTUgx?=
 =?utf-8?B?UTV2QWNRanhhK01odjcwb0pWdSsyZlpFVHZmSk1BRjFsUEswRjU3OUtQZTcx?=
 =?utf-8?B?OEhsZkUwa3FsNjl3QjNNUW5qOENiS2wyMVdxS0R4NDlRWEFSYTVjZjRWYlRW?=
 =?utf-8?B?cmxFakhyZnEzNnR1ckwwSmpITm5vcjVHVHpDNzF0L1BYWWNxcythc0JXMkNL?=
 =?utf-8?B?TmhUNWp3RFpWYTROUUVSSkRUSFFTK0Yvd3lOUWh6VEJFeG1YNmEzOXhUYmlz?=
 =?utf-8?B?L00wS3VjZHRhQVZORmMrZ0pIWGt5UlM2S3Z0ZFNxYmw2WDJyUFRwb3hvcEk3?=
 =?utf-8?B?NUxSaWdhWkhkUUNIQWJmNG9JcGJDNjZvcmxPTkVDME14bEVIbUQyQk1XZ2wv?=
 =?utf-8?B?SnYyTWhMQXNudHBWa29QQkE0Wm91Nmd0ZDJrdkVyTG9VY3BZa1ZmWU1sNmdu?=
 =?utf-8?B?dVIrWlpPYi95cWtESUFCZzJFUkdwTUpSWTBmTGE0ZmZBSTdnWkVqMVBmeWh1?=
 =?utf-8?B?L2dDc2VZTm9QNkVlUWhkM2ZlbmkrTWw0bCttd3RGdW5nclFYSDRpZ2x4eUFv?=
 =?utf-8?B?dWlQWDU3cUcrNjllZFJEZE1NaGh5Y2ZETmgyRWpqOHBxU3NYWTBsQ3NxOHZt?=
 =?utf-8?B?NlBEVFJReWhhS1dsSUxjVHNDZXc3TUJndmorRlpNT0daVnZMY01NSU1PZ3JM?=
 =?utf-8?B?KzBLZDZnQmtIQlNsTE4zWVRyckJYTVlZQUpDTUpIRGNKRDVyL3BhNE9UbS9U?=
 =?utf-8?B?dklLR3BHOEY5UVYxak1OV0REYnpqdUdqQmxkaHQ2ZldmOFdwQ091bTRpZjJM?=
 =?utf-8?B?bkhmTnBhb2tzQkpTLzQ1U3ZJZWZIQWtBc0hpNFVqcGNmTnJpZXFVSXNacTN0?=
 =?utf-8?B?SXM5WitTRFNkdDJPVWptc01uVjJWdE5mdStqYnBmMnEzbmVUZnpBRThxVEhW?=
 =?utf-8?B?ZWRNSEp6bFhBQmJ2c0ozamtodnM4Qk9OeWVBampiL1dTU1pVS2FnZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7226.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64451d39-6758-4441-748c-08dea0ac2340
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 20:17:11.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wQULhOH9e78yv5KZJaLFVWGmTb+sar8oPL6hSDq7cikvcxM1csRTjVmPuiJ77HE2vYx0HyATmFpvUxHarvqRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgQ2xhcmsgPGph
bWVzLmNsYXJrQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjIsIDIwMjYg
NTozMyBBTQ0KPiBUbzogQmVzYXIgV2ljYWtzb25vIDxid2ljYWtzb25vQG52aWRpYS5jb20+OyB3
aWxsQGtlcm5lbC5vcmc7DQo+IG1hcmsucnV0bGFuZEBhcm0uY29tDQo+IENjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiB0ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+OyBKb24gSHVudGVyDQo+IDxqb25hdGhhbmhAbnZpZGlhLmNvbT47IFZpa3Jh
bSBTZXRoaSA8dnNldGhpQG52aWRpYS5jb20+OyBSaWNoIFdpbGV5DQo+IDxyd2lsZXlAbnZpZGlh
LmNvbT47IFNoYW5rZXIgRG9udGhpbmVuaSA8c2RvbnRoaW5lbmlAbnZpZGlhLmNvbT47IE1hdHQN
Cj4gT2NocyA8bW9jaHNAbnZpZGlhLmNvbT47IE5pcm1veSBEYXMgPG5pcm1veWRAbnZpZGlhLmNv
bT47IFNlYW4gS2VsbGV5DQo+IDxza2VsbGV5QG52aWRpYS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIHBlcmYvYXJtX3BtdTogU2tpcCBQTUNDTlRSX0VMMCBvbiBOVklESUENCj4gT2x5
bXB1cw0KPiANCj4gRXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3Ig
YXR0YWNobWVudHMNCj4gDQo+IA0KPiBPbiAyMS8wNC8yMDI2IDIxOjM4LCBCZXNhciBXaWNha3Nv
bm8gd3JvdGU6DQo+ID4gVGhlIFBNQ0NOVFJfRUwwIGluIE5WSURJQSBPbHltcHVzIENQVSBtYXkg
aW5jcmVtZW50IHdoaWxlDQo+ID4gaW4gV0ZJL1dGRSwgd2hpY2ggZG9lcyBub3QgYWxpZ24gd2l0
aCBjb3VudGluZyBDUFVfQ1lDTEVTDQo+ID4gb24gYSBwcm9ncmFtbWFibGUgY291bnRlci4gQWRk
IGEgTUlEUiByYW5nZSBlbnRyeSBhbmQNCj4gPiByZWZ1c2UgUE1DQ05UUl9FTDAgZm9yIGN5Y2xl
IGV2ZW50cyBvbiBhZmZlY3RlZCBwYXJ0cyBzbw0KPiA+IHBlcmYgZG9lcyBub3QgbWl4IHRoZSB0
d28gYmVoYXZpb3JzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmVzYXIgV2ljYWtzb25vIDxi
d2ljYWtzb25vQG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4NCj4gPiBDaGFuZ2VzIGZyb20gdjE6
DQo+ID4gICAgKiBhZGQgQ09ORklHX0FSTTY0IGNoZWNrIHRvIGZpeCBidWlsZCBlcnJvciBmb3Vu
ZCBieSBrZXJuZWwgdGVzdCByb2JvdA0KPiA+ICAgICogYWRkIGV4cGxpY2l0IGluY2x1ZGUgb2Yg
PGFzbS9jcHV0eXBlLmg+DQo+ID4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFy
bS1rZXJuZWwvMjAyNjA0MDYyMzIwMzQuMjU2NjEzMy0xLQ0KPiBid2ljYWtzb25vQG52aWRpYS5j
b20vDQo+ID4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvcGVyZi9hcm1fcG11djMuYyB8IDQ0DQo+
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBj
aGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
ZXJmL2FybV9wbXV2My5jIGIvZHJpdmVycy9wZXJmL2FybV9wbXV2My5jDQo+ID4gaW5kZXggODAx
NGZmNzY2Y2ZmLi43YzM5ZDA4MDRiOWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL2Fy
bV9wbXV2My5jDQo+ID4gKysrIGIvZHJpdmVycy9wZXJmL2FybV9wbXV2My5jDQo+ID4gQEAgLTgs
NiArOCw3IEBADQo+ID4gICAgKiBUaGlzIGNvZGUgaXMgYmFzZWQgaGVhdmlseSBvbiB0aGUgQVJN
djcgcGVyZiBldmVudCBjb2RlLg0KPiA+ICAgICovDQo+ID4NCj4gPiArI2luY2x1ZGUgPGFzbS9j
cHV0eXBlLmg+DQo+ID4gICAjaW5jbHVkZSA8YXNtL2lycV9yZWdzLmg+DQo+ID4gICAjaW5jbHVk
ZSA8YXNtL3BlcmZfZXZlbnQuaD4NCj4gPiAgICNpbmNsdWRlIDxhc20vdmlydC5oPg0KPiA+IEBA
IC05NzgsNiArOTc5LDQxIEBAIHN0YXRpYyBpbnQgYXJtdjhwbXVfZ2V0X2NoYWluX2lkeChzdHJ1
Y3QNCj4gcG11X2h3X2V2ZW50cyAqY3B1YywNCj4gPiAgICAgICByZXR1cm4gLUVBR0FJTjsNCj4g
PiAgIH0NCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX0FSTTY0DQo+ID4gKy8qDQo+ID4gKyAqIExp
c3Qgb2YgQ1BVcyB0aGF0IHNob3VsZCBhdm9pZCB1c2luZyBQTUNDTlRSX0VMMC4NCj4gPiArICov
DQo+ID4gK3N0YXRpYyBzdHJ1Y3QgbWlkcl9yYW5nZSBhcm12OHBtdV9hdm9pZF9wbWNjbnRyX2Nw
dXNbXSA9IHsNCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIFRoZSBQTUNDTlRSX0VMMCBpbiBP
bHltcHVzIENQVSBtYXkgc3RpbGwgaW5jcmVtZW50IHdoaWxlIGluDQo+IFdGSS9XRkUgc3RhdGUu
DQo+ID4gKyAgICAgICogVGhpcyBpcyBhbiBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBiZWhhdmlv
ciBhbmQgbm90IGFuIGVycmF0dW0uDQo+ID4gKyAgICAgICoNCj4gPiArICAgICAgKiBGcm9tIEFS
TSBEREkwNDg3IEQxNC40Og0KPiA+ICsgICAgICAqICAgSXQgaXMgSU1QTEVNRU5UQVRJT04gU1BF
Q0lGSUMgd2hldGhlciBDUFVfQ1lDTEVTIGFuZCBQTUNDTlRSDQo+IGNvdW50DQo+ID4gKyAgICAg
ICogICB3aGVuIHRoZSBQRSBpcyBpbiBXRkkgb3IgV0ZFIHN0YXRlLCBldmVuIGlmIHRoZSBjbG9j
a3MgYXJlIG5vdCBzdG9wcGVkLg0KPiA+ICsgICAgICAqDQo+ID4gKyAgICAgICogRnJvbSBBUk0g
RERJMDQ4NyBEMjQuNS4yOg0KPiA+ICsgICAgICAqICAgQWxsIGNvdW50ZXJzIGFyZSBzdWJqZWN0
IHRvIGFueSBjaGFuZ2VzIGluIGNsb2NrIGZyZXF1ZW5jeSwgaW5jbHVkaW5nDQo+ID4gKyAgICAg
ICogICBjbG9jayBzdG9wcGluZyBjYXVzZWQgYnkgdGhlIFdGSSBhbmQgV0ZFIGluc3RydWN0aW9u
cy4NCj4gPiArICAgICAgKiAgIFRoaXMgbWVhbnMgdGhhdCBpdCBpcyBDT05TVFJBSU5FRCBVTlBS
RURJQ1RBQkxFIHdoZXRoZXIgb3Igbm90DQo+ID4gKyAgICAgICogICBQTUNDTlRSX0VMMCBjb250
aW51ZXMgdG8gaW5jcmVtZW50IHdoZW4gY2xvY2tzIGFyZSBzdG9wcGVkIGJ5DQo+IFdGSSBhbmQN
Cj4gPiArICAgICAgKiAgIFdGRSBpbnN0cnVjdGlvbnMuDQo+ID4gKyAgICAgICovDQo+ID4gKyAg
ICAgTUlEUl9BTExfVkVSU0lPTlMoTUlEUl9OVklESUFfT0xZTVBVUyksDQo+ID4gKyAgICAge30N
Cj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBib29sIGFybXY4cG11X2lzX2luX2F2b2lkX3Bt
Y2NudHJfY3B1cyh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICAgcmV0dXJuIGlzX21pZHJfaW5fcmFu
Z2VfbGlzdChhcm12OHBtdV9hdm9pZF9wbWNjbnRyX2NwdXMpOw0KPiA+ICt9DQo+ID4gKyNlbHNl
DQo+ID4gK3N0YXRpYyBib29sIGFybXY4cG11X2lzX2luX2F2b2lkX3BtY2NudHJfY3B1cyh2b2lk
KQ0KPiA+ICt7DQo+ID4gKyAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ICt9DQo+ID4gKyNlbmRpZg0K
PiA+ICsNCj4gPiAgIHN0YXRpYyBib29sIGFybXY4cG11X2Nhbl91c2VfcG1jY250cihzdHJ1Y3Qg
cG11X2h3X2V2ZW50cyAqY3B1YywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCkNCj4gPiAgIHsNCj4gPiBAQCAtMTAxMSw2ICsx
MDQ3LDE0IEBAIHN0YXRpYyBib29sIGFybXY4cG11X2Nhbl91c2VfcG1jY250cihzdHJ1Y3QNCj4g
cG11X2h3X2V2ZW50cyAqY3B1YywNCj4gPiAgICAgICBpZiAoY3B1X3BtdS0+aGFzX3NtdCkNCj4g
PiAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPg0KPiA+ICsgICAgIC8qDQo+ID4gKyAg
ICAgICogT24gc29tZSBDUFVzLCBQTUNDTlRSX0VMMCBkb2VzIG5vdCBtYXRjaCB0aGUgYmVoYXZp
b3Igb2YNCj4gQ1BVX0NZQ0xFUw0KPiA+ICsgICAgICAqIHByb2dyYW1tYWJsZSBjb3VudGVyLCBz
byBhdm9pZCByb3V0aW5nIGN5Y2xlcyB0aHJvdWdoIFBNQ0NOVFJfRUwwDQo+IHRvDQo+ID4gKyAg
ICAgICogcHJldmVudCBpbmNvbnNpc3RlbmN5IGluIHRoZSByZXN1bHRzLg0KPiA+ICsgICAgICAq
Lw0KPiA+ICsgICAgIGlmIChhcm12OHBtdV9pc19pbl9hdm9pZF9wbWNjbnRyX2NwdXMoKSkNCj4g
PiArICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiArDQo+IA0KPiBIaSBCZXNhciwNCj4g
DQo+IFRoaXMgaXMgY2FsbGVkIGZyb20gYXJtcG11X2V2ZW50X2luaXQoKSBiZWZvcmUgdGhlIGV2
ZW50IGlzIHNjaGVkdWxlZCBvbg0KPiB0aGUgQ1BVIHNvIEkgZG9uJ3QgdGhpbmsgcmVhZGluZyB0
aGUgTUlEUiBhdCB0aGlzIHBvaW50IGlzIHNhZmUuDQo+IA0KPiBXaGVuIHRoZSBQTVUgaXMgcHJv
YmVkIHlvdSBwcm9iYWJseSBuZWVkIHRvIGRvIGFuIFNNUCBjYWxsIHRvIGdldCB0aGUNCj4gTUlE
UiBvZiBDUFVzIGluIHRoYXQgUE1VJ3MgbWFzayBhbmQgdGhlbiBjYWNoZSB0aGUgImF2b2lkIHBt
Y2NudHIiDQo+IHJlc3VsdCBsaWtlIGhhc19zbXQuIE9yIGV2ZW4gcmVuYW1lIGhhc19zbXQgdG8g
YXZvaWRfcG1jY250ciBhbmQgY29tYmluZQ0KPiB0aGUgdHdvIHJlc3VsdHMgdGhlcmUuDQo+IA0K
PiBJIGRvbid0IGtub3cgd2hhdCB3aWxsIGhhcHBlbiBpZiBub25lIG9mIHRob3NlIENQVXMgYXJl
IG9ubGluZSB3aGVuIHRoZQ0KPiBQTVUgaXMgcHJvYmVkIHRob3VnaC4uLg0KPiANCg0KSGkgSmFt
ZXMsDQoNCmhhc19zbXQsIGlpdWMsIGlzIGNvbW1vbiB0byBhbGwgdGhlIHN1cHBvcnRlZCBDUFVz
IG9mIHRoZSBQTVUgY29udGV4dC4NCkl0IGlzIGNvbmZpZ3VyZWQgYmFzZWQgb24gdGhlIGZpcnN0
IENQVSBpbiBzdXBwb3J0ZWQgY3B1IGxpc3QuDQoNCiAgICBwbXUtPmhhc19zbXQgPSB0b3BvbG9n
eV9jb3JlX2hhc19zbXQoY3B1bWFza19maXJzdCgmcG11LT5zdXBwb3J0ZWRfY3B1cykpOw0KDQpJ
cyBpdCBva2F5IHRvIHVzZSBzYW1lIGFwcHJvYWNoPyBDYW4gd2UgYXNzdW1lIGFsbCBDUFVzIGlu
IHN1cHBvcnRlZF9jcHVzIGhhdmUgc2FtZSBtaWRyPw0KDQpUaGFua3MsDQpCZXNhcg0KDQoNCg0K
DQo=
