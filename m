Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB7A272803;
	Tue,  7 Apr 2026 04:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775535028; cv=fail; b=heB1AwiPRIdpsEUO6pdXuoSP8UAmYSWHUTBam6gfbMQpLMs1edXIBdVWYsvztCk5VMAp3UnNRQLF2xQ8/1ooyN5LlMof75ooHIC/vB0VgGKBWurTW5GVhc9jCsZAoMJFkw5rpBQ9iPYL65SwZBhmwY6+Tu0DcG0zw5gTSeTvS/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775535028; c=relaxed/simple;
	bh=9NVjM++DB0OvU8/eI845XwDRoAlMP+w70cmPK5/yDCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DbQgeYLPgEy3ZQd+Xz/+lzTdEN90o+0+/v6laBuXY69KqIewh3siEXrnSWxXO8IjZ3T7LSP87a5ttyiEZ6D4vcHRe3pK638FSTgbJ9SG6vT+WO/ftbXWnXTJ3LguhK/1/dlN3La5vuCE2yQx8QuliAzZvtZD0NJDlT/Y7CtR914=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uZDmyQLe; arc=fail smtp.client-ip=52.101.57.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uZDmyQLe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eK8k/apzIx6azRWKoECcS1BUbdbzDZbPVDF3s0vbHZHIBQY6Jd99HA4czQVxk41LOc2R928VmWPhclaVKdUQjNaWUPU6BRaF/4ggDhR77zZKoM03rjY49O+huoVQvHjHq7kv1jC/Qqw6REFVivGRSMJXrMZhGvuMRuRZE+XHxmXSVkZn7Qcl6CQKgHjD11Wq38XohRCfH4XbQmE/3vle4RIO55cBBoL6G+De2rXt/oD+oE46bYw90uKlsgHyk0nD1vwigkgFsvJAkJO+889rRnlky7xDeWeOb3yNdV971G9TkfG7o7pSl1WKv1dOL7NDRrsoao9l4jacnfdW4NxuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+H2RiAe/2/ZqiIJ+1H6rmNZYZeMvkI8tCp0XrmOQ0M=;
 b=YEJVuXeVgzywGq7S6laR5yAriE8nSRSE1cPj4cDZhQNq8+to0ttNDsLt/ouZys4j1tg1ZGwDVUqP74JKiuXIXcJR2c2ZX0sflD7px/OkPrpBnTl1QJ0yniDeZzv6vyy0ACnGA28XCuPx2cgSs0s/X3t6oN5Pn27gvWAvhgfvs9S9JRW/EIyHDVoIan93EU+aXiQibnPu/WkgtRKairyuByQk1BECBR4klkvxr82XbEY4fPF/EtOmyZ8Tkux8YciI9zXH4ylhKKGr+0Uz9+HgFTTH3PRDA+b2NLLAx4SkQqOgbl6v1c1cm3AWSQ20iRhgtBHYsl7RfWcKHhbGfCr5DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+H2RiAe/2/ZqiIJ+1H6rmNZYZeMvkI8tCp0XrmOQ0M=;
 b=uZDmyQLefJFvEC7AR+fE8trZD+nu2kP72vyUmowYfeytfb8/Na2jvIZE3k+/tg/8sOBvrXJffIBB+5qPMc6Jb3uBsbNzOHdA/ZestFMc4FnS/3xFJRp1grVd/r7OBSLnuqqvDI/53plCnOtII/wD42qbg7v4VSnBaIpBa1bnLJEOHgMdXe52fMrNGIVrm7nWx2LSTim0KuGnaYggAhyLhkdmDCOzICA3l8rNrkB97iNhD/6SktLdGeYl7lhdMZudYrhmosF2qga149o1zDEXk637kUWUJOtFb5dfi3HxqAI7XKZbSjDGE9xFGL0/fzgP51XfNfbQW5YCZPKaig4yVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 04:10:16 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9769.015; Tue, 7 Apr 2026
 04:10:15 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: tegra: Disable ISO SMMU for Tegra194"
Date: Tue, 07 Apr 2026 13:09:10 +0900
Message-ID: <oPjOdaRsQES6O8jgrehMZw@nvidia.com>
In-Reply-To:
 <CALHNRZ8Zs2Zp80OgoU6R54=n76JgiYGbMvWD2iP9HpUFYO2big@mail.gmail.com>
