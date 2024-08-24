Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC631714DA;
	Sat, 24 Aug 2024 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724511389; cv=fail; b=QrgAEmNnxEsS6LoBv4zaLVJA1F87LxUS9xGazgYLvlMSdF/7OzpYjMgaz7NLIazX7qTGIsusXgIxDf/6Zd5LWPUaQy2rh4F4aghsp2In/K0zrTVEj74gUV9SNyL/CwIr+kdo6RBJvGpq6w4kZmaEv8UhRvzJN2/gxdQe+lcWteM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724511389; c=relaxed/simple;
	bh=PRe+pCYUUIiU2os88tqBAbroSxQRDF4rwC1R5J+2FtA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=frQmFEvEq5dpZ6SYbxQHCwlXeHEd45HLdgTAKBtfxbBoCt/jaQ+PYN0BQ+BKTbYBL8VtKSC8e/FuRzGwORYZWE+JymoqeUPxjSUk7FRnqfY/hTgQfvM/p73hef0HvgyJ10g3iBme8hpYewJq13qzCIOfv2hm7TQ95Q6M2hCO738=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N7+/Wn0G; arc=fail smtp.client-ip=40.107.212.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N7+/Wn0G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPSRsZOoOoCAmU1KsnawHWEhW040PaA5bsO2QdnrW5SS1DuEI3iqFsnSezMF+ihjLMt7QmWE7wwXDwTIS+4EKoO/Q9pgiyAZzTeRgXaxnCeqEBV+BOxFJaOCyzhLyEvo1yHvAj3AG7j4IkwESDeaSCfhicL2Yary/Uee64MZjV+1U5Zh6IxlhkIM2K7CgvI9rNdEpulbSgNMAdbhTDfYig4DsKKdIvW/uI0iK8kvph1SQikbIoLiatlZ5Ehi7LoBRGrqcu47M+zDJGmZRaIPUitebJ00eYuwa50EpIUg1AKzh/VCoLhI2OYw03XC3KMA6mTRSmnn0xQ+I62LHbNCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FHwrfF3qQHr07mgO+oBhBKZ0RuDPQOvSaVXu31RcLs=;
 b=LLEaqNCxdH6GrHX3TL8qEHhFfc9e+zZnqZv7Glg5nZEfqothB95bvb03HllNMKpzAwgz8+t/m7wEZv5LJYiXMhpy48M0sNlXIfa7C/MRyU7f5DJw9Ol6GkezmZXrbSavn4vloFBoaGSqDEOdlxiupvRAMrkzCLisjHQAGA13AO0o5pgTF8iXoJ22nzvrGHH1q4gLU66OWTlqw6gg19VByw8VijroWn2w/5ykr/j1sM3ZIDFLfVSQFKGTP1ZHcS+uXlT7dMt5vAWDt1I7cyi8cmwTlTvjO6MCZKEdDpIDO45S0XzlARsxxZXoJj0sHXHg+2wd06Fwrn5VACRpKXICNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FHwrfF3qQHr07mgO+oBhBKZ0RuDPQOvSaVXu31RcLs=;
 b=N7+/Wn0GwBOgObxWl01rwB0CnNLhFiW/7Vq0sHeCH4ya5EddGLLDfKT8BLnFBJK2Y95Dw7AX1S2MUuwRvidAHlUXnED4MFeivihuFcBXdbuCQ/W1mR0dhlg1MA0ldXW3ZVEw8gOk5r8LLj9Bxcy0uWag6GKk9nuAYAo0HB0GbHKAhEj5qXDBX0vTexesomZ5cSF0eSPhufGf/ES7CTfcw3Al8V7Op0LJNYbeD5XtS0KzNf0jDaEeRPKSRPDNa32UjvZb+mgMGcFMdXxlIDzhI8/SyICBcRD6+ImThGbYlElbqGYEmhM9E1hye8E7oXuiLV2iy+zGjcehRguiKNSviQ==
Received: from DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) by
 CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.25; Sat, 24 Aug 2024 14:56:24 +0000
