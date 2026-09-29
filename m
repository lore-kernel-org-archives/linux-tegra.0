Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77135DA65;
	Tue, 29 Sep 2026 08:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669258; cv=none; b=AEX8sIaCf62yZ5/3xWC16NbzBiOEwyYf5F0I0oLv4EqM2nDYwuZfTe8M7qZ6dSH5UM9GhvLvM/NGiSNyKvJl2ZYmRTPBa+b0maUFBCrB1+hbg8awb6KQJDIot8wJjrmd3L5dYiXMoc8rYWy1raayzo8D5TpLmItRnpVZiJ7bJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669258; c=relaxed/simple;
	bh=W7pWGyIFWfSRwTenFC+kxlF6f7RHYKGnoGxGmhPpFhk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=L+kHtrIXV98KflW0LJjba7g5WK4Lp/9h5lNm90vXwgIlnhTJhymxTIpoApDEEJeiHe8RyLgJh/jKv2aolCedu26MxyjQpjVp6iK0OQ2FYcF0MyH3ra5+/DNWXqCThzIJL1JFm8cGFF2M2a5zdnPcxMbLyprZGwrcPZktqLhNito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=F6lSj/eM; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="F6lSj/eM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=W7pWGyIFWfSRwTenFC+kxlF6f7RHYKGnoGxGmhPpFhk=; b=F
	6lSj/eMzw835BoVC3Q6FH1CfuYqHlNX9eo2OadyqJymccQwECyxlu+VE0cNgo3ej
	X0Yklf+p6bHiljUM04tWmDeAbJcNRWIThzgSetGR5uabGIBgDKE5kGN7hyk5YPRf
	q9+W8xE2/j0DOwh8XJo4x7Wu8i79xU6WiVWFe6MwB0=
Date: Tue, 29 Sep 2026 16:07:05 +0800 (CST)
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
Subject: Re:Re: [PATCH 2/4] pinctrl: renesas: rzn1: free maps on DT map
 failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
References: <20260924111856.622898-1-yaojiale02@163.com>
 <20260924111856.622898-3-yaojiale02@163.com>
 <CAMuHMdUaPuhy==YAKxUsBTCddCu9pEixPckkYYgoy=LXprnYog@mail.gmail.com>
X-NTES-SC: AL_Qu2SAvqdtkop4ymbZukcn08ShO49XMOyvfoi2YFTc8MFoxLcyAchcG9YH1nL69uIMwuytx2UahhMyPlwXJZ5wsxbVvgI55oxk3OffQq9dw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7eaa18c1.6909.1a0ec33ffd4.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:higvCgD3n2aqcbtq78JQAA--.53787W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQoQSmq7caoFZgAA30
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgR2VlcnQsCgpBdCAyMDI2LTA5LTI4IDIxOjE5OjQ4LCAiR2VlcnQgVXl0dGVyaG9ldmVuIiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+SGkgSmlhbGUsCj4KPk9uIFRodSwgMjQgU2Vw
dCAyMDI2IGF0IDEzOjE5LCBKaWFsZSBZYW8gPHlhb2ppYWxlMDJAMTYzLmNvbT4gd3JvdGU6Cj4+
IHJ6bjFfZHRfbm9kZV90b19tYXBfb25lKCkgYXBwZW5kcyBtYXBwaW5ncyBmb3IgZWFjaCBEVCBu
b2RlLiAgSWYgYQo+PiBub2RlIGZhaWxzIGFmdGVyIG1hcCBzdG9yYWdlIGhhcyBiZWVuIHJlc2Vy
dmVkLCB0aGUgdG9wLWxldmVsIGNhbGxiYWNrCj4+IHJldHVybnMgd2l0aG91dCByZWxlYXNpbmcg
bWFwcGluZ3MgYnVpbHQgZm9yIHRoZSBjdXJyZW50IGFuZCBwcmV2aW91cwo+PiBub2Rlcy4KPj4K
Pj4gRnJlZSB0aGUgYWNjdW11bGF0ZWQgbWFwIGFuZCBjbGVhciB0aGUgb3V0cHV0IHBhcmFtZXRl
cnMgb24gZXZlcnkgZXJyb3IKPj4gcGF0aC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmlhbGUgWWFv
IDx5YW9qaWFsZTAyQDE2My5jb20+Cj4KPlRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPgo+PiAtLS0g
YS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6bjEuYwo+PiArKysgYi9kcml2ZXJz
L3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6bjEuYwo+PiBAQCAtNDExLDE1ICs0MTEsMjEgQEAg
c3RhdGljIGludCByem4xX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRl
diwKPj4KPj4gICAgICAgICByZXQgPSByem4xX2R0X25vZGVfdG9fbWFwX29uZShwY3RsZGV2LCBu
cCwgbWFwLCBudW1fbWFwcyk7Cj4+ICAgICAgICAgaWYgKHJldCA8IDApCj4+IC0gICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+PiArICAgICAgICAgICAgICAgZ290byBlcnJfZnJlZV9tYXA7Cj4+
Cj4+ICAgICAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQobnAsIGNoaWxkKSB7Cj4+
ICAgICAgICAgICAgICAgICByZXQgPSByem4xX2R0X25vZGVfdG9fbWFwX29uZShwY3RsZGV2LCBj
aGlsZCwgbWFwLCBudW1fbWFwcyk7Cj4+ICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBlcnJfZnJlZV9tYXA7Cj4+ICAgICAgICAgfQo+Pgo+PiAgICAgICAgIHJldHVy
biAwOwo+PiArCj4+ICtlcnJfZnJlZV9tYXA6Cj4+ICsgICAgICAgcGluY3RybF91dGlsc19mcmVl
X21hcChwY3RsZGV2LCAqbWFwLCAqbnVtX21hcHMpOwo+Cj5OaWNlIGNhdGNoIQo+Cj4+ICsgICAg
ICAgKm1hcCA9IE5VTEw7Cj4+ICsgICAgICAgKm51bV9tYXBzID0gMDsKPgo+SXMgdGhlIHJlc2V0
dGluZyBhY3R1YWxseSBuZWVkZWQ/Cj5Pbmx5IHBpbmN0cmwtZ2VuZXJpYy5jLCBwaW5jdHJsLXNw
cmQuYywgYW5kIHBpbmN0cmwtdGVncmEteHVzYi5jIHNlZW0KPnRvIGRvIHRoYXQKCk5vLCB0aGUg
cmVzZXR0aW5nIGlzIG5vdCBuZWVkZWQsIGFzIHRoZSBjYWxsZXIgZG9lcyBub3QgaW5zcGVjdCB0
aGUKb3V0cHV0IHBhcmFtZXRlcnMgd2hlbiBkdF9ub2RlX3RvX21hcCgpIHJldHVybnMgYW4gZXJy
b3IuCgpJJ2xsIGRyb3AgYm90aCBhc3NpZ25tZW50cyBhbmQgdXBkYXRlIHRoZSBjb21taXQgbWVz
c2FnZSBpbiB2Mi4KCi4KPgo+PiArICAgICAgIHJldHVybiByZXQ7Cj4+ICB9Cj4+Cj4+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfb3BzIHJ6bjFfcGN0cmxfb3BzID0gewo+Cj5HcntvZXRq
ZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPgo+Cj4tLQo+R2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwo+Cj5JbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj53aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpKaWFsZQo=