References:
 <20251101-tegra194-dc-mmu-v1-0-8401c45d8f13@gmail.com>
 <aZQ-cMn-3vI7UH7t@orome>
 <CALHNRZ8Zs2Zp80OgoU6R54=n76JgiYGbMvWD2iP9HpUFYO2big@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: bde10ecb-7210-4583-8d54-08de945b92ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KeSgNyu6LnlJITXnVIr6q40RYY/EiFe2XdeERPmFkAoFRpN4K0k1gUvaW4V27KG7HKi6zmqT+sZItlUotG2orE7ejruKNaqZaR6v3+sva1MmSVxU/YO0LRhIbhL8wUW5wh5d5Q8NUV35+mfAQe5hPEe2iicIRqTOuRKxx9r6FkdqaPydOECrV2QlduYYnuvtpUn8x+LwcqPDY1Swm6D0AMVI7mDWlaWOp9mizlKqSGysf00FmZB+o10z4L1t+mM5wJElUV+3G9BGgt3VbobbnFOk/h06uGv0Tv1XTlXLINDTyQnqljSvu8yQi/7l7wt4XJ/lof/e5Y9pnnvbhpdPNvCB5pWFMbakvDgzj+Y3WEKDvj4QQkvfT4xyMpi5Fn5YY+rbJzHaKz2PcBJK9bR+r7i/pvGCv+ubQynKEWveSudpNJflsvRBwidwlDr2Nk8O0uaFnuSIbLd9PEUx3iZ6+06lgM5ZA/o5gZIhkPVwt891/Cip4rLvkKjFIQ8A7cPeRZ2Kwfn2TmJmNi+1UFj5TLdZb/fOn4KLRJFvj8t7jbmSPMcBNDbEATONtChLryewSOLTgezk69Aob77lHqmKHKH2lpShNEuIbya/ITiQe6JkTAvYJv37Y4pDWsgBvWJW1UOf1qqkYPy0ODO2y5ty6BRclxXInMt4tfdmweQxlsBPu3fq+AXilJTqVqhYRhBojXe2TwwrkV2G6HSjhuHlJ1nG4gPQfIMrhpc+EkE60IM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZ2STVKeHpWOTQ5SzI4WitPb1plMWJIVWlvMllHR1BhWVpESEsrSGpQNTRz?=
 =?utf-8?B?bnEwQWtQTkdPaFhuQ0NHckk0MHNKT0NEeDc2RGVIYXAwRXRlUTR3elM2NkRD?=
 =?utf-8?B?MjIzNll4T0k0eC9qR083RzU1cUUrbkZnaE5LaU9yNm9hS0xMUmt3ZWV5Z3Bs?=
 =?utf-8?B?cDdpTzA0NVVTVnR2MW5tZk56eklwM2JBOHFPOWNoa1AyVWp2Mzg5NDk3dCtD?=
 =?utf-8?B?azRVV3ZVbnY0aUJsand2VzM0RUl0em9PYnUzUTk3d1NsZE93L29TSXIvWHds?=
 =?utf-8?B?QlBrd1JiWUJMejVzbnZacmhNNXZqR3ZGbVdQc1gwQWovVUJHNmZIY3krRDVJ?=
 =?utf-8?B?UkRWK05OeXhmdVRZTVVBejYrWHNZdE5GS3lYWDB5aEpMZWxDWGV2eGRPdWYw?=
 =?utf-8?B?WCt6ZXRHZThyNmJNVGY4UVYvWHE2Zm53b2g3Q05pZlBEamNsZ0NuSXk1MmJx?=
 =?utf-8?B?M2htcmE4b2Z2ay92WFJvcGF0UGhIQ0VQTmRtRzBJUElidU1NVkQ4bGtKQW8w?=
 =?utf-8?B?KzRJRjZMUlpick10QjJ3NHB3WlZ2UElFUjRXVERGQXRTc3lPOVNHcC9RNEVT?=
 =?utf-8?B?UGl1VHI3UHRRTXpGKzh0Y0czWExwa2o2Z0RhaXhmcFFHVTRHSnRod2dIT3FI?=
 =?utf-8?B?VGN4dlZvTjJUSWR5SVdXMmpBVEV6Q1I2QXhUb3lZM0RzOWo0K09sQmNpNytu?=
 =?utf-8?B?TmhDM2dNV25sY3J5ZnR4VDhiM0d4SDRZZkxRZmNDNUF1L0Z4Tk1HbE56QTFx?=
 =?utf-8?B?Mm91SG02OTZNanJoSHVWUFVieGU0Z1J2TEM1bkI4THcwV25uL2JKUkVhTkJs?=
 =?utf-8?B?ZjJGRzczVVdmb3p4ZWpweTFUcmlTbWZwUGEwb0lBTmlMcGIwL0pLQ21MUlVJ?=
 =?utf-8?B?Z09WdFM4THZUZXk2VThoMUVKbXBXZEtsN2xLeGtVQWRKRXFta20veVBYSGtX?=
 =?utf-8?B?MUJobXFIZGFFSDVKamI3YnFrUStFYmxPOXhDSnV0Znh6MlR6cml5RlJSQXBy?=
 =?utf-8?B?Nk1lRk1ZbXFycEFPWGlsN05lQ2t0RnJkcEV0VUNJS0tQbWVwdHVNU09TNzZR?=
 =?utf-8?B?SFQ4WW5Pc1dWRUNPbWF5RWJtcUkzeUpaem9PWnNjeTBwT3pXeE8xdjd1RFZL?=
 =?utf-8?B?aXR2SVQyYXdveFVmY0JYaEJWWDNWVWk1OTBDTTVZL3RDd1ArWVFHTHVsYmZ3?=
 =?utf-8?B?amkrOTNvTXZsNkt3WHJFckMya2x6eEVvNWJud3BuNi96VmFrdVdxVExaMHJO?=
 =?utf-8?B?czRVdzVRU0puNEd2Z2s4MjkwMDVMRzhCN1BOTGo2dThTVjJKbnFuUTUvRUdI?=
 =?utf-8?B?K3F2RFFmL2lGUDdkdk1RZ3VsQmRrNExXRFpna3dtdlpzeUtKQythUXBnTnRm?=
 =?utf-8?B?ekhacytNWjJpalRqeG1scndpaHdRNm9QQWxPTUlhM3ZkUUl3c1pWZjJka0p3?=
 =?utf-8?B?RXZZbFJEZm5aRmgyaUtvVHlTaDA3RXpqakdDME9yUk1JK05nQVkrZktCRE9Z?=
 =?utf-8?B?ZGE0WjVEU2NPbnZZOG5UbElnSlZrTCs4YzA2ZnhJWS9UQWYwZW5ySjJ1NVln?=
 =?utf-8?B?VDJjUEpTWFNNRXhSdzFiMEN1dmlTMlVscC83L1VZdlJzeEVYRGR3YWZGZktJ?=
 =?utf-8?B?ZXFFQ2l0bVVGa2FMajQwd2s0MGtXekpJOU8xZHZHVjBxNlpQVlE0clVVVjhT?=
 =?utf-8?B?QVBPdmRXeVdMcEFzc09uYU9nTWw0dy9uU3ZMbnlOemVsbmFyWXJZQzkxeUxV?=
 =?utf-8?B?QXZBQnRlbEd1NlFqK3Z1NnU3K2RiY3JnRjlaTmxSMkw0WHBPSG9ScHI1YWt1?=
 =?utf-8?B?ZzlyRStEdU9UWjJ1KzI1eXJVQmxGUU9zUTRMMGZqb1FzOEtoeE8vZjV6dEYv?=
 =?utf-8?B?aW03b2QxMS9tMEhjZlJ0M1MvVXVDUGZaSWlDUytvUGsyMS8rSGN6UXNJWGd6?=
 =?utf-8?B?WUlSZjFVZS9HYmFONXJwQVl0NzgrVmxGWUd2SSt3Y3IxN2FwL0pFRmZLM0t3?=
 =?utf-8?B?cFFIcGNmUnZjWXBGMjE2c0RHdm90cnR2dUtFdG9rb3BKZENKeFVmeDlFdzBK?=
 =?utf-8?B?NGdRWmUrenFMUGxhL2NmMWNpOWVIUzhUVm9qaXM5QkxERXkzUEdncVp2b01H?=
 =?utf-8?B?NTFyREU2VmM5bWs2cUxUdDRtR3pqM3ovczJLdFNnSlhGcGxkYll2OEwvRWpr?=
 =?utf-8?B?dHZRWXhiQlhnWGVoL000a2hUZ1Z5eG0vdW5uMXJTUWtvbS91UkFBU1FWMm9Y?=
 =?utf-8?B?REt3ZFc2Vmg4c0hqc0JXb2k1a0o1S0x5d2drZlFBcXBybHJDaS8rbjltTFVp?=
 =?utf-8?B?SzU4SkxzMnRkUVlQd1hOb2p1OHZ3MzdWWXVPdEgrd1RDeEZCcmI2Q3JJQ3pS?=
 =?utf-8?Q?JjMHGKURGalzGoU885v2LhPxLCHdJVJK4FDfgFxgL33mT?=
