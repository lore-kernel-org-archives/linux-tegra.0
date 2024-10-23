Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83414EC62;
	Wed, 23 Oct 2024 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729715345; cv=fail; b=GcZ+PPHoJmhnt4+OyEaMZqccDLK88fz233tPcIwHxi20vbTo/QoK7kCu6TTW6BdJdoC8GjLuo5Xg6pwh09yNvcDFKpGQVqD17C4pERFDYXynOmOxnMaj5RKq6Luzy622PPlX38UzeaW8aRJAcfkQCoqkA3jk3ekHmRwSoBfUUVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729715345; c=relaxed/simple;
	bh=4wX6LFDokHfk28GGpIMrAxrVVF+M1tWajKt42TC4JsU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oDPk4ctbgOf49nmISlb3aPNhTDdWafi8XOfQOcMA9vrAcvcoC029CXTNtY1bFzycZrWQhqFs6Mt4z/kr/kMwj8zNcFOmd/BjXXJ24Ipes+W4RoWK6kom1rVt9J2nqRNn7RStxfoP/ivooyQSuuZWxpGcnZdgsPlUcCHADGqXi7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WmM6noVG; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WmM6noVG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVB/p7tSVXPJscStP7bkOBYXK8I4AhsywpMPxq3bO//tKvpGMrZGPV1p1DthMe27NR5PfT5uFHxWJk4zavpkpvQATHIWNC7FBiHJVJUIXpB0azRupgy4qwUNef4EYPKkNQSk13fADwX5yNV5bfK4RlgzggaraEXe/mn3fgknl9DnfTvRKjkJBd2UvWoQGc/qeTaGX19sCd7gLOpsz4/yI9KuMT5lUkFSML1k4qQnlZztFLkoT5sM69LZQT2ZmHAqH0FyNQHMArVTwYvLcAnN4zI18l9KvZim3bUe4E9u0DSSyRGauwUCxbuMr7GiUBhP8WdqwTs6cbcxW++6IzRR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtMtdBBTkc9oc4Aq35+6yPNylmLnuAUj613uDBCFZ78=;
 b=B1xsrYszAl0yT3Qyii5FapEDq/ve9I8vw3WPeITNwapvmWaHxSxsUteLGuRK2KhGOiZgT2RwnTYmMG2apEaCrJBlytRR68Pboz2NOgD5tcQNcH3L3D5xJMjfdWNVZnI5G6ekug0AKuQYfyqAHmT0JlOMz2rtrE7OxGQ/scvu0D8YrgGIPzX8yTl8uRty3P95+UwxjzrbN+jG8RYzKvAywYoO7V/CeS51idCWvTIAZoyBIgRFg2uAXNIPRzoQE0GPLr5cjpCVS0W2HRRDJkV195QJLZPxxL5KbI/gLMnQ2MELTcKvdhGYRB8kbSnMFwJScziXFRuH4cZRTShwB3f4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtMtdBBTkc9oc4Aq35+6yPNylmLnuAUj613uDBCFZ78=;
 b=WmM6noVGYXE94L45zL7xjlz4FKV54Pa2yp/BTiI4KfVGrTteI1U/Fwdz5FoXwsILcCTKLXoUT40BEfHW9gFu9SGlE+duOfaVPVI4HJwqkel+buOIFvgbZ6KD+aQ7egAJQmEHbOZbUCclnwo6+9r8L6yKCHUSVNxRRDhKQgSBbnIJlY7q+zrqw2MYPUI5XvCKpOdmxoe//9EQoMEAnQ69oIa9bTVGR1p59HNdj5pjbQvqIxJlncxXwvVTxky0m8BMBpfmB6cKv9umBzgKJ5lWqd16QFGc6JUWKorU9XjxBWGT2AHUQVTwF8s0NZ4iCfjnbFEuhutjjKGQOMXKeiQFew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Wed, 23 Oct
 2024 20:28:59 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 20:28:59 +0000
Message-ID: <fcf553ba-9f13-4921-8bca-d704b2115c92@nvidia.com>
Date: Wed, 23 Oct 2024 21:28:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Don't try to create links if they are not
 needed
