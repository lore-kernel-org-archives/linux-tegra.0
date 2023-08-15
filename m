Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAC9C04A6A
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Aug 2023 13:39:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237442AbjHONiy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Aug 2023 09:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237447AbjHONij (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Aug 2023 09:38:39 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AB7173D;
        Tue, 15 Aug 2023 06:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqkKPZdVIg1xncYlBPShjd02xOAkw1o7VqHDfiV3tu1/o1DahGEFGUF5rq4A6+RgAtEAZ5JanpikSmglFchYKrErkGXvzI7TaG7Dye+gufmr4p4pzLILhI8MP+1ZdYGRNf8zfdc9GuEw+4deB8Uyhncb+zr5rMPyOTRi48UIvMnwMv2VDixmLvoi+8LffKy4FSDuARYmLzufrCMXCmf3uXNDXDBxbusq8ksgzj+A3vg6g/Yd+zW+8+NBI05fJst4u1qUFpAYzggisRy4PyEQ47MyukkTZa9ZKqfeUTN0X8T36l10jCtYjR1x0NBLWATkE0VHGnIGNGHIWiVvX/npOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXWtVKVyei6mM31rowI8vb74euuOOHMXYA1rwCuD9Dk=;
 b=b3TwgXmLYk8cfTUva0L8zuQ1xBUB3xMsdwpYyCBrJIkOSntvRGd9/WyPXi2BDUlcS7cia3xLUhy0+Qt/DqJFM263w3JpdaE3sGhSmxtWF1xT79U41qnWHJu6bUNPEkKCQANvtgrHL1wQqCCysJdu7to4vQksorzYOpkC7gnRqo11v9SDa63fxxNMxkHbrtMF63877KYeqUYjWp5wazPICIeUUcFwf6LprwxlwS7rX37Pfy3dzRfG7Ura/3ZTIq7wz6OKloV4t32wzE3NYUlteh27p/0byrDgdzyX/4Ht1ftNy6ttVk4KhA1JcgiUPPEK0KKbNQzE4qIYXIg480kSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXWtVKVyei6mM31rowI8vb74euuOOHMXYA1rwCuD9Dk=;
 b=bMmEiYGuATZqrIc6BIeZB97oNPLLf0YZVU7JQG/u7YmF1kpvXYjj/KOdSKcBa0X2fnzF+SKJoPGVEKYZ8yK10waqBL8nmhu9xIORw+QAIy/T2fKpPMVL2eSXb5rHtAQsUC/8DLgK8gjYKd4Wy+mhVFJI3nmmSLyENjQENKtcCMTUEvku5YPj+1htzjig4xKubXI/jbX8jg0G2jDgqCNlSSEM1UCZ2ERxIfQYtoczLEbha8aQ7E06ujKeauayu1bV+0cfPJCSUowypURJDZjHhNgqnP5kVFLKnJ9+ID/N9Plj0KQkG8zdM+rgOwmRXJ6idkBMp1mqPUtgebwxcabbng==
Received: from CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17)
 by PH7PR12MB6540.namprd12.prod.outlook.com (2603:10b6:510:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 13:38:35 +0000
Received: from CH2PR12MB4278.namprd12.prod.outlook.com
 ([fe80::2742:341d:5f8:493e]) by CH2PR12MB4278.namprd12.prod.outlook.com
 ([fe80::2742:341d:5f8:493e%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 13:38:35 +0000
From:   Brad Griffis <bgriffis@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: RE: [PATCH 2/2] arm64: tegra: fix p3767 QSPI speed
Thread-Topic: [PATCH 2/2] arm64: tegra: fix p3767 QSPI speed
Thread-Index: AQHZqFlo4vPVMY+kFE62xmlJXVHk8q/D58AAgCfBP5A=
Date:   Tue, 15 Aug 2023 13:38:35 +0000
Message-ID: <CH2PR12MB427838F14EA7C962C97C4B9CAC14A@CH2PR12MB4278.namprd12.prod.outlook.com>
References: <20230626180920.318774-1-bgriffis@nvidia.com>
 <20230626180920.318774-2-bgriffis@nvidia.com> <ZLok_Lg6B_ggDzR9@orome>
In-Reply-To: <ZLok_Lg6B_ggDzR9@orome>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4278:EE_|PH7PR12MB6540:EE_
x-ms-office365-filtering-correlation-id: 453445ac-45bb-448f-e81a-08db9d94ecdd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JYS6sPP7xAnGCKzqY+FfbU2P6ezK1ofQg177quQA7toXMF9quAaiCiNyINjXbK0Yi+IGj8SEQELJum3scmd78yfitvsAYahVqSReU9xb0jheS2Kkx78gRCXJyiUmPMIKykM7s5DcpocRIEOEOt/c6E1OgPGLj3KpLNaWXVoJBhlY2MNSd+ahiw16xQ2QTkpQEZAZpFppVMY9W0fxXyBcrbKKTRuXo+rmjkW80MbCWoSFpLF2fh1OJG/5ZZD5Y6BS7HFIihs5BEfWezrUvIUtUoy2oPiRQBcDQOBeJTS3sh/McVdIxWC6eSLnstiJV+k9p1xm2LaoEY2hSRIcvsIsE/ZqPyN1c+zfErwjbSeE1RghvtVRpS+xpJSa+0xzNd4fxI+oVEUIfO3AgFsRATXEf6qDMUTTEH0piTk08X8CEhBtlxE7v9iPBNSRNis88fiKNO23+KFByedGMaqbPMHBs70bgvQtgPbXexGLJfxnLv2gkH9rS1ZymXeockOdaUcu4nc/2LlnYmORfDSacugf2KNFhxrrTa0Ger3CKKh6PpEuX3JhdO0DnBTrogOogKgpFkUN9S1gt2Gf3hU57Xu7faUYaq55n14O4fz6e3iFUXkndNopl9z3QtFkLkpo4Acv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4278.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(366004)(136003)(396003)(186009)(1800799009)(451199024)(7696005)(71200400001)(9686003)(54906003)(478600001)(55016003)(53546011)(26005)(6506007)(2906002)(4744005)(4326008)(316002)(6916009)(64756008)(76116006)(66446008)(66556008)(66946007)(66476007)(41300700001)(5660300002)(52536014)(8676002)(8936002)(86362001)(33656002)(83380400001)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KUge7Ma3F50nnjg0/Oo7W8mebo5ISFyvj4+Ph4ENRX9R30kAn1XlxSH7Cvcd?=
 =?us-ascii?Q?9LJpshLWG8Oal986yDwyi6xio8HcKhE9QdKw7WETxCgYtFXnHhEQUeQMA5Ll?=
 =?us-ascii?Q?SHvbaz6FRfW6ygdt6nJ7d3nDtYbcvZ8oppqnfyV+YNpIaGzMB42z9maRc8/K?=
 =?us-ascii?Q?IZ2kuQ00bfwf53DTymriNxw8R+MNNYnu0ETd1MuYgCcMSDt45w1e10kgN6E/?=
 =?us-ascii?Q?JWpBkcR8rZeo4cv27MenwSn0FxLJ0aO5MOAIM2HBCCUHETmrnT/WSo13LkTJ?=
 =?us-ascii?Q?HNbj1GU3nrwbk4ITYInIoTiyQNE+g4Xf0Q6WOq2q/wCSFIeCU0B8Kiyl+Ns6?=
 =?us-ascii?Q?C+kVvTAfrCfoEML1wmzExDMVZ3gQIatnsNI4fsDl+jVX93I5us3lI8bFJ9Nw?=
 =?us-ascii?Q?DwPf1MlkiuSp1Kc4zFRC2/nav0hF7T3ncVPrgxb7lczWncFQuQi9d7qD6TeK?=
 =?us-ascii?Q?XQNmxtW15CjqBVamGj3QQ8aWvlNLRq6rOQay10ZrpFUXKhJYyJxCoE0DXR8k?=
 =?us-ascii?Q?T4XOM8jaJzmCTI7IUKdkt2Zl/2nr9jVLE0jKs8ZxWBCnNpmbS64HCkrZ7MRY?=
 =?us-ascii?Q?Qn+zoiqIqv169EjVewooMNYDbqpVIqYxbw4KJpF78Cw/w45od4LvUuj7Vmor?=
 =?us-ascii?Q?WORxjfo24ftU98rgJne25hEDEEShIAgBBi6UtDLshH2rFyT50uL5h6VkFNIx?=
 =?us-ascii?Q?ZHMhAawFTh8cfaJvOtWejUaKaf4x+chxdACF3XsyR8T+AhWzrAWLxFRa1Xtf?=
 =?us-ascii?Q?sgXWujJaXJwJO2CKFFpi/yR1Fe0r12oN8WDwX8d1xxpTx6/P2KGTr0KQR2qC?=
 =?us-ascii?Q?j67GZ7icnTOjJNjMMyImJqb3Tq3JIUK8Rw4vEDTfFXYvTd5vM7orOiB99/ZQ?=
 =?us-ascii?Q?oxlgWoEQKB/XiyzslnDNWRHmTCF5qfqf/9IA1n95S69ILWdCy9EIf6VJEfSK?=
 =?us-ascii?Q?gS8AGQ783j5dSc/bxoM7zx0ZJiR+ifXZY/5Uznyzv0N5jw4mjogqDoGeiv0c?=
 =?us-ascii?Q?YxNFZHjNs+HFRn9bvGTOTTZavhbYJkayy2X29W5TlyoKQ+T5RF9LGlJovSbc?=
 =?us-ascii?Q?huXTySPhG/lGfuY/GXbLrLs4CIqQg+4D09O0W2dpIz5deNt/yADd3pGwPnVr?=
 =?us-ascii?Q?OgpVHZBr++ZuODstmuheDlJOxhBrbQI6mDPvQ9eqrQIAQspC5hw2MIDy/+oP?=
 =?us-ascii?Q?Hrtx5CtMndssBOathrbVcsLyxEJ0jkyBIClqpfX7+RJBWjbLBz3ufc+0r4k7?=
 =?us-ascii?Q?GgE30p+F4c8TR69znDofiSBXYYEHIaQKQ12bQnXpfM7twhFdN0sqcxCGP1LE?=
 =?us-ascii?Q?MdlKKKxSLP1miv1Z4VmZpkyZ4UvLpp6a8g4TTvvk+JDcgoEMqUxPJ1UoCzBC?=
 =?us-ascii?Q?c0Mu7huEOQcqJjB7VjiJmN620EuRZwC1QqJkwoNXaIpwS3uk13mXBVYT4IOA?=
 =?us-ascii?Q?ghmlo0LfHkJ0pr/u1rZRvTmuxCmG9qvjgVU+G166dTZGkVIcDh4ohWKLCyEC?=
 =?us-ascii?Q?h2lIsJftfRLWjmFRerxqptlK9YCibqzFJXEXyG9rh39DQw8tYM6xp8+FPhY8?=
 =?us-ascii?Q?BEgHkCeu9w70vZjCHlMBy+f3vowsOD76f5doEKTk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4278.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453445ac-45bb-448f-e81a-08db9d94ecdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 13:38:35.7151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWmJ5JBGodg/DFeG9fONcBEPP3+X18yca0pMPgoKwdE2WyoUnFtr80yZ1hmN+e/vuc4cMjkvJK/sBOk+dzykhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6540
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 21, 2023 at 6:26 AM +0000, Thierry Reding wrote:
> On Mon, Jun 26, 2023 at 06:09:20PM +0000, Brad Griffis wrote:
> > The QSPI device used in Jetson Orin NX and Nano modules (p3767) is the
> > same as Jetson AGX Orin (p3701) and should have a max speed of
> > 102 MHz.
> >
> > Fixes: 13b0aca303e9 ("arm64: tegra: Support Jetson Orin NX")
> > Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> > ---
> >  arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> This was originally copied from the downstream DTB and I see 136 MHz for
> both P3701 and P3767 there. So now I wonder which one is correct. Should
> perhaps the P3701 be updated to 136 MHz instead if that's what is being u=
sed
> downstream?

Downstream we have changed both p3701 and p3767 to use 102 MHz.  That is
the max speed for Quad I/O DTR reads.=20
