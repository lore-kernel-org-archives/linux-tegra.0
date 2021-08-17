Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EAFC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 05:05:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF0F860EB5
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 05:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbhHQFGW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 01:06:22 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:41346 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230272AbhHQFGV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 01:06:21 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17GKhwpU029012;
        Mon, 16 Aug 2021 22:05:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=MtFeXoHPRVo3zIHQIa/jFoPHlqpLvvowa2mwvL+fHU4=;
 b=Y25OOy/vtQKZhjehEWYoXKiEWNHBtpMB/YgvWJgyzIgOJ0+NtQrqYMPxrn8qrm7BeZO/
 7jwcwNeoetaRxQEI9Weuzznr+3lyKMGOKMqPaTOaBYW9haauTnD0DsnKfFRqDHnRlkHq
 AmJcchDLs5LRg/e0sltEFKKdlLyH3jliGi5Fff+RUFNn+3tFRIrNyZT18OjmLx/a+bD5
 vURh//oJT4JfS18cqVnJ5xaBPi+sIF94nSf97kLdZfbdnXMXC6j5gPVeB50i9JTyIvbO
 9Yc0sIc+7wEEfyU3lC2UuwXucE4h2RBoSTJoQf/1OPCqB/hURIwtbBsBl+xstgWF4QBu 2Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
        by mx0a-0014ca01.pphosted.com with ESMTP id 3afyahs26v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Aug 2021 22:05:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxgK5hbyRvElSPNy8ffnMVAN68jX6W1a99C9aoFPx9FyoD+jz/wiJfQCaQUtPld0vpA0NLlAR8kSGgrdh8Tc+K2XS5BDXkpN6JG5gQ4IVWcHGHquUBZ9rlz4roipW/cRzp3819GrgvZN1WsAMODoh6OMNTaJbnWX7K08RxLE1WDDuYI+4e+rZUOOcojt18KnOo3voxcaaTpRRcm8inF3qF3dO4A7BQR+ow+9D6ktngyQlIA5E6G7GENGHNuwVAwjAakxvX7D0UQWjF3YE+cw2fWY8v8XVo+OBZrcWp3TpGNZP5Nc751jDhmnz3k8Cn2M+SiOGw5jHSgUokWxGdrwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtFeXoHPRVo3zIHQIa/jFoPHlqpLvvowa2mwvL+fHU4=;
 b=k8xfVVynycrD4xsnlh8HlQvwebezUfMEHeotxtIcaWnSwv1OphqyCxDho2d0E8gz5dwGsnt7I06rP6b9cKXgEJaQaAtcJSFTeGNm9wEBNpnwMZ/tNztwTpBtlA955hljYnS6fw2W09wkNesTeDsWRXeLI73WVE3aTkS7boSAmhCbk/GYzi0U+RxnxH+Ixnf6kIQgTDfFtbId0s6bfFsR3V1SxDB88019JugjB7Lwf84lzh8Ct08OGuDw0UDn2qowC525AKp2xK4W9ldM4f+VHg1/G3MFscJb46oyTPTsJmv1DrFYSIoJIGRpryZ9AgTbQGupgMMDkpEY0PcK1ip54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtFeXoHPRVo3zIHQIa/jFoPHlqpLvvowa2mwvL+fHU4=;
 b=m5cDEmIK3Ni2/YgMJ8usAF4bnUn74MK3FJJbvA5Clil71q3HmXFKvk2IKJeO3XsaIWEUdE9slHIHpBow9H0+kWJfwu5pM2ns3hr85gfmjxpvJUw1rMVvIpN3OLLMlGcw5kKKueVKxOgsqF+/qSB4smehrnQYAKWJYNW/Ig2WhVQ=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BYAPR07MB4662.namprd07.prod.outlook.com (2603:10b6:a02:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 05:05:26 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::9c3b:e79f:87da:34ee]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::9c3b:e79f:87da:34ee%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 05:05:26 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Cooper <alcooperx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Subject: RE: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Thread-Topic: [PATCH 3/6] usb: cdnsp: fix the wrong mult value for HS isoc or
 intr
Thread-Index: AQHXjyrfpZtBA2WHu0CYToBU7vJUratvbn+AgAe9KXA=
Date:   Tue, 17 Aug 2021 05:05:26 +0000
Message-ID: <BYAPR07MB53815317736C694887D51BE8DDFE9@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <1628739182-30089-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628739182-30089-3-git-send-email-chunfeng.yun@mediatek.com>
 <87mtpnyx3g.fsf@kernel.org>
