Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77138C2DE;
	Thu, 30 Jul 2026 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395260; cv=fail; b=Fpx2i30hc+6sUp5yrf9faz9T9PKuY3MpxbrFGD3AcZG1ZJg1Ekn/vvI267reX8jMxLzsqu1T9ybO2wkc6LWHe1OwTAQaHn+AG/1v+Ee3nhGMwZzXzu5wzYFJkvW0wiYIL4qz4MsAE0e50q3jSaYOCjN2785H2HEPpKAalf/TkNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395260; c=relaxed/simple;
	bh=zoURmAaunvH3DwNF8oCV14c7+2bvID4Yw+97HcKemZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BliIBTh62/jxHJjHFpJPbznAl3gFVrAestb9KOV6mDSBxgV7sJpRYyA58w8JGeBGS9vT5oxQ+bekcqFEXW7em2DeYZGZzK/H+RQKOOGKE5zktp/7GVTQ84HI+dhMlL5gZfCqF90h0dAGqy0AyNTZQH2ZoTF6Y/RQlj6wNrD+5Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=azOyiLOj; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="azOyiLOj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5do0U17S+p9FhEBEWZQ7+u0hui2Na0l6XXg45SbI7cICe/Ib0RezPW+IotO9etB8AQgG0O32HJcUC01rLdWSvG6T7MIMfJCir74WoBp9RL7OITtqnG0qjnBN/yNxczmIVkPxFAKqW0OmBBtHUv55AvWN1Y5ySsOBv7CYjLb4knpXG8FKcALSwTNgR3U458NU/dXlQG683D+FJACvSJzOOLhaKYoxtg6Yax0hJWECtxMbNakPYPcOgRUy5ihJyWTHD2RcwJ3eTgLNOBNYHqNgpTpt4mlojp4rEwROEOXisBiuWyjpuxbnLxREv7lFq/Mtcvl9HzgSxPoRTE++e8Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeYgo4HsQQ2JfbILWbOClUZSdLozPBxkLKUfxa9ZI80=;
 b=kA6q4wqPpkTKprMM/eItTlqmAN2CA4jmxIBP9INdKDBnWvFsTCwYf6I5XP41VQWfeXBboyc8fWOjlXbqPTYvspr6ozCXSQ7LcdyVYvXlQs/10zCaynP4cS9TgLTLQo/VeaI45Kb85v4oI8l8Djsie2ekiszvAiX1z4eYJDwHXaw0xmeD1pbaFPkp2F1Mdwvbb4wU9eVVJHbX6VSSSZlR+S9YMfTC+rvRaUpERQNKsCwSSLyNZREry/7PfAfvc8aGf/Z53zJuboZU/sjsmd854B7qN9VS/ESiibJ58yM/ldwOXO426RmhciIRSQlS0tl5LTD924osh75ee5EzkRzqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeYgo4HsQQ2JfbILWbOClUZSdLozPBxkLKUfxa9ZI80=;
 b=azOyiLOjS2IR7Ic6OHh/+yOznyFkFDw1eq2AzmDEIAT3lOCdl+CZBGANKJhGyeEM7WNt0nM5ocglhAVPj7I1iC2fRQdqxPiDT5cRmKw/77u/I2Z5nUiviIEe4tg5f6zWXUf3kxMUsFQXck94e0kEo383horE8MijVC2s6ecVEek9Yi3jKE4F1zCoPj6ca3Qn6Fm0hpR9JBXu/c126gW+mBo7ULyfO5qcLRq3Pn59kUcXy2fpMgqnptUmyL4n6xUCC/13vHnBXgHKuEnefnsyWQpKXESKdIVxFah05iEfI4Rr9DY475tyj8IXIvKbF4PSRYwovDIbiUz7AHEC7JE58Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Thu, 30 Jul
 2026 07:07:31 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 07:07:31 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 05/10] ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
