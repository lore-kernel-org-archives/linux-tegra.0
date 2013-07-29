From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v6 4/5] clk: add CLK_SET_RATE_NO_REPARENT flag
Date: Mon, 29 Jul 2013 08:50:16 -0700
Message-ID: <36053e73-faf4-47c6-9ff5-3e451361ef75@CH1EHSMHS012.ehs.local>
References: <1375097102-28892-1-git-send-email-james.hogan@imgtec.com>
 <1375097102-28892-5-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1375097102-28892-5-git-send-email-james.hogan@imgtec.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: James Hogan <james.hogan@imgtec.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chao Xie <xiechao.mail@gmail.com>, Thomas Abraham <thomas.abraham@linaro.org>, Paul Walmsley <pwalmsley@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, spear-devel@list.st.com, linux-samsung-soc@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infrad
List-Id: linux-tegra@vger.kernel.org

T24gTW9uLCBKdWwgMjksIDIwMTMgYXQgMTI6MjU6MDFQTSArMDEwMCwgSmFtZXMgSG9nYW4gd3Jv
dGU6Cj4gQWRkIGEgQ0xLX1NFVF9SQVRFX05PX1JFUEFSRU5UIGNsb2NrIGZsYWcsIHdoaWNoIHdp
bGwgcHJldmVudCBtdXhlcwo+IGJlaW5nIHJlcGFyZW50ZWQgZHVyaW5nIGNsa19zZXRfcmF0ZS4K
PiAKPiBUbyBhdm9pZCBicmVha2luZyBleGlzdGluZyBwbGF0Zm9ybXMsIGFsbCBjYWxsZXJzIG9m
IGNsa19yZWdpc3Rlcl9tdXgoKQo+IGFyZSBhZGp1c3RlZCB0byBwYXNzIHRoZSBuZXcgZmxhZy4g
UGxhdGZvcm0gbWFpbnRhaW5lcnMgYXJlIGVuY291cmFnZWQKPiB0byByZW1vdmUgdGhlIGZsYWcg
aWYgdGhleSB3aXNoIHRvIGFsbG93IG11eCByZXBhcmVudGluZyBvbiBzZXRfcmF0ZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBIb2dhbiA8amFtZXMuaG9nYW5AaW1ndGVjLmNvbT4KPiBSZXZp
ZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogTWlrZSBU
dXJxdWV0dGUgPG10dXJxdWV0dGVAbGluYXJvLm9yZz4KPiBDYzogUnVzc2VsbCBLaW5nIDxsaW51
eEBhcm0ubGludXgub3JnLnVrPgo+IENjOiBTYXNjaGEgSGF1ZXIgPGtlcm5lbEBwZW5ndXRyb25p
eC5kZT4KPiBDYzogU3RlcGhlbiBXYXJyZW4gPHN3YXJyZW5Ad3d3ZG90b3JnLm9yZz4KPiBDYzog
VmlyZXNoIEt1bWFyIDx2aXJlc2gubGludXhAZ21haWwuY29tPgo+IENjOiBLdWtqaW4gS2ltIDxr
Z2VuZS5raW1Ac2Ftc3VuZy5jb20+Cj4gQ2M6IEhhb2ppYW4gWmh1YW5nIDxoYW9qaWFuLnpodWFu
Z0BsaW5hcm8ub3JnPgo+IENjOiBDaGFvIFhpZSA8eGllY2hhby5tYWlsQGdtYWlsLmNvbT4KPiBD
YzogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiBDYzogIkVtaWxpbyBMw7NwZXoiIDxl
bWlsaW9AZWxvcGV6LmNvbS5hcj4KPiBDYzogR3JlZ29yeSBDTEVNRU5UIDxncmVnb3J5LmNsZW1l
bnRAZnJlZS1lbGVjdHJvbnMuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGZyZWUtZWxlY3Ryb25zLmNvbT4KPiBDYzogUHJhc2hhbnQgR2Fpa3dhZCA8cGdhaWt3YWRAbnZp
ZGlhLmNvbT4KPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4K
PiBDYzogUGV0ZXIgRGUgU2NocmlqdmVyIDxwZGVzY2hyaWp2ZXJAbnZpZGlhLmNvbT4KPiBDYzog
UGF3ZWwgTW9sbCA8cGF3ZWwubW9sbEBhcm0uY29tPgo+IENjOiBDYXRhbGluIE1hcmluYXMgPGNh
dGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IENjOiBBbmRyZXcgQ2hldyA8YWNoZXdAbnZpZGlhLmNv
bT4KPiBDYzogRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IENjOiBIZWlr
byBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+IENjOiBQYXVsIFdhbG1zbGV5IDxwd2FsbXNs
ZXlAbnZpZGlhLmNvbT4KPiBDYzogU29yZW4gQnJpbmttYW5uIDxzb3Jlbi5icmlua21hbm5AeGls
aW54LmNvbT4KPiBDYzogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29t
Pgo+IENjOiBUaG9tYXMgQWJyYWhhbSA8dGhvbWFzLmFicmFoYW1AbGluYXJvLm9yZz4KPiBDYzog
VG9tYXN6IEZpZ2EgPHQuZmlnYUBzYW1zdW5nLmNvbT4KPiBDYzogbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBzcGVhci1kZXZlbEBsaXN0LnN0LmNvbQo+IENjOiBsaW51eC10ZWdyYUB2Z2VyLmtl
cm5lbC5vcmcKPiBUZXN0ZWQtYnk6IEhhb2ppYW4gWmh1YW5nIDxoYW9qaWFuLnpodWFuZ0BnbWFp
bC5jb20+Cj4gQWNrZWQtYnk6IFN0ZXBoZW4gV2FycmVuIDxzd2FycmVuQG52aWRpYS5jb20+IFt0
ZWdyYV0KPiBBY2tlZC1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBmcmVlLWVsZWN0
cm9ucy5jb20+IFtzdW54aV0KQUNLIGZvciBaeW5xLgoKSSdsbCBoYXZlIHRvIGxvb2sgYXQgdGhl
IGRldGFpbHMgYW5kIGRvIHNvbWUgdGVzdGluZyB0byBzZWUgd2hldGhlciB3ZQpjYW4gcmVtb3Zl
IHRoZSBmbGFnIGxhdGVyLgoKCVPDtnJlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