To: Saravana Kannan <saravanak@google.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20240910130019.35081-1-jonathanh@nvidia.com>
 <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com>
 <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
 <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
 <2c42677c-5e8e-4805-b6a5-0a5baa3e55b5@nvidia.com>
 <d9aadede-dfac-410a-b65b-e295c9a64951@notapiano>
 <CAGETcx-_z4hxyNSwT-D1MKNzAjOGSX+o7x5G8J0KkiUyy+RkDQ@mail.gmail.com>
 <8b4723ba-fffe-4616-8055-02a9cf6f2894@nvidia.com>
 <f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapiano>
 <5312c3c8-8e23-4f4b-88d5-3962f67da572@nvidia.com>
 <CAGETcx99h+HzL__E8w5VWgn9NrjdMk3KAdeijJXmdDF6fm7NOQ@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAGETcx99h+HzL__E8w5VWgn9NrjdMk3KAdeijJXmdDF6fm7NOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 929c7b7f-2643-4d81-8ea7-08dcf3a15340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGJyTCs5c2txZmIvVW9ncmNmdng4RlhtN0hkSHpWMFdVWmg4ckRtY05lREw5?=
 =?utf-8?B?d3c2WDUzeXZTUzBuU0p5K0Jxb1FNRXlCalFhK25qSjZNcUNCNHh6emV6a0NM?=
 =?utf-8?B?MXBkTklEZXdmeDNxdjliaGVNNlN6OEhjM0F3OTdYL0pxNTVWbW92QTMrKzBG?=
 =?utf-8?B?QjJoNVFPMVpocjVvR1JwN1JyRFhqUWE5bXFERmpqV0ZrZnkxUHV1eVp5WnJx?=
 =?utf-8?B?d1dqVGUrS21IdEJTcklSZ3NrZW1OeFdUbDg4MW5Ock4raWM1ckdZOGlscUhX?=
 =?utf-8?B?VGRiVnVqdU10NFlsS0VmUi9rQW95bkgzR3Frb2tweTJNVDBCRlM4emVjalZB?=
 =?utf-8?B?bDVGcllpb2RXNWVoTXgwSkRKZXU1U1ZPbUVoTWNvSFNDbjJIdU9nOUpsOVpj?=
 =?utf-8?B?WjFmMTh3bmFteWZua3N0aWxNTEZSSjIzcjlZd1NZMUNSbXZMQWpSV2pHV09q?=
 =?utf-8?B?TkhvaEdXMi9WMDJ1cGVkVWRMRll5RHRQMnlJbTZJaWJyaHpUWUY4RjZscW54?=
 =?utf-8?B?d3VSVUNyTkNUWFRBTWVDMlMvc3Z0TzVoNmR0amU1WTRGL0pnSCtPTnJOYXk3?=
 =?utf-8?B?cEw0dU9Qa1k4bXNsQ3MycHdkd0Z3bGVSdzlIWHdYK2NHdm1xY2RDMzRNZGNw?=
 =?utf-8?B?M1ZjQXVQL2J1cjFBNHN2RWtaYXBuRXJnd1BHL2xDZ1pQVCswVmIyMHQwT2VR?=
 =?utf-8?B?RmszbndQODI5OWdNMmtqLzZQdU5PdkpGSGhZcDg5cWp5cVptdUtXRXQ3Zmpn?=
 =?utf-8?B?MzhEd1BUWHJnckpkNUI0Y29KczJtMnRGNWdrdXd5SVlDOHVkaDN5a21mbjdv?=
 =?utf-8?B?eG5IZzRqbk83RGdCQUd6MjgwS1cva0ZJdTJkY0UwaWRhYTRhQVpSakk3TmZ5?=
 =?utf-8?B?SjdmWjIvY20yVmgwWHpqT2MyVkhLbDVpYlhHQ3dYdEgwTDYyNnM5VWVRRUcy?=
 =?utf-8?B?Sy9IMmtLTGJTTHB5N2dNSjcraEhEWmNsalpDWCtDUkhyeXM0MGZwWmxFb3NE?=
 =?utf-8?B?KzFzNEphVFRRL2JGS3RsS05MQllNaUZSK3dZcFpzL0F3dUxGbGN4Tkx0aW5j?=
 =?utf-8?B?RWd5aXNTanA2YmxtT3JzSCtXdFovYktKS3I3bGQ0alBDUnNGQjFicFdYWHBH?=
 =?utf-8?B?dFg2NHpUeDFITjdoWDNDTlFBa3hPTE9XVndmWi9hQ0lIRTFWUXAyd1U2SnBC?=
 =?utf-8?B?SE1IcUdmWnNzSkN2dk9ZRU9oRHplN0ZyU3JLTlliblhQYXdIOTBpMS9NVlBp?=
 =?utf-8?B?aEFaSFh0ZDRYRW1JNE1HUDR2c2djemFVQk5GTnZjM09rMFoxY1l3OUI2WGRs?=
 =?utf-8?B?ZHZpUmtwb2NreEZlWkkzNFppb3grOVpMdDNnSWdiNTlnWFFuaHVVSmFvMlM5?=
 =?utf-8?B?UHB4MlhXUFlSVnlDS096YmxrdmM3V1BjOHA0V0lVYWwreFhUTEU3OEl4Vmlp?=
 =?utf-8?B?ekVrY0RPbCtFVno4QjBjREtSVXVCWG5TVnlnMnVIaFBmZXBGSHhTdVlWa3Vr?=
 =?utf-8?B?ZUZrQkJ5UzBBWUNZdyt3aXVPVENoTWxwb0M2eU4yckVIUG1jMWxPalNUOHRn?=
 =?utf-8?B?RkNEc3JJQTNEQll0TmhobDdZcVlHaDBOWGo5OHpjMTF2MjhuTkN1TG9ZQjFG?=
 =?utf-8?B?TGZ2ckNtS3AwU1hadytFKzdLUkNFaHRGSzNpeFg0cWtYYm1sWW9YSWt2WjFs?=
 =?utf-8?B?Y3FpbjN4OFd6QTVFbDRQSlhZSlhIVmU2bHR4c016c2paK2hqU1lRM05jQmQ2?=
 =?utf-8?Q?AN3X7sN/Ey/1oUOWfvRmdQZtOkH0wsLt8Yr273T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnczUklOZldXbWpJcWdjMzVyakVydkxIVkNKbVdyTlhSQWVrS200MG1ZSW1s?=
 =?utf-8?B?dEtMenpSWEluM0FHVlU4d0p0eVd5blpYd0hRTGIxRi8zTzAzVUcvZ3lIN05S?=
 =?utf-8?B?czRuZE9PbzFWc2RtNFN1ZWhTS2RtQnpuZDBmMGhPNElYbmN5Vk1VbU5DVXB6?=
 =?utf-8?B?WGRnVXBXWGlHNkx1cm5samxDNGExbzhlQkpJVnJMVFFiV3BkRUVmWTMyQ0d1?=
 =?utf-8?B?ZlBNcUM1WHJrVWM3RTVDRTJ0dlBLV0E3L2FQWUZzU05sQ0tHejk2N3MrWnZO?=
 =?utf-8?B?OUdTeU5tRmgzd1RYYTBOWnVQanZGRmZ2Ri9LNnRKQXdrMEg1WGxEcWhna1hT?=
 =?utf-8?B?MC84WHN0WTFyTkw1NFJSRXFmcGNiemZjTmg5SUZQcCtGY3AvTUFYUkhuNTk3?=
 =?utf-8?B?ZTA3Qng4clZ3SXcrUEFMTXZxZ0E0S2xvRGt0SUZkMGpndnNuMVl6UFJHYzBo?=
 =?utf-8?B?cTV1MkdBZ0NPRGN6MkhSTzF0WkQxMlVHYUkzRmhYOVhsQVlRTUtaYUVicGlL?=
 =?utf-8?B?V010MS9rbmVGdS9IcTF1ZnQ2anprTFNmcXFDWUE0LzFLT3NYU2VqUXhaM1pN?=
 =?utf-8?B?ZEpxb3FPdW9namQvbkdJTlhTRGxkVVBoNHlFMzlWNkRWd3dsYW4yNGhkQTYv?=
 =?utf-8?B?VzI1ZU8vRE9DdlI1UGhpdGQ1Y2dWdEExbUwwd2c2UG54QzUvaXZUN1hEcEZn?=
 =?utf-8?B?UVNuNGU1VUhndjQrSjNuSVUvcmt6Q1dwbmw2a3NidDBzTkRwQ2hLSDdFTklt?=
 =?utf-8?B?SENtUWwrOS9pTElFelBCRFdsdFpINWw5dzJ4RXZtQXZIeXV0SW16WXdzU2hP?=
 =?utf-8?B?eUQwVCtzd24yOEordXBOZTdDTmVrUDhzNnV3bE5mdHg4RjU3Nkh6VEh3cHRl?=
 =?utf-8?B?YjUwb2FabzRwSlRNUFBTV09sTmxzdG9vbHpkVWludlpWZDZrZC9WSXV0OFZp?=
 =?utf-8?B?VDhxUE1MZ2dLNjU0NUtPNU9EMHYvY3VmTHhseE11bi9nZmtLTjJSWUpmWlo2?=
 =?utf-8?B?NEhkMVJjL2Y0bHBwYmt1SEtocXBTeU5kV0xHMVVLMllKUERtMXVyMkxURXVF?=
 =?utf-8?B?OFlBSjZKUGp0RngwbDEwZ29RNEkzWSs3OGpGTkFabExsU0dHWGRuZXVpRWVH?=
 =?utf-8?B?RVRhZFhMT3BoQVNubjJ2YVI2WlV0a0ZVcndBQ1gvYnkvU2RNVExURHhTazcz?=
 =?utf-8?B?QmlwRC9sVC9RY084ekxoc1hGWEMxaDBnUzRjU0pmSFVCbkoxS2JvQ3FLVFBo?=
 =?utf-8?B?USt6cDV0Rm1zTWE3cnVLemF3a3VQMDhNZE9uNWluejBPaXVjVjFQYTFldUUw?=
 =?utf-8?B?M2RtWFI0b28yZm5zQzZldmtSUG4reGliN2xNbmFjdXl4Q3hSNHlPVnNERGZR?=
 =?utf-8?B?aFVIbHpmaUNkN0tiaTJwYkFIL24zQy9hRSs1R3pNTXFQRDQwTnpPK1ZKbk4v?=
 =?utf-8?B?aWpVNlNJalVNeUttWDNSMEkxRWRLSUxxcmxuL3ZibmxTQzhqNzJLaUxCQW92?=
 =?utf-8?B?Tlo5bXM4YUREdS9EZXdyNjh2OEYvVmRMYk1VelFhOEZxcTg2UVBtaHJqVEhv?=
 =?utf-8?B?a3pXbkU0ajdIWld0QXE3enpyb0VQSUNGcndUOXFoSWhyWERyMDY4dUtpRFRy?=
 =?utf-8?B?N05IQTZKaHNqWTc5NHpYSUpQTGgyWmFsQ2p0eVZKeDMwVE1NMVF4ODlhUnpU?=
 =?utf-8?B?R1FBR1V2VHJ4NE1pbFluOTY5QmxWRjVLQlVsM21ha2VmNmE5cFROWjY1Q01l?=
 =?utf-8?B?d2NMZ1N6UUQzNlZpQmZsejRqMDE3Mll0VmR1OThENWJCbGxuWnFkWG9KM2lH?=
 =?utf-8?B?cjAzS3c1Zjd2MDhHa2J5WVY1NmVCdC9ZK0NQMmJpeUR1MkRVWUVBWlRDQzQx?=
 =?utf-8?B?ZlBFdWdGYVRZUVNSZmczODlndnlKeWJaalVyS1UrQjREM0I0djdDbHdmalpq?=
 =?utf-8?B?NkVLdkxwbFRKY3dMdG9NdjBCUDZUUStXeHc3Ynl2eEdsc3QyTmFpSm1pMkVi?=
 =?utf-8?B?Uk90RURXb0ZaTW84Z2liaXpFU1RHNXNIT2lxcXZNajdLTnRJclY1OHVyTnBX?=
 =?utf-8?B?TFVzOFErcGhJc2ZsY1lqR1ZCTWlaVDRzYjNaQ3NhUzdCVU5FM3FwR00yc0Jk?=
 =?utf-8?B?OUNITFVpYk14WGtaeE9wUWJxcjY1cXVGUkdjaUFqNHB4N0tHYTVWak9FOUJT?=
 =?utf-8?B?S0pFa3Y0Z2hyNjRoUWxPRGFza010YW9iNVZjcHNvaDhZWGUyRmNXV1RsTjcv?=
 =?utf-8?B?OS96ZURsT0o3ZHF5NHJncndIVGRBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929c7b7f-2643-4d81-8ea7-08dcf3a15340
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 20:28:59.4690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pXbesYZ3CUlBI+gPChROzmpM6FRsjrtOiglz9c5fUJTUBDW8TzsYdn9HAdara2rQPp2w8xfFXLxchLx6x33nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216


