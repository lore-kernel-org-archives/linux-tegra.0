Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267939734A;
	Sat,  3 Oct 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016504; cv=none; b=rcDPDwe5RzPqMN7JHo87IIY+04OnW+5ovm+gZqwEgCsu6TCTAxtYZjvaPu/75XWpgxE/BPfFPb66DcCBjlciBqbZgmNxHci3aNP9BvnTHjKFMjVQ6NDar0sQL4jsoC4wyQMEr2rEPeTxcnp5o22Do04/rwcbnVRfkRp4+YEj4jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016504; c=relaxed/simple;
	bh=jiND6+VyUYO2CZ2lWHVi2o8c/TWRKntONQdI4+2CpXk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=d9JBGt21NM0+KQschMk/AnGwsB4xcz0CpGmO8q1usDkjtwMlOfsnEZbG/GdB16WxWfshnQRxoDdLUbM2uKrZ5dMJUa/qWFOeCdBsSMAvljWtYtM6rYOI8Bxor7w/OqrEjKBHPwJehtsd793uWjLzoqlOZiFYH2OFQbzJthtrvxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RvyLmjr7; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RvyLmjr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=jiND6+VyUYO2CZ2lWHVi2o8c/TWRKntONQdI4+2CpXk=; b=R
	vyLmjr7asOnRkd+0Pk6etc5TX+OBVW0itpLDR99GEhu4/sSuW1FrJMsx7ZqXVDha
	R2KNd27y/+jOKZo2w7Hql5rXDb0HTdj4pOpp3pAiDH7zf9Aq+IUNl5c8ZKP9+d/d
	XoHfUoL56vSx3GLkeI+V5ADnrmL9RB4U83dpezuoSg=
Date: Sat, 3 Oct 2026 16:34:32 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Linus Walleij" <linusw@kernel.org>, "Orson Zhai" <orsonzhai@gmail.com>,
	"Baolin Wang" <baolin.wang@linux.alibaba.com>,
	"Chunyan Zhang" <zhang.lyra@gmail.com>,
	"Thierry Reding" <thierry.reding@kernel.org>,
	"Jonathan Hunter" <jonathanh@nvidia.com>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re:Re:Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map
 failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <7eaa18c1.6909.1a0ec33ffd4.Coremail.19888972804@163.com>
References: <20260924111856.622898-1-yaojiale02@163.com>
 <20260924111856.622898-3-yaojiale02@163.com>
 <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
 <7eaa18c1.6909.1a0ec33ffd4.Coremail.19888972804@163.com>
