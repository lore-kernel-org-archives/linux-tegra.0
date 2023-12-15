Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2101.outbound.protection.outlook.com [40.107.113.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68245697;
	Fri, 15 Dec 2023 04:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ljEw1aCu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMKd4Grsq1VdZCl+iT9hdm0ICLs/c0Y2gt3xJAP2c0OoQaie/FFWCP2VHNXEiFPHcQGPKnGg+u306j02xqcdvwlgtF8/FzkEGnCqPgRZ/2j4fofbJ2kUHXMOroJx1Qfh5t9uuoQfrbnsHGYWInWec3yDNvDM1O8AIEtFh1oGYpG5lsLPx2CEpJcZ/eljp721b4pD+2bWc0UClDpZyX2ZdSou/j4mp8jTpmJDTHCUYqeJRuvleAaUYD/cLx8v9B8UGOIqH0Vyl4mFpWiUfqO3FbAgmUrHA65f/ycJXf9dcKZHT/UJI6KkirA/3JXFuqFED27TJ5xeeCO1oGbP0OjbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIZkpDjfLNqOj7NX3e6S1TOAMiHcDCwzRAnT+pqayrw=;
 b=ER+f5gMvnYj3X7Uuu6y0m0gmgNaBGhcRhEPKLy7YODj1CpLQy1ZY1yQD/VnVKlzS1bI73skApsnOppc2g0Jfc9QMj/mWFaD1FqbSbaJHiLRRSexNi/RlVYTIVUv/K0g0Jups+RcMDhGHSCb2QifjfbmaInzBnJAmv2m59K+H7aVnfg8bkOkOS0NlbQX1UkF6Yx64NeGhKNWbBKJDkiX0aMcutg+bGn9zpG6NWmhMI3FeMSZurB3v9p2ewCXNC39kHGtSPdxtgqHKdboaLA/Da2Fa+qfOdtfaa+iwdYgxTE+Z5OWThP3Z+qdsCF4U4hr9h+uL6tieeiWpF6lJbR3P2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIZkpDjfLNqOj7NX3e6S1TOAMiHcDCwzRAnT+pqayrw=;
 b=ljEw1aCuXOLYq1qTLTGEHcIA3b1rqb+V07WDu8sj1Ez28dZePpDagCuU89T7F5bD8bUguv4MrQiA8lUoYtTeTMOw6UW0IzgMEs5Xee6psmzEXje1ViWf+vrNfZVqEAgLCge1ZcyoXNDzfeWKaA+920QSmz8sIA+pZCbXdTkvvds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10663.jpnprd01.prod.outlook.com
 (2603:1096:400:2a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Fri, 15 Dec
 2023 04:59:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::5732:673b:846c:ed92%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 04:59:13 +0000
Message-ID: <871qbof4da.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: simple-card-utils: Drop GPIO include
In-Reply-To: <20231214-gpio-descriptors-sound-misc-v1-3-e3004176bd8b@linaro.org>
References: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
	<20231214-gpio-descriptors-sound-misc-v1-3-e3004176bd8b@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 15 Dec 2023 04:59:13 +0000
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10663:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa30d2a-72a5-4444-9775-08dbfd2a9540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ApLBCMgBM1k4+VTNu0plLVmzYrjK0+fIEVG7R0b4heMVyiTBGtkb9WlU8T5QJ8j2re5znrcJmIJiCqk7haTNyP93AJCZLH72to9ZVqDx0KkDu6FgvKzeqDPjzeN1z+S3SUtEwIuKHi4dHTS+X0EaPtd9Z3TYUCK3r4uRlvOVcr88a3683akE0Ii8dtJOcvxKhwECLOqi1lIhMDHG/YXdmkCvZ+cTeDmVuUUt3rR1T8D2FEi8dTc8rAamJsvSiMl/0bzZ3Bwq3xIUxgGWi/vHUw8LC1LuaGV27Tz5LIRzDvFGYc+Q3ztjjxQ+l6GyxUwSWonIoePKosAqLgyBDUP7JiVmlPF8A/W0/5ZKbT2b8k8qWKnRJYbHhiJ2CcYahyHKtI8J9gizSJ8GhC7w7llmbi2PDpeEYT/asRMaf6ymP1dYsDSx6T8ODVuhRVjmbXHp8Kc3NvF6Zf1MWlDKnD1Vby+JrcjfhxfJb9JKlfAepLWrmJ1yMLrh3wubsiAh25qa8Aj9EnlT0/dpd59tLPrI9Tvk9Ot3bPSHWcWLMt0x/ZlaBJ3SFamo3EeOTq8M0WknOfdXb595QHZiSt+FpcRDCzn/OwwzA0/UMqdC7hEh1OoMep6dvfzY+NPOMM9V6ag
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(2616005)(6506007)(52116002)(6512007)(5660300002)(7416002)(4326008)(41300700001)(2906002)(4744005)(478600001)(6486002)(8676002)(8936002)(66946007)(316002)(6916009)(54906003)(66476007)(66556008)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i65cAHYfC+2ewBR877cQ/Al8O6C6AxmbHmxtyYoop7F44jtcokQnNMAoN/OA?=
 =?us-ascii?Q?KjZZq2N67ioWWEYKW4VVJSmr01wk4IaLw6wCRORZY5S+KFOdk72TVzerzsG/?=
 =?us-ascii?Q?wptWXDhgNVe/afywtFc6tLA0cGrtUVtbaA6kniVFx3M+LC04OhXOvdNvPBH7?=
 =?us-ascii?Q?1nZvMPL2t9NpSnLbDQS+vEFiau45MvBEyV+ju+aWpdCJgoQO9/EhbvLwCDYy?=
 =?us-ascii?Q?HjSXoei5g51UHtdGZI1Bq9G/tgbQs7hGMgpwE6+ERrPdMNAbAp1C3wVs5mKW?=
 =?us-ascii?Q?YVNnG6Vj7CYEcPGtl0q2E64UY07EUL1iTyHfIWqp37diATBXaEC2hzKHh1tC?=
 =?us-ascii?Q?WTSY9utvZAAVlFjeh5hW6TbFTOpFqTtGA3VTVlcobkV54Ry6aVMWKMS/v6kf?=
 =?us-ascii?Q?VKIM7qXZdnx9QwCfcWYUS0DZjBxFSHxO2JcRdL5/a0mjzIXeVT29LIYSrIGy?=
 =?us-ascii?Q?hJgfd+Y9DQC6D7qLElnYhq8IkScfdrpgbkCfREhD8/yID0Elo+eLFmwKAna3?=
 =?us-ascii?Q?gvhR6DOhRwhEiyi4S5HbIZiLS6+c9nJIY+CnKiWjQ6ByF/NXRMYljHGjZp7I?=
 =?us-ascii?Q?FRvGjthVPXnNZACmcH16CeOuOfijyCdgn2Qu1DTfb0SGVewdhMRLRrFIc05E?=
 =?us-ascii?Q?3HyqHi9/PECEX2PlzPq09v9/lxt07BoZrlZFxO7ETFsAydHmyoyD4B8mVX/y?=
 =?us-ascii?Q?Ma54NLbfwCi29eO25gGhkAj9xuYWOmLN5xUHRubd0ZWgoQ+Ik5QlWH9N571x?=
 =?us-ascii?Q?5AkrgZPoed0n50eK29EWA+FDF/BFdKFfA5XIHnqC+5tQJyQUwXbqxUhQN5fJ?=
 =?us-ascii?Q?+S4k6+B7+mT1wQVUtAgYEe2eMM3ZvVCgZonlzjE4Z/iDxV0YRc/aXYZlpsme?=
 =?us-ascii?Q?7Uho5JHGmny6i801E2SNBXPz3bc4ktSnEZO+ytXtP52guldcy7kizyXUpAg7?=
 =?us-ascii?Q?2NUnMUS3r6nn57dLXMdEalC2tqMSGuAzURC8ZRPfWPTB2x8YcEfxtA9l8Ut5?=
 =?us-ascii?Q?GB4srTnMR9EOuQ578RrTomGIM74vX0ClSwO5Xvp8+61U+jfVraMr+k3w70d0?=
 =?us-ascii?Q?rYTG3+t4xn46wnGCkSYN+bH0E7YI8fCIjrMsLXQ+IveXOdCWgRXaUE2rA7RJ?=
 =?us-ascii?Q?e+GOGJ1WH5fa1tciV3eziD9lXiVM9FmTaHQjf13YW7fem5ou+br43uJDw3GZ?=
 =?us-ascii?Q?PBMi4oHOJvxUMVuGkYPYrdHLQIna+CB/DGxIq2Za9lGjCvso6gbrNHdmqa6o?=
 =?us-ascii?Q?ibryN3CvLK30dE67DYStbFOgnKctmT1rYiT4mNaBNyru3xIV4g4qaqtawqMi?=
 =?us-ascii?Q?E1C86tpVOJQTTffOQRKilBlzeVXkF4Fm18ORjeItEaHpSDlmSAreFB7GwGVG?=
 =?us-ascii?Q?wSBD0c7yJY5pGNAzDHUasOwCYlAKZBc04NItY/Km0GcnUIxmffgdGIzM9rdh?=
 =?us-ascii?Q?EZpAsDqTRel05bbkPdeClyyxfDFlcydLAbbI3QA9bTRG1GFXXBa1Qnx/JApB?=
 =?us-ascii?Q?Ck7oCyOGYP0u5UIqQmUIjh43OYsgMKejNW1YK1yve+4Ai7ayP4FUJ4dp6mB+?=
 =?us-ascii?Q?h7ns5U7abgnobUXhPdY+f6veRgYkSrEtP4U0AxEzdyRr20yQhUHQoEf+BiBr?=
 =?us-ascii?Q?PgpLCvIEIzIOm1p6PEP8n5c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa30d2a-72a5-4444-9775-08dbfd2a9540
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 04:59:13.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9e/KOtkydkIQDl2Jg6KRwlLhrCBAM+py0BlqVpzls5s7KAewyhCyrVk6frrbV/kPIPhf2gBjwRhAUeJVWz4OyKW+YVKrxQ46HEvID4Em75GUyVlrRmB4RVsUP1m3FSLC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10663


Hi

> The generic card utilities are including the legacy GPIO header
> <linux/gpio.h> but not using any symbols from it. Drop the
> include from all files.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