X-MS-Exchange-AntiSpam-MessageData-1: sx68VacuApn/rA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bde10ecb-7210-4583-8d54-08de945b92ac
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 04:10:15.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYz95akY5uQcCc+LGvn/0urRa4pgewPZQ/l4LuG4VZQhdt7mj545qTmOKSM8NY/DXOPZBBRjahKy3CR1q+xRXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

On Monday, April 6, 2026 4:49=E2=80=AFPM Aaron Kling wrote:
> On Tue, Feb 17, 2026 at 4:13=E2=80=AFAM Thierry Reding
> <thierry.reding@kernel.org> wrote:
> >
> > On Tue, Feb 17, 2026 at 12:53:54PM +0900, Mikko Perttunen wrote:
> > > On Thursday, January 22, 2026 7:22=E2=80=AFPM Mikko Perttunen wrote:
> > > > On Tuesday, December 9, 2025 1:21=E2=80=AFPM Aaron Kling wrote:
> > > > > On Mon, Nov 3, 2025 at 12:05=E2=80=AFPM Aaron Kling <webgeek1234@=
gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Nov 3, 2025 at 5:07=E2=80=AFAM Thierry Reding <thierry.=
reding@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Nov 01, 2025 at 06:13:26PM -0500, Aaron Kling wrote:
> > > > > > > > On Sat, Nov 1, 2025 at 6:01=E2=80=AFPM Aaron Kling via B4 R=
elay
> > > > > > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > > > > > >
> > > > > > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > > >
> > > > > > > > > This reverts commit ebea268ea583ba4970df425dfef8c8e21d0a4=
e12.
> > > > > > > > >
> > > > > > > > > Mmu is now being enabled for the display controllers.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
> > > > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/a=
rch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > > index 1399342f23e1c4f73b278adc66dfb948fc30d326..854ed6d46=
aa1d8eedcdfbae1fdde1374adf40337 100644
> > > > > > > > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > > > > > > > @@ -1807,7 +1807,7 @@ iommu@10000000 {
> > > > > > > > >                         #iommu-cells =3D <1>;
> > > > > > > > >
> > > > > > > > >                         nvidia,memory-controller =3D <&mc=
>;
> > > > > > > > > -                       status =3D "disabled";
> > > > > > > > > +                       status =3D "okay";
> > > > > > > > >                 };
> > > > > > > > >
> > > > > > > > >                 smmu: iommu@12000000 {
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.51.0
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > > Question for Jon as the author of the commit being reverted=
. The
> > > > > > > > commit message states "we do not have a way to pass frame-b=
uffer
> > > > > > > > memory from the bootloader to the kernel". If I understand =
this
> > > > > > > > correctly, this is talking about seamless handoff. What doe=
s this have
> > > > > > > > to do with enabling mmu on the display controllers? Seamles=
s does not
> > > > > > > > work on any tegra arch as far as I'm aware, but Tegra194 is=
 the only
> > > > > > > > one that doesn't have mmu enabled for the dc's. But enablin=
g mmu
> > > > > > > > allows for better and faster memory allocation. My initial =
attempts to
> > > > > > > > enable this didn't work because I tried to attach them to t=
he main mmu
> > > > > > > > unit, see the related freedesktop issue [0]. After noticing=
 in the
> > > > > > > > downstream dt that the dc's are on a separate unit, I made =
it work.
> > > > > > > > And so far, it seems to work just as well as Tegra186. Then=
 when I was
> > > > > > > > packaging up the change to submit, I found that this had be=
en
> > > > > > > > explicitly disabled. But I'm not seeing why. Am I missing s=
ome
> > > > > > > > additional factors?
> > > > > > >
> > > > > > > This isn't seamless handoff to the Tegra DRM driver for displ=
ay, but
> > > > > > > rather to simple-framebuffer. While this does technically wor=
k, it also
> > > > > > > causes a spew of SMMU faults during early boot because the fi=
rmware does
> > > > > > > not properly pass the SMMU mapping information to the kernel.
> > > > > > >
> > > > > > > In a nutshell what happens is that the firmware sets up the d=
isplay
> > > > > > > controller to scan out from a reserved memory region, but it =
does so
> > > > > > > without involving the SMMU, so it uses physical addresses dir=
ectly. When
> > > > > > > the kernel boots and the SMMU is enabled the continued access=
es from
> > > > > > > display hardware cause SMMU faults (because there is no mappi=
ng for the
> > > > > > > framebuffer addresses).
> > > > > > >
> > > > > > > That said, we did solve these issues and this may not be happ=
ening
> > > > > > > anymore with the most recent L4T releases, so it may be okay =
to revert
> > > > > > > this now. We should find out exactly which release includes a=
ll the
> > > > > > > needed changes so that it can be referenced in the commit mes=
sage. I
> > > > > > > want to avoid people running new kernels with an old L4T rele=
ase and
> > > > > > > then seeing these errors without any reference as to why that=
 might
> > > > > > > suddenly happen.
> > > > > >
> > > > > > For reference, I have rolled back my Android usecase to use the=
 L4T
> > > > > > r32.7.6 bootloaders on T194 for a variety of reasons. So I am u=
sing
> > > > > > cboot as the final bootloader and not edk2 as in L4T r34/r35. I=
 have a
> > > > > > pending cboot patch to support simple-framebuffer handoff, but =
haven't
> > > > > > fully verified it as tegra-drm is currently unable to takeover =
from
> > > > > > simplefb like openrm does for t234. But all that to say that si=
nce I
> > > > > > no longer use r35 for t194 I don't have the setup to easily ver=
ify
> > > > > > which point release works here and what doesn't.
> > > > >
> > > > > Any further thoughts on this patch?
> > > > >
> > > > > Aaron
> > > >
> > > > FWIW,
> > > >
> > > > looks like the edk2 patch to update iommu-addresses --
> > > >
> > > > commit 6071946461389221d2314cbbae0377610b5b1f6a
> > > > Author: Jan Bobek <jbobek@nvidia.com>
> > > > Date:   Tue Mar 21 00:15:27 2023 +0000
> > > >
> > > >     feat(NvDisplayControllerDxe): update FDT with framebuffer info
> > > >
> > > >     On ready-to-boot and whenever FDT is installed, update FDT with
> > > >     framebuffer mode information, base address and size.
> > > >
> > > >     Signed-off-by: Jan Bobek <jbobek@nvidia.com>
> > > >     Reviewed-by: Ashish Singhal <ashishsingha@nvidia.com>
> > > >
> > > > is in since r36.2
> > > >
> > > > $ git tag --contains 6071946461389221d2314cbbae0377610b5b1f6a | gre=
p "^r"
> > > > r36.2
> > > > r36.3.0
> > > > r36.4.0
> > > > r36.4.3
> > > > r36.4.4
> > > > r36.4.5
> > > > r38.2
> > > > r38.4
> > > >
> > > > Not so good for T194 since r36 only supports Orin.
> > > >
> > > > I'll look into getting this cherry-picked to r35.
> > > >
> > > > Mikko
> > > >
> > > >
> > >
> > > I looked into this and it appears a version of this is in r35, but it
> > > only supports T234. However, I also found that at one point, L4T
> > > bootloader configuration has been modified to place the display
> > > controllers into SMMU bypass until otherwise configured by the kernel
> > > -- which the kernel does in tegra_mc_probe_device.
> > >
> > > I think that means there is still potential for an issue where the
> > > display continues to be on between tegra_mc_probe_device and tegradrm
> > > reconfiguring it. However, I cannot reproduce that happening -- most
> > > likely the display is being turned off before that because of a clock
> > > or power domain being turned off.
> > >
> > > In any case, this means that we no longer need to pass the
> > > framebuffer's information to the kernel. I think it would be good to
> > > have some clarity to ensure the issue described above cannot happen,
> > > but otherwise we should be able to enable IOMMU.
> >
> > The problem would happen if you enable some sort of early framebuffer
> > support, such as simple-drm or simple-framebuffer. Maybe even efifb. I
> > think it'd still be worth getting the iommu-addresses code into r35 if
> > for nothing else but to have a bit more of a safety buffer for the
> > future.
> >
> > If we don't and for some reason decide that we want early framebuffer
> > support, it might be too late to get UEFI updated for Tegra194. I recal=
l
> > that the UEFI code for Tegra194 is different from the one for Tegra234,
> > so it is probably not as trivial as a simple cherry-pick, but I'll try
> > to do some digging and find the code that does this for Xavier.
>=20
> Any updates on this?

FWIW, in my testing with L4T versions with UEFI firmware, I'm not seeing=20
any issues even if efifb is enabled. My inclination would be to merge,=20
and we can work on issues related to early framebuffer separately.

Outside adding support to r35, one option is to make it so TegraDRM has=20
to explicitly call tegra_mc_probe_device (not necessarily directly) when=20
it has quiesced the hardware during probe. This would not allow seamless=20
early framebuffer transition, but otherwise it should work. Implementing=20
this for tegra-smmu would also allow us to get rid of the IOMMU API=20
paths in TegraDRM and Host1x, which would be a great boon.

Cheers
Mikko

>=20
> Aaron




