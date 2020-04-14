From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 23:56:33 +0300
Message-ID: <1ed62d87-4194-6dca-e28c-ff99988b6697@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <5616bbe7-d185-1a6a-1fc5-e4ee5d2f65e6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <5616bbe7-d185-1a6a-1fc5-e4ee5d2f65e6@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MTQuMDQuMjAyMCAyMzo0NiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMDkuMDQuMjAy
MCAyMDo1MiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiAuLi4KPj4gK3N0YXRpYyB2b2lk
IHRlZ3JhMjEwX2NoYW5nZV9kbGxfc3JjKHN0cnVjdCB0ZWdyYTIxMF9lbWMgKmVtYywKPj4gKwkJ
CQkgICAgdTMyIGNsa3NyYykKPj4gK3sKPj4gKwl1MzIgZGxsX3NldHRpbmcgPSBlbWMtPm5leHQt
PmRsbF9jbGtfc3JjOwo+PiArCXUzMiBlbWNfY2xrX3NyYzsKPj4gKwl1MzIgZW1jX2Nsa19kaXY7
Cj4+ICsKPj4gKwllbWNfY2xrX3NyYyA9IChjbGtzcmMgJiBFTUNfQ0xLX0VNQ18yWF9DTEtfU1JD
X01BU0spID4+Cj4+ICsJCSAgICAgICBFTUNfQ0xLX0VNQ18yWF9DTEtfU1JDX1NISUZUOwo+PiAr
CWVtY19jbGtfZGl2ID0gKGNsa3NyYyAmIEVNQ19DTEtfRU1DXzJYX0NMS19ESVZJU09SX01BU0sp
ID4+Cj4+ICsJCSAgICAgICBFTUNfQ0xLX0VNQ18yWF9DTEtfRElWSVNPUl9TSElGVDsKPj4gKwo+
PiArCWRsbF9zZXR0aW5nICY9IH4oRExMX0NMS19FTUNfRExMX0NMS19TUkNfTUFTSyB8Cj4+ICsJ
CQkgRExMX0NMS19FTUNfRExMX0NMS19ESVZJU09SX01BU0spOwo+PiArCWRsbF9zZXR0aW5nIHw9
IGVtY19jbGtfc3JjIDw8IERMTF9DTEtfRU1DX0RMTF9DTEtfU1JDX1NISUZUOwo+PiArCWRsbF9z
ZXR0aW5nIHw9IGVtY19jbGtfZGl2IDw8IERMTF9DTEtfRU1DX0RMTF9DTEtfRElWSVNPUl9TSElG
VDsKPj4gKwo+PiArCWRsbF9zZXR0aW5nICY9IH5ETExfQ0xLX0VNQ19ETExfRERMTF9DTEtfU0VM
X01BU0s7Cj4+ICsJaWYgKGVtY19jbGtfc3JjID09IEVNQ19DTEtfU09VUkNFX1BMTE1CX0xKKQo+
PiArCQlkbGxfc2V0dGluZyB8PSAoUExMTV9WQ09CIDw8Cj4+ICsJCQkJRExMX0NMS19FTUNfRExM
X0RETExfQ0xLX1NFTF9TSElGVCk7Cj4+ICsJZWxzZSBpZiAoZW1jX2Nsa19zcmMgPT0gRU1DX0NM
S19TT1VSQ0VfUExMTV9MSikKPj4gKwkJZGxsX3NldHRpbmcgfD0gKFBMTE1fVkNPQSA8PAo+PiAr
CQkJCURMTF9DTEtfRU1DX0RMTF9ERExMX0NMS19TRUxfU0hJRlQpOwo+PiArCWVsc2UKPj4gKwkJ
ZGxsX3NldHRpbmcgfD0gKEVNQ19ETExfU1dJVENIX09VVCA8PAo+PiArCQkJCURMTF9DTEtfRU1D
X0RMTF9ERExMX0NMS19TRUxfU0hJRlQpOwo+PiArCj4+ICsJdGVncmEyMTBfY2xrX2VtY19kbGxf
dXBkYXRlX3NldHRpbmcoZGxsX3NldHRpbmcpOwo+PiArCj4+ICsJaWYgKGVtYy0+bmV4dC0+Y2xr
X291dF9lbmJfeF8wX2Nsa19lbmJfZW1jX2RsbCkKPj4gKwkJdGVncmEyMTBfY2xrX2VtY19kbGxf
ZW5hYmxlKHRydWUpOwo+PiArCWVsc2UKPj4gKwkJdGVncmEyMTBfY2xrX2VtY19kbGxfZW5hYmxl
KGZhbHNlKTsKPiAKPiBJc24ndCBzb21ldGhpbmcgbGlrZSBmZW5jZV91ZGVsYXkoMSkgbmVlZGVk
IGFmdGVyIHRvdWNoaW5nIGNsayByZWdpc3RlcnM/Cj4gCgpXb24ndCBiZSBiZXR0ZXIgdG8gbW92
ZSB0aGlzIHdob2xlIGZ1bmN0aW9uIGludG8gY2xrL3RlZ3JhPwoKSXQgZmVlbHMgYSBiaXQgZGly
dHkgdGhhdCBhIHJhdyBjbGsgcG9pbnRlciBpcyBwYXNzZWQgdG8gdGhlIEVNQyBjb2RlLgpJJ2Qg
ZmFjdG9yIGFsbCB0aGUgY2xrIGZ1bmN0aW9ucyBpbnRvIGNsay90ZWdyYSB0byBoYXZlIGEgY2xl
YW4Kc2VwYXJhdGlvbiBvZiB0aGUgY29kZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