Date: Thu, 30 Jul 2026 16:07:27 +0900
Message-ID: <nNMjoMjdT-Guv3By3VWZWw@nvidia.com>
In-Reply-To: <20260721101059.451699-6-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-6-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6PR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 29428bc2-35a0-4c62-00de-08deee09391e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	T55hHYv1QstuzQ3tI5yqnHR1zyckapcVhQmPFrKvOEms/M/XpLFDpDJ5TmMG/SqcxfDzaffY6cPZmagUgoV8hO8DXhEuyjQlF7Hjehl+T8f9i4YLn/9hZLr3nnF3rfNJYMsiiGcEkiGDCbCQLz+kmK3T+jH9k0BB5YTzYCX86gYNbLCdr6blXWCUkxrzxDRRgR/eUGDRgz61uXaJB72uEve7fX4f4ozmDzWdftbBiSjXeTw7Oug1MJuNR+tuHecg2bb5ziYSwC3iMcrR6nZ+NEiVe3Swn8E6O3p/+ymOjrWdEAcmSKfPajRtI6rdnV6aR7liYLRFmORKJB3IiBZY16Hz8FZ/EOEH48eJOQ4j7LAuXLgyFCe3CFTJFWrUuMRjD1jR3fWDwUieyBnssMLh/27uR/9Vptvq+yUc5BNhW8uljsiH8LhK837EGCXKiHS1llAnnAvqSEsUmCFg3na3MHQ1CebUwY0WSNAiCN3kZe3v0pR7ZjBz0nkLVtoo97IUfWSkxmH0Ajf1LKAn9/8ulcaHH6AgzKbhgOEY8XAEUW6HsgbRKQtQ6ebrWorvkbDyGJtOvTk9Y7mUZrrBSr3ggzAc7zuD0ft3i/lcSJiP+gv3/cSwK4mpMxSV9sLT6gpJ+nz9A92fBer1qaMUq5Rha/sOgx/x5t0P976Z4t9YB/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzJxa3NLMTREenpFQkFhS3EwQXFkbFNXTElUNDMwWUI0WWVrWEpQWGFUN1dC?=
 =?utf-8?B?Mm95Z3NLRkZ1dlZUa3pBcWtIb21tdTdrZFRZdkorNE1MZVVVSFZzRFBobTlF?=
 =?utf-8?B?MmdYVjdmVlI4R1d1ZlR2a1hVbjlpbmJvWjFFdnBSdVh1T1JhcHRPcFhheUk2?=
 =?utf-8?B?OUl0Si9BRENNRERPUkJ2YXZzUjVOYXRYaTRPT3lHa1JCWWMvVmhVN2xUUHIz?=
 =?utf-8?B?QTlHYlQ0VGJBNi9QeGJydDVBOHMvRzBDdm9QU0Z3SHIreURnejZUbFJ1cWtK?=
 =?utf-8?B?d1pndWUzekFkSE9wd0Yrc1A5NUFkT3dRL21Vc0NINDdta3dFQkthUkhLOEFj?=
 =?utf-8?B?RGF1elJiWElCaHFkb2F5eVdrMk1sTDhsWTZ2SWtTbyt6Y1JUbHl5QVh0MXI2?=
 =?utf-8?B?RlhzL0pMQkE0TUk1ZDRRcGZ6VGNubGI4cW94UGVRK1pQZmpHQ0MzcDNnMm95?=
 =?utf-8?B?d0JSU01nTWg0SmNrUSs2RjhkL0xMaHhCT0lyRDFoczl0SUcwS3NXTjF3Z3h1?=
 =?utf-8?B?aWVyTVdBWis1QjNtTm05Vk5zUnZkaVRTR3lCMkF6REhqemt0OUlUbkVtd29h?=
 =?utf-8?B?dWJNdnpIODNjS1UrZmhTMHBFUkNsS3gyMWc3cWxMV1FqTXVMSmgzMUk1bzN0?=
 =?utf-8?B?dDJpQ0l3cTR6NHRYdm1XT1ZnTEhQOTlWUm1OR2JLcGNIeFVzSkFhc3ZCWVNp?=
 =?utf-8?B?bUhpU1JlUTRoWHJHWFhSRkJDVkkrc0pzYldmNGRuZWZ2Q1JndGJTUDBsaGFi?=
 =?utf-8?B?SE9TR041UllYOUJndVJnQWM4ZGh2RlU2T09xNDZ0amNBVldhdUhxSm93TzVF?=
 =?utf-8?B?WUxPQS95dHBZckl6WGFYMmRYTGQ1V0pwMXlwUFJveDFnazV0N0xiK1k5Vktw?=
 =?utf-8?B?OXZqS3VYQXFFa1NUQ1BIa0I0T2hYOUFCVzN2Um4zaHBjOVUrSWlYSXNuM05y?=
 =?utf-8?B?M3ZhZmRNVGJQcExMMW50NFhLMEdyeDR2aVI1WDdtb1dMWG1yVExBMGNraWk2?=
 =?utf-8?B?RGh1VXhWeW5KTTkrTjJoTFluWnVFcVRaL1BibFZET1FkcytPYWxpK3hKTXBj?=
 =?utf-8?B?UzFPd3hHUVhCbjNtTDhOb1lnR1VSNm01N2JDaWFNM0Z0a2ljU0RhSjhaWkZ1?=
 =?utf-8?B?WUMwek1LQm41dHZ2dFpSUmN3UDdOU3Q5WENiRG5ROHM0dlNEM21OWG9pdWZ1?=
 =?utf-8?B?UHVSYU80bXdYcmpwbFh1ajhxemVOTWFBcVhlYk1kamFFWlpWeEtXNGhZQzBT?=
 =?utf-8?B?emF5aXAzV0V6WTNrYXlLUFdLczBZOStPYUdFUFZ1UE0rdndzbUQ3bmhoWTI4?=
 =?utf-8?B?Q1M3Z2FWOEtKQ1dUb1ZtLzYzVzhzS2tjN2JLZ3MwdjJtQjg1bm9qTFc1WHJp?=
 =?utf-8?B?Rk5keW9JbWRrQ1czbVNWRXhwRDJrb2RiV0VhNTJSVi85VjRxK2RFcG5NZ2pU?=
 =?utf-8?B?SVBLbE42ZmNMaHFMUGFLMDdnY3ErSmlkOUV0azRJSWQzbEdLNE9ITmVlL1N0?=
 =?utf-8?B?UDZBdkFPSnJEaWJiRGVuZExYMVVqaFFRT3owaFNCNzNqbjA4ME5mVjZPS0k2?=
 =?utf-8?B?ZzZYbUxWMWw0YTJySXgwa3FnK0poeVlJRm53ZFp4dG5XNG5TaXQvTHl6aytR?=
 =?utf-8?B?bFByME81R0J4UmJlTWNDQnI5MCtDWXdlS3VraW9xR2dRcHNhKzVvbWhpT2ts?=
 =?utf-8?B?V3JoeXFEWVFRdi9VWDVmVDRLcnV0VnJiYXJYbG80dG82SGZ5WHlJMXN0RzJO?=
 =?utf-8?B?Y2trdFdvbEJ2YlhqNS9uUzhCS2s4ZytjUVZhWU12amlwNUg3SWdXVXg3ZmZ4?=
 =?utf-8?B?cXBNMEc0cFZUQXZkR0JhdW5qUlJ1UGpUNHRsQTdIN3VsdW1xTWd6dWZFZHB4?=
 =?utf-8?B?RldvV3A0L0wwLy8yUDBiOU52aEtkUzJ1cDFvd0JGTGgveEZvS3hCaTNrU1c0?=
 =?utf-8?B?RWJwTWtJcS9JaWNIRkhtZmdiYXFPL0xLczN1blNhT1E4Vmk3QTRUcllqQUU1?=
 =?utf-8?B?QnFWTWJaWHZKNjBtd1UzQ3N4MzZrUXBlQnRPWGdIOEw5WkRIemVKd1krOVFq?=
 =?utf-8?B?bisvSWwvL004bDVJTW9oeEhIODZ4VGtkUjdRbU4reGEyWUFRZjlvT3NQWUgx?=
 =?utf-8?B?VXp6enF0Z3NhMjFnV2VTdkc1OWxlTTdZL1B0VUZYY0tHckM4T0NHdnRyNk53?=
 =?utf-8?B?dDcwd2V2T1M2Y3BqSXE3bVpXTll0aWRiTEJMb1J3MDRtM05Cd24yREpiV2pn?=
 =?utf-8?B?alBWWTVzRjRWcUJ4NmZLRm5BZk0zd0I1cDJ1b1dZWm1zZEpoblNGdkZld0R1?=
 =?utf-8?B?MWlGRk9OQ2R5ZFJ6NmNtWDB1ZXJKdERtc1Q2UlJEK1B6YldmYnlIOEkrR002?=
 =?utf-8?Q?46YXofmMSoV2CpMldOodmF3BSZS3ppaqzHyz73bH25Epp?=
