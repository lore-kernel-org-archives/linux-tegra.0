Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4663B20B1EB;
	Fri, 11 Oct 2024 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635553; cv=fail; b=AUi84yTSwhQmNd4qMJVCjPxIlRRagDXMfJ2o2pCt3r9yR5IxWnldE9SYeBIaAnNDqCedDZLvEKUxxvYX1lvkqBtW5fwXSOENsWT4ntxw79d/103B3hD3B8EjKtgp8PD7xB3M+U90YyLe/67/DJT2W0rgEn680F9uio2Vo/qCoG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635553; c=relaxed/simple;
	bh=nWIcG0Mikdu38uziA5QxaUUtXkGNfw77ejaYbI4RmOA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FM1fQudMJTP0GGHbdUrSPY76JzC9FB+vhGjm+l8hviVTxkBL2MELY1noq/sF6zISl9Cv4dcrw9yq6TcbtSzJWKfReccHSmr+fEC283g0dDYMyledLAfYClJNiCbpY4qoMK3YsRojIK38jheFlaLmGOl/1IUWNo0AUUOYsXboWcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M44UQlHA; arc=fail smtp.client-ip=40.107.93.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M44UQlHA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ltg4ghyLLIYgBxTDfycvvMkW87ijWPVNk3v2Cjhc8m95q73GolqyvDhMRDbH9E3xDxs/I62LAWx+MaPEzw9aJjNOVv6liwXjupNkdNSEEcqkJUnOSahA2JewyD3wd5X9g21KOsF+ZW2ATluzfxBj/bm/dw8w5dZV4PVGsolujaNUEeLkb/n4LXa4PF5mQ/27KUek6si/7oP9FMlegzYHhB+cNdyiIxW/dPIVxydrGZwjRHiHAt6abQwxqKedXL9hRNH97jsb9cypC7bhSzIM6CMBhFPHvaT7v3Kl3jp1w4VbbJJ8E/kLNAzZtU7AZLoaqURLWXhcIOlA6UIhUt/oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D+U4pY6Oi9kMEH/eBvw2+2hbsx7mobbTlyAVqZZB6g=;
 b=k8QVBIc2m9V0zcPU2Sr97Mjl3/7RnDRMCZ2/nY7eKkchLJsBPZzUuzYuBxxhrSo1/pgiNaTCyQxaWw/DVfqKZ1cBCzlOaXCpm8eJoQPI0o8XQky3XeGJ5dvt4/UNqn9BIi5gGksmUpP/dxDTXhEQI6z/iFpWRtEXEz8gU37FHkTSkUHEJxeucOCjim1lGbfuf8M29SKE+LpYsMB1tGP2sm8I0+nXjsUdFGqy1wMwAcHGlpz/MlyRSh3cRA2cHuKFbLByVfccTwTntTjFYkz8qX4DKiWYgNsuUaPXBw5bDVwL7wGepNgXBvr9fU+AdJ2NrMWvteNv2DzM2QbRQg6m5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D+U4pY6Oi9kMEH/eBvw2+2hbsx7mobbTlyAVqZZB6g=;
 b=M44UQlHAK1XGxOjxM9IfdYlfr5W2tmRIAqvSQGVub0aadSgplYoKcqX9+Ab95gNikFn+C/46SuupgDpsP594paYT8FlQqPBpnMECW+K1eQOi1/GVNsB3hypFL2s1H8ZRUoRiYJ60ucEyUxklbPuVvJUudvn8C/XM74z0OrOgsI+HC5UNabEvmukkXoJg8KtL00wUGB4Q9NkR35xBmmQaL0QmoQZ2sMJjrVFDD/1qmBupu39r0ju69YFw0cGbe5/PAyPJPvpBahIv3Kuk//ge7blHDNTMetoumn34Su+D5cxF/wmyxNQludijIcrlSiWlk7H5KBiH1OkkMvtpjQUR+w==