In-Reply-To: <87mtpnyx3g.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYjk1NjQzNTUtZmYxOC0xMWViLTg3OTYtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XGI5NTY0MzU3LWZmMTgtMTFlYi04Nzk2LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iMTMzMiIgdD0iMTMyNzM2NTAzMjI4ODI0OTEwIiBoPSJuSFk2UmhwdGhoTjZpTG8vemFqNlo5Q0tMaVk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=cadence.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 611e0ef9-b99c-4988-5459-08d9613ca028
x-ms-traffictypediagnostic: BYAPR07MB4662:
x-microsoft-antispam-prvs: <BYAPR07MB46622B02E5289956C05488BDDDFE9@BYAPR07MB4662.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iXXrKdUcIZDDN+Z58ygogWqH481SueCbqgtpgiJ1Cx8xyMht9FVF3XbxdiQaoZkO40L/xJcy/ewKJz2Byup62jM0pgNttv7RLrCDF53KVsHGs6k8D4lKV0W1QAAlTl3WRcUMTZYvripW0gvqy7RHWdVzaR5S6HBzJuNaqEma+li3v4QPPYYeEB0z+L6WoS4v1LuyE4PdDMACF44AIeocAxku/fCcPjQhWwVgtp5B5/5gq5tTE55SiU4jJKfuRbcDxVO8ymq4VF0Y+LRECeWxLK2wlelKTQnh1NgZf5qRNmg5zX+EAl0zAhqKKifCO0sblRXXEM7a0sj1AgMOl6jFZYMl6wDfODNJgjO8o60YykLq7JwvcUycT/iSB/SlG7/hGww9ZP7EBRdkhEp3939s9y0ZKCskcC4Wl9l9fexKg3FaFe7M2YQnZX9CbJBOU3v1FHJXhC4xZq7q/FTqSBJK78AAHgXpBm0aE098iUN8PFimwytQu6WvPge56qd03YYI/TBLr8Q0DAJ+qmKvD0/NzvZCF/78/O38G3y4nSMs9VBFYJI7khUkLxUOI7AAbFi1bZqRNK5yq7S/DgJGlk1clVFsunCUu79540dLhobtPUq8dumT7Gi50r/D4jrc4dRh5Y5Rd+fGWjRplAjr48BCBspWg/2gbfFgAas95KjLIRW75gZ6npdx19/eykJcPR+w9oxssTTEJeiyJ/8mtgV6grS3vp3Y7HSQISFszb64Hkk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(36092001)(478600001)(8936002)(7696005)(7416002)(33656002)(8676002)(122000001)(4326008)(38070700005)(71200400001)(38100700002)(83380400001)(26005)(5660300002)(110136005)(52536014)(54906003)(316002)(55016002)(6506007)(186003)(66446008)(2906002)(76116006)(9686003)(66476007)(66946007)(86362001)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R2oxc52uZghqRo8ltVqCIHqBjmO1fkBXI/M76SgWUBImqB+4eAsgR1w+zQK9?=
 =?us-ascii?Q?6BMQzEbakIJgGNyeOwmn/GotLIGQQBA4dJMg7R0SF9/dIBSPhbiy75y2CNry?=
 =?us-ascii?Q?VfH9CO9jWXCOWZlgAWA+XO9/BvMT5715sgq9rl0rjAjVQl44qDygM0uqjZLW?=
 =?us-ascii?Q?Bk7pAzZumSenHm8/jFtibA7u32SK5Z4QK76wulFoGa5OpdhKd47kEdN8Kf0+?=
 =?us-ascii?Q?U/ILi2N6PrCNH5PZYZSN0QNhD5+Kj6Cx6nkndGOlIm0kb0The/7/UjRlVPte?=
 =?us-ascii?Q?tHRDHo7J2in9I+R5yc5LRiScQSDf0KRjclY4YNrQ5PPOQQHFA+DDuY+TvTGN?=
 =?us-ascii?Q?uk3aln7uZUCGNeI2OcUga1Qj1BxqNMNrjSNgx+0i4PJB6xXu3WSKzbDcrvBI?=
 =?us-ascii?Q?PcGRw9IUCY4IgWFdSsGSo7NeAlyMZCQF3WkomI4W2oJkYAY/te7/VknZYnUG?=
 =?us-ascii?Q?DMjpb44X2iT+wCRNU/emnyBTbOHkISUAW864+XuoBzPfIaSpibCOQlng49/7?=
 =?us-ascii?Q?I+4toIF93kg/T5HsfjAO+Qq3Oq8VoY5cmoWETSB9b1JmQ5N3TbOfrtideoP9?=
 =?us-ascii?Q?sLbryEi7XUlrZqfdWyP3tZ4mx6Zcjo5EyPM7X3nWHOjqgpuqcXXN5P6N4e05?=
 =?us-ascii?Q?mTa9dma0x6gGxzyHzLKXUNfElYZq2h7K/iIYDK2wmA4lgBnVbyiAv6Eqbb9b?=
 =?us-ascii?Q?ntzUlhYfaZrPQX9rb6YHi1YbHHZE/GX5zOFPsxdTSufBPTctCXseXKuZZoDb?=
 =?us-ascii?Q?QlUYZwZ1FZQ2d2vVmeoWgNozpjlrtelhGdIbXFzdeQ4/HsLOzTDRzzfdi1lN?=
 =?us-ascii?Q?47nUjMqKRf08bb8ByGDgaBOi5qciafJn3FAAb+h+e61XuCLVvngc+Goq8HWk?=
 =?us-ascii?Q?xVFwC4s2f33Ux/HsTetkpFxeknYSU+uVE8/Xfxe0opPnwtxG4ee4sPNiaUsi?=
 =?us-ascii?Q?tY1Tu8imjJ/bdaSD6vp9d57bu21F3u8PpNPsAYLJIdDuICo0Sob9k9PpwkC1?=
 =?us-ascii?Q?s5ehM3fRmGGBOEYlQxByGsYoGt8nD9LJWLGpmqfYWWPbAQUuqH3PKKPC3Pvq?=
 =?us-ascii?Q?7O/34t24LrSY3vAEnhE5zjk16/XWElLLu4ElPXOc14cxi2/3oFoVKd2k4VXZ?=
 =?us-ascii?Q?4Wo5kCjbkNByYRvtG6HcOH7QayVg74Vibi8eMoXCzpGrdMFyMsP9GWCf8YN/?=
 =?us-ascii?Q?G2wvKHy8vGu6b7PNnx8Mt1D6ol4/zvy9LIfql1AOqN+/VpN0hVeuwM8B2+0W?=
 =?us-ascii?Q?YbICdaHXXGVdiHMUwLkwb/WWRgePkR+D2F6qGo4pO2K963sCA1b8GQwc9YWJ?=
 =?us-ascii?Q?kKXE+DZfru83Lu97bifZgB5a?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611e0ef9-b99c-4988-5459-08d9613ca028
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 05:05:26.1586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0ewYtzLpin7p+DxO4F+yv4BDVorPnsHXZzC1+88UdCRzDKQXaLbuxZhYkDBWKLwem3th44t/obuxIFVWf3wqOIkuR/wlWDaeMzVrlELmts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB4662
X-Proofpoint-ORIG-GUID: VBkvKkaK0pwR11ItLl7f9K5hQCmugEcl
X-Proofpoint-GUID: VBkvKkaK0pwR11ItLl7f9K5hQCmugEcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-17_01,2021-08-16_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 clxscore=1011
 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108170031
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

