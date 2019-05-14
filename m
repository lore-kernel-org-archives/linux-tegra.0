From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V3 3/8] clk: tegra: Export functions for EMC clock scaling
Date: Tue, 14 May 2019 19:29:34 +0300
Message-ID: <502f213b-2101-9d56-54c9-8be48f1be5b8@gmail.com>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-4-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190510084719.18902-4-josephl@nvidia.com>
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
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

MTAuMDUuMjAxOSAxMTo0NywgSm9zZXBoIExvINC/0LjRiNC10YI6Cj4gRXhwb3J0IGZ1bmN0aW9u
cyB0byBhbGxvdyBhY2Nlc3NpbmcgdGhlIENBUiByZWdpc3RlciByZXF1aXJlZCBieSBFTUMKPiBj
bG9jayBzY2FsaW5nLiBUaGVzZSBmdW5jdGlvbnMgd2lsbCBiZSB1c2VkIHRvIGFjY2VzcyB0aGUg
Q0FSIHJlZ2lzdGVyCj4gYXMgcGFydCBvZiB0aGUgc2NhbGluZyBzZXF1ZW5jZS4KCj4gREtJTS1T
aWduYXR1cmU6IHY9MTsgYT1yc2Etc2hhMjU2OyBjPXJlbGF4ZWQvcmVsYXhlZDsgZD1udmlkaWEu
Y29tOyBzPW4xOwo+IAl0FTU3NDc4MDE4OyBiaD1lbWQzUjZuU0Z3TDVCK2FXQTJXK2JKcWNaMUpo
dnduYXl6MXdHT1BTQTRNPTsKPiAJaD1YLVBHUC1Vbml2ZXJzYWw6RnJvbTpUbzpDQzpTdWJqZWN0
OkRhdGU6TWVzc2FnZS1JRDpYLU1haWxlcjoKPiAJIEluLVJlcGx5LVRvOlJlZmVyZW5jZXM6TUlN
RS1WZXJzaW9uOlgtTlZDb25maWRlbnRpYWxpdHk6Cj4gCSBDb250ZW50LVRyYW5zZmVyLUVuY29k
aW5nOkNvbnRlbnQtVHlwZTsKPiAJYj1mVzdkZHg2cDZCdUdOTEdBNmpBTDVBeHNvanFlUWNPZzlm
WkJxYkExWmU0NVhVM2d0N3RpTDg4czhnN2dUZnRBKwo+IAkgTmRydUtSWFBMUzByNGlPZ0txRVVm
M2Jtb0JQMEtmK2wwUFFjSnU1NVU1djU1WG5QNmN1S3JRdzJjbWJEYXcvZzJaCj4gCSBhNkRackFJ
YlVaemkzUDNiNzY0WkRtVWxSRDFzSEFXV3N3WndHM2tId0JQMFRET1hOakFFVmNwN05QbTg2OFZP
dnYKPiAJIGFKcmRiNlZibGtud2pOa0U2T1Y3a3RHQjFPRGdlNVlTQWVQRExOQXBsWkJ3K0JGbm9n
dEVTd3ZmMGNGY1lWYnhDRwo+IAkgQ09oL1VOS2RsSnVPTTk1SWdiWmlvbTlJOE5pd3VTMDdiQTJX
enVkU2duTUtiaE5JNlZsRmdEdTVBNkphUHQzSXJ2Cj4gCSBONG51VVQ0K0xuM0ZnPQo+IAoKV2hh
dCdzIHRoYXQ/CgotLSAKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