X-NTES-SC: AL_Qu2SA/yauUws5CafZOkdmE8Uges8WcC0svki1YJUc+4GhzHBwiABbHpeBEnt4NmlFwSNnAm9ShFy8/5qb6BZ9ZSUsK8BHdfKyMeQSduBQg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1ac76ed5.1123.1a100e69066.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:jygvCgDnZxYYvsBqM0MHAA--.9447W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xiAumrAvhiYhAAA3d
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0wOS0yOSAxNjowNzowNSwgImppYWxlIHlhbyIgPDE5ODg4OTcyODA0QDE2My5jb20+
IHdyb3RlOgo+SGkgR2VlcnQsCj4KPkF0IDIwMjYtMDktMjggMjE6MTk6NDgsICJHZWVydCBVeXR0
ZXJob2V2ZW4iIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4+SGkgSmlhbGUsCj4+Cj4+
T24gVGh1LCAyNCBTZXB0IDIwMjYgYXQgMTM6MTksIEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMu
Y29tPiB3cm90ZToKPj4+IHJ6bjFfZHRfbm9kZV90b19tYXBfb25lKCkgYXBwZW5kcyBtYXBwaW5n
cyBmb3IgZWFjaCBEVCBub2RlLiAgSWYgYQo+Pj4gbm9kZSBmYWlscyBhZnRlciBtYXAgc3RvcmFn
ZSBoYXMgYmVlbiByZXNlcnZlZCwgdGhlIHRvcC1sZXZlbCBjYWxsYmFjawo+Pj4gcmV0dXJucyB3
aXRob3V0IHJlbGVhc2luZyBtYXBwaW5ncyBidWlsdCBmb3IgdGhlIGN1cnJlbnQgYW5kIHByZXZp
b3VzCj4+PiBub2Rlcy4KPj4+Cj4+PiBGcmVlIHRoZSBhY2N1bXVsYXRlZCBtYXAgYW5kIGNsZWFy
IHRoZSBvdXRwdXQgcGFyYW1ldGVycyBvbiBldmVyeSBlcnJvcgo+Pj4gcGF0aC4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4KPj4KPj5UaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghCj4+Cj4+PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5j
dHJsLXJ6bjEuYwo+Pj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yem4x
LmMKPj4+IEBAIC00MTEsMTUgKzQxMSwyMSBAQCBzdGF0aWMgaW50IHJ6bjFfZHRfbm9kZV90b19t
YXAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAo+Pj4KPj4+ICAgICAgICAgcmV0ID0gcnpu
MV9kdF9ub2RlX3RvX21hcF9vbmUocGN0bGRldiwgbnAsIG1hcCwgbnVtX21hcHMpOwo+Pj4gICAg
ICAgICBpZiAocmV0IDwgMCkKPj4+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Pj4gKyAg
ICAgICAgICAgICAgIGdvdG8gZXJyX2ZyZWVfbWFwOwo+Pj4KPj4+ICAgICAgICAgZm9yX2VhY2hf
Y2hpbGRfb2Zfbm9kZV9zY29wZWQobnAsIGNoaWxkKSB7Cj4+PiAgICAgICAgICAgICAgICAgcmV0
ID0gcnpuMV9kdF9ub2RlX3RvX21hcF9vbmUocGN0bGRldiwgY2hpbGQsIG1hcCwgbnVtX21hcHMp
Owo+Pj4gICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKQo+Pj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX2Zy
ZWVfbWFwOwo+Pj4gICAgICAgICB9Cj4+Pgo+Pj4gICAgICAgICByZXR1cm4gMDsKPj4+ICsKPj4+
ICtlcnJfZnJlZV9tYXA6Cj4+PiArICAgICAgIHBpbmN0cmxfdXRpbHNfZnJlZV9tYXAocGN0bGRl
diwgKm1hcCwgKm51bV9tYXBzKTsKPj4KPj5OaWNlIGNhdGNoIQo+Pgo+Pj4gKyAgICAgICAqbWFw
ID0gTlVMTDsKPj4+ICsgICAgICAgKm51bV9tYXBzID0gMDsKPj4KPj5JcyB0aGUgcmVzZXR0aW5n
IGFjdHVhbGx5IG5lZWRlZD8KPj5Pbmx5IHBpbmN0cmwtZ2VuZXJpYy5jLCBwaW5jdHJsLXNwcmQu
YywgYW5kIHBpbmN0cmwtdGVncmEteHVzYi5jIHNlZW0KPj50byBkbyB0aGF0Cj4KPk5vLCB0aGUg
cmVzZXR0aW5nIGlzIG5vdCBuZWVkZWQsIGFzIHRoZSBjYWxsZXIgZG9lcyBub3QgaW5zcGVjdCB0
aGUKPm91dHB1dCBwYXJhbWV0ZXJzIHdoZW4gZHRfbm9kZV90b19tYXAoKSByZXR1cm5zIGFuIGVy
cm9yLgo+Cj5JJ2xsIGRyb3AgYm90aCBhc3NpZ25tZW50cyBhbmQgdXBkYXRlIHRoZSBjb21taXQg
bWVzc2FnZSBpbiB2Mi4KdjIgaW4sIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTAw
MzA4MzIwMC40NTk3MDUtMS15YW9qaWFsZTAyQDE2My5jb20KPgo+Lgo+Pgo+Pj4gKyAgICAgICBy
ZXR1cm4gcmV0Owo+Pj4gIH0KPj4+Cj4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jdHJsX29w
cyByem4xX3BjdHJsX29wcyA9IHsKPj4KPj5HcntvZXRqZSxlZXRpbmd9cywKPj4KPj4gICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAo+Pgo+Pgo+Pi0tCj4+R2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
Zwo+Pgo+PkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPj53aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwo+Cj5KaWFsZQo=