X-MS-Exchange-AntiSpam-MessageData-1: eRMWBk6lzpvphA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29428bc2-35a0-4c62-00de-08deee09391e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:07:31.5935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfvHeAClOB3obUJ4wJ/rV+aTo7eQEiMZ5/dvnF92neqPGk940PPyqU053FOU4Eb87nAaC0sDEqJXhK3w3+OmRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> ASUS TF701T has an additional thermal sensor for more accurate readings.
> Add thermal zones for this sensor.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index a27d3c4f2c63c..83f8dd84d28a2 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -4,6 +4,7 @@
> =20
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/thermal/thermal.h>
> =20
>  #include "tegra114.dtsi"
> =20
> @@ -2682,4 +2683,86 @@ vdd_1v8_touch: regulator-touch-vio {
>  		enable-active-high;
>  		vin-supply =3D <&vdd_3v3_sys>;
>  	};
> +
> +	thermal-zones {
> +		/*
> +		 * NCT72 has two sensors:
> +		 *
> +		 *	0: internal that monitors ambient/skin temperature
> +		 *	1: external that is connected to the CPU's diode
> +		 *
> +		 * Ideally we should use userspace thermal governor,
> +		 * but it's a much more complex solution. The "skin"
> +		 * zone exists as a simpler solution which prevents
> +		 * Transformer from getting too hot from a user's
> +		 * tactile perspective. The CPU zone is intended to
> +		 * protect silicon from damage.
> +		 */
> +
> +		nct72-skin-thermal {
> +			polling-delay-passive =3D <1000>; /* milliseconds */
> +			polling-delay =3D <5000>; /* milliseconds */
> +
> +			thermal-sensors =3D <&temp_sensor 0>;
> +
> +			trips {
> +				skin_alert_trip: skin-alert {
> +					/* throttle at 57C until temperature drops to 56.5C */
> +					temperature =3D <57000>;
> +					hysteresis =3D <500>;
> +					type =3D "passive";
> +				};
> +
> +				skin-crit {
> +					/* shut down at 65C */
> +					temperature =3D <65000>;
> +					hysteresis =3D <2000>;
> +					type =3D "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map-skin {
> +					trip =3D <&skin_alert_trip>;
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		nct72-cpu-thermal {
> +			polling-delay-passive =3D <1000>; /* milliseconds */
> +			polling-delay =3D <5000>; /* milliseconds */
> +
> +			thermal-sensors =3D <&temp_sensor 1>;
> +
> +			trips {
> +				cpu_alert_trip: cpu-alert {
> +					/* throttle at 75C until temperature drops to 74.5C */
> +					temperature =3D <75000>;
> +					hysteresis =3D <500>;
> +					type =3D "passive";
> +				};
> +
> +				cpu-crit {
> +					/* shut down at 105C */
> +					temperature =3D <105000>;
> +					hysteresis =3D <2000>;
> +					type =3D "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map-cpu {
> +					trip =3D <&cpu_alert_trip>;
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
>  };
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



