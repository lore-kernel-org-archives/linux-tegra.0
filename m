From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] GPU-DRM-Tegra: Fine-tuning for tegra_output_probe()
Date: Tue, 24 Oct 2017 19:33:15 +0200
Message-ID: <bfac49e0-8948-e62f-1876-567605f1e2c8@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBUdWUsIDI0IE9jdCAyMDE3IDE5OjI5OjM5ICswMjAwCgpUd28gdXBkYXRlIHN1Z2dlc3Rpb25z
IHdlcmUgdGFrZW4gaW50byBhY2NvdW50CmZyb20gc3RhdGljIHNvdXJjZSBjb2RlIGFuYWx5c2lz
LgoKTWFya3VzIEVsZnJpbmcgKDIpOgogIFVzZSBjb21tb24gZXJyb3IgaGFuZGxpbmcgY29kZQog
IFVzZSBhbiBlcnJvciBjb2RlIGRpcmVjdGx5CgogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1
dC5jIHwgMTMgKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKCi0tIAoyLjE0LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