On 23/10/2024 19:34, Saravana Kannan wrote:
> On Wed, Oct 23, 2024 at 7:09 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 23/10/2024 14:58, Nícolas F. R. A. Prado wrote:
>>
>> ...
>>
>>> I'm guessing a similar change to what Saravana suggested for the
>>> of_dp_aux_populate_bus() helper is needed here:
>>>
>>> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
>>> index cfdb54b6070a..0a2096085971 100644
>>> --- a/drivers/phy/tegra/xusb.c
>>> +++ b/drivers/phy/tegra/xusb.c
>>> @@ -543,7 +543,7 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
>>>
>>>           device_initialize(&port->dev);
>>>           port->dev.type = &tegra_xusb_port_type;
>>> -       port->dev.of_node = of_node_get(np);
>>> +       device_set_node(&port->dev, of_fwnode_handle(of_node_get(np)));
>>>           port->dev.parent = padctl->dev;
>>>
>>>           err = dev_set_name(&port->dev, "%s-%u", name, index);
>>>
>>>
>>> As a side note, I wonder if it would be possible to detect these mistakes... But
>>> I'm guessing there are legitimate situations where there's no fwnode.
>>
>>
>> Yes! That does indeed fix the issue.
>>
>> Saravana, let me know if you can send a patch? I would but I can't say I
>> understand that actual issue.
> 
> Heh... didn't know you were hitting the exact same issue. I'll send
> out a patch. Okay to add your tested by too?

Yes please do!

Thanks
Jon

-- 
nvpublic
