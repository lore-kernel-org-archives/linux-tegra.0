Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446940DFC5;
	Fri,  1 May 2026 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777595245; cv=fail; b=PT+Nb5I2LjMs+/GbQIoZX5btXzAvWnjSBHd5ZUc9Ujh4CAvndabImFwRC3li9AUCUDyINNcRSBJpWB6hoVEerImqo3BJyJ+XnrAOZaY6Q8EfgN9warxQc3CD/TiOWkRg/e4kPK0oqAVfGiOtZAE1nMCGdwfPCc+lJ1ypeCXyVLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777595245; c=relaxed/simple;
	bh=VmoGKkI7NuJwulbhvTqV0QTHX+4aatQIeLcAJQ/xayA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pNqOMyI3TDJaeAJ644+/lX1O4OFYfZljN+k3Fdq3lVQhsb47pIqjKAR9T+ylYDyHzRJcrQZwbm5FwwL/yq8NKHuiwy36Ql26YjO5rg9SaJ/AmHAm+ymxoKqffIx4Y24QXnkeSfh4CTaQtGECXrhfPBw7BpVld/8b+0e5gcMyD6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e2zCkzJ1; arc=fail smtp.client-ip=40.107.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e2zCkzJ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ97yC/Y0+e9s/jws4HMzHIKfabQr1LgJ/DU2qlKm3dB04r+Lm5Wb2MfyrMh4t+T0SNgPuhmM4Q9PDt+xS2HOjVYl5x14Ntj1suhC1UGK8IxHOnxvEyBw9gEj5w+gq+kwi5zeljzKHhvRoELFQ4znAUgrV9yg45Bq/SIWkIUdI8iQN6aXqNVTvOHKMbMsIW0Denaegao1k7pVv0qjpPeVLFILYaNhfDOpIBcwgL0qExzQtbmej6TTd3ZpDHaKi9BwyrlVeJVfiTqlHM3K+DAt8HNaLpzQjqN66NoI9V0Me+6+CmOGPui+XNL1QLNLCpCsQ1yH4+3PtllKSs8JX/iUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmoGKkI7NuJwulbhvTqV0QTHX+4aatQIeLcAJQ/xayA=;
 b=QnATk5JrceLZ+NSQaUNkMeYuMDEjnt6LC2ZaGacetDuRHWw/2BacK5UhUNWwVX8thOlDIg8opgmU+VLTzAO+oaf9uIoVGOOTbTB0/ta34K88J8bQ2SlFI0vc1SOQNZogMPK97qjKALsQ3r8VbX+jeJbJHsiZjpbYVjetyfZCKFiTGqCvmtgE1HrIxOwhTfD5FJFGwYYSm8wUD5XeS75VyzOna4jRFLX/kR0n9d8VSHOwPZMcbECz92e7lDAPFKMZamPO/ewhn1ucztOCtpPkZTtGGCYws1UH0Hf/MZyyERjwjEwcBob1clhe1VQMoo7FOCw3HrUVbUD0v0Jqo6y/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmoGKkI7NuJwulbhvTqV0QTHX+4aatQIeLcAJQ/xayA=;
 b=e2zCkzJ1h4e2sZNiigbtO7FJldd9OUZmziplNY0amdHBUa79kZ1O1WOMsgWmuPHB9dme+CcyByFymKcr9CoRinvCFqYVkQQF1FRL6eh6LP5y8KDuHLdT6HIXi5UWtwMjNQVL+qilp3W/cJK3+LJIIPfpaGrPeOEYfP0BMqAj8gOSBcTOod+3JOCKN2GTZhi/rimbzbiasB8FYDeYqv4/IrxyvpA/GIB/Dxk6v/nsOow2q1qYy1ydN554dN24vfZCGOooLpPMb9Vraaf1o4oLAQuXUDksyjBP2lrumKLuRude0RHqkFPRe0G0TpQHcnLEkM3lPxzdE+aLpkNhZ0WAOg==
Received: from DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Fri, 1 May
 2026 00:27:18 +0000
Received: from DS0PR12MB8442.namprd12.prod.outlook.com
 ([fe80::c4df:b439:571:4591]) by DS0PR12MB8442.namprd12.prod.outlook.com
 ([fe80::c4df:b439:571:4591%6]) with mapi id 15.20.9870.020; Fri, 1 May 2026
 00:27:18 +0000
From: Matt Ochs <mochs@nvidia.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"yangyccccc@gmail.com" <yangyccccc@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Rich Wiley
	<rwiley@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Nirmoy Das
	<nirmoyd@nvidia.com>, Sean Kelley <skelley@nvidia.com>