Received: from DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6]) by DS7PR12MB6237.namprd12.prod.outlook.com
 ([fe80::64de:5b39:d2ef:8db6%6]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 14:56:24 +0000
From: Brad Griffis <bgriffis@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Dara Stotland
	<dstotland@nvidia.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 7/7] arm64: tegra: Create SKU8 AGX Orin board file
Thread-Topic: [PATCH 7/7] arm64: tegra: Create SKU8 AGX Orin board file
Thread-Index: AQHa9aahNqCc74nQqEuyC0xDezlxk7I2DMSAgABxG9c=
Date: Sat, 24 Aug 2024 14:56:24 +0000
Message-ID:
 <DS7PR12MB62376BA93F76947BE87D61F2AC892@DS7PR12MB6237.namprd12.prod.outlook.com>
References: <20240823214957.771297-1-dstotland@nvidia.com>
 <20240823214957.771297-8-dstotland@nvidia.com>
 <t6dccgrwco2ww4b4e3gwk2tfcwf36kunejm4lamqpk6chz4sde@jic6ou6zu57l>
In-Reply-To: <t6dccgrwco2ww4b4e3gwk2tfcwf36kunejm4lamqpk6chz4sde@jic6ou6zu57l>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6237:EE_|CY8PR12MB8314:EE_
x-ms-office365-filtering-correlation-id: 2d835c9d-26b2-455f-9cae-08dcc44cecb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?i4GjQHfU8sEAqK5BOnjvIeqFBrjdgAEGovpTWK6yHV+cNRwe69RBH4ew6X?=
 =?iso-8859-1?Q?tYRW4k7RpRMX4HwS9AlBacAWT++U+iJBv+hViTW18RsTA3JuHbNTucvJ0Q?=
 =?iso-8859-1?Q?kIGrYcQ6KCEGe0twXwqEqTpZP+8KaNbzZOiI7gEGyPHNODL61TLgeXjpt+?=
 =?iso-8859-1?Q?VZ/SiAY15C6id4u1s0CW3g1CgIZYIZQF3XMI8jca0+mQygKLBRyHPLOHgE?=
 =?iso-8859-1?Q?hDUsTXvY10NAMJx/9KeGgjTr+SsCQjGk+QuFi+hMpSieLO0pcijaIzsHYm?=
 =?iso-8859-1?Q?eTSSUZrwJbxH7had1Q41uiADKelj/11xgkV9V7ikqRYCEfKyOzxX7u7yDc?=
 =?iso-8859-1?Q?M/sE6nMJzFYaXPdkvRap4FPAIw1e84MRqGY/stvPgpJcGJyO27XsTouRe/?=
 =?iso-8859-1?Q?j4JPhZwzh7f6nCc5u/C0xUSEDG5UiX3ySkNbTRcpNkDrrtG6C8WaESA5oZ?=
 =?iso-8859-1?Q?TVYSEca4G4IqZCk6WIwFfcOIPlt0/Sl1tEdUfFvfUpzTGdADGjVgeXua97?=
 =?iso-8859-1?Q?j5dgS22XEcG2mSa3kwIBEthujXeubI4UlcGXNEBe6i2rR21THcKFkJByGG?=
 =?iso-8859-1?Q?BR/MjkLOCOIseFEltKIXHPqI+zbYf1332jnA8lypcHYmAi0O6PGodfIgau?=
 =?iso-8859-1?Q?Cd5fpdUcezLeiqbDaAym6d0yOIf5QuWtUVGM0AaBbxa8fNZRVHPl4+kuoB?=
 =?iso-8859-1?Q?ctmDGMShdgeK01kZqgFB2JBDij742SnxQBZ0Q4ccB5qrOZcJpmyKNbcErn?=
 =?iso-8859-1?Q?kOy2mWu8rgAldNzHja8CLxzsXjqAN7urTuMpjgkBs80Cl5G4x7EysJ5DZl?=
 =?iso-8859-1?Q?Tj152rPMFeFEGi7wziXFMsNg+4cR/S1ByE3MRM9/6EhKsTNDRWmnrMNuzq?=
 =?iso-8859-1?Q?QNxtAOAZCjrQr/4M11RqnBeN/O5R01dQDmIReOYb3tZovsfn7fcO6ilP0o?=
 =?iso-8859-1?Q?GYv9mLCikeQ88qsQ4Qbpf/V/QlBtfHtUZDxgAL8UXgYgp34cLx6J+BDyXD?=
 =?iso-8859-1?Q?PhOjEeqhXGRRm2dvZC7nP02DfFirtcI5UtTNimRk8B/CWLkg0tJsawwRkj?=
 =?iso-8859-1?Q?aR9lsNz/FVC5pKHTGVj3YollKSLB7fFT/bITnjz7nrA1WN0ZPQ/Ip3v+4M?=
 =?iso-8859-1?Q?7/2plVO4a4seQI+t+TpaVPQ3V5yOmpK1DasEAxxpw5etep+6fSA5Fu+Hbq?=
 =?iso-8859-1?Q?Hh2aKoNuG5pg+8LlnOUFC7CY1d3d0dqOzdzmkgWMAebakVVmMSyIHFfFFM?=
 =?iso-8859-1?Q?O4VPo6R2MbG4MPxtgsmL57KkwkEI6gdn9BakmUwfBAcNLx9AlolqVhprQy?=
 =?iso-8859-1?Q?WZ5h+5PY0d/+tn3e0AeZcyv3t/qV+WdZ6WwHuNivIfXhRndZFjXlZ6pOSs?=
 =?iso-8859-1?Q?ccQhFm+OdBKxbKkfVuWUfwatP3A0rpIBIP18tMMSSpYgLHzfezUsJ3R+XJ?=
 =?iso-8859-1?Q?/zAmntw6V96u02INp9A96LQQtGRe0FT3KIjvDQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6237.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sm+czmQVhVJu1eFQ9Py+cIMIB11SUK7DYocTYMxRN0dS9gqnFEZ+dClXFF?=
 =?iso-8859-1?Q?1+oCtXjH2jeO4qc2P0s3+DRdfoeHNaRdE6bOm6KSia0w63vjw62Lrdup/5?=
 =?iso-8859-1?Q?59OAvhRbAD4ngbKfJZAnIz5ohnmDuzqp0iFDOQg16p/No0VwfYuULzG2jh?=
 =?iso-8859-1?Q?zRt8aeAXd949Hv+8stqZf0Ts5udjUDVi6GjdC0gu27VP42uDP6SCSH5MKP?=
 =?iso-8859-1?Q?dCgSU8H5+lHJ0D1UPLMq+Ec0XFk/ksvPu2jPx3NlNIr7CKDLrazs+jsKFS?=
 =?iso-8859-1?Q?CQzcZBG/InhoUCg+icIM60cBXYOG7SnW8FPtg2sUI1nZaRdDZg7OiYRiOP?=
 =?iso-8859-1?Q?8ZhHNQtlgdKB7xKMPiH9TBu4A8EXLrck3A+9jQTvO08WLNBYsxUycVbuQe?=
 =?iso-8859-1?Q?1mweLHugKIuHJ+aLNv17IdPaUDf3VnytwD9jg7C+jjXA2AWOczpXFsMdRW?=
 =?iso-8859-1?Q?OElv8eAilxG5X2ATue1ZbvpnAs34E0ggbYWHSf4WoUX/v1Z5scLnN/6P4R?=
 =?iso-8859-1?Q?oMfqmplb6kb1/tpJdxzHR5Sy5VZhv3zAwN1YgyGixhj9IDG4IeE/VuwEdU?=
 =?iso-8859-1?Q?uLFzX3VI45jxZzUMJQQZQ08qEJmi82ZzQyyiTDvy2fbJbilp3rjx0WBA0t?=
 =?iso-8859-1?Q?7ymGY5lCmlZpWPmoOb6DmDlpG/CnrFDm0pov5HYChBaY+WWmaRqZkI9c3E?=
 =?iso-8859-1?Q?+f0Px/L2iMB0vdPY1gCZqoLqS8GceGFTMziutSXb0DTzROrzIznSYxB5kz?=
 =?iso-8859-1?Q?KAP/YHraIq5Q46AJdIDAaE/erHxJmN1cmNn5kTZqWsX26owoqV9gH3Fwri?=
 =?iso-8859-1?Q?xcvLl+Wu+iA1gDUoZseExt3zn2pq4RFKR+ncpa6xoqmuuh/nD9A4N+1vyL?=
 =?iso-8859-1?Q?3JZeloj74nxqcxRlscgm2wK774F1oAukQLcTSCH9Jkf5OAAyQ2C3JuCm7n?=
 =?iso-8859-1?Q?V74lODHFaWkU/POegJvYwNELbIdzPd0Hx0ntJ5jmIY0W4PlguG7pbPEZNc?=
 =?iso-8859-1?Q?WU3ahM2VOyERTKNTXzCnJBJlJiZlQis2gg6mTeve9YTtGP5BxNl5ISwXs3?=
 =?iso-8859-1?Q?CPd0gNFsDRXiquK13WJl3M7ITBU+m8hZU3oKR9XI6bWRZ6qmSE9eACL5MN?=
 =?iso-8859-1?Q?WKRla4s14FXRkOkcGlbGwAY8Fm2e/ZMBn6V7952F6XJLLoulBp/61R4nQT?=
 =?iso-8859-1?Q?7wxsfM3GTg/ieMOHzLv4ajImdz1SKnVK+WfeDLqO/2bwVnv94iq3S5PZSl?=
 =?iso-8859-1?Q?DQnCHFLXKfVwQSQCgpqlMPXKgcabMuJGN4og+4xUlKmwUsRP44oYc/AyQq?=
 =?iso-8859-1?Q?C4MgvhYV8b8bDzy0jvRs75kix0NE8iIL5xe9WQl5WtHkXIrLKYVzd79mNq?=
 =?iso-8859-1?Q?qUwMgvdQZf5qW+fS6rwvGSaRrXpdVAb98J8pIOpiuy22idL4+DO/r8BuGV?=
 =?iso-8859-1?Q?CKRpLVLckhQrygtP5OKSn7FEsYlyoy9smF5rNGQ7w8oAifsgPJVEu0wv9K?=
 =?iso-8859-1?Q?EsqVGVv2VBCjkrpOPfb7u0n1JszXvL0gHkMiesXd1HT8Z9P8I+bSe+8s2A?=
 =?iso-8859-1?Q?Hd33NdedTtBy43JsLNZYBikSF65gJuXqn7rSWqSdWDQ8mNpkKqHofjotpc?=
 =?iso-8859-1?Q?t+sgCbwGEHTCs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6237.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d835c9d-26b2-455f-9cae-08dcc44cecb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2024 14:56:24.7159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvRy6ub3E5Uj/27dGdD3TkkzSHJu7juLNBMdMtkakKr4QEIEPdVYEHFMbpJfYyYRL8LEdwXmb2ZGtx85gjiecQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314