Received: from BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 08:32:28 +0000
Received: from BL1PR12MB5096.namprd12.prod.outlook.com
 ([fe80::361b:9224:290:506a]) by BL1PR12MB5096.namprd12.prod.outlook.com
 ([fe80::361b:9224:290:506a%6]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 08:32:28 +0000
From: Henry Lin <henryl@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding
	<thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xhci: tegra: fix checked USB2 port number
Thread-Topic: [PATCH] xhci: tegra: fix checked USB2 port number
Thread-Index: AQHbG66rRx1pZWZb1U6FkhVMmFIyb7KBMMMAgAAF4C8=
Date: Fri, 11 Oct 2024 08:32:27 +0000
Message-ID:
 <CH0PR12MB5089B286379ADB50E3C05C14AC792@CH0PR12MB5089.namprd12.prod.outlook.com>
References: <20241011072240.42978-1-henryl@nvidia.com>
 <2024101116-popper-grid-1e58@gregkh>
In-Reply-To: <2024101116-popper-grid-1e58@gregkh>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5096:EE_|PH8PR12MB6962:EE_
x-ms-office365-filtering-correlation-id: 09cd4c2c-6800-43dc-7421-08dce9cf3d88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4vyZz/lhm8dVCEJGMOxRTMJHc6WMHyJsP66guVYqQS3ujGe8Op2wz/Qslb?=
 =?iso-8859-1?Q?vWGd6L+YFLy1AXNDRpwJx6dkS4E72E0V+3/Wt+6MCdTL2NAxlP2shydmFw?=
 =?iso-8859-1?Q?XAKdowJo74cT63skgSgJ7gLcNlrz8O1+s3fiRoxNCYYbaUfIx+PLtJGzr4?=
 =?iso-8859-1?Q?gY9IyaH376pCuI/OdsPL0IlU6a3ObU58GS5REevpQQ3LNFCAmWrJzv6SQ8?=
 =?iso-8859-1?Q?kzqgJW82xIBYVlL8okcDcRxZRJOO7n12IxraOnK9QweVrQYr/EqQ/eQo47?=
 =?iso-8859-1?Q?FCUW2DBpg6pdWHRYz0mTrXxIIGoU/ZSozpySrZ/qrUs7aHa/048OZBUkcI?=
 =?iso-8859-1?Q?W6JE3HP4WFnUKeNaQfx5/YEOHJ7Q/rrF+YOuyMsRm7XmQBq2fMymtauMNF?=
 =?iso-8859-1?Q?KK1d0+iwtVfL5+GvWZ0ziT+gyLsmaZfoAjHcMY56bjxjg5AAp+5GfBYXAM?=
 =?iso-8859-1?Q?mbGTlXvIGmAkdRGADdFPhMwVsAjQ49Na2FRwJ0hirXSCzFIohi+43U8o8c?=
 =?iso-8859-1?Q?7KwGmWtdUHCop6RgKe2w5CjrB2QjojaQ1VHMDaftEEAS9PVlH3f+EO62uT?=
 =?iso-8859-1?Q?GJwvc7M472UXYH3s5KXfVM0ATZW4KW7t8uUTynqS7XRi0lCfmnpsUyZCG/?=
 =?iso-8859-1?Q?eqIUOp9+3oa5x+oUiJwzWiFkCciabuHhdHhF2G//5qGIaTBtNLCPSgtnlB?=
 =?iso-8859-1?Q?wWEOLqQ3WEE1Ogbyv9AV3ElD3VSgn1S0oTouXd8gGYbGkA5JhHcuhmWgiJ?=
 =?iso-8859-1?Q?UROIG+Kzvly1qvqPxenpc7P6zDkLHmv8LgLynzpOBeitNfgdMknLPOGpTm?=
 =?iso-8859-1?Q?eo7iXrQ8D9XTnNcjeo50LJjrzK3KWuj6ZOGiwiCbqAhdXCnO3WlZf9lWtH?=
 =?iso-8859-1?Q?FllZ/VYWNe/NUSKPGAW2CIcM4zzyNe9FLoN58CT/jh4ZZ0IsHSB+BFgYh7?=
 =?iso-8859-1?Q?ivyybVqjM5hjjGKhjFRk8+VeyiK8NOwguhae9e4ylsE1TSL/5qoNraZX7D?=
 =?iso-8859-1?Q?4i4ChkXqdeqhYnq6ekanX4+H9ir/cNtWgsnaRstTSC4w7W2ga4krnqIchD?=
 =?iso-8859-1?Q?U4n6CczBf4E0H1NqYeKQXIcVblgcrqBlfEQFe+L2q6lSyKe4hWVIY0NGsg?=
 =?iso-8859-1?Q?RTfVo5y5TFcqQOoMxBoAAkFb30QsFi0i4wYW/1Zbeh1SJywEMGLDWRwPN1?=
 =?iso-8859-1?Q?OKZ3ea2bfSzUDjDHk4KefG1mO7ir0I2Zf0ZPU07MgrEBcITH+ajKBb+Kbq?=
 =?iso-8859-1?Q?RhInhz8tCOOp7FlO26FC633G1Om1BOkTvrMNGJYS2gdLGs7n3GkH1x/f08?=
 =?iso-8859-1?Q?/6P2BrlQfk468yXFBZ5nxfY42APTy3Nqdz/pGmYAch2Kc3/l3dj6Zp428w?=
 =?iso-8859-1?Q?g4zkx+2Eqz+pvwsZA5wVRH9UC2JttSQQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5096.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rgfFhODB6aGUpXxNZDiqMH4HBTfQiZ1jD4CHBAOJS4nCb140keXBjEAqG8?=
 =?iso-8859-1?Q?sjx1SKXmWRS6Xrn6a2mBZ8PTfwv0zEHNcp8ZVXhm2MKpAD29XH5f7eHiCJ?=
 =?iso-8859-1?Q?5+E2lvKjr5NjADS0PjX2+Tp8FdWD1NOHDuZc2fhVE/6T/kfXi6kcLOOVoW?=
 =?iso-8859-1?Q?6PtSX0ISJIBECtvB7Ve6xt9S47cnMXRpyq84BdiK2oRf4yrvQpqaN3JuYk?=
 =?iso-8859-1?Q?+wqGOfLf2Zd4vhplSEth36eqSXmHtgIUNundKqxMGd0tWboJtQch/kL4C3?=
 =?iso-8859-1?Q?AY4cfrcXiFNJOkySwMLNTvQc6aPWBHSsGgbhbroCLvmBcsqDe7gCjGPQ75?=
 =?iso-8859-1?Q?R3aAHGuPN9TVX8yy8zcRIP5XJlURKPM9k82Mj6c2yC3bJ+hjOx4tJe5IBw?=
 =?iso-8859-1?Q?aaCLBLPziZ03ZV4726uTp9tgpnKcq1p8vMo0m++ro3IBuiAyE3Nuw8ldrN?=
 =?iso-8859-1?Q?cg4Y8jtxn4q2+VKqFuheB4jKxMVDrvOrsNchvfAb/KB7q+yvpWt0fV2+qf?=
 =?iso-8859-1?Q?MpR7jFBxoTud1fiQjZXm5G6h6LTIIHvmiJyHLJJm7TCDZ7yYawxOg7HxwQ?=
 =?iso-8859-1?Q?0XoiHVjeSKyC7jm3cKmhMxD7x0mKbxwl+qxji77pAhmnbzKduYRFeQVoAt?=
 =?iso-8859-1?Q?pgl+K9EYyVLyaDM8oyX4ENw7fclABYXCydIGvzWlSs1igOC2Ib6tPfL1z7?=
 =?iso-8859-1?Q?ZD6UrqKl+FBBudYF2+8FeeeUjFryqwL4/fjmBSfVlZ7ueOZWUNjxmQdka3?=
 =?iso-8859-1?Q?7U8dg0uycWO0Ah69BJs1KNu87A3xk6o/IHLMSqM17XGSBozQfEkHvMK0TG?=
 =?iso-8859-1?Q?rx/leL8IibEbxn/bdDdB6koPhmvWTPRmMg5atqgZ7NRE4J55ZCi31hXBk2?=
 =?iso-8859-1?Q?0D7WA5kqrB0+EXN0rv+p+g7wBY/sQGRxtLDLBIXmuDHqYyUEDFFu/zhJWR?=
 =?iso-8859-1?Q?UZu8+fSC699yfmJ4kI5F7oDppQk1yWdUnKj+rGgkUk3+wIVPN3UVz7J2Eu?=
 =?iso-8859-1?Q?0TRP74VNddVqQzzSCqSSwFfgUIacgK4c/j4uQ4P+EOCoBn411LX7Hlobqm?=
 =?iso-8859-1?Q?nVg6WuSv/qTTcya+x/5FFWGskEDtZkzTw2JJQ+0SaFs9abQ7gnabEHW2GZ?=
 =?iso-8859-1?Q?QrjGIbv+pVAh2FwBWSqXDBtG9tmBxP97EGfaPXq1ks+8HhmUEc8cs0bayE?=
 =?iso-8859-1?Q?oAy4XQ5FNQh1QRB7qQCnVxgYwjKm/+Dn7d9hDfSvMo7JVMtToSRpaTFOxn?=
 =?iso-8859-1?Q?W3rrOqmQGR+CxG//f0r/r/oBkG7EEDHNtAJujMzevd6394/rmVUahslYxm?=
 =?iso-8859-1?Q?X4K2qwefZlP8qIPsSYJPQU5LFdJlTizwc4gGXQDGhWLenrsZXPvPT5V6vg?=
 =?iso-8859-1?Q?GDEOXnMwgvOWNtJfQPdLjSnJRXBibRNu1bOr/G6bCl+jA95WjJYWkVNszc?=
 =?iso-8859-1?Q?7FsXAvrn5msLOn62XxR2iSwwDAnHsfXUqMBybNv365+f1rlu7AZGHGN4Ga?=
 =?iso-8859-1?Q?OpS3MrNTG3hZDUY/QJ/9vFOOnk28YDkUrSMb82aGDhL5Tmfi5G6TXTWVnm?=
 =?iso-8859-1?Q?jziHlcyvGq5K4nrGUAbnPlgvv2gZxzhhEQ598KGe/UYfli2Au7pqdX3qgo?=
 =?iso-8859-1?Q?on+1uYM8FBaCk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5096.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09cd4c2c-6800-43dc-7421-08dce9cf3d88
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 08:32:27.9578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2s4jJQa6QJrln003C+l4LwtQ1TjzobEBYtlr5T2HGit4ezkU0us48WMrTlKrNV1uyMFDzFHkncJhW5akCRfqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962

>> What commit id does this fix?  Should it be backported?=0A=
Below change is fixed. It needs to be backported.=0A=
a30951d31b25 ("xhci: tegra: USB2 pad power controls") =0A=
=0A=
Thanks.=0A=
--nvpublic=0A=