>
>Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
>
>> usb_endpoint_maxp() only returns the bit[10:0] of wMaxPacketSize
>> of endpoint descriptor, not include bit[12:11] anymore, so use
>> usb_endpoint_maxp_mult() instead.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>>  drivers/usb/cdns3/cdnsp-mem.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem=
.c
>> index a47948a1623f..ad9aee3f1e39 100644
>> --- a/drivers/usb/cdns3/cdnsp-mem.c
>> +++ b/drivers/usb/cdns3/cdnsp-mem.c
>> @@ -882,7 +882,7 @@ static u32 cdnsp_get_endpoint_max_burst(struct usb_g=
adget *g,
>>  	if (g->speed =3D=3D USB_SPEED_HIGH &&
>>  	    (usb_endpoint_xfer_isoc(pep->endpoint.desc) ||
>>  	     usb_endpoint_xfer_int(pep->endpoint.desc)))
>> -		return (usb_endpoint_maxp(pep->endpoint.desc) & 0x1800) >> 11;
>> +		return usb_endpoint_maxp_mult(pep->endpoint.desc) - 1;
>
>this looks like a bugfix. Do we need to Cc stable here?
>
>In any case:
>
>Acked-by: Felipe Balbi <balbi@kernel.org>
>

It's not a bugfix. The result is the same.

Acked-by: Pawel Laszczak <pawell@cadence.com>

--

Thanks=20
Pawel Laszczak
