Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8FBC433F5
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Mar 2022 02:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbiCSCbU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Mar 2022 22:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbiCSCbU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Mar 2022 22:31:20 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C772BB7CB;
        Fri, 18 Mar 2022 19:29:58 -0700 (PDT)
Received: from kwepemi100012.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KL4Yk6cxnzfYmv;
        Sat, 19 Mar 2022 10:28:26 +0800 (CST)
Received: from kwepemm600016.china.huawei.com (7.193.23.20) by
 kwepemi100012.china.huawei.com (7.221.188.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 10:29:56 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm600016.china.huawei.com (7.193.23.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 19 Mar 2022 10:29:56 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2308.021;
 Sat, 19 Mar 2022 10:29:56 +0800
From:   zhangqilong <zhangqilong3@huawei.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSB1c2I6IHhoY2k6IHRlZ3JhOkZpeCBQTSB1?=
 =?gb2312?B?c2FnZSByZWZlcmVuY2UgbGVhayBvZiB0ZWdyYV94dXNiX3VucG93ZXJnYXRl?=
 =?gb2312?Q?=5Fpartitions?=
Thread-Topic: [PATCH -next] usb: xhci: tegra:Fix PM usage reference leak of
 tegra_xusb_unpowergate_partitions
Thread-Index: AQHYOsJR0FkcLz93T06vOMu+/fLlsKzF/BVg
Date:   Sat, 19 Mar 2022 02:29:56 +0000
Message-ID: <f596821a2025456a872c3d0d29ed6f68@huawei.com>
References: <20220315025614.2599576-1-zhangqilong3@huawei.com>
 <YjRzitp5BJmBpV18@kroah.com>
In-Reply-To: <YjRzitp5BJmBpV18@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

DQoNCj4gLS0tLS3Tyrz+1K28/i0tLS0tDQo+ILeivP7IyzogR3JlZyBLSCBbbWFpbHRvOmdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiC3osvNyrG85DogMjAyMsTqM9TCMTjI1SAxOTo1Nw0K
PiDK1bz+yMs6IHpoYW5ncWlsb25nIDx6aGFuZ3FpbG9uZzNAaHVhd2VpLmNvbT4NCj4gs63LzTog
bWF0aGlhcy5ueW1hbkBpbnRlbC5jb207IHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbTsNCj4gam9u
YXRoYW5oQG52aWRpYS5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LXRl
Z3JhQHZnZXIua2VybmVsLm9yZw0KPiDW98ziOiBSZTogW1BBVENIIC1uZXh0XSB1c2I6IHhoY2k6
IHRlZ3JhOkZpeCBQTSB1c2FnZSByZWZlcmVuY2UgbGVhayBvZg0KPiB0ZWdyYV94dXNiX3VucG93
ZXJnYXRlX3BhcnRpdGlvbnMNCj4gDQo+IE9uIFR1ZSwgTWFyIDE1LCAyMDIyIGF0IDEwOjU2OjE0
QU0gKzA4MDAsIHpoYW5ncWlsb25nIHdyb3RlOg0KPiA+IHBtX3J1bnRpbWVfZ2V0X3N5bmMgd2ls
bCBpbmNyZW1lbnQgcG0gdXNhZ2UgY291bnRlciBldmVuIGl0IGZhaWxlZC4NCj4gPiBGb3JnZXR0
aW5nIHRvIHB1dHRpbmcgb3BlcmF0aW9uIHdpbGwgcmVzdWx0IGluIHJlZmVyZW5jZSBsZWFrIGhl
cmUuIFdlDQo+ID4gZml4IGl0IGJ5IHJlcGxhY2luZyBpdCB3aXRoIHBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQgdG8ga2VlcCB1c2FnZQ0KPiA+IGNvdW50ZXIgYmFsYW5jZWQuDQo+ID4NCj4gPiBG
aXhlczoxYTc0MjZkMjVmYTMgKCJ1c2I6IHhoY2k6IHRlZ3JhOiBVbmxpbmsgcG93ZXIgZG9tYWlu
IGRldmljZXMiKQ0KPiANCj4gSSBkbyBub3Qgc2VlIHRoaXMgY29tbWl0IGlkIGluIGFueSB0cmVl
IEkga25vdyBvZi4gIEFyZSB5b3Ugc3VyZSBpdCBpcyBjb3JyZWN0Pw0KSSBwYXN0ZSB0aGUgd3Jv
bmcgY29tbWl0IGlkLCBJdCBpcyA0MWE3NDI2ZDI1ZmEzDQoNClRoYW5rcw0KDQpaaGFuZw0KPiAN
Cj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCg==
