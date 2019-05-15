From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V3 3/8] clk: tegra: Export functions for EMC clock scaling
Date: Wed, 15 May 2019 15:25:49 +0800
Message-ID: <ec33f656-707c-df2c-dc53-206c9a533cb9@nvidia.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-4-josephl@nvidia.com>
 <502f213b-2101-9d56-54c9-8be48f1be5b8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <502f213b-2101-9d56-54c9-8be48f1be5b8@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

T24gNS8xNS8xOSAxMjoyOSBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDEwLjA1LjIwMTkg
MTE6NDcsIEpvc2VwaCBMbyDQv9C40YjQtdGCOgo+PiBFeHBvcnQgZnVuY3Rpb25zIHRvIGFsbG93
IGFjY2Vzc2luZyB0aGUgQ0FSIHJlZ2lzdGVyIHJlcXVpcmVkIGJ5IEVNQwo+PiBjbG9jayBzY2Fs
aW5nLiBUaGVzZSBmdW5jdGlvbnMgd2lsbCBiZSB1c2VkIHRvIGFjY2VzcyB0aGUgQ0FSIHJlZ2lz
dGVyCj4+IGFzIHBhcnQgb2YgdGhlIHNjYWxpbmcgc2VxdWVuY2UuCj4gCj4+IERLSU0tU2lnbmF0
dXJlOiB2PTE7IGE9cnNhLXNoYTI1NjsgYz1yZWxheGVkL3JlbGF4ZWQ7IGQ9bnZpZGlhLmNvbTsg
cz1uMTsKPj4gCXQVNTc0NzgwMTg7IGJoPWVtZDNSNm5TRndMNUIrYVdBMlcrYkpxY1oxSmh2d25h
eXoxd0dPUFNBNE09Owo+PiAJaD1YLVBHUC1Vbml2ZXJzYWw6RnJvbTpUbzpDQzpTdWJqZWN0OkRh
dGU6TWVzc2FnZS1JRDpYLU1haWxlcjoKPj4gCSBJbi1SZXBseS1UbzpSZWZlcmVuY2VzOk1JTUUt
VmVyc2lvbjpYLU5WQ29uZmlkZW50aWFsaXR5Ogo+PiAJIENvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6Q29udGVudC1UeXBlOwo+PiAJYj1mVzdkZHg2cDZCdUdOTEdBNmpBTDVBeHNvanFlUWNPZzlm
WkJxYkExWmU0NVhVM2d0N3RpTDg4czhnN2dUZnRBKwo+PiAJIE5kcnVLUlhQTFMwcjRpT2dLcUVV
ZjNibW9CUDBLZitsMFBRY0p1NTVVNXY1NVhuUDZjdUtyUXcyY21iRGF3L2cyWgo+PiAJIGE2RFpy
QUliVVp6aTNQM2I3NjRaRG1VbFJEMXNIQVdXc3dad0cza0h3QlAwVERPWE5qQUVWY3A3TlBtODY4
Vk92dgo+PiAJIGFKcmRiNlZibGtud2pOa0U2T1Y3a3RHQjFPRGdlNVlTQWVQRExOQXBsWkJ3K0JG
bm9ndEVTd3ZmMGNGY1lWYnhDRwo+PiAJIENPaC9VTktkbEp1T005NUlnYlppb205SThOaXd1UzA3
YkEyV3p1ZFNnbk1LYmhOSTZWbEZnRHU1QTZKYVB0M0lydgo+PiAJIE40bnVVVDQrTG4zRmc9Cj4+
Cj4gCj4gV2hhdCdzIHRoYXQ/Cj4gClNvcnJ5LCBJIGRvbid0IGtub3cgaG93IGRvZXMgdGhhdCBj
b21lIGZyb20uIEkgZGlkbid0IHNlZSB0aGF0IGluIG15IAptYWlsIGNsaWVudCB3aGVuIHJlY2Vp
dmluZyB0aGlzIHBhdGNoLgoKSSBkaWQgbm90aWNlIHRoaXMgcGF0Y2ggd2FzIG1pc3NpbmcgaW4g
dGhlIFRlZ3JhIFBhdGNod29yaywgYnV0IGl0J3MgCm9rYXkgaW4gdGhlIExpbnV4IEFSTSBLZXJu
ZWwgcGF0Y2h3b3JrLgpodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC10
ZWdyYS9saXN0Lz9zZXJpZXM9MTA3MTQyCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJv
amVjdC9saW51eC1hcm0ta2VybmVsL2xpc3QvP3Nlcmllcz0xMTYwOTcKClNvIEkgZ3Vlc3MgbWF5
YmUgc29tZXRoaW5nIHdyb25nIHdoZW4gdGhlIHNlcnZlciBoYW5kbGluZyB0aGlzIHBhdGNoLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtl
cm5lbAo=