> From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
> Sent:=A0Saturday, August 24, 2024 3:02 AM=0A=
> To:=A0Dara Stotland <dstotland@nvidia.com>=0A=
> Cc:=A0Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlo=
wski+dt@linaro.org>; =0A=
> Conor Dooley <conor+dt@kernel.org>; Thierry Reding <thierry.reding@gmail.=
com>; =0A=
> Jon Hunter <jonathanh@nvidia.com>; Brad Griffis <bgriffis@nvidia.com>; =
=0A=
> devicetree@vger.kernel.org <devicetree@vger.kernel.org>; linux-tegra@vger=
.kernel.org <linux-tegra@vger.kernel.org>=0A=
> Subject:=A0Re: [PATCH 7/7] arm64: tegra: Create SKU8 AGX Orin board file=
=0A=
>=0A=
> Please run scripts/checkpatch.pl and fix reported warnings. Then please=
=0A=
> run=A0 and (probably) fix more warnings.=0A=
> Some warnings can be ignored, especially from --strict run, but the code=
=0A=
> here looks like it needs a fix. Feel free to get in touch if the warning=
=0A=
> is not clear.=0A=
=0A=
Krzysztof  -- A mistake happened on sending these patches.  This particular=
 patch was meant to be dropped for exactly the reasons you mention.  The fi=
rst patch was mistakenly dropped instead.  Thanks for your note. I will wor=
k with Dara to send a revised patch series soon.=0A=
=0A=
Best regards,=0A=
Brad=0A=