Subject: Re: [PATCH v3] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Thread-Topic: [PATCH v3] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Thread-Index: AQHc2CMVnUUPaHwN1E6xtk7y25sENLX4UjWA
Date: Fri, 1 May 2026 00:27:18 +0000
Message-ID: <4BC7B5BD-9160-4A6A-B18F-E788CF340E8A@nvidia.com>
References: <20260429215614.1793131-1-bwicaksono@nvidia.com>
In-Reply-To: <20260429215614.1793131-1-bwicaksono@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8442:EE_|LV8PR12MB9449:EE_
x-ms-office365-filtering-correlation-id: e632dc8b-7cbd-4f51-3956-08dea7186704
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 XoXqy7vFfklF6N+kk0TmMjjsKEMpARhpAiD/C6pu/GOLoKNqQeo7BVWfyg6BgcaAsoEDaoYEqQ/IAmyiCKugusBXT72KPFO+NJRghZnYjc5K2cCEZmml3ry+KNmu1jToGOcOseW9/m2QUmf8LwxvmSRCdjQxdMCvXAifDQcLHfj5unSSIHElre1ooqKOIQMNzna56EvqbZ4qXLYyVRfFNZG0JdL3Ewn1dZ3Jd7gdrRam5fgjBjC+gGw2mWT8w4Tpv9u3vFX4IgGkbfNJQLhPYiNkBoeqGLzrBHZaWNRNjHe8Ya1lVX3tLBkVNvg8tr4XbXzibKxyz9mPnm0Hp33eFk3S4MfrYia8ZQhQPjn6/N9b0JTccyaxvlEmpby4edL5eYAl3otWnOl+rPSwdUTxPjm5QPEJBDywVN8CCc02uGzeCIbgFRDhUSP6f6I8L4GhLgHjrHMi0qPj8BUBzOX2r1BR1csmrE2qS0KQF7AEA9uC6MUfDhuiYfitu5fQybrmRYVwmoeILC4PwcT0b7tXD7YYt1sULWTgtv5Phq3hnNfsk7/g6Idtz1Hn8sKBZr5zUvX27xIj2ifJseIMl7PHP+B3wInrkwY9rUtfkHlZfrtYpNfmKD6TJB3SigAQD+ksGec2K8SYUdjeNoCgPillJU6NWH8NV3UahKC/bSQcV5aVVU4uCND4wtvhuvdMdo7OagA8aDQfs8Avjp1EdKr0Ro//TcwpCjyjzr2N7ogt/KBOQswo9It8g2HhE+wFFaBY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8442.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?H91dXT258IJhL/211DM0Hvq5NRz3ciQTvYYkU9SeWPmrdQuFU38pIWIWqb65?=
 =?us-ascii?Q?lC6B/P4bjQmd5Wj66ZTsnrNSN3YPRMIxJCEGeApfEko6TXIi9jBE4AAOCJf8?=
 =?us-ascii?Q?ScPpmToy5bX/IExdXBpF6tB1bB+mCwnrLdWf8QRW3bpcyRolRKFZuia1Z4xr?=
 =?us-ascii?Q?fMzIWNDgpGc4KhP4sL6uqaPDBk2/Y01D7ZokJ6Y3+wBoP3DK+CTrQBd5Hpdq?=
 =?us-ascii?Q?XhycIBEL/bCsrqQT8ciRAAe9M+m5pSxao57uvmCDF6hTGnaWXkDdIQkMnZ0o?=
 =?us-ascii?Q?aEK7FUrel7cysi6T6KyKiJw0+k4P1I18f3SIvlC8tMkjAgyOjI30FYF7Jd/M?=
 =?us-ascii?Q?kl7KFfYZic3i5Bhs4pSiwLmTVwS13+b/JOcCabi7MeI6Js1lTtI1wz9ijgJh?=
 =?us-ascii?Q?wIhh55UdgNrvprhIrhQUg9lCRRfvBEoyRjaBQfTtv/9XQGuzSYwrVe/sCyx0?=
 =?us-ascii?Q?s5pkdyEOrWDHJUEufocrZwIwRAssIJ40ZlPn5JbMYqbC+TXGTbVYpfZxddPj?=
 =?us-ascii?Q?aFF8NuYOavhMKfFUq6FdzDHIT2BtSPEFCx08kGeu0Th7CO8KI/DjLYFGeGhH?=
 =?us-ascii?Q?8FcB1DlOlIJI35g6af8XsdASqZTAA4PzcVvualay6C4xDr6vcOsJ+82no1mt?=
 =?us-ascii?Q?tNR1Ao+LORSwhcrhUOSylq9EDXkS5RvCuepUjIqftzcXQU3PjpKUp/PAJwbx?=
 =?us-ascii?Q?Uesy8KXaYvbBJxszl5Ah6E+zgkJQdfpwMyNUH3ebfb+cs6NgSbcZZJD/TUiN?=
 =?us-ascii?Q?z8mQ3d90rf9mdHuO7mger5CTkxM3DV9voQvCVeyPPDbKluaGB8KjKf7EVILi?=
 =?us-ascii?Q?m8oZJ+XOPcCKM0ktombnIaEeEb60hBcx499zm+kLarw9+1A4bkDqaIHw5eMR?=
 =?us-ascii?Q?VyeXIGH6FYY23uWkzTHmZgUifftfyYkg4ykPcsCGPvGVvs7Y2M+OFtkDnq0U?=
 =?us-ascii?Q?MDR5fVUZbfyjknCdttVx6w1gRrT6AK4IJTq1h4XPgVzaKwIql+Wnc+NVE7IA?=
 =?us-ascii?Q?fMdCZBFvVWpHIXTNI0ygrmK55YaSDJxQUKSCYlD2NbrKYTFtkAY7kfSJTyWI?=
 =?us-ascii?Q?1wTrifopbe7ZvT7MjDTuwDe9KhQRBZkwYiXv2OBsvE6/StySnuKSdqPpQIeU?=
 =?us-ascii?Q?CSYQreG1L+q749+Hdwr1w8dbLr6TmJ3xIAN9zPyi7UmWYnqAmFvPHJQaY3fc?=
 =?us-ascii?Q?3jw8JtDt4WafBA6tAz7/4J8r2MTPsquMqTPfNjzJoTEc+jZNo8ZyxICQBRHz?=
 =?us-ascii?Q?sj/zmUP1vxbAPWYVkbMcmpnqSVOfYQOQwD5dgHSAh01OOuoE/PcAlccE2NFF?=
 =?us-ascii?Q?8c3qFTbuHzwLy2Qp0kwSaLf0l8UvA7doFuiaw8nO6O3OC6dR5175ocpi23Cl?=
 =?us-ascii?Q?f3kWMt+Mf6vYtNtstHtNhBHDwh0pwF/GJniVyuJWuWc/rYuPoVlks/nuhHp7?=
 =?us-ascii?Q?t00+4kUAweSrZsSdu8wHUH/OBTjNEqPlAjb8vqMRyk8wFOJfRH0Qs3+zNLzo?=
 =?us-ascii?Q?S7vaQJMi7RaDGYoRPnbfmEltPuO5Ug8jm2ssk3WCS49bWcgexdV6q84uNuIP?=
 =?us-ascii?Q?Di9SlsHkQ7sZi3LCnKLpdLixSbjF+BCIvYJHRPV96nVqkoMf4Fq92dg4RKsc?=
 =?us-ascii?Q?c6nIpio22UExWmfvqTuvHfcSDxvb1eQsXBoDD7PxRiK4KE9n4XqC4w8id+zP?=
 =?us-ascii?Q?5eUglet2uCu6x2O0HejPqpo7AGBiYhi0uooliYjVgDGNTNSwzQlBn6M8ZAr5?=
 =?us-ascii?Q?7SH2SoxQRg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5C3220BB1279BE4EA63CEBA5172FFCD5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8442.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e632dc8b-7cbd-4f51-3956-08dea7186704
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2026 00:27:18.2270
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3SGhK6FDB1HseCQeKlHjgDsm/2L/JjqMDGNW3AbVzUpXLjV6U7uF+ZqBAGDAoxDQEak/43eAHmFy+5CUzikjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449



> On Apr 29, 2026, at 16:56, Besar Wicaksono <bwicaksono@nvidia.com> wrote:
>=20
> PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while the
> PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
> counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
> give results that differ from the programmable counter path.
>=20
> Extend the existing PMCCNTR avoidance decision from the SMT case to
> also cover Olympus. Store the result in the common arm_pmu state at
> registration time, so arm_pmuv3 can keep using a single flag when
> deciding whether CPU_CYCLES may use PMCCNTR_EL0.
>=20
> Use the cached MIDR from cpu_data to identify Olympus parts and avoid
> reading MIDR_EL1 in the event path.
>=20
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Verified on NVIDIA Vera (Olympus CPUs) with UEFI SMT disabled. Confirmed
that grouped cpu_cycles events show ~1x ratio (both on programmable
counters) with the patch vs ~15x inflation without it.

Tested-by: Matthew R. Ochs <mochs@nvidia.com>
